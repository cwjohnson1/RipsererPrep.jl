#this method converts to vector of tuples from DataFrame without removing classification column
function ripserer_convert(data_frame::DataFrame)
    
    df_x = unique(data_frame)
    df_y = transpose(Array(df_x))
    df_z = [tuple(df_y[:,c]...) for c in 1:size(df_y, 2)]
    
    return df_z
end

#same as above except it removes the class col by entering its corresponding index
function ripserer_convert(data_frame::DataFrame, column_index::Int64)
    
    df_w = select!(data_frame, Not(column_index))
    
    df_z = ripserer_convert(df_w)
    
    return df_z
end 

#this one doesn't work
function ripserer_convert(data_frame::DataFrame, column_index::AbstractString)
    
    df_w = select!(data_frame, Not(column_index))
    
    df_z = ripserer_convert(df_w)
    
    return df_z
end

#take in file handle
#Should I also make a scenario where the user enters a string giving the class col's name?

#converts from .csv file to vector of tuples and doesn't remove class col
#assumes the data has headers. 
function ripserer_convert(csv_file::AbstractString; header_status::Bool = true)
    
    df = CSV.File(csv_file, delim = ",", header = header_status) |> DataFrame
    
    df_z = ripserer_convert(df)
    
    return df_z
end

#same as above but removes class col
function ripserer_convert(csv_file::AbstractString, column_index::Int64; header_status::Bool = true)
    
    df = CSV.File(csv_file, delim = ",", header = header_status) |> DataFrame
    
    df_w = select!(df, Not(column_index))
    df_z = ripserer_convert(df_w)
    
    return df_z
end
