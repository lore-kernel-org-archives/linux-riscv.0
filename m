Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9A5C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:05:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AFEA20853
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N+v5RvNB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tvuwBxx+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AFEA20853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HB5hlQQqXjm6Tzg5YF0Mk7zRzkmBVEGLq7PDLoso1/U=; b=N+v5RvNBoVw867tekSMFDejHJ
	CcJLybB5bTzAS7lID6eSrRsthDIUXVdU9MnUSjeBZACsqQSPIL/pjRXBl28yIISgAZZ+FRXYlX9sn
	aAg+xsclQHjxEO0A/ac5QmOXlU2AbDmgb+ZLtQFGbdj9/Hj/Y7I401eKWGfA+xLLFO5A8Yw6Ag5g5
	IURp677ZXxyWOTa2N6PCSuFtBOEyEPo2NrcHRx+3FYw4RdW0bOJKllTK/8R0aB8ysfSCpHqViEeNV
	wkrruhWjm0hYtsn6od19Xj5ejudn82HdRA9nmFPXKrdy5pz9sapSy7RddFDi4Molh4ZjLmaqYXOFu
	9tvwzEAew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8jG-0000xS-4T; Mon, 09 Nov 2020 15:05:10 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8jD-0000wj-J2
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:05:08 +0000
Received: by mail-lj1-x241.google.com with SMTP id 23so10708574ljv.7
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 07:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9Fi5Hhyl7gelaqOmcgAJ5M1MZ/xVgsIzn2nzYEuzd1A=;
 b=tvuwBxx+Iv7Mda16xZUTuva+GASbvOuK2AZr0+o3QLQXajOmpBYoQ2ksHZau/GPle3
 BnyfEpgqAizWpJZOUyG9cc81uDC4ctAzj7jerluvanbj5XzZFcl+OzIrG+T5tfN9aIQe
 qx/6Xe8wJYguBk8LCwmig2QjdWGpEZwb9WPzzUuXAkETNGNZ59CSb5RNkjQCYBW0S1w8
 xj5wtAlX1JDVF8R5eGZmckL1XFGUUoWqxvKVZN15IE90rKivrim8RltvVTvr7Nr2BXDk
 bFLJt3HzZtH14a/FB373L3IG43mtwtw6/dazdPun9KjLC0WrFU8wdfw5s2VAMqyp/Rho
 043w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Fi5Hhyl7gelaqOmcgAJ5M1MZ/xVgsIzn2nzYEuzd1A=;
 b=b5Fq9lWag8UBdzg7q10/xOHJoWNlxHlRmnVKTeC+Cfwm+NIrKhWhsZ0IqXmAc4ZQn0
 xwuGfTcBIjIp9H/cD2FIG2XpAEUFmiyZ0WSLdQQaROppx1Y0TfxTSf9tvHZG6xTHdLZG
 sQuUEVGETjZuj/Elag+cCoNFmPBMD8j3bceuamguECPDIIztaU65dnr6bDQsyTTtkwwk
 jJpKpsyKfoQfQGaJZzEF7BMtbQDylQvLrSzGmaQet27sF1hbbDaqgGIlW4qWpG0b2ujV
 OcfA0Mv1VVA7NYyZ/6F7dv8vQJMSH+o9J+Rsny4U4yeHWGHjJN7eOi236aNHdR44Cikr
 ZSxw==
X-Gm-Message-State: AOAM5329L1pfEE2+me26WFPaLSf2V9doZ0t1FKuOJhfUygChP5ckktAt
 rnRCwp9wHG+PGvHRggZOHX0=
X-Google-Smtp-Source: ABdhPJz8ZT9IqU+wtfbrOXL+B3JrzFSM+Jqh+Cc+c2Mi1XuR1K1aT8v1QkfGUTsrsUzG/NrzrDIviQ==
X-Received: by 2002:a2e:b4f3:: with SMTP id s19mr4036487ljm.196.1604934305938; 
 Mon, 09 Nov 2020 07:05:05 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id w12sm2216805ljo.67.2020.11.09.07.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 07:05:05 -0800 (PST)
Date: Mon, 9 Nov 2020 18:05:03 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 01/32] of: Fix property supplier parsing
Message-ID: <20201109150503.ijc72z76i6wjxfhx@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-2-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-2-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_100507_679168_588021C1 
X-CRM114-Status: GOOD (  28.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 07, 2020 at 05:13:49PM +0900, Damien Le Moal wrote:
> The DesignWare GPIO driver gpio-dwapb ("snps,dw-apb-gpio" or
> "apm,xgene-gpio-v2" compatible string) defines the property
> "snps,nr-gpios" for the user to specify the number of GPIOs available
> on a port. The "-gpios" suffix of this property name ends up being
> interpreted as a cell reference when properties are parsed in
> of_link_to_suppliers(), leading to error messages such as:
> 
> OF: /soc/bus@50200000/gpio-controller@50200000/gpio-port@0: could not
> find phandle
> 
> Fix this by manually defining a parse_gpios() function which ignores
> this property, skipping the search for the supplier and thus avoiding
> the device tree parsing error.

That's why I have introduced the "ngpios" property support and marked the 
"snps,nr-gpios" as deprecated here:
https://lkml.org/lkml/2020/7/22/1298

to encourage the later one from being used in favor of the first one. So I
suggest for you to convert your dts'es (if you have ones) to using the
"ngpios" property anyway.

> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/of/property.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 408a7b5f06a9..d16111c0d6da 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
>  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
>  
>  static struct device_node *parse_iommu_maps(struct device_node *np,
>  					    const char *prop_name, int index)
> @@ -1319,6 +1318,22 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
>  	return of_parse_phandle(np, prop_name, (index * 4) + 1);
>  }
>  

> +static struct device_node *parse_gpios(struct device_node *np,
> +				       const char *prop_name, int index)
> +{
> +	/*
> +	 * Quirck for the DesignWare gpio-dwapb GPIO driver which defines
           ^
           |
           Quirk?     
> +	 * the "snps,nr-gpios" property to indicate the total number of GPIOs
> +	 * available. As this conflict with "xx-gpios" reference properties,
> +	 * ignore it.
> +	 */
> +	if (strcmp(prop_name, "snps,nr-gpios") == 0)
> +		return NULL;
> +
> +	return parse_suffix_prop_cells(np, prop_name, index,
> +				       "-gpios", "#gpio-cells");
> +}
> +

Personally I'd prefer to convert all the dts-es to using the "ngpios' instead of
the vendor-specific property. That's why I haven't fixed the problem the way you
suggest in the first place, to encourage people to send the patches with such
fixes. Anyway it's up to the OF-subsystem maintainers to decide whether to accept
this quirk.

-Sergey

>  static const struct supplier_bindings of_supplier_bindings[] = {
>  	{ .parse_prop = parse_clocks, },
>  	{ .parse_prop = parse_interconnects, },
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
