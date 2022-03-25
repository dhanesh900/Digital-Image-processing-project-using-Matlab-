function dest_filter = filter_generator(sz,T,steps)  
  dest_filter = zeros(sz);
  for i = 1:sz(1)
    for j = 1:sz(2)
      m = i - (sz(1)+1)/2;
      n = j - (sz(2)+1)/2;
      temp = -2i*pi*(steps(1)*m+steps(2)*n);
      if temp == 0
        dest_filter(i,j) = T;
      else
        dest_filter(i,j) = T*(exp(temp)-1)/temp;
      end
    end
  end
end