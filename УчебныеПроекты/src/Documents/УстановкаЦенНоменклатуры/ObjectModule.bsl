Процедура ОбработкаПроведения(Отказ,Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	// регистр ЦеныПоВидамЦен
	Движения.ЦеныПоВидамЦен.Записывать = Истина;
	Для Каждого ТекСтрокаТовары из Товары Цикл
		Движение = Движения.ЦеныПоВидамЦен.Добавить();
		Движение.Период = Дата;
		Движение.Товары = ТекСтрокаТовары.Номенклатура;
		Движение.ВидыЦен = ВидЦены;
		Движение.Цена = ТекСтрокаТовары.Цена;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры