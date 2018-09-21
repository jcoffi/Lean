#
#	LEAN Algorithm Docker Container November-2016
#	Cross platform deployment for multiple brokerages
#

FROM quantconnect/lean:foundation

MAINTAINER QuantConnect <contact@quantconnect.com>

#################################
# Option 1: Download from Master
<<<<<<< HEAD
RUN \
mkdir -p /root/Lean && \
cd /root/Lean && \
git clone https://github.com/QuantConnect/Lean.git
#wget https://github.com/QuantConnect/Lean/archive/master.zip && \
#unzip master.zip /root/Lean
RUN \
sed -i 's/4.5/4.0/' Algorithm.VisualBasic/QuantConnect.Algorithm.VisualBasic.vbproj && \
wget https://nuget.org/nuget.exe && \
mono nuget.exe restore QuantConnect.Lean.sln -NonInteractive && \
xbuild /property:Configuration=Release && \
cd /root/Lean/Launcher/bin/Release/
=======
# RUN \
#	wget https://github.com/QuantConnect/Lean/archive/master.zip && \
#	unzip master.zip /root/Lean && \
#	cd /root/Lean
# RUN \
#	sed -i 's/4.5/4.0/' Algorithm.VisualBasic/QuantConnect.Algorithm.VisualBasic.vbproj && \
#	wget https://nuget.org/nuget.exe && \
#	mono nuget.exe restore QuantConnect.Lean.sln -NonInteractive && \
#	xbuild /property:Configuration=Release && \
#	cd /root/Lean/Launcher/bin/Release/
>>>>>>> parent of bb84d3d2... Downloaded from master
#################################


################################
# Option 2: Run Local Binaries:
COPY ./Launcher/bin/Release /root/Lean/Launcher/bin/Release
#################################

# Finally.
WORKDIR /root/Lean/Launcher/bin/Release
CMD [ "mono", "QuantConnect.Lean.Launcher.exe"] # Run app

# Usage: 
# docker build -t quantconnect/lean:foundation -f DockerfileLeanFoundation .
# docker build -t quantconnect/lean:algorithm -f Dockerfile .
# docker run -v "(absolute to your data folder):/root/Lean/Data" quantconnect/lean:algorithm 
