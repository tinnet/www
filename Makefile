publish:
	git branch -D gh-pages
	git checkout --orphan gh-pages
	git reset .
	hugo
	for a in public/*; do \
		cp -rf $${a} ./$${a#*/}; \
		git add $${a#*/}; \
	done
	git add CNAME
	git commit -m "generated: $$(date)"
	git push --set-upstream origin gh-pages --force
	git reset --hard master
	git checkout master
