
# Open Orders Page – Mobile UI

I created this Open Orders page based on the web-based UI provided to me. My main goal was to build a clean, intuitive, and fast user interface that works well on mobile screens while keeping the functionality and look of the original design.

## 1. Core Philosophy & Approach

**Mobile-First Responsive Design**
- Redesigned for mobile use, not just shrunk from web UI.
- Multi-column tables are replaced with easy-to-read Cards.
- Horizontally overflowing content (e.g., market ticker) is scrollable.
- Primary navigation is placed in a standard mobile Drawer.

**Clean Architecture**
- The app is scalable, maintainable, and testable.
- Business logic is separated from UI and data sources.
- Easily switch UI frameworks or data sources with minimal changes.

**Declarative UI with Provider State Management**
- Uses Provider for simple, effective state management.
- UI updates automatically when data or filters change.
- Code is predictable and easier to debug.

## 2. Project Structure

```
lib/
├── core/
│   └── styles.dart                # Reusable text styles and theme constants
├── data/
│   └── repositories/
│       └── order_repository_impl.dart  # Repository implementation
├── domain/
│   ├── entities/
│   │   └── order.dart             # Core Order data model
│   ├── repositories/
│   │   └── order_repository.dart  # Abstract contract for data layer
│   └── usecases/
│       └── get_orders.dart        # Business action
├── presentation/
│   ├── pages/
│   │   └── orders_page.dart       # Main screen widget
│   ├── provider/
│   │   └── order_provider.dart    # State management for UI
│   └── widgets/                   # Reusable UI components
│       ├── app_drawer.dart
│       ├── filter_bar.dart
│       ├── market_header.dart
│       ├── order_card.dart
│       └── order_list.dart
└── main.dart                      # Main application file
```

## 3. Key Features

- **Responsive Market Header:** Horizontally scrollable header for market indices.
- **Comprehensive Filtering:**
	- Filter by Client ID.
	- Search for specific stocks (UI only).
	- Manage active ticker and client filters as chips.
- **Mobile-Optimized Order List:** Orders displayed as clean, scrollable Cards.

## 4. Navigation & Actions

- Slide-out Drawer for navigation (Marketwatch, Portfolio, etc.).
- "Cancel All" and "Download" buttons for quick actions.
- Provider efficiently manages fetching, filtering, and displaying orders.