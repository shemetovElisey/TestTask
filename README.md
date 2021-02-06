# TestTask
Предлагаем написать простое приложение, которое будет выводить бесконечно прокручиваемую табличку со всеми «простыми» числами и числами Фибоначчи.

То есть человек может скроллить вниз таблицу бесконечно и в ней будут появляться все новые и новые простые числа. Чтобы генерация сложных чисел не тормозила таблицу, предлагаю вызовы генерации сделать асинхронными и пакетными.

Условия:
* Kotlin для Android, Swift для iOS
* Таблица в две колонки
* Фоны ячеек должны чередоваться в шахматном порядке 
* Прокрутка не должна тормозить
* Память не должна утекать
