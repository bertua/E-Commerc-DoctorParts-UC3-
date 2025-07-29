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

  if (cep.length === 8) {
    fetch(`https://viacep.com.br/ws/${cep}/json/`)
      .then(response => response.json())
      .then(data => {
        if (!data.erro) {
          document.getElementById('rua').value = data.logradouro;
          document.getElementById('bairro').value = data.bairro;
          document.getElementById('cidade').value = data.localidade;
          document.getElementById('estado').value = data.uf;
        } else {
          alert('CEP não encontrado.');
        }
      })
      .catch(() => {
        alert('Erro ao buscar o CEP.');
      });
  } else {
    alert('CEP inválido.');
  }
});

function excluirEndereco(id_endereco) {
    if (confirm('Tem certeza que deseja excluir este endereço?')) {
        const formData = new FormData();
        formData.append('id_endereco', id_endereco);

        fetch('excluirEndereco.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(res => {
            if (res.status === 'ok') {
                exibirMensagem(res.message || 'Endereço excluído com sucesso!');
                setTimeout(() => location.reload(), 1500); // Aguarda a mensagem antes de recarregar
            } else {
                exibirMensagem(res.message || 'Erro ao excluir o endereço', 'erro');
            }
        })
        .catch(error => {
            console.error('Erro:', error);
            exibirMensagem('Erro ao excluir o endereço', 'erro');
        });
    }
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