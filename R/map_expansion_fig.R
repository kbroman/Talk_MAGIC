library(broman)
source("map_expansion_func.R")
source("colors.R")
pdf("../Figs/map_expansion.pdf", height=6, width=9, pointsize=16, onefile=TRUE)

maxgen <- 20
color <- c(sexcolor[2], hetcolor, sexcolor[1])

par(mar=c(3.1,3.6,1.1,1.1),las=1,fg="white",col="black",
    col.axis="white",col.lab=textcolor["blue"],
    bg=bgcolor)
grayplot(0:maxgen, c(0,meself2(1:maxgen)), xlab=expression(paste("Generation ", F[k])),
         ylab="Map expansion",
         type="l", lwd=2, col=color[2],
         xaxs="i", yaxs="i", ylim=c(0, 7), lty=2,
         xat=seq(0, 20, by=5), yat=0:7,
         vlines=1:20, hlines=1:6,
         vlines.col=c(rep("gray90", 4), "gray60"), hlines.col="gray90",
         mgp.x=c(1.7, 0.3, 0), mgp.y=c(2.1, 0.4, 0))

lines(0:maxgen, c(0, meself4(1:maxgen)), col=color[3], lwd=2, lty=2)
lines(0:maxgen, c(1, meself8(1:maxgen)), col=color[1], lwd=2,lty=2)
text(17.0, mesibA8(17)-0.1, "Eight-way", col=color[1], adj=c(0,1))
text(17.0, mesibA4(17)-0.1, "Four-way",  col=color[3],   adj=c(0,1))
text(17.0, mesibA2(17)-0.1, "Two-way",   col=color[2],  adj=c(0,1))

lines(0:maxgen, mesibA2(0:maxgen), lwd=2, col=color[2])
lines(0:maxgen, mesibA4(0:maxgen), lwd=2, col=color[3])
lines(0:maxgen, mesibA8(0:maxgen), lwd=2, col=color[1])

legend("bottomright", lwd=2, lty=1:2, c("Sib-mating", "Selfing"),
       bg="gray80", box.col="black", box.lwd=2)

dev.off()
