// Scipt do index
    let index = 0;
    const slides = document.getElementById('slides');
    const totalSlides = slides.children.length;
    const slidesVisiveis = 4;
    const slideLargura =     function atualizarSlide() {
        const deslocamento = index * slideLargura;
        slides.style.transform = `translateX(-${deslocamento}px)`;
    }   
     function avancar() {
        if (index < totalSlides - slidesVisiveis) {
        index++;
        atualizarSlide();
        }
     }
     function voltar() {
        if (index > 0) {
        index--;
        atualizarSlide();
        }
    }
     // Exemplo de ação ao clicar no botão "Adicionar ao carrinho"
    document.querySelectorAll('.botao-carrinho').forEach(botao => {
        botao.addEventListener('click', () => {
        alert('Produto adicionado ao carrinho!');
        });
    });


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
