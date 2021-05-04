function [] = finalProject(source,event)
    close all;
    global gui;

      
    
    gui.line = '-';         %default line and color
    gui.color = 'r';
    
    gui.fig = figure();
    gui.p = plot(0,0);                              %create figure/graph
    gui.p.Parent.Position = [0.25 0.28 0.5 0.6];
    
    gui.xInput = uicontrol('style','edit','units','normalized','position',[.35 .08 .09 .05]);       %all of my buttons/text boxes on the graph. 
    gui.yInput = uicontrol('style','edit','units','normalized','position',[.55 .08 .09 .05]);
    gui.plotBox = uicontrol('style','pushbutton','units','normalized','position',[.7 0.08 .09 .05],'string', 'PLOT', 'callback', @plotXY);
    gui.xInputLabel = uicontrol('style','text','units','normalized','position',[.25 .07 .09 .05],'string','X Input');
    gui.yInputLabel = uicontrol('style','text','units','normalized','position',[.45 .07 .09 .05],'string','Y Input');
    gui.resetPlot = uicontrol('style','pushbutton','units','normalized','position',[0.8 .08 .09 .05], 'string', 'RESET', 'callback',  @resetButton);
    gui.xAxesBox = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.45 0.17 0.09 0.05]);
    gui.yAxesBox = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.8 0.52 0.09 0.05]);
    gui.plotTitle = uicontrol('style','edit','units', 'normalized', 'position', [0.4 0.9 0.2 0.05]);
    gui.xMinBox = uicontrol ('style', 'edit','units', 'normalized', 'position', [0.8 0.35 0.09 0.05]);
    gui.xMaxBox = uicontrol ('style', 'edit','units', 'normalized', 'position', [0.9 0.35 0.09 0.05]);
    gui.yMinBox = uicontrol ('style', 'edit', 'units', 'normalized', 'position', [0.8 0.3 0.09 0.05]);
    gui.yMaxBox = uicontrol ('style', 'edit','units', 'normalized', 'position', [0.9 0.3 0.09 0.05]);
    gui.pushBox = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position', [0.85 0.25 0.09 0.05], 'string', 'Limits', 'callback', @LimitBox);
    
    gui.colorbutton = uicontrol('style','pushbutton','units','normalized','position',[0.8 0.7 .1 .075], 'string', 'COLOR', 'callback', @colorButton);
    gui.linebutton = uicontrol('style','pushbutton','units','normalized','position',[0.8 0.8 .1 .075], 'string', 'LINE', 'callback', @lineButton); 
    
    gui.colorDisplay = uicontrol('style','text','units','normalized','position',[.9 .71 .05 .05],'string', 'Red','horizontalalignment','right');
    gui.lineDisplay = uicontrol('style','text','units','normalized','position',[.91 .81 .07 .05],'string', 'Straight' ,'horizontalalignment','right');
    gui.xAxesDisplay = uicontrol('style','text','units','normalized','position',[0.55 0.17 0.09 0.06],'string','X Axis Label');
    gui.yAxesDisplay = uicontrol('style','text','units','normalized','position', [0.8 0.58 0.09 0.06], 'string', 'Y Axis Label');
    gui.plotTitleDisplay = uicontrol('style','text','units','normalized','position',[0.45 0.95 0.09 0.04], 'string', 'Plot Title');
    gui.minDisplay = uicontrol('style','text','units','normalized','position',[0.8 0.41 0.09 0.06], 'string', 'Min Points');
    gui.maxDisplay = uicontrol('style','text','units','normalized','position',[0.9 0.41 0.09 0.06], 'string', 'Max Points');
    gui.xMaxDisplay = uicontrol ('style', 'text','units', 'normalized', 'position', [0.77 0.37 0.02 0.025], 'string', 'X');
    gui.yMaxDisplay = uicontrol ('style', 'text','units', 'normalized', 'position', [0.77 0.315 0.02 0.025], 'string', 'Y');

    function [] = plotXY(source,event)          % the function that takes the data and graphs it
        t = gui.xInput.String;                  
        t = str2num(t);
        s = gui.yInput.String;
        s = str2num(s);                         % s and t are the x and y coordinates in an array
        i = gui.line;
        j = gui.color;
            if length(t) == length(s)           % makes sure same amount of x and y coordinates
                if i == '-' && j == 'r'
                    plot(t,s,'-r')
                elseif i == '-' && j == 'b'
                    plot(t,s,'-b')
                elseif i == '-' && j == 'g'
                    plot(t,s,'-g')
                elseif i == '_' && j == 'r'
                    plot(t,s,'_r')
                elseif i == '_' && j == 'b'
                    plot(t,s,'_b')
                elseif i == '_' && j == 'g'
                    plot(t,s,'_g')
                elseif i == 'o' && j == 'r'
                    plot(t,s,'or')
                elseif i == 'o' && j == 'b'
                    plot(t,s,'ob')
                else 
                    plot(t,s,'og')
                end
            else                        %error message if they aren't equal
                    msgbox('Non-equal or Non-numerical inputs','Input Error','error','modal')    
            end
        end



function [] = resetButton(source,event)             %RESET function
    hold off
    plot(0,0);
    gui.line = '-';                                 %returns to default line properties, clears edit boxes, new graph
    gui.color = 'r';
    gui.colorDisplay = uicontrol('style','text','units','normalized','position',[.91 .71 .05 .05],'string', 'Red','horizontalalignment','right');
    gui.lineDisplay = uicontrol('style','text','units','normalized','position',[.91 .81 .07 .05],'string', 'Straight' ,'horizontalalignment','right');
    gui.xInput = uicontrol('style','edit','units','normalized','position',[.35 .08 .09 .05]);
    gui.yInput = uicontrol('style','edit','units','normalized','position',[.55 .08 .09 .05]);
    gui.xAxesBox = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.45 0.17 0.09 0.05]);
    gui.yAxesBox = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.8 0.52 0.09 0.05]);
    gui.plotTitle = uicontrol('style','edit','units', 'normalized', 'position', [0.4 0.9 0.2 0.05]);
    gui.xMinBox = uicontrol ('style', 'edit','units', 'normalized', 'position', [0.8 0.35 0.09 0.05]);
    gui.xMaxBox = uicontrol ('style', 'edit','units', 'normalized', 'position', [0.9 0.35 0.09 0.05]);
    gui.yMinBox = uicontrol ('style', 'edit', 'units', 'normalized', 'position', [0.8 0.3 0.09 0.05]);
    gui.yMaxBox = uicontrol ('style', 'edit','units', 'normalized', 'position', [0.9 0.3 0.09 0.05]);
end

function [] = colorButton(source,event)             % button group function that changes the color of line
        clP = uibuttongroup('position', [0 0 .15 1]);
        b1 = uicontrol(clP,'style', 'radiobutton', 'String', 'Red', 'Position', [10 350 100 30], 'callback', @red);
        b2 = uicontrol(clP,'style', 'radiobutton', 'String', 'Blue', 'Position', [10 250 100 30],'callback', @blue);
        b3 = uicontrol(clP,'style', 'radiobutton', 'String', 'Green', 'Position', [10 150 100 30], 'callback', @green);

end
function [] = lineButton(source,event)              % button group function that changes the type of line
        lnP = uibuttongroup('position', [0 0 .15 1]);
        b4 = uicontrol(lnP, 'style', 'radiobutton', 'Position', [ 10 350 100 30], 'String', 'Straight','callback', @dash);
        b5 = uicontrol(lnP, 'style', 'radiobutton', 'Position', [ 10 250 100 30], 'String', 'Dashed','callback', @straight);
        b6 = uicontrol(lnP, 'style', 'radiobutton', 'Position', [ 10 150 100 30], 'String', 'Circles','callback', @circle);
    

end
                               %list of the callbacks for the button group
                                        
                                        
function [] = dash(source,event)
    gui.line = '-';
    gui.lineDisplay = uicontrol('style','text','units','normalized','position',[.91 .81 .07 .05],'string', 'Straight','horizontalalignment','right');
end
function [] = straight(source,event)
    gui.line = '_';
    gui.lineDisplay = uicontrol('style','text','units','normalized','position',[.91 .81 .07 .05],'string', 'Dashed','horizontalalignment','right');
end
function [] = circle(source,event)
    gui.line = 'o';
    gui.lineDisplay = uicontrol('style','text','units','normalized','position',[.91 .81 .07 .05],'string', 'Circle','horizontalalignment','right');
end
function [] = red(source,event)
    gui.color = 'r';
    gui.colorDisplay = uicontrol('style','text','units','normalized','position',[.91 .71 .05 .05],'string', 'Red','horizontalalignment','right');
end
function [] = blue(source,event)
    gui.color = 'b';
    gui.colorDisplay = uicontrol('style','text','units','normalized','position',[.91 .71 .05 .05],'string', 'Blue','horizontalalignment','right');
end
function [] = green(source,event)
    gui.color = 'g';
    gui.colorDisplay = uicontrol('style','text','units','normalized','position',[.9 .71 .06 .05],'string', 'Green','horizontalalignment','right');
end
    function [] = LimitBox(source,event)            %function that sets the limits
        zx = gui.xMinBox.String;
        zx = str2num(zx);                           %turns the inputs into strings
        Kx = gui.xMaxBox.String;
        Kx = str2num(Kx);
        zy = gui.yMinBox.String;
        zy = str2num(zy);
        Ky = gui.yMaxBox.String;
        Ky = str2num(Ky);
        if (isempty(zx) == 1 || isempty(Kx) == 1) && (isempty(zy) == 1 || isempty(Ky) == 1)         %detects if there is one empty box in both the x and y axis limit
            msgbox('Must Not Leave Boxes Empty Or Use Letters', 'Input Error', 'error', 'modal')    
        elseif (isempty(zy) == 0 && isempty(Ky) == 1)||(isempty(zx) == 0 && isempty(Kx) == 1)
            msgbox('One of the Boxes are Empty Or Use Letters', 'Input Error', 'error', 'modal')
        elseif isempty(zy) == 1 && isempty(Ky) == 0 ||(isempty(zx) == 1 && isempty(Kx) == 0)
            msgbox('One of the Boxes are Empty Or Use Letters', 'Input Error', 'error', 'modal')
        else
            if isempty(zx) == 0 && isempty(Kx) == 0                             %detects if either of the boxes is empty
            if Kx < zx                                                          %makes sure the limiting numbers are increasing
            msgbox('Numbers must increase', 'Input Error', 'error', 'modal')   
            else
            xlim([zx Kx]); 
            end
            else                                                                %if they're both empty, wont do anything
            end
            if isempty(zy) == 0 && isempty(Ky) == 0
            if Ky < zy
            msgbox('Numbers must increase', 'Input Error', 'error', 'modal')   
            else
            ylim([zy Ky]);
            end
            else
            end
            end
        end
end














