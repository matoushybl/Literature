rm -f index2.html
cat index_header.html >> "index.html"
for f in src/*.md
do
 echo "Processing $f"
 name=$(basename $f)
 # remove old file
 rm -f "out/$name.html"
 echo "<div class=\"book mdl-shadow--2dp mdl-cell mdl-cell--12-col-desktop mdl-cell--8-col-phone\">" >> "index.html"
 perl /Users/matous/Markdown_1.0.1/Markdown.pl $f >> "index.html"
 echo "</div>" >> "index.html";
done
cat index_footer.html >> "index.html"
git add *.html
git add *.css
git add src/*.md
git add out/*.html
git commit -m "Update sources"
git push origin gh-pages