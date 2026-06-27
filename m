Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49646C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Awm/OiTReyQam65bYLrg5MhJDsZ/oEYiXlUTwf9F1U=; b=hkcFdNq6acAJ4/
	WXIwwuulavT7i0l2JGHPSUJZX4fmr+CKxtGYfGSDkaKoWEaFoIL+Jm7JmXR/lcWCrXcVp1YLYmacm
	90h777WckKGXHeE+vl4a/bQ3BeR70O9VtC0ch/9deNt0jFI0zwyaanV1v3tv1M6cemLwylGCeoygl
	bngnqQd0NY/fthMpLR5yVJ7ZeDih2UGfrUtk7JtT9lc0dyAeUWenuIiKrXytxGAST04f7dqo8gDl2
	vcRC7MHL9Aa49IL32eCn79JDfsY0TSjl49TaDZtiZq6j/6nLXg5TMw81s/xgHe2G0e3rs5ypK/aZO
	KkZhu0SAYGDbXEODI2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdOaV-0000000CIYS-2Q8F;
	Sat, 27 Jun 2026 08:40:31 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdOaS-0000000CIY6-1QUq
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 08:40:29 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-845c908143eso1127527b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jun 2026 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782549627; x=1783154427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qbhem3vAH/Z+X5nlRW00s0dAul+UODlOFziWrBe9No=;
        b=ZXS7oCuH/OsQ4gOslJ9Ir9JxvGb8WWzNw5IUqfzLJMqXgT/qlOe3F7WMk+8IsBeg1p
         m1HggGgQe1e7I4Q27XJhuypUBDjrK/XgzHE+oYFD46svuBruUAEG9AA4EjII+tf5iDlm
         eXEAU11X8ClxMz+3cYOci7ofzqc6nzm70smfHXD67fi667/WgCSWL7kMXF40UpipqNxS
         nq7aGYgDe2NUk24UOKgYnZmduT62R0uVvlbpkqJrrsDZ68udeJWzRUjqw+QxgNiIvq3M
         ADjY76zXw5PnytLmoLXUvx1D/Xg5aFCuGRxc0rWczekhqYVzDQCvGqYaa6Nw6SnGrB1x
         uH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782549627; x=1783154427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qbhem3vAH/Z+X5nlRW00s0dAul+UODlOFziWrBe9No=;
        b=HmFTFnWgoQ94YNpgK0MD1mesSYhJpobKShhTnCBa2Hb3+Je63fGyl03OxQQk1HBcM1
         RmBdYWElTLu51k337NFVNwP2rxVs0ZUbJv9/F+LJFeE9I7iPoSx0snZajnX5u0Wdoqqq
         gX8Pd8hsnThPM9j7Q2BcDZTEDLDqdjat3gcWMlS2oS74i53/sEId3HQkS+P68erxdoYD
         nh/azLIwGg/FZigp6AgnLNO2AC8iS2meu//7SwafXfn2HMF54k+oqqDerflfzFyDogt5
         mfCvWkNAQEynucbwrfg8a+2FqzK/DsxFSJMgH7Jv8Bz0gAuZWPj58qUu69a4zFemK15i
         NSXg==
X-Forwarded-Encrypted: i=1; AHgh+RqglLca/vb++gUE9dNWaRdfIye44BFLC6h55F8PXrcmBK2ZVJZ8drsgaMKY5yy7ryAVJxjjtRU2JPNsqg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0acWG5HGz22J3XVUsNnHYQyTKyKxVs/JrkfTTcTDX7VoHyl4T
	WT9zEiNScDerhksofyY73hbKuCqDoQFAwpjZRXd+svqIw21jfgWl2C6X
X-Gm-Gg: AfdE7cm6+XvF5LCDUZdPZIsbeZpLTA4ZL/fkF1qW3P7nsZvC6ghkAeZ2yTdyhbSK8bf
	xfeP0qHL1u4B4mv8e+Qb7Q3DIKfjbDxNZOK5/D29CPQ0mC97sOv2AqAUvtOnt7d8ud78rLRPUID
	nEyYHDrdniaGzMNY3DdzNXpTb/nz1v8B3AHIMON+rPy0rvuFLo7B7O/Rrs5NXtVrq6cvLRzlT3b
	D0CXucMIrIwAEQFt8djr96MIlQLYYeYVTQIT0gaq0OU/96TGcFsqoVNUutVDawoFUUjECZqovcr
	erUMbwnPaLQTwg19dBt+WPkvXFqx9DYY7Tau4tXbaUk+ZnBmZXeK34NCSXL87SRGApYVF07u8je
	4acoT+xttGQCZuAknzodzqSvnG3IuautQN6j7gNY2gCn4ZTOAAVT4sLqBfOHxZDWxoyDUbnuH+w
	d0dP2U+XWvaTkMRzyu9WS4uXdpdCuhlHE=
X-Received: by 2002:a05:6a00:1816:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-845b3a52c01mr10776106b3a.20.1782549626710;
        Sat, 27 Jun 2026 01:40:26 -0700 (PDT)
Received: from [192.168.50.100] ([106.38.154.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fedaefsm8928591b3a.23.2026.06.27.01.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 01:40:26 -0700 (PDT)
Message-ID: <10f2a6af-86d8-4f98-86b0-0f1de394f19c@gmail.com>
Date: Sat, 27 Jun 2026 16:40:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_014028_396000_00FDC5D6 
X-CRM114-Status: GOOD (  22.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/26/2026 4:10 PM, Shuwei Wu wrote:
> This series enables CPU DVFS for the SpacemiT K1 SoC using the generic
> cpufreq-dt driver.
> 
> K1 has two CPU clock clusters. The two clusters have separate CPU clocks,
> so they are represented as two cpufreq policies: policy0 for CPUs 0-3 and
> policy4 for CPUs 4-7.
> 
> The CPU voltage rail is shared between the clusters. To model this with two
> policies, the OPP entries describe voltage ranges instead of a single fixed
> voltage, so the shared regulator can keep the rail within a range acceptable
> for the active OPP constraints.
> 
> Tested on Banana Pi BPI-F3:
> 
> ~ # cat /sys/devices/system/cpu/online
> 0-7
> 
> ~ # ls /sys/devices/system/cpu/cpufreq/
> policy0  policy4
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_driver
> cpufreq-dt
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/affected_cpus
> 0 1 2 3
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy4/scaling_driver
> cpufreq-dt
> ~ # cat /sys/devices/system/cpu/cpufreq/policy4/affected_cpus
> 4 5 6 7
> 
> Both policies expose the same OPP frequencies:
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
> 614400 819000 1000000 1228800 1600000
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy4/scaling_available_frequencies
> 614400 819000 1000000 1228800 1600000
> 
> For each policy, scaling_setspeed was set to each supported OPP and the
> workload was pinned to one CPU covered by that policy with taskset.
> CPU0 was used for policy0, and CPU4 was used for policy4. The clock rates below
> are from /sys/kernel/debug/clk/clk_summary.
> 
> policy0 / CPU0:
> ----------------------------------------------------------
> Frequency    |  cpu_c0_core_clk  |  Real (s)  |  User (s)
> (kHz)        |  (Hz)             |            |
> -------------+-------------------+------------+-----------
> 1,600,000    |  1,600,000,000    |    1.81    |    1.80
> 1,228,800    |  1,228,800,000    |    2.37    |    2.37
> 1,000,000    |  1,000,000,000    |    2.89    |    2.89
>    819,000    |    819,200,000    |    3.56    |    3.55
>    614,400    |    614,400,000    |    4.71    |    4.71
> ----------------------------------------------------------
> 
> policy4 / CPU4:
> ----------------------------------------------------------
> Frequency    |  cpu_c1_core_clk  |  Real (s)  |  User (s)
> (kHz)        |  (Hz)             |            |
> -------------+-------------------+------------+-----------
> 1,600,000    |  1,600,000,000    |    1.81    |    1.80
> 1,228,800    |  1,228,800,000    |    2.36    |    2.36
> 1,000,000    |  1,000,000,000    |    2.89    |    2.89
>    819,000    |    819,200,000    |    3.55    |    3.55
>    614,400    |    614,400,000    |    4.71    |    4.70
> ----------------------------------------------------------
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

Hi Shuwei,

Thanks for your work.

I have tested this series on the OrangePi RV2 4GB board on top of
next-20260626, with Vincent's patch for OrangePi RV2 applied.

# uname -a
Linux orangepi-rv2 7.1.0-next-20260626-00005-g66ef697be46d #1 SMP PREEMPT Sat Jun 27 14:53:02 CST 2026 riscv64 GNU/Linux

# ls /sys/devices/system/cpu/cpufreq/
boost    policy0  policy4

# cat /sys/devices/system/cpu/cpufreq/policy*/scaling_driver
cpufreq-dt
cpufreq-dt

# cat /sys/devices/system/cpu/cpufreq/policy0/affected_cpus
0 1 2 3

# cat /sys/devices/system/cpu/cpufreq/policy4/affected_cpus
4 5 6 7

# cat /sys/devices/system/cpu/cpufreq/policy*/scaling_available_frequencies
614400 819000 1000000 1228800 1600000
614400 819000 1000000 1228800 1600000

I used the following test script to verify cpufreq functionality:

```bash
#!/bin/sh

echo userspace > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo userspace > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor

echo "--- same frequency test ---"
for freq in 614400 819000 1000000 1228800 1600000; do
     echo $freq > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
     echo $freq > /sys/devices/system/cpu/cpufreq/policy4/scaling_setspeed
     sleep 1
     t=$(taskset -c 0 time -f "%e" dd if=/dev/zero of=/dev/null bs=1M count=1000 2>&1 | tail -1)
     echo "$freq kHz: ${t}s"
done

echo "--- mixed frequency test ---"
echo 614400 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
echo 1600000 > /sys/devices/system/cpu/cpufreq/policy4/scaling_setspeed
sleep 1
t0=$(taskset -c 0 time -f "%e" dd if=/dev/zero of=/dev/null bs=1M count=1000 2>&1 | tail -1)
t4=$(taskset -c 4 time -f "%e" dd if=/dev/zero of=/dev/null bs=1M count=1000 2>&1 | tail -1)
echo "p0=614400 p4=1600000 -> cpu0=${t0}s cpu4=${t4}s"

echo 1600000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
echo 614400 > /sys/devices/system/cpu/cpufreq/policy4/scaling_setspeed
sleep 1
t0=$(taskset -c 0 time -f "%e" dd if=/dev/zero of=/dev/null bs=1M count=1000 2>&1 | tail -1)
t4=$(taskset -c 4 time -f "%e" dd if=/dev/zero of=/dev/null bs=1M count=1000 2>&1 | tail -1)
echo "p0=1600000 p4=614400 -> cpu0=${t0}s cpu4=${t4}s"

echo 1000000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
echo 1228800 > /sys/devices/system/cpu/cpufreq/policy4/scaling_setspeed
sleep 1
t0=$(taskset -c 0 time -f "%e" dd if=/dev/zero of=/dev/null bs=1M count=1000 2>&1 | tail -1)
t4=$(taskset -c 4 time -f "%e" dd if=/dev/zero of=/dev/null bs=1M count=1000 2>&1 | tail -1)
echo "p0=1000000 p4=1228800 -> cpu0=${t0}s cpu4=${t4}s"
```

Results:

# ./test_cpufreq_userspace.sh
--- same frequency test ---
614400 kHz: 0.90s
819000 kHz: 0.67s
1000000 kHz: 0.55s
1228800 kHz: 0.45s
1600000 kHz: 0.34s
--- mixed frequency test ---
p0=614400 p4=1600000 -> cpu0=0.90s cpu4=0.34s
p0=1600000 p4=614400 -> cpu0=0.34s cpu4=0.90s
p0=1000000 p4=1228800 -> cpu0=0.55s cpu4=0.45s


Tested-by: Gong Shuai <gsh517025@gmail.com> # OrangePi-RV2

Regards,
Shuai


> ---
> Changes in v4:
> - Represent K1 as two cpufreq-dt policies, one per CPU clock cluster
> - Use OPP voltage ranges for the shared CPU supply
> - Link to v3: https://lore.kernel.org/r/20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org
> 
> Changes in v3:
> - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology
> - Use one shared CPU OPP table and one cpufreq policy for all CPUs
> - Link to v2: https://lore.kernel.org/r/20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org
> 
> Changes in v2:
> - Move OPP tables to dedicated k1-opp.dtsi
> - Enable OPP only on BPI-F3 with cpu-supply present
> - Link to v1: https://lore.kernel.org/r/20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org
> 
> ---
> Shuwei Wu (2):
>        cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
>        riscv: dts: spacemit: Add cpu scaling for K1 SoC
> 
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>   arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>   arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>   drivers/cpufreq/cpufreq-dt-platdev.c            |   2 +
>   4 files changed, 149 insertions(+), 1 deletion(-)
> ---
> base-commit: 5164e95565d3fd508ca8a95351323f5716dfb695
> change-id: 20260307-shadow-deps-3582a78aa756
> prerequisite-patch-id: 154bd4f720ce5065d58b988de8f273207b44572e
> prerequisite-message-id: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
> prerequisite-patch-id: 5da3e75b18291a5540d4f66d7a0600fb8975ef62
> prerequisite-patch-id: bcf41917414ecef8cf743095d130f6004c32f6a5
> prerequisite-patch-id: cfe3800f8c791ec4c63e070af9628e88e0fc31b9
> prerequisite-message-id: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
> prerequisite-patch-id: 7c7fb9f87dba019ece4c97c45750349a7cd28f3a
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
