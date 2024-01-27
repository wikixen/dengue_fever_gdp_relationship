#This code is to auto add the cols to the table so that they dont need to be typed
import pandas as pd
from sqlalchemy import create_engine as cre
import pathlib as pthl

df_path = pthl.Path('C:/Users/Benny/Downloads/csvs')

engine = cre('postgresql://postgres:Pacman4Life!@localhost:5432/main')

for x in df_path.iterdir():
    df = pd.read_csv(x)
    df.columns = [c.lower() for c in df.columns]
    df.to_sql(x.stem, engine)
