clear;clc;
alldata = dir('D:\important\Files\sapphire\20190225\data\*.dat');%读取文件夹下所有尾缀为dat的文件
n = length(alldata);
data = cell(n,1);%构建4个n维元胞数组
x = cell(1,n);y=x;z=y;tri=z;

for i = 1:1:n
    filename = ['D:\important\Files\sapphire\20190225\data\',alldata(i).name];
    data(i) = {importdata(filename)};%n维元胞数组用来储存文件夹下所有.data的文件内容
    x(i) = {data{i}(:,1)};
    y(i) = {data{i}(:,2)};
    z(i) = {data{i}(:,3)};
    tri(i) = {delaunay(x{i},y{i})};
end
pause;
for i = 1:1:n
    figure(i);
    trimesh(tri{i},x{i},y{i},z{i});
    view(-37.5,75);
    set(gca,'XTick',0:50:400);
    set(gca,'YTick',0:50:300);
    set(gca,'ZTick',-20:5:20);
    % shading interp;
    colormap('jet');
    % colorbar('position',[0.955,0.11,0.021,0.815]);
    axis normal;
    xlabel('X(μm)');ylabel('Y(μm)');zlabel('Z(μm)');
    grid on;
    set(gca,'FontSize',28);
    set(gcf,'outerposition',get(0,'screensize'));
    saveas(gcf,['D:\important\Files\sapphire\20190225\bmppppp\',alldata(i).name,'.bmp']);
    if i>5 %保持只有五张图显示出来，内存不至于被榨干
        close(figure(i-5));
    end
end