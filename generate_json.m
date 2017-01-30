%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %
% Copyright 2017 Viktor Richter                                          %
%                                                                        %
% Permission is hereby granted, free of charge, to any person obtaining  %
% a copy of this software and associated documentation files (the        %
% "Software"), to deal in the Software without restriction, including    %
% without limitation the rights to use, copy, modify, merge, publish,    %
% distribute, sublicense, and/or sell copies of the Software, and to     %
% permit persons to whom the Software is furnished to do so, subject to  %
% the following conditions:                                              %
%                                                                        %
% The above copyright notice and this permission notice shall be         %
% included in all copies or substantial portions of the Software.        %
%                                                                        %
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,        %
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF     %
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                  %
% NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS    %
% BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN     %
% ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN      %
% CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE       %
% SOFTWARE.                                                              %
%                                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all,
close all,
clc,

datapath = strcat(pwd,'/','data/octave');
dstpath = strcat(pwd,'/','data/json');

datasets = [ './CoffeeBreak/Seq1'
             './CoffeeBreak/Seq2'
             './Poster'
             './CocktailParty'
             './Synth'
             './GDet/S1'
             './GDet/S2'
             './GDet/S3'
             './GDet/S5'
             './GDet/S6'
           ]';

files = [ 'features',
          'groundtruth',
          'settings_gc',
          'settings'
        ]';

fprintf('Prepare folder structure.')
mkdir(strcat(pwd,'/data/json'));
mkdir(strcat(pwd,'/data/json/CoffeeBreak'));
mkdir(strcat(pwd,'/data/json/CoffeeBreak/Seq1'));
mkdir(strcat(pwd,'/data/json/CoffeeBreak/Seq2'));
mkdir(strcat(pwd,'/data/json/Poster'));
mkdir(strcat(pwd,'/data/json/CocktailParty'));
mkdir(strcat(pwd,'/data/json/Synth'));
mkdir(strcat(pwd,'/data/json/GDet'));
mkdir(strcat(pwd,'/data/json/GDet/S1'));
mkdir(strcat(pwd,'/data/json/GDet/S2'));
mkdir(strcat(pwd,'/data/json/GDet/S3'));
mkdir(strcat(pwd,'/data/json/GDet/S5'));
mkdir(strcat(pwd,'/data/json/GDet/S6'));


addpath(strcat(pwd,'/jsonlab'))

function data = read_features(path)
    data = struct;
    filename = strcat(path,'/features.mat');
    if exist(filename, 'file') == 2
        load(filename);
        data.features = features;
        data.timestamp = timestamp;
        if exist('FoV') == 1;
          data.FoV = FoV;
        end
    end
end

function data = read_ground_truth(path)
    data = struct;
    filename = strcat(path,'/groundtruth.mat');
    if exist(filename, 'file') == 2
        load(filename);
        data.GTgroups = GTgroups;
        data.GTtimestamp = GTtimestamp;
    end
end

function data = read_settings(path)
    data = struct;
    filename = strcat(path,'/settings.mat');
    if exist(filename, 'file') == 2
        load(filename);
        data.params = params;
    end
    filename = strcat(path,'/settings_gc.mat');
    if exist(filename, 'file') == 2
        load(filename);
        data.mdl = mdl;
        data.stride = stride;
    end
end

fprintf('Start conversion\n  from: %s\n  to  :%s\n',datapath,dstpath)
for dataset = datasets
  fprintf('    read dataset: %s\n', dataset')
  path = strcat(datapath,'/',dataset');
  fprintf('      read features\n')
  ft = read_features(path);
  fprintf('      read ground truth\n')
  gt = read_ground_truth(path);
  fprintf('      read settings\n')
  st = read_settings(path);
  fprintf('    write dataset: %s\n', dataset')
  dst = strcat(dstpath,'/',dataset','/');
  if isempty(fieldnames(ft)) == 0
    fprintf('      write features\n')
    savejson('',ft,strcat(dst,'/features.json'));
  else
    fprintf('      empty features ignored\n')
  end
  if isempty(fieldnames(gt)) == 0
    fprintf('      write ground truth\n')
    savejson('',gt,strcat(dst,'/groundtruth.json'));
  else
    fprintf('      empty ground truth ignored\n')
  end
  if isempty(fieldnames(st)) == 0
    fprintf('      write settings\n')
    savejson('',st,strcat(dst,'/settings.json'));
  else
    fprintf('      empty settings ignored\n')
  end
  fprintf('    done dataset: %s\n', dataset')
end








