#Update script of oub-remix by @marshmello61
#Modified by @rakibul-ce-bd


repo="oub-remix"
rm -rf ${repo}

echo "You're running the OpenUserBot Remix Updater script"
echo " "
# Get username of user
echo -n "Enter your GitHub username: "
read username
echo " "

# Check if user has forked or has the same repo name
echo -n "Have you forked oub-remix from @sahyam2019 or has the same repo name i.e. oub-remix? [y/n]: "
read fork
echo " "

if [[ "${fork}" == 'y' ]]; then
	git clone https://github.com/${username}/${repo}
	cd ${repo}
elif [[ "${fork}" == 'n' ]]; then
	echo -n "Enter your repo name: "
	read repo
	git clone https://github.com/${username}/${repo}
	cd ${repo}
else
        echo " "
        echo "You were only supposed to enter y or n"
        exit 1
fi

echo " "
echo "Updating your oub-remix"
git pull https://github.com/sahyam2019/oub-remix
git diff
git commit -m "Update: New commit(s)"
git push
echo " "
echo "Updated"
cd ..
rm -rf ${repo}
