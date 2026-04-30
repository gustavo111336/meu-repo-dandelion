pkg update -y && pkg upgrade -y

pkg install curl -y

curl -L -o dandelion-repo.deb https://github.com/gustavo111336/meu-repo-dandelion/raw/refs/heads/main/dandelion-repo.deb

if [ ! -f dandelion-repo.deb ]; then
  echo "Erro ao baixar o arquivo"
  exit 1
fi

pkg install ./dandelion-repo.deb -y

if [ $? -ne 0 ]; then
  echo "Erro ao instalar o pacote"
  rm dandelion-repo.deb
  exit 1
fi

apt update

rm dandelion-repo.deb

echo "✔ Repo Dandelion instalado!"
echo "Pacotes disponíveis: dandelion-pkg, dandelion-repo"
