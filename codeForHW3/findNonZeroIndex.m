function nonZeroIndex = findNonZeroIndex(row)
row = row.';
for i = 1:size(row, 1)
    if row(size(row, 1)-i+1, 1) ~= 0
        nonZeroIndex = size(row, 1)-i+1;
        break;
    end
end
end