function [median_5] = median5x5(f)
median_5= medfilt2(f,[5 5]);
median_5 = uint8(median_5);