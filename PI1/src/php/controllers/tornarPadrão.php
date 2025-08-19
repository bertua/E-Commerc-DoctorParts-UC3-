<?php
session_start();
include '../classes/endereco.class.php';

if (!isset($_SESSION['usuario_id']) || !isset($_POST['id_endereco'])) {
    echo json_encode(['status' => 'erro', 'message' => 'Requisição inválida.']);
    exit;
}

$id_usuario = $_SESSION['usuario_id'];
$id_endereco = $_POST['id_endereco'];

$endereco = new Endereco();
if ($endereco->tornarPadrao($id_usuario, $id_endereco)) {
    echo json_encode(['status' => 'ok', 'message' => 'Endereço definido como padrão.']);
} else {
    echo json_encode(['status' => 'erro', 'message' => 'Erro ao atualizar endereço padrão.']);
}