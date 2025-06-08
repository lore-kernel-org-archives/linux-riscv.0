Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7CCC5B543
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 02:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KU3Ti8HX4MeWGvGWB+UZLhDmMuyZBlgGoremrroP3vg=; b=kwVc8dKzuTXKap
	+O2LiTq0uUe3BQ0Od4CqJzZ21mfLLS6d+CZKXHcWfz1ChqIvCpy7KOC9qBAfO9QzqsjYI73veCkrH
	TiWIcPr9NC9TomFLt9IsrH3r1UvRiIMFSaQ/zWoe6bF+im6QXtJBo1nneUHC0OZlB1/WJLUXCTLUp
	CvuQSbQsPniWRoaXENn9gBiBuILBYE1DmsNK5Ev+OfXKUuict9Z6EVQ6oc1Jx0i51YlCSGRc7WA5B
	FZ9Brj4iP6OiElFltFVMqf1it1oGgh87qimuE7WPdMwflkXs2SJwPy9l9jaK09CaR/+dK7lJU8l/4
	ydYnNLf1s8DgZgjm7flA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO633-00000002IU8-3PAt;
	Sun, 08 Jun 2025 02:46:13 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO62w-00000002ITj-3KWm
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 02:46:12 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3ddc9872e69so10025605ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Jun 2025 19:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749350766; x=1749955566; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6iIhbceoQuwTeHmSeghxdQElE23Mh4WO7mr5HdlCAY=;
        b=v7ENi+pup8stMZWM0WQeo4lbR09bKOt+hiOHEvKcW9WKYZea38MaWefHu6hPYRFKdo
         F9r/zmuC/422L5w34uKh8WsV+zoJyKC11vn/5m0YA0Is+MtRHduBs1odmb4DX4QlDlz6
         daRHaWnjffktXlIZq737hw5GEMaFx9owSDTCqXblI7cGergKIGuXyq5utvgOkGxklmOp
         MFyf5U3knuaRFaGASguOlbjaX8vGqEV9tShuXqi3B306Lin96LzMb7ENjBa4rPhJ/67c
         uWVSZv5hcrHyYdz5CVewsWFO6IBB49Q867h4JlnppOl0ie+7hAQa23UdgBOeH2FFvA/R
         aAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749350766; x=1749955566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6iIhbceoQuwTeHmSeghxdQElE23Mh4WO7mr5HdlCAY=;
        b=sRusCCNN194C02IMP3TNeoqaeCZfppZiq9qZoWGFS/+fK2hjUee480bgplmUpzMb+X
         XIQVEiHwBX8Zv6gDg0X1jcGapMP0M2n8QENConXNyvFrKULKK5tegJWYwo2Z2BsldfQN
         MJnCdcl2VxKlanEgxJnO5kvrBWsdazNy3TvbCSWE/a1G7oIXXcTQVR2jHfJI85ecOQ57
         kfpfYO9/BXXIyfraj/8efOSA+Uq9PmiNSspXAienI6s0oXkugWcb+K9pXlO8Rx1Cv47R
         3DjRIA1mtbyrMeNbztBJA3Smle35p7CFHZalND/BvhysLNaBMGwOt56tkwvhksXwy7j7
         DmMg==
X-Forwarded-Encrypted: i=1; AJvYcCXgaUuum3PV8gRTJ7Q5AMaAVThXaNspyBvussXBIkhKuBv/3MSYup8R3Jot/TDGQBf67HSlGPi3GLxGkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyJqhAvp7Dg1w255ri2ynEBT/zqGQxb/fwS7UnoAyATmSsJdSz
	UpMYLt9RqMHUzESc7kwV0I0YGNi6WpQ2l94iduNapZ8JOMJS6qzQH0xuWKoszoanXOQ=
X-Gm-Gg: ASbGncsqKs7yUaKqoph6gzpyViWbcTMZRdAJyMOC9u5i+qqNGg0bLn1/R3mN0i4xKGC
	F7H+HEywuu/yQxGelCws7RCPNeftt+DtOE4r8U0+devQhALdxxSWSB5K9hmHwJlVKXZdY2YG5xw
	SSQ320jOaq36wXYiQUXUlfhaVX69yqJ6vS+aTQufu9UXAgWwH/2uF4O2GpEgfYD2AoFQuT8bJs1
	mRUAxRy/bQNJAE9han2lGUx4GEH3t0FKN7Y2yfLUuNt3ESaGxR3z7No5953NrDYwYsagKn5YWry
	omUvJ5EpK15VeK3OKEvosnz9AyK7UCltdefSggTjQind/8Adbfd+JfkWFJGN707hb/xRh/jV/xQ
	8I37oa//XOt8yzveGX26dqh2Qd4o6sA==
X-Google-Smtp-Source: AGHT+IHwCjCm36e79bC5Bu1U8XdSHZuI9qJZLbLDC5YMdrmL4eFKJnEgWTECu5fJD8WyGogJaem5yg==
X-Received: by 2002:a05:6e02:1c0f:b0:3dd:a13c:b663 with SMTP id e9e14a558f8ab-3ddce495e82mr79030935ab.14.1749350765662;
        Sat, 07 Jun 2025 19:46:05 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-500df420439sm1193111173.32.2025.06.07.19.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 19:46:05 -0700 (PDT)
Message-ID: <52c27139-20aa-4995-b3b5-290df13f1ec9@riscstar.com>
Date: Sat, 7 Jun 2025 21:46:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
To: Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heylenay@4d2.org,
 inochiama@outlook.com, linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guodong Xu <guodong@riscstar.com>
References: <20250607202759.4180579-1-elder@riscstar.com>
 <20250608002453-GYA108101@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250608002453-GYA108101@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_194607_084581_F71EA634 
X-CRM114-Status: GOOD (  26.31  )
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

On 6/7/25 7:24 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 15:27 Sat 07 Jun     , Alex Elder wrote:
>> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
>> parent for numerous clocks.  Guodong Xu was recently testing DMA,
>              ~~~~~~~~~this is still vague, numerous isn't equal to critical

I will give you a full explanation of what I observed, below.

>> adding a reset property, and discovered that the needed reset was
>> not yet ready during initial probe.  It dropped its clock reference,
>> which dropped parent references, and along the way it dropped the sole
>> reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
>> disabled, which resulted in a non-functioning system.
>>
> So, I'm trying to understand the problem, and would like to evaluate if
> the "critical" flag is necessary..
> 
> It occurs to me, the DMA driver should request and enable clock first,
> then request and issue a reset, it probably could be solved by proper

No, that is not the issue.  The reset is never deasserted.

> order? so what's the real problem here? is DMA or reset? dropped the
> clock? or does driver fail to request a reset before clock is ready?

The problem is with the pll1_d8 clock.  That clock is enabled
successfully.  However the reset isn't ready, so the clock
gets disabled, and its parent (and other ancestors) also get
disabled while recovering from that.

I'll give you a high-level summary, then will lay out a ton of
detail.

In the DMA driver probe function, several initial things happen
and then, a clock is requested (enabled):
   <&syscon_apmu CLK_DMA>
That succeeds.

Next, a reset is requested:
   <&syscon_apmu RESET_DMA>
But that fails, because the reset driver probe function hasn't
been called yet.  The request gets -EPROBE_DEFER as its result,
and the DMA driver starts unwinding everything so that it can
be probed again later.  Dropping the clock reference results
in parent clocks dropping references.  And because pll1_div8
initially had a reference count of 0 (despite being on),
dropping this single reference means it gets disabled.  Then
we're stuck.


Here is how the DMA clock is supplied (at boot time):

pll1 -> pll1_d8 -> pll1_d8_307p2 -> pmua_aclk -> dma_clk

pll1 and pll1_d8 are enabled by the boot loader, but at this
time the drivers for various hardware that require them aren't
"getting" and enabling them (yet).

devm_clk_get_optional_enabled() causes clk_prepare_enable()
to be called on the target clock (pll1_d8).  That simply calls
clk_prepare() and clk_enable().  Let's focus on the latter.
     clk_enable(dma_clk)
       clk_core_enable_lock()

So now the clock enable lock is held.  The target clock's
enable_count for pll1_d8 is 0.

   clk_core_enable(dma_clk)
     clk_core_enable(parent = pmua_aclk)
     ...
     enable_count++ (on dma_clk)

The parent gets enabled (I'm fairly certain pmua_clk's
enable_count is also 0).

   clk_core_enable(pmua_aclk)
     clk_core_enable(parent = pll1_d8_307p2)
     ...
     enable_count++ (on pmua_clk)

And so on.  When the clk_enable(dma_clk) completes, we have
these enable counts:
   dma_clk:		1
   pmua_clk:		1
   pll1_d8_307p2:	1
   pll1_d8:		1
   pll1:			1? (I don't recall)

The -EPROBE_DEFER causes the  devm_clk_get_optional_enabled()
for dma_clk to get undone.  That means clk_disable_unprepare()
gets called on dma_clk.  Let's just focus on clk_disable().

   clk_disable(dma_clk)
     clk_core_disable_lock(dma_clk)
       (takes clk_enable lock)
       clk_core_disable()
         --enable_count becomes 0 (on dma_clk)
         (disables dma_clk)
         clk_core_disable(core->parent = pmua_aclk)

   clk_core_disable(pmua_aclk)
     --enable_count becomes 0 (on pmua_clk)
     (disables pmua_clk)
     clk_core_dissable(core->parent = pll1_d8_307p2)

   clk_core_disable(pll1_d8_307p2)
     --enable_count becomes 0 (on pll1_d8_307p2)
     (disables pll1_d8_307p2)
     clk_core_dissable(core->parent = pll1_d8)

   clk_core_disable(pll1_d8\)
     --enable_count becomes 0 (on pll1)
     (disables pll1_d8)
     BOOM

I hope this is clear.

					-Alex


>> Mark that clock critical so it doesn't get turned off in this case.
>> We might be able to turn this flag off someday, but for now it
>> resolves the problem Guodong encountered.
>>
>> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
>> be supplied for a CCU_FACTOR_GATE clock.
>>
>> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Tested-by: Guodong Xu <guodong@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>>   drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>>   2 files changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index cdde37a052353..df65009a07bb1 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>>   CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
>> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
>> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
>> +		CLK_IS_CRITICAL);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
>> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
>> index 51d19f5d6aacb..668c8139339e1 100644
>> --- a/drivers/clk/spacemit/ccu_mix.h
>> +++ b/drivers/clk/spacemit/ccu_mix.h
>> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>>   	}									\
>>   }
>>   
>> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>> +			       _mul, _flags)					\
>> +struct ccu_mix _name = {							\
>> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
>> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>> +	.common = {								\
>> +		.reg_ctrl	= _reg_ctrl,					\
>> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
>> +	}									\
>> +}
>> +
>>   #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>>   			       _mul)						\
>> -static struct ccu_mix _name = {							\
>> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
>> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>> -	.common = {								\
>> -		.reg_ctrl	= _reg_ctrl,					\
>> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
>> -	}									\
>> -}
>> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>> +			       _mul, 0)
>>   
>>   #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>>   			    _mask_gate, _flags)					\
>> -- 
>> 2.45.2
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
