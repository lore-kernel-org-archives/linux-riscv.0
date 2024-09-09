Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C08ECE579
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3Srnfnv4TORi4VwwsY8k1w0grE8acK01wUTF0kW6O4=; b=amNK+ByJzeb2YQ
	DXWLoBC0z3zErIIeSbBE+yHudE3VrbtDDi2DMb5AI26f+PINTqiRGSvE90WWXYr1bK+yryrc+KRTD
	/iU+q2zTAMuTfe2P3a9MDwVhKt+4NRmYjt7iabt9ne7unEeTXxO2v1Meg9uWQ8foXSn217UyCHxss
	Ipf+380oY5EymTTTp2DZRFe9qrg2/NaQMNMmXwHWGFZ3Tmj5wytnnfgY0c6vsRa0aIp2e3xWz1sRf
	4Cg/Tkjo1/XPuTWaWhG9g4wmlA0lAfmOV4ko/xi6eqTETRlJHpSsGNqW3mgeyqVsVlKiEEA5gpZ5V
	OO7kFBRX9EEyWGfSxfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneGO-000000021mi-3tZg;
	Mon, 09 Sep 2024 13:17:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneEa-000000021JB-00zB
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 13:15:13 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DC67A3F5E4
	for <linux-riscv@lists.infradead.org>; Mon,  9 Sep 2024 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725887700;
	bh=u1n/O2W+LcrKETL5zYIpc+SVEc0AbjVbXS3O8zNwBEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=fTgJ8OMAaYniDjFVJpMJ8A/WDonbgPJcsCcNUeM6HJ87b+vlYpZjQsZD8AmTWgRn9
	 vSTuHrPH2j5L42nDFxpdfdDbJjHgHDBW7WjHyIe0omBK0+BLpYmCKcwGy8j3fcxgdE
	 572YqFsFj0ZqTunNldHi8WVKkcWFLueBvQGnHP5Cm0lARyfAnsK2jYQqeQf2Kohb2G
	 f3c04KiXnWQ2vXmD+toab0Kc8I8ENIsru7TsTtmaNNHLGplTD60lXUaA/O7evRcGA8
	 ULwzbRSgbfGSiunZMgGp6BLUSk8HQ36L5LIumFlrfIiwHkVtygTreXsvFXgBR+De6T
	 +b2ki3K92HNCQ==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cbcf60722so361995e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Sep 2024 06:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887700; x=1726492500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1n/O2W+LcrKETL5zYIpc+SVEc0AbjVbXS3O8zNwBEk=;
        b=EKE9yn5flH3kwVinQlNIPjupWzHDMm7866sfoYj8c/Lhsmfntsf48SZJtrCAmkNqSx
         9LZEL35u+QGTkLIOUWEwvJXefDI1C/VNCR2wSAULIvQIR/e4owiG1GLbsmaH/zRxcDq7
         sZnEftfhBJOYQYfKet08HzUrvZhqlnU79PXcyaYwE9Y+S8AghtZXr3xQLXKyVNlOT4mO
         fzFAQVZtdWqFda9IXP1tcGkh/jp5mv1Tu+rzzqF2Ls42vzBmoTMK/6/r1DtKsPTe1o1G
         kjI97HT8gKk51OIDyuTgsSu3Dn48q2Z+FzRnhAhleT6WD0IkCiPapb6hVoP3hJfh6tYC
         FkRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMMkP5Z3o3tNVisRoGOJVPiDmgsogqVrlNA18pOveOTtODI1wo3P/z3BRYy9GqATwECaHx7MhXgyelUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRnOeF38vk6Nr0uhT/yc18H9KY8dtmhraaUln+BW+f+JU5H0OP
	soHkL2TQIJpWEZl4gmB7gHT2xwG1HqE4GiDEMxwVF4bdYWT1d1IlDSbMwMKPCUBt+4ACqmkfIb/
	IHZ/gLf2yVxtTUYmf076x1k5tMMgqan9s54fT78n6gnxk63i791gfMjuD/9suiR35hIVDv/j5Gf
	IClj00Dg==
X-Received: by 2002:a05:600c:1d22:b0:42c:baf9:bee7 with SMTP id 5b1f17b1804b1-42cbaf9c20dmr9333965e9.12.1725887699781;
        Mon, 09 Sep 2024 06:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOh5t4UDivktvUt6K0PPRZ2R1nhw2jQHB3U8gDmn4MVIqBX9sh6eOQO6zR51vh8x/9pGonlw==
X-Received: by 2002:a05:600c:1d22:b0:42c:baf9:bee7 with SMTP id 5b1f17b1804b1-42cbaf9c20dmr9333485e9.12.1725887698729;
        Mon, 09 Sep 2024 06:14:58 -0700 (PDT)
Received: from [192.168.103.101] (dynamic-046-114-195-052.46.114.pool.telefonica.de. [46.114.195.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b7f1sm77309945e9.48.2024.09.09.06.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:14:58 -0700 (PDT)
Message-ID: <139cd6c2-45e7-46c9-ad17-4d617673fc80@canonical.com>
Date: Mon, 9 Sep 2024 15:14:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
To: Celeste Liu <coelacanthushex@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
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
 <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_061512_206084_FED41C34 
X-CRM114-Status: GOOD (  23.33  )
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

On 09.09.24 14:14, Celeste Liu wrote:
> On 2024-09-09 19:53, Conor Dooley wrote:
> 
>> On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
>>> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>> introduced it because of Docker, but Docker has removed this requirement
>>> since [1] (2023-04-19).
>>>
>>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>>> needs an RT budget assigned, otherwise the processes in it will not be able to
>>> get RT at all. The problem with RT group scheduling is that it requires the
>>> budget assigned but there's no way we could assign a default budget, since the
>>> values to assign are both upper and lower time limits, are absolute, and need to
>>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>>> with values that would work by default in the general case.[2]
>>>
>>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>>> can only be enabled when all RT processes are in the root cgroup. But it will
>>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>>
>>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>>> support it.[3]
>>>
>>> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
>>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>>> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
>>>
>>> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>
>> I don't think this fixes tag is suitable, the commit you cite in
>> moby/docker is a year younger than the one in the fixes tag, so it was
>> correct at the time it was written. I think the fixes tag should just be
>> removed, since that commit was not wrong. Or am I missing something?
> 
> The Docker commit I cited introduce the fix, not the bug. So it should be later
> than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
> config from upstream.
> 
> Timeline is:
> 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
> 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
>                in fixes tag.
> 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
>                commit I cited.
> 
> [1]: https://github.com/moby/moby/commit/fb85a99f5899df7475ba6b1ac4b2e1d32974eca2

I experience no problems running Docker without CONFIG_RT_GROUP_SCHED on 
Ubuntu 24.04.

The Docker patch is only for contrib/check-config.sh. Probably Docker at 
the time of my patch would have worked without CONFIG_RT_GROUP_SCHED, 
too. I have no issue with the Fixes: tag in this patch.

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> 
>>
>>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>>> ---
>>>   arch/riscv/configs/defconfig | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>>> index 12dc8c73a8ac..de85c3ab261e 100644
>>> --- a/arch/riscv/configs/defconfig
>>> +++ b/arch/riscv/configs/defconfig
>>> @@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
>>>   CONFIG_MEMCG=y
>>>   CONFIG_CGROUP_SCHED=y
>>>   CONFIG_CFS_BANDWIDTH=y
>>> -CONFIG_RT_GROUP_SCHED=y
>>>   CONFIG_CGROUP_PIDS=y
>>>   CONFIG_CGROUP_FREEZER=y
>>>   CONFIG_CGROUP_HUGETLB=y
>>>
>>> -- 
>>> 2.46.0
>>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
