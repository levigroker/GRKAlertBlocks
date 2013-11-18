GRKAlertBlocks
===========
A super simple UIAlertView category adding block syntax for button actions.

### Rationale

Yes, I know this has been done hundreds of times by many people and in many ways. I wrote
this for a couple reasons. First, with iOS 7 I'm generally happy with the default
appearance and functionality of UIAlertView so why use a completely custom alert? Second,
though there are lots of other implementations of this concept, I wasn't happy with any of
the rest. They were either too heavyweight, had a poor API, or sketchy implementation.
Lastly, why, why, why, hasn't Apple updated the antiquated delegate interface for
UIAlertView yet?

### Installing

If you're using [CocoPods](http://cocopods.org) it's as simple as adding this to your `Podfile`:

	pod 'GRKAlertBlocks', '~> 1.0.1'

### Documentation

Use as you would normally use UIAlertView, but instantiation is now a class level message,
and adding a button can now take a block to be executed when tapped.

    UIAlertView *alert = [UIAlertView alertWithTitle:@"Title" message:@"Message"];
    [alert addButtonWithTitle:@"Foo" handler:^{
        NSLog(@"Foo!");
    }];
    [alert addButtonWithTitle:@"Bar" handler:^{
        NSLog(@"Bar!");
    }];
    [alert show];

**NOTE**: If you set your own delegate on the alert, no handler blocks will be called.

Additional documentation is available in `GRKAlertBlocks.h`.

#### Licence

* This work is licensed under the [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).
  Please see the included LICENSE.txt for complete details.

#### About
A professional iOS engineer by day, my name is Levi Brown. Authoring a technical
blog [grokin.gs](http://grokin.gs), I am reachable via:

Twitter [@levigroker](https://twitter.com/levigroker)  
App.net [@levigroker](https://alpha.app.net/levigroker)  
Email [levigroker@gmail.com](mailto:levigroker@gmail.com)  

Your constructive comments and feedback are always welcome.
