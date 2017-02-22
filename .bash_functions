alias libreoffice="libreoffice --norestore"

function git_add_nonwhitespace() {
	diff=$(git diff -U0 -w --no-color)
	if [ ! -z "$diff" ]; then	
		git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -
	else
		echo "Nothing to commit";
	fi
}

function hypernode-status() {
        echo
        curl -i -H "Host: magweb" http://$1.hypernode.io/status.php
        echo
        echo

}

tag_release() {
	major=$(date "+%Y%m%d")
	minor=1

	while [ $((minor < 100 )) ]; do
		exists=$(git tag -l "$major.$minor");
		if test -z $exists; then
			git tag "$major.$minor";
			echo "Tagged as $major.$minor";
			break;
		fi
		minor=$((minor+1));
	done
}

ttfb() {
    curl -kso /dev/null -w "%{time_starttransfer}\n" $*
}


create_virtualenv() {
    mkvirtualenv -a $(pwd) $* $(basename $(pwd))
}

remove_old_kernels() {
    kernels=$(ls -1 /boot/config-* | grep -v $(uname -r) | sort -r | tail -n +2 | cut -d '/' -f 3 | sed -e 's/config-/linux-image-/')
    echo "Removing kernels:";
    for kernel in $kernels; do
        echo " - $kernel";
    done
    sudo apt-get remove --purge $kernels
}
