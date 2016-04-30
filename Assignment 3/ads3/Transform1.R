path = "/Users/songzhezhang/Documents/2016 Spring/info7390/Assignment& Mid-term/Assignment3/COB Interval data 2014/CY2014 COB Interval data 1"

setwd(path)

filenames <- list.files(path = "/Users/songzhezhang/Documents/2016 Spring/info7390/Assignment& Mid-term/Assignment3 /COB Interval data 2014/CY2014 COB Interval data 1",pattern = "*.csv")
filenamesChannel3 <- list.files(path = "/Users/songzhezhang/Documents/2016 Spring/info7390/Assignment& Mid-term/Assignment3 /COB Interval data 2014/3 channel",pattern = "*.csv")
filenamesChannel7 <- list.files(path = "/Users/songzhezhang/Documents/2016 Spring/info7390/Assignment& Mid-term/Assignment3 /COB Interval data 2014/7",pattern = "*.csv") 
filenamesChannel5 <- list.files(path = "/Users/songzhezhang/Documents/2016 Spring/info7390/Assignment& Mid-term/Assignment3 /COB Interval data 2014/5",pattern = "*.csv")
filenamesSub <- filenames[3]


 result1 <- formateFunfile12(filenames[1])
 
 result2 <- formateFunfile12(filenames[2])
 result12 <- rbind(result1,result2)
 result <- calhourFun(result12)

for(fn in filenamesSub){
  resultTemp <- formateFun(fn)
  resultTemp2 <- calhourFun(resultTemp)
  result<- rbind(result,resultTemp2)
}
 
 filenamesSub <- filenamesChannel7
 for(fn in filenamesSub){
   resultTemp <- formateFunfile7(fn)
   resultTemp2 <- calhourFun(resultTemp)
   result<- rbind(result,resultTemp2)
 } 
 
 filenamesSub <- filenamesChannel5[1:3]
 
 for(fn in filenamesSub){
   resultTemp <- formateFunfile5(fn)
   resultTemp2 <- calhourFun(resultTemp)
   result<- rbind(result,resultTemp2)
 } 
 
 filenamesSub <- filenamesChannel5[4:6]
 
 for(fn in filenamesSub){
   resultTemp <- formateFunfile52(fn)
   resultTemp2 <- calhourFun(resultTemp)
   result<- rbind(result,resultTemp2)
 } 
 write.csv(result,"result.csv",row.names=FALSE, na="")
 