Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC3EEED628
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yt7yNFHvK+gliZPpF+kZ372vo6rDYxxllXLo+10Mym0=; b=WzX+svSYermNLT
	SJue9A/Nb6cxErW4qMy/flW2oZVDxXlQSyjC2+wgJMoqHOJ4V7fZnkbCqEVP831+LLXBieoM4Vqj/
	SpuHjcLjhugShM3Qngd+O5f0Q2XzfgFBaCpjN4biCpp8RkOsCA82ITrYFNe63iER6CCiEzoCjE0zK
	YYbfoA49YlcapK/9e5YgQHmFcE9PHTDrJCDvu+BvY0ApJd9m3u7YHHE6mlKDJlKXEj0aLeVYj2Sn7
	x0cfqkbf+TtuAxe43s9tTiS4UzTchjk6ccuIgSHcuwdR2cg9Knu3UOiE+iXIiachcAKyscvCQd4d+
	hQZVm0AagI3t+puy6xWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhIT-00000008RlF-2gxO;
	Fri, 02 Jan 2026 15:42:37 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhIQ-00000008Rkm-3ArG
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 15:42:36 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-88a35a00506so135098986d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jan 2026 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767368553; x=1767973353; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kRQ6lI0yURL+aAlnleRfH8zPOO8HWmEFC9LuCb81Lw=;
        b=Cf8pew0Nr0sQgmZCiW1pr7c55vtL45bOPvqdjay8zRmSkrWOeHGMtKL9AnG6prqQls
         CODOpy4C3jR0MgV12NuSWOhYLnOkowV9+gIbvOvROKfFuctcukeQZ4HlVPlBE/R16a+p
         4/xVu7Dm7Q5xDvjaZOtgJmyI0w/ai4D0IkgBFExMSx4XstGFzv4VYdnehY6ufDf6Mdod
         WcQh0641QF1JPQvqHmTk5TSu1a1UthoH7O4fr7AxN8iAaiKmLazGzl8bFugvL4NdWhXa
         UQtzP4Ecek3buUvpjvptb0YCyA9a2tQJF6f0P5IYosvE20TsFyZRuUvC8EqR3A0klJNr
         JNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767368553; x=1767973353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kRQ6lI0yURL+aAlnleRfH8zPOO8HWmEFC9LuCb81Lw=;
        b=CUZcjCEOTlG5tEtLfhP0UyL1/KgwrChj1ghKdV+9ggsXSdkDQeSb3Zyfzn/WM3Rr0U
         k1uj+AkMFygRPE23zTVqiG/mRn1yRZEYMZeTTT5xBrXc2nDJQqFLGXLF1O3YBrQemMCz
         gQFlfXXb61Z+MpQN0HAelsxxafkQo7ZLTbLpHnahpejZqAgBdHArYuQKCTjmAFIevTFC
         RmVfDJerVkKUjjIstU7izac6aZyzGKCj4nJesjcc65Mscx0YUEJQlYgehwXnp2YSWB4O
         Am6jw1pHtS9ZcF9v9Zi4o1nmr4ho8OlgwSroTdBqA3Drq2gQG32QnlE8j/49RMmgiEa3
         pqFw==
X-Forwarded-Encrypted: i=1; AJvYcCW0G0ubb1U20gNwxuYeyOnuF1SD9snxN9ExJSbAEpYf9pCG9OVPqthnAg0n86r/CXSiJzFNvVvGMxmp1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ88WSPskiX7er/u/aTmop0NaW6ZdBwS4DINK9tIeFlwVmZCLM
	FrjxGB91Za8seRc42gVOGMIM8icL2H1YUeaY2xzCHs8ss7ztluSk/1EnxWOUJHy7buk=
X-Gm-Gg: AY/fxX5sNlHwzTdtdVPctzxrUpuDYMkHqn+zYJAdo8Gs04GGrdu9K+VZO+Tj1u3JwKZ
	aaRjqx0aZpTn8m22SiaoGGR+EFLAZ0IZcDFFJqMrYKv4tcH89VF3b81figFs91qjYxexeaBsHB6
	tCOH5FDhHt1QzNPCCMbz1EHwp1lfWU/HcxGTQRwMzwMe4lkQvwQetI+BzuiHsc8INSwksxqDynz
	CVl6giSaxzPhfazRRdJ7b8t9GYjWcVS4zCPzuHJ3eXI+XmyzUQF/THGsDWeK5Svjqx+rpTvYz6T
	eoQnPgxiorzj0J70/d6jHi7dep2bR6vc2YO+yVzSmQCge3Uaa1misz6/KLPD77TEDamMzqTJisO
	xsNRwAFfv+2cI1GfVMRUvsDI8OyJsYkIPR3FuoXyNbN1gXko+Dhx+P6GG5dgf3VBXurl6p1iu+c
	u5cQRIJs5WL53wdq20pH1uJl2+zZfrEq4f8fEKs02QcY/4cYfMh7M=
X-Google-Smtp-Source: AGHT+IHarPGP+a/gi2jHTk/zZ1FUDX+GiXA1A9njg4s5U5Nap7W/VCsy/W+a7XWuBcfyTfBnYizIrQ==
X-Received: by 2002:a05:6214:246f:b0:88f:e332:c009 with SMTP id 6a1803df08f44-88fe332c1f5mr429892206d6.12.1767368553381;
        Fri, 02 Jan 2026 07:42:33 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeff4sm326161116d6.29.2026.01.02.07.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 07:42:33 -0800 (PST)
Message-ID: <cc1cb833-2c4a-4e20-a50d-109a4919e274@riscstar.com>
Date: Fri, 2 Jan 2026 09:42:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: spacemit: prepare common ccu header
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guodong Xu <guodong@riscstar.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
 <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
 <20260101143810-GYC2019108@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260101143810-GYC2019108@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_074234_820369_FD83F328 
X-CRM114-Status: GOOD (  45.19  )
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

On 1/1/26 8:38 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 18:50 Mon 29 Dec     , Alex Elder wrote:
>> On 12/26/25 12:55 AM, Yixun Lan wrote:
>>> In order to prepare adding clock driver for new SoC, extract common
>>> ccu header file, so it can be shared by all drivers.
>>
>> You are moving the definition of the SpacemiT CCU auxiliary
>> device structure, plus the to_spacemit_ccu_adev() function,
>> into a new header file.
> yes, and this is explaining the code which I consider not necessary,
> it's more obvious to read the code..
> 
>> The reason you're doing this is
>> because these two things are generic, but they're defined
>> in the K1 SoC-specific header file "k1-syscon.h".  So you
>> are creating a new header file for this purpose.
>>
> right
>> These are things you should explain here, to help orient
>> reviewers and will inform anyone in the future looking at
>> commit history.
> I thought I've explained the goal/motivation already with above
> commit message, maybe I can improve it, so how about:
> 
> In order to prepare adding clock driver for new K3 SoC, extract generic
> code to a separate common ccu header file, so they are not defined
> in K1 SoC-specific file, and then can be shared by all drivers.

This would be much better.  You don't need to explain every detail
of the code, but providing the motivation this way and explaining
it at a high level helps the reader a lot.

>>> Also introduce a reset name macro, so it can be both used in clock
>>> and reset subsystem, explicitly to make them match each other.
>>
>> This should go in a separate patch, and should change the
>> code to use the macro so it builds and continues to function
>> with the new change place.
>>
> yes, I could do this in a separate patch
> 
>> However I don't understand why you think it's necessary to
>> introduce the reset name macro.  Is it because you want to
>> incorporate an SoC identifier in the name?
>>
> I've explained here:
> https://lore.kernel.org/r/20251231020951-GYA2019108@gentoo.org
> 
> It's necessary to incorporate the SoC identifier which will help
> to differentiate K1 and K3 reset driver, otherwise there will be
> driver name collision, lead to reset driver probe failure while
> adding K3 SoC ..

I just had a talk with Guodong and he helped clear up a
misunderstanding I had about this.  I was thinking about
what happens at probe time, and that only the K1 or the
K3 CCU will get registered.

But he explained that the issue is that two *drivers* claim
to support the same "compatible" auxiliary device name, and
even if only the K1 CCU got registered, both reset drivers
are available in the kernel and you still need to specify
which reset driver you want use.

You are implementing both the K1 and K3 reset code in the
same module, which I think is why this is necessary.

>> Even if this is your reason, I still don't think you need
>> the macro.  I'll try to explain what I mean in the
>> next patch.
>>
> If you still have concerns, and we can't reach certain agreement,
> then I could drop this macro in next version, leave this optimization
> to future patches, I don't want main clock driver delayed by it.

No I no longer have concerns and I accept that you need to
encode the platform/SoC in the reset auxiliary device name.

> I personally tend to keep the macro, but probably the naming need some
> improvement..

What I'd prefer is to just name the resets directly, to encode the
platform ("k1" or "k3") where defined.  I.e.,

  static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.reset_name	= "mpmu-reset",
+	.reset_name	= "k1-mpmu-reset",
  	.hws		= k1_ccu_mpmu_hws,
  	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
  };

Does this lead to a problem somewhere else?  What does hiding
this convention behind the _K_RST() macro do that's better
than this?  Is it because you want the separate clock and
reset drivers to use the same convention?

I think it's a little more difficult to talk about this because
we're talking about changes that are implemented by two separate
patch series.

>> One more comment, below.
>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>>    include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
>>>    include/soc/spacemit/k1-syscon.h | 13 +++----------
>>>    2 files changed, 24 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
>>> new file mode 100644
>>> index 000000000000..84dcdecccc05
>>> --- /dev/null
>>> +++ b/include/soc/spacemit/ccu.h
>>> @@ -0,0 +1,21 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __SOC_SPACEMIT_CCU_H__
>>> +#define __SOC_SPACEMIT_CCU_H__
>>> +
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +/* Auxiliary device used to represent a CCU reset controller */
>>> +struct spacemit_ccu_adev {
>>> +	struct auxiliary_device adev;
>>> +	struct regmap *regmap;
>>> +};
>>> +
>>> +static inline struct spacemit_ccu_adev *
>>> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
>>> +{
>>> +	return container_of(adev, struct spacemit_ccu_adev, adev);
>>> +}
>>> +
>>> +#endif /* __SOC_SPACEMIT_CCU_H__ */
>>> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
>>> index 354751562c55..13efa7a30853 100644
>>> --- a/include/soc/spacemit/k1-syscon.h
>>> +++ b/include/soc/spacemit/k1-syscon.h
>>> @@ -5,17 +5,10 @@
>>>    #ifndef __SOC_K1_SYSCON_H__
>>>    #define __SOC_K1_SYSCON_H__
>>>    
>>> -/* Auxiliary device used to represent a CCU reset controller */
>>> -struct spacemit_ccu_adev {
>>> -	struct auxiliary_device adev;
>>> -	struct regmap *regmap;
>>> -};
>>> +#include "ccu.h"
>>>    
>>> -static inline struct spacemit_ccu_adev *
>>> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
>>> -{
>>> -	return container_of(adev, struct spacemit_ccu_adev, adev);
>>> -}
>>> +/* Reset name macro, should match in clock and reset */
>>> +#define _K_RST(_unit)			"k1-" #_unit "-reset"
>>
>> The generic-sounding _K_RST() encodes "k1" in the name,
>> and it shouldn't.  Also, why do you use the underscore
>> prefix?
>>
> want to make it slightly generic/short but still keep it local for K1 driver,
> and also avoid potential collision with other drivers in kernel code..
> 
> or do you have any sugestion for better naming?

First, I suggest you avoid even using such a macro.  But I
could be wrong about that too...

I would name it RESET_NAME(_unit) or something similar.  It's
only used by code and DTS files that are related to SpacemiT
platforms.

					-Alex

>> Anyway, I'll keep reading.
>>
>> 					-Alex
>>
>>>    
>>>    /* APBS register offset */
>>>    #define APBS_PLL1_SWCR1			0x100
>>>
>>
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
