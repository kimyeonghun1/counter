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
        '<iframe width="1280" height="720" src="https://www.youtube.com/embed/nWhS28U6bCY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', 
        '바벨라토르 홈트레이닝', 
        'https://img.youtube.com/vi/nWhS28U6bCY/0.jpg'
      ),
      new Post(
        '친업', 
        'https://www.youtube.com/watch?v=6GWGVAO8oU4', 
        '핏블리',
        'https://img.youtube.com/vi/6GWGVAO8oU4/0.jpg'
      ),
      new Post(
        '풀업VS친업', 
        'https://www.youtube.com/watch?v=1oIi0g363MI', 
        '피지컬갤러리', 
        'https://img.youtube.com/vi/1oIi0g363MI/0.jpg'
      ),
      new Post(
        '푸쉬업', 
        'https://www.youtube.com/watch?v=aoH7qNedO8k', 
        '피지컬갤러리',
        'https://img.youtube.com/vi/aoH7qNedO8k/0.jpg'
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
        'https://img.youtube.com/vi/tfwbpv6gCbg/0.jpg'
      ),
      new Post(
        '스쿼트', 
        'https://www.youtube.com/watch?v=QyAH8O5X6g0', 
        '강경원',
        'https://img.youtube.com/vi/QyAH8O5X6g0/0.jpg'
      ),
      new Post(
        '하체스트레칭', 
        'https://www.youtube.com/watch?v=UBVPNC1FBgc', 
        '피지컬갤러리', 
        'https://img.youtube.com/vi/UBVPNC1FBgc/0.jpg'
      ),
      new Post(
        '상체스트레칭', 
        'https://www.youtube.com/watch?v=FsTkLYaUh_o', 
        '피지컬갤러리',
        'https://img.youtube.com/vi/FsTkLYaUh_o/0.jpg'
      ),
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