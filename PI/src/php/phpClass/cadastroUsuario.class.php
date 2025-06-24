<?php
    include 'conexao.class.php';

    class Cadastro {
        private $id_usuario;
        private $nome;
        private $email;
        private $contato;
        private $senha;

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

        public function cadastrarUsuario() {
            $conexao = new Conexao();
            $db = $conexao->getConnection();
            
            $sql = 'INSERT INTO clientes (nome, email, contato, senha) values (:nome, :email, :contato, :senha)';
            try{
                $stmt = $db->prepare($sql);
                $stmt->bindParam(':nome',$this->nome);
                $stmt->bindParam(':telefone',$this->contato);
                $stmt->bindParam(':email',$this->email);
                $stmt->bindParam(':senha',$this->senha);
                $stmt->execute();
                return true;
            } catch(PDOException $e){
                echo 'Erro ao inserir usuário: '. $e->getMessage();
                return false;
            }   
            }
    }
?>