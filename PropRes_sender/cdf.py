#!usr/bin/python
import matplotlib.pyplot as plt
import os
from os import walk
import numpy as np
import matplotlib.mlab as mlab

def walk_files():
    files = []
    mypath = os.path.abspath(os.path.dirname(__file__))
    for (dirpath, dirnames, filenames) in walk(mypath):
        for f in filenames:
            if f.endswith('deltatime.txt'):
                files.append(os.path.abspath(os.path.join(dirpath, f)))
    print files
    return files

def process(file):
    input = []
    with open(f, 'rU') as infile:
        lines = infile.readlines()
        fname = f.split('/')[-1].split('.')[0]
        total = 0.0
        for line in lines:
            if (line.split('\t')[0] == '68'):
                if (total != 0.0):
                    input.append(total)
                    total = 0.0
            if (line.split('\t')[0] == '60'):
                num = float(line.split('\t')[1])
                total += num
        input.append(total)
    #     print input[0], input[1]
        num_bins = 100
        counts, bin_edges = np.histogram(input, bins=num_bins, normed=True)
        cdf = np.cumsum(counts)
        plt.plot(bin_edges[1:], cdf)
          
        print "file name: " , fname 
        print "#samples: ",len(input), "max: ", max(input), "min: ", min(input), "avg: ", "{:.6f}".format(np.average(input))
        sorted_data = np.sort(input)

#         fig = plt.figure()
#         ax = fig.add_subplot(111)
# #         fig, ax = plt.subplots(111)
#         n, bins, pathes = ax.hist(sorted_data, 1000,  normed = 1, facecolor = 'green', alpha = 0.75)
#         plt.hist(sorted_data, 1000,  normed = 1, color = 'b')
#         plt.xlabel('Time(sec)', fontsize=30)
#         plt.ylabel('# Packets', fontsize=30)
#         plt.tick_params(axis='both', which='major', labelsize=25)
#         plt.savefig('cdf_'+fname+'.png')
#         plt.show()
        plt.close()
    
if __name__ == "__main__":
    files = walk_files()
    print files
    for f in files:
        process(f)

