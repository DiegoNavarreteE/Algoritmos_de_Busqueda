function breadthFirstSearch_init()
    clc; clear; close all;              % Clear screen and variables
    G = map();                          % Load map for searching
    p = plot(G);                        % Plot mat
    %init = 'Wausau'; goal = 'LaCrosse';
    init = 'Wausau'; goal = 'Chicago';
    [queue, explored] = BFS(G.Edges, init, goal)  
    
end

function [searchNode, explored] = BFS(T, init, goal)  
    searchNode = {init};
    explored = {};
    N = size(T,1);
    ind = [1 2; 2 1];
    while ~strcmp(searchNode, goal) | isempty(searchNode)
        currentNode = searchNode{1};
        for i = 1 : 2
            for j = 1 : N
                if strcmp(currentNode, T(j,1).EndNodes{ind(1,i)})
                    searchNode{end+1} = T(j,1).EndNodes{ind(2,i)};
                end
            end
        end
        explored{end+1} = searchNode{1};
        searchNode(1) = [];
    end    
    disp(size(searchNode))
    explored{end+1} = goal;
    disp(size(explored))
    currentNode = {goal}
    rute = {};
    for j = 1 : N
        if strcmp(currentNode, T(j,2).EndNodes{ind(1,2)})
            rute{end+1} = T(j,2).EndNodes{ind(2,2)};
        end
    end
    disp(rute)
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