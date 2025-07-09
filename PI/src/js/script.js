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
function abrirPopupCadastro() {
    document.getElementById("popupCadastro").style.display = "flex";
}

// Close registration modal
function fecharPopupCadastro() {
    document.getElementById("popupCadastro").style.display = "none";
}

const formCadastro = document.getElementById('formCadastro');
const mensagem = document.getElementById('mensagemRetorno');

// Envia o formulário com Fetch
formCadastro.addEventListener('submit', function (e) {
    e.preventDefault();

    const formData = new URLSearchParams();
    formData.append('nome', formCadastro.nome.value);
    formData.append('email', formCadastro.email.value);
    formData.append('contato', formCadastro.contato.value);
    formData.append('senha', formCadastro.senha.value);

    fetch(formCadastro.action, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formData
    })
    .then(response => response.json())
    .then(res => {
        console.log(res);
        if (res.status === 'ok') {
            exibirMensagem(res.message || 'Cadastro realizado com sucesso!');
            formCadastro.reset(); // Limpa o formulário após o envio
        } else {
            exibirMensagem(res.message || 'Erro ao cadastrar', 'erro');
        }
    })
    .catch(() => {
        exibirMensagem('Erro ao enviar os dados.', 'erro');
    });
});

// Impede que clique dentro da mensagem a feche
mensagem.addEventListener('click', function (e) {
    mensagem.style.display = 'none'; // permite fechar clicando na própria mensagem
});

// Open login modal
function abrirPopupLogin() {
    document.getElementById("popupLogin").style.display = "flex";
}

// Close login modal
function fecharPopupLogin() {
    document.getElementById("popupLogin").style.display = "none";
}

const formLogin = document.getElementById('formLogin');

formLogin.addEventListener('submit', function (e) {
    e.preventDefault();

    const formData = new URLSearchParams();
    formData.append('emailLogin', formLogin.emailLogin.value);
    formData.append('senhaLogin', formLogin.senhaLogin.value);

    fetch(formLogin.action, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formData
    })
    .then(response => response.json())
    .then(res => {
        if (res.status === 'ok') {
            formLogin.reset();
            setTimeout(() => {
                location.reload(); // recarrega para atualizar nome do usuário
            }, 1);
        } else {
            exibirMensagem(res.message || 'Erro no login.', 'erro');
        }
    })
    .catch(() => {
        exibirMensagem('Erro ao enviar os dados.', 'erro');
    });
});

function exibirMensagem(texto, tipo = 'success') {
    mensagem.innerHTML = texto;
    mensagem.style.display = 'block';
    mensagem.className = tipo === 'success' ? 'mensagem-sucesso' : 'mensagem-erro';
    setTimeout(() => {
        mensagem.style.display = 'none';
    }, 2000);
}

const contatoInput = document.getElementById('contato');
const contatoMask = IMask(contatoInput, {
    mask: '(00) 00000-0000'
});
