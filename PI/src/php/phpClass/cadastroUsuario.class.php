<?php
    include 'conexao.class.php';

    class Cadastro {
        private $id_usuario;
        private $nome;
        private $email;
        private $contato;
        private $senha;
        private $data_criacao;

        public function getIdUsuario() {
            return $this->id_usuario;
        }
        public function setIdUsuario($id_usuario) {
            $this->id_usuario = $id_usuario;
        }

        public function getNome() {
            return $this->nome;
        }
        public function setNome($nome) {
            $this->nome = $nome;
        }

        public function getEmail() {
            return $this->email;
        }
        public function setEmail($email) {
            $this->email = $email;
        }

        public function getContato() {
            return $this->contato;
        }
        public function setContato($contato) {
            $this->contato = $contato;
        }

        public function getSenha() {
            return $this->senha;
        }
        public function setSenha($senha) {
            $this->senha = $senha;
        }

        public function getDataCriacao() {
            return $this->data_criacao;
        }

        public function setDataCriacao($data_criacao) {
            $this->data_criacao = $data_criacao;
        }

        public function cadastrarUsuario() {
            $conexao = new Conexao();
            $db = $conexao->getConnection();
            
            $sql = 'INSERT INTO usuarios (nome, email, contato, senha) values (:nome, :email, :contato, :senha)';
            try{

                // Gerar o hash da senha antes de armazenar
                $senhaHash = password_hash($this->senha, PASSWORD_DEFAULT);

                $stmt = $db->prepare($sql);
                $stmt->bindParam(':nome', $this->nome);
                $stmt->bindParam(':contato', $this->contato);
                $stmt->bindParam(':email', $this->email);
                $stmt->bindParam(':senha', $senhaHash);
                $stmt->execute();
                return true;
            } catch(PDOException $e){
                echo 'Erro ao inserir usuário: '. $e->getMessage();
                return false;
            }   
        }

        public function listarUsuarios($email, $senha) {
            $conexao = new Conexao();
            $db = $conexao->getConnection();
            
            $sql = 'SELECT * FROM usuarios WHERE email=:email LIMIT 1';
            try {
                $stmt = $db->prepare($sql);
                $stmt->bindParam(':email', $email);
                $stmt->execute();
                $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

                // Verifica se o usuário foi encontrado e a senha confere
                if ($usuario && password_verify($senha, $usuario['senha'])) {
                    // Remova o hash antes de retornar os dados, por segurança
                    unset($usuario['senha']);
                    return $usuario;
                } else {
                    // Retorna vazio se senha não confere ou usuário não existe
                    return null;
                }
            } catch (PDOException $e) {
                echo 'Erro ao listar usuários: ' . $e->getMessage();
                return null;
            }
        }
    }
