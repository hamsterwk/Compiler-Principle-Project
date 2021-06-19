#include <vector>
#include <string>
using namespace std;
int line_number=1,node_number=0,FAIL=0;
#define __UPDATEVAL yylval=node_number++;
struct Node{
    int pid,lid,type;
    string msg;
    vector<int>childList;
    Node(){
        pid=-1, msg="";lid=-1;type=0;
        childList.clear();
    }
    Node(int p=0, string m="",int l=0,int t=0){
        pid=p;msg=m;lid=l;type=t;
        childList.clear();
    }
};
vector<Node>NodeList;

void AddNode(string s){
    Node newNode = Node(node_number,s,line_number,0);
    NodeList.push_back(newNode);
}

string ToString(int x){
    string tmp="";
    while(x){
        tmp+=(char)(x%10+'0');
        x/=10;
    }
    for(int i=0;i*2<tmp.length();i++){
        char t = tmp[i];
        tmp[i] = tmp[tmp.length()-i-1];
        tmp[tmp.length()-i-1]=t;
    }
    return tmp;
}

void AddNode2(string s){
    //printf("%s\n",s.c_str());
    Node newNode = Node(node_number,s,line_number,1);
    NodeList.push_back(newNode);
}

void InsertChild(int fa, int ch){
    //printf("%d %d\n",fa,ch);
    //printf("%s -> %s\n",NodeList[fa].msg.c_str(),NodeList[ch].msg.c_str());
    NodeList[fa].childList.push_back(ch);
    //printf("%d %d\n",NodeList[fa].lid,NodeList[ch].lid);
    NodeList[fa].lid = min(NodeList[fa].lid,NodeList[ch].lid);
    //printf("%d %d\n",NodeList[fa].lid,NodeList[ch].lid);
}

void Insert(int a, int b1=-1, int b2=-1, int b3=-1, int b4=-1, int b5=-1, int b6=-1, int b7=-1, int b8=-1){
    if(b1!=-1)InsertChild(a,b1);
    if(b2!=-1)InsertChild(a,b2);
    if(b3!=-1)InsertChild(a,b3);
    if(b4!=-1)InsertChild(a,b4);
    if(b5!=-1)InsertChild(a,b5);
    if(b6!=-1)InsertChild(a,b6);
    if(b7!=-1)InsertChild(a,b7);
    if(b8!=-1)InsertChild(a,b8);
}

void Insert1(int a, int b1){
    Insert(a,b1);
}

void Insert2(int a, int b1,int b2){
    Insert(a,b1,b2);
}

void Insert3(int a, int b1,int b2,int b3){
    Insert(a,b1,b2,b3);
}
void Insert4(int a, int b1,int b2,int b3,int b4){
    Insert(a,b1,b2,b3,b4);
}
void Insert5(int a, int b1,int b2,int b3,int b4,int b5){
    Insert(a,b1,b2,b3,b4,b5);
}
void Insert6(int a, int b1,int b2,int b3,int b4,int b5,int b6){
    Insert(a,b1,b2,b3,b4,b5,b6);
}
void Insert7(int a, int b1,int b2,int b3,int b4,int b5,int b6,int b7){
    Insert(a,b1,b2,b3,b4,b5,b6,b7);
}
void Insert8(int a, int b1,int b2,int b3,int b4,int b5,int b6,int b7,int b8){
    Insert(a,b1,b2,b3,b4,b5,b6,b7,b8);
}

void dfs(int pid, int dep=0){
    for(int i=0;i<dep;i++)printf("  ");
    if(NodeList[pid].type)printf("%s (%d)\n",NodeList[pid].msg.c_str(),NodeList[pid].lid);
    else printf("%s\n",NodeList[pid].msg.c_str());
    for(int i=0;i<NodeList[pid].childList.size();i++){
        int t = (NodeList[pid].childList[i]);
        //printf("%s: %d\n",NodeList[pid].msg.c_str(),t);
        dfs(t,dep+1);
    }
}

void outputTree(){
    dfs(node_number-1);
}

void Myyyerror(const char* type, const char* msg){
	FAIL=true;
    printf("Error type %s at line %d:\t%s\n",type, line_number, msg);
}
