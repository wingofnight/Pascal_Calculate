{Лайт Херувим, урок №3, задача 20 - Васе m лет, а Паше k лет.
Напишите программу, в которая считает их суммарный возраст и
выводит значение на экран.

Это программа - простейший калькулятор.
Она умеет делать 4 обычных действия - «+,-,/,*»
a так же, дополнительно высчитывать квадратный корень и степень числа.
}

program Calculate;
type
BigText =  array [0..2] of string; //Тип массива для большого текста
var standart_text : BigText;  //Стандартный текст приветствия
    exit: boolean;
    choice:char;//Это выбор нашего пользователя
//Процедура которая выводит 3 строчки текста
procedure Write_BigText(text:BigText); //Принимает в себя переменную типа BixText - массив на три строчки.
var i : integer;   //переменная для цикла for
begin
  for i:=0 to 2 do
  begin
     writeln(text[i]); //выводит по одной строчке с отступом.
    end;

end;

//Функция которая проводит математические подсчеты
function Math(a:real; b: real; choice_f: char): real;  //Принимает два числа пользователя и модуль
var i: integer;   //Итей нужна работы цикла фор
    j: integer;  //Джета нужна для конвертации из настоящего в целое число.
begin
   if (choice_f = '+') then          //Складываем
   result:= a+b
   else if (choice_f = '-') then    //Вычитаем
   result:= a-b
   else if (choice_f = '*') then    //Умножаем
   result:= a*b
   else if (choice_f = '/')then begin  //Делим
   if(b <> 0) then begin
   result:=a/b
   end else
   writeln('You shell not pass!!!');     //Убеждаемся что не делим на ноль
   end else if (choice_f = '^') then begin
     j:= Round(b);
     for  i:=0 to j do
     begin
     a:=a*a;
     end;
   result:= a;
   end else
   writeln('Wrong away');

   end;


//Функция которая общается с пользователем.
procedure User_Interface();
var first_number,last_number: real;//числа которые вводит пользователь

begin
  writeln();        //Любезное приветсвие
  writeln('Choice the procedure -- "+","-","*","/" if you want to calculate');
  writeln('or this - "^" if you want to calculate power of the number.');
  writeln('and this - "p" if you want to calculate square-root of the number.');
  writeln();
  writeln('prees enter you choice');

  readln(choice);

  if(choice = 'p') or (choice = 'P') then begin // Этот метод отделен, так как он спрашивает всего одно число
  writeln('Prees first number');    //однако с этим связаны проблемы в будующем
  readln(first_number);
  writeln('Result = ',Sqrt(first_number)); //Вводим первое число и единственное
  end;

  if(choice = '+') or (choice = '-') or (choice = '*') or (choice = '/') or (choice = '^') then   //функция вычисления корня тут определяется как ошибка.
  begin
  writeln('Prees first number');  //Вводим первое число
  readln(first_number);
  writeln('Press last number');  //Вводим второе число
  readln(last_number);
  writeln('Result = ',Math(first_number,last_number,choice)); //Получаем рузельтат по средству функции - "Математика"

  end else begin
  writeln('Error - Wrong choice!!!'); //Сообщение говорит о том, что сделан не правильный выбор
  end;
  end;



begin
  exit:=false;//переменная которая отвечает за зацикленность программы

  standart_text[0] := 'Hello! This program is a simple calculator.';
  standart_text[1] := 'She can do 4 normal actions - "+,-,/,*" also,';
  standart_text[2] := 'additionally calculate the square-root and power of the number.';
  Write_BigText(standart_text); //Выводим приветсвенный текст

  while(exit = false) do  //цикл в котором находится пользователь, пока выбирает оставаться в нем
  begin

  User_Interface();  //функция которая общается с пользователем
  writeln();
  writeln('Againe? press the "Y" to continue and Any button to exit');
  readln(choice);
  if(choice ='y') or(choice = 'Y') then
  exit:=false  //Если выбор вере, пользователь остается в цикле.

  else
  exit:=true;    //Если нет, программа звершается.
  end;


end.



