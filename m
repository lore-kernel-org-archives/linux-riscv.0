Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A39CD1296
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTdWqQ+RNibCEeERrSTh6NHLZdTklWPM+e52BUoHirU=; b=vfKC8rm/k9qs64
	yh2ZzQctB5P435zDJhUnUMH5s9M0ZDUKFXO+BEyxSGHm2z1S9UCYg8WUcSAdwdaCLbkyekU1ngIwg
	eEvHcmedmjxI5RUSzG95wmoJVFtoUinzJ5BNchGY3LpESTNMAVyBUH5pAqB0eXtMNmzAGv82scGtM
	7Aug/ytayZv8g+10I/5cpdhHK0ymlxCfTaymaGVVT+nPcChsM59jfRcfjaqG5rFVcOM54PZ00UlH3
	NpfHfPDQY0Bl7QaCCG43wv8CgQVeV58kIxjPoTcPb3hCXJXCtbny/shr8zlU2UQa76c2atdJwAEM7
	w1/N+e2cTZgFwfSTksNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUcY-00000004KKA-1IJS;
	Thu, 04 Apr 2024 21:27:42 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUcV-00000004KIQ-3Gp3
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 21:27:41 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-368c13003eeso6744955ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 14:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712266056; x=1712870856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JivkPtYm65IsO1ddY4sRkpm5UlWEeBHwlfhWJ8irw1I=;
        b=hrrrW05FqMoTAuj4bLZv/hL8YlX85conQZcAZ4ik7+xnPI8zUM2cOIDP4zs6KcIWSy
         KS/188HDSKCLuy25fIHK/4kX2HXFKYbVl9SU07DOmTsibPQk4t+DRuIRfp+p6R90/8Kj
         WSuFxl1hntbl0yu+I/f4k/uAxFco1el2S7HMMf4k4s2Tp0Sk4R9fXZ44GIIGqJ1Z7ObB
         m5YIWKbEkHcJfLXzWPSPAwnw00IUWldX3rc42GZA3zn7FcI7LxxQvux93XS3wnsR/f80
         Z1wzr5/T6y5lsU+tPZMxMhOHUEOE5EGmzE7blyhTcvdXbQ1wZW+ZuclS+gF7ds1RHQC3
         UhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712266056; x=1712870856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JivkPtYm65IsO1ddY4sRkpm5UlWEeBHwlfhWJ8irw1I=;
        b=kgqMWjGs6kqZzA5DuoBUwAwUTjzdjEQPrnxrYCSHWOUHqqVdpUEfeqgJ2f0eL91Gty
         nJZZDSmXku8JoE3OreYysG8QTND5pz/Opww20UBP+zJmQLwYgGcfEwE/+ZXxC73G762U
         UYVIIA8m7mtiLYOICHzc8MDZLs9ITWl5iQgfiSHpDnLQjbgEzVKWSxIR2QTdSJAc7ZhA
         LGYk7ysoy242IeiS0fcRXTtenQNTLQtAcuO9oI77Y4Ouq3BPU5dqKquPM14dZHOJidzL
         mSLlAMnnP8zt7z+YpcN5Xzvc+jnEsk76C3svY6WlrZ3BQL28u9VvfCXlL5IUf4b0sP9i
         0fuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzpvFNcYAuWFXbjjPEna0Nh0Aj4KAOMZax4f7uONe5PVnRdEhPJoaddM4fXQIVQheU2Mn1fpg0I/WJ7iUjeOkNd2GkusC/z/4W5HBsI8GQ
X-Gm-Message-State: AOJu0Yw90SmtdFQZW4qkWEhaupnFILvjzJRxgBpteZC8UjFnTRj46Ii/
	Z2vas5XZwZZrkZqubnGkMZQsbrx+/jm/Ny2A89yC2kKctzECEbfhttk43SNco5o=
X-Google-Smtp-Source: AGHT+IElVj0dNlCq61Gmg+a2jG0qLRTZYsV903K0FDvcUKd4h4atrwC0mHGHEVMKo4m8dryHIv35jw==
X-Received: by 2002:a92:c56f:0:b0:368:9913:7ed4 with SMTP id b15-20020a92c56f000000b0036899137ed4mr4633296ilj.25.1712266056436;
        Thu, 04 Apr 2024 14:27:36 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id iz16-20020a056638881000b00480b6389b3bsm134868jab.34.2024.04.04.14.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 14:27:36 -0700 (PDT)
Message-ID: <74d6213f-51de-4d48-a7fb-844d6bb57fa7@sifive.com>
Date: Thu, 4 Apr 2024 16:27:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20240402090920.11627-1-xingyu.wu@starfivetech.com>
 <8d21b1bc-9402-41d4-bd81-c521c8a33d2d@kernel.org>
 <NTZPR01MB095662C4A6FCAEB7B35C48FF9F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <bcf12c0b-d569-4d64-adfb-bad053c182a8@kernel.org>
 <NTZPR01MB09566AB865A0266332268DC69F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <NTZPR01MB09566AB865A0266332268DC69F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_142740_028880_F6DA0A50 
X-CRM114-Status: GOOD (  22.97  )
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

Hi Xingyu,

On 2024-04-03 2:44 AM, Xingyu Wu wrote:
> On 03/04/2024 15:24, Krzysztof Kozlowski wrote:
>>
>> On 03/04/2024 09:19, Xingyu Wu wrote:
>>> On 03/04/2024 0:18, Krzysztof Kozlowski wrote:
>>>>
>>>> On 02/04/2024 11:09, Xingyu Wu wrote:
>>>>> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
>>>>> But now PLL0 rate is 1GHz and the cpu frequency loads become
>>>>> 333/500/500/1000MHz in fact.
>>>>>
>>>>> So PLL0 rate should be default set to 1.5GHz. But setting the
>>>>> PLL0 rate need certain steps:
>>>>>
>>>>> 1. Change the parent of cpu_root clock to OSC clock.
>>>>> 2. Change the divider of cpu_core if PLL0 rate is higher than
>>>>>    1.25GHz before CPUfreq boot.
>>>>> 3. Change the parent of cpu_root clock back to PLL0 clock.
>>>>>
>>>>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>>>>> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for
>>>>> JH7110
>>>>> SoC")
>>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>>> ---
>>>>>
>>>>> Hi Stephen and Emil,
>>>>>
>>>>> This patch fixes the issue about lower rate of CPUfreq[1] by setting
>>>>> PLL0 rate to 1.5GHz.
>>>>>
>>>>> In order not to affect the cpu operation, setting the PLL0 rate need
>>>>> certain steps. The cpu_root's parent clock should be changed first.
>>>>> And the divider of the cpu_core clock should be set to 2 so they
>>>>> won't crash when setting 1.5GHz without voltage regulation. Due to
>>>>> PLL driver boot earlier than SYSCRG driver, cpu_core and cpu_root
>>>>> clocks are using by ioremap().
>>>>>
>>>>> [1]: https://github.com/starfive-tech/VisionFive2/issues/55
>>>>>
>>>>> Previous patch link:
>>>>> v2:
>>>>> https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfi
>>>>> ve
>>>>> tech.com/
>>>>> v1:
>>>>> https://lore.kernel.org/all/20230811033631.160912-1-xingyu.wu@starfi
>>>>> ve
>>>>> tech.com/
>>>>>
>>>>> Thanks,
>>>>> Xingyu Wu
>>>>> ---
>>>>>  .../jh7110-starfive-visionfive-2.dtsi         |   5 +
>>>>>  .../clk/starfive/clk-starfive-jh7110-pll.c    | 102 ++++++++++++++++++
>>>>
>>>> Please do not mix DTS and driver code. That's not really portable.
>>>> DTS is being exported and used in other projects.
>>>
>>> OK, I will submit that in two patches.
>>>
>>>>
>>>> ...
>>>>
>>>>>
>>>>> @@ -458,6 +535,8 @@ static int jh7110_pll_probe(struct
>>>>> platform_device
>>>> *pdev)
>>>>>  	struct jh7110_pll_priv *priv;
>>>>>  	unsigned int idx;
>>>>>  	int ret;
>>>>> +	struct device_node *np;
>>>>> +	struct resource res;
>>>>>
>>>>>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>>>>  	if (!priv)
>>>>> @@ -489,6 +568,29 @@ static int jh7110_pll_probe(struct
>>>>> platform_device
>>>> *pdev)
>>>>>  			return ret;
>>>>>  	}
>>>>>
>>>>> +	priv->is_first_set = true;
>>>>> +	np = of_find_compatible_node(NULL, NULL,
>>>>> +"starfive,jh7110-syscrg");
>>>>
>>>> Your drivers should not do it. It's fragile, hides true link/dependency.
>>>> Please use phandles.
>>>>
>>>>
>>>>> +	if (!np) {
>>>>> +		ret = PTR_ERR(np);
>>>>> +		dev_err(priv->dev, "failed to get syscrg node\n");
>>>>> +		goto np_put;
>>>>> +	}
>>>>> +
>>>>> +	ret = of_address_to_resource(np, 0, &res);
>>>>> +	if (ret) {
>>>>> +		dev_err(priv->dev, "failed to get syscrg resource\n");
>>>>> +		goto np_put;
>>>>> +	}
>>>>> +
>>>>> +	priv->syscrg_base = ioremap(res.start, resource_size(&res));
>>>>> +	if (!priv->syscrg_base)
>>>>> +		ret = -ENOMEM;
>>>>
>>>> Why are you mapping other device's IO? How are you going to ensure
>>>> synced access to registers?
>>>
>>> Because setting PLL0 rate need specific steps and use the clocks of SYSCRG.
>>
>> That's not a reason to map other device's IO. That could be a reason for having
>> syscon or some other sort of relationship, like clock or reset.
>>
>>> But SYSCRG driver also need PLL clock to be clock source when adding
>>> clock providers. I tried to add SYSCRG clocks in 'clocks' property in
>>> DT and use
>>> clk_get() to get the clocks. But it could not run and crash. So I use
>>> ioremap() instead.
>>
>> So instead of properly model the relationship, you entangle the drivers even
>> more.
>>
>> Please come with a proper design for this. I have no clue about your hardware,
>> but that looks like you are asynchronously configuring the same hardware in two
>> different places.
>>
>> Sorry, that's poor code.
>>
>> Best regards,
>> Krzysztof
> 
> Hi Krzysztof,
> 
> If I use the old patch[1] like v2 and set the PLL0 default rate in the SYSCRG driver,
> will it be better?
> 
> [1]: https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfivetech.com/

Both reparenting cpu_root and enforcing the maximum cpu_core frequency can be
accomplished with clk notifiers. See for example ccu_mux_notifier_register() in
drivers/clk/sunxi-ng/ccu_mux.c.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
