---
title: Known Bugs
---

CONTENT TO ADD
===============

- Add exercises and problems involving triggers and stored procedures.
- Add content on Security and "Recognize professional responsibilities and make informed judgments in computing practice based on legal and ethical principles."
- Mention / discuss propagate options, and UNIQUE / NOT NULL, etc. options on particular attributes, during the discussion on how to map E.R. diagram to the relational model.
- Explain what "try-with-ressource" is in Java (cf. <https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html>, and remove the call to the close() after explaining that Statement and Connection are auto-closeable. (<https://docs.oracle.com/javase/7/docs/api/java/sql/Connection.html>, <https://docs.oracle.com/javase/7/docs/api/java/sql/Statement.html>).

TO ANSWER
=========

- Can you make union of different datatypes?
- When you count, do you count null?
- cf notes for Lecture 14: weak entity with identifying relation of degree more than 1. Joint filling. Unclear.
- Can an identifying relationship being of mutiplicity more than 1? I.e., a pet is in my DB only if it belongs to a friend, but a pet can belong to more than 1 friend.
- Can an attribute of a relation being a key? Cf. Spring 2018, Final Exam, pb 1.
- Can a multi-valueded attribute be a key attribute?
- Can an identfying relationship have arity 3, with only one side identifying? 
- Can a weak entity have a ratio greater than 1 (i.e., a dependent that is dependent of 2 employees)?
- Can we have "Dependant -- Employee -- Plan" for the coverage of dependent, where Dependant is weak, Employee is identifying, but Plan is also part of the relationship, without being identfying or weak?


TO FIX
=======

MARKDOWN
--------

- Re-type img/ and organize them (FunDep, ER, UML, Rel, Design, Misc?).
- There is no clear naming convention for the files in the fig/ folder.
- Add "question" environments to _all_ the problems.
- "Inline" small code with `ALTER TABLE STAFF ADD PRIMARY KEY(Id);`{.sqlmysql}
- Make separation of lecture in another way. Or remove it?
- Make all the common part of the template.def into a common file?
- There is no good naming convention for the labels in the markdown file.
- Include relevant code
- Add example environment?
- Having one bib. per section: <https://github.com/jgm/pandoc/issues/771>. Warning, this is a different issue from using `--reference-location=block --reference-links`  cf. <https://pandoc.org/MANUAL.html>.
- Put references from problems to solutions.
- List of problem not an hyperlink in the toc (cf. <https://github.com/chdemko/pandoc-numbering/issues/12>).


DRAWINGS
--------

- The source code is often more complicated than needed.
- The colors should be unified, and kept to a low number.
- Start using <https://gist.github.com/rodneyrehm/40e7946c0cff68a31cea> to draw the diagrams for the documentation ?
- That every ER diag. has a (correct) description.

MAKEFILE
--------

- fig_svg should wait for fig to be completed before starting.
- The Phony rules should be called only if needed.

HTML
----

- Add alt text
- Add the possibility for the table of content to "follow" the reading, expanding the titles as we go, and highlighting the current section under reading. This could be achieved using something similar to <https://jsfiddle.net/vu6hN/28/> (cf. <https://stackoverflow.com/questions/27610892/highlight-menu-on-scrolling-if-reach-div>) or <https://www.ruediger-voigt.eu/big-dataset-csv-import-to-relational-databases.html>.
- Make a more "mobile-friendly" version. Defer loading of image?
- Make all the images clickable to open (in pop-ups?) better versions of them, or make the svg zoomable. Cf. (best one?) https://github.com/ariutta/svg-pan-zoom or https://bl.ocks.org/mbostock/db6b4335bf1662b413e7968910104f0f or http://www.petercollingridge.co.uk/tutorials/svg/interactive/pan-and-zoom/ or even https://stackoverflow.com/questions/25866342/zoomable-inline-svg 



CSS
---

- Wrap the line code. Now it is prevented by
    
        white-space: pre; div.sourceCode { margin: 1em 0; }
            
cf. the discussion at <https://stackoverflow.com/q/57812345/>
    
Line Wrapping in DB notes  -- Works more or less if there is only 1 line wrapped:
    
```{.css}
    .sourceLine{
    white-space: pre-wrap;
    display:inline-block;
    width:35m;
    }

    .sourceLine{
        background-position: right;
        background-repeat: no-repeat;// repeat-y;
    //    background-size: 1em 1em;
        background-size: 1em 100%;
        background-image: url('data:image/png;base64,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');
    }

    .sourceLine:first-line{
    background:blue;
    //  background:none!important
    }

```

Attempt on the left:
    
```{.css}
    .sourceLine{
    white-space: pre-wrap;
    display:inline-block;
    width:35m;
    }

    .sourceLine{
    background-color:red;
    padding-left : 1em;
    background-position: left;
    background-repeat: repeat-y;
    //    background-size: 1em 1em;
    background-size: 1em;// 100%;
    background-image: url('data:image/png;base64,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');
    }
    .sourceLine:first-line{
    background-color:yellow;
    padding-left:-1em!important;
    margin-left:-1em;
    
    /*
    background:transparent!important;
    background-image:none!important;
    background:none!important;
        background-size:0 0!important;
    */
    }
    ```

Almost there?

    ```{.css}
    .sourceLine{
    white-space: pre-wrap;
    display:inline-block;
    width:35m;
    }
    
    .sourceLine{
    background-color:red;
    margin-right:1em;
        background-position: right;
        background-repeat: repeat-y;
    //    background-size: 1em 1em;
        background-size: 1em;// 100%;
        background-image: url('data:image/png;base64,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');
    
    }
    .sourceLine:first-line{
    background-color:yellow;
    /*
    background:transparent!important;
    background-image:none!important;
    background:none!important;
        background-size:0 0!important;
    */
    }
```
        
- add actual links in code.
- Remove

```{.css}
    @media screen {
    code.sourceCode > span > a:first-child::before { text-decoration: underline; }
    }
```

-  What's the point of

```{.css}
        .sourceCode:after {
            content: attr(data-caption);
            font-weight:bold;
        }
```
- hover should probably be on line number.

PDF
----

- The header are sometimes wrong (in the "Exercises" or "Problems" section, they keep the header of the last section).
- Offer multiple pdf format (binder, fewer margins)?
- One of the unicode symbol does not exist in the Linux Libertine font:  ⌛ (U+231B)

SQL
----

- Beautify the code,
- Add the "IF EXISTS DROP" in all the shared snippets of code.

OTHER
-----

- It could be of interest to offer other formats (cf. <http://pandoc.org/> for a complete list), like `epub`, `docx`, or `mediawiki` (for this latest, a line is in the markdown, but the content has not been checked).

TO DO
=======

- Compress / optimize outputs?
- Push on multiple repo. at the same time? Cf. <https://jigarius.com/blog/multiple-git-remote-repositories>.



TO CHECK
========

- Check with `jhove`, `pdfinfo` the validity of the document.
- Check that order of exercises / problems match introduction in lecture.
- Check that solution of exercises numbering match exercise numbering.
- Inline descriptions?
- In the abbreviations, S.Q.L. and U.M.L. and E.R., etc, or drop the .?
- Consistency, in general.
- Spelling, in general.


REFERENCES TO ADD / READ
========================

- <https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/exams/>
- <https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/>
- <https://opentextbc.ca/dbdesign01/chapter/chapter-7-the-relational-data-model/>
- <https://stackoverflow.com/questions/48191228/is-erd-considered-a-kind-of-uml-diagram>
- How to derive an SQL-92 database schema from an information design model <https://oxygen.informatik.tu-cottbus.de/IT/Lehre/MDD-Tutorial/#d5e126>
- Short presentation of UML diag <https://ocw.mit.edu/courses/civil-and-environmental-engineering/1-264j-database-internet-and-systems-integration-technologies-fall-2013/lecture-notes-exercises/>
- Aks for password on DB and other programming ressources Java / DB + mapping datatypse is useful <http://www.cs.man.ac.uk/~horrocks/Teaching/cs2312/Lectures/Handouts/jdbc.pdf>
- <https://www.1keydata.com/datawarehousing/data-modeling-levels.html>
- <https://en.wikipedia.org/wiki/Unified_Modeling_Language>
- <https://creately.com/blog/diagrams/class-diagram-relationships/>
- <https://www.ntu.edu.sg/home/ehchua/programming/java/JDBC_Basic.html>
- Have the close in a catch as well: <https://en.wikipedia.org/wiki/Java_Database_Connectivity>

    ```{.java}
    try { 
            conn.close();
        } catch (Throwable e) { /* Propagate the original exception
                                    instead of this one that you want just logged */ 
            logger.warn("Could not close JDBC Connection",e);
        }                     
    ```
    
    cf. also  <https://stackoverflow.com/questions/4507440/must-jdbc-resultsets-and-statements-be-closed-separately-although-the-connection> and <https://stackoverflow.com/questions/2225221/closing-database-connections-in-java>
- Algo for NF: <http://airccse.org/journal/ijdms/papers/5313ijdms03.pdf>
- Security and salting: <https://stackoverflow.com/q/1054022>
- Storing password:
    - PHP <https://stackoverflow.com/q/5882882>
    - JAVA <https://stackoverflow.com/a/442872>, <https://security.stackexchange.com/q/20294>, <https://security.stackexchange.com/q/19956>, <https://stackoverflow.com/q/8195099>, <https://blog.codinghorror.com/top-25-most-dangerous-programming-mistakes/>, <http://cwe.mitre.org/data/definitions/259.html>
- Meaning of BASE: <https://stackoverflow.com/questions/3342497/explanation-of-base-terminology?rq=1>
- NoSQL / SQL, <https://blog.panoply.io/sql-or-nosql-that-is-the-question>
- ER -> XML, <http://users.dimi.uniud.it/~massimo.franceschet/publications/xsym09.pdf>
- XML -> ER, <https://dl.acm.org/citation.cfm?id=1810762>
- <http://infolab.stanford.edu/~ullman/dscb.html>
- <https://open.umn.edu/opentextbooks/textbooks/database-design-2nd-edition>
- <https://www.irif.fr/~amelie/BD.html>
