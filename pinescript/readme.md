# Pine Script 

![alt text](https://github.com/CatalaniCD/quantitative_finance/blob/main/pinescript/pinescript.png?raw=true)

" TradingView has designed its own scripting language called Pine Script. It allows users to create custom indicators and run them on our servers. Pine was designed as a lightweight language focused on the specific task of developing indicators and strategies. Most of TradingView’s built-in indicators have been coded in Pine. It is our explicit goal to keep Pine accessible and easy to understand for the broadest possible audience.

Pine is cloud-based and therefore different in nature to client-side programming languages. While we will not develop Pine into a full-fledged language with high-end coding capabilities for building very complex tools, constantly improving Pine is one of our highest priorities and we are happy to consider any requests for new features."

Source : https://www.tradingview.com/pine-script-docs/en/v4/Introduction.html

### Apps / Solutions
  
  - Customized Indicators
  - Customized Trading Alerts
  - Backtesting Trading Logic

### Indexing Solution

    // This source code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
    // © CatalaniCD

    //@version=4
    study("Indexing Solution", overlay = false)
    // select assets
    s_1 = input(title = 'Index_1', type = input.symbol, defval = 'BINANCE:ETHUSDT')
    s_2 = input(title = 'Index_2', type = input.symbol, defval = 'BINANCE:BNBUSDT')
    s_3 = input(title = 'Index_3', type = input.symbol, defval = 'BINANCE:ADAUSDT')
    s_4 = input(title = 'Index_4', type = input.symbol, defval = 'BINANCE:BCHUSDT')
    s_5 = input(title = 'Index_5', type = input.symbol, defval = 'BINANCE:BTCUSDT')
    // request price
    asset_0 = security(symbol = syminfo.ticker,  resolution = timeframe.period, expression = close)
    asset_1 = security(symbol = s_1,  resolution = timeframe.period, expression = close)
    asset_2 = security(symbol = s_2,  resolution = timeframe.period, expression = close)
    asset_3 = security(symbol = s_3,  resolution = timeframe.period, expression = close)
    asset_4 = security(symbol = s_4,  resolution = timeframe.period, expression = close)
    asset_5 = security(symbol = s_5,  resolution = timeframe.period, expression = close)
    // create index
    index = change(log(asset_1),1) + change(log(asset_2),1) + change(log(asset_3),1) + change(log(asset_4),1) + change(log(asset_5),1)
    // compute delta
    delta = cum(change(log(asset_0),1)) - (cum(index)/5)
    // compute spread
    spread = delta - wma(delta, 10)
    // zero line
    hline(0.0, color = color.white)
    // plot spread
    plot(spread)
    
### RSI Differentiation
    // © CatalaniCD
    //@version=4
    study(title="dRSI_dt", shorttitle="dRSI_dt")
    period = input(14, minval=2)
    hline( 0, color= color.white, linestyle = hline.style_dashed)
    rsi = rsi(ohlc4, period)
    returns = change(log(rsi),1)
    plot(returns, style = plot.style_area, title="dRSI_dt")
 
  
### Indicators Sample:

![alt text](https://github.com/CatalaniCD/quantitative_finance/blob/main/pinescript/pine_indicators.png?raw=true)

#### [Trading View Profile](https://www.tradingview.com/u/CatalaniCD/)
#### [Certification : Pine Script Programming ](https://www.udemy.com/certificate/UC-86e2dd1b-e579-452a-bb11-dbe75b537dc5/)
#### [Certification : Pine Script Strategies ](https://www.udemy.com/certificate/UC-66b132ae-476a-4a2a-8aa5-381d6ebf62d2/)
