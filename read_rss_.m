r=xml2struct('podcast.rss');
d=r.rss.channel.item;
l=length(d);
links=strings(l,1);
urls=strings(l,1);
reanmecmds=strings(l,1);
createcmds=strings(l,1);
for i=1:l
    links(i)=d{1,i}.link.Text;
    urls(i)=d{1,i}.enclosure.Attributes.url;
    urlparts=strsplit(urls(i),'/');
    oldname=urlparts(end);
    nameparts=strsplit(oldname,'.');
    extension=strcat('.',nameparts(end));
    s=strsplit(links(i),'/');
    name=strjoin([s(end-3:end-1),'-',s(end),extension],'');
    reanmecmds(i)=strjoin(['rename',oldname,name]);
    createcmds(i)=strjoin(['type','nul','>',oldname]);
end
%%
writematrix(reanmecmds,'rename.bat','FileType','text');
writematrix(createcmds,'type.bat','FileType','text');
writematrix(urls,'urls.txt');
writematrix(links,'webpages.txt');