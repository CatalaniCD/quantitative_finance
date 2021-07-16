#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul 16 11:20:01 2021

@author: q

GOAL : develop a backtester from a .py framework / library

# installation :
    
pip install backtesting

# Documentation 

    Index : 
        - Manuals
        - Tutorials
        - Example Strategies
        - FAQ
        - License
        - API Reference Documentation

    source : https://kernc.github.io/backtesting.py/doc/backtesting/

# Features

    * Simple, well-documented API
    * Blazing fast execution
    * Built-in optimizer
    * Library of composable base strategies and utilities
    * Indicator-library-agnostic
    * Supports any financial instrument with candlestick data
    * Detailed results
    * Interactive visualizations

"""
# =============================================================================
# imports and settings
# =============================================================================

# data handling
import pandas as pd
import numpy as np

# import backtesting and set options
import backtesting 

# Set notebook False
backtesting.set_bokeh_output(notebook=False)

from backtesting import Backtest, Strategy
from backtesting.lib import crossover, cross

from backtesting.test import SMA, GOOG

# =============================================================================
# strategy definition
# =============================================================================

class PriceAboveSMA(Strategy):
    
    _ma_period = 21 # Moving Average

    def init(self):
        # compute momentum
        """ Simple Moving Average Calc"""
        self.sma = self.I(SMA, self.data.Close, self._ma_period)
       
    def next(self):
        price = self.data.Close[-1]
        if not self.position and price > self.sma[-1]:
            # market entry
            self.buy()
        elif self.position and price < self.sma[-1]:
            # market exit
            self.position.close()
    
# =============================================================================
# Program Execution
# =============================================================================

if __name__ == '__main__':
    
    
    """ Instantiate the Backtester """
    
    backtester = Backtest(GOOG, PriceAboveSMA, commission=.002,
                  exclusive_orders=True, cash = 10000)
    
    PLOT = True
    
    """ Run a Single Backtest """
    stats = backtester.run()
    
    print(stats)
        
    if PLOT: backtester.plot()
