
import matplotlib.pyplot as plt
import seaborn as sns
import io,pymongo

import base64
plt.switch_backend('agg')
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["AGRICULTURE"]
mycol = mydb["GRAPHS"]
#

id=1
def build_graph1(res,crop,district):
    img=io.BytesIO()
    sns.set_style("dark")
    lists=sorted(res.items())
    x,y=zip(*lists)
    plt.plot(x,y)
    plt.xlabel("INVESTMENT")
    plt.ylabel("RETURN")
    plt.title(crop+'(' +district +')')
    plt.grid(True)
    plt.savefig(img,format='png')
    img.seek(0)
    graph_url=base64.b64encode(img.getvalue()).decode()
    x=mycol.insert({"filename":crop,"district":district,"url":graph_url})

    plt.close()
    return 'data:image/png;base64,{}'.format(graph_url)
