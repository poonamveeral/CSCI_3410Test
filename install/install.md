# Install

All the commands are typed as root.

Install Python3:

    apt-get install python3-pip

Get the latest version of pandoc:

- Download the file "pandoc-XXX-amd64.deb" from <https://github.com/jgm/pandoc/releases>, where XXX is some version number,
- Navigate to that folder, and type 

        dpkg -i pandoc-XXX-amd64.deb 

Install pandoc-include-code:

- Type
    
    cabal update
- Type
    
    cabal install pandoc-types
- Go to https://github.com/owickstrom/pandoc-include-code, download the archive, extract it, and type
- Type

    cabal configure
    cabal install

Install pandoc-numbering:

    pip3 install pandoc-numbering

# Testing 

All the commands are typed as a normal user, and assume that your current folder is `lecture_notes/CSCI_3410/install/`.

## Testing Pandoc

To test that pandoc is working properly:

    pandoc test_pandoc.md -o test_pandoc.html

should produce a `html` file called `test_pandoc.html` containing

```{html}
<p>I’m a test for pandoc.</p>
```

Furthermore, the command 

    pandoc -v

should produce an output that begins with

> pandoc 2.9.1.1  
> Compiled with pandoc-types 1.20, texmath 0.12, skylighting 0.8.3

## Testing pandoc-numbering

To test that the pandoc-numbering filter is working properly:

    pandoc test_pandoc-numbering.md --filter pandoc-numbering -o test_pandoc-numbering.html

should produce a `html` file called `test_pandoc-numbering.html` containing

```{html}
<p><span id="exercise:1" class="pandoc-numbering-text exercise"><strong>Exercise 1</strong> <em>(The first exercise)</em></span></p>
<p><span id="exercise:2" class="pandoc-numbering-text exercise"><strong>Exercise 2</strong> <em>(The second exercise)</em></span></p>
```

## Testing pandoc-citeproc

To test that the pandoc-citeproc filter is working properly:

    pandoc --filter pandoc-citeproc test_pandoc-citeproc.md -o test_pandoc-citeproc.html

should produce a `html` file called `test_pandoc-citeproc.html` containing

```{html}
<p><span class="citation" data-cites="item1">(Doe 2005)</span></p>
<h1 class="unnumbered" id="references" class="unnumbered">References</h1>
<div id="refs" class="references hanging-indent" role="doc-bibliography">
<div id="ref-item1" role="doc-biblioentry">
<p>Doe, John. 2005. <em>First Book</em>.</p>
</div>
</div>
```
    
## Testing pandoc-include-code

To test that the pandoc-include-code filter is working properly:

    pandoc -F pandoc-include-code test_pandoc-include-code.md 
    

should produce a `html` file called `test_pandoc-include-code.html` containing

```{html}
<p>Here is some code:</p>
<div class="sourceCode" id="cb1"><pre class="sourceCode md"><code class="sourceCode markdown"><span id="cb1-1"><a href="#cb1-1"></a>I&#39;m a test for pandoc. </span></code></pre></div>
```

# Desinstall

All the commands are typed as root.

Clean all of cabal and the installed packages: 

- Downloald <https://gist.githubusercontent.com/simonmichael/1185421/raw/7b5da412da62dadd204b9e41ccd9639097d2178e/gistfile1.sh>
- Type
    source gistfile1.sh 
    
- Type
    ghc-pkg-reset 

Completely remove pandoc:

    apt-get purge pandoc

Uninstall pip:

    python -m pip uninstall pip
    

# Old Instructions


Before compiling this document, you will need to install

- git (cf. <https://git-scm.com/>),
- LaTeX (cf. <https://www.latex-project.org/get/>, <https://tex.stackexchange.com/q/1092>)^[I recommend installing a minimal installation, and then fetching the missing packages one by one, using e.g. `/usr/local/texlive/2019/bin/x86_64-linux/tlmgr install environ`]),
- pandoc (cf. <http://pandoc.org/installing.html>) v. 2.7.3,
- pandoc-numbering (cf. <https://github.com/chdemko/pandoc-numbering#installation>) v. 3.1.0.3,
- pandoc-include-code (cf. <https://github.com/owickstrom/pandoc-include-code>) v. 1.2.0.1,
- latexmk (cf. <https://ctan.org/pkg/latexmk/>, but it is possible that it is already part of your LaTeX installation),
- pdf2svg (cf. <https://github.com/dawbarton/pdf2svg>),
- librsvg2-bin,
- font-linuxlibertine

Because `pandoc-include-code` has not (yet?) being updated, a version equal to or less than 2.7.3. of pandoc (<https://github.com/jgm/pandoc/releases/tag/2.7.3>) and the version 1.2.0.1 of `pandoc-include-code` (<https://github.com/owickstrom/pandoc-include-code/releases/tag/v1.2.0.1>) need to be used.
Hopefully this bug, that I documented [here](https://github.com/owickstrom/pandoc-include-code/issues/25) and [there](https://github.com/jgm/pandoc/issues/5943) will be fixed soon.

And because of some incompatibility between latest version of `panflute` and `pandoc-numbering`, you need to 

#. Fetch the latest version of `pandoc-numbering`, using, as root

        pip install --upgrade --force --no-cache git+https://github.com/chdemko/pandoc-numbering
        
#. Then, _downgrade_ to an old version of panflute, using

        pip install -Iv panflute==1.10.6

