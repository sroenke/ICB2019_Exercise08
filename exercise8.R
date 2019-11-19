#part2
guessmynumber<-function(){
  options(warn=-1)
  mynumber<-sample(c(1:100))
  i=1
  while (i<11){
    text<-c("Enter your guess.","You have ",(11-i)," guesses left.")
    text1<-as.character(text)
  myguess<-readline(prompt=paste(text1, sep="",collapse = ""))
  if (myguess>mynumber){
    print("Lower")
    i<-i+1
  }
  else if (myguess<mynumber){
    print("Higher")
    i<-i+1
  }
  else{
    print("Correct!")
    i<-i+100
  }
  }
  options(warn=0)
}
