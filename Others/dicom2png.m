clear all;
%% Path setting
file_path = 'D:\文件\学习\毕业论文_CT图像中的血管分割\3Dircadb1\3Dircadb1.';
save_path = 'D:\文件\学习\毕业论文_CT图像中的血管分割\3Dircadb1\3Dircadb1.';
imagetype = 'png';

%% Convert DICOM to image file
for num = 15:20
    file_path1 = [file_path, num2str(num), '\PATIENT_DICOM\'];
    save_path1 = [save_path, num2str(num), '\PNG\PATIENT_PNG\'];
    imgdir = dir(file_path1);
    if ~exist(save_path1,'dir')
        mkdir(save_path1)
    end
    for i = 3:length(imgdir)
        dcmfile = dicomread([file_path1,imgdir(i).name]);
        dcmImagei = uint8(255 * mat2gray(dcmfile)); %Convert to uint8 format
        img_name=[save_path1, '1.', num2str(num), imgdir(i).name, '.png'];
        imwrite(dcmImagei, img_name, imagetype);% Save Image to specified image type
    end
end
disp('Finished saving .png image');