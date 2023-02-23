Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0377FC636D6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 10:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+vu/OZimHctc8cqRAQXS/ZXokwfkqeBFZXFjoLB2L0=; b=21G0rSSQm9wTXo
	eAWNv6frsRWi5aslSNKviK60gkrmr/VFKUecVaZBk0/kXNTsIup3bctQlZMqcc4+HqPQwe28zrZHu
	VsxToiq1JGGR9ZHqikKLcbvOQBKJ7LwCm1ww43zQPZgppkXHMzczpQitgTuk2qE8BqFNy+LVCglmy
	V8qmXQxRIesmhsSgiygD7pMNUVxvrAJAVBHgV0s1NGu2iNvXHva2pT4C4PVM+9Wk8da05bWGYR/+Y
	RASfgVdtGERTUpZfdWZ/4PdJQZ2QYtXj1VCBDereYtjvzfJWOmwg7ixfRBOMk9xi+4eWwKKXjCc/v
	XLbnrV5u3ZqMNsyOQVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8Yg-00FraY-Tq; Thu, 23 Feb 2023 10:10:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8Yd-00FrYj-Ty
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 10:10:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id c12so10229735wrw.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 02:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=236jNw2fdr9Ea0T8DRQtB95xL/LfM7SEmL07d5doxEI=;
        b=ZtE+5wrQI/aif/9mX+GzeECglq+rya2NBAbX4l/F8gOQuxQ64tRpYmvz2K+iPD+iRi
         FX2kjQlnERR3iD4J9hQcp7FC9vLxwzW9ysOx0CBBhx95BGmlo6YUtmW+nIKJS6vRF5lF
         v5SAdJrArDyAHgoRSHYNGfg+pkeqyivxvM7gdyOm7raI6+KDI+FWm2TvQ3kseNQ21HAw
         CyodKqSgbGdbk+hKzXfdQIib2y0x11z83OR/1nECGh27E0nBe3GhE5+nJTgxeXqnwfZ2
         leYq7e0iCLRZF1skW9jmfOEesbj7G7HXE5SgPzB9zgE8T1sgbFt6WZPvVZ7l0sz8SUGL
         NxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=236jNw2fdr9Ea0T8DRQtB95xL/LfM7SEmL07d5doxEI=;
        b=A9vH7LE3CHp6MPe4e4jwD1V7knVxOHj3qx2o4D1x9lM4iOhqKw7G2zgVr964Ra39WY
         RiySl6o2jQigsmp6kujg/1h2pG2tZ5CN1H6V4l6OuS6tklx3Wv1zymDpr93Ln8uu5nO1
         GwL3Q1giVqyyzg/2alSNOCn21rFxT8MKhxTEbXVzlK1IT4yENChjgcwdTpoqjtZeURkK
         8BcmXLWNs6qebD2GVhJNMISdoqcIa6LUr57y5U+jP8865UuU8lo02Df6iPdRiVL8z1p3
         VNZAT0QR2qW1PqJSMHRHRFDlCX+jYFMR+PUCmpKJzWnBo0uCEBu290lwLRnlGfz0B6ux
         HHLw==
X-Gm-Message-State: AO0yUKWNqgALAKRvHut9Jt/f0lGkR7vMux/VMYMSPR4GMP9tYRKRcaPN
	XpIvOHUjbhoJ+nDpzGkm7rIAzw==
X-Google-Smtp-Source: AK7set/V8KugWpjfN68Fyoyg3SD+cgyUxwVIdwLNmTr3PEuuNKfYqQ7a5WZX5OBj0FuoZwkno1MZZA==
X-Received: by 2002:a5d:6284:0:b0:2bd:d34e:5355 with SMTP id k4-20020a5d6284000000b002bdd34e5355mr9395008wru.20.1677147034466;
        Thu, 23 Feb 2023 02:10:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s17-20020a5d4ed1000000b002c4084d3472sm6574836wrv.58.2023.02.23.02.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:10:34 -0800 (PST)
Message-ID: <d76f25ff-3c60-4e9b-87d7-8c4043b2e47f@linaro.org>
Date: Thu, 23 Feb 2023 11:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] clk: starfive: Add StarFive JH7110 PLL clock
 driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-3-xingyu.wu@starfivetech.com>
 <3f50066b-f967-b9fa-1e0d-5337ec1ed194@linaro.org>
 <5e4007b7-6522-4c81-ca15-15a98c586aad@starfivetech.com>
 <50b6fb73-afb2-051b-7969-d7fbbe1e6175@linaro.org>
 <f23b3755-e2dd-f858-02ad-3f1b58934bc6@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f23b3755-e2dd-f858-02ad-3f1b58934bc6@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_021035_998449_84710A0B 
X-CRM114-Status: GOOD (  15.04  )
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

On 23/02/2023 11:03, Xingyu Wu wrote:
> On 2023/2/23 17:35, Krzysztof Kozlowski wrote:
>> On 23/02/2023 10:32, Xingyu Wu wrote:
>>> On 2023/2/23 16:56, Krzysztof Kozlowski wrote:
>>>> On 21/02/2023 15:11, Xingyu Wu wrote:
>>>>> Add driver for the StarFive JH7110 PLL clock controller and
>>>>> modify the JH7110 system clock driver to rely on this PLL clocks.
>>>>>
>>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>>> ---
>>>>
>>>>
>>>>> +
>>>>> +static int jh7110_pll_clk_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +	int ret;
>>>>> +	struct of_phandle_args args;
>>>>> +	struct regmap *pll_syscon_regmap;
>>>>> +	unsigned int idx;
>>>>> +	struct jh7110_clk_pll_priv *priv;
>>>>> +	struct jh7110_clk_pll_data *data;
>>>>> +	char *pll_name[JH7110_PLLCLK_END] = {
>>>>> +		"pll0_out",
>>>>> +		"pll1_out",
>>>>> +		"pll2_out"
>>>>> +	};
>>>>> +
>>>>> +	priv = devm_kzalloc(&pdev->dev,
>>>>> +			    struct_size(priv, data, JH7110_PLLCLK_END),
>>>>> +			    GFP_KERNEL);
>>>>> +	if (!priv)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	priv->dev = &pdev->dev;
>>>>> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node, "starfive,sysreg", 0, 0, &args);
>>>>
>>>> 1. Wrong wrapping. Wrap code at 80 as coding style asks.
>>>>
>>>> 2. Why you are using syscon for normal, device MMIO operation? Your DTS
>>>> also points that this is incorrect, hacky representation of hardware.
>>>> Don't add devices to DT to fake places and then overuse syscon to fix
>>>> that fake placement. The clock is in system registers, thus it must be
>>>> there.
>>>>
>>>> 3. Even if this stays, why so complicated code instead of
>>>> syscon_regmap_lookup_by_phandle()?
>>>>
>>>
>>> Thanks for your advice. Will use syscon_regmap_lookup_by_phandle instead it
>>> and remove useless part.
>>
>> So you ignored entirely part 2? This was the main comment... I am going
>> to keep NAK-ing it then.
> 
> What I understand to mean is that I cannot use a fake node to operate syscon
> registers. So I should move the PLL node under syscon node directly. Is it ok?

Yes, because it looks like entire PLL clock control is from the syscon
node, thus the clocks are there.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
