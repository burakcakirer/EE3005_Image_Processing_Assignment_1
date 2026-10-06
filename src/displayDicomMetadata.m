function displayDicomMetadata(info)
%DISPLAYDICOMMETADATA Print selected DICOM metadata fields when available.

fields = { ...
    'PatientName','PatientID','PatientBirthDate','PatientSex','PatientAge', ...
    'Modality','Manufacturer','ManufacturerModelName','StudyDate', ...
    'SeriesDescription','SliceThickness','RepetitionTime','EchoTime', ...
    'MagneticFieldStrength','FlipAngle','PhotometricInterpretation', ...
    'Rows','Columns','BitsAllocated','WindowCenter','WindowWidth'};

fprintf('\nSelected DICOM metadata:\n');
for k = 1:numel(fields)
    fieldName = fields{k};
    if isfield(info,fieldName)
        valueText = valueToText(info.(fieldName));
        fprintf('%-28s : %s\n', fieldName, valueText);
    end
end
end

function txt = valueToText(value)
% Convert common dicominfo field types to readable text.
if isstruct(value)
    names = fieldnames(value);
    parts = strings(1,numel(names));
    for n = 1:numel(names)
        v = value.(names{n});
        if isnumeric(v)
            v = mat2str(v);
        elseif isstring(v)
            v = char(v);
        end
        if ischar(v)
            parts(n) = string(v);
        else
            parts(n) = string(names{n});
        end
    end
    txt = char(strjoin(parts(parts ~= ""), ' '));
elseif isnumeric(value)
    txt = mat2str(value);
elseif isstring(value)
    txt = char(value);
elseif ischar(value)
    txt = value;
else
    txt = '<unhandled value type>';
end
end
