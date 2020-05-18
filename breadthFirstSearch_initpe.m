function breadthFirstSearch_init()
    clc; clear; close all;              % Clear screen and variables
    G = map();                          % Load map for searching
    p = plot(G);                        % Plot mat
    %init = 'Wausau'; goal = 'Grand Forks';
    init = 'Milwaukee'; goal = 'Grand Forks';
    %init = 'Sioux Falls'; goal = 'Minneapolis';    
    %init = 'Fargo'; goal = 'Rockford';
    %init = 'Fargo'; goal = 'Rockford';
    [queue, explored, ruta] = BFS(G.Edges, init, goal)
%     while 1
%         [C, ia, ic]=unique(ruta,'stable');
%         a_counts = accumarray(ic,1)
%         nr=max(a_counts);
%         sr=size(ruta);
%         if nr>1
%             fn=find(a_counts==nr)
%             vc = [];
%             for j=1:(size(ic))
%                 if ic(j)==fn
%                     vc(end+1)=j;
%                 end
%             end
%             for k=1:sr(2)
%                 k
%                 if k>=min(vc) && k<max(vc)
%                     ruta{1,k} = '';
%                 end                
%             end
%             i=1
%             while 1
%                 if strcmp(ruta{1,i}, '')
%                     ne = i
%                     break
%                 end
%                 i=i+1;
%             end
%             while strcmp(ruta{1,ne}, '')
%                 ruta(:,ne) = []
%             end
%             ruta
%         else
%             %vc
%             C
%             disp(a_counts)
%             ruta
%             break
%         end
%             
%         %value_counts = [ruta, a_counts]
% 
%     %     ic
%     %     size(ic)
%     [C, ia, ic]=unique(ruta,'stable');
%     end
end

function [searchNode, explored, ruta] = BFS(T, init, goal)  
    searchNode{1,1} = {init};
    explored = {};
    N = size(T,1);
    ind = [1 2; 2 1];
    while ~strcmp(searchNode{1,1}, goal) | isempty(searchNode)
        currentNode = searchNode{1,1};
        for i = 1 : 2
            for j = 1 : N
                if strcmp(currentNode, T(j,1).EndNodes{ind(1,i)})
                    searchNode{1,end+1} = T(j,1).EndNodes{ind(2,i)};
                    searchNode{2,end} = currentNode;
                end
            end
        end
        explored{1,end+1} = char(searchNode{1,1});
        explored{2,end} = char(searchNode{2,1});
        searchNode(:,1) = [];
    end
    explored{1,end+1} = goal;
    explored{2,end} = searchNode{2,1};
    ruta={};
    final=goal;
    sz =size(explored);
    szo = sz(2);
    h = 1;
    while h == 1
        for c = 1 : 2
            for r = 1 : szo
                if strcmp(final, explored{1,r})               
                    ruta{end+1} = explored{1,r}
                    final =explored{2,r};
                    if strcmp(init, ruta(end))                        
                        h=0;
                        break
                    end
                    break
                end
            end
            if h == 0
                break
            end
        end
        if h == 0
            break
        end
    end
    %ruta = fliplr(ruta);
end


function G = map()
    s = [1 1 1 2 2 3 3 3 4 5 6 7 7  7  8  9  10 10 11 11 11 12 13 14 14 15 16];
    t = [2 3 4 5 8 4 5 6 6 7 7 9 10 11 10 12 11 13 12 13 14 15 16 15 16 17 17];
    w = [1 1 1 1 1 1 1 1 1 1 1 1 1  1  1  1  1  1  1  1  1  1  1  1  1  1  1];
    names = {'Grand Forks', 'Fargo', 'Bemidji', 'International Falls', ...
             'St. Cloud', 'Duluth', 'Minneapolis', 'Sioux Falls', 'Wausau', ...
             'Rochester', 'LaCrosse', 'Green Bay', 'Dubuque', 'Madison', ...
             'Milwaukee', 'Rockford', 'Chicago'};
    G = graph(s, t, [], names);
end