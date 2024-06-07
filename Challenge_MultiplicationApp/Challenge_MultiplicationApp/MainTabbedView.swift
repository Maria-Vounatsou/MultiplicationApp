import SwiftUI

struct MainTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    @StateObject var viewModel = GameViewModel(numberOfTables: 2, rounds: [2, 5, 10, 20])
    
    var body: some View {
        
        ZStack{
                    TabView(selection: $selectedSideMenuTab) {
                        HomeView(presentSideMenu: $presentSideMenu)
                            .tag(0)
                        SettingsView(presentSideMenu: $presentSideMenu)
                            .tag(1)
                        GameView(presentSideMenu: $presentSideMenu)
                            .tag(2)
                    }
                    SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
                }
            }
        }

struct MainTabbedView_Previews: PreviewProvider {
    @State static var isShowing = false
    static var previews: some View {
        MainTabbedView()
            .environmentObject(GameViewModel(numberOfTables: 2, rounds: [2, 5, 10, 20]))
    }
}
