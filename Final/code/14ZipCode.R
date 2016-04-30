apr <- read.csv("uber-raw-data-apr14.csv")

zip <- matrix()

i <-1
for(i in 1:nrow(apr)){
  address3 <- revgeocode(c(apr[i,3],apr[i,2]), output = "more")
  if (length(address3$postal_code) == 0) {
    temp <- matrix("N/A")
  }
  else{
    temp <- matrix(address3$postal_code)
  }
  
  zip<- rbind(zip,temp)
  
}

nrow(apr)
nrow(zip)
c(apr[i,3],apr[i,2])

