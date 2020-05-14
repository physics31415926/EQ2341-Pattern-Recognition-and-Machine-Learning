function mfccs_n = feature_normalized(mfccs)
    buf1 = diff(mfccs,1,2);
    buf2 = diff(buf1,1,2);
    n = size(buf2,2);
    mfccs_n = [mfccs(:,1:n);buf2(:,1:n);buf2];
    for i = 1:size(mfccs_n,1)
        mu = mean(mfccs_n(i,:));
        sigma = sqrt(var(mfccs_n(i,:)));
        mfccs_n(i,:) = (mfccs_n(i,:) - mu)/sigma;
    end
end