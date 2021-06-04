# oystercard

A Makers Week 2 pair programming challenge.

* **Languages used**: Ruby
* **Testing frameworks**: RSpec

### Functional Representation of User Stories

Objects  | Messages
------------- | -------------
Oystercard | initialize, balance, top_up(value), deduct(amount), in_journey?, touch_in, touch_out
Station | name (something it has), zone(something it has)

### Domain Model

```
Oystercard <-- initialize --> sets balance to 0, in_journey? is false
Oystercard <-- balance --> value
Oystercard <-- top_up(value) --> balance, returns an error if balance > MAXIMUM_BALANCE
Oystercard <-- deduct(amount) --> balance, returns error if 
amount > @balance
Oystercard <-- in_journey? --> true/false
Oystercard <-- touch_in --> true
Oystercard <-- touch_out --> false


```