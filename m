Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A33ECE57A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LySorHG/4eMI8O7tDUmsEeenTPeXn9RFtOtjlLHhUtU=; b=UnHFW4gO42Qng4
	yWPhQ1NULwR0oKCeWfFvKGDIPNZ5FJDsuFecdVg8J+ntZD71nL0reL1SLaOSyrslVW6JaEjFK2/c4
	T1FskQrf5B2VeWz7lgXXPrC78dMNwl172pdF+VMuh/gXWf/fVW2qaVJIl4Pvo70YnCMUCbDWHO/p/
	yT88Y3BbewYff/G59MTBzb9Ouh01pIPl5mTK4kCMDghvpTn8ccNpk3ip5Vk5Oo9yzube8L8uj4rC8
	o8reGQ/H8gMGxyG2MkUO/kyuDpdRlraCFflZ4A8MlCC/bm8O9lZDQXqGjC1jDWr4Zk7nELbuTlWGW
	ZfdT1+X0vR1zUA2Emr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneEK-000000021IE-0oPO;
	Mon, 09 Sep 2024 13:14:56 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneEG-000000021HR-3SzV;
	Mon, 09 Sep 2024 13:14:54 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-71798a15ce5so2650824b3a.0;
        Mon, 09 Sep 2024 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725887692; x=1726492492; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Cd5fhD8ici5afX6+xiG5utNAqtTvz1M5Dqy2BN2P8=;
        b=IInlvcdrbzEeLU+TxWVePQfiawa7r1grXkI0QSMJ37AUAwJDXAiZRmbjooZanlCSVK
         fgHkEh3+hOfDUIBge9x9LT1jfMOGQBzlVwaSHYlj7wCgWUt/lO1eS6lPFGMeYrzfXDKf
         9Ae16lAc82e+9ZgIvoyygzWcjYsfc47sOXu++H7v4YXAancKgrDX/m8YzZZzqhFjts/2
         k+yVRqosEUqKZAfNvejF3+lHE+VCmN/s91pvVo2nVSruSDTDUS6o+AogwSECWt1pcu+5
         7tfX5p0iQi/hGHX2vNUuoDVV73fX/kRJZSd601ED729djOk5nLV+5I0PimJ4fIqg6pul
         f5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887692; x=1726492492;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Cd5fhD8ici5afX6+xiG5utNAqtTvz1M5Dqy2BN2P8=;
        b=tHTop5hXn/mTuShZ5Caw5dIto//vnKoi8oPfPnN8iAmIFSgwpYwAOzYOuMoIGxvz7a
         UsuX3zGLpPQ61bO/DtuZRSNGDlPmvtzmhUpBAL51c6BBD1lQA6Tnwk3aDxpwIgiZif/y
         SJsS5dRlYcNF1IZemQ0AoruNB1kXwK6906Un8tQENU/ji6byrlT7HH7PuN7vVJRufC7f
         jTdtdSvfpS8YtI2qooNemgwWIFkf/tSk0vNA9SkOZtweUHmsURM1bUOQhxWAEQqGwkE7
         x1e/EQHp17K98TNM26QkbADIeIdIfa4Yz9c25IvFmPrjgx7nmZhlqnHBM64/FDxGYsm8
         vrGg==
X-Forwarded-Encrypted: i=1; AJvYcCVa2Z2WU/NQm2clxjdxKTxY9Irryt07ieK3iMrO50QD/Ha1mAysWEaMQpnKcezjFT+UZuohtqei9SNMR+/2Iyro6w==@lists.infradead.org, AJvYcCW1aNGuu5wNueiBnhiDF14bL5hy8TNJXbOVjGEkLiBXd5kQst8oC1etanjAQYIxe6wdlnp/TU2f8q8zg/V7i9AS@lists.infradead.org, AJvYcCWTclSWlH5zgLfbWP74wLTJ1/hcpbm27ZTvosVOQgtWFpVgEL/myEojcurg/ex9yEjac/k/Fv16eurHHY8=@lists.infradead.org
X-Gm-Message-State: AOJu0YydEOHEgguFKSXEn/tpw/F10ZIokvg2Q/0PiTAEaZV92Ys4piJY
	OMDJN2M48qv7lgMIzt3fSjoU5Pb/7JG6CTD0N11UHFfzjWHqWer/
X-Google-Smtp-Source: AGHT+IGnhYZgwGNXFcQ7s7STKWrNIO2hqlAK0VnpZ8PE0GryIBXkZ1t9udpbTlWICo5af882CgWSiQ==
X-Received: by 2002:a05:6a00:6f0e:b0:712:7512:add9 with SMTP id d2e1a72fcca58-718d560bb37mr13347863b3a.13.1725887691912;
        Mon, 09 Sep 2024 06:14:51 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5897d43sm3496400b3a.28.2024.09.09.06.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:14:51 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <e8f204ee-55d9-4a65-9fc0-582e361183ae@gmail.com>
Date: Mon, 9 Sep 2024 21:14:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Content-Language: en-GB-large
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
 <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
 <20240909-arguable-detection-02445bd1cc89@wendy>
In-Reply-To: <20240909-arguable-detection-02445bd1cc89@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_061452_922628_3055E8F2 
X-CRM114-Status: GOOD (  18.78  )
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


On 2024-09-09 21:06, Conor Dooley wrote:
> On Mon, Sep 09, 2024 at 08:14:16PM +0800, Celeste Liu wrote:
>> On 2024-09-09 19:53, Conor Dooley wrote:
>>
>>> On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
>>>> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>>> introduced it because of Docker, but Docker has removed this requirement
>>>> since [1] (2023-04-19).
>>>>
>>>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>>>> needs an RT budget assigned, otherwise the processes in it will not be able to
>>>> get RT at all. The problem with RT group scheduling is that it requires the
>>>> budget assigned but there's no way we could assign a default budget, since the
>>>> values to assign are both upper and lower time limits, are absolute, and need to
>>>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>>>> with values that would work by default in the general case.[2]
>>>>
>>>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>>>> can only be enabled when all RT processes are in the root cgroup. But it will
>>>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>>>
>>>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>>>> support it.[3]
>>>>
>>>> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
>>>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>>>> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
>>>>
>>>> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>>
>>> I don't think this fixes tag is suitable, the commit you cite in
>>> moby/docker is a year younger than the one in the fixes tag, so it was
>>> correct at the time it was written. I think the fixes tag should just be
>>> removed, since that commit was not wrong. Or am I missing something?
>>
>> The Docker commit I cited introduce the fix, not the bug. So it should be later
>> than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
>> config from upstream.
>>
>> Timeline is:
>> 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
>> 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
>>               in fixes tag.
>> 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
>>               commit I cited.
> 
> Yes, this is the way I understood things to be. IOW, when Heinrich wrote
> ba6cfef057e1 ("riscv: enable Docker requirements in defconfig"), it was
> a requirement for docker. The requirement later being removed doesn't
> make his patch incorrect, which is why I don't think this is a fix.

Oh, you are right. I will send v3 later.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
