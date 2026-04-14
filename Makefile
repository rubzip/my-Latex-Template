SRC ?= main.tex
OUT ?= $(basename $(SRC)).pdf
LANG ?= en,es

.PHONY: clean clear to_pdf new new_article_es new_article_en new_beamer_es new_beamer_en new_doc_es new_doc_en

build:
	mkdir -p build

clean:
	@echo "🧹 Deleting everything in build/..."
	rm -rf build/*

clear:
	@echo "🗑️ Removing auxiliary files..."
	find build/ -type f ! -name '*.pdf' -delete

to_pdf: build
	@echo "🚀 Compiling '$(SRC)' to generate 'build/$(OUT)'..."
	latexmk -pdf -interaction=nonstopmode -outdir=build -jobname=$(basename $(OUT)) $(SRC)
	@echo "✅ Done: build/$(OUT)"

new:
	@if [ -z "$(DOC)" ]; then \
		echo "⚠️ ERROR! Undefined DOC: $(DOC)."; exit 1; \
	fi
	@if [ -f $(SRC) ]; then \
		echo "⚠️ ERROR! '$(SRC)' already exists. Cancelled Operation."; \
		exit 1; \
	else \
		echo "📄 Creating '$(SRC)' from template '$(DOC)'..."; \
		cp $(DOC) ./$(SRC); \
		echo "✅ Done."; \
	fi

set_lang:
	@if [ ! -f .vscode/settings.json ]; then \
		echo "⚠️ ERROR! '.vscode/settings.json' not found."; exit 1; \
	fi
	@echo "🌐 Changing corrector language to '$(LANG)'..."
	@python3 -c "import json; f='.vscode/settings.json'; d=json.load(open(f)); d['cSpell.language']='$(LANG)'; json.dump(d, open(f,'w'), indent=4)"
	@echo "✅ Language updated."

new_article_es:
	@$(MAKE) new DOC=templates/article-es.tex SRC=$(SRC)
	@$(MAKE) set_lang LANG=es

new_beamer_es:
	@$(MAKE) new DOC=templates/beamer-es.tex SRC=$(SRC)
	@$(MAKE) set_lang LANG=es

new_doc_es:
	@$(MAKE) new DOC=templates/doc-es.tex SRC=$(SRC)
	@$(MAKE) set_lang LANG=es

new_article_en:
	@$(MAKE) new DOC=templates/article-en.tex SRC=$(SRC)
	@$(MAKE) set_lang LANG=en

new_beamer_en:
	@$(MAKE) new DOC=templates/beamer-en.tex SRC=$(SRC)
	@$(MAKE) set_lang LANG=en

new_doc_en:
	@$(MAKE) new DOC=templates/doc-en.tex SRC=$(SRC)
	@$(MAKE) set_lang LANG=en
