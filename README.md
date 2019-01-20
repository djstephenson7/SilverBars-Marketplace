# SilverBars Marketplace

A tech test for the Zoo @ Credit Suisse.

## Getting Started

To get started, please fork this repo, then click the green 'Clone or download' button in the top right-hand corner of your screen. Copy the SSH key to your clipboard.

Open the terminal on your machine, cd into the directory you want to store the program in and type in:
```
git clone
```
Paste the SSH key and press enter. This will download a copy of the program onto your machine.

## Requirements

Imagine you're working as a programmer for a company called SilverBars Marketplace and you have just received a new requirement. In it we would like to display to our users how much demand for silver bars there is on the market.

To do this we would like to have a 'Live Order Board' that can provide us with the following functionality:

  1) Register an order. Order must contain these fields:-user id-order quantity (e.g.: 3.5 kg)-price per kg (e.g.: £303)-order type: BUY or SELL
  2) Cancel a registered order -this will remove the order from 'Live Order Board'
  3) Get summary information of live orders (see explanation below)

  Imagine we have received the following orders:

    - a) SELL: 3.5 kg for £306 [user1]
    - b) SELL: 1.2 kg for £310 [user2]
    - c)SELL: 1.5 kg for £307 [user3]
    - d) SELL: 2.0 kg for £306 [user4]

  Our ‘Live Order Board’ should provide us the following summary information:

    - 5.5 kg for £306 // order a + order d
    - 1.5 kg for £307 // order c
    - 1.2 kg for £310 // order b

  The first thing to note here is that orders for the same price should be merged together (even when they are from different users). In this case it can be seen that order a) and d) were for the same amount (£306) and this is why only their sum (5.5 kg) is displayed (for £306) and not the individual orders (3.5 kg and 2.0 kg).The last thing to note is that for SELL orders the orders with lowest prices are displayed first. Opposite is true for the BUY orders.

  Notes:

    * Please provide a simple implementation of the live order board in any software language
    * The solution should have some instructions on how to demonstrate its functionality/correctness
    * No database, UI/WEB or a standalone runnable is needed for this assignment
    * Please upload it on GitHub or BitBucket and make it available for us to pull
    * If during your implementation you'll find that something could be designed in multiple different ways, just implement the one which seems most reasonable to you and if you could provide a short (once sentence) reasoning why you choose this way and not another one, it would be great.

## User Stories

```
As a user,
So I can register an order,
I’d like to be able to place an order with the following information:	user ID, quantity in kg, price per kg, order type: BUY or SELL.
```
```
As a user,
So I can get an idea of what’s going on,
I’d like an order board summarising all the orders.
```
```
As a user,
In case I make a mistake,
I’d like to remove an order from the board.
```
```
As a user,
So I can find information quickly,
I’d like the SELL items to be sorted with the lowest price first.
```
```
As a user,
So I can find information quickly,
I’d like the BUY items to be sorted with the high prices first.
```
```
As a user,
So I can merge orders for convenience,
I’d like orders with the same price to be merged into a single order (adding the amount in kg together).
```


### Prerequisites

This program was built with Ruby 2.5.1. Install ruby using:

```
brew install ruby
```

### Installing

This app runs using gems. to install these, run this in your terminal:

```
gem install bundler
bundle install
```

## Running the tests

This application runs using RSpec. This can be run with:

```
rspec
```
<img width="524" alt="screenshot 2019-01-20 at 21 09 21" src="https://user-images.githubusercontent.com/41509062/51445105-339ef280-1cf9-11e9-9b98-3396ea19838c.png">

### Code Coverage

Test coverage was monitored using SimpleCov.

<img width="357" alt="screenshot 2019-01-20 at 21 09 27" src="https://user-images.githubusercontent.com/41509062/51445113-41ed0e80-1cf9-11e9-8367-4863924524ba.png">

### Styling tests

The linting was tested using RuboCop. To run, run:

```
rubocop
```

## Directions for use

Open your REPL with ONE of the following commands:
```
irb
pry
```

Setup

<img width="658" alt="screenshot 2019-01-20 at 21 23 33" src="https://user-images.githubusercontent.com/41509062/51445147-ac05b380-1cf9-11e9-8906-9257dd97774d.png">

Add Order

<img width="407" alt="screenshot 2019-01-20 at 21 14 53" src="https://user-images.githubusercontent.com/41509062/51445155-cf306300-1cf9-11e9-9b70-efa3e57b45b5.png">

Show Order Board

<img width="261" alt="screenshot 2019-01-20 at 21 15 04" src="https://user-images.githubusercontent.com/41509062/51445157-d192bd00-1cf9-11e9-887e-23ee5f14b76d.png">

Delete SELL Order

<img width="261" alt="screenshot 2019-01-20 at 21 15 04" src="https://user-images.githubusercontent.com/41509062/51445157-d192bd00-1cf9-11e9-887e-23ee5f14b76d.png">

## Author

* **Daniel Stephenson** - https://github.com/djstephenson7
