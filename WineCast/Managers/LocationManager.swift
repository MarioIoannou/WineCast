import CoreLocation
import SwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    
    @Published var location: CLLocation?
    @Published var error: Error?
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    override init() {
        
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyReduced
        manager.activityType = .other
    }
    
    func requestLocation() {
        
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        authorizationStatus = manager.authorizationStatus
        print("Authorization status changed to: \(manager.authorizationStatus.rawValue)")
        
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()
        case .denied, .restricted:
            error = NSError(
                domain: "LocationError",
                code: 1,
                userInfo: [NSLocalizedDescriptionKey: "Location access denied. Please enable it in Settings."]
            )
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("Location updated: \(locations.first?.coordinate ?? CLLocationCoordinate2D())")
        location = locations.first
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("Location error: \(error.localizedDescription)")
        
        if let clError = error as? CLError {
            switch clError.code {
            case .denied:
                self.error = NSError(
                    domain: "LocationError",
                    code: 1,
                    userInfo: [NSLocalizedDescriptionKey: "Please enable location access in Settings."]
                )
            case .locationUnknown:
                self.error = NSError(
                    domain: "LocationError",
                    code: 2,
                    userInfo: [NSLocalizedDescriptionKey: "Unable to determine location. Please try again."]
                )
            default:
                self.error = error
            }
        } else {
            self.error = error
        }
    }
} 
