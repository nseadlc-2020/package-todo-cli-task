import os
from datetime import date

def help():
    print("Usage :-\n$ ./todo add 'todo item'  # Add a new todo\n$ ./todo ls               # Show remaining todos")
    print("$ ./todo del NUMBER       # Delete a todo")
    print("$ ./todo done NUMBER      # Complete a todo")
    print("$ ./todo help             # Show usage")
    print("$ ./todo report           # Statistics")

def add(i):
    f=open("./todo.txt","a")
    f.write(i)
    f.write("\n")
    f.close()
    print('Added todo: "',i,'"')


def ls():
    size=os.path.getsize("./todo.txt")
    if size==1 or size==0 :
        print("The todo is empty . Add some todo")
    else:
        f=open("./todo.txt","r")
        my_todo=f.readlines()
        k=0
        for i in my_todo:
            k+=1
            print("[",k,"] ",i)
        f.close()

def dl(i):
    f = open("./todo.txt", "r")
    my_todo = f.readlines()
    f.close()
    del my_todo[i-1]
    f=open("./todo.txt","w+")
    f.writelines(my_todo)
    f.close()
    print("Deleted todo #", i)


def done(i):
    f1 = open("./todo.txt", "r")
    my_todo=f1.readlines()
    m=my_todo[i-1][:]
    f = open("./done.txt", "a+")
    f.write("x ")
    today=str(date.today())
    f.write(today)
    f.write(" ")
    f.writelines(m)
    f.close()
    f1.close()
    my_todo1=[]
    f = open("./todo.txt", "r")
    my_todo1= f.readlines()
    f.close()

    del my_todo1[i - 1]
    f = open("./todo.txt", "w+")
    f.writelines(my_todo1)
    f.close()
    print('Marked todo #',i,' as done.')


def report():
    today = str(date.today())
    f=open('./todo.txt','r')
    pen=0
    Content = f.read()
    CoList = Content.split("\n")
    for i in CoList:
        if i:
            pen +=1
    f = open('./done.txt', 'r')
    com = 0
    Content = f.read()
    CoList = Content.split("\n")
    for i in CoList:
        if i:
            com += 1
    print(today,' Pending: ',pen, ' Completed: ', com)


def main():
    f=open("./todo.txt","w")
    f.write(" ")
    f1 = open("./done.txt", "w")
    f1.write(" ")
    k=0
    help()

    while(True):
        try:
            ch=input("$ ").split()
            if ch[0]=='./todo':
                while(ch[1]!='quit'):
                    if ch[1] =='help':
                        help()
                        break
                    if ch[1]=='ls':
                        ls()
                        break

                    if ch[1]=='add':
                        if len(ch)==2:
                            print("You missed the todo.")
                        else:
                            n =" "
                            k+=1
                            add(n.join(ch[2:]))
                        break
                    if ch[1]=='del':
                        if len(ch)==2:
                            print("You missed the todo no.")
                        else:
                            try:
                                m=""
                                dl(int(m.join(ch[2])))
                            except IndexError:
                                print('Error: todo #',ch[2],' does not exist. Nothing deleted.')
                        break
                    if ch[1]=='done':
                        if len(ch)==2:
                            print("You missed the todo no.")
                        else:
                            try:
                                m = ""
                                done(int(m.join(ch[2])))
                            except IndexError:
                                print('Error: todo #', ch[2], ' does not exist. Nothing marked completed.')
                        break
                    if ch[1]=='report':
                        report()
                        break
                    else:
                        print("Invalid Command. Enter Valid command")
                        break

                else:
                    break
            else:
                print("Invalid Command. Enter Valid command from")
                help()
        except IndexError:
            help()




if __name__ == '__main__':
    main()

