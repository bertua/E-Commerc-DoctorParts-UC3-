<?php
session_start();
include '../classes/endereco.class.php';

if (!isset($_SESSION['usuario_id']) || !isset($_GET['id'])) {
    header('Location: ../views/dadosUsuario.php');
    exit;
}

$id_usuario = $_SESSION['usuario_id'];
$id_endereco = $_GET['id'];

$endereco = new Endereco();
if ($endereco->tornarPadrao($id_usuario, $id_endereco)) {
    header('Location: ../views/dadosUsuario.php'); // Atualiza lista
} else {
    echo "Erro ao atualizar o endereço padrão.";
}
