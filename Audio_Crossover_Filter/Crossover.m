% This MATLAB Script file creates a 3-split audio crossover unit using
% simple FIR Filters and demonstrates the audio crossover unit using an
% mp3 file to visualize the frequency categorization and the functioning
% of the unit.

% Covert the Stereo Audio input into 2 single channel(mono) audio files.
[channel, Fs] = audioread('Swell.mp3');
audiowrite('Swell_mono_L.wav',channel(:,1),Fs);
audiowrite('Swell_mono_R.wav',channel(:,2),Fs);

%System Object to create an Audio File Reader to stream in an *.mp3 file
% to the script.
audioIn = dsp.AudioFileReader;
audioIn.Filename = 'Swell_mono.wav';
audioIn.OutputDataType = 'single';

%Audio Writer Object to output the processed audio out of the speakers.
audioOut = audioDeviceWriter;
audioOut.SampleRate = audioIn.SampleRate;

% Specifications common to all filters.
Fs = audioIn.SampleRate;
filtertype = 'FIR';
Rp = 0.1;
Astop = 80;

% A HPF System Object with the require specs.
Fpass = 8e3;
Fstop = 5e3;

FIRHPF = dsp.HighpassFilter('SampleRate',Fs,...
    'FilterType',filtertype,...
    'PassbandFrequency',Fpass,...
    'StopbandFrequency',Fstop,...
    'PassbandRipple',Rp,...
    'StopbandAttenuation',Astop);

% Plot the Filter Impulse Response and Magnitude and Phase Response.
fvtool(FIRHPF,'Analysis','impulse');
fvtool(FIRHPF,'Analysis','freq');

% A LPF System Object with the require specs.
Fpass = 200;
Fstop = 2e3;

FIRLPF = dsp.LowpassFilter('SampleRate',Fs, ...
    'FilterType',filtertype, ...
    'PassbandFrequency',Fpass, ...
    'StopbandFrequency',Fstop, ...
    'PassbandRipple',Rp, ...
    'StopbandAttenuation',Astop);

% Plot the Filter Impulse Response and Magnitude and Phase Response.
fvtool(FIRLPF,'Analysis','impulse');
fvtool(FIRLPF,'Analysis','freq');

% A BPF System Object with required specs.
Fstop1 = 1000;   % First Stopband Frequency
Fpass1 = 1500;   % First Passband Frequency
Fpass2 = 5500;   % Second Passband Frequency
Fstop2 = 7000;   % Second Stopband Frequency

h = fdesign.bandpass('fst1,fp1,fp2,fst2,ast1,ap,ast2', Fstop1, Fpass1, ...
    Fpass2, Fstop2, Astop, Rp, Astop, Fs);

FIRBPF = design(h, 'equiripple', ...
    'MinOrder', 'any', ...
    'SystemObject', true);

% Plot the Filter Impulse Response and Magnitude and Phase Response.
fvtool(FIRBPF,'Analysis','impulse');
fvtool(FIRBPF,'Analysis','freq');

% Create an object for a Spectrum Analyzer.
SA = dsp.SpectrumAnalyzer('SampleRate',Fs,'NumInputPorts',3,...
    'PlotAsTwoSidedSpectrum',true,...
    'ShowLegend',true,'YLimits',[-80,60]);

SA.ChannelNames = {'LPF Output','BPF Output','HPF Output'};

% Interconnection of the components and playing the audio file.
while ~isDone(audioIn)
    audio = step(audioIn);    % Read audio source file
    HPFOut = step(FIRHPF,audio); % Filter the data
    LPFOut = step(FIRLPF,audio);
    BPFOut = step(FIRBPF,audio);
    step(SA,LPFOut,BPFOut,HPFOut);
    %step(audioOut,BPFOut);    % Play the filtered data
end