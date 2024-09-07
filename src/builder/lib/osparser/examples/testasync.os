// Пример скрипта выполняющего проверку исходного кода

#Использовать "../src"
#Использовать "../../../../builder/Классы/plugins"

// читаем исходный код, который хотим проверить.
ЧтениеТекста = Новый ЧтениеТекста("../../../../Инструменты/src/CommonModules/УИ_МетодыСовмеcтимостиПлатформы_8_3_18Клиент/Module.bsl");
Исходник = ЧтениеТекста.Прочитать();
ЧтениеТекста.Закрыть();

ПлагинУстановитьДирективыУМетодов = Новый УстановитьДирективыУМетодов();

Плагины = Новый Массив();
Плагины.Добавить(ПлагинУстановитьДирективыУМетодов);

ПараметрыПлагинов = Новый Соответствие;
ПараметрыПлагинов[ПлагинУстановитьДирективыУМетодов] = "&НаКлиенте";

// Запуск проверки на данном исходном коде (Исходник) с желаемым набором плагинов (Плагины).
Парсер = Новый ПарсерВстроенногоЯзыка;
Результаты = Парсер.Пуск(Исходник, Плагины, ПараметрыПлагинов);

Замены = Парсер.ТаблицаЗамен();
Если Замены.Количество() > 0 Тогда
	НовыйИсходник = Парсер.ВыполнитьЗамены();
Иначе
	НовыйИсходник = Исходник;
КонецЕсли;