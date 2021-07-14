
# """ MIT 15.455x R Tutorial """

# 1. Introdution

## What is R ?
# R is a powerful language and environment for statistical computing and graphics.
# Freeware, Help online, 
# Tutorial : Explanations, Examples, Excersices
# Expected Time : 1 or 2hs

# 2. Getting Started

## 2.1 Install R ( ubuntu version)
# source : https://www.datacamp.com/community/tutorials/installing-R-windows-mac-ubuntu    
# sudo apt update
# sudo apt -y upgrade
# sudo apt -y install r-base

## 2.2 Install R Studio ( ubuntu version)
# * Download R studio : https://www.rstudio.com/products/rstudio/download/#download
# rstudio-1.4.1717-amd64.deb
# sudo dpkg -i rstudio-1.4.1717-amd64.deb
# sudo apt -f install
# """ Uncomment and Install when online """
# install.packages(c("dplyr","ggplot2")) 

# 2.3 RStudio layout
# Bottom Left : console window : type commands
# Top Left : editor window / scrypt window, File > New > R scrypt, CTRL + Enter to Execute
# Top Right : Work Space / History window, Values in Memory, History of Executed commands
# Bottom Right : files / plots / packages / help window : open files, view plots, install / load packages

## 2.4 Working directory
# wd : folder where your currently working
# > setwd('home/user/Documents/')
# Rstudio : Tools/ Set Working directory

## 2.5 Libraries
# statistical and data analysis tools are organized in packages or libraries
# library() : get a list of all installed packages, tick for installed ones
# There are many more packages available in R website
# Packages window / install packages / type geometry
# for command line : install.packages("geometry")
# load package : library("geometry")

# 3. Some First Examples in R

## 3.1 Calculator
10^2 + 36
# :136
# TODO 1
((2014 - 2007) / (2014 - 1987)) * 100
#: 25.92593

## Workspace

# assign values to variables
a = 4
# execute a
a
# calc a * 5
a * 5
# assigning sum
a = a + 10
a
# remove all variables from R's memory
rm(list = ls())
# or click "clear all" in workspace window

# TODO 2
a = ( 2014 - 2007 )
b = ( 2014 - 1987 )
c = (a / b) * 100
c

## 3.3 Scalars, vector, and matrices

# Scalars : 0-dimensional
# Vectors : row of numbers / arrays / 1-dimensional
# Matrix : table, 2-dimensional, (n-dimensional)

# define a vector
# c shorts for 'concatenate'
v = c(3, 4, 5)
v

## 3.4 Functions
# mean computation
(3 + 4 + 5) / 3
# functions save time-effort by automation
# some functions are standard in R, other by packages
b = c(3, 4, 5)
mean(x=b)
# arguments between brackets
# mean(b) will work the same
mean(b)

## TODO 3
t = c(4, 5, 8, 11)
sum(t)

# rnorm, create a random sample from normal distribution
rnorm(10)
# 10 specifies the size of the sample
# output, vector of size 10
# use key (↑) to access to typing history at the R CLI
rnorm(10, mean = 1.2, sd = 3.4)
# arguments mean, sd to specify distribution params
# 10 argument is compulsory, mean and sd optional

# type rnorm() + TAB, to access autompletion / suggestion

## 3.5 Plots
x = rnorm(100)
plot(x)

## TODO 4
x = rnorm(100, mean = 0.0, sd = 1.62)
plot(x)

# 4. Help and Documentation
# Free documentation and help available
help(rnorm) 
# gives help for rnorm function
# fucntion description, arguments, values
example(rnorm)
# gives examples for the function

# HTML-based global help is called with
help.start()

## TODO 5
help(sqrt)

# 5. Scripts
# R, interpreter based laguage that uses CLI
# Store commands in files called 'scrypts'
# files with .R extension
# File / New or Open file...

# Run Selected lines at the Scrypt
# Select line and CTRL + ENTER / Click Run in editor window

# Run whole scypt as 
# source("foo.R")
# CTRL + ENTER + S, Run the whole scrypt

# TODO 6
# new scrypt : firtsscript.R
setwd("/home/q/_15.455x") # set working directory
source("firstscript.R")

# 6. Data Structures

## 6.1 Vectors
# concatenation
vec1 = c(1, 4, 6, 8, 10)
vec1
# access by indexing
vec1[5]
vec1[3]
# sequence function
vec2 = seq(from = 0, to = 1, by = 0.25)
vec2
# sum function
sum(vec1)
# add 2 vector, elementwise
vec1 + vec2

## 6.2 Matrices

# Matrices, 2-dimensional vectors ( n-dimensional )
mat = matrix(data = c(9, 2, 3, 4, 5, 6), ncol = 3)
mat
# arguments: 
# data, specifies numbers in matrix
# ncol, specifies numebr of columns
# nrows, specifies numebr of rows 

# TODO 7
p = seq(from = 31, to = 60, by = 1.0)
q = matrix(data = p, nrow = 6, ncol = 5)
q

# matrix operations
# row, column element
# row 1, col 2
mat[1, 2] # :3
# row 2
mat[2, ] # :2, 4, 6
# mean for the matrix
mean(mat) # :4.833333

## 6.3 DataFrames
# time-series often ordered as dataframes
# data frame is a matrix with named columns
t = data.frame(x = c(11, 12, 14), 
               y = c(19, 20, 21), 
               z = c(10, 9, 7))
t
# mean for column z
mean(t$z)
# or
mean(t[["z"]])

# TODO 8
x1 = c(rnorm(100))
x2 = c(rnorm(100))
x3 = c(rnorm(100))
t = data.frame(a = x1, 
               b = x1+x2, 
               c = x1+x2+x3)
plot(t)
sd(c(t$a, t$b, t$c))

## 6.3 Lists
# list, collection of vectors of different length
L = list(one = 1, two = c(1,2), five = seq(0, 1, length = 5))
# access by name
L$one
L$two
L$five
# print names
names(L)
# add a scalar to a sequence
L$five + 10

# 7. Graphics
# Plotting is an important statistical activity
# R has plotting facilities
plot(rnorm(100), type = "l", col = "gold")
# types : "l", "h"
hist(rnorm(100))

# t$a
plot(t$a, type = "l", 
     ylim = range(t), lwd = 3,
     col = rgb(1, 0, 0, 0, 3))

# t$b
lines(t$b, type="s", lwd = 2,
      col=rgb(0.3, 0.4, 0.3, 0.9))

# t$c
points(t$c, pch = 20, cex = 4, 
       col = rgb(0, 0, 1, 0.3))

# TODO 8
help(rgb)

# plot
# Generic function for plotting of R objects. For more details about 
# the graphical parameter arguments, see par.

# lines
# A generic function taking coordinates given in various ways and 
# joining the corresponding points with line segments.

# points
# points is a generic function to draw a sequence of points at the specified 
# coordinates. The specified character(s) are plotted, centered at the coordinates.

# rgb
# This function creates colors corresponding to the given 
# intensities (between 0 and max) of the red, green and blue primaries. The colour specification refers to the standard sRGB colorspace (IEC standard 61966).

# pch
# plotting ‘character’, i.e., symbol to use. This can either be a single 
# character or an integer code for one of a set of graphics symbols. The full set of S symbols is available with pch = 0:18, see the examples below. (NB: R uses circles instead of the octagons used in S.)

# cex
# character (or symbol) expansion: a numerical vector. This works 
# as a multiple of par("cex").

# lwd
# line width for drawing symbols see par.

# more about formatting help(par)

# copy your plot to a document
# plots window / Export / choose width and height / Copy or Save

# 8. Reading and Writing Data Files
# many ways of r/w data in R
d = data.frame( a = c(3, 4, 5),
                b = c(12, 43, 54))
d
write.table(d, file = "tst0.txt", row.names = FALSE)
d2 = read.table(file = "tst0.txt", header = TRUE)
d2

# TODO 9
x1 = c(2, 2, 2, 2, 2, 2) ^ seq(0, 5, by = 1)
x2 = c(2, 2, 2, 2, 2, 2) ^ seq(1, 6, by = 1)
x3 = c(3, 3, 3, 3, 3, 3) * x1
test = data.frame(a = x1,
                  b = x2,
                  c = x3)
write.table(test, file = "tst2.txt", row.names = FALSE)
test2 = read.table(file = "tst2.txt", header = TRUE)
test2

# 9. Not Available Data

# TODO 10
mean(sqrt(rnorm(100)))
# NA, data point not available
j = c(1, 2, NA)
# compute max with a missing value : NA
max(j)
# use na.rm=TRUE to remove NA
max(j, na.rm = TRUE)

# 10. Classes ( variable type )
# mains : numeric, character, POSIX

## 10.1 Characters
m = "apples"
m
n = pears # error
m + 2 # type error

## 10.2 Dates
date1 = strptime( c("20100225230000",
                    "20100226000000", 
                    "20100226010000"),
                 format="%Y%m%d%H%M%S")
date1
# format : "%Y%m%d%H%M%S"
# Y : year, m : month, d : day, 
# H : Hour, M : minute, S : Second

# TODO 11
# Pending

# 11. Programming tools
# Program Statement

## 11.1 If-statement
# Conditional Execution
w = 3
if (w < 5){
  d = 2
}else{
  d = 10
}
d
# get a subset of a vector
a = c(1, 2, 3, 4)
b = c(5, 6, 7, 8)
f = a[ b == 5 | b == 8]
f
# logical operators
# <, >, !=, <=, >=, &, |

## 11.2 For-loop
# automated computations
# for : what has to be done, how many times
h = seq(from = 1, to = 8)
s = c()

for (i in 2:10){
  s[i] = h[i] * 10
}
s

# TODO 12
h = seq(from = 1, to = 100)
s = c()
for (i in 1:100){
  if ((i < 5) | (i > 90)){
    s[i] = h[i] * 10
  }else{
    s[i] = h[i] * 0.1
  }
}
s

## 11.3 Writing your own functions
# encapsulate computations
fun1 = function(arg1, arg2){
  w = arg1 ^ 2
  return(arg2 + w)
}
fun1(arg1 = 3, arg2 =5)

# TODO 13
fun2 = function(arg1){
  s = c()
  l = length(arg1)
  for (i in 1:l){
    s[i] = sin(i)    
  }
  return(s) 
}
v = seq(from = 0, to = 10, by = 1)
plot(fun2(v), type = "l")

# 12. Some Useful References
## 12.1 Functions

### Data creation
#• read.table: read a table from file. Arguments:
#  header=TRUE: read first line as titles of the
#columns; sep=",": numbers are separated by
#commas; skip=n: don’t read the first n lines.
#• write.table: write a table to file
#• c: paste numbers together to create a vector
#• array: create a vector, Arguments: dim: length
#• matrix: create a matrix, Arguments: ncol
#and/or nrow: number of rows/columns
#• data.frame: create a data frame
#• list: create a list
#• rbind and cbind: combine vectors into a
#matrix by row or column

###Extracting data
#• x[n]: the n th element of a vector
#• x[m:n]: the m th to n th element
#• x[c(k,m,n)]: specific elements
#• x[x>m & x<n]: elements between m and n
#• x$n: element of list or data frame named n
#• x[["n"]]: idem
#• [i,j]: element at i th row and j th column
#• [i,]: row i in a matrix

###Data processing
# • seq: create a vector with equal steps between
#the numbers
#• rnorm: create a vector with random numbers
#with normal distribution (other distributions are
#                          also available)
#• sort: sort elements in increasing order
#• t: transpose a matrix
#• aggregate(x,by=ls(y),FUN="mean"): split
#data set x into subsets (defined by y) and com-
#  putes means of the subsets. Result: a new list.
#• na.approx: interpolate (in zoo package). Ar-
#  gument: vector with NAs. Result: vector without NAs.
#• cumsum: cumulative sum. Result is a vector.
#• rollmean: moving average (in the zoo package)
#• paste: paste character strings together
#• substr: extract part of a character string

### Fitting
#• lm(v1∼v2): linear fit (regression line) between
#vector v1 on the y-axis and v2 on the x-axis
#• nls(v1∼a+b*v2, start=ls(a=1,b=0)): non-
#  linear fit. Should contain equation with variables
#(here v1 and v2 and parameters (here a and b)
#  Information on variables
#  with starting values
#  • length: length of a vector
#  • coef: returns coefficients from a fit
#  • ncol or nrow: number of columns or rows in a • summary: returns all results from a fit
#  matrix
#  • class: class of a variable

###  Plotting
#  • names: names of objects in a list
#  • plot(x): plot x (y-axis) versus index number
#  • print: show variable or character string on the (x-axis) in a new window
#  screen (used in scripts or for-loops)
#  • plot(x,y): plot y (y-axis) versus x (x-axis) in
#  • return: show variable on the screen (used in a new window
#                                         functions)
#  • image(x,y,z): plot z (color scale) versus x
#  • is.na: test if variable is NA
#  (x-axis) and y (y-axis) in a new window
#  • as.numeric or as.character: change class to • lines or points: add lines or points to a
#  number or character string previous plot
#  • strptime: change class from character to • hist: plot histogram of the numbers in a vector
#  date-time (POSIX)
#  • barplot: bar plot of vector or data frame
#  • contour(x,y,z): contour plot

###  Statistics
#  • abline: draw line (segment). Arguments: a,b
#  • sum: sum of a vector (or matrix)
#  for intercept a and slope b; or h=y for horizontal
#  • mean: mean of a vector
#  line at y; or v=x for vertical line at x.
#  • sd: standard deviation of a vector
#  • curve: add function to plot. Needs to have an
#  11x in the expression. Example: curve(x^2)
# • legend: add legend with given symbols (lty or pch and col) and text (legend) at location
#  (x="topright")
#  • axis: add axis. Arguments: side – 1=bottom,
#  2=left, 3=top, 4=right
#  • mtext: add text on axis. Arguments: text
#  (character string) and side
#  • grid: add grid
#  • par: plotting parameters to be specified before
#  the plots. Arguments: e.g. mfrow=c(1,3)):
#  number of figures per page (1 row, 3 columns);
#  new=TRUE: draw plot over previous plot.

### Plotting parameters
# These can be added as arguments to plot, lines,
# image, etc. For help see par.
# • type: "l"=lines, "p"=points, etc.
# • col: color – "blue", "red", etc
# • lty: line type – 1=solid, 2=dashed, etc.
# • pch: point type – 1=circle, 2=triangle, etc.
# • main: title - character string
# • xlab and ylab: axis labels – character string
# • xlim and ylim: range of axes – e.g. c(1,10)
# • log: logarithmic axis – "x", "y" or "xy"

### Programming
# • function(arglist){expr}: function definition: do expr with list of arguments arglist
# • if(cond){expr1}else{expr2}: if-statement:
#   if cond is true, then expr1, else expr2
# • for(var in vec) {expr}:
#   for-loop:
#   the counter var runs through the vector vec and does
#  e xpr each run
# • while(cond){expr}: while-loop: while cond is true, do expr each run

## 12.2 Keyboard shortcuts
#There are several useful keyboard shortcuts for
# RStudio (see Help → Keyboard Shortcuts):
#  • CRL+ENTER: send commands from script window to command window
# • ↑ or ↓ in command window: previous or next command
# • CTRL+1, CTRL+2, etc.: change between the windows
# Not R-specific, but very useful keyboard short-cuts:
#  • CTRL+C, CTRL+X and CTRL+V: copy, cut and paste
# • ALT+TAB: change to another program window
# • ↑, ↓, ← or →: move cursor
# • HOME or END: move cursor to begin or end of line
# • Page Up or Page Down: move cursor one page up or down
# • SHIFT+↑/↓/←/→/HOME/END/PgUp/PgDn: select

## 12.3 Error messages
# • No such file or directory or Cannot change working directory
# Make sure the working directory and file names are correct.
# • Object ‘x’ not found
# The variable x has not been defined yet. Define x or write apostrophes 
# if x should be a character string.
# • Argument ‘x’ is missing without default
# You didn’t specify the compulsory argument x.
# • +
#  R is still busy with something or you forgot
# closing brackets. Wait, type } or ) or press ESC.
# • Unexpected ’)’ in ")" or Unexpected ’}’
# in "}"
# The opposite of the previous. You try to close something which hasn’t been 
# opened yet. Add opening brackets.
# • Unexpected ‘else’ in "else"
# Put the else of an if-statement on the same line
# as the last bracket of the “then”-part: }else{.
#   • Missing value where TRUE/FALSE needed
#   Something goes wrong in the condition-part
#   (if(x==1)) of an if-statement. Is x NA?
#     •  The condition has length > 1 and onlythe first element will be used
# In the condition-part (if(x==1)) of an if-
#`` statement, a vector is compared with a scalar. Is
# x a vector? Did you mean x[i]?
#   • Non-numeric argument to binary operator
#   You are trying to do computations with something
#   which is not a number. Use class(...) to find
#   out what went wrong or use as.numeric(...) to
#   transform the variable to a number.
#   • Argument is of length zero or Replacement
#   is of length zero
#   The variable in question is NULL, which means
#   that it is empty, for example created by c().
#   Check the definition of the variable.
