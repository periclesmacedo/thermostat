
# Thermostat

A server applcation to communicate between users and their thermostat devices.

## How to setup
To setup this project, you need to have [ruby](https://rvm.io/rvm/install) and [postgres](https://www.postgresql.org/download/) installed

```
git clone https://github.com/periclesmacedo/thermostat
cd thermostat
bundle install
rake db:setup
```
## How to test

You can run the tests with`rake spec`

## Todo
- [x] sign up through json endoint
- [x] sign in through json endpoint
- [ ] sign up through page
- [ ] sign in through page
- [ ] CRUD user info through endpoint
- [ ] CRUD user info through account page
- [ ] register device through endpoint
- [ ] assign device through endpoint
- [ ] assign device through account page
- [ ] send temperature change command through endpoint
- [ ] communicate device command through MQTT channel
- [ ] receive real time stats from device (MQTT, plain websocket, or bulk json?)
- [ ] calculate device stats on account page
- [ ] calculate device stats and send through endpoint
