clear all;
%% Path setting
file_path = 'D:\文件\学习\毕业论文_CT图像中的血管分割\3Dircadb1\3Dircadb1.';
%save_path = 'D:\文件\学习\毕业论文_CT图像中的血管分割\3Dircadb1\3Dircadb1.';
save_path = 'D:\文件\学习\毕业论文_CT图像中的血管分割\代码\unet-pytorch-main\Medical_Datasets\Labels\';

%% Mixing png
for num = 3:3
    file_path1 = [file_path, num2str(num), '\PNG\portalvein_png\'];
    file_path2 = [file_path, num2str(num), '\PNG\venoussystem_png\'];
    %save_path1 = [save_path, num2str(num), '\PNG\mix_Vascular\'];
    if ~exist(save_path,'dir')
        mkdir(save_path)
    end
    imgdir = dir(file_path1);
    
    %% For each png in one file
    for i = 3:length(imgdir)
        img1 = imread([file_path1, imgdir(i).name]);
        img2 = imread([file_path2, imgdir(i).name]);
        img3 = img1 + img2;
%       Normalisation
        for a = 1 : 512
            for b = 1 : 512
                if img3(a,b) == 255
                    img3(a,b) = 1;
                end
            end
        end
        img_name=[save_path,imgdir(i).name, '.', 'png'];
        imwrite(img3, [save_path, '1.', num2str(num), imgdir(i).name], 'png');
    end
end
disp('Finished mixing .png image');