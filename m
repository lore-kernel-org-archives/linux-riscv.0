Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4CFC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPhuRLon1GrAkRS1PX/C9DQS/EeshcmDbvG+ep66d7g=; b=0fQX649Hb3seNv
	1Nf1p5GmsXt2h3oQVNzE2kNJzPMK33Q7Je/RIbuFNpJil/eCKDAnCOedJYk7mzZ/F24/TVuLLoiAG
	alunaZ7C8k5Y0Dfe8Q+ZgyiQT1CBcj3Xaht0aiq4shgmKkStk50xtvbKcR5h0xTA75C+dp1ZaB1vv
	md5q20mQQR7RF7kjKyVnod+MPznTzuFcTYLDQpMuSLb1QprjIwbXbrb9ff9pOnVNsywrnVtyBvBlM
	dfx81jEJzXJPrq/WvIUb7jZdwD7Dq0w9962qdf42DG1GGm2N7VtwXlIP/863u4AQs5eaVOAFty/TA
	MKj4aTR04cgkXIFZAhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Xjo-001wtf-1e;
	Mon, 27 Nov 2023 09:17:08 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Xjh-001wr2-07
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 09:17:06 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a0b65cbf096so207860766b.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 01:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701076619; x=1701681419; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nZWflqrlL9XRvdO/13WG43uGI47H+F2FCwnHI07P3l0=;
        b=CqeIZPD96ALHmUaQPfro8cBWH305GN++hlxwd9hk1hl24QouHpf+aPVHKFCErWwt1X
         j+n7Bng1Jz/OuXpZEMJmm5bs7q7j2O5Nb4NW8cMwZvRp6Hfb02BsVx9EfpsRF3JsXd/Y
         Gf/s+AtOGT3xczI067biP3Wijw+LIlaWm1bF4vSqh9+zOe6yFAj22UrcviusxMpgSAV/
         f3QBVBZw54dVj8uEgXlfswBG8wDeVLW6pS4LeH96AaC68/lF4sYAVuENbPJHWslvXs2H
         6riki+6kBWZvgduNrDLGcM46N/GHVAQimG8fVWB7nMJBJBsS0HpKQibSvao93B53lGGn
         GJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701076619; x=1701681419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZWflqrlL9XRvdO/13WG43uGI47H+F2FCwnHI07P3l0=;
        b=KNqNl5UhrU0//VGuh+zQhjqZH1XtM3Spj4hL4nnADM10BSmNIctr50YYlaU9jilN83
         xZNk+rCtmzt+pjfUYl1P+A7XhqmA+Fwbd+BissmrH/mmf17xb6G8tOuYVJEfLGsk7+BV
         Ic245v+l+p94iYbjfRK1nrXzXc9CAtdFjWvnsbQXs/SSWqi+d2TVYgDgYaWhtiCoE9PE
         vl1e34XaC81Cpld7kkx+R8EYXkheZdMdGmlLmcSQ+jm4UFzzDdekIOZ1st1GKxSfetXc
         VWyQOIxmBYyDp2Aear0Q/wizNPeEsgEdYOULhs3+XcbUi2lFphdTI3ZG7zIeplR8rStq
         uZMg==
X-Gm-Message-State: AOJu0YzX0Bft6Ppd/7F4e80NIkZ7Eq5EDXm1KJLBGT3FT6yNhjglWxYs
	MnVDGM9EJSxyUvNNwpAj5RrPeQ==
X-Google-Smtp-Source: AGHT+IFTNurajnAcJm/1MCfTh6noRzK6K4LnRPKy8hd2wMxROieeYDh/1GQ7v4oUyrAMI2S03xPjbA==
X-Received: by 2002:a17:906:41:b0:a09:589f:94b4 with SMTP id 1-20020a170906004100b00a09589f94b4mr6791529ejg.63.1701076618687;
        Mon, 27 Nov 2023 01:16:58 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id t11-20020a170906a10b00b009ff8be60791sm5460224ejy.210.2023.11.27.01.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 01:16:58 -0800 (PST)
Message-ID: <2a268c8c-ce55-4321-b390-092b8df61407@linaro.org>
Date: Mon, 27 Nov 2023 10:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: sophgo: Add SG2042 clock generator driver
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1701044106.git.unicorn_wang@outlook.com>
 <c06130afb4bdc1890b4e8d29388fa6feef1f1826.1701044106.git.unicorn_wang@outlook.com>
 <81d421c8-bfd6-42b5-9da1-f067792f8f48@linaro.org>
 <MA0P287MB03329CFBA3BB6A4E4F322F99FEBDA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MA0P287MB03329CFBA3BB6A4E4F322F99FEBDA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_011701_354904_060736B6 
X-CRM114-Status: GOOD (  22.73  )
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

On 27/11/2023 09:07, Chen Wang wrote:
> 
> On 2023/11/27 15:12, Krzysztof Kozlowski wrote:
>> On 27/11/2023 02:15, Chen Wang wrote:
>>> From: Chen Wang <unicorn_wang@outlook.com>
>>>
>>> Add a driver for the SOPHGO SG2042 clock generator.
>>>
>>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>> ...
>>
>>> +static void __init sg2042_clk_init(struct device_node *node)
>>> +{
>>> +	struct sg2042_clk_data *clk_data = NULL;
>>> +	int i, ret = 0;
>>> +	int num_clks = 0;
>>> +
>>> +	num_clks = ARRAY_SIZE(sg2042_pll_clks) +
>>> +		   ARRAY_SIZE(sg2042_div_clks) +
>>> +		   ARRAY_SIZE(sg2042_gate_clks) +
>>> +		   ARRAY_SIZE(sg2042_mux_clks);
>>> +	if (num_clks == 0) {
>>> +		ret = -EINVAL;
>>> +		goto error_out;
>>> +	}
>>> +
>>> +	ret = sg2042_clk_init_clk_data(node, num_clks, &clk_data);
>>> +	if (ret < 0)
>>> +		goto error_out;
>>> +
>>> +	ret = sg2042_clk_register_plls(clk_data, sg2042_pll_clks,
>>> +				ARRAY_SIZE(sg2042_pll_clks));
>>> +	if (ret)
>>> +		goto cleanup;
>>> +
>>> +	ret = sg2042_clk_register_divs(clk_data, sg2042_div_clks,
>>> +				ARRAY_SIZE(sg2042_div_clks));
>>> +	if (ret)
>>> +		goto cleanup;
>>> +
>>> +	ret = sg2042_clk_register_gates(clk_data, sg2042_gate_clks,
>>> +				ARRAY_SIZE(sg2042_gate_clks));
>>> +	if (ret)
>>> +		goto cleanup;
>>> +
>>> +	ret = sg2042_clk_register_muxs(clk_data, sg2042_mux_clks,
>>> +				ARRAY_SIZE(sg2042_mux_clks));
>>> +	if (ret)
>>> +		goto cleanup;
>>> +
>>> +	for (i = 0; i < num_clks; i++)
>>> +		dbg_info("provider [%d]: %s\n", i, clk_hw_get_name(clk_data->onecell_data.hws[i]));
>>> +	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, &clk_data->onecell_data);
>>> +	if (ret)
>>> +		goto cleanup;
>>> +
>>> +	return;
>>> +
>>> +cleanup:
>>> +	for (i = 0; i < num_clks; i++) {
>>> +		if (clk_data->onecell_data.hws[i] != NULL)
>>> +			clk_hw_unregister(clk_data->onecell_data.hws[i]);
>>> +	}
>>> +	kfree(clk_data);
>>> +
>>> +error_out:
>>> +	pr_err("%s failed error number %d\n", __func__, ret);
>>> +}
>>> +
>>> +CLK_OF_DECLARE(sg2042_clk, "sophgo,sg2042-clkgen", sg2042_clk_init);
>> No, this should be platform device. It's a child of another device, so
>> you cannot use other way of init ordering.
> 
> hi, Krzysztof,
> 
> Thanks for your review.
> 
> I don't quite understand your opinion. Do you mean CLK_OF_DECLARE is 
> only used for platform device so it can not be use here? But I think 

No, I meant you mix init ordering: you depend now on syscon earlier
initcall than CLK_OF_DECLARE. Do you remember which one is first? If
anything changes here, your driver is broken. There is no dependency, no
probe deferral.

> this driver is still for platform device though I move the clock 
> controller node as a child of the system contoller node. System 
> controller node is just a block of registers which are used to control 
> some other platform devices ,such as clock controller, reset controller 
> and pin controller for this SoC.
> 
> And I also see other similar code in kernel, for example: 
> drivers/clk/clk-k210.c.
> 
> And I'm confused by your input "so you cannot use other way of init 
> ordering." Do you mean "so you CAN use other way of init ordering"? 

No, I meant you cannot. If you want to use syscon, then your driver
should be a proper driver. Therefore add a driver.

> What's the other way of init ordering do you mean?

The one coming not from initcalls but driver model.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
