# Lee el archivo Excel
df = pd.read_excel('dataset/customer.xlsx')
# Convierte las fechas al formato correcto (YYYY-MM-DD)
df['CreateDate'] = pd.to_datetime(df['CreateDate'], format='%d/%m/%Y').dt.strftime('%Y-%m-%d')
df['DateOfBirth'] = pd.to_datetime(df['DateOfBirth'], format='%d/%m/%Y').dt.strftime('%Y-%m-%d')
# Obtiene el nombre de la tabla
table_name = 'customer'
# Define los tipos de datos correspondientes
column_types = {
    'CustId': 'INT',
    'AccountLocation': 'VARCHAR(255)',
    'Title': 'VARCHAR(255)',
    'FirstName': 'VARCHAR(255)',
    'LastName': 'VARCHAR(255)',
    'CreateDate': 'DATE',
    'CountryCode': 'VARCHAR(255)',
    'Language': 'VARCHAR(255)',
    'Status': 'VARCHAR(255)',
    'DateOfBirth': 'DATE',
    'Contact': 'VARCHAR(255)',
    'CustomerGroup': 'VARCHAR(255)'
}
# Genera el script SQL para crear la tabla
create_table_script = f"CREATE TABLE {table_name} (\n"
for column_name, column_type in column_types.items():
    create_table_script += f"    {column_name} {column_type},\n"
create_table_script = create_table_script.rstrip(",\n") + "\n);"
# Genera el script SQL para insertar los datos en la tabla
insert_into_script = f"INSERT INTO {table_name} ({', '.join(column_types.keys())}) VALUES\n"
for index, row in df.iterrows():
    values = ', '.join([f"'{value}'" if isinstance(value, str) else f"{value}" if pd.notnull(value) else 'NULL' for value in row.tolist()])
    insert_into_script += f"({values}),\n"
insert_into_script = insert_into_script.rstrip(",\n") + ";"
# Guarda los scripts SQL en un archivo
with open('customer-mysql.sql', 'w') as file:
    file.write(create_table_script + '\n\n')
    file.write(insert_into_script)
print("Scripts SQL generados y guardados en 'customer-mysql.sql'.")
# Extrae los datos de la tabla en el formato especificado
df['CreateDate'] = pd.to_datetime(df['CreateDate']).dt.strftime('%d/%m/%Y')  # Convierte la fecha al formato DD/MM/YYYY
df['DateOfBirth'] = pd.to_datetime(df['DateOfBirth']).dt.strftime('%d/%m/%Y')  # Convierte la fecha al formato DD/MM/YYYY
formatted_df = df[['CustId', 'AccountLocation', 'Title', 'FirstName', 'LastName', 'CreateDate', 'CountryCode', 'Language', 'Status', 'DateOfBirth', 'Contact', 'CustomerGroup']]
# Muestra los datos
print(formatted_df.to_string(index=False))














