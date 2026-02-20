local LightingService = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
local BlurEffect = Instance.new("BlurEffect", LightingService)
local TitleLabel = Instance.new("TextLabel", ScreenGui)
local BackgroundFrame = Instance.new("Frame", ScreenGui)
local FrameGradient = Instance.new("UIGradient", BackgroundFrame)
local BarBackground = Instance.new("Frame", ScreenGui)
local ProgressBar = Instance.new("Frame", BarBackground)
local SkipButton = Instance.new("TextButton", ScreenGui)

local FadeInInfo = TweenInfo.new(1)
local LoadTween = TweenService:Create(ProgressBar, TweenInfo.new(5, Enum.EasingStyle.Linear),
    { Size = UDim2.new(1, 0, 1, 0) })

local function SetCornerRadius(TargetObject, Radius)
    local Corner = Instance.new("UICorner", TargetObject)
    Corner.CornerRadius = UDim.new(0, Radius)
end

local function CloseGui()
    local FadeOutInfo = TweenInfo.new(1)
    TweenService:Create(BlurEffect, FadeOutInfo, { Size = 0 }):Play()
    TweenService:Create(TitleLabel, FadeOutInfo, { TextTransparency = 1, TextStrokeTransparency = 1 }):Play()
    TweenService:Create(BackgroundFrame, FadeOutInfo, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(BarBackground, FadeOutInfo, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(ProgressBar, FadeOutInfo, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(SkipButton, FadeOutInfo, { BackgroundTransparency = 1, TextTransparency = 1 }):Play()
    task.delay(
        1,
        function()
            ScreenGui:Destroy()
            BlurEffect:Destroy()
        end
    )
end

ScreenGui.IgnoreGuiInset = true
BlurEffect.Size = 0
BackgroundFrame.Size = UDim2.new(1, 0, 1, 0)
BackgroundFrame.BackgroundTransparency = 1
BackgroundFrame.BackgroundColor3 = Color3.new(0, 0, 0)
BackgroundFrame.BorderSizePixel = 0
FrameGradient.Transparency =
    NumberSequence.new(
        {
            NumberSequenceKeypoint.new(0, 0.5),
            NumberSequenceKeypoint.new(0.5, 1),
            NumberSequenceKeypoint.new(1, 0.5)
        }
    )
FrameGradient.Rotation = 45
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "VEXAL SCRIPTS"
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.TextSize = 120
TitleLabel.Font = Enum.Font.LuckiestGuy
TitleLabel.TextTransparency = 1
TitleLabel.TextStrokeTransparency = 1
TitleLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
BarBackground.Size = UDim2.new(0, 400, 0, 15)
BarBackground.Position = UDim2.new(0.5, -200, 0.75, 0)
BarBackground.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
BarBackground.BackgroundTransparency = 1
BarBackground.BorderSizePixel = 0
SetCornerRadius(BarBackground, 8)
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.new(1, 1, 1)
ProgressBar.BackgroundTransparency = 1
ProgressBar.BorderSizePixel = 0
SetCornerRadius(ProgressBar, 8)
SkipButton.Size = UDim2.new(0, 120, 0, 40)
SkipButton.Position = UDim2.new(0.5, -60, 0.85, 0)
SkipButton.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
SkipButton.TextColor3 = Color3.new(1, 1, 1)
SkipButton.Text = "SKIP"
SkipButton.Font = Enum.Font.GothamBold
SkipButton.TextSize = 18
SkipButton.BackgroundTransparency = 1
SkipButton.TextTransparency = 1
SetCornerRadius(SkipButton, 10)
TweenService:Create(BlurEffect, FadeInInfo, { Size = 30 }):Play()
TweenService:Create(BackgroundFrame, FadeInInfo, { BackgroundTransparency = 0 }):Play()
TweenService:Create(TitleLabel, FadeInInfo, { TextTransparency = 0, TextStrokeTransparency = 0.5 }):Play()
TweenService:Create(BarBackground, FadeInInfo, { BackgroundTransparency = 0 }):Play()
TweenService:Create(ProgressBar, FadeInInfo, { BackgroundTransparency = 0 }):Play()
TweenService:Create(SkipButton, FadeInInfo, { BackgroundTransparency = 0.2, TextTransparency = 0 }):Play()
LoadTween:Play()
SkipButton.MouseButton1Click:Connect(CloseGui)
LoadTween.Completed:Connect(CloseGui)
