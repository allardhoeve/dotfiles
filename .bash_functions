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
