#include <bits/stdc++.h>
using namespace std;

constexpr char nl='\n';
#define pb push_back
#define sz(c) (int)(c.size())
#define all(c) c.begin(),c.end()
#define rep(a, b) for(int a=0; a<b; ++a)

using ll=long long;
template <typename T> using vec=vector<T>;

#ifndef LOCAL
#define LOCAL 0
#endif
#define ifbug if constexpr(LOCAL)
#define bug(...) ifbug{cerr<<"["#__VA_ARGS__"]: ";bug__(__VA_ARGS__);cerr<<'\n';}
template <class...A> void bug__(A&&...a){((cerr<<a<<' '),...);}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int n;
    cin>>n;

    cout<<n<<nl;
}
