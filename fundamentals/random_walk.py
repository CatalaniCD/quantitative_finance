#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug  4 11:27:01 2021

@author: q

GOAL : Dev. Random Walk & LogNormal Price PDF

"""
# =============================================================================
# imports
# =============================================================================
# scientific computing
import numpy as np
# data handling
import pandas as pd
# visualization
import matplotlib.pyplot as plt

# =============================================================================
# functions
# =============================================================================

# =============================================================================
# program test
# =============================================================================

if __name__ == '__main__':
    
    
    """ Random Walk Modelling """
    def randomWalk(mu = 0, sigma = 1, periods = 252, n_paths = 1e4):
        """
        Random Walk Algorithm:
            - generate values with mu and sigma
            - cumsum each path
            - define each rows a rw period, and colums each path
             
        Returns :      
            - pd.DataFrame :
                nrows = periods
                ncols = n_paths
                cumsum(axis = 0)
        """
        n_paths = int(n_paths)
        dt = 1 / periods
        return pd.DataFrame(np.random.normal(loc = mu * dt, scale = sigma * np.sqrt(dt), size = (periods, n_paths))).cumsum(axis = 0)
            
    
    kwargs = {'mu' : 0.06, 'sigma' : 0.4, 
              'periods' : 252, 'n_paths' : 11 }
            
    """ Simulate Random Walks """
    df = randomWalk(**kwargs)
    # df.plot(legend = False)
    
    def logNormalReturnPaths(mu = 0, sigma = 1, periods = 252, n_paths = 1e4, price0 = 100):
        
        """
        Simulate log normal distribution of paths :
            
            - generate values with mu and sigma
            - cumsum each path
            - transform log returns to simple returns : use exp()
            
            * log returns : np.log(price1 / price0)
                - additive : use cumsum
                
                np.log(110 / 100)
                Out[0]: 0.09531017980432493
                   
            * simple returns : np.exp(np.log(price1 / price0))
                - multiplicative : use cumprod
                
                np.exp(np.log(110 / 100))
                Out[1]: 1.1
        
        Returns: tuple,
                    - DataFrame with paths
                    - Terminal, pd.Series with Terminal Values for each Path
              
        """
        kwargs = {'mu' : mu, 'sigma' : sigma, 
                 'periods' : periods, 'n_paths' : n_paths }
        df = randomWalk(**kwargs)
        paths = 100 * np.exp(df) # e^r transformation
        terminal = paths.loc[paths.index[-1]]
        return paths, terminal
        
    kwargs = {'mu' : 0.06, 'sigma' : 0.4, 
              'periods' : 252, 'n_paths' : 1e4, 'price0' : 100 }
    

    paths, terminal = logNormalReturnPaths(**kwargs)    
    
    print(f'Paths Terminal Values : mean {terminal.mean()}, std {terminal.std()}')
    
    # paths.loc[:, :5].plot(grid = True)
    # plt.show()
    # terminal.hist(bins = 30, grid = True)
    # plt.show()
    
    
    

