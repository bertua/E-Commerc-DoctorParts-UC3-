
<?php

    $mostrarPopup = true;
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Modal com HTML/CSS</title>
    <script src="script.js" defer></script>
</head>
<body>

<h1>Página com Modal</h1>

<div id="meuModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="document.getElementById('meuModal').style.display='none'">&times;</span>
        <p>Este é um modal gerado com PHP, HTML e JS!</p>
    </div>
</div>

<?php if ($mostrarPopup): ?>
<script>
    window.onload = function() {
        document.getElementById('meuModal').style.display = 'block';
    };
</script>
<?php endif; ?>

</body>
</html>
