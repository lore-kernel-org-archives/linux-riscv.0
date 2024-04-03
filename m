Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919D6C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 07:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRqimBG53C+06L4ojrcAdV2k9tXekY6BdcMug4bfLKI=; b=dbUeqT6H3YhbN/
	MEX2dMdKqh7s85jBoai8ZK8e2Z2lxcH6w6IW928Er/pkW7FlCRZ38b96DguBRwcTQ74rPdNpA6S3P
	gv3RQ6wN2l7juAXv8mf8tOm2TnRXBCL/6yYHr5j3mKY09XXtTc91h0GJCLRWsSADTXAszke97WSp7
	uH/4FxEXHtRvAaCk6W5F1JE6BSfnwIoIfzJWao1HDMDrR6HG7aYbPC+DuAcH9AxbBu70QF/S7U6aI
	GvN8ZDWUBZEXDPDG1e6QM33SsueQeIdmf1RNBWujD9TKc+Jwl/L/q05oRjykn8B/sGquGq/2m4TPH
	l3bKmZNw8H8Dsxz+xgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruyJ-0000000EUOc-2dvp;
	Wed, 03 Apr 2024 07:23:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruyG-0000000EUM1-0vQt
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 07:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 401C860C66;
	Wed,  3 Apr 2024 07:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA15C433F1;
	Wed,  3 Apr 2024 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712129021;
	bh=6HqhTpg6hJ6e3zeFzvf8NRUha1X4YypuenPq4riKi2w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JnLFN5iG6jR127kBF3VJGNw7pcD+kle+rRfAj4a/YIRawTPNtzjs71teD2VI/d3q8
	 rbnvy7DLs3lIGJ/rpPUY11FMQ39c0o1WZBFKvl2o6iKe0060p/pxuzKY85jqk3juYr
	 qs1AEBS0RaMWoU46OYeGUCXQlZNouBf/W6nz0NeNu6DH247T82aIPsAmT3XhzUN7oH
	 4TKZN7qQLu7ON/kvrdJXyUsCL/aiWPjS6kil+9P6XhJvzEjI6eN81wuOuIRg5pJgKc
	 gGwRtVbXKFbzlQ9qUhegj5T1P2+vZPfZ5diQUzMqkoDSx1ODiiEAgXFXVJIJ7U7aQB
	 He5v/QQv4N7sg==
Message-ID: <bcf12c0b-d569-4d64-adfb-bad053c182a8@kernel.org>
Date: Wed, 3 Apr 2024 09:23:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20240402090920.11627-1-xingyu.wu@starfivetech.com>
 <8d21b1bc-9402-41d4-bd81-c521c8a33d2d@kernel.org>
 <NTZPR01MB095662C4A6FCAEB7B35C48FF9F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <NTZPR01MB095662C4A6FCAEB7B35C48FF9F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_002344_402564_6AFB6F20 
X-CRM114-Status: GOOD (  21.77  )
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

On 03/04/2024 09:19, Xingyu Wu wrote:
> On 03/04/2024 0:18, Krzysztof Kozlowski wrote:
>>
>> On 02/04/2024 11:09, Xingyu Wu wrote:
>>> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
>>> But now PLL0 rate is 1GHz and the cpu frequency loads become
>>> 333/500/500/1000MHz in fact.
>>>
>>> So PLL0 rate should be default set to 1.5GHz. But setting the
>>> PLL0 rate need certain steps:
>>>
>>> 1. Change the parent of cpu_root clock to OSC clock.
>>> 2. Change the divider of cpu_core if PLL0 rate is higher than
>>>    1.25GHz before CPUfreq boot.
>>> 3. Change the parent of cpu_root clock back to PLL0 clock.
>>>
>>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>>> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110
>>> SoC")
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> ---
>>>
>>> Hi Stephen and Emil,
>>>
>>> This patch fixes the issue about lower rate of CPUfreq[1] by setting
>>> PLL0 rate to 1.5GHz.
>>>
>>> In order not to affect the cpu operation, setting the PLL0 rate need
>>> certain steps. The cpu_root's parent clock should be changed first.
>>> And the divider of the cpu_core clock should be set to 2 so they won't
>>> crash when setting 1.5GHz without voltage regulation. Due to PLL
>>> driver boot earlier than SYSCRG driver, cpu_core and cpu_root clocks
>>> are using by ioremap().
>>>
>>> [1]: https://github.com/starfive-tech/VisionFive2/issues/55
>>>
>>> Previous patch link:
>>> v2:
>>> https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfive
>>> tech.com/
>>> v1:
>>> https://lore.kernel.org/all/20230811033631.160912-1-xingyu.wu@starfive
>>> tech.com/
>>>
>>> Thanks,
>>> Xingyu Wu
>>> ---
>>>  .../jh7110-starfive-visionfive-2.dtsi         |   5 +
>>>  .../clk/starfive/clk-starfive-jh7110-pll.c    | 102 ++++++++++++++++++
>>
>> Please do not mix DTS and driver code. That's not really portable. DTS is being
>> exported and used in other projects.
> 
> OK, I will submit that in two patches.
> 
>>
>> ...
>>
>>>
>>> @@ -458,6 +535,8 @@ static int jh7110_pll_probe(struct platform_device
>> *pdev)
>>>  	struct jh7110_pll_priv *priv;
>>>  	unsigned int idx;
>>>  	int ret;
>>> +	struct device_node *np;
>>> +	struct resource res;
>>>
>>>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>>  	if (!priv)
>>> @@ -489,6 +568,29 @@ static int jh7110_pll_probe(struct platform_device
>> *pdev)
>>>  			return ret;
>>>  	}
>>>
>>> +	priv->is_first_set = true;
>>> +	np = of_find_compatible_node(NULL, NULL, "starfive,jh7110-syscrg");
>>
>> Your drivers should not do it. It's fragile, hides true link/dependency.
>> Please use phandles.
>>
>>
>>> +	if (!np) {
>>> +		ret = PTR_ERR(np);
>>> +		dev_err(priv->dev, "failed to get syscrg node\n");
>>> +		goto np_put;
>>> +	}
>>> +
>>> +	ret = of_address_to_resource(np, 0, &res);
>>> +	if (ret) {
>>> +		dev_err(priv->dev, "failed to get syscrg resource\n");
>>> +		goto np_put;
>>> +	}
>>> +
>>> +	priv->syscrg_base = ioremap(res.start, resource_size(&res));
>>> +	if (!priv->syscrg_base)
>>> +		ret = -ENOMEM;
>>
>> Why are you mapping other device's IO? How are you going to ensure synced
>> access to registers?
> 
> Because setting PLL0 rate need specific steps and use the clocks of SYSCRG.

That's not a reason to map other device's IO. That could be a reason for
having syscon or some other sort of relationship, like clock or reset.

> But SYSCRG driver also need PLL clock to be clock source when adding clock
> providers. I tried to add SYSCRG clocks in 'clocks' property in DT and use
> clk_get() to get the clocks. But it could not run and crash. So I use ioremap()
> instead.

So instead of properly model the relationship, you entangle the drivers
even more.

Please come with a proper design for this. I have no clue about your
hardware, but that looks like you are asynchronously configuring the
same hardware in two different places.

Sorry, that's poor code.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
