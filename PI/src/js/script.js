// Script for product carousel
let index = 0;
const slides = document.getElementById('slides');
const totalSlides = slides.children.length;
const slidesVisiveis = 4; // Number of visible items
const slideLargura = 305; // Slide width + margin

// Update carousel position
function atualizarSlide() {
    const deslocamento = index * slideLargura;
    slides.style.transform = `translateX(-${deslocamento}px)`;
}

// Move carousel forward
function avancar() {
    if (index < totalSlides - slidesVisiveis) {
        index++;
        atualizarSlide();
    }
}

// Move carousel backward
function voltar() {
    if (index > 0) {
        index--;
        atualizarSlide();
    }
}

// Alert on "Add to Cart" button click
document.querySelectorAll('.botao-carrinho').forEach(botao => {
    botao.addEventListener('click', () => {
        alert('Product added to cart!');
    });
});

// Open registration modal
function abrirPopup() {
    document.getElementById("popupCadastro").style.display = "flex";
}

// Close registration modal
function fecharPopup() {
    document.getElementById("popupCadastro").style.display = "none";
}

// const formCadastro = document.querySelector('#popupCadastro form');
// formCadastro.addEventListener('submit', function (e) {
//     e.preventDefault(); // Impede envio para o PHP por enquanto

//     const mensagem = document.getElementById('mensagemSucesso');
//     mensagem.style.display = 'block';

//     // Esconde a mensagem após 5 segundos
//     setTimeout(() => {
//         mensagem.style.display = 'none';
//     }, 2000);
// });
const form = document.getElementById('formCadastro');
const mensagem = document.getElementById('mensagemSucesso');

// Envia o formulário com Fetch
form.addEventListener('submit', function (e) {
    e.preventDefault();

    const dados = {
        nome: form.nome.value,
        email: form.email.value,
        contato: form.contato.value,
        senha: form.senha.value
    };

    fetch('../php/inserirCadastro.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(dados)
    })
    .then(response => response.json())
    .then(res => {
        if (res.status === 'ok') {
            mensagem.style.display = 'block';
            form.reset(); // limpa o formulário

            setTimeout(() => {
                mensagem.style.display = 'none';
            }, 2000);
        } else {
            alert(res.mensagem || 'Erro ao cadastrar');
        }
    })
    .catch(() => {
        alert('Erro na conexão com o servidor.');
    });
});
// Impede que clique dentro da mensagem a feche
mensagem.addEventListener('click', function (e) {
    mensagem.style.display = 'none'; // permite fechar clicando na própria mensagem
});

