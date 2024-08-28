# d2WebCard
Este repositório contém um conjunto de classes Delphi desenvolvido para gerar cards no formato HTML.

# Instalação
Instalação usando o boss
```
boss install https://github.com/rafaeljeremias/d2WebCard.git
```

# Declaração
Para utilizar o d2webCard você deve adicionar as uses:
```pascal
  Model,
  Model.Interfaces;
```

# Como usar
```pascal  
  var LCardData := TModel.New.Entities
                 .CardData.Text('Valor do dia (R$)')
                   .Icon(wciMoney)
                   .Value(3054, wccDark, wccNone, True, wccWarning, wccDanger);

  TModel.New.Card(LCardData).Generate;
```
