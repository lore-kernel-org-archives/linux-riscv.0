Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011FFCD4F21
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s+lOfPyRxHWk2UTIW5qM+5Wg+7NI5sMHYX/E7IdnIM=; b=CArirXL0L43YpfudgOVrHZSYPE
	X3zABgiwIJZg/EeBB8LfIhLlviyR5W2mwBBpEw6SRW2EB2v179+kDn7i7zEb0ml64FoMl7XF9Kdkr
	Bqf1LRVd0gm1fTXeaWR39gsSWWO9A2aFHcMfkT4gL7wL9HDZQcrmmTCIqgJZm7H7T1zn4aKRpnGrX
	x0u/9AGB4Hu5ZyMLKt9Tq5nrlVe7uZoGkAx88q6TkfKyGulsgBU6NkxIw7ok91Psm6k+TEKsTs7cq
	MNeYSOdOVu2/KnW6s7Rm5NvykzAcCSq86C107GniCEN41ld0GRLiQ2uLFGwXZoIUdubFRKk+Tk826
	kmEbnzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEEX-0000000AiuV-0dKV;
	Sat, 16 May 2026 12:35:09 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEEU-0000000Aisr-0u7c
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 12:35:08 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-910f734b477so119198685a.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778934904; x=1779539704; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlYX20Tz7KrUA9/+ib940qbKVKDUFNbiWx/P6UgmXqc=;
        b=VOi32dpVnScJtGZvy/gz2t/rtZWofSguDJpSFOjfwy3SIu+Ie46pAIDls6hlf/zCU2
         fl7AMEbowUBB1nmPKhm7df/Lq+YWEDscsB2S8bAa/JPFYnQIfhZyUVPBIQt+e7innFcS
         x01k9gkOukiH6t6sPlOYBRlthGTEN5i45LIaXNPLmaWHtB3bKDM1YPlQI9JcTANX72W0
         Ea/aFZCjYlGgtUPzK2/EINbuYLjmD9RyLApZKRJQd6mqvY5Fe0BFeUdfWD3565f4xamM
         O2dnGOSLz8RTKkQYUe9I5TicDWfNXyv2pkmVf9KOdohNLrmAW0jorxylMcMKpLJhIl9L
         FQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934904; x=1779539704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlYX20Tz7KrUA9/+ib940qbKVKDUFNbiWx/P6UgmXqc=;
        b=Ws99UyTg8bDPkVTWWguGofKQg4j0laoFKkEPFewpH1p7Dlu035+DOhxMTPjFIoiPfE
         0AfBPGaPbR4PJ02Ds3c5qzVXsaozwtJvyujP0XksGxB8wQ9ApW8qCmGry/RLCfZ2QgJ8
         eBZe/8VvyYHrpIBQjm2FNP+rqCMC0rKzh6Z0NqRzzpfqNuqbCkgy9/A/T6i5bKEQyr9l
         eV+AfAseCgsIUM6B1yLRODvsh9Fu/S4Sl4xNP24dXU69mb2IRPCed0WtihqLYxa2j4Gs
         4+FJ6emqs9QqK6r6UqB3DRREwo91hhhMmVbgHc+cRh/7HnI/g/pe58Uny4obkOJT6FNh
         hEDA==
X-Forwarded-Encrypted: i=1; AFNElJ/Hk6sKv5uiMvPQOImJKsD8oEC1wxwza67C/hBuAxLk3iM/Wi6VJyzQXNmJvWsLlRsP/tpGORCYLEUURQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9AWHYAPNavDzxEnM3htTG/Gk0aeB05Q0V+6oVviZmWK9yo43G
	JJL/qN2ZmB0y51nVpn9WAQBiNlmpqeUkKSTc8Ztw/4BxvWVt+6lQmm4K3ZGccf3z8aE=
X-Gm-Gg: Acq92OE87aWus3HQeqKTfJgotHi6qTf72TEvLVMknP2h77JhLPWc+23fEe7dwTXqgQG
	z0iY8oKIo7XI8CopDdHCnWt/bd/PIkNQs6gWbtErYw4bomvPmuFgnHo1ITzu0gfkrBv7g5qjyCo
	7psDu/T6rhOopGuqgWpuWLFuEEU7Pi0O+JMSwaPXnDyA4zxtC468eI+hVPc1uNZbMMFGFwBy0Da
	cvRKR0cUOpNdnmATA7goW70puhbl8ZWRtRUnlLpKrthsLeybrT3YQ9kwOAIKLCyD5jJJmmGVasX
	BNli5tpFsHBrt9G1q33+9+YNUQhf6BwHvyNXKXBKdmix98zojny/kc/2jkFl6Ma7N+tidNuf1LY
	zgBFrt0xdMiCP/jZHj71hoPmu2F5UQp+h2nZ3l0zlotRkgAIv0CRKrJgyrKbcDBCIUjMGSIuhQh
	wuDLG+gLCNV3zT1vDVJYnx2oJ1huv972l/BtRuBuH16QgFAM3j1kOznnxWeAVJvRPuX916lBeag
	x6pSPV7tOfD4KI=
X-Received: by 2002:a05:620a:7087:b0:8ed:d906:a8ff with SMTP id af79cd13be357-911ce04464cmr1176183685a.14.1778934904152;
        Sat, 16 May 2026 05:35:04 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:9cf2:2d6b:fbf2:991c? ([2001:1970:3847:e000:9cf2:2d6b:fbf2:991c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf3776dsm895724585a.39.2026.05.16.05.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 05:35:03 -0700 (PDT)
Message-ID: <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
Date: Sat, 16 May 2026 08:35:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulfh@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <177889984452.2298656.1074391459031404894.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_053506_518051_8859D8A5 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: devicetree@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, Andre Heider <a.heider@gmail.com>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2026-05-15 22:57, Yixun Lan wrote:
> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
>> This series enables complete SD card support for the Spacemit K1-based
>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
>> high-performance SD card operation.
>>
>> Background
>>
>> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
>> currently lacks basic SD controller configuration, SDHCI driver
>> enhancements for voltage switching and tuning, and power management
>> infrastructure.
>>
>> [...]
> Hi Iker,
> I've picked patch 1-3, for [4/4] I think it should be merged after
> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/

Hi Yixun,

That makes sense. In response to your earlier feedback I had drafted a more
complete dts after another schematic comparison, but Iker and I discussed it
and opted to avoid changing scope too much. Andre's series includes the 
bits I
wanted to add and more, so that works out.

Thanks!

Trevor

>
> Applied, thanks!
>
> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>        https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1fc1d6a659d4260fb
> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>        https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d1e3ed9c73fd7f381
> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>        https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f26857a58bdf6a0042
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
