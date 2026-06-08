//
//  MainTabView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct MainTabView: View {
    @AppStorage("userName") private var userName = "使用者名稱"
    @AppStorage("festivalsData") private var festivalsData = ""
    @AppStorage("calendarEventsData") private var calendarEventsData = ""
    @State private var calendarEvents: [CalendarEvent] = []
    
    @State private var festivals: [Festival] = [
        Festival(
            title: "愛嶼搖滾",
            location: """
                    基隆
                    基隆國門廣場、海洋廣場
                    """,
            startDate: Date(),
            endDate: Date(),
            price: "免費",
            website: "https://www.instagram.com/keelungloverock/",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "流浪祭",
            location: """
                        台北
                        台北流行音樂中心戶外表演空間
                        """,
            startDate: Date(),
            endDate: Date(),
            price: """
                        【早鳥】
                        單日票 NT$995
                        【一般票】
                        單日票 NT$1795|雙日票 NT$2890
                        【學生票 】
                        單日票 NT$1195|雙日票 NT$2190
                        【兒童＆身心障礙票】 
                        單日票 NT$898|雙日票 NT$1448
                        【十人成行】 
                        單日票 NT$1616(一張)
                        """,
            website: "https://www.instagram.com/pawerlove_fest/",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "JAM JAM ASIA",
            location: """
                        台北
                        台北流行音樂中心
                        """,
            startDate: Date(),
            endDate: Date(),
            price: """
                        ｜國泰世華銀行卡友｜
                        CUBE信用卡 (含簽帳金融卡)卡友獨家優惠雙日票｜NT$3,000（每人限購4張/雙日票限同一人使用）
                        CUBE信用卡(含簽帳金融卡)卡友獨家優惠單日票｜NT$1,600（每人限購4張）
                                                                                                                                ｜北流會員｜
                        北流會員早鳥雙日票｜NT$3,200（每人限購4張/雙日票限同一人使用）
                        北流會員早鳥單日票｜NT$1,700（每人限購4張）

                        ｜優惠票種｜
                        愛心雙日票｜NT$1,750（限同一人使用）
                        愛心單日票｜NT$950
                        敬老雙日票｜NT$1,750（限同一人使用）
                        敬老單日票｜NT$950

                        ｜特別企劃｜
                        跨夜 DJ 演出票｜NT$500（限量販售，售完為止；未滿18歲及未攜帶身分證明文件者不得入場）

                        * 市民大道封街舞台為免費入場
                        """,
            website: "https://www.instagram.com/pawerlove_fest/",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "火球祭",
            location: """
                        桃園
                        樂天桃園棒球場
                        """,
            startDate: Date(),
            endDate: Date(),
            price: """
                        |單日票|
                        單日預售票 NT$2,388
                                                                
                        |雙日票|
                        雙日早鳥票 NT$3,688
                        雙日預售票 NT$3,888
                        雙日座位預售票 NT$4,488
                        雙日學生預售票 NT$2,888
                                                                
                        |身心障礙優惠票|
                        單日預售票 NT$1,490
                        雙日預售票NT$2,400 
                                                                
                        |現場票|
                        雙日現場票 NT$4,800
                        """,
            website: "https://www.instagram.com/fireball_fest/",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "風神祭",
            location: """
                        新竹
                        新竹縣立體育場、新竹縣立體育館
                        """,
            startDate: Date(),
            endDate: Date(),
            price: """
                        |預售票|
                        單日預售票NT$1,188
                        雙日預售票NT$1,888
                        愛心預售票NT$954
                                                            
                        |現場票|
                        單日現場票NT$1,588
                        雙日現場票NT$2,288
                        愛心現場票NT$1,100
                        """,
            website: "https://www.instagram.com/windtopfest/",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "搖滾台中",
            location: """
                        台中
                        文心森林公園、圓滿戶外劇場
                        """,
            startDate: Date(),
            endDate: Date(),
            price: "免費",
            website: "https://www.instagram.com/rockintaichung/",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "諸羅搖滾",
            location: """
                        嘉義
                        嘉義市中央廣場
                        """,
            startDate: Date(),
            endDate: Date(),
            price: "免費",
            website: "無",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "浪人祭",
            location: """
                        台南
                        安平觀夕平台旁大草皮
                        """,
            startDate: Date(),
            endDate: Date(),
            price: """
                    三日超海鳥票（盲鳥票）｜NT$ 3,000
                    三日海鳥票（早鳥票）｜NT$ 3,200 
                    三日預售票｜NT$ 3,500
                    三日愛心票｜NT$ 1,750
                    單日預售票｜NT$ 2,000 
                    單日愛心票｜NT$ 1,000  
            """,
            website: "https://www.instagram.com/vagabondfest.tw/",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "大港開唱",
            location: """
                        高雄
                        駁二
                        """,
            startDate: Date(),
            endDate: Date(),
            price: """
                        #大港人X國泰世華CUBE卡友優先購
                        雙日聯票｜NT$4,200
                                                            ​
                        ＃國泰世華大樹套票｜NT4,200（雙日聯票＋聯名周邊商品）

                        ＃大港人優先購
                        雙日聯票｜NT$4,200
                        船鳴套票｜NT$4,800 （雙日聯票＋人生好帕）
                                                            ​
                        ＃一般預售票
                        雙日聯票｜NT$4,400
                        船鳴套票｜NT$5,000 （雙日聯票＋人生好帕）
                        單日票​｜NT$3,000
                                                            ​
                        ＃身心障礙票
                        雙日聯票｜NT$2,200
                        單日票｜NT$1,500
                        """,
            website: "https://www.instagram.com/megaportfest/",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "台灣祭",
            location: """
                        屏東
                        墾丁大灣遊憩區
                        """,
            startDate: Date(),
            endDate: Date(),
            price: "免費",
            website: "https://www.instagram.com/taiwanmusicfest/",
            hasTicket: false,
            isFavorite: false
        ),
        Festival(
            title: "南國趴",
            location: """
                        屏東
                        墾丁大灣遊憩區
                        """,
            startDate: Date(),
            endDate: Date(),
            price: "免費",
            website: "https://www.instagram.com/taiwanmusicfest/",
            hasTicket: false,
            isFavorite: false
        ),
    ]
    
    var body: some View {
        TabView {
            FestivalListView(festivals: $festivals)
                .tabItem {
                    Label("音樂祭", systemImage: "music.note")
                }
            
            FestivalCalendarView(
                festivals: $festivals,
                calendarEvents: $calendarEvents
            )
            .tabItem {
                Label("行事曆", systemImage: "calendar")
            }
            
            FavoriteView(festivals: $festivals)
                .tabItem {
                    Label("收藏", systemImage: "heart.fill")
                }
            AIRecommendView(festivals: festivals)
                .tabItem {
                    Label("AI推薦", systemImage: "sparkles")
                }
            SettingView(userName: $userName)
                .tabItem {
                    Label("設定", systemImage: "gear")
                }
            }
        .onAppear {
                    loadData()
                }
                .onChange(of: festivals) {
                    saveFestivals()
                }
                .onChange(of: calendarEvents) {
                    saveCalendarEvents()
                }
        }
    func saveFestivals() {
            if let encoded = try? JSONEncoder().encode(festivals),
               let jsonString = String(data: encoded, encoding: .utf8) {
                festivalsData = jsonString
            }
        }
        
        func saveCalendarEvents() {
            if let encoded = try? JSONEncoder().encode(calendarEvents),
               let jsonString = String(data: encoded, encoding: .utf8) {
                calendarEventsData = jsonString
            }
        }
        
        func loadData() {
            if let data = festivalsData.data(using: .utf8),
               let decoded = try? JSONDecoder().decode([Festival].self, from: data) {
                festivals = decoded
            }
            
            if let data = calendarEventsData.data(using: .utf8),
               let decoded = try? JSONDecoder().decode([CalendarEvent].self, from: data) {
                calendarEvents = decoded
            }
        }
    }
