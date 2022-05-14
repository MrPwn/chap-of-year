//
//  ViewController.swift
//  Map
//
//  Created by David Adeyeye on 2/11/18.
//  Copyright © 2018 David Adeyeye. All rights reserved.
//

import UIKit
import MapKit
import MediaPlayer
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var isSlideMenuHidden = true
    
    @IBAction func organizeBtnPressed(_ sender: UIBarButtonItem) {
        
        if isSlideMenuHidden {
            sideMenuConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
        } else {
            sideMenuConstraint.constant = -280
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
        }
        isSlideMenuHidden = !isSlideMenuHidden
    }
    
    
    @IBOutlet weak var mapView: MKMapView!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 5.0)
        // Override point for customization after application launch.
        return true
    }
    override func viewDidLoad() {
        sideMenuConstraint.constant = -280
        super.viewDidLoad()
        // 1
        let initialLocation = CLLocation(latitude: 32.853908, longitude: -96.790828)
        struct Location {
            let title: String
            let latitude: Double
            let longitude: Double
        }
        
        /*let locations = [
            Location(title: "Project Alpha", latitude: 32.987854, longitude: -96.748016),
            Location(title: "Game Night", latitude: 32.985895, longitude: -96.749438),
            Location(title: "Miss Black And Gold", latitude: 32.986316, longitude: -96.748851),
            Location(title: "Go To High School Go To College", latitude: 32.986316, longitude: -96.748851),
            Location(title: "Homecoming", latitude: 32.986316, longitude: -96.748851),
            Location(title: "Community Service", latitude: 32.986316, longitude: -96.748851)
        ]*/

        /*for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            mapView.addAnnotation(annotation)
        }*/

        //2
        let regionRadius: CLLocationDistance = 100000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
        //3
        mapView.delegate = self
        
        let video = Video(title: "Project Alpha Fa' 17",
                              locationName: "UT Dallas",
                              coordinate: CLLocationCoordinate2D(latitude: 32.987854, longitude: -96.748016))
        mapView.addAnnotation(video)
        
        let video1 = Video1(title: "Game Night",
                            locationName: "UT Dallas",
                            coordinate: CLLocationCoordinate2D(latitude: 32.985895, longitude: -96.749438))
        mapView.addAnnotation(video1)
        
        let video2 = Video2(title: "Miss Black and Gold",
                            locationName: "UT Dallas",
                            coordinate: CLLocationCoordinate2D(latitude: 32.986316, longitude: -96.748851))
        mapView.addAnnotation(video2)
        
        let video3 = Video3(title: "Go To High School Go To College",
                            locationName: "UT Dallas",
                            coordinate: CLLocationCoordinate2D(latitude: 32.987636, longitude: -96.749160))
        mapView.addAnnotation(video3)
        
        let video4 = Video4(title: "Homecoming",
                            locationName: "UT Dallas",
                            coordinate: CLLocationCoordinate2D(latitude: 32.985452, longitude: -96.751166))
        mapView.addAnnotation(video4)

        let video5 = Video5(title: "Brother's Keeper",
                            locationName: "Dallas",
                            coordinate: CLLocationCoordinate2D(latitude: 32.993996, longitude: -96.853343))
        mapView.addAnnotation(video5)
        
        let video6 = Video6(title: "Blue Speak",
                            locationName: "UT Dallas",
                            coordinate: CLLocationCoordinate2D(latitude: 32.986204, longitude: -96.748843))
        mapView.addAnnotation(video6)
        
        let video7 = Video7(title: "Brother's Keeper",
                            locationName: "Garland",
                            coordinate: CLLocationCoordinate2D(latitude: 32.913047, longitude: -96.685239))
        mapView.addAnnotation(video7)
        
        let video8 = Video8(title: "Kenn Manous Gala",
                            locationName: "Key Bailey Hutchison Convention Center",
                            coordinate: CLLocationCoordinate2D(latitude: 32.774263, longitude: -96.800366))
        mapView.addAnnotation(video8)
        
        let video9 = Video9(title: "Comet Splash",
                            locationName: "UT Dallas",
                            coordinate: CLLocationCoordinate2D(latitude: 32.989083, longitude: -96.752989))
        mapView.addAnnotation(video9)
        
        let video10 = Video10(title: "Project Alpha Sp' 18",
                            locationName: "UT Dallas",
                            coordinate: CLLocationCoordinate2D(latitude: 32.985944, longitude: -96.749472))
        mapView.addAnnotation(video10)
        
        let video11 = Video11(title: "Playground Build",
                              locationName: "Dallas",
                              coordinate: CLLocationCoordinate2D(latitude: 32.684495, longitude: -96.811716))
        mapView.addAnnotation(video11)
        
        let video12 = Video12(title: "Back to School Drive",
                              locationName: "Carrollton",
                              coordinate: CLLocationCoordinate2D(latitude: 32.954512, longitude: -96.897281))
        mapView.addAnnotation(video12)
        
        let video13 = Video13(title: "Highway Cleanup",
                              locationName: "Carrollton",
                              coordinate: CLLocationCoordinate2D(latitude: 33.021688, longitude: -96.916288))
        mapView.addAnnotation(video13)
        
        let video14 = Video14(title: "A Voteless People is a Hopless People",
                              locationName: "UT Dallas",
                              coordinate: CLLocationCoordinate2D(latitude: 32.986039, longitude:  -96.749422 ))
        mapView.addAnnotation(video14)
        
        let video15 = Video15(title: "Dallas LIFE",
                              locationName: "Dallas",
                              coordinate: CLLocationCoordinate2D(latitude: 32.771671, longitude: -96.798042))
        mapView.addAnnotation(video15)
        
        let video16 = Video16(title: "MLK Parade",
                              locationName: "Carrollton",
                              coordinate: CLLocationCoordinate2D(latitude: 32.976712, longitude: -96.888401))
        mapView.addAnnotation(video16)
        
        let video17 = Video17(title: "Pop Up Photoshoot",
                              locationName: "UT Dallas",
                              coordinate: CLLocationCoordinate2D(latitude: 32.987088,longitude: -96.748258))
        mapView.addAnnotation(video17)
        
        let video18 = Video18(title: "Feed the Homeless",
                             locationName: "First Baptist Church of Plano",
                             coordinate: CLLocationCoordinate2D(latitude: 33.019612, longitude: -96.695362))
        mapView.addAnnotation(video18)
        
        let video19 = Video19(title: "Special Olympics",
                              locationName: "Grand Prarie",
                              coordinate: CLLocationCoordinate2D(latitude: 32.754134, longitude: -97.002709))
        mapView.addAnnotation(video19)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: MKMapViewDelegate {
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        //guard let annotation = annotation as Video, Video1 else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        if view.annotation is Video{
            if let path = Bundle.main.path(forResource: "Project Alpha", ofType: ".m4v") {
                let player = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                self.present(playerViewController, animated: true) {
                    player.play()
                }
            }
        }
            
        if view.annotation is Video1{
            if let path = Bundle.main.path(forResource: "Game Night", ofType: ".m4v") {
                let player1 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController1 = AVPlayerViewController()
                playerViewController1.player = player1
                self.present(playerViewController1, animated: true) {
                    player1.play()
                }
            }
        }
        
        if view.annotation is Video2{
            if let path = Bundle.main.path(forResource: "MGB", ofType: ".m4v") {
                let player2 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController2 = AVPlayerViewController()
                playerViewController2.player = player2
                self.present(playerViewController2, animated: true) {
                    player2.play()
                }
            }
        }
        
        if view.annotation is Video3{
            if let path = Bundle.main.path(forResource: "GTHS, GTC", ofType: ".m4v") {
                let player3 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController3 = AVPlayerViewController()
                playerViewController3.player = player3
                self.present(playerViewController3, animated: true) {
                    player3.play()
                }
            }
        }
        
        if view.annotation is Video4{
            if let path = Bundle.main.path(forResource: "Homecoming", ofType: ".m4v") {
                let player4 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController4 = AVPlayerViewController()
                playerViewController4.player = player4
                self.present(playerViewController4, animated: true) {
                    player4.play()
                }
            }
        }
        
        if view.annotation is Video5{
            if let path = Bundle.main.path(forResource: "Helping Bruc", ofType: ".m4v") {
                let player5 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController5 = AVPlayerViewController()
                playerViewController5.player = player5
                self.present(playerViewController5, animated: true) {
                    player5.play()
                }
            }
        }
        
        if view.annotation is Video6{
            if let path = Bundle.main.path(forResource: "Blue Speak", ofType: ".m4v") {
                let player6 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController6 = AVPlayerViewController()
                playerViewController6.player = player6
                self.present(playerViewController6, animated: true) {
                    player6.play()
                }
            }
        }
        
        if view.annotation is Video7{
            if let path = Bundle.main.path(forResource: "Brothers Keeper Brandon", ofType: ".m4v") {
                let player7 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController7 = AVPlayerViewController()
                playerViewController7.player = player7
                self.present(playerViewController7, animated: true) {
                    player7.play()
                }
            }
        }
        
        if view.annotation is Video8{
            if let path = Bundle.main.path(forResource: "Kenn Manous", ofType: ".m4v") {
                let player8 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController8 = AVPlayerViewController()
                playerViewController8.player = player8
                self.present(playerViewController8, animated: true) {
                    player8.play()
                }
            }
        }
        
        if view.annotation is Video9{
            if let path = Bundle.main.path(forResource: "Comet Splash", ofType: ".m4v") {
                let player9 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController9 = AVPlayerViewController()
                playerViewController9.player = player9
                self.present(playerViewController9, animated: true) {
                    player9.play()
                }
            }
        }
        
        if view.annotation is Video10{
            if let path = Bundle.main.path(forResource: "Project Alpha with Tau Xi Chapter Spring 2018", ofType: ".m4v") {
                let player10 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController10 = AVPlayerViewController()
                playerViewController10.player = player10
                self.present(playerViewController10, animated: true) {
                    player10.play()
                }
            }
        }
        
        if view.annotation is Video11{
            if let path = Bundle.main.path(forResource: "Playground Build", ofType: ".m4v") {
                let player11 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController11 = AVPlayerViewController()
                playerViewController11.player = player11
                self.present(playerViewController11, animated: true) {
                    player11.play()
                }
            }
        }
        
        if view.annotation is Video12{
            if let path = Bundle.main.path(forResource: "Back to School driv", ofType: ".m4v") {
                let player12 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController12 = AVPlayerViewController()
                playerViewController12.player = player12
                self.present(playerViewController12, animated: true) {
                    player12.play()
                }
            }
        }
        
        if view.annotation is Video13{
            if let path = Bundle.main.path(forResource: "Highway Clean Up", ofType: ".m4v") {
                let player13 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController13 = AVPlayerViewController()
                playerViewController13.player = player13
                self.present(playerViewController13, animated: true) {
                    player13.play()
                }
            }
        }
        
        if view.annotation is Video14{
            if let path = Bundle.main.path(forResource: "A Voteless People is a Hopeless People Dallas County Voter Registration Day", ofType: ".m4v") {
                let player14 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController14 = AVPlayerViewController()
                playerViewController14.player = player14
                self.present(playerViewController14, animated: true) {
                    player14.play()
                }
            }
        }
        
        if view.annotation is Video15{
            if let path = Bundle.main.path(forResource: "Dallas Life", ofType: ".m4v") {
                let player15 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController15 = AVPlayerViewController()
                playerViewController15.player = player15
                self.present(playerViewController15, animated: true) {
                    player15.play()
                }
            }
        }
        
        if view.annotation is Video16{
            if let path = Bundle.main.path(forResource: "MLK Parade", ofType: ".m4v") {
                let player16 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController16 = AVPlayerViewController()
                playerViewController16.player = player16
                self.present(playerViewController16, animated: true) {
                    player16.play()
                }
            }
        }
        
        if view.annotation is Video17{
            if let path = Bundle.main.path(forResource: "Womens Appreciation", ofType: ".m4v") {
                let player17 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController17 = AVPlayerViewController()
                playerViewController17.player = player17
                self.present(playerViewController17, animated: true) {
                    player17.play()
                }
            }
        }
        
        if view.annotation is Video18{
            if let path = Bundle.main.path(forResource: "Feeding the Homeless", ofType: ".m4v") {
                let player18 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController18 = AVPlayerViewController()
                playerViewController18.player = player18
                self.present(playerViewController18, animated: true) {
                    player18.play()
                }
            }
        }
        
        if view.annotation is Video19{
            if let path = Bundle.main.path(forResource: "1080p", ofType: ".m4v") {
                let player19 = AVPlayer(url: URL(fileURLWithPath: path))
                let playerViewController19 = AVPlayerViewController()
                playerViewController19.player = player19
                self.present(playerViewController19, animated: true) {
                    player19.play()
                }
            }
        }
    }
    
    
}
