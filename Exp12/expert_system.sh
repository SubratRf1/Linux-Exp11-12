#!/bin/bash

display_header() {
    echo "-------------------------------------------"
    echo "      F1 QATAR GRAND PRIX HELPER"
    echo "-------------------------------------------"
    echo
}

get_keywords() {
    echo "Enter keywords about what you want to know (separated by space):"
    echo "Examples: practice qualifying race tyres tickets transport weather spectating safety"
    read -r user_input
    # normalize to lowercase
    keywords=$(echo "$user_input" | tr 'A-Z' 'a-z')
}

evaluate_rules() {
    local matched=false
    echo
    echo " RECOMMENDATIONS / INFO "
    echo "------------------------"
    echo

    # RULE: General Qatar/Losail info
    if [[ "$keywords" == *"qatar"* ]] || [[ "$keywords" == *"losail"* ]]; then
        echo "- Qatar / Losail Circuit:"
        echo "  • The Losail International Circuit is fast and modern; expect high-speed corners and strong brakes zones."
        echo "  • It's known for dramatic races and good overtaking opportunities at designated straights and braking points."
        matched=true
        echo
    fi

    # RULE: Practice
    if [[ "$keywords" == *"practice"* ]] || [[ "$keywords" == *"fp1"* ]] || [[ "$keywords" == *"fp2"* ]]; then
        echo "- Practice sessions:"
        echo "  • Practice is used by teams to fine-tune setup and tyre strategy — it's less about lap times and more about data-gathering."
        echo "  • Watch for long-run pace and tyre wear indicators."
        matched=true
        echo
    fi

    # RULE: Qualifying
    if [[ "$keywords" == *"qualifying"* ]] || [[ "$keywords" == *"q1"* ]] || [[ "$keywords" == *"q2"* ]] || [[ "$keywords" == *"q3"* ]]; then
        echo "- Qualifying tips:"
        echo "  • Qualifying position matters for clean air at Losail — good grid position helps avoid first-lap chaos."
        echo "  • Teams may try to use the soft tyre for a quick lap; pay attention to track evolution and temperature."
        matched=true
        echo
    fi

    # RULE: Race strategy / tyres
    if [[ "$keywords" == *"race"* ]] || [[ "$keywords" == *"strategy"* ]] || [[ "$keywords" == *"tyre"* ]] || [[ "$keywords" == *"tyres"* ]] || [[ "$keywords" == *"tire"* ]]; then
        echo "- Race strategy & tyres:"
        echo "  • Tyre management is important — watch for degradation on sustained high-speed sections."
        echo "  • Pit stop strategy can make or break the race: undercuts and overcuts are common."
        echo "  • Expect teams to balance pace vs tyre life; track temperature and sand/dust can affect grip."
        matched=true
        echo
    fi

    # RULE: Weather / night race
    if [[ "$keywords" == *"weather"* ]] || [[ "$keywords" == *"wind"* ]] || [[ "$keywords" == *"sand"* ]] || [[ "$keywords" == *"night"* ]] || [[ "$keywords" == *"heat"* ]]; then
        echo "- Weather & track conditions:"
        echo "  • Qatar events can be affected by wind and sand — this may reduce grip and increase tyre wear."
        echo "  • If it's a night race, temperatures drop after sunset causing the track to gain grip (watch for changing balance)."
        matched=true
        echo
    fi

    # RULE: Spectating / tickets / fan info
    if [[ "$keywords" == *"tickets"* ]] || [[ "$keywords" == *"spectator"* ]] || [[ "$keywords" == *"grandstand"* ]] || [[ "$keywords" == *"hospitality"* ]] || [[ "$keywords" == *"fan"* ]]; then
        echo "- Spectator & ticket tips:"
        echo "  • Buy tickets from official sellers; check seating/entry times and schedule for support events."
        echo "  • Bring ear protection — it can be loud in grandstands and near the pitlane."
        echo "  • Hospitality packages may include paddock club access, food, and driver appearances if that's of interest."
        matched=true
        echo
    fi

    # RULE: Transport / getting there / parking
    if [[ "$keywords" == *"transport"* ]] || [[ "$keywords" == *"parking"* ]] || [[ "$keywords" == *"shuttle"* ]] || [[ "$keywords" == *"access"* ]]; then
        echo "- Transport & logistics:"
        echo "  • Plan your travel time — circuits can be busy before/after sessions; allow extra time for security checks."
        echo "  • Check shuttle services and parking information in advance; some events require pre-booking for park-and-ride."
        matched=true
        echo
    fi

    # RULE: Safety / incidents / crashes
    if [[ "$keywords" == *"safety"* ]] || [[ "$keywords" == *"crash"* ]] || [[ "$keywords" == *"incident"* ]] || [[ "$keywords" == *"marshal"* ]]; then
        echo "- Safety & incidents:"
        echo "  • Race marshals and FIA safety protocols handle on-track incidents; follow official instructions and steward announcements."
        echo "  • If you witness an on-track incident in the crowd, follow venue staff directions and avoid unsafe areas."
        matched=true
        echo
    fi

    # RULE: Pitting / pitlane
    if [[ "$keywords" == *"pit"* ]] || [[ "$keywords" == *"pitstop"* ]] || [[ "$keywords" == *"pitlane"* ]]; then
        echo "- Pitlane & pitstop info:"
        echo "  • Pitstops are high-speed choreography — watch for the pit window and how teams use it to gain position."
        echo "  • Pitlane access rules are strict; only authorized personnel are allowed in pit lane during sessions."
        matched=true
        echo
    fi

    # RULE: Overtaking / track layout / corners
    if [[ "$keywords" == *"overtake"* ]] || [[ "$keywords" == *"overtaking"* ]] || [[ "$keywords" == *"corners"* ]] || [[ "$keywords" == *"straights"* ]] || [[ "$keywords" == *"layout"* ]]; then
        echo "- Overtaking & circuit layout:"
        echo "  • Look for overtaking opportunities at the end of long straights and heavy braking zones."
        echo "  • Track layout and DRS zones (if applicable) influence how drivers plan passes and defence."
        matched=true
        echo
    fi

    # RULE: Media / broadcasting / how to watch
    if [[ "$keywords" == *"watch"* ]] || [[ "$keywords" == *"tv"* ]] || [[ "$keywords" == *"stream"* ]] || [[ "$keywords" == *"broadcast"* ]]; then
        echo "- Watching & broadcast:"
        echo "  • Check official broadcasters and streaming platforms for live coverage, practice/qualifying highlights, and onboard cameras."
        echo "  • Local time zone differences matter — verify session start times."
        matched=true
        echo
    fi

    # RULE: Afterparty / entertainment / support races
    if [[ "$keywords" == *"afterparty"* ]] || [[ "$keywords" == *"support"* ]] || [[ "$keywords" == *"concert"* ]] || [[ "$keywords" == *"entertainment"* ]]; then
        echo "- Events & entertainment:"
        echo "  • Major Grands Prix often include support races, concerts, and fan zones — check the event schedule for timings and ticketing."
        echo "  • Plan ahead for crowds at entertainment areas right after the sessions end."
        matched=true
        echo
    fi

    # Fallback if no rules matched
    if [[ "$matched" == false ]]; then
        echo "- No specific match for your keywords."
        echo "  General tips for attending/understanding a Grand Prix:"
        echo "   • Check the official event schedule for practice / qualifying / race times."
        echo "   • Review transport, entry, and bag policy before you go."
        echo "   • Bring sun/ear protection and comfortable clothing; stay hydrated if daytime, or layered clothing for cooler night sessions."
        echo "   • Follow official social channels and the event website for last-minute updates."
        echo
    fi

    echo "IMPORTANT:"
    echo " • The information provided is general guidance only."
    echo " • For official rules, ticketing, safety, and live updates always refer to the FIA, Formula 1, and the event's official websites or authorized sellers."
    echo
}

# Main
display_header
get_keywords
evaluate_rules
exit 0
