Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E4AC636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQLnUzg58MyV9VckDsDbVLCsL/fVX61F/4hKLKNosAM=; b=K7iEWGGT+MwFHq
	wIk3ht1926aWHLcxsFZhBDCPoXBhG+0lRd700v8n435x9YItZOsACg/P0OX+jpFvmq6iN55egiHth
	OOKyenuR4GTqduaQ29Fbt9sccxrpAhjWpzgesKTSdombyrieyXuL8J6TaYaD1CwrTnCWDHlJZhwRa
	LXIHnHmhzvfgcCkGlczoCSyhWtR9lTDM6lf4Z9g4RBypz+q8VyPDWjqKPoS5OpIZDWQu+xi9UoAIh
	t3v9YgFCclrvFAQzdooSlW+ExHSalSjP6RcC7a3CDjnfGXQO0ZRdwWIidqEWkpWVYV9gIFSgclHwI
	DK4ejoXbBfuE72xEGLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7PS-00FbWO-QA; Thu, 23 Feb 2023 08:57:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7PQ-00FbUY-2s
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 08:57:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id i11so3850653wrp.5
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 00:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRdDSbS7nEkJ9kdJNqP0X8nEH0I1zPFXRhFF4w2M6FM=;
        b=uof/8xpGNMHg7iY5wJ+1UskO3GHuWWbi+LCRXKfXoZp2VNoFZYGNSfC72Z09UgZuCO
         wvvGj3qqdHqtvjdlCxmiW7a55/x93iaXFJk+1+8i+ITCkmBjBfPy/Bsw17U9V+3dNvND
         zAYnX97eEp4ZXVGmB67Pw5pkjXmKm1SmQuFMUotL0HzqbJbo8kqrONfhTbJ3APnVcQkX
         LRVXogPcFOujMToZtiqtWvsO871CuUA6fSe93FxaLsfCTqQETsXT1zARS2EKYNyXjzcs
         PlthB+V+Ieinf7X2oLasgtlIiiR3fopI6hlQxEEPE0RRdKhpCkWP9ygPo33quzqAPoY6
         Sk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRdDSbS7nEkJ9kdJNqP0X8nEH0I1zPFXRhFF4w2M6FM=;
        b=0CqYB9bkQcgmEetkscRp0ci+lgq/xADbKPuoy/R8nzBFKKSd9e/D26E41ZM0FLhE69
         kLGaA+YJBP1kVr7WaqVtrn+g+fMnGxK3IIb4l+XDZtirjkz7GOP+2pvRClYZ5nVUT6le
         6vucl6WyvGFCpoM6AH9n5xcmAYye/kUhrIAttTvBqooq4/n6UdzEeCTripO1Jwl5N7gw
         yrsXCHwk8rlVfaj/Ub6UwDOmZ7+d4V3ZoZBusKBkb1Rtwb4iLKK9xtzHny03kSmgMoQ1
         jieOKjmnUWhfHxWIAVqAwoeo85B+Ylo8q9Cb9PDurhqnrxoHLvjwC1AvszjhCKEGmzUm
         9pBg==
X-Gm-Message-State: AO0yUKUNVUz+Y/W3e//t1XD3XKKxXA0xQw9L7kptRUcA4EfNKHtZ3KtE
	bzJhLCRIx3x0EIDEYv3HRcErSQ==
X-Google-Smtp-Source: AK7set8NKlL8SHoM9z9qqJPq+MxNrjGbRtINAlauiFot2x6JL9A+CeI+ByZ3GoT99Y+o5rWLUelBvw==
X-Received: by 2002:a5d:5f03:0:b0:2c3:be89:7c2b with SMTP id cl3-20020a5d5f03000000b002c3be897c2bmr9576815wrb.14.1677142616464;
        Thu, 23 Feb 2023 00:56:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm10760022wrp.44.2023.02.23.00.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 00:56:56 -0800 (PST)
Message-ID: <3f50066b-f967-b9fa-1e0d-5337ec1ed194@linaro.org>
Date: Thu, 23 Feb 2023 09:56:54 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221141147.303642-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_005700_158205_96305034 
X-CRM114-Status: GOOD (  14.30  )
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

On 21/02/2023 15:11, Xingyu Wu wrote:
> Add driver for the StarFive JH7110 PLL clock controller and
> modify the JH7110 system clock driver to rely on this PLL clocks.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---


> +
> +static int jh7110_pll_clk_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct of_phandle_args args;
> +	struct regmap *pll_syscon_regmap;
> +	unsigned int idx;
> +	struct jh7110_clk_pll_priv *priv;
> +	struct jh7110_clk_pll_data *data;
> +	char *pll_name[JH7110_PLLCLK_END] = {
> +		"pll0_out",
> +		"pll1_out",
> +		"pll2_out"
> +	};
> +
> +	priv = devm_kzalloc(&pdev->dev,
> +			    struct_size(priv, data, JH7110_PLLCLK_END),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &pdev->dev;
> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node, "starfive,sysreg", 0, 0, &args);

1. Wrong wrapping. Wrap code at 80 as coding style asks.

2. Why you are using syscon for normal, device MMIO operation? Your DTS
also points that this is incorrect, hacky representation of hardware.
Don't add devices to DT to fake places and then overuse syscon to fix
that fake placement. The clock is in system registers, thus it must be
there.

3. Even if this stays, why so complicated code instead of
syscon_regmap_lookup_by_phandle()?


> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to parse starfive,sys-syscon : %d\n", ret);

dev_err_probe and in other places as well, if applicable.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
