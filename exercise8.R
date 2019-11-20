#part1
#to sort by team:
UWpts<-subset(UWvMSU_1_22_13_txt,UWvMSU_1_22_13_txt$team == "UW")
help(subset)
MSUpts<-subset(UWvMSU_1_22_13_txt,UWvMSU_1_22_13_txt$team == "MSU")

#creating a vector for *MSU's point tally*
i=0
MSUtally<-0
for (i in 1:27){
  MSUtally<<-append(MSUpts$score[i]+MSUtally[i],MSUtally,after = 0)
}

#creating a vector for *UW's point tally*
i=0
UWtally<-0
for (i in 1:23){
  UWtally<<-append(UWpts$score[i]+UWtally[i],UWtally,after = 0)
}

#Creating a matrix with cumulative scores over time, per team

#For UW: 
#Adding a zero value for each vector's initial conditions (t = 0; points = 0)
UWtime<-0
i=0
#Creating a vector for UW's time at which points are scored
for(i in 1:23){
  UWtime<<-append(UWtime,UWpts$time[i]+UWtime[i],after = 0)
}
UWtimeR<-UWtime[24:1]
#Creating a matrix for UW's time + points scored
UWMatrix<-cbind(UWtimeR,UWtally)

#For MSU: 
#Adding a zero value for each vector's initial conditions (t = 0; points = 0)
MSUtime<-0
i=0
for(i in 1:27){
  #Creating a vector for MSU's time at which points are scored
  MSUtime<<-append(MSUtime,MSUpts$time[i]+MSUtime[i],after = 0)
}
MSUtimeR<-MSUtime[28:1]
#Creating a matrix for MSU's time + points scored
MSUMatrix<-cbind(MSUtimeR,MSUtally)

#Renaming vectors to plot, and plotting:
Time<-MSUtimeR
Points<-MSUtally
plot(Time,Points,"l",main = "UW vs MSU")
lines(UWtimeR,UWtally,"l")

#part2
#usage:guessmynumber()
guessmynumber<-function(){
  #turns off warnings
  options(warn=-1)
  #generates the random number
  mynumber<-sample(c(1:100))
  i=1
  #allows 10 guesses
  while (i<11){
    #outputing text to player
    text<-c("Enter your guess.","You have ",(11-i)," guesses left.")
    text1<-as.character(text)
  myguess<-readline(prompt=paste(text1, sep="",collapse = ""))
  #response when guess is too low
  if (myguess>mynumber){
    print("Lower")
    i<-i+1
  }
  #response when guess is too high
  else if (myguess<mynumber){
    print("Higher")
    i<-i+1
  }
  #response when guess is correct
  else{
    print("Correct!")
    i<-i+100
  }
  }
  #turns warnings back on for future use
  options(warn=0)
}
