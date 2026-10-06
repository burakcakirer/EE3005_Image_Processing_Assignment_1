function out = clipUint8(x)
%CLIPUINT8 Clip a numerical array to [0,255] and convert it to uint8.
out = uint8(min(max(round(x),0),255));
end
