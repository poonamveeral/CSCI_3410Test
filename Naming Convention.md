#   Naming Convention Standard/File Name Conventions

## A collection of guidelines for writing file, folder, classes, figures, and images names in the project.
  
  * [File Names](#file-name)
  * [Figures](#figure-name)
  * [Folders](#folder-name)
  * [The Tags in the Document](#tag-name)
  * [The Links in the Document](#link-name)
  * [Code Folder Naming Convention](#code-folder-naming-convention)


# File Name
*  Make file and directory names lowercase.
*  Separate words with hyphens, not underscores.
*  Use only standard ASCII alphanumeric characters in  file and directory names.

    * Recommended


        Example | file-name.extension |
       ---------|---------------------|
 
    * Not Recommended


        Example | filename.extension |
        ---------|----------|---------

         Example | fileName.extension |
        ---------|----------|---------

* Other exceptions
  
  * It's okay to have some inconsistency in filenames if it can't otherwise be avoided.
    * For example, sometimes tools that generate reference documentation produce file names based on different style requirements or based on the design and naming conventions of the product or API itself.


# Figure Name

# Folder Name

# Tag Name

# Link Name

# Code Folder Naming Convention


* SQL Homework Files in Code Folder.
    * Every Homework will be followed by HW_ and Upper Camel Case.

        | Example    | HW_HomeworkName |
        | -----------| --------------- |


* JAVA Files in Code Folder.
    * Every JAVA file will be followed by the with a capital letter or first word with a lowercase letter, rest all with capital.

    * Classes and Interfaces
        * Class names should be nouns, in mixed case with the first letter of each internal word capitalised. 
        * Interfaces name should also be capitalised just like class names.
        * Use whole words and must avoid acronyms and abbreviations.

         | Example     | class MountainBike | interface Sport |
         | ----------- | ----------- | ----------- |

* Variables : Variable names should be short yet meaningful.
    * Should not start with underscore(‘_’) or dollar sign ‘$’ characters.
    * Should be mnemonic i.e, designed to indicate to the casual observer the intent of its use.
    * One-character variable names should be avoided except for temporary variables.
    * Common names for temporary variables are i, j, k, m, and n for integers; c, d, and e for characters.

        | Example     |  int speed = 0 |  int gear = 1; |
        | ----------- | ----------- | ----------- |

* Constant variables: 
  * Should be all uppercase with words separated by underscores (“_”).
  * There are various constants used in predefined classes like Float, Long, String etc.

    | Example     |  static final int MIN_WIDTH = 4; |
    | ----------- | -------------------------------- |

* XML Files in Code Folder
  * Camel case is a common naming rule in JavaScripts.
  * Uppercase first letter in each word except the first

    | Example     |  firstName |
    | ----------- | ---------- |




        
       























* Rules are taken by:
  *  https://www.geeksforgeeks.org/.
  *  https://www.w3schools.com/xml/xml_elements.asp.
  *  https://developers.google.com/style/filenames.
