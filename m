Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB35C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szLMDNKOl3/KyjH2iYrEoUlaFcfu/eKyllAKb1dhbh8=; b=Sn5tmDYGfj1wU7
	kB1n10S44GJiKlAvSdyybj2s8AKQfeyASWWegktPaRD9MnngL+qweVWl+I6d3q/8ICy/n49v5uKob
	t4rTRYSpSSzquxq/kotF+NcTilGIOoG2fsk8LJmulICcM2+rNJNN/YPdvabTPpJcK6sfqUT1NfmJT
	+1ZUs5OUJ0WUm08ACwWWzZuvibt4QnwdIXYSNx7gL4yW685mWGgDfL+oCTQXZQw7+LX7g/03Bah0a
	w4bnyDaHaNzNeaaqJvX+tQORjSZ3L9yBwN04OjTulSMzdorJQBNoHBm6PmwrqcUmZLFaJK8fYTZXH
	GvvNi76202CrcUiikH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wY7-00000004zux-2B8l;
	Mon, 21 Apr 2025 19:11:23 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wY4-00000004zty-3kQj
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 19:11:22 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-47663aeff1bso40553571cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745262680; x=1745867480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gI2L4uhiI02NJe/WReim9SGsmkpDN8uWBBFo4WhEb3I=;
        b=eaN4WI77WaIFgaZcswSHbo04rdbp4xCs7mzZv89aO1Xkqt6V9/QZnSAAlEuVvQJoZL
         DGCM+hbMAruIZEtIOMtrk9uDC5d3Ywm9nVwczQu/EtHctASFXiyQ5MigInXc1azzz812
         lFYNg6B59XYvZmbg+3Rfq3A5QzaliBWdrFQRuHZcFHQVqXN/lQJw1jKDbtb7BBY+zmBK
         X+si0vR2id8/E7fWE3udpbtd8mf8VTn4iFekg0HmQDFwXU2gm7F7qx685ZlTMLsyOWNX
         q4L0hkOfJEwwplFjTN8ENqcttcFIzUhHEk1XEEFVi7+WpjHuz/sbN1W99B7AmqcXbuNj
         zGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745262680; x=1745867480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gI2L4uhiI02NJe/WReim9SGsmkpDN8uWBBFo4WhEb3I=;
        b=swoyoq7FpvrulvsnIcNUmAtJay+gePW/oZjTCX5JdtPJDPYbeQ8VSzW+MzQGwis75b
         FTHetKgA79OheN7bMFIKFvwsQOp/8qL8cuSW44q5+LkteBhbW5i9/v7oo7ruGsAR+ute
         UeC1HV9JCO9MyPpjCqTzfq2Yul0634qTbIpZvNm9xxPqSEyu4ex+IHKKNjwFcMOJkrds
         tnw8bwgq/hcomhrb9esjVzafxkur1UVVQ/gh+gSdjGQX9S5ziswt47NZHTX2Aynjihqn
         N7Xnscgl/ZlLOpSjWah4NA72cFm2cFv/EzsYfc0DEE0+d65SvOv7Kgk48TNuzEzZoS0I
         myIA==
X-Forwarded-Encrypted: i=1; AJvYcCVPTK7McRjlfI67r2bm0sNE5/8wCY0/0fXSvWJAV6T2MJpdEAGO4/7ilFHWjK/T83pGh9pNz88P2y7LjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhCJYv3FFcBQoiOIHxtzDxutpHTgtVZjMZ8J2JYrQWulHsc61Z
	hTVow8pey6Q0bJYG2P3czcu+iYQ7ljATNQVPP+wiQ6xEg6s9jjPv51ViBbPEByg=
X-Gm-Gg: ASbGncviK1bhIf/fBeut0QbytI17l10YVGRVuQnodu299yxUjkrQoo+pc7PVKX2Ol2V
	iJ2I95xp91LlgY2aYd2XXzHMO8yyhTM/uQ5kQX88KbWa8lyxiXkxqJi4g0/l+3FcE0ObkQ1/X8+
	Dur5SGu5DLsdSLXh1z2BmhBcx6++M5JBWQLIqwYcr0XaqUIb46EIwoZeaWSrvqSG36n8gOREq6u
	cOVFUVAkXp6uJ87903Ti+rG0ykpun2TR2tBznWGkloLUlsDj+uhvNtJ5BakYmHPRw+IlLGVEld/
	8NRAeQfAkWaVsSDwIOzBWTOU2rqxtwGdzcLeeiDc0RSbOU3N9jxemLiZyn0Dt6KAHBIIHTX4fNM
	CU+WL
X-Google-Smtp-Source: AGHT+IHP/Ty/ZP20dA5qBvEvFjaNUxmyfhkG77rGIDC4dMEZdaAtit8jzrqmhWV8xbqy0JUyq8twcQ==
X-Received: by 2002:ac8:5e4f:0:b0:474:db2f:bd32 with SMTP id d75a77b69052e-47aec4b971emr238825011cf.38.1745262679762;
        Mon, 21 Apr 2025 12:11:19 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c188a8sm45206481cf.8.2025.04.21.12.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 12:11:19 -0700 (PDT)
Message-ID: <29954f84-75b9-436f-8e36-f52bf26a905f@riscstar.com>
Date: Mon, 21 Apr 2025 14:11:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: spacemit: add clock support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
 <20250416-02-k1-pinctrl-clk-v2-2-2b5fcbd4183c@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-2-2b5fcbd4183c@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_121120_936443_72372AD5 
X-CRM114-Status: GOOD (  18.93  )
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

On 4/15/25 7:15 PM, Yixun Lan wrote:
> For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
> the driver instead of relying on bootloader or default hardware
> settings to enable it.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

It might be nice at some point to set the clock rates
to whatever is preferred.  But this looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
>   drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 67e867b04a02ea1887d93aedfdea5bda037f88b1..9996b1c4a07e72f2a3832b759feddcd4e07f2159 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -2,6 +2,7 @@
>   /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
>   
>   #include <linux/bits.h>
> +#include <linux/clk.h>
>   #include <linux/cleanup.h>
>   #include <linux/io.h>
>   #include <linux/of.h>
> @@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct spacemit_pinctrl *pctrl;
> +	struct clk *func_clk, *bus_clk;
>   	const struct spacemit_pinctrl_data *pctrl_data;
>   	int ret;
>   
> @@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>   	if (IS_ERR(pctrl->regs))
>   		return PTR_ERR(pctrl->regs);
>   
> +	func_clk = devm_clk_get_enabled(dev, "func");
> +	if (IS_ERR(func_clk))
> +		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> +
> +	bus_clk = devm_clk_get_enabled(dev, "bus");
> +	if (IS_ERR(bus_clk))
> +		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
> +
>   	pctrl->pdesc.name = dev_name(dev);
>   	pctrl->pdesc.pins = pctrl_data->pins;
>   	pctrl->pdesc.npins = pctrl_data->npins;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
