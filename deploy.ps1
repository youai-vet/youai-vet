# 定远友爱动物医院 - 一键部署脚本
# 用法：在项目目录下运行 .\deploy.ps1

Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "Push failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Triggering Netlify deploy..." -ForegroundColor Cyan
Invoke-RestMethod -Uri "https://api.netlify.com/build_hooks/6a70543ed8056bf1f9659fad" -Method Post

Write-Host "Deploy triggered! Check status at https://app.netlify.com/sites/candid-taiyaki-7fd538" -ForegroundColor Green
