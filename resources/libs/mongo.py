from robot.api.deco import keyword
from pymongo import MongoClient 
import certifi

client = MongoClient('<uri>', tlsCAFile=certifi.where())
db= client['markX']

@keyword('Remove task from database')
def remove_task_by_name(task_name):
        collection = db['tasks']
        collection.delete_many({'text': task_name})
        print(f'Removidas tarefa com o nome {task_name}')