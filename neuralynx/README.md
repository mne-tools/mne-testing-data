# Author: Kristijan Armeni  

This folder contains unconnected recording (i.e. not attached to a patient) with the [Neuralynx](https://neuralynx.fh-co.com/) acquisition system.
The recording kindly contributed by Ivan Skelin, Krembil Research Institute, University of Toronto.  
 
Folder contents:
- 10 `*.ncs` files/channels (continuously sampled signals)
- 10 `*.nse` files/channels (spike snapshot files; likely empty since the recording is disconnected and no spikes were produced)
- 1 `*.nev` file (events file)

folder size:  
```bash  
du -h neuralynx
504K	neuralynx
```  

For more info about the file formats, see: [Neuralynx data file formats]( https://support.neuralynx.com/hc/en-us/articles/360040444811-TechTip-Neuralynx-Data-File-Formats)

