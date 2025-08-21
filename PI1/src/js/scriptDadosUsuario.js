// Open registration modal
function abrirPopupCadastroEndereco() {
    document.getElementById("popupCadastroEndereco").style.display = "flex";
}

// Close registration modal
function fecharPopupCadastroEndereco() {
    document.getElementById("popupCadastroEndereco").style.display = "none";
}

const formCadastroEndereco = document.getElementById('formCadastroEndereco');
const mensagem = document.getElementById('mensagemRetorno');

//PRECISA INCLUIR API DO CEP PARA O ENDEREÇO FUNCIONAR
document.getElementById('cep').addEventListener('blur', function () {
    const cep = this.value.replace(/\D/g, '');

    // Sempre limpar os campos antes de tentar preencher
    document.getElementById('rua').value = '';
    document.getElementById('bairro').value = '';
    document.getElementById('cidade').value = '';
    document.getElementById('estado').value = '';


    if (cep.length === 8) {
        fetch(`https://viacep.com.br/ws/${cep}/json/`)
            .then(response => response.json())
            .then(res => {
                if (!res.erro) {
                    document.getElementById('rua').value = res.logradouro;
                    document.getElementById('bairro').value = res.bairro;
                    document.getElementById('cidade').value = res.localidade;
                    document.getElementById('estado').value = res.uf;

                } else {
                    exibirMensagem('CEP não encontrado.', 'erro');
                }
            })
            .catch(() => {
                exibirMensagem('Erro ao buscar o CEP.', 'erro');
            });
    } else {
        exibirMensagem('CEP inválido.', 'erro');
    }
});

formCadastroEndereco.addEventListener('submit', function (e) {
    e.preventDefault();

    const formData = new URLSearchParams();
    formData.append('id_usuario', formCadastroEndereco.id_usuario.value);
    formData.append('cep', formCadastroEndereco.cep.value);
    formData.append('rua', formCadastroEndereco.rua.value);
    formData.append('numero', formCadastroEndereco.numero.value);
    formData.append('bairro', formCadastroEndereco.bairro.value);
    formData.append('cidade', formCadastroEndereco.cidade.value);
    formData.append('estado', formCadastroEndereco.estado.value);
    formData.append('complemento', formCadastroEndereco.complemento.value);

    fetch(formCadastroEndereco.action, {
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
            exibirMensagem(res.message || 'Endereço cadastrado com sucesso!');
            formCadastroEndereco.reset();

            // Aguarda 2 segundos e recarrega a página
            setTimeout(() => {
                location.reload();
            }, 2000);
        } else {
            exibirMensagem(res.message || 'Erro ao cadastrar endereço.', 'erro');
        }
    })
    .catch(() => {
        exibirMensagem('Erro ao enviar os dados.', 'erro');
    });
});

// Abre o popup e seta o id no input hidden
function abrirPopupConfirmacaoExcluirEndereco(id_endereco) {
    console.log("ID recebido no modal:", id_endereco);
    document.getElementById('enderecoIdExcluir').value = id_endereco;
    document.getElementById('popupConfirmExcluirEndereco').style.display = 'flex';
}

// Fecha o popup
function fecharPopupConfirmacaoExcluirEndereco() {
    document.getElementById('popupConfirmExcluirEndereco').style.display = 'none';
}

// Listener para o form de exclusão
const formExcluir = document.getElementById('confirmExcluirEndereco');

formExcluir.addEventListener('submit', function (e) {
    e.preventDefault();

    const id = document.getElementById('enderecoIdExcluir').value;
    if (!id) {
        exibirMensagem('ID do endereço não informado.', 'erro');
        return;
    }
    console.log('Excluindo endereço ID:', id);

    const formData = new URLSearchParams();
    formData.append('id_endereco', id);

    fetch(formExcluir.action, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: formData.toString()
    })
    .then(r => r.json())
    .then(res => {
        if (res.status === 'ok') {
        exibirMensagem(res.message || 'Endereço excluído com sucesso!');
        fecharPopupConfirmacaoExcluirEndereco();
        setTimeout(() => location.reload(), 1200);
        } else {
        exibirMensagem(res.message || 'Erro ao excluir o endereço', 'erro');
        }
    })
    .catch(() => exibirMensagem('Erro ao excluir o endereço', 'erro'));
});

// Open registration modal
function abrirPopupEditarDadosEndereco() {
    document.getElementById("popupEditarDadosEndereco").style.display = "flex";
}

// Close registration modal
function fecharPopupEditarDadosEndereco() {
    document.getElementById("popupEditarDadosEndereco").style.display = "none";
}


function tornarPadrao(id_endereco) {
    const formData = new URLSearchParams();
    formData.append('id_endereco', id_endereco);

    fetch('tornarPadrao.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formData
    })
    .then(response => response.json())
    .then(res => {
        if (res.status === 'ok') {
            exibirMensagem(res.message || 'Endereço definido como padrão!');
            setTimeout(() => location.reload(), 1500);
        } else {
            exibirMensagem(res.message || 'Erro ao definir padrão', 'erro');
        }
    })
    .catch(() => {
        exibirMensagem('Erro ao processar a requisição.', 'erro');
    });
}


function exibirMensagem(texto, tipo = 'success') {
    mensagem.innerHTML = texto;
    mensagem.style.display = 'block';
    mensagem.className = tipo === 'success' ? 'mensagem-sucesso' : 'mensagem-erro';
    setTimeout(() => {
        mensagem.style.display = 'none';
    }, 2000);
}

const cepInput = document.getElementById('cep');
const cepMask = IMask(cepInput, {
    mask: '00000-000',
});