
// Script para o cadastro (Popup)
document.addEventListener("DOMContentLoaded", function () {
    const botaoCadastro = document.getElementById("btnCadastrar");
    const popup = document.getElementById("popupCadastro");
    const fechar = document.getElementById("fecharPopup");

    botaoCadastro.addEventListener("click", function (e) {
        e.preventDefault();
        popup.style.display = "flex";
    });

    fechar.addEventListener("click", function () {
        popup.style.display = "none";
    });

    window.addEventListener("click", function (e) {
        if (e.target === popup) {
            popup.style.display = "none";
        }
    });
});
