# group-assignment-datasets

This is a collection of datasets for evaluation of group assignment algorithms.

The original data was acquired from [F-formation discovery in static images](http://profs.sci.univr.it/~cristanm/ssp/).

## datasets

The collection consists of the following compacted datasets:

* Synthetic Data:      [link](http://profs.sci.univr.it/~cristanm/datasets.html)
* IDIAP Poster Data:   [link](https://www.idiap.ch/dataset/idiap-poster-data) (This dataset could not included.)
* Cocktail Party Data: [link](https://tev.fbk.eu/technologies/cocktailparty-dataset-multi-view-dataset-social-behavior-analysis)
* Coffee Break Data:   [link](http://profs.sci.univr.it/~cristanm/datasets.html)
* GDet Data:           [link](http://www.lorisbazzani.info/)

## matlab/octave representations

The original matlab/octave representations of the datasets can be found in `data/octave`

## json representations

You can use the original representations to genereate json files with:

```sh
octave generate_json.m
```

This requires the submodule `jsonlab` to be checked out and creates a folder structure and
the corresponding json documents in `data/json`.

Thanks to [jsonlab](https://github.com/fangq/jsonlab.git) for the json-encoding part.

## Copyright

If you are using these datasets, please visit http://profs.sci.univr.it/~cristanm/ssp/ and 
appropriately cite the datasets and papers you use.

