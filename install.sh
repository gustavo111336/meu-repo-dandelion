pkg update -y && pkg upgrade -y

pkg install curl -y

curl -L -o dandelion-repo.deb https://github.com/gustavo111336/meu-repo-dandelion/raw/refs/heads/main/dandelion-repo.deb

apt install ./dandelion-repo.deb -y

apt update

echo "✔ Repo Dandelion instalado!"
echo "Pacotes disponíveis: dandelion-pkg, dandelion-repo"
