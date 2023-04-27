package presenter;

import model.*;
import view.ConsoleTerminal;

/**
 * класс презентер, для взаимодействия view и model
 */
public class Controller {
    private ConsoleTerminal view;

    public Controller(ConsoleTerminal view) {
        this.view = view;
        view.setController(this);
    }

    public void onClick() throws Exception {
        view.printStr("Вас приветствует программа создания реестра домашних животных ");
        Registry registry = new Registry(); //создадим эк. реестр
        Counters count = new Counters();
        while (true) {
            switch (view.scanInt("Доступны следущие функции:\n 1 - просмотр всех животных в реестре,\n " +
                    "2 - добаввление в реестр животного,\n 3 - просмотр команд животного\n 4 - обучить команде животное\n 5 - выход")) {
                case 1: //просмотр всех животных в реестре
                    if (registry.getRegistry().size()<1) {view.printStr("Пока нет животных в реестре. Добавьте животное");}
                    else registry.printRegistry();
                    break;
                case 2: //добавление животного
                    try {
                    String viewAnimals = view.scanString("введите вид животного(кошка, собака, хомяк)");
                    if (!(viewAnimals.equals("кошка") | viewAnimals.equals("собака") | viewAnimals.equals("хомяк"))) throw new Exception("Неверный вид животного");
                    String name = view.scanString("Введите кличку животного");
                    if (name == null) throw new Exception("Не ввели кличку животного");
                    String data = view.scanString("Введите дату рождения животного в формате dd.mm.yyyy");
                    if (!data.matches(("^(0?[1-9]|[12][0-9]|3[0-1]).(0?[1-9]|1[0-9]).\\d{4}$"))) throw new Exception("Введен неверный формат даты");
                    switch (viewAnimals){
                        case "кошка":
                            Cat animalsCat = new Cat(count.getId(), name, data);
                            count.add(); //увеличение счетчика
                            registry.addRegistry(animalsCat);
                            break;
                        case "собака":
                            Dog animalsDog = new Dog(count.getId(), name, data);
                            count.add();//увеличение счетчика
                            registry.addRegistry(animalsDog);
                            break;
                        case "хомяк":
                            Hamster animalsHam = new Hamster(count.getId(), name, data);
                            count.add();//увеличение счетчика
                            registry.addRegistry(animalsHam);
                            break;
                    }
                    view.printStr("Животное добавлено");
                    } catch (Exception e) {
                        view.printStr(e.getMessage());
                    }
                    break;
               case 3: //ввывод команд животного
                   Integer idAnimals = view.scanInt("Введите id животного,чтобы посмотреть команды");
                   if (registry.searchAnimals(idAnimals) == null | idAnimals == null)  {
                       view.printStr("Нет такого id животного");
                       break;}
                   else {view.printStr(registry.searchAnimals(idAnimals).getCommands().toString());}
                   break;
               case 4: //обучение команде животного (добавление команды)
                   Integer idAnimal = view.scanInt("Введите id животного,чтобы обучить команде");
                   if (registry.searchAnimals(idAnimal) == null | idAnimal == null)  {
                       view.printStr("Нет такого id животного");
                       break;}
                   else {
                       String command = view.scanString("Введите команду животного");
                       registry.searchAnimals(idAnimal).setCommands(command);
                       view.printStr("Команда добавлена");}
                   break;
               case 5: //выход
                   view.printStr("Досвидание!");
                   return;
               default:
                    view.printStr("Такой команды нет");
                    break;
            }

        }
    }

}