
munge_ndvi = function(filename) {
  # function to put NDVI data into data frame format
  rawdata = read.csv(filename,skip=8,head=T)
  ndvi = data.frame(rawdata)
  ndvi$date = as.Date(paste(ndvi$year,ndvi$julianday),format='%Y %j')
  ndvi$month = as.integer(format(ndvi$date,'%m'))
  # remove one weird data point
  ndvi = ndvi[ndvi$variance < .03,]
  return(ndvi)
}

ndvi = munge_ndvi('data/ModisNDVI_MOD_clean_summary.csv')
