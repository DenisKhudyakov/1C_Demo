
&НаСервереБезКонтекста
Процедура СозданиеДокументаНаСервере()
	НовыйОбъект = Документы.ПоступлениеТоваров.СоздатьДокумент();
	НовыйОбъект.Дата = ТекущаяДата();
	
	Контрагент = Справочники.Контрагенты.НайтиПоКоду("000000005");
	
	НовыйОбъект.Контрагент=Контрагент;
	
	НоваяСтрока = НовыйОбъект.Товары.Добавить();
	НоваяСтрока.Количество = 10;
	НоваяСтрока.Цена = 10;
	НовыйОбъект.Записать();
КонецПроцедуры

&НаКлиенте
Процедура СозданиеДокумента(Команда)
	СозданиеДокументаНаСервере();
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ВыбратьЗапросомНаСервере()
//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ПоступлениеТоваров.Номер,
		|	ПоступлениеТоваров.Дата,
		|	ПоступлениеТоваров.Товары.(
		|		Номенклатура,
		|		Количество)
		|ИЗ
		|	Документ.ПоступлениеТоваров КАК ПоступлениеТоваров";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		ВыборкаТЧ = ВыборкаДетальныеЗаписи.Выбрать();
		Пока ВыборкаТЧ.Следующий() Цикл
			// Вставить обработку выборки ВыборкаДетальныеЗаписи
		КонецЦикла;
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА	
	
	
	
КонецПроцедуры

&НаКлиенте
Процедура ВыбратьЗапросом(Команда)
	ВыбратьЗапросомНаСервере();
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ВыбратьЗаИнтервалНаСервере(ДН, ДО)
	Выборка=Документы.ПоступлениеТоваров.Выбрать(ДН, КонецДня(ДО));
		Пока Выборка.Следующий() Цикл
			Сообщить(Строка(Выборка.Номер));
			Для Каждого ТекСтрока Из ВЫборка.Товары Цикл
				Сообщить(Строка(ТекСтрока.Номенклатура));
			КонецЦикла;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ВыбратьЗаИнтервал(Команда)
	ВыбратьЗаИнтервалНаСервере(Объект.ДатаНачала, Объект.ДатаОкончания);
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ВыбратьДанныеНаСервере()
	Выборка=Документы.ПоступлениеТоваров.Выбрать();
	Пока Выборка.Следующий() Цикл
		Сообщить(Строка(Выборка.Номер));
		Для Каждого ТекСтрока Из ВЫборка.Товары Цикл
			Сообщить(Строка(ТекСтрока.Номенклатура));
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ВыбратьДанные(Команда)
	ВыбратьДанныеНаСервере();
КонецПроцедуры
