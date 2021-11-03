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
        'https://img.youtube.com/vi/nWhS28U6bCY/1.jpg', 
        '바벨라토르', 
        'https://i.ytimg.com/an_webp/nWhS28U6bCY/mqdefault_6s.webp?du=3000&sqp=CNbSh4wG&rs=AOn4CLDSftffwgwpTP74pvYQ4wv-jVd9UA'
      ),
      new Post(
        '친업', 
        'https://www.youtube.com/watch?v=6GWGVAO8oU4', 
        '핏블리',
        'https://i.ytimg.com/an_webp/6GWGVAO8oU4/mqdefault_6s.webp?du=3000&sqp=CLjIh4wG&rs=AOn4CLBTIbDVL8p2a5PdGWf0ED_QwSYdWA'
      ),
      new Post(
        '풀업VS친업', 
        'https://www.youtube.com/watch?v=1oIi0g363MI', 
        '피지컬갤러리', 
        'https://i.ytimg.com/an_webp/1oIi0g363MI/mqdefault_6s.webp?du=3000&sqp=CPq7h4wG&rs=AOn4CLB-wTKhaY_NpuBBmAoN2VcmVjURHQ'
      ),
      new Post(
        '푸쉬업', 
        'https://www.youtube.com/watch?v=-_DUjHxgmWk&t=1s', 
        '바벨라토르',
        'https://i.ytimg.com/an_webp/-_DUjHxgmWk/mqdefault_6s.webp?du=3000&sqp=CLq5h4wG&rs=AOn4CLDDhJyhlyudyQmg7g4vxpeeFdgmDw'
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
        'https://i.ytimg.com/an_webp/tfwbpv6gCbg/mqdefault_6s.webp?du=3000&sqp=CMDEh4wG&rs=AOn4CLC3bw8_F7Uo3vlALIoN-_QMUu1tnA'
      ),
      new Post(
        '스쿼트', 
        'https://www.youtube.com/watch?v=QyAH8O5X6g0', 
        '강경원',
        'https://i.ytimg.com/an_webp/QyAH8O5X6g0/mqdefault_6s.webp?du=3000&sqp=CLXmh4wG&rs=AOn4CLB5PQw5cYHpBm3iLxHxTmnhNimbHQ'
      ),
      new Post(
        '하체스트레칭', 
        'https://www.youtube.com/watch?v=UBVPNC1FBgc', 
        '피지컬갤러리', 
        'https://i.ytimg.com/an_webp/UBVPNC1FBgc/mqdefault_6s.webp?du=3000&sqp=COzCh4wG&rs=AOn4CLD0DgrFPfG3bAlUPRWSuKVN7ROTJQ'
      ),
      new Post(
        '상체스트레칭', 
        'https://www.youtube.com/watch?v=FsTkLYaUh_o', 
        '피지컬갤러리',
        'https://i.ytimg.com/an_webp/FsTkLYaUh_o/mqdefault_6s.webp?du=3000&sqp=CNLlh4wG&rs=AOn4CLD-sRDjReG6_IkssiztaWfCDMtTUQ'
      ),
      new Post(
        '플랭크', 
        'https://youtu.be/Zq8nRY9P_cM', 
        '바벨라토르',
        'https://i.ytimg.com/an_webp/Zq8nRY9P_cM/mqdefault_6s.webp?du=3000&sqp=CLDbh4wG&rs=AOn4CLAvesm5yZMV2rmqQCXG-PHRL90BxQ'
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