<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    include 'cadastro.class.php';
   
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $cadastro = new Cadastro();
        $cadastro->setNome($_POST['nome']);
        $cadastro->setEmail($_POST['email']);
        $cadastro->setContato($_POST['contato']);
        $cadastro->setSenha($_POST['senha']);

        if ($cadastro->cadastrarUsuario()) {
            echo "<p>Usuário cadastrado com sucesso!</p>";
        } else {
            echo "<p>Erro ao cadastrar usuário.</p>";
        }
    }
    ?>

    <h1>Cadastro efetuado com sucesso!</h1>
</body>
</html>
