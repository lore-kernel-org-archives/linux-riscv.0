Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D071EECE57A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHIBILsFw5wxuTG13RNL7Ne03MySb1qzT8QaloDv2eA=; b=mLHOyoJ5oSkMeg
	Z2FFQFe/GDgycqRKVG3ZdWLpSOdQSgLsoDmjt3iLjzymvnuV70/MAce98KmOh6BGNTOCRJiyZX9q8
	Kkwg0SYM5WMo0vERu2i+mgFg8eNEBii0QJzokQOKxfBGXDF89GW2IGCXcknGLZJW2SuQbsvCEVQd5
	Jx8dx9RIWrrgI2qlNz+JBNED+UYGQsKdrYxcfjDCQg5Rx/+in3oWuNDsxwEiQdwfklA+46siuBzaG
	4jLicge5zN7yYocS/3qEQKXWPxPB8Nl4q5A2dUuLhvbxpfU6zGVq1ry7kPV/KEnmht02Is+4je18F
	qS7GG7jhMujRQ3AfMKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndK5-00000001oKH-01Aa;
	Mon, 09 Sep 2024 12:16:49 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndJe-00000001oE7-3env;
	Mon, 09 Sep 2024 12:16:24 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7179069d029so2933199b3a.2;
        Mon, 09 Sep 2024 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725884181; x=1726488981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPJ7uHySGWvGCBzUZkM0XzRLu8h7eCfH2Esu33AGR14=;
        b=Qxu5BlMIX0VcCSqJ8Ye8AOv1Fd7Iu5HXnvqDKgVPNcc9QRDFlRXe3m6QC/cLJKiLB+
         VW2yDYvUugNvHGWG0cwgyNCnRjCSF7iFyg7j9knm696msMChB9c1653UTiTAk86SxGOS
         SBxw+DyHaE/bRVrjxwQmvMG0xKZVMxC5/10j/GD/xMZv7DyaGDfurc5rSQKU1NdpuvNQ
         3KB94CjWRJaqW0SBTGzq6juvH6TRWWsyG3oSozLHlTesx+sugyOIOAaEl8e2yuj2tv0C
         FyfBIXKyW1GZPVvmztnaX1ttzmXA4Og2TT7jx60gooO2H5HaMX92nUsQ2f5lyYPSM9nM
         ZWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725884181; x=1726488981;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPJ7uHySGWvGCBzUZkM0XzRLu8h7eCfH2Esu33AGR14=;
        b=ov9rDbifNHk6+SwDlYkEOyUCBvd43kggzG+aAxlGRmtEWagO21re2ZGQSQv40XdSRf
         7KsPPjDWCEKt91fBV2TFDGTxcuOR4d8i0ygFCpPblQAmY4yOvKx/siEbROhRJePwPTHD
         huGxpn3FgOz84exnsr0ybktldEovRQM3enZeLFsOSMYuXtC4v0bKPfS02BFXx+ZTBhdz
         pHRu5I+Zd+ydUQ3HrexrADYWsmh9ho94M+JQrnud7ZToIgb39DuMIEM5cQ/6HTMLFon2
         OdeMg8Vl1QeOvbeZ3G4mJPhU6N/W9S8JKe0VbSb+JzE5ZEesiz8ottlRvMmcoeoZjFxl
         bfyw==
X-Forwarded-Encrypted: i=1; AJvYcCXDNYTaZh6scKa6sc6OX3HLBA420hdquaO2Ejpx6oS7MBqVnbZW/tZfYUfh5dQ8vUDjuuoxWpYryK33gy4=@lists.infradead.org, AJvYcCXHmgjeNTJwvc+MhNfyIN6Igf3fzYojzXncCaGvhHM4baQ1wDFdMRCKhtAQgAz1Mf8ejCzPsF0aChXPdciHDXsUNg==@lists.infradead.org, AJvYcCXxtxhAi1/UaxRKWW44UGeoe63dB2GC3HuQuFyGOaei8mn3H6vlWN/r+mVY03su28zy67Byz8ON3If6s67MxtW4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3NH8aVv9HnP08prh4sZ5T/XCWTBzAdI7psrTlFhLSQ0JoCRSQ
	dryzubx/g4FFHe+teRE2S1qMxKwNSWJA6EKDlJaOg/cC5+vOZaRFYyKndTtTSjT2fQ==
X-Google-Smtp-Source: AGHT+IHM6o7g7DPr5Llw8JRr5tP9jGrL5l9uJZb1UkPnnG81PEEIs9bo2qQPnTUWF40R2wiNKVBM8Q==
X-Received: by 2002:a05:6a00:4b16:b0:718:dd1e:de1a with SMTP id d2e1a72fcca58-718dd1edeb4mr8053950b3a.28.1725884181407;
        Mon, 09 Sep 2024 05:16:21 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e59687cbsm3397730b3a.115.2024.09.09.05.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:16:20 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
Date: Mon, 9 Sep 2024 20:14:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
 <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
 <20240909-gave-celtic-af2ea8bc38d5@wendy>
Content-Language: en-GB-large
In-Reply-To: <20240909-gave-celtic-af2ea8bc38d5@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_051622_951100_EA9C1F63 
X-CRM114-Status: GOOD (  22.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024-09-09 19:53, Conor Dooley wrote:

> On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
>> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>> introduced it because of Docker, but Docker has removed this requirement
>> since [1] (2023-04-19).
>>
>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>> needs an RT budget assigned, otherwise the processes in it will not be able to
>> get RT at all. The problem with RT group scheduling is that it requires the
>> budget assigned but there's no way we could assign a default budget, since the
>> values to assign are both upper and lower time limits, are absolute, and need to
>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>> with values that would work by default in the general case.[2]
>>
>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>> can only be enabled when all RT processes are in the root cgroup. But it will
>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>
>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>> support it.[3]
>>
>> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
>>
>> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> 
> I don't think this fixes tag is suitable, the commit you cite in
> moby/docker is a year younger than the one in the fixes tag, so it was
> correct at the time it was written. I think the fixes tag should just be
> removed, since that commit was not wrong. Or am I missing something?

The Docker commit I cited introduce the fix, not the bug. So it should be later
than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
config from upstream.

Timeline is:
1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
              in fixes tag.
3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
              commit I cited.

[1]: https://github.com/moby/moby/commit/fb85a99f5899df7475ba6b1ac4b2e1d32974eca2

> 
>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>> ---
>>  arch/riscv/configs/defconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 12dc8c73a8ac..de85c3ab261e 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
>>  CONFIG_MEMCG=y
>>  CONFIG_CGROUP_SCHED=y
>>  CONFIG_CFS_BANDWIDTH=y
>> -CONFIG_RT_GROUP_SCHED=y
>>  CONFIG_CGROUP_PIDS=y
>>  CONFIG_CGROUP_FREEZER=y
>>  CONFIG_CGROUP_HUGETLB=y
>>
>> -- 
>> 2.46.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
