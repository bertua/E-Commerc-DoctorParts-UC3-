<?php
include '../classes/endereco.class.php';

function cors() {
    if (isset($_SERVER['HTTP_ORIGIN'])) {
        header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Max-Age: 86400');
    }

    if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
            header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
        
        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
            header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
        exit(0);
    }
}
cors();

$resposta = [
    'status' => 'error',
    'message' => 'Método não permitido.'
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $endereco = new Endereco();

    // Pega os valores do POST e seta na classe
    $endereco->setIdEndereco($_POST['id_endereco']);
    $endereco->setIdUsuario($_POST['id_usuario']);
    $endereco->setCep($_POST['cep']);
    $endereco->setNumero($_POST['numero']);
    $endereco->setRua($_POST['rua']);
    $endereco->setBairro($_POST['bairro']);
    $endereco->setCidade($_POST['cidade']);
    $endereco->setEstado($_POST['estado']);
    $endereco->setComplemento($_POST['complemento']);

    if ($endereco->editarEndereco()) {
        $resposta['status'] = 'ok';
        $resposta['message'] = 'Endereço atualizado com sucesso!';
    } else {
        $resposta['message'] = 'Erro ao atualizar o endereço.';
    }
}

header('Content-Type: application/json');
echo json_encode($resposta);
