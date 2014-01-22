mv GraphicsMagick-1.3.16.tar.gz   /usr/local/src
yum install freetype  
yum install gd-devel  
yum install libgomp   
yum install libjpeg libjpeg-devel  
yum install libpng libpng-devel  
cd /usr/local/src  
tar zvxf GraphicsMagick-1.3.16.tar.gz  
cd GraphicsMagick-1.3.16  
./configure --enable-shared=yes --with-jpeg=yes --with-jp2=yes --with-png=yes --disable-openmp  
make  
make install  