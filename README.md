# My LaTeX Template
This is a minimalistic LaTeX template.
My workflow is based on `LaTeX` + `VSCode` + `Git`.

## ⚙️ Setup

### LaTeX Installation
Install the LaTeX distribution and compiler:

```bash
sudo apt update
sudo apt install texlive latexmk
# Optional: Install Spanish language support
sudo apt install texlive-lang-spanish
```

### VSCode Settings
I highly recommend installing [the LaTeX Workshop extension](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) by James Yu.

## 🚀 Start Up
### Git Template
The easiest way to fork this template is using the `GitHub CLI`:
```bash
gh repo create new-latex-project --template rubzip/my-Latex-Template --clone
```
If you prefer not to use the GitHub CLI, you can do it manually:
```bash
git clone https://github.com/rubzip/my-Latex-Template new-latex-project
cd new-latex-project
rm -rf .git

git init
git add .
git commit -m "Initial commit from LaTeX template"
```

### Copy File
You can copy any template using the make command. Available templates are article, beamer, and doc (in both _es and _en).

E.g.
```bash
# Create a Spanish article (default name: main.tex)
make new_article_es

# Create an English presentation with a custom name
make new_beamer_en SRC=presentation.tex
```

(Additionally) you can remove the templates folder if you no longer need the other base files:
```bash
rm -rf templates/
```


