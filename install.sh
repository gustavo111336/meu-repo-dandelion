curl https://github.com/gustavo111336/meu-repo-dandelion/raw/refs/heads/main/dandelion-repo.deb
apt update && apt upgrade 
apt install ./dandelion-repo.deb
apt update
echo "new packages one dandelion-pkg dandelion-repo"
