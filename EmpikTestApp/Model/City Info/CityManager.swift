//
//  CityManager.swift
//  EmpikTestApp
//
//  Created by Michael on 7/29/23.
//

import Foundation

struct CityManager {
    
    func getCityNames(for name: String) -> [String] {
        if name.count == 1 {
            switch name.capitalized.first {
            case "A":
                return CityData.a
            case "B":
                return CityData.b
            case "C":
                return CityData.c
            case "D":
                return CityData.d
            case "E":
                return CityData.e
            case "F":
                return CityData.f
            case "G":
                return CityData.g
            case "H":
                return CityData.h
            case "I":
                return CityData.i
            case "J":
                return CityData.j
            case "K":
                return CityData.k
            case "L":
                return CityData.l
            case "M":
                return CityData.m
            case "N":
                return CityData.n
            case "O":
                return CityData.o
            case "P":
                return CityData.p
            case "Q":
                return CityData.q
            case "R":
                return CityData.r
            case "S":
                return CityData.s
            case "T":
                return CityData.t
            case "U":
                return CityData.u
            case "V":
                return CityData.v
            case "W":
                return CityData.w
            case "X":
                return CityData.x
            case "Y":
                return CityData.y
            case "Z":
                return CityData.z
            default:
                return [K.defaultResult]
            }
        }else {
            switch name.capitalized.first {
            case "A":
                return getFullCityNames(for: name.capitalized)
            case "B":
                return getFullCityNames(for: name.capitalized)
            case "C":
                return getFullCityNames(for: name.capitalized)
            case "D":
                return getFullCityNames(for: name.capitalized)
            case "E":
                return getFullCityNames(for: name.capitalized)
            case "F":
                return getFullCityNames(for: name.capitalized)
            case "G":
                return getFullCityNames(for: name.capitalized)
            case "H":
                return getFullCityNames(for: name.capitalized)
            case "I":
                return getFullCityNames(for: name.capitalized)
            case "J":
                return getFullCityNames(for: name.capitalized)
            case "K":
                return getFullCityNames(for: name.capitalized)
            case "L":
                return getFullCityNames(for: name.capitalized)
            case "M":
                return getFullCityNames(for: name.capitalized)
            case "N":
                return getFullCityNames(for: name.capitalized)
            case "O":
                return getFullCityNames(for: name.capitalized)
            case "P":
                return getFullCityNames(for: name.capitalized)
            case "Q":
                return getFullCityNames(for: name.capitalized)
            case "R":
                return getFullCityNames(for: name.capitalized)
            case "S":
                return getFullCityNames(for: name.capitalized)
            case "T":
                return getFullCityNames(for: name.capitalized)
            case "U":
                return getFullCityNames(for: name.capitalized)
            case "V":
                return getFullCityNames(for: name.capitalized)
            case "W":
                return getFullCityNames(for: name.capitalized)
            case "X":
                return getFullCityNames(for: name.capitalized)
            case "Y":
                return getFullCityNames(for: name.capitalized)
            case "Z":
                return getFullCityNames(for: name.capitalized)
            default:
                return [K.defaultResult]
            }
        }
    }
    
    func getFullCityNames(for name: String) -> [String] {
        switch name.first {
        case "A":
            var results = [String]()
            for i in 0..<CityData.a.count {
                if CityData.a[i].hasPrefix(name) {
                    results.append(CityData.a[i])
                }
            }
            return results
        case "B":
            var results = [String]()
            for i in 0..<CityData.b.count {
                if CityData.b[i].hasPrefix(name) {
                    results.append(CityData.b[i])
                }
            }
            return results
        case "C":
            var results = [String]()
            for i in 0..<CityData.c.count {
                if CityData.c[i].hasPrefix(name) {
                    results.append(CityData.c[i])
                }
            }
            return results
        case "D":
            var results = [String]()
            for i in 0..<CityData.d.count {
                if CityData.d[i].hasPrefix(name) {
                    results.append(CityData.d[i])
                }
            }
            return results
        case "E":
            var results = [String]()
            for i in 0..<CityData.e.count {
                if CityData.e[i].hasPrefix(name) {
                    results.append(CityData.e[i])
                }
            }
            return results
        case "F":
            var results = [String]()
            for i in 0..<CityData.f.count {
                if CityData.f[i].hasPrefix(name) {
                    results.append(CityData.f[i])
                }
            }
            return results
        case "G":
            var results = [String]()
            for i in 0..<CityData.g.count {
                if CityData.g[i].hasPrefix(name) {
                    results.append(CityData.g[i])
                }
            }
            return results
        case "H":
            var results = [String]()
            for i in 0..<CityData.h.count {
                if CityData.h[i].hasPrefix(name) {
                    results.append(CityData.h[i])
                }
            }
            return results
        case "I":
            var results = [String]()
            for i in 0..<CityData.i.count {
                if CityData.i[i].hasPrefix(name) {
                    results.append(CityData.i[i])
                }
            }
            return results
        case "J":
            var results = [String]()
            for i in 0..<CityData.j.count {
                if CityData.j[i].hasPrefix(name) {
                    results.append(CityData.j[i])
                }
            }
            return results
        case "K":
            var results = [String]()
            for i in 0..<CityData.k.count {
                if CityData.k[i].hasPrefix(name) {
                    results.append(CityData.k[i])
                }
            }
            return results
        case "L":
            var results = [String]()
            for i in 0..<CityData.l.count {
                if CityData.l[i].hasPrefix(name) {
                    results.append(CityData.l[i])
                }
            }
            return results
        case "M":
            var results = [String]()
            for i in 0..<CityData.m.count {
                if CityData.m[i].hasPrefix(name) {
                    results.append(CityData.m[i])
                }
            }
            return results
        case "N":
            var results = [String]()
            for i in 0..<CityData.n.count {
                if CityData.n[i].hasPrefix(name) {
                    results.append(CityData.n[i])
                }
            }
            return results
        case "O":
            var results = [String]()
            for i in 0..<CityData.o.count {
                if CityData.o[i].hasPrefix(name) {
                    results.append(CityData.o[i])
                }
            }
            return results
        case "P":
            var results = [String]()
            for i in 0..<CityData.p.count {
                if CityData.p[i].hasPrefix(name) {
                    results.append(CityData.p[i])
                }
            }
            return results
        case "Q":
            var results = [String]()
            for i in 0..<CityData.q.count {
                if CityData.q[i].hasPrefix(name) {
                    results.append(CityData.q[i])
                }
            }
            return results
        case "R":
            var results = [String]()
            for i in 0..<CityData.r.count {
                if CityData.r[i].hasPrefix(name) {
                    results.append(CityData.r[i])
                }
            }
            return results
        case "S":
            var results = [String]()
            for i in 0..<CityData.s.count {
                if CityData.s[i].hasPrefix(name) {
                    results.append(CityData.s[i])
                }
            }
            return results
        case "T":
            var results = [String]()
            for i in 0..<CityData.t.count {
                if CityData.t[i].hasPrefix(name) {
                    results.append(CityData.t[i])
                }
            }
            return results
        case "U":
            var results = [String]()
            for i in 0..<CityData.u.count {
                if CityData.u[i].hasPrefix(name) {
                    results.append(CityData.u[i])
                }
            }
            return results
        case "V":
            var results = [String]()
            for i in 0..<CityData.v.count {
                if CityData.v[i].hasPrefix(name) {
                    results.append(CityData.v[i])
                }
            }
            return results
        case "W":
            var results = [String]()
            for i in 0..<CityData.w.count {
                if CityData.w[i].hasPrefix(name) {
                    results.append(CityData.w[i])
                }
            }
            return results
        case "X":
            var results = [String]()
            for i in 0..<CityData.x.count {
                if CityData.x[i].hasPrefix(name) {
                    results.append(CityData.x[i])
                }
            }
            return results
        case "Y":
            var results = [String]()
            for i in 0..<CityData.y.count {
                if CityData.y[i].hasPrefix(name) {
                    results.append(CityData.y[i])
                }
            }
            return results
        case "Z":
            var results = [String]()
            for i in 0..<CityData.z.count {
                if CityData.z[i].hasPrefix(name) {
                    results.append(CityData.z[i])
                }
            }
            return results
        default:
            return [K.defaultResult]
        }
    }
    
}

