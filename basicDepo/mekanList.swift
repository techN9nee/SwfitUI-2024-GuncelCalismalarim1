//
//  mekanList.swift
//  basicDepo
//
//  Created by Aytek Özgül on 21.06.2024.
//

import SwiftUI
import CoreLocation
import MapKit

struct mekanList: View {
    var body: some View {
        NavigationStack{
            List{
                ForEach(mekanlar) { mekanlar in
                    NavigationLink {
                        mapDetay(mekanlar: mekanlar)
                    } label: {
                        Text(mekanlar.mekanIsmi)
                    }
                }
            }.toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                    dismissButton()
                }
            })
        }
    }
}





struct mapDetay : View {
    var mekanlar : mapData
    var body: some View {
        VStack{
            mapOlusturma(coordinate: mekanlar.kordinatBul)
                .frame(width: 400,height: 400)
            HStack {
                Text(mekanlar.mekanIsmi)
                Text(String(" \(mekanlar.mekanPuani) ⭐️"))
            } .font(.title)
            Text(mekanlar.mekanYeri).padding().font(.title2)
            Text(mekanlar.mekanAciklamasi).padding().font(.headline)
        }
    }
}






struct mapOlusturma : UIViewRepresentable {
    var coordinate : CLLocationCoordinate2D
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}






struct mapData : Identifiable {
    var id = UUID()
    var mekanIsmi : String
    var mekanYeri : String
    var mekanPuani : Double
    var mekanAciklamasi : String
    var kordinat : Kordinat
    var kordinatBul : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: kordinat.latitude, longitude: kordinat.longitude)
    }
}

struct Kordinat {
    var latitude : Double
    var longitude : Double
}


let mekan1 = mapData(
    mekanIsmi: "Cafe Marmara",
    mekanYeri: "İstanbul",
    mekanPuani: 4.5,
    mekanAciklamasi: "Deniz manzaralı, huzurlu bir cafe.",
    kordinat: Kordinat(latitude: 41.0082, longitude: 28.9784)
)

let mekan2 = mapData(
    mekanIsmi: "Kapadokya Restoran",
    mekanYeri: "Nevşehir",
    mekanPuani: 4.7,
    mekanAciklamasi: "Tarihi dokusuyla ünlü lezzetli yemekler sunan restoran.",
    kordinat: Kordinat(latitude: 38.6404, longitude: 34.8315)
)

let mekan3 = mapData(
    mekanIsmi: "Ankara Parkı",
    mekanYeri: "Ankara",
    mekanPuani: 4.3,
    mekanAciklamasi: "Doğa yürüyüşleri için ideal geniş park alanı.",
    kordinat: Kordinat(latitude: 39.9334, longitude: 32.8597)
)

let mekan4 = mapData(
    mekanIsmi: "Antalya Plajı",
    mekanYeri: "Antalya",
    mekanPuani: 4.8,
    mekanAciklamasi: "Mavi bayraklı temiz plaj, yüzme ve güneşlenme için harika.",
    kordinat: Kordinat(latitude: 36.8969, longitude: 30.7133)
)

let mekan5 = mapData(
    mekanIsmi: "İzmir Kalesi",
    mekanYeri: "İzmir",
    mekanPuani: 4.6,
    mekanAciklamasi: "Tarihi kale, şehir manzarası ile ünlü.",
    kordinat: Kordinat(latitude: 38.4237, longitude: 27.1428)
)

let mekanlar = [mekan1,mekan2,mekan3,mekan4,mekan5]

#Preview {
    mekanList()
}

#Preview("mapOlusturma") {
    mapOlusturma(coordinate: mekan1.kordinatBul)
}
#Preview("mapDetay") {
    mapDetay(mekanlar: mekan1)
}
