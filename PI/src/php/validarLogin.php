<?php
include 'phpClass/cadastroUsuario.class.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['emailLogin'] ?? '';
    $senha = $_POST['senhaLogin'] ?? '';


    if (!$email || !$senha) {
        header('Location: ../index.php?erro=1');
        // echo json_encode(['status'=>'error', 'message'=>'Email e senha obrigatórios']);
        exit;
    }

    $cadastro = new Cadastro();
    $usuario = $cadastro->listarUsuarios($email, $senha);

    if ($usuario) {
        session_start();
        $_SESSION['usuario_id'] = $usuario['id_usuario'];
        $_SESSION['usuario_nome'] = $usuario['nome'];
        // echo json_encode(['status'=>'ok', 'message'=>'Login efetuado com sucesso']);
        header('Location: ../html/index.php');
        exit;
    } else {
        echo json_encode(['status'=>'error', 'message'=>'Usuário ou senha incorretos']);
    }
}
