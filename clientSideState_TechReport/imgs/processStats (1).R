
#uri-r, count
#tailData <- as.matrix(read.csv("../deferredTLDtail.csv", sep=",", header=TRUE))
#eventNew <- as.matrix(read.csv("../newURIsByEvent.txt.bkp", sep=",", header=TRUE))
#eventNew <- as.matrix(read.csv("../newURIsByEventSort.txt.bkp", sep=",", header=TRUE))
#mimeSize  <- as.matrix(read.csv("../massagedMimeSizes.csv", sep=",", header=TRUE))

#eventNew[,1]<-log10(as.integer(eventNew[,1]))

#imgs, js, text, json, css, font, html, other
unarchiveMimes <- c(12200, 5760, 526, 985, 220, 29, 5241, 706)

counts<-as.numeric(tailData[,2])
uris<-(tailData[,1])
counts[is.na(counts)]<-0

uris<-uris[counts>200]
counts<-counts[counts>200]
counts<-counts[1:300]/5.5

print("longTail.png")
png(filename="longTail.png", type="cairo", height=300,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(5.1, 5.1, 5.1, 5.1))

barplot((counts[1:300]), #main="URI-R Counts",
   xlab="Top 300 Occurring Embedded Resources", ylab="Occurrences", ylim=c(0, 2000)) 

axis(1, at=c(0, 115, 240, 360),labels=c(0, 100, 200, 300), las=2)

dev.off()



##Run Number, URI, Number of States, Depth, Breadth, New URIs, <Events>
#defData <- as.matrix(read.csv("../deferredRunStats.txt", sep=",", header=TRUE))
#nondefData <- as.matrix(read.csv("../nondeferredRunStats.txt", sep=",", header=TRUE))
#depthData<-rbind(cbind(3640, 3640, 3640), cbind(8188, 41080, 63491))
depthData<-rbind(cbind(4250, 4250, 4250), cbind(7692, 56957, 66320))



print("growth1.png")
png(filename="growth1.png", type="cairo", height=300,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(5.1, 5.1, 5.1, 5.1))

plot(0:(length(depthData[1,])-1), depthData[1, ], #main="URI-R Counts",
   xlab="Depth", ylab="Total Frontier Size", type="b", pch=2, ylim=c(0, 70000)) 
points(0:(length(depthData[1,])-1), depthData[2, ], type="b",  pch=4)

legend("topleft", inset=.05, #title="URI Set",
  	c("Deferred", "Nondeferred"),  pch=c(4, 2), horiz=FALSE)

#legend('topleft', c("Deferred", "Nondeferred"), 
#   pch=c(4, 2), cex=1)

dev.off()


##total uris, total archived, new uris, new archived
####need to update the nondeferred "total archived"
#arcData<-rbind(cbind(3640, ??, 0, 0), cbind(63491, 55799, 53706, 49265))
arcData<-cbind(rbind(3640, 3000, 0, 0), rbind(63491, 55799, 53706, 49265))


print("growth2.png")
png(filename="growth2.png", type="cairo", height=500,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(5.1, 5.1, 5.1, 5.1))

barplot(arcData,
  xlab="Depth", ylab="URI-Rs", col=c("#d01c8b","#f1b6da", "#4dac26", "#b8e186"))

legend('topleft', c("Total URIs", "Total archived", "New URIs", "New Archived"), 
   col=c("#d01c8b","#f1b6da", "#4dac26", "#b8e186"), cex=1)

dev.off()


##state 0, state 0 archived, state 1, state 1 archived, state 2, state 2 archived
####need to update the nondeferred "total archived"
arcData<-cbind(rbind(3640, 1469, 0, 0, 0, 0), rbind(63491, 55799, 53706, 49265, 10208, 9363))
arcData2<-cbind(
		#rbind(3640, 1469, 63491, 55799), 
		#rbind(0, 0,       53706, 49265), 
		#rbind(0, 0,       10208, 9363) 

		#rbind(2171, 1469, 7692, 55799), 
		#rbind(0, 0,       4441, 49265), 
		#rbind(0, 0,       845,  9363)

		rbind(2171, 1469, 760,  6223), 
		rbind(0, 0,       4441, 49265), 
		rbind(0, 0,       845,  9363)
		)


print("growth2.png")
png(filename="growth2.png", type="cairo", height=500,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

barplot(arcData,
  ylab="URI-Rs", ylim=c(0, 250000), col=c("#c51b7d",
"#e9a3c9",
"#fde0ef",
"#e6f5d0",
"#a1d76a",
"#4d9221"))

legend('topleft', c("Archived State 0", "Unarchived in State 0", "Archived State 1", "Unarchived in State 1", "Archived State 2", "Unarchived in State 2"), 
col=c("#c51b7d",
"#e9a3c9",
"#fde0ef",
"#e6f5d0",
"#a1d76a",
"#4d9221"),
   pch=16, cex=1)


axis(1, at=c(0.7, 1.9),labels=c("Nondeferred", "Deferred"), las=2)

dev.off()



frontierSize<-cbind(
			rbind((0+0),(845+9363)),
			rbind((0+0),(4441+49265)),
			rbind((2171+1469),(760+6223))
		)

print("growth2a_split1.png")
png(filename="growth2a_split1.png", type="cairo", height=250,
                width=500, bg="white")
                par(xpd=TRUE, mar=c(5.1, 5.1, 5.1, 5.1))

barplot(frontierSize,
  xlab="Frontier Size (URI-Rs)", xlim=c(0, 70000), col=c("#c51b7d",
"#e9a3c9",
"#a1d76a",
"#4d9221"), horiz=TRUE)

legend('topright', c("Nondeferred", "Deferred"), 
col=c("#c51b7d",
"#e9a3c9"),
   pch=16, cex=1)


axis(2, at=c(0.7, 1.9, 3.1), labels=c("State 2", "State 1", "State 0"), las=2)

dev.off()





unarchivedSize<-cbind(
			rbind((0+0),(9363)),
			rbind((0+0),(49265)),
			rbind((1469),(6223))
		)

print("growth2a_split2.png")
png(filename="growth2a_split2.png", type="cairo", height=250,
                width=500, bg="white")
                par(xpd=TRUE, mar=c(5.1, 5.1, 5.1, 5.1))

barplot(unarchivedSize,
  xlab="Number URI-Rs unarchived", xlim=c(0, 70000), col=c("#c51b7d",
"#e9a3c9",
"#a1d76a",
"#4d9221"), horiz=TRUE)

legend('topright', c("Nondeferred", "Deferred"), 
col=c("#c51b7d",
"#e9a3c9"),
   pch=16, cex=1)


axis(2, at=c(0.7, 1.9, 3.1), labels=c("State 2", "State 1", "State 0"), las=2)

dev.off()










print("growth2a.png")
png(filename="growth2a.png", type="cairo", height=500,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

barplot(arcData2,
  ylab="URI-Rs", ylim=c(0, 70000), col=c("#c51b7d",
"#e9a3c9",
"#a1d76a",
"#4d9221"))

legend('topleft', c("Nondeferred Archived", "Nondeferred unarchived","Deferred Archived", "Deferred unarchived"), 
col=c("#c51b7d",
"#e9a3c9",
"#a1d76a",
"#4d9221"),
   pch=16, cex=1)


axis(1, at=c(0.7, 1.9, 3.1), labels=c("State 0", "State 1", "State 2"), las=2)

dev.off()


newDepthData<-c(0.12, 0.91, 0.96)
newDepthData2<-c(7692, 49265, 9363)




print("archivedByDepthPct.png")
png(filename="archivedByDepthPct.png", type="cairo", height=500,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

barplot(newDepthData,
  ylab="Pct New URI-Rs Unarchived", ylim=c(0, 1))


axis(1, at=c(0.7, 1.9, 3.1), labels=c("State 0", "State 1", "State 2"), las=2)

dev.off()




print("archivedByDepthNum.png")
png(filename="archivedByDepthNum.png", type="cairo", height=500,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

#barplot(log(newDepthData2),
#  ylab="Number New URI-Rs Unarchived (log10)", ylim=c(0, 15))
barplot((newDepthData2),
  ylab="Number New URI-Rs Unarchived", ylim=c(0, 50000))


axis(1, at=c(0.7, 1.9, 3.1), labels=c("State 0", "State 1", "State 2"), las=2)

dev.off()





print("archivedByDepthPctHorz.png")
png(filename="archivedByDepthPctHorz.png", type="cairo", height=300,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

barplot(rev(newDepthData*100),
  xlab="Percent New URI-Rs Unarchived", xlim=c(0, 100), horiz=TRUE)


axis(2, at=c(0.7, 1.9, 3.1), labels=rev(c("State 0", "State 1", "State 2")), las=2)

dev.off()



print("archivedByDepthNumHorz.png")
png(filename="archivedByDepthNumHorz.png", type="cairo", height=300,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

#barplot(log(newDepthData2),
#  ylab="Number New URI-Rs Unarchived (log10)", ylim=c(0, 15))
barplot((newDepthData2),
  xlab="Number New URI-Rs Unarchived", xlim=c(0, 50000), horiz=TRUE)


axis(2, at=c(0.7, 1.9, 3.1), labels=c("State 0", "State 1", "State 2"), las=2)

dev.off()

#imgs, js, text, json, css, font, html, other
#unarchiveMimes 
print("unarchivedByMime.png")
png(filename="unarchivedByMime.png", type="cairo", height=300,
                width=500, bg="white")
                par(xpd=FALSE, mgp=c(3, 1, 0), mar=c(5.1, 8.1, 5.1, 5.1))

#font, css, text, other, json, html, js, img
unarchiveMimes2<-rev(c(unarchiveMimes[6], unarchiveMimes[5],
			unarchiveMimes[3], unarchiveMimes[8],
			unarchiveMimes[4], unarchiveMimes[7],
			unarchiveMimes[2], unarchiveMimes[1]
		))

barplot(unarchiveMimes2,
  ylab="", xlab="Number Unarchived", xlim=c(0, max(unarchiveMimes)), horiz=TRUE)

axis(2, at=c(0.7, 1.9, 3.1, 4.3, 5.5, 6.7, 7.9, 9.1), labels=c("Images", "JavaScript", "HTML", "JSON", "CSS", "Font", "Text", "Other"), las=2)

dev.off()












print("newByEvent.png")

#exit()
png(filename="newByEvent.png", type="cairo", height=500,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 7.1, 5.1, 5.1))

plot(9999999, 9999999,
  ylab="Number of new URI-Rs (log10)", 
  #xlab="Event", 
  ylim=c(0, 5), 
  xaxt='n',
  yaxt='n',
  xlab="",
  xlim=c(0,11))
#plot(9999999, 9999999,
#  xlab="Number of new URI-Rs (log10)", 
  #xlab="Event", 
#  xlim=c(0, 5), 
#  yaxt='n',
#  xaxt='n',
#  ylab="",
#  ylim=c(0,11))


x<-1
i<-1
sum<-0
sums<-c()
while(i < length(eventNew[,1]))
{
	if(i > 1)
	{
		if(eventNew[i,2] == eventNew[i-1, 2])
		{
		}
		else
		{
			sums<-c(sums, sum)
			sum<-0
			x<-x+1
		}
	}
	
	points(x, eventNew[i,1], pch=1)
	sum<-sum+as.integer(eventNew[i,1])
	i<-i+1
}

#lines(1:length(sums), sums);

axis(1, at=c(1:11), labels=c("change", "keydown", "keypress", "submit", "unload", "blur", "mousedown", "mouseout", "other", "mouseover", "click"), las=2)
axis(2, at=c(1:5), labels=c("1", "10", "100", "1,000", "10,000"), las=2)


#axis(2, at=c(1:11), labels=c("blur", "change", "click", "keydown", "keypress", "mousedown", "mouseout", "mouseover", "submit", "unload", "other"), las=2)
#axis(1, at=c(1:5), labels=c("1", "10", "100", "1,000", "10,000"), las=2)


dev.off()







print("newByEventHorz.png")

#exit()
png(filename="newByEventHorz.png", type="cairo", height=500,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(5.1, 7.1, 5.1, 5.1))

#plot(9999999, 9999999,
#  ylab="Number of new URI-Rs (log10)", 
  #xlab="Event", 
#  ylim=c(0, 5), 
#  xaxt='n',
#  yaxt='n',
#  xlab="",
#  xlim=c(0,11))
plot(9999999, 9999999,
  xlab="Number of new URI-Rs (log10)", 
  #xlab="Event", 
  xlim=c(0, 5), 
  yaxt='n',
  xaxt='n',
  ylab="",
  ylim=c(0,11))

eventNew[,1]<-rev(eventNew[,1])
eventNew[,2]<-rev(eventNew[,2])

x<-1
i<-1
sum<-0
sums<-c()
while(i < length(eventNew[,1]))
{
	if(i > 1)
	{
		if(eventNew[i,2] == eventNew[i-1, 2])
		{
		}
		else
		{
			sums<-c(sums, sum)
			sum<-0
			x<-x+1
		}
	}
	
	#points(x, eventNew[i,1], pch=x)
	points(eventNew[i,1], x, pch=1)
	sum<-sum+as.integer(eventNew[i,1])
	i<-i+1
}

#lines(1:length(sums), sums);

#axis(1, at=c(1:11), labels=c("blur", "change", "click", "keydown", "keypress", "mousedown", "mouseout", "mouseover", "submit", "unload", "other"), las=2)
#axis(2, at=c(1:5), labels=c("1", "10", "100", "1,000", "10,000"), las=2)


axis(2, at=c(1:11), labels=rev(c("change", "keydown", "keypress", "submit", "unload", "blur", "mousedown", "mouseout", "other", "mouseover", "click")), las=2)
axis(1, at=c(1:5), labels=c("1", "10", "100", "1,000", "10,000"), las=2)


dev.off()









##Run Number, URI, Number of States, Depth, Breadth, New URIs, <Events>
#defData <- as.matrix(read.csv("../deferredRunStats.txt", sep=",", header=TRUE))
#nondefData <- as.matrix(read.csv("../nondeferredRunStats.txt", sep=",", header=TRUE))
roiTime<-rbind(1035, 8452, 27990, 40258)
roiSize<-rbind(4250, 11942, 56957, 66320)



print("ROItime.png")
png(filename="ROItime.png", type="cairo", height=300,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

plot(c(0:3), roiTime, main="440 URI-R Crawl",
   xlab="Crawl Depth", ylab="Crawl time (s)", type="b", pch=2, xaxt='n', ylim=c(0, 70000)) 
#abline(a=roiTime[1], 0)
axis(1, at=c(0:3), labels=c("Heritrix-only", "State 0", "State 1", "State 2"), las=2)

dev.off()

print("ROIsize.png")
png(filename="ROIsize.png", type="cairo", height=300,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

plot(c(0:3), roiSize, main="440 URI-R Crawl",
   xlab="Crawl Depth", ylab="Frontier Size (URI-Rs)", type="b", pch=2, xaxt='n', ylim=c(0, 70000)) 

axis(1, at=c(0:3), labels=c("Heritrix-only", "State 0", "State 1", "State 2"), las=2)

dev.off()

print("ROIint.png")
png(filename="ROIint.png", type="cairo", height=300,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

plot(c(0:3), roiSize, main="440 URI-R Crawl",
   xlab="Crawl Depth", ylab="Frontier Size (URI-Rs)", type="b", pch=2, xaxt='n', ylim=c(0, 70000)) 

lines(c(0:3), roiTime, type="b", pch=3)

axis(1, at=c(0:3), labels=c("Heritrix-only", "State 0", "State 1", "State 2"), las=2)


legend('topleft', c("Frontier Size (URI-Rs)", "Crawl Time (s)"), 
   pch=c(2,3), cex=1)

dev.off()

print("ROIboth.png")
png(filename="ROIboth.png", type="cairo", height=500,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(7.1, 5.1, 5.1, 5.1))

plot(roiTime, roiSize, main="440 URI-R Crawl",
   xlab="Crawl Time (s)", ylab="Frontier Size (URI-Rs)", type="b",  pch=2) 


dev.off()





mimeSizesSort<-rev(sort(as.integer(mimeSize[,2])))
#mimeSizesSort<-log10(rev(sort(as.integer(mimeSize[,2]))))

print("mimeSizeHisto.png")
png(filename="mimeSizeHisto.png", type="cairo", height=250,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(5.1, 5.1, 5.1, 5.1))

barplot((mimeSizesSort[1:100]), #main="URI-R Counts", 
   yaxt='n',
   xlab="Unarchived Images", 
   #ylab="Size", 
   ylim=c(0, 5000000))


axis(2, at=c(0, 2500000,  5000000), labels=c("0MB", "2.5MB", "5MB"), las=2)

dev.off()



massaged <- as.numeric(mimeSizesSort)
massaged[is.na(massaged)]<-0

massaged<-rev(sort(massaged))	


i<-1
#while(i<(length(massaged)-1))
while(i<12000)
{
	if(i<(length(massaged)-1))
	{
        	massaged[i+1]=massaged[i+1]+massaged[i]
	}
	else
	{
		massaged<-c(massaged, 34684569)
	}
        i<-i+1
}


massaged[9999]<-34684569
massaged<-massaged/max(massaged)

print("cdfMimeSize.png")
png(filename="cdfMimeSize.png", type="cairo", height=400,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(5.1, 5.1, 5.1, 5.1))

plot(
   #ecdf(rights),
   1:(length(massaged)-1), massaged[1:(length(massaged)-1)],
   main="", type="b",
   xlim=c(0,12000),
   col="red", xlab="Images", ylab="Proportion of bytes of images",
   #xlim=c(),
   #ylim=c(),
   pch=19)

dev.off()

massagedNew<- as.numeric(mimeSizesSort)
massagedNew<-rev(massagedNew)

last<-0
i<-1
massagedX<-c(0)
massagedY<-c(0)
#while(i<(length(massaged)-1))
while(i<12000)
{
	if(i > length(massagedNew))
	{
		massagedY[1]<-massagedY[1]+1
		print(i)
	}
	else if(massagedNew[i] > last)
	{
		p<-sprintf("%i: %i", i, massagedNew[i])
		print(p)
		last<-massagedNew[i]
		massagedY<-c(massagedY, (max(massagedY)+1))
		massagedX<-c(massagedX, last)
	}
	else
	{
		massagedY[length(massagedY)]<-massagedY[length(massagedY)]+1
	}
    i<-i+1
}
massagedY<-massagedY/max(massagedY)
massagedX<-log10(massagedX*1024)

print("cdfMimeSize2.png")
png(filename="cdfMimeSize2.png", type="cairo", height=400,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(5.1, 5.1, 5.1, 5.1))

plot(
   #ecdf(rights),
   massagedX, massagedY[1:(length(massagedY))],
   main="", type="l", lwd=4,
   xlim=c(2.5,10),
   col="red", xlab="Observed Image Sizes", 
   xaxt='n',
   ylab="Proportion of Images",
   #xlim=c(),
   #ylim=c(),
   pch=19)

  
axis(1, at=c(2.7, 4.2, 5.6, 7, 8.6, 9.8), labels=c("500B", "1KB", "500KB", "1MB", "2.5MB", "5MB"), las=1)
   
dev.off()




uriContribs  <- as.matrix(read.csv("../newThingsByURI.txt", sep=",", header=TRUE))

massaged <- as.numeric(uriContribs[,2])
massaged[is.na(massaged)]<-0

massaged<-rev(sort(massaged))	


i<-1
while(i<(length(massaged)-1))
{
        massaged[i+1]=massaged[i+1]+massaged[i]
        i<-i+1
}

massaged<-massaged/max(massaged)

print("cdfURIs.png")
png(filename="cdfURIs.png", type="cairo", height=400,
                width=500, bg="white")
                par(xpd=FALSE, mar=c(5.1, 5.1, 5.1, 5.1))

plot(
   #ecdf(rights),
   1:(length(massaged)-1), massaged[1:(length(massaged)-1)],
   main="", type="l", lwd=4,
   col="red", xlab="Deferred URI-Rs", ylab="Proportion Contributed New Crawl Frontier",
   #xlim=c(),
   #ylim=c(),
   pch=19)

dev.off()







