Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3468AC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lfhKw2gcnu8KUHYvaNjenPY9hOCvbDhdnZatE7XyoU=; b=GijKlxW96gYhyc
	eYDDTich7/UbgIxg8VrQ9uFXjhT6FhqrQz1WA4b4JDF22ANFO0zOH2tJ2n886FxDZkqHZxmXJly5W
	u7uXX/RV0Smm7mSBELcRU3SBxXnCaqk6gaj/eOJIBR5nyVbTNX2zhQImoo0hfUNz/Ow1SPiBdr3a5
	wsoYrmQcqWdl/zu1vMyGCc9SC/+yaGikr+JonY+6wcv2Z4msArcGMEpGsQyP/IDSuv/Vovz+QbYeq
	WCNYd69haGXNs3xpwattrVnIJUiq/8kql6O5Dzyb8gSJlu+1RVRxPgSxtgTh8UaOSFC6vtwvnGc7l
	dZ+G0n5GEVMzLQR1B5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV80N-00Fk0D-IF; Thu, 23 Feb 2023 09:35:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV80J-00Fjy5-Tq
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 09:35:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bt28so3463505wrb.8
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 01:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kodxLk0TphMCC/ILhmEdQpCuhgaRqKfJim+OppTyRX8=;
        b=Zzd89Zw6wko4wqATcT9BNDJurIT3/QbFN2jbs7NBTiGJX1+Jf2/UGL9vstIHfZpQUK
         P+u4WJT9dnPTjfRPvd4hXP375isEexXHYOb1w9mZxrS2B26qr4anliwFBJ+GFftEokHc
         +/U/Z56pfflc4tOlqVSVqDYKCK7zF8Up9dOowH2ZeseoevvZdbuz9g8FUvDCSzY7b2d9
         iAIBWuoNE0qgudzTqH8dcie4YpeOYHMJirFYttSLqNdivu9tzneBfNZIZohcxxqdZom0
         2cDj8Ifx6uO2ajpw3ajFaXYgLFNUPOUSvSODMgeGtS5p6snqy3k7XDJRA8VVN4NGbpyk
         BaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kodxLk0TphMCC/ILhmEdQpCuhgaRqKfJim+OppTyRX8=;
        b=BzhWTVGOfNFhgNDQDPkdKw4QQXWBCasKy0Jr0wfdaVDvLuxStJHIXlZqUTdhXhJIc7
         VFW7oo3XbInaRsrgyDHJbzd2qYvCRNvz1W/ZOjRE0UE5+ir8E+s5/WN7AZN5ydbaGWub
         8MoxZWI1LlNCFQMMndajHzD1FvcKUT71zlVoNh846m/11LwMZGFKGh/f2CBPzeWPj4CL
         TtzbVV+T2uazXPKsqySYOXo6vQdirexBrwia/d3kZdU19VjnRfnjmD30VoFhNP2+LQC9
         n1P+VYF/5qfaUjS2LDQjPKGtr/TaRKlvgEXupmUIPiBUwtJiEXWVN1lyJrfndDKAjn1J
         OtBg==
X-Gm-Message-State: AO0yUKWlsF5qn7rKdaTDttItHWwjkJK2qYJc9ULtF4sRHQHkA3R3gXeb
	53BYmPkUkgeqKXh+paPSLGQYXQ==
X-Google-Smtp-Source: AK7set9LfPC+y15/HCPLxFQg6FFtdgu588ulqjgOUtmqsP0MC2RyvpOauIzF6oSt3Pd47LKQnkt0cg==
X-Received: by 2002:a5d:5512:0:b0:2c7:1210:feaa with SMTP id b18-20020a5d5512000000b002c71210feaamr1034652wrv.26.1677144906381;
        Thu, 23 Feb 2023 01:35:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d5149000000b002c550eb062fsm8500225wrt.14.2023.02.23.01.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:35:04 -0800 (PST)
Message-ID: <50b6fb73-afb2-051b-7969-d7fbbe1e6175@linaro.org>
Date: Thu, 23 Feb 2023 10:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] clk: starfive: Add StarFive JH7110 PLL clock
 driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-3-xingyu.wu@starfivetech.com>
 <3f50066b-f967-b9fa-1e0d-5337ec1ed194@linaro.org>
 <5e4007b7-6522-4c81-ca15-15a98c586aad@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5e4007b7-6522-4c81-ca15-15a98c586aad@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_013507_995251_5455C3DE 
X-CRM114-Status: GOOD (  14.89  )
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

On 23/02/2023 10:32, Xingyu Wu wrote:
> On 2023/2/23 16:56, Krzysztof Kozlowski wrote:
>> On 21/02/2023 15:11, Xingyu Wu wrote:
>>> Add driver for the StarFive JH7110 PLL clock controller and
>>> modify the JH7110 system clock driver to rely on this PLL clocks.
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> ---
>>
>>
>>> +
>>> +static int jh7110_pll_clk_probe(struct platform_device *pdev)
>>> +{
>>> +	int ret;
>>> +	struct of_phandle_args args;
>>> +	struct regmap *pll_syscon_regmap;
>>> +	unsigned int idx;
>>> +	struct jh7110_clk_pll_priv *priv;
>>> +	struct jh7110_clk_pll_data *data;
>>> +	char *pll_name[JH7110_PLLCLK_END] = {
>>> +		"pll0_out",
>>> +		"pll1_out",
>>> +		"pll2_out"
>>> +	};
>>> +
>>> +	priv = devm_kzalloc(&pdev->dev,
>>> +			    struct_size(priv, data, JH7110_PLLCLK_END),
>>> +			    GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	priv->dev = &pdev->dev;
>>> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node, "starfive,sysreg", 0, 0, &args);
>>
>> 1. Wrong wrapping. Wrap code at 80 as coding style asks.
>>
>> 2. Why you are using syscon for normal, device MMIO operation? Your DTS
>> also points that this is incorrect, hacky representation of hardware.
>> Don't add devices to DT to fake places and then overuse syscon to fix
>> that fake placement. The clock is in system registers, thus it must be
>> there.
>>
>> 3. Even if this stays, why so complicated code instead of
>> syscon_regmap_lookup_by_phandle()?
>>
> 
> Thanks for your advice. Will use syscon_regmap_lookup_by_phandle instead it
> and remove useless part.

So you ignored entirely part 2? This was the main comment... I am going
to keep NAK-ing it then.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
