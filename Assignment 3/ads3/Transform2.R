

formateFun <- function(filename){
  #get catergroy and building
  listTitle <- unlist(strsplit(filename, "\\."))
  
  listTitle
  
  Catergroy <- unlist(strsplit(listTitle[1],"-"))[2]
  
  Catergroy
  
  building <- listTitle[2]
  
  building
  
  #transponse column sucessful
  rowdata <- read.csv(filename,header = FALSE)
  
  titlerow <- rowdata[1,]
  
  titlerow1 <- titlerow[,c(-1,-2,-3,-4)]
  titlecolumn <- t(titlerow1)
  dateTemp <- rowdata[1,2]
  matrixTemp <- titlecolumn
  firstTime <- TRUE
  
  for (i in 2:nrow(rowdata)){
    if(rowdata[i,2] != dateTemp){
      if(!firstTime){
        result <- rbind(result,matrixTemp) 
      }
      if (i != 2 && firstTime){
        result <- matrixTemp
        firstTime <- FALSE
      }
      
      matrixTemp <- titlecolumn
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,1],length(titlecolumn))))
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,2],length(titlecolumn))))
    }
    
    matrixTemp <- cbind(matrixTemp,t(rowdata[i,c(-1,-2,-3,-4)]))
    
    
    
    
    dateTemp = rowdata[i,2]
    
    if(i == nrow(rowdata)){
      result <- rbind(result,matrixTemp)
    }
  }
  
  
  #Add Catergory and Building to dataset  
  numRows <- nrow(result)
  
  result <- cbind(result, matrix(rep(Catergroy,numRows)))
  
  result <- cbind(result, matrix(rep(building,numRows)))
  
  
  #Derive day month year 
  listDate <- result[,3]
  
  dayFun <- function(x) {
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[2]
  }
  
  monthFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[1]
  }
  
  yearFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[3]
  }
  
  listDay <- lapply(listDate, dayFun)
  
  listMonth <- lapply(listDate, monthFun)
  
  listYear<- lapply(listDate, yearFun)
  
  result <- cbind(result,listDay)
  
  result <- cbind(result,listMonth,listYear)
  
}

calhourFun <- function(dataset){
  
  kwh <- 0.0
  pf <- 0.0
  kvarh <- 0.0
  hourTemp <- "0"
  firstTime <- TRUE
  n <- 0
  for(i in 1:nrow(dataset)){
    time <- dataset[i,1]
    hour <- unlist(strsplit(toString(time),split = ":"))[1]
    
    kwh <- kwh + as.double(dataset[i,4])
    pf <- pf + as.double(dataset[i,5])
    kvarh <- kvarh + as.double(dataset[i,6])
    
    n<- n + 1
    if(hourTemp != hour && hour != 0){
      rowTemp <- matrix(dataset[i,])
      rowTemp <- t(rowTemp)
      rowTemp[1,4] <- kwh
      rowTemp[1,5] <- pf/n
      rowTemp[1,6] <- kvarh
      
      kwh <- 0.0
      pf <- 0.0
      kvarh <- 0.0
      n<-0
      if( firstTime ){
        result <- rowTemp
        firstTime <- FALSE
      }
      else{
        result <- rbind(result,rowTemp)
      }
      
      hourTemp <- hour
      
    }
    
    
  }
  
  colnames(result) <- c("Time","Account", "Date","kWh","Power_Factor","kVRAh","Catergroy","Building","Day","Month","Year")
  result
}

formateFunfile12 <- function(filename){
  Catergroy = "SCH"
  
  building = "AGASSIZ"
  
  
  rowdata <- read.csv(file = filename,header = FALSE)
  
  titlerow <- rowdata[1,]
  
  titlerow1 <- titlerow[,c(-1,-2,-3,-4)]
  titlecolumn <- t(titlerow1)
  dateTemp <- rowdata[1,2]
  matrixTemp <- titlecolumn
  firstTime <- TRUE
  
  for (i in 2:nrow(rowdata)){
    if(rowdata[i,2] != dateTemp){
      if(!firstTime){
        result <- rbind(result,matrixTemp) 
      }
      if (i != 2 && firstTime){
        result <- matrixTemp
        firstTime <- FALSE
      }
      
      matrixTemp <- titlecolumn
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,1],length(titlecolumn))))
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,2],length(titlecolumn))))
    }
    
    matrixTemp <- cbind(matrixTemp,t(rowdata[i,c(-1,-2,-3,-4)]))
    
    
    
    
    dateTemp = rowdata[i,2]
    
    if(i == nrow(rowdata)){
      result <- rbind(result,matrixTemp)
    }
  }
  
  
  #Add Catergory and Building to dataset  
  numRows <- nrow(result)
  
  result <- cbind(result, matrix(rep(Catergroy,numRows)))
  
  result <- cbind(result, matrix(rep(building,numRows)))
  
  
  #Derive day month year 
  listDate <- result[,3]
  
  dayFun <- function(x) {
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[2]
  }
  
  monthFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[1]
  }
  
  yearFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[3]
  }
  
  listDay <- lapply(listDate, dayFun)
  
  listMonth <- lapply(listDate, monthFun)
  
  listYear<- lapply(listDate, yearFun)
  
  
  result <- cbind(result,listDay,listMonth,listYear)
  
  #unique row
  uniqueRow<- data.frame(a = 1:nrow(result))
  rownames(result)<- uniqueRow[,1]
  
  # combin kwh
  kwh <- as.numeric(result[,4]) + as.numeric(result[,7])
  # combin kVARh
  kVARh <- as.numeric(result[,6]) + as.numeric(result[,8])
  result <- cbind(result,kwh,kVARh)
  
  result <- result[,c(-4,-6,-7,-8,-9,-10)]
  
  result <- result[,c((1:3),10,4,11,(5:9))]
  
  colnames(result) <- c("Time","Account", "Date","kWh","Power_Factor","kVRAh","Catergroy","Building","Day","Month","Year")
  result 
}

formateFunfile7 <- function(filename){
  listTitle <- unlist(strsplit(filename, "\\."))
  

  
  Catergroy <- unlist(strsplit(listTitle[1],"-"))[2]
  
 
  
  building <- listTitle[2]
  

  
  rowdata <- read.csv(file = filename,header = FALSE)
  
  titlerow <- rowdata[1,]
  
  titlerow1 <- titlerow[,c(-1,-2,-3,-4)]
  titlecolumn <- t(titlerow1)
  dateTemp <- rowdata[1,2]
  matrixTemp <- titlecolumn
  firstTime <- TRUE
  
  for (i in 2:nrow(rowdata)){
    if(rowdata[i,2] != dateTemp){
      if(!firstTime){
        result <- rbind(result,matrixTemp) 
      }
      if (i != 2 && firstTime){
        result <- matrixTemp
        firstTime <- FALSE
      }
      
      matrixTemp <- titlecolumn
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,1],length(titlecolumn))))
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,2],length(titlecolumn))))
    }
    
    matrixTemp <- cbind(matrixTemp,t(rowdata[i,c(-1,-2,-3,-4)]))
    
    
    
    
    dateTemp = rowdata[i,2]
    
    if(i == nrow(rowdata)){
      result <- rbind(result,matrixTemp)
    }
  }
  
  
  #Add Catergory and Building to dataset  
  numRows <- nrow(result)
  
  result <- cbind(result, matrix(rep(Catergroy,numRows)))
  
  result <- cbind(result, matrix(rep(building,numRows)))
  
  
  #Derive day month year 
  listDate <- result[,3]
  
  dayFun <- function(x) {
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[2]
  }
  
  monthFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[1]
  }
  
  yearFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[3]
  }
  
  listDay <- lapply(listDate, dayFun)
  
  listMonth <- lapply(listDate, monthFun)
  
  listYear<- lapply(listDate, yearFun)
  
  
  result <- cbind(result,listDay,listMonth,listYear)
  
  #unique row
  uniqueRow<- data.frame(a = 1:nrow(result))
  rownames(result)<- uniqueRow[,1]
  
  # combin kwh
  kwh <- as.numeric(result[,4]) + as.numeric(result[,7])
  # combin kVARh
  kVARh <- as.numeric(result[,6]) + as.numeric(result[,8])
  result <- cbind(result,kwh,kVARh)
  
  result <- result[,c(-4,-6,-7,-8,-9,-10)]
  
  result <- result[,c((1:3),10,4,11,(5:9))]
  
  colnames(result) <- c("Time","Account", "Date","kWh","Power_Factor","kVRAh","Catergroy","Building","Day","Month","Year")
  result 
}

formateFunfile51 <- function(filename){
  listTitle <- unlist(strsplit(filename, "\\."))
  
  
  
  Catergroy <- unlist(strsplit(listTitle[1],"-"))[2]
  
  
  
  building <- listTitle[2]
  
  
  
  rowdata <- read.csv(file = filename,header = FALSE)
  
  titlerow <- rowdata[1,]
  
  titlerow1 <- titlerow[,c(-1,-2,-3,-4)]
  titlecolumn <- t(titlerow1)
  dateTemp <- rowdata[1,2]
  matrixTemp <- titlecolumn
  firstTime <- TRUE
  
  for (i in 2:nrow(rowdata)){
    if(rowdata[i,2] != dateTemp){
      if(!firstTime){
        result <- rbind(result,matrixTemp) 
      }
      if (i != 2 && firstTime){
        result <- matrixTemp
        firstTime <- FALSE
      }
      
      matrixTemp <- titlecolumn
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,1],length(titlecolumn))))
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,2],length(titlecolumn))))
    }
    
    matrixTemp <- cbind(matrixTemp,t(rowdata[i,c(-1,-2,-3,-4)]))
    
    
    
    
    dateTemp = rowdata[i,2]
    
    if(i == nrow(rowdata)){
      result <- rbind(result,matrixTemp)
    }
  }
  
  
  #Add Catergory and Building to dataset  
  numRows <- nrow(result)
  
  result <- cbind(result, matrix(rep(Catergroy,numRows)))
  
  result <- cbind(result, matrix(rep(building,numRows)))
  
  
  #Derive day month year 
  listDate <- result[,3]
  
  dayFun <- function(x) {
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[2]
  }
  
  monthFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[1]
  }
  
  yearFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[3]
  }
  
  listDay <- lapply(listDate, dayFun)
  
  listMonth <- lapply(listDate, monthFun)
  
  listYear<- lapply(listDate, yearFun)
  
  
  result <- cbind(result,listDay,listMonth,listYear)
  
  #unique row
  uniqueRow<- data.frame(a = 1:nrow(result))
  rownames(result)<- uniqueRow[,1]
  
  
  result <- result[,c(-4,-5)]
  

  colnames(result) <- c("Time","Account", "Date","kWh","Power_Factor","kVRAh","Catergroy","Building","Day","Month","Year")
  result 
}

formateFunfile52 <- function(filename){
  listTitle <- unlist(strsplit(filename, "\\."))
  
  
  
  Catergroy <- unlist(strsplit(listTitle[1],"-"))[2]
  
  
  
  building <- listTitle[2]
  
  
  
  rowdata <- read.csv(file = filename,header = FALSE)
  
  titlerow <- rowdata[1,]
  
  titlerow1 <- titlerow[,c(-1,-2,-3,-4)]
  titlecolumn <- t(titlerow1)
  dateTemp <- rowdata[1,2]
  matrixTemp <- titlecolumn
  firstTime <- TRUE
  
  for (i in 2:nrow(rowdata)){
    if(rowdata[i,2] != dateTemp){
      if(!firstTime){
        result <- rbind(result,matrixTemp) 
      }
      if (i != 2 && firstTime){
        result <- matrixTemp
        firstTime <- FALSE
      }
      
      matrixTemp <- titlecolumn
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,1],length(titlecolumn))))
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,2],length(titlecolumn))))
    }
    
    matrixTemp <- cbind(matrixTemp,t(rowdata[i,c(-1,-2,-3,-4)]))
    
    
    
    
    dateTemp = rowdata[i,2]
    
    if(i == nrow(rowdata)){
      result <- rbind(result,matrixTemp)
    }
  }
  
  
  #Add Catergory and Building to dataset  
  numRows <- nrow(result)
  
  result <- cbind(result, matrix(rep(Catergroy,numRows)))
  
  result <- cbind(result, matrix(rep(building,numRows)))
  
  
  #Derive day month year 
  listDate <- result[,3]
  
  dayFun <- function(x) {
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[2]
  }
  
  monthFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[1]
  }
  
  yearFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[3]
  }
  
  listDay <- lapply(listDate, dayFun)
  
  listMonth <- lapply(listDate, monthFun)
  
  listYear<- lapply(listDate, yearFun)
  
  
  result <- cbind(result,listDay,listMonth,listYear)
  
  #unique row
  uniqueRow<- data.frame(a = 1:nrow(result))
  rownames(result)<- uniqueRow[,1]
  
  
  result <- result[,c(-7,-8)]
  
  
  colnames(result) <- c("Time","Account", "Date","kWh","Power_Factor","kVRAh","Catergroy","Building","Day","Month","Year")
  result 
}

formateFunfile9 <- function(filename){
  listTitle <- unlist(strsplit(filename, "\\."))
  
  
  
  Catergroy <- unlist(strsplit(listTitle[1],"-"))[2]
  
  
  
  building <- listTitle[2]
  
  
  
  rowdata <- read.csv(file = filename,header = FALSE)
  
  titlerow <- rowdata[1,]
  
  titlerow1 <- titlerow[,c(-1,-2,-3,-4)]
  titlecolumn <- t(titlerow1)
  dateTemp <- rowdata[1,2]
  matrixTemp <- titlecolumn
  firstTime <- TRUE
  
  for (i in 2:nrow(rowdata)){
    if(rowdata[i,2] != dateTemp){
      if(!firstTime){
        result <- rbind(result,matrixTemp) 
      }
      if (i != 2 && firstTime){
        result <- matrixTemp
        firstTime <- FALSE
      }
      
      matrixTemp <- titlecolumn
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,1],length(titlecolumn))))
      matrixTemp <- cbind(matrixTemp, matrix(rep(rowdata[i,2],length(titlecolumn))))
    }
    
    matrixTemp <- cbind(matrixTemp,t(rowdata[i,c(-1,-2,-3,-4)]))
    
    
    
    
    dateTemp = rowdata[i,2]
    
    if(i == nrow(rowdata)){
      result <- rbind(result,matrixTemp)
    }
  }
  
  
  #Add Catergory and Building to dataset  
  numRows <- nrow(result)
  
  result <- cbind(result, matrix(rep(Catergroy,numRows)))
  
  result <- cbind(result, matrix(rep(building,numRows)))
  
  
  #Derive day month year 
  listDate <- result[,3]
  
  dayFun <- function(x) {
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[2]
  }
  
  monthFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[1]
  }
  
  yearFun <- function(x){
    listTemp <- unlist(strsplit(x,"/"))
    listTemp[3]
  }
  
  listDay <- lapply(listDate, dayFun)
  
  listMonth <- lapply(listDate, monthFun)
  
  listYear<- lapply(listDate, yearFun)
  
  
  result <- cbind(result,listDay,listMonth,listYear)
  
  #unique row
  uniqueRow<- data.frame(a = 1:nrow(result))
  rownames(result)<- uniqueRow[,1]
  
  
  result <- result[,c(-7,-8,-9,-10,-11,-12)]
  
  
  colnames(result) <- c("Time","Account", "Date","kWh","Power_Factor","kVRAh","Catergroy","Building","Day","Month","Year")
  result 
}