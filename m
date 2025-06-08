Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7698C5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEKAp7AmlQMAcnFg0elgp/bB3BLrz7DtvtmMHAW8oQo=; b=Im6s8X6EUioVR+
	pMODhQwWMyVH73zsVbThZHgbfpMtzZ7E0zqgBB+hAV46wSRETEHSi/yB+QZwdI7kdZS9W3DToj3Co
	kumTAROSaDkaXOd7NEJbEt+Gz4qLg4NXppLJl6MBztjCtTf6bzd2nvlgsHVlbzp7qCkTEMVM3LWiY
	GH/KN+yF18lKPA17tKXVXdRF6HaV+/oOhBteLF2h/rm+dhkklQFHc/DRWQ9PohzMVPzqppmftY01S
	Cy8BSHK98lOz7NmuUI3Vkzu5LEC+xFWvneIyvV9bTw08Belcg/uHrI2FRDO26LieJTbELp4vuy9vk
	y6SoyXrXTbhpCbyXZzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOKo8-00000002rEX-0Z2p;
	Sun, 08 Jun 2025 18:31:48 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOKo5-00000002rEC-1wvm
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 18:31:46 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3ddd68aeb4fso16525665ab.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 11:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749407504; x=1750012304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24zGtCD8x/AJdGEoAWa7TRqA5YBvsNJyFXsZnM2EaR0=;
        b=M+m7J/AfNt1ItWcQjzw7P4HkZRTGpANyILUUynpGqLV9tqlTvOtDpMG/GCdstLJfpS
         lWZdMZT31aaVMngupbGsdvddzkfoos1Alf58vjoDBAMqpwoH2zNQfG8A44KAFUojNhF2
         38VNDtqp3PE7h/32tnxL4OLZEIA+JnVPvV+luRtrc/Hhxp4wO8JNazLPwqgB/cDGsaxe
         aCqZ3/E4srzCx6PrH4BxyjtCLPXRdS2yxMQEm5udeVRqfcenZdUVW3xLM38o+EEuZ5eA
         2HZIPhIAUatbwb0swsenQwDNzB1qBcMHfc9ztPf8njIJMikmiGX939z4mNWFcwkwQ+aY
         Ogrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749407504; x=1750012304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24zGtCD8x/AJdGEoAWa7TRqA5YBvsNJyFXsZnM2EaR0=;
        b=K+qd6HjkE4O0kgJv9rOGsUrj55qbbGE/RoicdKhMIOZKt0FIJ6oBgz1cUECVJr1FRO
         LWK1MEno0S08imrO04mSwtAHtI8qFAyv1Vzazdkaro82utqLMo2VUqZquGTi2xzHmuCJ
         j01Pmgi7JqdZ6AMwzVO2/bBze78y2sUBiL4B0Y56SZFxMQLZ7p/oJozzweXBPbaWMLFV
         M/sfKHOh4X9VwSe1mUa/Sb4nmsZdi2SgNelHDnbPuqVZ0ZGJKWJBtZTUs/pCoCPlf92K
         pGHP2EK7bVV4LYuY0qZwfokEReLH5cVGswR/1DmtLT80cvttLEGHbsVAj65TvhWEDIeU
         jRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDQNWnZ/vCA53tY8hZOhfip889HhTv7Ns8z4c2VVOTZeuj6U5clWhxwaWDRA6vPdBqlbqskCLjWe+GyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLPMlXtIWfofKoK7DKq/QpL9RR+6NtWJv558KR5oQ/17OCera6
	dMs1lZXw/URCacOFLXUiftU5PK8RgA52hFaMVy/dkwySIHwYtPbPL8//SXdwBt8Uhlo=
X-Gm-Gg: ASbGncvgqGXjI3GUkoJYgRxo5BqI8zHJOhdf5agVEt4SPx8vo8XzKji9OewN31/krMC
	CuRiYjgLAeCn5dywq3iGJzmixWuiPJ4XcSawcCrVr9xbIuXlvnsU7+gkhUBWMlhmTJ4pXAafbrY
	egOtVsqOVHSUVMhvVHeCiiVZ/3klsGQwprsQVJAROXCyVG06vCpEqUXu8x6DXBFD+y4OCfCH0Ne
	B/I7qcmSILwrk7CRCm03eAl2w17NWwXU/uTQs9mlk8HyN79UeSRMSSlr0IuQUsOaY1A1Bq4bC9Y
	v9CWCwFDGpz5CJcQhNMQ3cZQtfAAM5GJWDfjh7b0Lr8bbQS+uJNeuTqfbWtlvTkun/0XTIshqvT
	kjFupfHAx410bL6x4j3UFnkIXstRXL/pVnHf4jHFk2G+wGg==
X-Google-Smtp-Source: AGHT+IHDrPKM/l4kaKj4vhhXLjeN3UOvK1bTadtmquA7qsnpNcRbC6iJmOeILwKvipIIm0BRRT9VyA==
X-Received: by 2002:a05:6e02:b42:b0:3d9:6485:39f0 with SMTP id e9e14a558f8ab-3ddce494789mr102862195ab.9.1749407504321;
        Sun, 08 Jun 2025 11:31:44 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ddcf1559efsm14793165ab.17.2025.06.08.11.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 11:31:43 -0700 (PDT)
Message-ID: <ef696db8-20ca-4710-b642-8d22263d4ffe@riscstar.com>
Date: Sun, 8 Jun 2025 13:31:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
To: Haylen Chu <heylenay@4d2.org>, Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, inochiama@outlook.com,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guodong Xu <guodong@riscstar.com>
References: <20250607202759.4180579-1-elder@riscstar.com>
 <20250608002453-GYA108101@gentoo>
 <52c27139-20aa-4995-b3b5-290df13f1ec9@riscstar.com>
 <aEUVwvKHCu4hr6xs@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aEUVwvKHCu4hr6xs@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_113145_618191_9412CCBD 
X-CRM114-Status: GOOD (  40.96  )
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

On 6/7/25 11:46 PM, Haylen Chu wrote:
> On Sat, Jun 07, 2025 at 09:46:03PM -0500, Alex Elder wrote:

I respond below.  I'm leaving all the context for now.

>> On 6/7/25 7:24 PM, Yixun Lan wrote:
>>> Hi Alex,
>>>
>>> On 15:27 Sat 07 Jun     , Alex Elder wrote:
>>>> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
>>>> parent for numerous clocks.  Guodong Xu was recently testing DMA,
>>>               ~~~~~~~~~this is still vague, numerous isn't equal to critical
>>
>> I will give you a full explanation of what I observed, below.
>>
>>>> adding a reset property, and discovered that the needed reset was
>>>> not yet ready during initial probe.  It dropped its clock reference,
>>>> which dropped parent references, and along the way it dropped the sole
>>>> reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
>>>> disabled, which resulted in a non-functioning system.
>>>>
>>> So, I'm trying to understand the problem, and would like to evaluate if
>>> the "critical" flag is necessary..
>>>
>>> It occurs to me, the DMA driver should request and enable clock first,
>>> then request and issue a reset, it probably could be solved by proper
>>
>> No, that is not the issue.  The reset is never deasserted.
>>
>>> order? so what's the real problem here? is DMA or reset? dropped the
>>> clock? or does driver fail to request a reset before clock is ready?
>>
>> The problem is with the pll1_d8 clock.  That clock is enabled
>> successfully.  However the reset isn't ready, so the clock
>> gets disabled, and its parent (and other ancestors) also get
>> disabled while recovering from that.
>>
>> I'll give you a high-level summary, then will lay out a ton of
>> detail.
>>
>> In the DMA driver probe function, several initial things happen
>> and then, a clock is requested (enabled):
>>    <&syscon_apmu CLK_DMA>
>> That succeeds.
>>
>> Next, a reset is requested:
>>    <&syscon_apmu RESET_DMA>
>> But that fails, because the reset driver probe function hasn't
>> been called yet.  The request gets -EPROBE_DEFER as its result,
>> and the DMA driver starts unwinding everything so that it can
>> be probed again later.  Dropping the clock reference results
>> in parent clocks dropping references.  And because pll1_div8
>> initially had a reference count of 0 (despite being on),
>> dropping this single reference means it gets disabled.  Then
>> we're stuck.
>>
>>
>> Here is how the DMA clock is supplied (at boot time):
>>
>> pll1 -> pll1_d8 -> pll1_d8_307p2 -> pmua_aclk -> dma_clk
>>
>> pll1 and pll1_d8 are enabled by the boot loader, but at this
>> time the drivers for various hardware that require them aren't
>> "getting" and enabling them (yet).
>>
>> devm_clk_get_optional_enabled() causes clk_prepare_enable()
>> to be called on the target clock (pll1_d8).  That simply calls
>> clk_prepare() and clk_enable().  Let's focus on the latter.
>>      clk_enable(dma_clk)
>>        clk_core_enable_lock()
>>
>> So now the clock enable lock is held.  The target clock's
>> enable_count for pll1_d8 is 0.
>>
>>    clk_core_enable(dma_clk)
>>      clk_core_enable(parent = pmua_aclk)
>>      ...
>>      enable_count++ (on dma_clk)
>>
>> The parent gets enabled (I'm fairly certain pmua_clk's
>> enable_count is also 0).
>>
>>    clk_core_enable(pmua_aclk)
>>      clk_core_enable(parent = pll1_d8_307p2)
>>      ...
>>      enable_count++ (on pmua_clk)
>>
>> And so on.  When the clk_enable(dma_clk) completes, we have
>> these enable counts:
>>    dma_clk:		1
>>    pmua_clk:		1
>>    pll1_d8_307p2:	1
>>    pll1_d8:		1
>>    pll1:			1? (I don't recall)
>>
>> The -EPROBE_DEFER causes the  devm_clk_get_optional_enabled()
>> for dma_clk to get undone.  That means clk_disable_unprepare()
>> gets called on dma_clk.  Let's just focus on clk_disable().
>>
>>    clk_disable(dma_clk)
>>      clk_core_disable_lock(dma_clk)
>>        (takes clk_enable lock)
>>        clk_core_disable()
>>          --enable_count becomes 0 (on dma_clk)
>>          (disables dma_clk)
>>          clk_core_disable(core->parent = pmua_aclk)
>>
>>    clk_core_disable(pmua_aclk)
>>      --enable_count becomes 0 (on pmua_clk)
>>      (disables pmua_clk)
>>      clk_core_dissable(core->parent = pll1_d8_307p2)
>>
>>    clk_core_disable(pll1_d8_307p2)
>>      --enable_count becomes 0 (on pll1_d8_307p2)
>>      (disables pll1_d8_307p2)
>>      clk_core_dissable(core->parent = pll1_d8)
>>
>>    clk_core_disable(pll1_d8\)
>>      --enable_count becomes 0 (on pll1)
>>      (disables pll1_d8)
>>      BOOM
> 
> Yeah, I got the reason that pll1_d8 is disabled, but I don't still
> understand why it matters: pll1_d8 is a simple factor gate, though being
> parent of various peripheral clocks, it's okay to enable it again later
> if some peripherals decide to use it or one of its child, isn't it?

When it gets disabled, the system becomes non-functional.  What that
means is that everything stops, no more output, and even when I
enabled KDB it did not drop into KDB.  *Something* depends on it,
but there is no driver that properly enables the clock (yet).
This means--for now--it seems to be a critical clock.

> I could come up with several scenarios where disabling the clock really
> causes problems,
> 
> 1. Some essential SoC components are actually supplied by pll1_d8 or one
>     of its children, but isn't described in devicetree or the driver,
>     thus disabling pll1_d8 leads to an SoC hang. We should mark the

This is what I believe is happening.  So my fix marks the one clock
as critical in the driver.  I would not want to mark it critical
in DT.

>     precise clock that being essential as critcal, instead of setting
>     pll1_d8 as critical to work around the problem.

I provided the chain of clocks leading to the dma_clk.  Disabling
the dma_clk did not cause harm; disabling pmua_aclk did not cause
harm; disabling pll1_d8_307p2 did not cause harm.  Only when pll1_d8
was disabled did the machine become unusable.

> 2. There're bugs in our clock driver, thus it fails to bring pll1_d8
>     (or maybe also its children) back to a sound state. If so we should
>     fix the driver.

No, I found that pll1_d8 had an enable count of 1 after dma_clk
was enabled.  And then the set of disables that resulted from the
-EPROBE_DEFER discovered its enable count was zero, and therefore
disabled pll1_d8 (after dma_clk, pmua_aclk, and pll1_d8_307p2 were
disabled).  I do not suspect the clock *driver* is at fault.

> Unless you could confirm pll1_d8 (not its child) really supplies some
> essential SoC components, I don't think simply marking pll1_d8 as
> critical is the correct solution.

I did confirm this.  The child gets disabled before the parent in
clk_core_disable().

> And, I don't even know what "non-functioning system" behaves like. Could
> you please provide more information, like soC behaviours or dmesg when
> disabling pll1_d8 causes problems? Thanks.

Maybe you could, as an experiment, pretend <&syscon_apmu CLK_DMA>
is a clock for something and get it during probe, using
devm_clk_get_optional_enabled().  Then just return -EPROBE_DEFER
after that, and I think you'll reproduce the issue.  In fact,
you might hit the issue more quickly if you used CLK_PLL1_D8.

					-Alex

>> I hope this is clear.
>>
>> 					-Alex
> 
> Regards,
> Haylen Chu
> 
>>
>>>> Mark that clock critical so it doesn't get turned off in this case.
>>>> We might be able to turn this flag off someday, but for now it
>>>> resolves the problem Guodong encountered.
>>>>
>>>> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
>>>> be supplied for a CCU_FACTOR_GATE clock.
>>>>
>>>> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> Tested-by: Guodong Xu <guodong@riscstar.com>
>>>> ---
>>>>    drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>>>>    drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>>>>    2 files changed, 15 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>>>> index cdde37a052353..df65009a07bb1 100644
>>>> --- a/drivers/clk/spacemit/ccu-k1.c
>>>> +++ b/drivers/clk/spacemit/ccu-k1.c
>>>> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
>>>> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
>>>> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
>>>> +		CLK_IS_CRITICAL);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
>>>> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
>>>> index 51d19f5d6aacb..668c8139339e1 100644
>>>> --- a/drivers/clk/spacemit/ccu_mix.h
>>>> +++ b/drivers/clk/spacemit/ccu_mix.h
>>>> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>>>>    	}									\
>>>>    }
>>>> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>>>> +			       _mul, _flags)					\
>>>> +struct ccu_mix _name = {							\
>>>> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
>>>> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>>>> +	.common = {								\
>>>> +		.reg_ctrl	= _reg_ctrl,					\
>>>> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
>>>> +	}									\
>>>> +}
>>>> +
>>>>    #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>>>>    			       _mul)						\
>>>> -static struct ccu_mix _name = {							\
>>>> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
>>>> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>>>> -	.common = {								\
>>>> -		.reg_ctrl	= _reg_ctrl,					\
>>>> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
>>>> -	}									\
>>>> -}
>>>> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>>>> +			       _mul, 0)
>>>>    #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>>>>    			    _mask_gate, _flags)					\
>>>> -- 
>>>> 2.45.2
>>>>
>>>
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
