<?php

class Menu
{

  public $menu;

  function __construct()
  {
    $this->menu = $this->getMenu();
  }

  public function getMenu(){
    require('models/Nav.php');
    $menu1 = new Nav(1, 'fr');
    $menu2 = new Nav(2, 'fr');
    $menu3 = new Nav(3, 'fr');
    $menu4 = new Nav(4, 'fr');
    $menu5 = new Nav(5, 'fr');
    $menu6 = new Nav(6, 'fr');

    return [$menu1,$menu2,$menu3,$menu4,$menu5,$menu6];
  }
}
