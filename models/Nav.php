<?php

class ChocoNav
{
  public $id;
  public $src;
  public $alt;
  public $price;
  public $name;
  public $ingredients;

  function __construct($id = null, $locale = null)
  {

    $result = $this->queryNav($id,$locale);
    $this->id = $result['id'];
    $this->src = $result['img_src'];
    $this->alt = $result['img_alt'];
    $this->price = $result['price'];
    $this->name = $result['name'];
    $this->ingredients = $this->queryIngredient($id,$locale);
  }

  public function queryNav($id, $locale)
  {
    $host = '127.0.0.1';
    $db   = 'sgc-chocoweb';
    $user = 'root';
    $pass = '';
    $charset = 'utf8mb4';
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];
    try {
         $pdo = new PDO($dsn, $user, $pass, $options);
    } catch (\PDOException $e) {
         throw new \PDOException($e->getMessage(), (int)$e->getCode());
    }
    $query = $pdo->prepare('SELECT ch.id, ch.img_src, ch.price, cht.img_alt, cht.name FROM nos_chocolats ch JOIN nos_chocolats_translations cht ON cht.chocolat_id = ch.id AND cht.locale = :locale WHERE ch.id = :id ;');
    $arr = [":id"=>$id, ":locale"=>$locale];
    $query->execute($arr);
    return $query->fetch();
  }
  public function queryIngredient($id,$locale)
  {

    $host = '127.0.0.1';
    $db   = 'sgc-chocoweb';
    $user = 'root';
    $pass = '';
    $charset = 'utf8mb4';
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];
    try {
         $pdo = new PDO($dsn, $user, $pass, $options);
    } catch (\PDOException $e) {
         throw new \PDOException($e->getMessage(), (int)$e->getCode());
    }
    $query = $pdo->prepare('SELECT i.id, it.name
                          FROM ingredients i
                          JOIN ingredients_translations it ON it.ingredient_id = i.id AND it.locale = :locale
                          WHERE i.id = :id ;');
    $query->execute($arr);
    return $query->fetchAll();
  }
}
