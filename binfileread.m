function [x,fs] = binfileread(filedirpath)

starttic = tic;
fprintf('Opening file: %s\n',filedirpath);
fid = fopen(filedirpath,'r');
tmpx = fread(fid,'int16');
fclose(fid);
fprintf('Successfully opened file: %s. Time taken: %.3fsec\n',filedirpath,toc(starttic));
x = complex(tmpx(1:2:end),tmpx(2:2:end));
fs = length(x);
