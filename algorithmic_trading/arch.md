### Algorithmic Trading Systems Architecture
Conceptual Architecture

A conceptual view describes high level concepts and mechanisms that exist in the system at the highest level of granularity. At this level, the algorithmic trading system follows an event driven architecture (EDA) broken up across four layers, and two architectural aspects. For each layer and aspect reference architectures and patterns are used. Architectural patterns are proven, generic structures for achieving specific requirements. Architectural aspects are cross-cutting concerns which span multiple components.

##### Event driven architecture
    an architecture which produces, detects, consumes, and reacts to events. 
    Events include real time market movements, complex events or trends, and trading events.
    e.g. submitting an order.

![alt text](https://github.com/CatalaniCD/quantitative_finance/blob/main/algorithmic_trading/arch_concept.png)

Source : http://www.turingfinance.com/algorithmic-trading-system-architecture-post/
