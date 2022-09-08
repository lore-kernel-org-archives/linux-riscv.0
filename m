Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2C9C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5Fd5teVvX0hqu6hWEAagCD00cDa1slfeYdQVJQVyM0=; b=YRTak5XuBJMojs5DGfCU9hSLvq
	ie3epxDJ7RN/nJyo61riJROomAEeFSC8uu0c+FJDjKDolzkdBVhzGy8V8uw9MWQ7oPwkL7CQL+Y7y
	Ve9wp2y1fCfE/izo4Iv0bUq8jMmX3ahz1kGYI/HAfkfDFJuUg+CNks9GO123YOnbqqe1maBWWUQbK
	1fmpRA9TiztaQPkzGeVb91u2iKb3V3UxJ9pHF++xxZRGYVz09kG5gV60eJVpW/XzRjDQxEbvI71VJ
	b2qZAoW5uIy0EcvvjQ0sjxiqWzhWCqlr07Z4NPOPdU08ju6ZvZdKFks7frdICtFpYVL50dOJKFjL3
	A1d53Clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJ57-005215-DW; Thu, 08 Sep 2022 15:04:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIs6-004uxg-5k
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:51:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id bj14so13240643wrb.12
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ha0C+bSRVrCJnfze+oX7CrRnjc5k1OyYXKTo3Jn7s8c=;
        b=b6OSmTFRch9kSSTz+Ta0LqaQz5NZSX9z6NLPWHgft6m8cIo2tiqNk165erPHJGcDao
         lTMXKeGOJee77p4IwEQOLjWVzyAk/SVWvF0rBWvJNOEoYLh2KbANQhRVLrYnWMoP8OEs
         QKPnonzkpYwxCrDr8iyWIpnkYmm/s8MADVWQJ6GC1LP2JfArmkbWhMdYgPekAdSaThgn
         5KrElKBmhvACNt2aiv5VpDlmmtuiJZ3erkC7G/aG837/YMkpw61ghpvHLqZw8Sur0MrZ
         p7PsQzbW9hYOW8wwZ7/KQd4R9GeKHSUveJq/JISF6YgN3A/BWHkd7zQM14YJzTBdW854
         RykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ha0C+bSRVrCJnfze+oX7CrRnjc5k1OyYXKTo3Jn7s8c=;
        b=a86e3UjIDkV8XjWNzYn3H1F241GTV6rfnug1nJ5ckdtJd30nOs5FAlSr1KKoSyrJTP
         mfhsVS5qOtJHSW/+DqJZFMHnIF0NsqifhvvNWBKF5Tu6GyVbrdKX/R7O1nz9US8ZEX2M
         pTPxgqEcfMs4zv3aoXiFJPphbQByp5/6RvgE+lji/XLga7Wq5BXIXBfQz6t2DFuMML8F
         RG9Kj/0rQsxdQZ5QGAjRjhHO7jpEMrFt3iiXx9L7zlrR2wC311Ou583shf/Z5FED/Et0
         55LTl2qPHLvez2qOpmrDG00rbD+wpLhgDrkCBqXW236n4PxrFhX1TqLuoLio7urirunx
         d9AQ==
X-Gm-Message-State: ACgBeo3JVaW75R5H+zFsOStDPcU5yz8o/nfM3/QbQCTeCZLp3NlYUUDu
	unPnAGpXF+QRZB07hTdF3Ul1eQ==
X-Google-Smtp-Source: AA6agR5Hlu9JtsEx8ytH4x1f+4vTBU61IDC9bWPKmQGyMYnAms22L0KdfVkzm0vQtOGJvd+kl9A6mg==
X-Received: by 2002:adf:db85:0:b0:225:2d24:9455 with SMTP id u5-20020adfdb85000000b002252d249455mr5579454wri.711.1662648670996;
        Thu, 08 Sep 2022 07:51:10 -0700 (PDT)
Received: from [10.35.4.106] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id a10-20020a05600c348a00b003a31ca9dfb6sm3485742wmq.32.2022.09.08.07.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:51:10 -0700 (PDT)
Message-ID: <e56b67a3-4721-638b-a3d6-54e4d407598d@sifive.com>
Date: Thu, 8 Sep 2022 15:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 0/6] Use composable cache instead of L2 cache
Content-Language: en-GB
To: Zong Li <zong.li@sifive.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, greentime.hu@sifive.com,
 conor.dooley@microchip.com, bp@alien8.de, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220908144424.4232-1-zong.li@sifive.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <20220908144424.4232-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_075114_277584_E61C0394 
X-CRM114-Status: GOOD (  16.72  )
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

On 08/09/2022 15:44, Zong Li wrote:
> Since composable cache may be L3 cache if private L2 cache exists, we
> should use its original name "composable cache" to prevent confusion.
> 
> This patchset contains the modification which is related to ccache, such
> as DT binding and EDAC driver.
> 
> The DT binding is based on top of Conor's patch, it has got ready for
> merging, and it looks that it would be taken into the next few 6.0-rc
> version. If there is any change, the next version of this series will be
> posted as well.
> https://lore.kernel.org/linux-riscv/20220825180417.1259360-2-mail@conchuod.ie/

Is there a change log for the v2..v3 versions of this patch series?

> Ben Dooks (2):
>    soc: sifive: ccache: reduce printing on init
>    soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes
> 
> Zong Li (4):
>    dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
>    soc: sifive: ccache: rename SiFive L2 cache to Composable cache.
>    soc: sifive: ccache: determine the cache level from dts
>    soc: sifive: ccache: define the macro for the register shifts
> 
>   ...five-l2-cache.yaml => sifive,ccache0.yaml} |  28 ++-
>   drivers/edac/Kconfig                          |   2 +-
>   drivers/edac/sifive_edac.c                    |  12 +-
>   drivers/soc/sifive/Kconfig                    |   6 +-
>   drivers/soc/sifive/Makefile                   |   2 +-
>   .../{sifive_l2_cache.c => sifive_ccache.c}    | 200 ++++++++++--------
>   .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
>   7 files changed, 151 insertions(+), 115 deletions(-)
>   rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
>   rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (31%)
>   rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
