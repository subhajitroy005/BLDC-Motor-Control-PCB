from pcbnew import *


# Board Path
board_path = "../High_Amp_PCB_Designs/KiCAD_Design/High_AMP_BLDC_Control/High_AMP_BLDC_Control.kicad_pcb"



board = LoadBoard(board_path)

# --------------  Tracks -------------------
tracks = board.Tracks()

track_pos = tracks.pop()

a = track_pos.GetPosition()

net_1= board.FindNet("Net-(R2-Pad2)")

net_info_1 = net_1.GetPosition()


print(a)

