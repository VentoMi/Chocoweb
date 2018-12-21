<?php
class Contact
{
    
    function __construct()
    {
        if($this->isPost()) {
            // On est en mode "POST", on doit donc exécuter le traitement du formualaire
            $this->handlePost($_POST);
        }
    }
    public function isPost()
    {
        return ($_SERVER['REQUEST_METHOD'] === 'POST');
    }
    public function handlePost($data)
    {
        // valider les données
        $errors = [];
        //strlen = string length ( raccourcis le string )
        //=== 0 = pas de réponse donc
        if(strlen($data['name']) === 0) {
            $errors['name'] = 'Veuillez indiquer votre nom.';
        }
        if(strlen($data['email']) === 0) {
            $errors['email'] = 'Veuillez indiquer votre adresse email.';
        }
        elseif(!filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
            $errors['email'] = 'L\'adresse email n\'est pas valide.';
        }
        if(strlen($data['subject']) === 0) {
            $errors['subject'] = 'Veuillez indiquer un sujet.';
        }
        if(strlen($data['message']) === 0) {
            $errors['message'] = 'Veuillez indiquer un message.';
        }
        if(!$errors) {
            // traiter les données ("sanitize" (assainir) les données)
            $name = htmlspecialchars(trim($data['name']));
            $email = htmlspecialchars(trim($data['email']));
            $subject = htmlspecialchars(trim($data['subject']));
            $text = nl2br(htmlspecialchars(trim($data['message'])));
            //pour pas qu'on hack le site ou via le prepare de la requete (les 2 sont nécessaire)
            require_once('./models/Message.php');
            $message = new Message ($name, $email, $subject, $text);
            // stocker les données dans la base de données (table `messages`)    
        }        
    }
}