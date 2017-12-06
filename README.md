# AOP-DAS

This is a assignment for "Desenvolvimento Avançado de Software - DAS" class at Universidade de Brasília.

The ideia behind this assignment is to propose and develop a simple framework based in "Aspect Oriented Programming - AOP" concepts.

## This project

So, this project is a simple log system written based in AOP concepts. It keeps track of which methods are being called and gets the running time for each method.

The example uses a Merge Sort algorithm and LoggerAspect and TimerAsbtarct extensions.


![](https://imgur.com/5aOMepv.png)

## Hotspots and Frozenspots
### Hotspot - LoggerAspect
- You can easily extends the LoggerAspect as you wish, overriding methods and AOP items.
- When you extends the LoggerAspect, you need to tell which classes you will be logging
- You can see a example in Logger.aj

### Frozenspot - LoggerAspect
- You can only use the logging methods and stream definition in LoggerAspect, but cannot override it.

### Hotspot - TimerAbstract
- You can extend the Timer functionality by overriding the set and get times methods.
- In the Timer.java example, it uses the default implementation defined in TimerAbstract.java


## Students
[Matheus de Oliveira Silva](https://github.com/MFire30) - 14/0028331

[Stefânia Bezerra da Silva](https://github.com/stebezs) - 14/0031634
