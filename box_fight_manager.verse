
using { /Fortnite.com/Devices }
using { /Verse.org/Native }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }


box_fight_log:=class(log_channel){}

box_fight_manager := class<concrete>(creative_device):
    Logger:log = log{Channel:=box_fight_log}
    @editable
    Barrier1:barrier_device = barrier_device{}
    @editable
    Barrier2:barrier_device = barrier_device{}
    @editable
    MidBarrier:barrier_device = barrier_device{}
    @editable
    Timer:timer_device = timer_device{}

    OnBegin<override>()<suspends>:void=
        Timer.SuccessEvent.Subscribe(DropBarriers)

    DropBarriers(Player:?agent):void=
        Barrier1.Disable()
        Barrier2.Disable()
        MidBarrier.Disable()