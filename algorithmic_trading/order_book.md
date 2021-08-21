# Order Book

An order book is the list of orders (manual or electronic) that a trading venue (in particular stock exchanges) uses to record the interest of buyers and sellers in a particular financial instrument. A matching engine uses the book to determine which orders can be fully or partially executed. 

### Order book in securities trading

In securities trading an order book contains the list of buy orders and the list of sell orders. For each entry it must keep among others, some means of identifying the party (even if this identification is obscured, as in a dark pool), the number of securities and the price that the buyer or seller are bidding/asking for the particular security.

##### Price levels
When several orders contain the same price, they are referred as a price level, meaning that if, say, a bid comes at that price level, all the sell orders on that price level could potentially fulfill that.

##### Crossed book
When the order book is part of a matching engine, orders are matched as the interest of buyers and sellers can be satisfied. When there are orders where the bid price is equal or higher than the lowest ask, those orders can be immediately fulfilled and will not be part of the open orders book. If this situation remains, due to an error or a condition of the market, the order book is said to be crossed.

##### Top of the book
The highest bid and the lowest ask are referred to as the top of the book. They are interesting because they signal the prevalent market and the bid and ask price that would be needed to get an order fulfilled. The difference between the highest bid and the lowest ask is called the bid–ask spread.

##### Book depth
The book depth refers simply to the number of price levels available at a particular time in the book. Sometimes the book is represented to a fixed depth, and orders beyond that depth are ignored or rejected, and in other cases the book can contain unlimited levels.

##### Multi-specialist book
In most practical applications, an order book contains bid and offer for one security, contract or good, with a specialist matching orders for the specific item. In his work, Jean-François Mertens extends this and constructs an order matching mechanism that works across specialists, where he can cross orders that are not only in terms of bid and offer for a given traded item, but bids and offer can be expressed as a linear function of other traded items. 

Source : https://en.wikipedia.org/wiki/Order_book
