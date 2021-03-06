sub EVENT_SPAWN {
  $counter = 0;
  $event = 0;
}

sub EVENT_SAY {
  if (($text=~/hail/i) && ($event == 1)) {
    quest::say("Don't bother me until your work is done!");
  }
  if (($text=~/hail/i) && ($event == 2)) {
    $group = $entity_list->GetGroupByClient($client);
    if ($group) {
      for ($count = 0; $count < $group->GroupCount(); $count++) {
        if ($group->GetMember($count)) {
          push (@player_list, $group->GetMember($count)->GetName());
        }
      }
    }
    foreach $player (@player_list) {
      $pc = $entity_list->GetClientByName($player);
	  if ($pc) {
        $charid = $pc->CharacterID();
        quest::targlobal("temp_sewers", 1, "F", 283052, $charid, 283);
        $pc->Message(4,"You receive a temporary flag!");
	  }
    }
  }
  if (($text=~/hail/i) && ($event == 0)) {
    quest::say("Find the aged stonemites. They are causing great trouble, come back and talk to me once you have solved the problem.");
    quest::spawn2(287021, 0, 0, -96, -1679, -89, 414); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -41, -1685, -89, 422); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, 2, -1658, -89, 396); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, 18, -1614, -89, 382); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, 5, -1559, -89, 340); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -12, -1517, -89, 318); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -56, -1484, -89, 268); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -53, -1586, -87, 360); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -120, -1573, -89, 270); # NPC: an_aged_stonemite
    $event = 1;    
  }
}

sub EVENT_SIGNAL {
  if ($signal == 0) {
    $event = 2;
  }
  if ($signal == 1) { 
    $counter += 1;
  }
  if (($counter == 9) && ($event == 1)) { 
    quest::spawn2(287145, 0, 0, -45, -1616, -87, 380); # NPC: #Ancient_Kayserops
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
