# Mensurge: Product Design Document

This document outlines the V1 product design, user experience, and behavioral psychology architecture for **Mensurge**, a behavioral change system designed to help users break compulsive habits, manage urges, and redirect energy into meaningful activities.

---

## 1. User Flow

The core product loop is: **Trigger → Urge → Intervention → Replacement → Reward → Reflection → Repeat**

### 1.1 Onboarding Flow (Deep, Emotional, Action-Oriented)
- **Splash Screen**: Deep `#0B0F14` background, minimalist Mensurge logo. Intense, smooth fade-in.
- **Problem Acknowledgment**: "Why are you here?" (Options: Wasting time, Brain fog, Lack of discipline, Addiction).
- **The Reality Check**: A hard-hitting, dynamic text display based on their answer (e.g., "Cheap dopamine is killing your potential.").
- **Goal Selection (Replacement System)**: "What will you build instead?" User selects 1-3 binary daily habits to overwrite the old one (e.g., Gym, Coding, Reading).
- **Blocking Setup**: "Shut the door behind you." Step-by-step instructions to configure Cloudflare Family DNS (1.1.1.3) on their device.
- **The Pledge**: A digital signature screen. The user must physically type: "I commit to mastering my energy."
- **Dashboard Entry**: The streak begins at 0. The AI Companion delivers a stark, grounding first message.

### 1.2 Daily Usage Flow
- **Morning Check-In**: "Are you ready for today?" A quick prompt to review the day's binary Replacement Goals.
- **Dashboard View**: User views current rank, streak (in Handjet font), and checks off daily replacements as they happen.
- **Evening Reflection**: "Did you win today?" Lightweight journaling logging mood, urges felt, and energy redirected.

### 1.3 Urge Moment Flow (CRITICAL — Fast & Effective)
- **Trigger**: User feels an urge and hits the prominent, always-accessible "URGE" button.
- **Intervention (AI Takeover)**: Screen turns deep blue/red. AI provides a sharp, contextual intervention: "Breathe. You are stronger than a 5-second impulse."
- **Action Deflection**: App forces a 60-second timer. "Drop and do 10 pushups right now." Alternatively, the user can open the AI conversational interface for a quick, grounding chat.
- **Resolution**: After the timer, "Did you beat it?" (Yes/No).
  - If Yes ➔ "Energy Redirected" logged.
  - If No ➔ Redirect to Relapse Flow.

### 1.4 Relapse Flow (Non-judgmental but Corrective)
- **The Reset**: Streak physically rolls back to 0. Screen dims.
- **Root Cause Analysis**: "What triggered this?" (Options: Boredom, Stress, Loneliness, Peeked).
- **Journaling**: "Write it down so you don't repeat it."
- **AI Corrective**: Direct message: "A stumble isn't a fall unless you stay down. Analyze it. Get back up."
- **Restart**: Streak restarts immediately. No lingering shame.

---

## 2. Screens Breakdown

### 2.1 Onboarding & The Pledge
- **Purpose**: Set the intense tone, lock in commitment, and set up DNS blocking friction.
- **Key UI Elements**: Typography-heavy, minimalistic forms, full-screen takeover for The Pledge.
- **User Actions**: Tap to select triggers, type pledge, follow DNS install guide.
- **Microcopy**: "Shut the door behind you." "I commit to mastering my energy."
- **Emotional Intent**: Weighty, serious, a definitive turning point.

### 2.2 Dashboard (Home)
- **Purpose**: Central hub for streak, rank, and daily actions.
- **Key UI Elements**: Huge streak number in **Handjet** font. Rank badge. Prominent "URGE" panic button. Binary checkboxes for Replacement Goals.
- **User Actions**: Check off daily goals, tap URGE button, navigate to other tabs.
- **Microcopy**: "Day [X]. Stay Sharp." "Energy Redirected: [Gym] [Coding]."
- **Emotional Intent**: Proud, focused, clear.

### 2.3 Urge Intervention (The Panic Room)
- **Purpose**: Break the dopamine loop instantly.
- **Key UI Elements**: Full-screen takeover, countdown timer, pulsing haptic feedback.
- **User Actions**: Wait out timer, read AI message, confirm survival.
- **Microcopy**: "Step away from the screen." "You are rewiring your brain right now."
- **Emotional Intent**: Urgent, grounding, highly intense.

### 2.4 Relapse Logger
- **Purpose**: Learn from failure without spiraling.
- **Key UI Elements**: Dimmed background, simple chips for trigger selection.
- **User Actions**: Select trigger, write a short note, confirm reset.
- **Microcopy**: "Own it. Analyze it. Move forward."
- **Emotional Intent**: Cold, analytical, forgiving but firm.

### 2.5 Replacement Goals & Daily Check-in
- **Purpose**: Track energy redirection.
- **Key UI Elements**: Clean list of binary tasks (Yes/No toggles).
- **User Actions**: Toggle completion.
- **Microcopy**: "Did you put the energy to work today?"
- **Emotional Intent**: Accountable, action-oriented.

### 2.6 AI Companion Chat
- **Purpose**: On-demand guidance and venting.
- **Key UI Elements**: Chat interface, dark bubbles. AI typing indicator.
- **User Actions**: Type freely, read contextual responses.
- **Microcopy**: "Talk to me. What's the trigger?"
- **Emotional Intent**: Mentorship, objective, direct.

### 2.7 Community Feed
- **Purpose**: See others winning; macro-level motivation.
- **Key UI Elements**: Minimalist feed of milestones ("User reached Rank 3", "User beat an urge").
- **User Actions**: Give Kudos (fist bump icon), scroll.
- **Microcopy**: "The arena." "Iron sharpens iron."
- **Emotional Intent**: Belonging, competitive motivation.

### 2.8 Accountability Partners (1-on-1)
- **Purpose**: Direct personal accountability.
- **Key UI Elements**: Partner's status indicator, direct messaging, "Ping" button if they are struggling.
- **User Actions**: Message partner, view their streak, send a lifeline.
- **Microcopy**: "[Partner] is counting on you." "Send a lifeline."
- **Emotional Intent**: Duty, brotherhood/sisterhood, responsibility.

### 2.9 Adult Content Blocking
- **Purpose**: Add necessary friction to relapse.
- **Key UI Elements**: Step-by-step instructions with sleek illustrations for configuring Cloudflare DNS.
- **User Actions**: Tap to copy DNS addresses, open OS settings.
- **Microcopy**: "Make it harder to fail. Add the Cloudflare Family DNS."
- **Emotional Intent**: Practical, secure.

### 2.10 Advanced Analytics Dashboard
- **Purpose**: Long-term insights into behavior.
- **Key UI Elements**: Minimalist line charts (mood), bar charts (urges over time), heatmaps (relapse triggers).
- **User Actions**: Filter by week/month/year.
- **Microcopy**: "Your Data." "Know your enemy."
- **Emotional Intent**: Intellectual, strategic, insightful.

### 2.11 Content Library
- **Purpose**: Curated education on neuroscience and habits.
- **Key UI Elements**: High-contrast cards with articles/audio.
- **User Actions**: Read, listen.
- **Microcopy**: "Understand the brain." "The science of dopamine."
- **Emotional Intent**: Educational, empowering.

### 2.12 Lightweight Journaling
- **Purpose**: Nightly reflection and mental offloading.
- **Key UI Elements**: Text area, minimal mood sliders.
- **User Actions**: Rate mood, write note.
- **Microcopy**: "Clear your mind before sleep."
- **Emotional Intent**: Calm, reflective.

---

## 3. Core Systems

### 3.1 Goal Replacement System (Core Differentiator)
- **Mechanic**: Users define 1-3 core Replacement Goals during onboarding (e.g., Gym, Coding, Reading).
- **Tracking**: Strictly Binary (Yes/No). Completed goals earn "Energy Redirected" markers.
- **Intervention Integration**: During an Urge, the app dynamically pushes them toward action: "Instead of giving in, do 10 minutes of [Coding]."
- **Philosophy**: You cannot simply delete a bad habit; you must overwrite it with a productive one.

### 3.2 Streak + Rank System
- **Progression Logic**: Tied directly to Days.
- **Levels/Ranks**:
  - **Rank 1**: Initiate (Days 1-3)
  - **Rank 2**: Challenger (Days 4-7)
  - **Rank 3**: Defiant (Days 8-14)
  - **Rank 4**: Disciplined (Days 15-30)
  - **Rank 5**: Master (Days 31-90)
  - **Rank 6**: Architect (Days 90+)
- **Rewards**: Psychological. Visual badge upgrades (from crude bronze to sleek dark matter). Surviving urges acts as a silent multiplier for internal user scoring.

---

## 4. AI Behavior

### 4.1 Modalities
- **Contextual Takeovers**: One-way, highly targeted interventions during the Urge and Relapse flows.
- **Conversational Interface**: A dedicated chat tab for free-form dialogue when the user needs to talk through a low-motivation or high-stress moment.

### 4.2 Tone & Examples
- **Tone**: Direct, honest, slightly intense. Never cheesy, never overly motivational.
- **Urge**: "Your brain is lying to you for a cheap hit. Step away from the phone."
- **Relapse**: "You fell. The only failure is staying down. Analyze what broke and let's go again."
- **Low Motivation**: "Motivation is a myth. Discipline is what builds empires. Do the work."

---

## 5. Design System

### 5.1 Theme & Colors
- **Dark-first UI**: Deep, immersive, serious.
- **Background**: `#0B0F14` (Deep Space Dark)
- **Surface**: `#111827` (Dark Gray for cards/modals)
- **Primary Blue**: `#3B82F6` (Electric Blue - Action/Urge button)
- **Text Primary**: `#E5E7EB`
- **Text Secondary**: `#9CA3AF`
- **Danger/Relapse**: `#EF4444` (Used sparingly for warnings/relapse)
- **Success/Replacement**: `#10B981` (Completed binary goals)

### 5.2 Typography
- **Headings**: Inter / Stack Sans (Bold, structural)
- **Body**: Inter (Clean, readable)
- **Streak Numbers**: Handjet (Digital, raw, emotional impact)

### 5.3 Design Principles
- **Minimal with Micro-interactions**: Sharp haptic feedback on every toggle and button press.
- **High Contrast**: Essential for readability in intense emotional states.
- **One Screen = One Purpose**: No cluttered menus. High focus.
- **Fast Interactions**: The Urge button must load the intervention instantly (< 0.5s).

---

## 6. Metrics & Tech Suggestions

### 6.1 Key Behavioral Metrics to Track
- **Urge Survival Rate**: (Urges survived / Total urges logged).
- **Replacement Completion Rate**: % of binary daily goals checked off.
- **Trigger Frequency**: Heatmap of what causes the most relapses (e.g., Nighttime + Boredom).
- **Retention**: Day 1, Day 7, Day 30.

### 6.2 Technical Architecture (MVP-Friendly)
- **Frontend**: Flutter. Ideal for a high-performance cross-platform V1 with custom micro-animations and typography.
- **Backend**: Firebase. Firestore for fast data sync, Firebase Auth, and Cloud Functions for AI/Community integrations.
- **AI Integration**: OpenAI API (GPT-4o-mini). Fast, cost-effective for contextual prompt generation and conversational chat.
- **Content Blocking**: Static UI guide directing users to configure Cloudflare Family DNS via iOS/Android native settings.
