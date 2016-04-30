setwd("D:/myspace/R/final")

numDispach<-read.csv("D:/myspace/R/final/uber-raw-data-janjune-15.csv")

LocationList<-read.csv("D:/myspace/R/final/ZipCode.csv")



library(lubridate)
help("lubridate")
try2<-ymd_hms(numDispach$Pickup_date)

year<-year(try2)
month<-month(try2)
day<-day(try2)
hour<-hour(try2)
minute<-minute(try2)

result<-cbind(numDispach,year,month,day,hour,minute)

write.csv(result, "Result1.csv")

myvars <- names(result) %in% c("Pickup_date") 
mudata<-result[!myvars]




require(sqldf)

minuteRange<-sqldf("select * from mudata  join LocationList on mudata.locationID = LocationList.LocationID")


write.csv(minuteRange,"areaPredict.csv")


areaZone<-sqldf("select Dispatching_base_num,Affiliated_base_num,locationID,year,month, day, hour, minute,  Borough , Zone ,Add,ZipCode  from minuteRange group by year,month, day, hour ")

myvar <- names(minuteRange) %in% c("Dispatching_base_num", "Affiliated_base_num", "locationID","year","month", "day","hour", "minute","Borough","Zone","Add","ZipCode") 

spec<-minuteRange[myvar]



fiftyUberDay<-sqldf("select Dispatching_base_num,year,month, day,  count(*) from spec where month> 3 group by Dispatching_base_num,year,month, day")
fiftyUberMonth<-sqldf("select Dispatching_base_num,year,month,  count(*) from spec where month> 3 group by Dispatching_base_num,year,month")


write.csv(fiftyUberDay,"fiftyday.csv")
write.csv(fiftyUberMonth,"fiftyMonth.csv")

countZoune<-sqldf("select Dispatching_base_num,Affiliated_base_num, count(*) as numOutput,locationID,year,month, day, hour,  Borough , Zone , ZipCode  from spec group by locationID,year,month, day, hour")

minuteZone<-sqldf("select Dispatching_base_num,Affiliated_base_num, count(*) as numOutput,locationID,year,month, day, hour,  Borough , Zone , ZipCode  from spec group by locationID,year,month, day, hour,minute")

DayZone<-sqldf("select Dispatching_base_num,Affiliated_base_num, count(*) as numOutput,locationID,year,month, day,  Borough , Zone , ZipCode  from spec group by locationID,year,month, day")


write.csv(countZoune,"areaAnalysis.csv")

write.csv(minuteZone,"DriveModel.csv")

write.csv(DayZone,"Dayzone.csv")
##merge data in 2014

a = list.files("uber-trip-data")   #list.files命令将blog文件夹下所有文件名输入a  

dir = paste("./uber-trip-data/",a,sep="")     #用paste命令构建路径变量dir   

n = length(dir)             #读取dir长度，也就是文件夹下的文件个数

merge.data = read.csv(file = dir[1],header=T,sep=",")   
#读入第一个文件内容（可以不用先读一个，但是为了简单，省去定义data.frame的时间
#，我选择先读入一个文件。


for (i in 2:n){
  new.data = read.csv(file = dir[i], header=T, sep=",")
  merge.data = rbind(merge.data,new.data)
}

write.csv(merge.data,file = "./merge.csv",row.names=F) 


BaseData<-mdy_hms(merge.data$Date.Time)

year<-year(BaseData)
month<-month(BaseData)
day<-day(BaseData)
hour<-hour(BaseData)
minute<-minute(BaseData)
second<-second(BaseData)


baseResult<-cbind(merge.data,year,month,day,hour,minute,second)



write.csv(baseResult,"Basedata.csv")


## reverse DateTime
countBase<-sqldf("select Date.Time,Lat, Lon, Base, year, month, day, hour, minute,count(*) as numout, area  from baseResult group by  Date.Time,Lat, Lon, Base, year, month, day, hour, minute")




##merge data in 2014

a = list.files("test")   #list.files命令将blog文件夹下所有文件名输入a  

dir = paste("./test/",a,sep="")     #用paste命令构建路径变量dir   

n = length(dir)             #读取dir长度，也就是文件夹下的文件个数

merge.data = read.csv(file = dir[1],header=T,sep=",")   
#读入第一个文件内容（可以不用先读一个，但是为了简单，省去定义data.frame的时间
#，我选择先读入一个文件。


for (i in 2:n){
  new.data = read.csv(file = dir[i], header=T, sep=",")
  merge.data = rbind(merge.data,new.data)
}

yiwu1<-na.omit(merge.data)

write.csv(yiwu,file = "./yiwu1.csv",row.names=F) 



try3<-ymd_hm(yiwu1$DateUTC,tz = "America/New_York")

Date<- with_tz(try3, "America/Adak")

timeResult<-cbind(yiwu1,Date)




BaseData<-timeResult$Date

year<-year(BaseData)
month<-month(BaseData)
day<-day(BaseData)
hour<-hour(BaseData)
minute<-minute(BaseData)
second<-second(BaseData)

baseResult<-cbind(timeResult,year,month,day,hour,minute,second)


write.csv(baseResult,"simpledata.csv")


weather1<-read.csv("simpledata.csv")
weawar<-names(weather1)%in% c("Date","TemperatureF","Preci","Events","Conditions","year", "month", "day", "hour") 
deal1<-weather1[weawar]

deal<-rbind(deal1,deal2)

deal<-na.omit(deal)

try3<-ymd_hm(yisidata$DateUTC,tz = "America/New_York")

Date<- with_tz(try3, "America/Anchorage")

timeResult<-cbind(yisidata,Date)

BaseData<-timeResult$Date

year<-year(BaseData)
month<-month(BaseData)
day<-day(BaseData)
hour<-hour(BaseData)
minute<-minute(BaseData)
second<-second(BaseData)

baseResult<-cbind(timeResult,year,month,day,hour,minute,second)


myvars <- names(baseResult) %in% c("Date.Time","Lat","Lon") 


UberData<-baseResult[!myvars]

## reverse DateTime
UberDayData<-sqldf("select  Base, year, month, day, hour, minute,count(*) as numout  from baseResult group by  Base, year, month, day")

UberMonthData<-sqldf("select  Base, year, month, day, hour, minute,count(*) as numout  from baseResult group by  Base, year, month")


write.csv(UberDayData,"fourtyDay.csv")

write.csv(UberMonthData,"fourtyMonth.csv")

herevars<-names(countZoune) %in% c("Date.Time","Lat","Lon")




##merge data in 2014

a = list.files("yiwu")   #list.files命令将blog文件夹下所有文件名输入a  

dir = paste("./yiwu/",a,sep="")     #用paste命令构建路径变量dir   

n = length(dir)             #读取dir长度，也就是文件夹下的文件个数

merge.data = read.csv(file = dir[1],header=T,sep=",")   
#读入第一个文件内容（可以不用先读一个，但是为了简单，省去定义data.frame的时间
#，我选择先读入一个文件。


for (i in 2:n){
  new.data = read.csv(file = dir[i], header=T, sep=",")
  merge.data = rbind(merge.data,new.data)
}

yiwu<-na.omit(merge.data)

write.csv(yiwu,file = "./weather.csv",row.names=F) 


try3<-ymd_hm(yiwu$DateUTC,tz = "America/New_York")

Date<- with_tz(try3, "America/Anchorage")

timeResult<-cbind(yiwu,Date)

BaseData<-timeResult$Date

year<-year(BaseData)
month<-month(BaseData)
day<-day(BaseData)
hour<-hour(BaseData)
minute<-minute(BaseData)
second<-second(BaseData)

baseResult<-cbind(timeResult,year,month,day,hour,minute,second)


write.csv(baseResult,"weather.csv")

baseResult<-read.csv("weather.csv")

weawar<-names(baseResult)%in% c("Date","TemperatureF","Preci","Events","Conditions","year", "month", "day", "hour") 

deal2<-baseResult[weawar]


UberDayData<-sqldf("select  Base, year, month, day, hour, minute,sum(minute) as numout  from baseResult group by  Base, year, month, day")





install.packages("ggmap")

library(ggmap)

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





getOne<-read.csv("Date.csv")
BaseData<-ymd(getOne$Date)

year<-year(BaseData)
month<-month(BaseData)
day<-day(BaseData)

holiday<-cbind(getOne,year,month,day)

material<-sqldf("select * from daynew join holiday where daynew.month = holiday.month and daynew.day= holiday.day")

write.csv(material,"chedan.csv")

material=read.csv("chedan.csv")

hourfiftyFinal<-sqldf("select * from countZoune join material where countZoune.month = material.month and countZoune.day= material.day and countZoune.hour= material.hour")


dayfiftyFinal<-sqldf("select * from DayZone join material where DayZone.month = material.month and DayZone.day= material.day" )

write.csv(hourfiftyFinal,"fiftyHourly.csv")
write.csv(dayfiftyFinal,"dayfifty.csv")



dayweather<-read.csv("dayWeather15.csv")
BaseData<-ymd(dayweather$EST)

year<-year(BaseData)
month<-month(BaseData)
day<-day(BaseData)

daynew<-cbind(dayweather,year,month,day)





dayfiftyFinal<-sqldf("select * from DayZone join baseResult where DayZone.month = baseResult.month and DayZone.day= baseResult.day" )
