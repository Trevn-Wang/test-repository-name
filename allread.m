clear;clc;
alldata = dir('D:\important\Files\sapphire\20190225\data\*.dat');%��ȡ�ļ���������β׺Ϊdat���ļ�
n = length(alldata);
data = cell(n,1);%����4��nάԪ������
x = cell(1,n);y=x;z=y;tri=z;

for i = 1:1:n
    filename = ['D:\important\Files\sapphire\20190225\data\',alldata(i).name];
    data(i) = {importdata(filename)};%nάԪ���������������ļ���������.data���ļ�����
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
    xlabel('X(��m)');ylabel('Y(��m)');zlabel('Z(��m)');
    grid on;
    set(gca,'FontSize',28);
    set(gcf,'outerposition',get(0,'screensize'));
    saveas(gcf,['D:\important\Files\sapphire\20190225\bmppppp\',alldata(i).name,'.bmp']);
    if i>5 %����ֻ������ͼ��ʾ�������ڴ治���ڱ�ե��
        close(figure(i-5));
    end
end