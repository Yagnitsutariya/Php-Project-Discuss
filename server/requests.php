<?php
session_start();
include("../common/db.php");

if (isset($_POST['signup'])) {
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $address = trim($_POST['address']);

    if (empty($username) || empty($email) || empty($password) || empty($address)) {
        die('All fields are required.');
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die('Invalid email format.');
    }

    if (strlen($password) < 6) {
        die('Password must be at least 6 characters.');
    }

    $user = $conn->prepare("Insert into `user`
    (`id`,`username`,`email`,`password`,`address`)
    values(NULL,'$username','$email','$password','$address');
    ");

    $result = $user->execute();
    $user->insert_id;
    if ($result) {
        $_SESSION["user"] = ["username" => $username, "email" => $email, "user_id" => $user->insert_id];

        header("location:/wpproject");

    } else {
        echo " New user not registred";
    }
} else if (isset($_POST['login'])) {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    if (empty($email) || empty($password)) {
        die('Email and password are required.');
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die('Invalid email format.');
    }

    $query = "SELECT * FROM user WHERE email = ? AND password = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $_SESSION["user"] = [
            "username" => $row['username'],
            "email" => $row['email'],
            "user_id" => $row['id']
        ];
        header("location:/wpproject");
    } else {
        echo "Invalid email or password.";
    }
} else if (isset($_GET['logout'])) {
    session_unset();
    header("location: /wpproject");


} else if (isset($_POST["ask"])) {
    $title = $_POST['title'];
    $description = $_POST['description'];
    $category_id = $_POST['category'];
    $user_id = $_SESSION['user']['user_id'];

    $question = $conn->prepare("Insert into `questions`
(`id`,`title`,`description`,`category_id`,`user_id`)
values(NULL,'$title','$description','$category_id','$user_id');
");

    $result = $question->execute();
    $question->insert_id;
    if ($result) {
        header("location: /wpproject");
    } else {
        echo "Question is added to website";
    }
} else if (isset($_POST["answer"])) {
    $answer = $_POST['answer'];
    $question_id = $_POST['question_id'];
    $user_id = $_SESSION['user']['user_id'];

    $query = $conn->prepare("Insert into `answers`
(`id`,`answer`,`question_id`,`user_id`)
values(NULL,'$answer','$question_id','$user_id');
");

    $result = $query->execute();
    if ($result) {
        header("location: /wpproject?q-id=$question_id");
    } else {
        echo "Answer is not submitted";
    }

} else if (isset($_GET["delete"])) {
    echo $qid = $_GET["delete"];
    $query = $conn->prepare("delete from questions where id =$qid");
    $result = $query->execute();
    if ($result) {
        header("location:/wpproject");
    } else {
        echo "Question not deleted";
    }
}
?>