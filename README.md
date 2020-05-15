# DSP_LAB
This repo contains MATLAB script files made as part of DSP LAB

## Design of an **Audio Crossover Unit** using *MATLAB & Simulink*.

### Requirements 

My project requires the following MATLAB toolboxes to run successfully.
1. DSP Toolbox.
2. Audio Systems Toolbox.

### Screenshots

Implementation of the design in *Simulink*.

![](docs/images/AC_SIMULINK_MODEL.PNG)


Impulse Response of the FIR Low Pass Filter (LPF)

![](docs/images/IR_LPF.PNG)

Magnitude and Phase Response of the LPF:

![](docs/images/MPR_LPF.PNG)

Impulse Response of the FIR Band Pass Filter (BPF)

![](docs/images/IR_BPF.PNG)

Magnitude and Phase Response of the BPF:

![](docs/images/MPR_BPF.PNG)

Impulse Response of the FIR High Pass Filter (HPF)

![](docs/images/IR_HPF.PNG)

Magnitude and Phase Response of the HPF:

![](docs/images/MPR_HPF.PNG)

Implementation of the design in *MATLAB*.

**IMPORTANT NOTE:**
![](docs/images/NOTE.PNG)

My implementation of the above Simulink Model is based on the use of MATLAB System Objects.

**References:**
Below is a list of references which i referred to while making the project and will also help you in understanding my code.

1. [System Objects](https://www.mathworks.com/help/matlab/system-objects.html)
2. [Stream Processing in MATLAB](https://in.mathworks.com/discovery/stream-processing.html)
3. [Low Pass Filter](https://in.mathworks.com/help/dsp/ref/dsp.lowpassfilter-system-object.html)
4. [High Pass Filter](https://in.mathworks.com/help/dsp/ref/dsp.highpassfilter-system-object.html)
5. [Band Pass Filter](https://in.mathworks.com/help/dsp/ref/fdesign.bandpass.html)
**You can find a video demonstration of the project [here](https://www.youtube.com/watch?v=tmfljxyGwL0)**