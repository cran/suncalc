% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getMoonIllumination.R
\name{getMoonIllumination}
\alias{getMoonIllumination}
\title{Get Moon illumination}
\usage{
getMoonIllumination(date = Sys.Date(), keep = c("fraction", "phase", "angle"))
}
\arguments{
\item{date}{: Single or multiple DateTime. Can be a \code{Date} (YYYY-MM-DD), 
a \code{character} in UTC (YYYY-MM-DD HH:mm:ss) or a \code{POSIXct}}

\item{keep}{: \code{character}. Vector of variables to keep. See \code{Details}}
}
\value{
\code{data.frame}
}
\description{
Get Moon illumination
}
\details{
Returns an object with the following properties:

\itemize{
  \item{"fraction"}{ :  illuminated fraction of the moon; varies from 0.0 (new moon) to 1.0 (full moon)}
  \item{"phase"}{ :  moon phase; varies from 0.0 to 1.0, described below}
  \item{"angle"}{ :  midpoint angle in radians of the illuminated limb of the moon reckoned eastward from 
the north point of the disk; the moon is waxing if the angle is negative, and waning if positive}
}

Moon phase value should be interpreted like this:
\itemize{
  \item{0}{ : New Moon}
  \item{}{Waxing Crescent}
  \item{0.25}{ : First Quarter}
  \item{}{ : Waxing Gibbous}
  \item{0.5}{Full Moon}
  \item{}{ : Waning Gibbous}
  \item{0.75}{Last Quarter}
  \item{}{ : Waning Crescent}
} 

By subtracting the parallacticAngle from the angle one can get the zenith angle of the moons bright limb (anticlockwise). The zenith angle can be used do draw the moon shape from the observers perspective (e.g. moon lying on its back).
}
\examples{

# one date
getMoonIllumination(date = Sys.Date())

# in character
getMoonIllumination(date = c("2017-05-12", "2017-05-12 00:00:00"), 
  keep = c("fraction", "phase"))

# in POSIXct
getMoonIllumination(date = as.POSIXct("2017-05-12 00:00:00", tz = "UTC"))
getMoonIllumination(date = as.POSIXct("2017-05-12 02:00:00", tz = "CET"))

date <- seq(ISOdate(2009,1,1), ISOdate(2010,1,1), "hours")
date_cet <- date
attr(date_cet, "tzone") <- "CET"
res <- getMoonIllumination(date = date_cet)
      
}
\seealso{
\link{getSunlightTimes}, \link{getMoonTimes}, \link{getMoonIllumination},
\link{getMoonPosition},\link{getSunlightPosition}
}
