// Script do index
    let index = 0;
    const slides = document.getElementById('slides');
    const totalSlides = slides.children.length;
    const slidesVisiveis = 4;
    const slideLargura = 305;//slides.querySelector('.slide').offsetWidth + 5; // 5 é a margem direita    

    function atualizarSlide() {
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

    function abrirPopup() {
        document.getElementById("popupCadastro").style.display = "block";
    }

    function fecharPopup() {
        document.getElementById("popupCadastro").style.display = "none";
    }

    // Fecha o modal ao clicar fora dele
    window.onclick = function (event) {
        const modal = document.getElementById("popupCadastro");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
