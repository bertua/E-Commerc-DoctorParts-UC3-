<?php
session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['usuario_id']) || !isset($_SESSION['usuario_nome'])) {
    // Redireciona para a tela principal se não estiver logado
    header('Location: index.php');
    exit;
}

$usuarioId = $_SESSION['usuario_id'];
$usuarioNome = $_SESSION['usuario_nome'];
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Seus Dados</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

    <div class="dados-container">
        <h1>Seus Dados</h1>

        <p><strong>ID do Usuário:</strong> <?= $usuarioId ?></p>
        <p><strong>Nome:</strong> <?= htmlspecialchars($usuarioNome) ?></p>

        <a class="btn-voltar" href="index.php">← Voltar para a Home</a>
    </div>

</body>
</html>
