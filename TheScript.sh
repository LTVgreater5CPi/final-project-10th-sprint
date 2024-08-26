#!/bin/bash
check_doneWell() {
if [ $? -ne 0 ]; then
echo "Скрипт сдох, иди лучше обратно в свой геймдев"
exit 1
fi
}
# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4
mkdir -p task/{dir1,dir2,dir3/dir4}
check_doneWell
# изменяем текущую директорию на task
cd ./task
check_doneWell
# создаём пустой файл task/dir2/empty
touch dir2/empty
check_doneWell
# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
echo '#!/bin/bash
echo "$1, привет!"' > dir2/hello.sh
check_doneWell
# устанавливаем для task/dir2/hello.sh права rwxrw-r--
chmod 764 dir2/hello.sh
check_doneWell
# сохраняем список файлов task/dir2 в task/dir2/list.txt
ls dir2 > dir2/list.txt
check_doneWell
# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cp -r -T dir2 dir3/dir4
check_doneWell
# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории
find ./ -name "*.txt" > ./dir1/summary.txt
check_doneWell
# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat ./dir2/list.txt >> ./dir1/summary.txt
check_doneWell
# определяем переменную окружения NAME со значением "Всем студентам"
NAME='Всем_студентам' #выводилось только "всем", без студентов. Добавил нижнее подчеркивание
# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt
 ./dir2/hello.sh $NAME >> ./dir1/summary.txt
check_doneWell
# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
mv ./dir1/summary.txt ./'Практическое задание'
check_doneWell
# выводим на консоль содержимое файла task/Практическое задание
 cat ./'Практическое задание'
# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их
grep "dir" ./'Практическое задание' |sort
check_doneWell
# меняем текущую директорию на родительскую для task
cd ..
check_doneWell
# удаляем директорию task со всем содержимым
rm -r ./task
check_doneWell
