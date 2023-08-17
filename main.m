clc;
clear all;

% Load File
[filename, pathname] = uigetfile( {'*.wav'},'Choose Original File Audio');
originalAudio = fullfile(pathname, filename);
[filename2, pathname2] = uigetfile( {'*.wav'},'Choose Enhanced File Audio');
enhancedAudio = fullfile(pathname2, filename2);

fs_signal = 16000;

% calculate PESQ
PESQ_score = pesq(originalAudio, enhancedAudio);

% calculate SSNR
[~,SSNR] = comp_SNR(originalAudio, enhancedAudio);

% calculate CSIG, CBAK, COVL
[CSIG,CBAK,COVL] = composite(originalAudio, enhancedAudio);

% calculate STOI
[x, ~] = audioread(originalAudio);
[y, ~] = audioread(enhancedAudio);
STOI = stoi(x, y, fs_signal);

% show the result
fprintf('PESQ Score: %.2f\n', PESQ_score);
fprintf('SSNR Score: %.2f\n', SSNR);
fprintf('CSIG Score: %.2f\n', CSIG);
fprintf('CBAK Score: %.2f\n', CBAK);
fprintf('COVL Score: %.2f\n', COVL);
fprintf('STOI Score: %.2f\n', STOI);