#install multiple packages
install.packages(c("tidyverse","dslabs"))
library(dslabs)


#####SEC01

#show the name of all objects
ls()
Print()

help("+")
?"+"
data()

#show type of data object
class()
str()
names()
length()
levels() #show the categories in the factor
length(level()) #number of different categories in the attribute

table(murders$region)
head()

seq(start, end, length.out = )
seq(start, end, distance)

a<- 2
b<- -1
c<- -4
(-b + sqrt(b^2 - 4*a*c))/(2*a)
(-b - sqrt(b^2 - 4*a*c))/(2*a)




#####SEC02
# We can also name the elements of a numeric vector using the names() function
codes <- c(380, 124, 818)
country <- c("italy","canada","egypt")
names(codes) <- country
codes[c(1,3)]
codes[1:2]

as.character()
as.numeric()


####SEC03
sort() #from smallest to biggest
order() #index of the sort in the regular data
rank()

max(murders$total)    # highest number of total murders
i_max <- which.max(murders$total)    # index with highest number of murders
murders$state[i_max]  

# The name of the state with the maximum population is found by doing the following
murders$state[which.max(murders$population)]

# ordering the states by murder rate, in decreasing order
murders$state[order(murder_rate, decreasing=TRUE)]




######SEC03

# creating a logical vector that specifies if the murder rate in that state is less than or equal to 0.71
index <- murder_rate <= 0.71
# determining which states have murder rates less than or equal to 0.71
murders$state[index]
# calculating how many states have a murder rate less than or equal to 0.71
sum(index)

# creating the two logical vectors representing our conditions
west <- murders$region == "West"
safe <- murder_rate <= 1
# defining an index and identifying states with both conditions true
index <- safe & west
murders$state[index]

x <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)
which(x)    # returns indices that are TRUE

# to determine the murder rate in Massachusetts we may do the following
index <- which(murders$state == "Massachusetts")
index
murder_rate[index]

# to obtain the indices and subsequent murder rates of New York, Florida, Texas, we do:
index <- match(c("New York", "Florida", "Texas"), murders$state)
index
murders$state[index]
murder_rate[index]

x <- c("a", "b", "c", "d", "e")
y <- c("a", "d", "f")
y %in% x

# to see if Boston, Dakota, and Washington are states
c("Boston", "Dakota", "Washington") %in% murders$state


#DATA Wragling
# installing and loading the dplyr package
install.packages("dplyr")
library(dplyr)
# subsetting with filter
filter(murders, rate <= 0.71)

# selecting columns with select
new_table <- select(murders, state, region, rate)

# using the pipe
murders %>% select(state, region, rate) %>% filter(rate <= 0.71)

# Use filter to create a new data frame no_south
no_south <- filter(murders,murders$region != "South")
no_south
# Create a new data frame called murders_nw with only the states from the northeast and the west
murders_nw <- filter(murders, region %in% c("Northeast","West"))
# Number of states (rows) in this category 
nrow(murders_nw)




# creating a data frame with stringAsFactors = FALSE
grades <- data.frame(names = c("John", "Juan", "Jean", "Yao"), 
                     exam_1 = c(95, 80, 90, 85), 
                     exam_2 = c(90, 85, 85, 90),
                     stringsAsFactors = FALSE)

##BASIC PLOT
# a simple scatterplot of total murders versus population
x <- murders$population /10^6
y <- murders$total
plot(x, y)

# a histogram of murder rates
hist(murders$rate)

# boxplots of murder rates by region
boxplot(rate~region, data = murders)



