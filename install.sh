pkg update -y && pkg upgrade -y

pkg install curl -y

curl -L -o dandelion-repo.deb https://github.com/gustavo111336/meu-repo-dandelion/raw/refs/heads/main/dandelion-repo.deb
if [ ! -f dandelion-repo.deb ]; then
  echo "Erro ao baixar o arquivo"
  exit 1
fi

apt install ./dandelion-repo.deb -y

apt update

echo "✔ Repo Dandelion instalado!"
echo "Pacotes disponíveis: dandelion-pkg, dandelion-repo"
rm dandelion-repo.deb
