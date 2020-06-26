//
//  MapViewController.swift
//  donATE app
//
//  Created by Macy Jiang on 6/26/20.
//  Copyright © 2020 Lena Wang. All rights reserved.
//

import UIKit
import Foundation
import GooglePlaces
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
       var currentLocation: CLLocation?
       var mapView: GMSMapView!
       var placesClient: GMSPlacesClient!
       var zoomLevel: Float = 15.0
       var likelyPlaces: [GMSPlace] = []
       var selectedPlace: GMSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 40.70305, longitude: -73.98798, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.settings.myLocationButton = true
        mapView.settings.indoorPicker = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        self.view = mapView
        
        
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: 40.71753, longitude: -74.00162)
                marker.title = "The Bowery Mission"
                marker.snippet = "90 Lafayette St, New York, NY 10013"
                marker.map = mapView
                marker.icon = GMSMarker.markerImage(with: .blue)
               
               let marker2 = GMSMarker()
               marker2.position = CLLocationCoordinate2D(latitude: 40.80891, longitude: -73.92174)
               marker2.title = "NY Common Pantry - Nourish/ Live Healthy!"
               marker2.snippet = "423 E 138th St, The Bronx, NY 10454"
               marker2.map = mapView
               
               let marker3 = GMSMarker()
               marker3.position = CLLocationCoordinate2D(latitude: 40.68886, longitude: -73.92902)
               marker3.title = "The Brooklyn Rescue Mission"
               marker3.snippet = "919 Gates Ave, Brooklyn, NY 11221"
               marker3.map = mapView
               
               let marker4 = GMSMarker()
               marker4.position = CLLocationCoordinate2D(latitude: 40.72921, longitude: -73.95497)
               marker4.title = "Greenpoint Reformed Church"
               marker4.snippet = "136 Milton St, Brooklyn, NY 11222"
               marker4.map = mapView
               
               let marker5 = GMSMarker()
               marker5.position = CLLocationCoordinate2D(latitude: 40.68922, longitude: -73.91726)
               marker5.title = "The Salvation Army Brooklyn Bushwick Corps Community Center"
               marker5.snippet = "1151 Bushwick Ave, Brooklyn, NY 11221"
               marker5.map = mapView
               
               let marker6 = GMSMarker()
               marker6.position = CLLocationCoordinate2D(latitude: 40.7322, longitude: -73.84987)
               marker6.title = "MASBIA of Queens"
               marker6.snippet = "105 64th Rd #47, Forest Hills, NY 11375"
               marker6.map = mapView
               
               let marker7 = GMSMarker()
               marker7.position = CLLocationCoordinate2D(latitude: 40.77367, longitude: -73.93052)
               marker7.title = "St Margaret Mary Church"
               marker7.snippet = "918 27th Ave, Astoria, NY 11102"
               marker7.map = mapView
               
               let marker8 = GMSMarker()
               marker8.position = CLLocationCoordinate2D(latitude: 40.68999, longitude: -73.79709)
               marker8.title = "Blanche Memorial Baptist Church"
               marker8.snippet = "10974 Sutphin Blvd, Jamaica, NY 11435"
               marker8.map = mapView
               
               let marker9 = GMSMarker()
               marker9.position = CLLocationCoordinate2D(latitude: 40.74435, longitude:  -73.48664)
               marker9.title = "The Safe Center LI"
               marker9.snippet = "15 Grumman Rd W #1000, Bethpage, NY 11714"
               marker9.map = mapView
               
               let marker10 = GMSMarker()
               marker10.position = CLLocationCoordinate2D(latitude: 40.62939, longitude: -74.07692)
               marker10.title = "Project Hospitality"
               marker10.snippet = "514 Bay St, Staten Island, NY 10304"
               marker10.map = mapView
               
               let marker11 = GMSMarker()
               marker11.position = CLLocationCoordinate2D(latitude: 40.65666, longitude: -73.58142)
               marker11.title = "Long Island Cares, Inc"
               marker11.snippet = "21 East Sunrise Highway, Freeport, NY 11520"
               marker11.map = mapView
               
               let marker12 = GMSMarker()
               marker12.position = CLLocationCoordinate2D(latitude: 40.65666, longitude: -73.58142)
               marker12.title = "Long Island Cares, Inc"
               marker12.snippet = "21 East Sunrise Highway, Freeport, NY 11520"
               marker12.map = mapView
               
               let marker13 = GMSMarker()
               marker13.position = CLLocationCoordinate2D(latitude: 40.5103, longitude: -74.21976)
               marker13.title = "St Edward Food Pantry"
               marker13.snippet = "6581 Hylan Blvd, Staten Island, NY 10309"
               marker13.map = mapView
               
               let marker14 = GMSMarker()
               marker14.position = CLLocationCoordinate2D(latitude: 40.78893, longitude: -73.97729)
               marker14.title = "West Side Campaign Against Hunger"
               marker14.snippet = "263 W 86th St, New York, NY 10024"
               marker14.map = mapView
               
               let marker15 = GMSMarker()
               marker15.position = CLLocationCoordinate2D(latitude: 40.79576, longitude: -73.94922)
               marker15.title = "New York Common Pantry"
               marker15.snippet = "8 E 109th St, New York, NY 10029"
               marker15.map = mapView
               
               let marker16 = GMSMarker()
               marker16.position = CLLocationCoordinate2D(latitude: 40.83086, longitude: -73.89034)
               marker16.title = "New York Common Pantry"
               marker16.snippet = "1290 Hoe Avenue, Ground Floor, The Bronx, NY 10459"
               marker16.map = mapView
               
               let marker17 = GMSMarker()
               marker17.position = CLLocationCoordinate2D(latitude: 40.77298, longitude: -72.9521)
               marker17.title = "Lighthouse Mission"
               marker17.snippet = "1543 Montauk Hwy, Bellport, NY 11713"
               marker17.map = mapView
               
               let marker18 = GMSMarker()
               marker18.position = CLLocationCoordinate2D(latitude: 40.82608, longitude: -73.91575)
               marker18.title = "Missionary Church of Christ"
               marker18.snippet = "937 Teller Ave, The Bronx, NY 10451"
               marker18.map = mapView
               
               let marker19 = GMSMarker()
               marker19.position = CLLocationCoordinate2D(latitude: 40.87726, longitude: -73.8332)
               marker19.title = "Black Forum of Co-op City Emergency Food Pantry"
               marker19.snippet = "920 Baychester Ave, The Bronx, NY 10475"
               marker19.map = mapView
               
               let marker20 = GMSMarker()
               marker20.position = CLLocationCoordinate2D(latitude: 39.31234, longitude: -76.5369)
               marker20.title = "New Life Food Pantry"
               marker20.snippet = "2401 E North Avenue, Baltimore, MD 21213"
               marker20.map = mapView
               
               let marker21 = GMSMarker()
               marker21.position = CLLocationCoordinate2D(latitude: 38.9769, longitude: -76.99189)
               marker21.title = "Takoma Park Food Pantry"
               marker21.snippet = "7001 New Hampshire Ave, Takoma Park, MD 20912"
               marker21.map = mapView
               
               let marker22 = GMSMarker()
               marker22.position = CLLocationCoordinate2D(latitude: 42.16028, longitude: -70.90642)
               marker22.title = "Weymouth Food Pantry"
               marker22.snippet = "40 Reservoir Park Dr, Rockland, MA 02370"
               marker22.map = mapView
               
               let marker23 = GMSMarker()
               marker23.position = CLLocationCoordinate2D(latitude: 42.21729, longitude: -70.92859)
               marker23.title = "Weymouth Food Pantry"
               marker23.snippet = "1199 Commercial St, Weymouth, MA 02189"
               marker23.map = mapView
               
               let marker24 = GMSMarker()
               marker24.position = CLLocationCoordinate2D(latitude: 42.21653, longitude: -70.95476)
               marker24.title = "Weymouth Food Pantry"
               marker24.snippet = "241 Broad St, Weymouth, MA 02189"
               marker24.map = mapView
               
               let marker25 = GMSMarker()
               marker25.position = CLLocationCoordinate2D(latitude: 42.16028, longitude: -70.90642)
               marker25.title = "Weymouth Food Pantry"
               marker25.snippet = "40 Reservoir Park Dr, Rockland, MA 02370"
               marker25.map = mapView
               
               let marker26 = GMSMarker()
               marker26.position = CLLocationCoordinate2D(latitude: 42.17543, longitude: -70.95119)
               marker26.title = "Weymouth Food Pantry"
               marker26.snippet = "25 Columbian St, Weymouth, MA 02189"
               marker26.map = mapView
               
               let marker27 = GMSMarker()
               marker27.position = CLLocationCoordinate2D(latitude: 39.21499, longitude: -76.70718)
               marker27.title = "Elkridge Food Pantry"
               marker27.snippet = "5646 Furnace Ave, Elkridge, MD 21075"
               marker27.map = mapView
               
               let marker28 = GMSMarker()
               marker2.position = CLLocationCoordinate2D(latitude: 44.09534, longitude: -70.21298)
               marker28.title = "St Mary's Food Pantry"
               marker28.snippet = "208 Bates St, Lewiston, ME 04240"
               marker28.map = mapView
               
               let marker29 = GMSMarker()
               marker29.position = CLLocationCoordinate2D(latitude: 41.90673, longitude: -71.09231)
               marker29.title = "St Mary's Food Pantry"
               marker29.snippet = "78 Broadway, Taunton, MA 02780"
               marker29.map = mapView
               
               let marker30 = GMSMarker()
               marker30.position = CLLocationCoordinate2D(latitude: 42.67903, longitude: -82.73654)
               marker30.title = "St Mary's Food Pantry"
               marker30.snippet = "50931 Maria St, New Baltimore, MI 48047"
               marker30.map = mapView
               
               let marker31 = GMSMarker()
               marker31.position = CLLocationCoordinate2D(latitude: 34.63528, longitude: -82.58976)
               marker31.title = "Golden Harvest Food Bank"
               marker31.snippet = "311 Alliance Pkwy, Williamston, SC 29697"
               marker31.map = mapView
               
               let marker32 = GMSMarker()
               marker32.position = CLLocationCoordinate2D(latitude: 38.82199, longitude: -76.95648)
               marker32.title = "ICAC-Oxon Hill Food Pantry"
               marker32.snippet = "4915 St Barnabas Rd, Marlow Heights, MD 20748"
               marker32.map = mapView
               
               let marker33 = GMSMarker()
               marker33.position = CLLocationCoordinate2D(latitude: 41.00522, longitude:  -74.29075 )
               marker33.title = "St Mary's Food Pantry"
               marker33.snippet = "22 Lakeside Ave, Pompton Lakes, NJ 07442"
               marker33.map = mapView
               
               let marker34 = GMSMarker()
               marker34.position = CLLocationCoordinate2D(latitude: 42.33726, longitude:  -71.11837 )
               marker34.title = "Brookline Food Pantry"
               marker34.snippet = "15 St Paul St, Brookline, MA 02446"
               marker34.map = mapView
               
               let marker35 = GMSMarker()
               marker35.position = CLLocationCoordinate2D(latitude: 42.33737, longitude:  -71.2089 )
               marker35.title = "Newton Food Pantry"
               marker35.snippet = "1000 Commonwealth Avenue, Newton, MA 02459"
               marker35.map = mapView
               
               let marker36 = GMSMarker()
               marker36.position = CLLocationCoordinate2D(latitude: 42.36714, longitude:  -71.18127 )
               marker36.title = "Watertown Food Pantry"
               marker36.snippet = "80 Mt Auburn St, Watertown, MA 024729"
               marker36.map = mapView
               
               let marker37 = GMSMarker()
               marker37.position = CLLocationCoordinate2D(latitude: 42.37373, longitude:  -71.41574 )
               marker37.title = "Sudbury Community Food Pantry"
               marker37.snippet = "160 Concord Rd, Sudbury, MA 01776"
               marker37.map = mapView
               
               let marker38 = GMSMarker()
               marker38.position = CLLocationCoordinate2D(latitude: 42.33449, longitude:  -71.07393 )
               marker38.title = "Preventive Food Pantry at Boston Medical Center"
               marker38.snippet = "850 Harrison Ave 2nd floor, Boston, MA 02118"
               marker38.map = mapView
               
               let marker39 = GMSMarker()
               marker39.position = CLLocationCoordinate2D(latitude: 42.80616, longitude:  -73.9349 )
               marker39.title = "Schenectady Inner City Ministry Food Pantry"
               marker39.snippet = "839 Albany St, Schenectady, NY 12307"
               marker39.map = mapView
               
               let marker40 = GMSMarker()
               marker40.position = CLLocationCoordinate2D(latitude: 42.35532, longitude:  -73.80762 )
               marker40.title = "Community Food Pantry of Coxsackie"
               marker40.snippet = "Mansion St, Coxsackie, NY 12051"
               marker40.map = mapView
               
               let marker41 = GMSMarker()
               marker41.position = CLLocationCoordinate2D(latitude: 42.70569, longitude:  -73.66041 )
               marker41.title = "Hope 7 Food Pantry"
               marker41.snippet = "520 Pawling Ave, Troy, NY 12180"
               marker41.map = mapView
               
               let marker42 = GMSMarker()
               marker42.position = CLLocationCoordinate2D(latitude: 42.30326, longitude:  -75.80341 )
               marker42.title = "Greene Area Food Pantry"
               marker42.snippet = "109 County Rd 2, Greene, NY 13778"
               marker42.map = mapView
               
               let marker43 = GMSMarker()
               marker43.position = CLLocationCoordinate2D(latitude: 33.52915, longitude: -81.6912 )
               marker43.title = "Golden Harvest Food Bank"
               marker43.snippet = "81 Capital Dr, Aiken, SC 29803"
               marker43.map = mapView
               
               let marker44 = GMSMarker()
               marker44.position = CLLocationCoordinate2D(latitude:33.4686, longitude: -81.96709 )
               marker44.title = "Golden Harvest Food Bank"
               marker44.snippet = "702 Fenwick St, Augusta, GA 30901"
               marker44.map = mapView
               
               let marker45 = GMSMarker()
               marker45.position = CLLocationCoordinate2D(latitude:33.44987, longitude: -82.06007 )
               marker45.title = "Golden Harvest Food Bank"
               marker45.snippet = "3310 Commerce Dr, Augusta, GA 30909"
               marker45.map = mapView
               
               let marker46 = GMSMarker()
               marker46.position = CLLocationCoordinate2D(latitude:41.77327, longitude: -76.40179 )
               marker46.title = "Towanda Area Christian Pantry"
               marker46.snippet = "1876 Golden Mile Rd, P O Box 463, Wysox, PA 1885"
               marker46.map = mapView
               
               let marker47 = GMSMarker()
               marker47.position = CLLocationCoordinate2D(latitude:30.35108, longitude: -81.67926 )
               marker47.title = "Catholic Charities Food Pantry"
               marker47.snippet = "1470 W 13th St, Jacksonville, FL 32209"
               marker47.map = mapView
               
               let marker48 = GMSMarker()
               marker48.position = CLLocationCoordinate2D(latitude:42.10085, longitude: -75.92562 )
               marker48.title = "Catholic Charities Food Pantry"
               marker48.snippet = "100 Main St, Binghamton, NY 13905"
               marker48.map = mapView
               
               let marker49 = GMSMarker()
               marker49.position = CLLocationCoordinate2D(latitude:41.57577, longitude: -75.25375)
               marker49.title = "Wayne County Food Pantry"
               marker49.snippet = "323 10th St, Honesdale, PA 18431"
               marker49.map = mapView
               
               let marker50 = GMSMarker()
               marker50.position = CLLocationCoordinate2D(latitude:42.06172, longitude: -75.42667)
               marker50.title = "Deposit Food Pantry"
               marker50.snippet = "91 2nd St, Deposit, NY 13754"
               marker50.map = mapView
               
               let marker51 = GMSMarker()
               marker51.position = CLLocationCoordinate2D(latitude:41.83396, longitude: -75.87713)
               marker51.title = "Montrose Emergency Food Bank"
               marker51.snippet = "RR 706, Montrose, PA 18801"
               marker51.map = mapView
               
               let marker52 = GMSMarker()
               marker52.position = CLLocationCoordinate2D(latitude:41.23837, longitude:  -75.8656)
               marker52.title = "Keystone Mission"
               marker52.snippet = "290 Parkview Cir, Wilkes-Barre, PA 18702"
               marker52.map = mapView
               
               let marker53 = GMSMarker()
               marker53.position = CLLocationCoordinate2D(latitude:41.29001, longitude: -75.74565)
               marker53.title = "Harry & Jeanette Weinberg Northeast Regional Food Bank"
               marker53.snippet = "185 Research Drive, Pittston, PA 18640"
               marker53.map = mapView
               
               let marker54 = GMSMarker()
               marker54.position = CLLocationCoordinate2D(latitude:42.08371, longitude: -75.89648)
               marker54.title = "Loaves and Fish Pantry"
               marker54.snippet = "1262 Mill St, Binghamton, NY 13903"
               marker54.map = mapView
               
               let marker55 = GMSMarker()
               marker55.position = CLLocationCoordinate2D(latitude: 41.20426, longitude: -73.72707)
               marker55.title = "Mount Kisco Interfaith Food Pantry"
               marker55.snippet = "300 Main St, Mt Kisco, NY 10549"
               marker55.map = mapView
               
               let marker56 = GMSMarker()
               marker56.position = CLLocationCoordinate2D(latitude: 41.07493, longitude: -73.85915)
               marker56.title = "Community Food Pantry of Sleepy Hollow"
               marker56.snippet = "43 S Broadway, Tarrytown, NY 10591"
               marker56.map = mapView
               
               let marker57 = GMSMarker()
               marker57.position = CLLocationCoordinate2D(latitude: 40.95361, longitude: -73.73977)
               marker57.title = "Mamaroneck Child Development Center"
               marker57.snippet = "134 Center Ave, Mamaroneck, NY 10543"
               marker57.map = mapView
               
               let marker58 = GMSMarker()
               marker58.position = CLLocationCoordinate2D(latitude: 41.26306, longitude: -75.89839)
               marker58.title = "West Side Food Bank"
               marker58.snippet = "Market & S Kingston, Kingston, PA 18704, Kingston, PA 18704"
               marker58.map = mapView
               
               let marker59 = GMSMarker()
               marker59.position = CLLocationCoordinate2D(latitude: 40.70502, longitude: -74.0857)
               marker59.title = "Friends of the Lifer's Youth"
               marker59.snippet = "152 Martin Luther King Dr, Jersey City, NJ 07305"
               marker59.map = mapView
               
               let marker60 = GMSMarker()
               marker60.position = CLLocationCoordinate2D(latitude: 41.32162, longitude: -73.85438)
               marker60.title = "Community Food Pantry At St.Mary's Mohegan Lake"
               marker60.snippet = "1836 E Main St, Mohegan Lake, NY 10547"
               marker60.map = mapView
               
               let marker61 = GMSMarker()
               marker61.position = CLLocationCoordinate2D(latitude: 40.73616, longitude: -74.06972)
               marker61.title = "Let's Share a Meal"
               marker61.snippet = "1080 West Side Ave #6307, Jersey City, NJ 07306"
               marker61.map = mapView
               
               let marker62 = GMSMarker()
               marker62.position = CLLocationCoordinate2D(latitude: 40.74031, longitude: -74.03116)
               marker62.title = "The Hoboken Shelter"
               marker62.snippet = "300 Bloomfield St, Hoboken, NJ 07030"
               marker62.map = mapView
               
               let marker63 = GMSMarker()
               marker63.position = CLLocationCoordinate2D(latitude: 40.93363, longitude: -73.89859)
               marker63.title = "The Sharing Community, Inc."
               marker63.snippet = "1 Hudson St, Yonkers, NY 10701"
               marker63.map = mapView
               
               let marker64 = GMSMarker()
               marker64.position = CLLocationCoordinate2D(latitude: 40.74462, longitude: -73.98766)
               marker64.title = "1 Hudson St, Yonkers, NY 10701"
               marker64.snippet = "244 5th Ave, New York, NY 10001"
               marker64.map = mapView
               
               let marker65 = GMSMarker()
               marker65.position = CLLocationCoordinate2D(latitude: 40.9392, longitude: -73.88992)
               marker65.title = "Community Hear"
               marker65.snippet = "164 Ashburton Ave, Yonkers, NY 10701"
               marker65.map = mapView
               
               let marker66 = GMSMarker()
               marker66.position = CLLocationCoordinate2D(latitude: 40.63567, longitude: -74.13143)
               marker66.title = "Project Hospitality"
               marker66.snippet = "100 Park Ave, Staten Island, NY 10302"
               marker66.map = mapView
               
               let marker67 = GMSMarker()
               marker67.position = CLLocationCoordinate2D(latitude: 40.63954, longitude: -74.07622)
               marker67.title = "Project Hospitality"
               marker67.snippet = "14 Slosson Terrace, Staten Island, NY 10301"
               marker67.map = mapView
               
               let marker68 = GMSMarker()
               marker68.position = CLLocationCoordinate2D(latitude: 40.63891, longitude: -74.08718)
               marker68.title = "Project Hospitality"
               marker68.snippet = "385 Jersey St, Staten Island, NY 10301"
               marker68.map = mapView
               
               let marker69 = GMSMarker()
               marker69.position = CLLocationCoordinate2D(latitude: 40.72197, longitude: -73.99284)
               marker69.title = "The Bowery Mission"
               marker69.snippet = "227 Bowery, New York, NY 10002"
               marker69.map = mapView
               
               let marker70 = GMSMarker()
               marker70.position = CLLocationCoordinate2D(latitude: 40.78562, longitude: -73.98054)
               marker70.title = "The Hungerless Headquarters"
               marker70.snippet = "433 West End Ave, New York, NY 10024"
               marker70.map = mapView
               marker70.icon = UIImage(named: "headquarters")
               
               let marker71 = GMSMarker()
               marker71.position = CLLocationCoordinate2D(latitude: 44.87312, longitude: -0.55959)
               marker71.title = "Food Bank of Bordeaux and Gironde"
               marker71.snippet = "ZI Alfred Daney, Rue Bougainville, 33000 Bordeaux, France"
               marker71.map = mapView
               
               let marker72 = GMSMarker()
               marker72.position = CLLocationCoordinate2D(latitude: 31.7449, longitude: 35.21162)
               marker72.title = "Pantry Packers"
               marker72.snippet = "Derech Moshe Bar'am, Jerusalem, Israel"
               marker72.map = mapView
               
               let marker73 = GMSMarker()
               marker73.position = CLLocationCoordinate2D(latitude: 47.51753, longitude: -111.27913)
               marker73.title = "Great Falls Community Food Bank"
               marker73.snippet = "1620 12th Avenue N, Great Falls, MT 59401"
               marker73.map = mapView
               
               let marker74 = GMSMarker()
               marker74.position = CLLocationCoordinate2D(latitude: 37.442, longitude: -86.89521)
               marker74.title = "Ohio County Food Pantry"
               marker74.snippet = "S, 1220 Old Main St, Hartford, KY 42347"
               marker74.map = mapView
               
               let marker75 = GMSMarker()
               marker75.position = CLLocationCoordinate2D(latitude: 35.84352, longitude: -86.39907)
               marker75.title = "Nourish Food Bank"
               marker75.snippet = "211 Bridge Avenye, Murfreesboro, TN 37129"
               marker75.map = mapView
               
               let marker76 = GMSMarker()
               marker76.position = CLLocationCoordinate2D(latitude: 35.98445, longitude: -86.52517)
               marker76.title = "Nourish Food Bank"
               marker76.snippet = "130 Richardson St, Smyrna, TN 37167"
               marker76.map = mapView
               
               let marker77 = GMSMarker()
               marker77.position = CLLocationCoordinate2D(latitude: 34.93835, longitude: -88.52519)
               marker77.title = "Amen Food Pantry "
               marker77.snippet = "Corinth, MS 38834"
               marker77.map = mapView
               
               let marker78 = GMSMarker()
               marker78.position = CLLocationCoordinate2D(latitude: 33.14554, longitude: -86.26298)
               marker78.title = "Alabama Childhood Food Solutions"
               marker78.snippet = "114 Canyon Ridge Rd, Sylacauga, AL 35151"
               marker78.map = mapView
               
               let marker79 = GMSMarker()
               marker79.position = CLLocationCoordinate2D(latitude: 64.8231, longitude: -147.71672)
               marker79.title = "Fairbanks Community Food Bank"
               marker79.snippet = "725 26th Ave #101, Fairbanks, AK 99701"
               marker79.map = mapView
               
               let marker80 = GMSMarker()
               marker80.position = CLLocationCoordinate2D(latitude: 59.64992, longitude: -151.52354)
               marker80.title = "Homer Food Pantry"
               marker80.snippet = "770 East End Rd, Homer, AK 99603"
               marker80.map = mapView
               
               let marker81 = GMSMarker()
               marker81.position = CLLocationCoordinate2D(latitude: 61.22304, longitude: -149.84128)
               marker81.title = "Food Bank of Alaska "
               marker81.snippet = "2121 Spar Ave, Anchorage, AK 99501"
               marker81.map = mapView
               
               let marker82 = GMSMarker()
               marker82.position = CLLocationCoordinate2D(latitude: 61.20225, longitude: -149.81082)
               marker82.title = "St, Francis House Food Pantry"
               marker82.snippet = "3710 E 20th Ave, Anchorage, AK 99508"
               marker82.map = mapView
               
               let marker83 = GMSMarker()
               marker83.position = CLLocationCoordinate2D(latitude: 40.65677, longitude: -111.99696)
               marker83.title = "Kearns Food Pantry"
               marker83.snippet = "4445 W 5175 S, Kearns, UT 84118"
               marker83.map = mapView
               marker.icon = GMSMarker.markerImage(with: .green)
               
               let marker84 = GMSMarker()
               marker84.position = CLLocationCoordinate2D(latitude: 41.10326, longitude: -111.94967)
               marker84.title = "Open Doors"
               marker84.snippet = "875 UT-193, Layton, UT 84041"
               marker84.map = mapView
               marker.icon = GMSMarker.markerImage(with: .purple)
               
               let marker85 = GMSMarker()
               marker85.position = CLLocationCoordinate2D(latitude: 40.89062, longitude: -111.86984)
               marker85.title = "Bountiful Food Pantry "
               marker85.snippet = "480 E 150 N, Bountiful, UT 84010"
               marker85.map = mapView
               marker.icon = GMSMarker.markerImage(with: .blue)
               
               let marker86 = GMSMarker()
               marker86.position = CLLocationCoordinate2D(latitude: 40.26094, longitude: -74.81069)
               marker86.title = "Mercer Street Friends Food Bank"
               marker86.snippet = "824 Silvia St, Ewing Township, NJ 08628"
               marker86.map = mapView
               
               let marker87 = GMSMarker()
               marker87.position = CLLocationCoordinate2D(latitude: 40.85021, longitude: -74.78404)
               marker87.title = "Mount Olive Food Pantry"
               marker87.snippet = "6 Naughright Rd, Hackettstown, NJ 07840"
               marker87.map = mapView
               
               let marker88 = GMSMarker()
               marker88.position = CLLocationCoordinate2D(latitude: 32.26869, longitude: -76.20858)
               marker88.title = "Food Bank of the Albemarle"
               marker88.snippet = "109 Tidewater Way, Elizabeth City, NC 27909"
               marker88.map = mapView
               
               let marker89 = GMSMarker()
               marker89.position = CLLocationCoordinate2D(latitude: 64.8231, longitude: -147.71672)
               marker89.title = "Sandwich Food Pantry "
               marker89.snippet = "331 Cotuit Rd, Sandwich, MA 02563"
               marker89.map = mapView
               
               let marker90 = GMSMarker()
               marker90.position = CLLocationCoordinate2D(latitude: 41.69932, longitude: -70.58668)
               marker90.title = "Bourne Friends Food Pantry "
               marker90.snippet = "20 Commerce Park Rd, Pocasset, MA 02559"
               marker90.map = mapView
               
               let marker91 = GMSMarker()
               marker91.position = CLLocationCoordinate2D(latitude: 35.14648, longitude: -106.6003)
               marker91.title = "Roadrunner Food Bank"
               marker91.snippet = "5840 Office Blvd NE, Albuquerque, NM 87109"
               marker91.map = mapView
               
               let marker92 = GMSMarker()
               marker92.position = CLLocationCoordinate2D(latitude: 41.75619, longitude: -70.65231)
               marker92.title = "Damien's Place Food Pantry"
               marker92.snippet = "3065 Cranberry Hwy # B20, East Wareham, MA 02538"
               marker92.map = mapView
               
               let marker93 = GMSMarker()
               marker93.position = CLLocationCoordinate2D(latitude: 41.65202, longitude: -70.21371)
               marker93.title = "Yarmouth Food Pantry"
               marker93.snippet = "845 MA-28, South Yarmouth, MA 02664"
               marker93.map = mapView
               
               let marker94 = GMSMarker()
               marker94.position = CLLocationCoordinate2D(latitude: 29.78971, longitude: -95.37457)
               marker94.title = "Heights Interfaith Minitries Food Pantry"
               marker94.snippet = "3523 Beauchamp St, Houston, TX 77009"
               marker94.map = mapView
               
               let marker95 = GMSMarker()
               marker95.position = CLLocationCoordinate2D(latitude: 29.80359, longitude: -95.49345)
               marker95.title = "Faith Center - Food Pantry & Clothes Closet"
               marker95.snippet = "8244 Long Point Rd, Houston, TX 77055"
               marker95.map = mapView
               
               let marker96 = GMSMarker()
               marker96.position = CLLocationCoordinate2D(latitude: 29.79439, longitude: -95.48574)
               marker96.title = "East Spring Branch Food Pantry"
               marker96.snippet = "7901 Westview Dr, Houston, TX 77055"
               marker96.map = mapView
               
               let marker97 = GMSMarker()
               marker97.position = CLLocationCoordinate2D(latitude: 29.71484, longitude: -95.54853)
               marker97.title = "Food Pantry and Clothes Closet"
               marker97.snippet = "5860 Ranchester Dr, Houston, TX 77036"
               marker97.map = mapView
               
               let marker98 = GMSMarker()
               marker98.position = CLLocationCoordinate2D(latitude: 29.72166, longitude: -950015)
               marker98.title = "Food Pantry - ICNA Relief Houston"
               marker98.snippet = "5645 Hillcroft Ave Suite #405, Houston, TX 77074"
               marker98.map = mapView
               
               let marker99 = GMSMarker()
               marker99.position = CLLocationCoordinate2D(latitude: 40.42939, longitude: -88.98699)
               marker99.title = "Temba Food Pantry"
               marker99.snippet = "14940 Old Colonial Rd, Bloomington, IL 61705"
               marker99.map = mapView
               
               let marker100 = GMSMarker()
               marker100.position = CLLocationCoordinate2D(latitude: 37.24294, longitude: -77.39172)
               marker100.title = "Colonial Heights Food Pantry"
               marker100.snippet = "530 Southpark Blvd, Colonial Heights, VA 23834"
               marker100.map = mapView
               
               let marker101 = GMSMarker()
               marker101.position = CLLocationCoordinate2D(latitude: 47.49534, longitude: 19.23189)
               marker101.title = "Hungarian Food Bank Association"
               marker101.snippet = "Budapest, Lokátor u. 3, 1172 Hungary"
               marker101.map = mapView
        
    }
}
