<?php

class Message
{
    public $id;
    public $name;
    public $email;
    public $subject;
    public $text;

    function __construct($name =null, $email =null, $subject =null, $text =null)
    {
        $this->name = $name;
        $this->email = $email;
        $this->subject = $subject;
        $this->text = $text;
        $this->insert();
    }

    public function insert()
    {
        // CONFIGURER PDO
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

        $query = $pdo->prepare('INSERT INTO messages (name ,email , subject, text) VALUES (?, ?, ?, ?);');
        $query->execute([
            $this->name,
            $this->email,
            $this->subject,
            $this->text
        ]);
    }
}