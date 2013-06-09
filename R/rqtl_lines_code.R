# plot of lines of code in R/qtl, over time

library(broman)
source("colors.R")

lines <- read.csv("../Perl/lines_code_by_version.csv")
lines <- lines[nrow(lines):1,]
library(lubridate)
lines[,2] <- dmy(as.character(lines[,2]))

pdf("../Figs/rqtl_lines_code.pdf", width=9, height=6, pointsize=16, onefile=TRUE)
par(mar=c(3.1, 5.1, 1.1, 1.1),las=1,fg="white",col="white",col.axis="white",col.lab=textcolor["blue"],
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
xat <- (xaxis + as.numeric(ymd(paste0(yr-1, "-12-31"))))/2

grayplot(lines[,2], lines[,3], xlab="Year", ylab="Lines of code", yat=yat, xat=NA,
         hlines=yat, pch=21, col="black", bg=color2[1], ylim=c(0, max(lines[,3:5])*1.02),
         mgp.x=c(1.6, 0.4, 0), vlines=xat, yaxs="i", vlines.col="gray60",
         hlines.col="gray90",
         xlim=range(xaxis), xaxs="i", mgp.y=c(3.3, 0.4, 0))
for(i in 4:5)
  points(lines[,2], lines[,i], pch=21, col="black", bg=color2[i-2])

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
col <- color[7]
arrows(idea,top,idea, bot, len=0.1, col=col, lwd=2)
arrows(svn, top, svn, bot, len=0.1, col=col, lwd=2)
arrows(git, top, git, bot, len=0.1, col=col, lwd=2)
text(idea, txt, "idea", adj=c(0, 0), col=col)
text(svn, txt, "svn", adj=c(0.5, 0), col=col)
text(git, txt, "git", adj=c(0.5, 0), col=col)

dev.off()

pdf("../Figs/rqtl_lines_code_annotated1.pdf", width=9, height=6, pointsize=16, onefile=TRUE)
par(mar=c(3.1, 5.1, 1.1, 1.1),las=1,fg="white",col="white",col.axis="white",col.lab=textcolor["blue"],
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
xat <- (xaxis + as.numeric(ymd(paste0(yr-1, "-12-31"))))/2

grayplot(lines[,2], lines[,3], xlab="Year", ylab="Lines of code", yat=yat, xat=NA,
         hlines=yat, pch=21, col="black", bg=color2[1], ylim=c(0, max(lines[,3:5])*1.02),
         mgp.x=c(1.6, 0.4, 0), vlines=xat, yaxs="i", vlines.col="gray60",
         hlines.col="gray90",
         xlim=range(xaxis), xaxs="i", mgp.y=c(3.3, 0.4, 0))
for(i in 4:5)
  points(lines[,2], lines[,i], pch=21, col="black", bg=color2[i-2])

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
col <- color[7]
arrows(idea,top,idea, bot, len=0.1, col=col, lwd=2)
arrows(svn, top, svn, bot, len=0.1, col=col, lwd=2)
arrows(git, top, git, bot, len=0.1, col=col, lwd=2)
text(idea, txt, "idea", adj=c(0, 0), col=col)
text(svn, txt, "svn", adj=c(0.5, 0), col=col)
text(git, txt, "git", adj=c(0.5, 0), col=col)

start <- as.numeric(ymd("2006-11-15"))
end   <- as.numeric(ymd("2007-06-01"))
col <- "darkslateblue"
rect(start, 19000, end, 19500, col=col, border=col, lend=1, ljoin=1)
text((start+end)/2, 20200, "move", col=col)

dev.off()


pdf("../Figs/rqtl_lines_code_annotated2.pdf", width=9, height=6, pointsize=16, onefile=TRUE)
par(mar=c(3.1, 5.1, 1.1, 1.1),las=1,fg="white",col="white",col.axis="white",col.lab=textcolor["blue"],
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
xat <- (xaxis + as.numeric(ymd(paste0(yr-1, "-12-31"))))/2

grayplot(lines[,2], lines[,3], xlab="Year", ylab="Lines of code", yat=yat, xat=NA,
         hlines=yat, pch=21, col="black", bg=color2[1], ylim=c(0, max(lines[,3:5])*1.02),
         mgp.x=c(1.6, 0.4, 0), vlines=xat, yaxs="i", vlines.col="gray60",
         hlines.col="gray90",
         xlim=range(xaxis), xaxs="i", mgp.y=c(3.3, 0.4, 0))
for(i in 4:5)
  points(lines[,2], lines[,i], pch=21, col="black", bg=color2[i-2])


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
col <- color[7]
arrows(idea,top,idea, bot, len=0.1, col=col, lwd=2)
arrows(svn, top, svn, bot, len=0.1, col=col, lwd=2)
arrows(git, top, git, bot, len=0.1, col=col, lwd=2)
text(idea, txt, "idea", adj=c(0, 0), col=col)
text(svn, txt, "svn", adj=c(0.5, 0), col=col)
text(git, txt, "git", adj=c(0.5, 0), col=col)

start <- as.numeric(ymd("2006-11-15"))
end   <- as.numeric(ymd("2007-06-01"))
col <- "darkslateblue"
rect(start, 19000, end, 19500, col=col, border=col, lend=1, ljoin=1)
text((start+end)/2, 20200, "move", col=col)

start <- as.numeric(ymd("2011-04-01"))
end   <- as.numeric(ymd("2011-11-01"))
col <- "darkslateblue"
top <- 14982-600
rect(start, top-500, end, top, col=col, border=col, lend=1, ljoin=1)
text(start, top-1200, "preCC paper", col=col, adj=c(0, 0.5))

dev.off()

pdf("../Figs/rqtl_lines_code_annotated3.pdf", width=9, height=6, pointsize=16, onefile=TRUE)
par(mar=c(3.1, 5.1, 1.1, 1.1),las=1,fg="white",col="white",col.axis="white",col.lab=textcolor["blue"],
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
xat <- (xaxis + as.numeric(ymd(paste0(yr-1, "-12-31"))))/2

grayplot(lines[,2], lines[,3], xlab="Year", ylab="Lines of code", yat=yat, xat=NA,
         hlines=yat, pch=21, col="black", bg=color2[1], ylim=c(0, max(lines[,3:5])*1.02),
         mgp.x=c(1.6, 0.4, 0), vlines=xat, yaxs="i", vlines.col="gray60",
         hlines.col="gray90",
         xlim=range(xaxis), xaxs="i", mgp.y=c(3.3, 0.4, 0))
for(i in 4:5)
  points(lines[,2], lines[,i], pch=21, col="black", bg=color2[i-2])

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
col <- color[7]
arrows(idea,top,idea, bot, len=0.1, col=col, lwd=2)
arrows(svn, top, svn, bot, len=0.1, col=col, lwd=2)
arrows(git, top, git, bot, len=0.1, col=col, lwd=2)
text(idea, txt, "idea", adj=c(0, 0), col=col)
text(svn, txt, "svn", adj=c(0.5, 0), col=col)
text(git, txt, "git", adj=c(0.5, 0), col=col)

start <- as.numeric(ymd("2006-11-15"))
end   <- as.numeric(ymd("2007-06-01"))
col <- "darkslateblue"
rect(start, 19000, end, 19500, col=col, border=col, lend=1, ljoin=1)
text((start+end)/2, 20200, "move", col=col)

start <- as.numeric(ymd("2011-04-01"))
end   <- as.numeric(ymd("2011-11-01"))
top <- 14982-600
rect(start, top-500, end, top, col=col, border=col, lend=1, ljoin=1)
text(start, top-1200, "preCC paper", col=col, adj=c(0, 0.5))

start <- git
end   <- as.numeric(ymd("2010-05-02"))
top <- 22500
rect(start, top-500, end, top, col=col, border=col, lend=1, ljoin=1)
text((start+end)/2, top+800, "MQM", col=col)

dev.off()

