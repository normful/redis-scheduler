Scheduler = require './index'

scheduler = new Scheduler({ host: 'localhost', port: 6379, pass: 'hello'})

futureCheck = (err, key) ->
  console.log "futureCheck #{key}"

for i in [0...10]
  scheduler.schedule
    key: "john-#{i}"
    expire: i*1000
    handler: futureCheck
    , (err) -> console.log 'scheduled'

setTimeout (-> scheduler.cancel({key: 'john-7'}, (err) -> console.log 'cancelled')), 2500
