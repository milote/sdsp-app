% Randomly generates a M-PSK signals with random freqoffset and save to
% a binfile named unit_test.bin

% Created by : MS 29th June 2024

function randomPSKRFsig()

M_Set = [2,4,8];
BR_Set = [1e4,1e5,1e6];
OSR_Set = [1.5,2:5];

M = M_Set(randi(length(M_Set)));
BR = BR_Set(randi(length(BR_Set)));
OSR = OSR_Set(randi(length(OSR_Set)));

foffset = 1000.*rand;
PSKRF = resample(exp(1i*2*pi*(randi(M,1,BR)-1)/M),OSR*10,10).*exp(1i*2*pi*foffset/(BR*OSR)*(0:BR*OSR-1))*5e3;

fid = fopen('unit_test.bin','w+');
fwrite(fid,[real(PSKRF);imag(PSKRF)],'int16');
fclose(fid);

fid = fopen('Answer.txt','w+');
fprintf(fid, 'M: %d\n',M);
fprintf(fid, 'BR: %d\n',BR);
fprintf(fid, 'foffset: %.3f\n',foffset);
fclose(fid);