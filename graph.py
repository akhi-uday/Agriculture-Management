
import matplotlib.pyplot as plt
import seaborn as sns
import io

import base64
plt.switch_backend('agg')
def build_graph(res,crop,district):
    img=io.BytesIO()
    sns.set_style("dark")
    lists=sorted(res.items())
    x,y=zip(*lists)
    plt.scatter(x,y)
    plt.xlabel("INVESTMENT")
    plt.ylabel("RETURN")
    plt.title(crop+'(' +district +')')
    plt.grid(True)
    plt.savefig(img,format='png')
    img.seek(0)
    graph_url=base64.b64encode(img.getvalue()).decode()
    plt.close()
    return 'data:image/png;base64,{}'.format(graph_url)
