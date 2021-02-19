import pandas as pd


def open_raw_data(file_name) -> pd.DataFrame:
    path = "./data/raw/"
    return pd.read_csv(path+file_name)


def open_reference_data(file_name) -> pd.DataFrame:
    path = "./data/reference/"
    return pd.read_csv(path+file_name)


def save_to_final(df: pd.DataFrame, file_name):
    path = "./data/final/"
    df.to_csv(path+file_name+".csv")


def avg_income():
    df = open_raw_data("labor_gdpo.csv")
    regions = open_reference_data("wb_regions.csv")
    regions.rename(columns={"World Region according to the World Bank": "region"})
    df.duplicated()
    indicator_names = {"rgdpo": "gdp", "emp": "workers", "avh": "hours"}
    df['VariableCode'] = df['VariableCode'].map(indicator_names)
    df = df.pivot(index=['RegionCode', 'VariableCode'], columns=['YearCode'], values=['AggValue'])
    df.columns = df.columns.droplevel()
    df.fillna()

if __name__ == '__main__':
    avg_income()