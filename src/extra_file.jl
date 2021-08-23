function csv_to_df()
    print("Enter csv file path \n\n")
    file = readline()

    print("Is there a header? Enter either Y or N")
    header_status = readline()

    if header_status == "Y"
        df = CSV.File(file, delim = ",", header = true) |> DataFrame
    elseif header_status == "N"
        df = CSV.File(file, delim = ",", header = false) |> DataFrame
    else print("Invalid Input. Enter either Y or N \n\n")
    end

    print("Enter name of classification column \n\n")
    name = readline()

    df_w = select!(df, Not(name))

    df_x = unique(df_w)

    df_y = transpose(Array(df_x))

    df_z = [tuple(df_y[:,c]...) for c in 1:size(df_y, 2)]

    return df_z

end
