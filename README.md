---
title: Readme for Lecture Notes for CSCI 3410 -- Database Systems
author: Clément Aubert
lang: en
fontsize: 10pt
documentclass: scrartcl
numbersections: true
papersize: letter
geometry: margin=1in
---

Here are the lecture notes, code, exercises and problems for a lecture on database taught at [Augusta University](https://www.augusta.edu/) by C. Aubert.
The webpage for this project is at <http://spots.augusta.edu/caubert/db/ln/>, and it contains a compiled version of the notes.

## Getting Started

The source code, hosted at <https://rocketgit.com/user/caubert/CSCI_3410>, is organized as follows:

~~~{.plain}
.
├── install/                -- How to install the requirements to compile the document.
├── notes/
│   ├── bib/                -- References (including reference to the document).
│   ├── code/               -- Source code included in the document.
│   ├── fig/                -- Source code for various figures used in the document. 
│   ├── filters/            -- Pandoc filters.
│   ├── img/                -- Various image files integrated in the document.
│   ├── latex/              -- Latex configuration file.
│   ├── lib/                -- Various libraries
│   ├── style/              -- css style used for the web page.
│   ├── lectures_notes.md   -- The main file for the lecture notes.
│   ├── Makefile            -- Directives to generate the lecture notes.
│   └── temp.md             -- Temporary file, for debugging purposes
├── CONTRIB.md              -- A guide on how to contribute
├── KNOWN_BUGS.md           -- A list of possible bugs, improvments, things to check, ...
├── LICENSE.md              -- The licence of those notes.
├── README.md               -- The present file
└── WORKFLOW.md             -- An step-by-step guide on how to edit those notes.
~~~

Before compiling this document, you will need to install LaTeX, pandoc, and several other programs. 
Refer to `install/install.md` for instructions on how to compile this document.

To clone the source, use git and the command

~~~{.bash}
git clone https://rocketgit.com/user/caubert/CSCI_3410
~~~

To compile this document, simply change directory to `notes` and run

- `make fig`, then `make pdf`, to obtain the pdf version,
- `make fig_svg`, then `make html` to obtain the html version,
- `make fig_svg`, then `make odt` to obtain the odt version.

The Makefile in the `notes` folder is commented.

## Contributing

The simplest way to contribute is to report typos, errors or misleading statements.

- You can submit bug reports at <https://rocketgit.com/user/caubert/CSCI_3410/bug> (requires an account).
- You can contact or visit me, cf. <http://spots.augusta.edu/caubert/#contact>.

Refer to [`CONTRIB.md`](CONTRIB.html) for more information.

## Authors and Contributors

- **Clément Aubert** - *Initial work* - <http://spots.augusta.edu/caubert/>
- **Crystal Anderson** - *Revisions*
- **Bobby Mcmanus**, **Minh Nguyen** and **Poonam Veeral** - *Installation guide and quality control*

Those notes would not have been without the constant support, curiosity, and remarks from my students.
Crystal was supported by an [Affordable Learning Georgia](https://www.affordablelearninggeorgia.org/) "Mini-Grant for Ancillary Materials Creation and Revision" ([Proposal M71](https://www.affordablelearninggeorgia.org/documents/M71_Augusta_Aubert.pdf)).
Bobby, Minh and Poonam benefited from the support and guidance of Dr. Onyeka Ezenwoye in the CSCI 4712 - Senior Capstone Project class.


## License

This project is licensed under the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) licence: you are free to share and adapt this document, as long as you give proper credit.
Refer to [`LICENSE.md`](LICENSE.html) for the complete licence.

The files in the `lib` sub-folder comes from:

- <https://github.com/google/google-java-format/releases>, released under the Apache 2.0 license.
- <https://dev.mysql.com/downloads/connector/j/>, released under version 2 of the GNU General Public License (GPLv2).

and are redistributed as is, in agreement with their respective licences.
