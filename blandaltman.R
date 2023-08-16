#libraries
install.packages(c("ggplot2", "BlandAltmanLeh", "dplyr"))
library(ggplot2)
library(BlandAltmanLeh)
library(dplyr)

# Set random seed for reproducibility
set.seed(123)

# Number of data points
n <- 100

# Create synthetic data
a <- rnorm(n, mean = 50, sd = 10)
b <- a + rnorm(n, mean = 0, sd = 5)
c <- a + rnorm(n, mean = 90, sd = 15)

# Combine data into a data frame for first ba plot
blanda <- data.frame(a, b)

#create new column for average measurement
blanda$a = as.numeric(blanda$a)
blanda$b = as.numeric(blanda$b)
blanda$avg <- rowMeans(blanda) 

#measure a and b
#create new column for difference in measurements
blanda$diff <- blanda$a - blanda$b

#view first six rows of data
head(blanda)

#find average difference
mean_diff <- mean(blanda$diff)
mean_diff

lower1 <- mean_diff - 1.96*sd(blanda$diff)
lower1

upper1 <- mean_diff + 1.96*sd(blanda$diff)
upper1

x1 <- ggplot(blanda, aes(x = avg, y = diff)) +
  geom_point(size=1) +
  geom_hline(yintercept = mean_diff1) +
  geom_hline(yintercept = lower1, color = "red", linetype="dashed") +
  geom_hline(yintercept = upper1, color = "red", linetype="dashed") +
  ylab("Difference Between Measurements") +
  xlab("Average Measurement") +
  theme_bw()
plot(x1)

# Combine data into a data frame for second ba plot
blandb <- data.frame(a, c)

#create new column for average measurement
blandb$a = as.numeric(blandb$a)
blandb$c = as.numeric(blandb$c)
blandb$avg <- rowMeans(blandb) 

#measure a and b
#create new column for difference in measurements
blandb$diff <- blandb$a - blandb$c

#view first six rows of data
head(blandb)

#find average difference
mean_diff2 <- mean(blandb$diff)
mean_diff2

lower2 <- mean_diff2 - 1.96*sd(blandb$diff)
lower2

upper2 <- mean_diff2 + 1.96*sd(blandb$diff)
upper2

x2 <- ggplot(blandb, aes(x = avg, y = diff)) +
  geom_point(size=1) +
  geom_hline(yintercept = mean_diff2) +
  geom_hline(yintercept = lower2, color = "red", linetype="dashed") +
  geom_hline(yintercept = upper2, color = "red", linetype="dashed") +
  ylab("Difference Between Measurements") +
  xlab("Average Measurement") +
  theme_bw()
plot(x2)

