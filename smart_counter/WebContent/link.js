class Post {
  constructor(title, link, author, img) {
    this.title = title;
    this.link = link;
    this.author = author;
    this.img = img;
  }
}

const app = new Vue ({
  el: '#app',
  data: {
    search: '',
    postList : [
      new Post(
        '풀업', 
        'https://www.youtube.com/watch?v=nWhS28U6bCY&t=1s', 
        '바벨라토르', 
        'https://i.ytimg.com/an_webp/nWhS28U6bCY/mqdefault_6s.webp?du=3000&sqp=CNT67IsG&rs=AOn4CLBdmnu4wFUAhQF2XQXzxZG_QMH9xg'
      ),
      new Post(
        '친업', 
        'https://www.youtube.com/watch?v=6GWGVAO8oU4', 
        '핏블리',
        'https://i.ytimg.com/an_webp/6GWGVAO8oU4/mqdefault_6s.webp?du=3000&sqp=COzP7IsG&rs=AOn4CLAb-DMNPj6ByQ0j6MDn_hqML2NsGA'
      ),
      new Post(
        '풀업VS친업', 
        'https://www.youtube.com/watch?v=1oIi0g363MI', 
        '피지컬갤러리', 
        'https://i.ytimg.com/an_webp/1oIi0g363MI/mqdefault_6s.webp?du=3000&sqp=CO6t7YsG&rs=AOn4CLDt2M5BLpjgy7JDHmemLAuUVUESjw'
      ),
      new Post(
        '푸쉬업', 
        'https://www.youtube.com/watch?v=-_DUjHxgmWk&t=1s', 
        '바벨라토르',
        'https://i.ytimg.com/an_webp/-_DUjHxgmWk/mqdefault_6s.webp?du=3000&sqp=CPjt7IsG&rs=AOn4CLAjTzaPO41ERnTYRpLeql1SGTwjhQ'
      ),
      new Post(
        '25가지 푸쉬업', 
        'https://www.youtube.com/watch?v=Npx3ygB2eRY', 
        '데스런', 
        'https://img.youtube.com/vi/Npx3ygB2eRY/0.jpg'
      ),
      new Post(
        '싯업', 
        'https://www.youtube.com/watch?v=tfwbpv6gCbg', 
        '지피티',
        'https://i.ytimg.com/an_webp/tfwbpv6gCbg/mqdefault_6s.webp?du=3000&sqp=CNit7YsG&rs=AOn4CLCQKcca5pEf6Ely9sQFFth_WpcV0g'
      ),
      new Post(
        '스쿼트', 
        'https://www.youtube.com/watch?v=QyAH8O5X6g0', 
        '강경원',
        'https://i.ytimg.com/an_webp/QyAH8O5X6g0/mqdefault_6s.webp?du=3000&sqp=CMCy7YsG&rs=AOn4CLCQEAQW5SiPE6gwBtzPRu-eu7a9vQ'
      ),
      new Post(
        '하체스트레칭', 
        'https://www.youtube.com/watch?v=UBVPNC1FBgc', 
        '피지컬갤러리', 
        'https://i.ytimg.com/an_webp/UBVPNC1FBgc/mqdefault_6s.webp?du=3000&sqp=CPiJ7YsG&rs=AOn4CLDigZJtQN95jyvaCuke0E446zhChQ'
      ),
      new Post(
        '상체스트레칭', 
        'https://www.youtube.com/watch?v=FsTkLYaUh_o', 
        '피지컬갤러리',
        'https://i.ytimg.com/an_webp/FsTkLYaUh_o/mqdefault_6s.webp?du=3000&sqp=CNau7YsG&rs=AOn4CLAL9ltsF7tfa1c1f0Ht4ihOIJFn7Q'
      )
     
]
  },
  computed: {
    filteredList() {
      return this.postList.filter(post => {
        return post.title.toLowerCase().includes(this.search.toLowerCase())
      })
    }
  }
})