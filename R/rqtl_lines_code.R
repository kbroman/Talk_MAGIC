# plot of lines of code in R/qtl, over time

source("colors.R")
color <- c(rgb(102,203,254,maxColorValue=255),
#           rgb(254,102,254,maxColorValue=255),
           rgb(254,  0,128,maxColorValue=255),
           rgb(102,254,102,maxColorValue=255),
           rgb(128,  0,128,maxColorValue=255),
           rgb(203,102,254,maxColorValue=255),
           rgb(254,203,102,maxColorValue=255),
           rgb(  0,128,128,maxColorValue=255),
           rgb(102,102,102,maxColorValue=255))

lines <- read.csv("../Perl/lines_code_by_version.csv")
lines <- lines[nrow(lines):1,]
library(lubridate)
lines[,2] <- dmy(as.character(lines[,2]))

pdf("../Figs/rqtl_lines_code.pdf", width=9, height=6, pointsize=16, onefile=TRUE)
par(mar=c(3.1, 5.1, 1.1, 1.1),las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,bty="n")
load("ri8_onestep_rev.RData.gz")
rf <- as.numeric(names(onestep))
wh <- (rf*1000 == round(rf*1000))

yat <- seq(0, 35000, by=5000)

yr <- 2000:2014
idea <- as.numeric(dmy("23 Feb 2000"))
R100 <- as.numeric(dmy("29 Feb 2000"))
svn <- as.numeric(dmy("16 Jan 2008"))
git <- as.numeric(dmy("12 Feb 2009"))
xaxis <- as.numeric(ymd(paste0(yr, "-1-1")))
xat <- xaxis

grayplot(lines[,2], lines[,3], xlab="", ylab="Lines of code", yat=yat, xat=NA,
         hlines=yat, pch=21, col="black", bg=color2[1], ylim=c(0, max(lines[,3:5])*1.02),
         mgp=c(3.3, 0.4, 0), vlines=xat, yaxs="i", vlines.col="gray60",
         xlim=range(xaxis), xaxs="i")
for(i in 4:5)
  points(lines[,2], lines[,i], pch=21, col="black", bg=color2[i-2])

title(xlab="Year", mgp=c(1.6, 0, 0))

u <- par("usr")
for(i in 2:length(xaxis)) {
  col <- ifelse(i %% 2, "gray70", "gray50")
  h <- diff(u[3:4])*0.05
  start <- max(c(xaxis[i-1], u[1]))
  end <- min(c(xaxis[i], u[2]))
  rect(start, u[3], end, u[3]-h, xpd=TRUE,
       col=col, border=col, lend=1, ljoin=1)
  text((start + end)/2, u[3]-h/2, yr[i-1], col="white", xpd=TRUE, cex=0.8)
}
abline(h=0, col="white")

xd <- diff(range(xaxis))*0.02
text(rep(as.numeric(lines[1,2]) - xd, 3), lines[1,3:5], c("R", "C", "man"),
     col="black", adj=c(1, 0.5))

top <- u[3]+diff(u[3:4])*0.07
bot <- u[3]+diff(u[3:4])*0.01
txt <- u[3]+diff(u[3:4])*0.09
col <- color[1]
arrows(idea,top,idea, bot, len=0.1, col=col, lwd=2)
arrows(svn, top, svn, bot, len=0.1, col=col, lwd=2)
arrows(git, top, git, bot, len=0.1, col=col, lwd=2)
text(idea, txt, "idea", adj=c(0, 0), col=col)
text(svn, txt, "svn", adj=c(0.5, 0), col=col)
text(git, txt, "git", adj=c(0.5, 0), col=col)

dev.off()
