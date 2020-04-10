---
title: Workflow cheatsheet
---

<!-- I'm a comment -->

# Step by step

#. Open a command-line interface (or "Terminal") and make the folder containing the notes the current working directory:
    #. Open a command-line interface, cf. <https://www.wikihow.com/Open-a-Terminal-Window-in-Ubuntu>.
    #. Change the directory to the right folder, using something like
    
    ```
    cd CSCI_3410/
    ```
    
    Or, alternatively,
    
    #. Open the file explorer,
    #. Navigate to the notes folder, 
    #. Make a right-click, "Open in terminal" (or something similar).

#. Get the latest version of the notes:  

    ```
    git pull
    ```

#. Compile the figures into `pdf` and convert them to `svg`, using

    ```
    make fig
    make fig_svg
    ```

    If you get errors messages on that step, please report them.

#. Edit the document using whichever software you like.

#. Test your edit, using
    
    ```
    make html
    make pdf
    make odt
    ```
    
    depending on the version you want to see, or
    
    ```
    make all
    ```
    
    if you want to compile them all.
    If you are happy with them, go to the next step, otherwise go to the previous step.

#. Tell git to save your modifications:

    ```
    git commit -a -m "My meaningful explanation of what I just did"
    ```
    
#. Have rocketgit "accepts" your IP, by using
    
    ```
    ssh rocketgit@ssh.rocketgit.com totp val XXXXXX
    ```
    
    where XXXXXX is the code given by the duo application for your rocketgit account.
    
#. Push your modification to the server
    
    ```
    git push origin master
    ```



To add a file, open a terminal where the file is, and type

    git add <name of the file>
    
Then, commit and push.

Use 
    
    git rm <name of the file>
    
to remove it.
    
# References

- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [Git tutorial](http://metatheorem.org/CSCI3300/lectures/git.html)

# Markdown Syntax

For the Solution, Problem and Exercises, we use a particular syntax, that is rendered using the `<dd>` and `<dt>` tags in `html`, and that furthermore use pandoc-numbering.

We can either have in-line, or block, environment, using

Solution +.#

: Solution on one line.
We are still on the same line.

Not in the solution anymore

Solution +.#
~ 
    Solution on a block.
    Still in the block.
    
    Still in the block, on a different paragraph.

Not in the solution anymore

The indentation makes all the difference in the block environment.
