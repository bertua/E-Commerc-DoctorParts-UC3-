<?php
session_start();
include '../classes/endereco.class.php';

header('Content-Type: application/json');

// Verifica se o usuário está logado
if (!isset($_SESSION['usuario_id'])) {
    echo json_encode(['status' => 'erro', 'message' => 'Usuário não autenticado']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id_endereco'])) {
    $id_endereco = $_POST['id_endereco'];

    $endereco = new Endereco();
    $sucesso = $endereco->deletarEndereco($id_endereco);

    if ($sucesso) {
        echo json_encode(['status' => 'ok', 'message' => 'Endereço excluído com sucesso!']);
    } else {
        echo json_encode(['status' => 'erro', 'message' => 'Falha ao excluir o endereço.']);
    }
} else {
    echo json_encode(['status' => 'erro', 'message' => 'Requisição inválida.']);
}
?>
