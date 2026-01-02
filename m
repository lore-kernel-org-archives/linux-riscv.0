Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4C6FA3744
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pr7vBLaYg20iEfVuL21U4V2L4a2S6qlaCV2/H1j145A=; b=pC/GnCzL+Buk7X
	7SYxWVvYIOsXHm12fLMTV6knes5CKxAYRxotallo79daQhM4T4DVRKze+von3Kqf1Luw6MXZ0h3fN
	Ws9xp5vWOxITJZ5ncznzb+78alSYlT4BMYkB5D5hlG2lmbOENxOQ7gjc1noKzCl9atboDje9TuWV4
	c1zqvc2eF5E5MYP6MQ8xe6zgnT0ZfqaiLggPLLRMQVn2IRytHkVCAX5y8h8MDPbbHIcRFcNtik43w
	4J2RpMx8n/0xcYwnmirA0jnv2xz7Af6IWF3CumdeB73Kt1NkOGkaGkQY7J/cQlIwH72Q6COrQ26kY
	8zHTjCfk213r/KUnEWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfE2-00000008IE5-3O7z;
	Fri, 02 Jan 2026 13:29:54 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfE0-00000008IDX-3IHq
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 13:29:54 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8c0f13e4424so1058904985a.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jan 2026 05:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767360591; x=1767965391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnJ6jwDgQJU9BTuZLL/HOYsIa/pNPxkZejWHZ4P59ag=;
        b=hdffDHSdoc9DOSV398Dj+7J0DzHO7VmczUyqFHGiEKt9banX7JeBSzOUXOZkvsrHTG
         tprVjnC38VwoPpV4zqSRL5rSckuaFZltye6rxoEE3+TgCTEc4//bz9NKdnhDd759Vd66
         5+XICeBZTi5vKpYAc9uAMeu8fKYyB3dKi8FEpWcPgoyD20db5wDeQkFtQyJGnW3SNt7j
         Q/ObsPYb9KUZ3/aHa83Ix5oiadtcfMX+v9boOPRvXRVC4ulUAS6roPrO3P8xx+wLxUVT
         v2n4AS/AtOJV7/9lf/CYIYPXCpLIz6LBQcY52y5cTEM9GBFXQ90JZ0aAnu7ypPkqGlqV
         MfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767360591; x=1767965391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnJ6jwDgQJU9BTuZLL/HOYsIa/pNPxkZejWHZ4P59ag=;
        b=b62w1YRWEyWPNLlJA0/udJzplSyPzE4h9xZ001oE+2iF2U8AE0TiqFCaF7WIEZHo//
         aL4j4uebiUj1BubMKsFNC+PDqlmBPs8OcPpgMmLdqilXu6nRvdd+qUPMoe8rPeFMUKcQ
         g+niaUEpEZxPjENOQ3cHHRoHzcnIf3bc0beWACgr6qiSCstAPH4LbLRNDWI9W0chnkN2
         K9yi4Qyq0806hrGhzdswoADHPUKscH2OHXJeBX01hDmHRmSILfqK79v4LLVWBk/wdFv2
         NlSKEhcdfKDLQ2s8ViyOS7ZWM68nsCbhNGmVm3qfhT1IijeJtGw2461/5arojzhy8CYH
         a3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoWQGwqNcemOieWe2PERdwcTTJ3dVtTYCUh8ejXAY0Co7S9SpO07FCu0t4WIGDa36XGqhwBI4jp0nWsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4HQRP/AlBBaI8nMeZXZWRqes8wnxHMS60ajushaSe3hfK2mxg
	0COvf6nxmM+lo0li+0Ou80NvYo9+MNxp8ccTcAymtbzzaZfJlyC3Fk2TSj1e/Zq6xVY=
X-Gm-Gg: AY/fxX5eWUGxx1W7Be1grCf6m3QG66apH+TvqjFD88rVmyRh/NOdR98JXis2i5ob9tk
	UdNgCSqIqHcQD4qSSeTYlILpjj2YS0X0Vx1DLxLQhnDt+lUces1sntsxeKXcbOtOzN/EU6j8Kdb
	6NxhrzN0iRK2rJLjXPkUJKaIvv5zDnE7RLtrUg3pkXIsnhyMMV3l7dgNOwkoB4GaKVFDdr9j/xk
	PYwfaL/+cvMgkZqOQyb2GKRVesC+gzA8iM0A6aXreEJkMFtJbnaI4tZXVb5Q7A5wkJKnf8xa+kl
	wx1EWoj6OZMsOM3YGvBvX7IMM7b7KkmTLSVyOCdcIWedks7btWj7Tok6EaZ83w3wPoVF1b/AqKy
	RxbgrjpufBKXtUD/3eJ/JcHbh6GbHEDfSf1M98xajkoUPZW6f4360d8KklQ3eQ7oL7z0B7qEU0D
	f0tjqP6kouVkuMCB8oXtW4W91z4nr9C5JA9u+63hyR3QlLu8A56/g=
X-Google-Smtp-Source: AGHT+IG1Ojp/3ZHOCk+pYw0wTrXWi5TRpNf/s4EXvBvr0lH6ldzNvpRwCYYQWryLM3d/lhoyvZPU1Q==
X-Received: by 2002:a05:620a:460c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c08fc0023fmr6594472585a.18.1767360590946;
        Fri, 02 Jan 2026 05:29:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973ef6bbsm3205417085a.43.2026.01.02.05.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 05:29:50 -0800 (PST)
Message-ID: <fa2d6ac9-a919-4ee6-a470-16f4727a631c@riscstar.com>
Date: Fri, 2 Jan 2026 07:29:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
To: Vinod Koul <vkoul@kernel.org>, neil.armstrong@linaro.org
Cc: dlan@gentoo.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, guodong@riscstar.com,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20251226173228.2020411-1-elder@riscstar.com>
 <176726567931.201416.8144273654305302884.b4-ty@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <176726567931.201416.8144273654305302884.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_052953_095206_A7BED96F 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On 1/1/26 5:07 AM, Vinod Koul wrote:
> 
> On Fri, 26 Dec 2025 11:32:27 -0600, Alex Elder wrote:
>> The SpacemiT PCIe PHY driver depends on the common clock framework.
>> Not specifying that led to a failure when doing a COMPILE_TEST build
>> for the SPARC architecture.
>>
>>
> 
> Applied, thanks!
> 
> [1/1] phy: Kconfig: spacemit: add COMMON_CLK dependency
>        commit: 8df20813eb01fe29b4507fd470d73675bda3e1dd
> 
> Best regards,

Thank you.  It looks like the same problem affects the s390
build as well.

  
https://lore.kernel.org/oe-kbuild-all/202601022046.OKfcBo0x-lkp@intel.com/

I have confirmed that this fix wasn't applied, and with this
fix applied the s390 build error no longer occurs.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
