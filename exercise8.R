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
