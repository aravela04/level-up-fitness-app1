import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            MainTabView()
        } else if showLogin {
            LoginView(showLogin: $showLogin, isLoggedIn: $isLoggedIn)
        } else {
            StartView(showLogin: $showLogin)
        }
    }
}

struct StartView: View {
    @Binding var showLogin: Bool

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.black, Color.orange.opacity(0.85)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 28) {
                Spacer()

                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.12))
                            .frame(width: 120, height: 120)

                        Image(systemName: "figure.strengthtraining.traditional")
                            .font(.system(size: 54))
                            .foregroundColor(.white)
                    }

                    Text("Level Up")
                        .font(.system(size: 40, weight: .bold))

                    Text("Track. Compete. Achieve.")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.85))
                }
                .foregroundColor(.white)

                Spacer()

                VStack(spacing: 14) {
                    Button(action: {
                        showLogin = true
                    }) {
                        Text("Log In")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(16)
                    }

                    Button(action: {
                        showLogin = true
                    }) {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.15))
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white.opacity(0.35), lineWidth: 1)
                            )
                            .cornerRadius(16)
                    }
                }
                .padding(.horizontal, 24)

                Text("Your fitness journey starts here.")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.75))
                    .padding(.bottom, 30)
            }
        }
    }
}

struct LoginView: View {
    @Binding var showLogin: Bool
    @Binding var isLoggedIn: Bool

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()

                VStack(spacing: 24) {
                    VStack(spacing: 10) {
                        Text("Welcome Back")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Log in to continue your progress")
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 30)

                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .font(.subheadline)
                                .fontWeight(.medium)

                            TextField("Enter your email", text: $email)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(14)
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                                .font(.subheadline)
                                .fontWeight(.medium)

                            SecureField("Enter your password", text: $password)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(14)
                        }
                    }
                    .padding(.horizontal, 24)

                    Button(action: {
                        isLoggedIn = true
                    }) {
                        Text("Log In")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 24)

                    Button(action: {
                        showLogin = false
                    }) {
                        Text("Back")
                            .foregroundColor(.orange)
                    }

                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            WorkoutsView()
                .tabItem {
                    Label("Workouts", systemImage: "figure.strengthtraining.traditional")
                }

            ProgressViewScreen()
                .tabItem {
                    Label("Progress", systemImage: "chart.line.uptrend.xyaxis")
                }

            CommunityView()
                .tabItem {
                    Label("Community", systemImage: "person.3.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
        .tint(.orange)
    }
}

struct HomeView: View {
    let weeklyData: [WorkoutDay] = [
        WorkoutDay(day: "Mon", value: 2),
        WorkoutDay(day: "Tue", value: 4),
        WorkoutDay(day: "Wed", value: 3),
        WorkoutDay(day: "Thu", value: 5),
        WorkoutDay(day: "Fri", value: 1),
        WorkoutDay(day: "Sat", value: 4),
        WorkoutDay(day: "Sun", value: 3)
    ]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {

                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Welcome Back")
                                .font(.title2)
                                .fontWeight(.semibold)

                            Text("Level Up")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }

                        Spacer()

                        ZStack {
                            Circle()
                                .fill(Color.orange.opacity(0.15))
                                .frame(width: 46, height: 46)

                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.orange)
                        }
                    }

                    DashboardCard {
                        HStack(spacing: 24) {
                            RingProgressView(
                                progress: 0.72,
                                lineWidth: 10,
                                size: 84,
                                title: "Level",
                                valueText: "5"
                            )

                            RingProgressView(
                                progress: 0.88,
                                lineWidth: 10,
                                size: 84,
                                title: "Streak",
                                valueText: "7"
                            )

                            RingProgressView(
                                progress: 0.60,
                                lineWidth: 10,
                                size: 84,
                                title: "Goal",
                                valueText: "60%"
                            )
                        }
                        .frame(maxWidth: .infinity)
                    }

                    HStack(spacing: 14) {
                        DashboardCard {
                            VStack(alignment: .leading, spacing: 10) {
                                Label("Workout Streak", systemImage: "flame.fill")
                                    .font(.caption)
                                    .foregroundColor(.orange)

                                Text("7 Days")
                                    .font(.title2)
                                    .fontWeight(.bold)

                                Text("Keep it going!")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }

                        DashboardCard {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Level 5")
                                    .font(.headline)

                                ProgressView(value: 0.72)
                                    .tint(.orange)

                                Text("3,450 XP")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    DashboardCard {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Weekly Progress")
                                .font(.headline)

                            HStack(alignment: .bottom, spacing: 10) {
                                ForEach(weeklyData) { item in
                                    WeeklyBarView(day: item.day, value: item.value)
                                }
                            }
                            .frame(maxWidth: .infinity, minHeight: 120)

                            HStack {
                                StatView(title: "Workouts", value: "4")
                                StatView(title: "Calories", value: "2,300")
                                StatView(title: "Time", value: "3h")
                            }
                        }
                    }

                    DashboardCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Label("Daily Challenge", systemImage: "target")
                                .font(.headline)

                            Text("20 Push-Ups")
                                .font(.title3)
                                .fontWeight(.bold)

                            Text("Complete today’s challenge to earn bonus XP.")
                                .font(.caption)
                                .foregroundColor(.secondary)

                            Button(action: {}) {
                                Text("Start Challenge")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(14)
                            }
                        }
                    }

                    DashboardCard {
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Text("Leaderboard")
                                    .font(.headline)

                                Spacer()

                                Text("Top This Week")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }

                            LeaderboardRow(
                                medal: "🥇",
                                icon: "person.fill",
                                name: "Mike",
                                points: "5890",
                                isCurrentUser: false
                            )

                            LeaderboardRow(
                                medal: "🥈",
                                icon: "person.fill",
                                name: "Sarah",
                                points: "5810",
                                isCurrentUser: false
                            )

                            LeaderboardRow(
                                medal: "🥉",
                                icon: "star.fill",
                                name: "Aaron",
                                points: "5400",
                                isCurrentUser: true
                            )
                        }
                    }

                    Button(action: {}) {
                        HStack(spacing: 10) {
                            Image(systemName: "bolt.fill")
                            Text("Start Workout")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(18)
                        .shadow(radius: 6, y: 3)
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WorkoutDay: Identifiable {
    let id = UUID()
    let day: String
    let value: CGFloat
}

struct WeeklyBarView: View {
    var day: String
    var value: CGFloat

    @State private var animateBar = false

    var body: some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.orange)
                .frame(width: 24, height: animateBar ? max(20, value * 20) : 8)
                .animation(.spring(duration: 0.8), value: animateBar)

            Text(day)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .bottom)
        .onAppear {
            animateBar = true
        }
    }
}

struct DashboardCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(22)
    }
}

struct StatView: View {
    var title: String
    var value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.headline)

            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct RingProgressView: View {
    var progress: CGFloat
    var lineWidth: CGFloat
    var size: CGFloat
    var title: String
    var valueText: String

    @State private var animatedProgress: CGFloat = 0

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .stroke(Color.orange.opacity(0.15), lineWidth: lineWidth)

                Circle()
                    .trim(from: 0, to: animatedProgress)
                    .stroke(
                        Color.orange,
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut(duration: 1.0), value: animatedProgress)

                Text(valueText)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .frame(width: size, height: size)

            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .onAppear {
            animatedProgress = progress
        }
    }
}

struct LeaderboardRow: View {
    var medal: String
    var icon: String
    var name: String
    var points: String
    var isCurrentUser: Bool

    var body: some View {
        HStack(spacing: 12) {
            Text(medal)
                .font(.title3)

            ZStack {
                Circle()
                    .fill(isCurrentUser ? Color.orange.opacity(0.18) : Color.gray.opacity(0.15))
                    .frame(width: 34, height: 34)

                Image(systemName: icon)
                    .foregroundColor(isCurrentUser ? .orange : .primary)
                    .font(.system(size: 14, weight: .semibold))
            }

            HStack(spacing: 6) {
                Text(name)
                    .fontWeight(isCurrentUser ? .bold : .medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)

                if isCurrentUser {
                    Text("You")
                        .font(.caption2)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.orange.opacity(0.15))
                        .foregroundColor(.orange)
                        .cornerRadius(8)
                }
            }

            Spacer()

            Text("\(points) pts")
                .foregroundColor(.secondary)
                .fontWeight(.medium)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(isCurrentUser ? Color.orange.opacity(0.08) : Color.clear)
        .cornerRadius(14)
    }
}

struct WorkoutsView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 50))
                    .foregroundColor(.orange)

                Text("Workouts")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Your workout routines will appear here.")
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Workouts")
        }
    }
}

struct ProgressViewScreen: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .font(.system(size: 50))
                    .foregroundColor(.orange)

                Text("Progress")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Track your fitness progress here.")
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Progress")
        }
    }
}

struct CommunityView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "person.3.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.orange)

                Text("Community")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Groups and discussions will appear here.")
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Community")
        }
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.orange)

                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Your profile and achievements.")
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ContentView()
}
