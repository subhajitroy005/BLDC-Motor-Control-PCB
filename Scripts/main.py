from pcbnew import *


# Board Path
board_path = "../High_Amp_PCB_Designs/KiCAD_Design/High_AMP_BLDC_Control/High_AMP_BLDC_Control.kicad_pcb"



board = LoadBoard(board_path)

tracks = board.Tracks()

print(tracks)