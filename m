Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBAACA5FC1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZHZY9xBDWq1Zd5ukdRJgIiGZKo46W5sBc0lmK0PNOc=; b=Ir6epT+Xkp96b9
	8CQC+qo3nrE2CCEAv0u6LknBzqhl1ZPRsYeG9wBJCIRRbosvGlcJzUqepLpd0EmgOQydOUG1cp9/d
	ouUL5wRuK0TU77hYSPNsGQXMcSKnafGudMd8wkxFZU7jAkzKgiuV3uExa+95bRays7IEfKbsEbT5q
	euygrEo0eTVOE4jZq7rJSGGsz63ky9d6868CF1G/2FU8ekMikUavg/rp2cSVD0v8qVfz1IFHLHZdE
	q8aAur7iXGmSCHrCBRHSmW9XFt0kJx0qxLkWFM2Ag1ZMJ7onFwouXLqiHgSy+gdLnURhU5Fycl9Y/
	ooSoQBS5iSml/Cz+fPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqsf-00000005btS-3xqg;
	Wed, 30 Sep 2026 09:45:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqse-00000005btL-3ldi
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 09:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LgbFwFf3kyX27WOpLMv6Xb6CpV1FPVf/xdu8hGwwUVg=; b=PhnvhNnxT8qGzcITizMxGuME/J
	cllfAtHk7hxXMD7UYoxt/yt2R0TUBeBbmlxRSc511LlnlRRg4ahxOLwucRJ5ZNqaZpckEyta5M8hU
	GQ7FJk8ckoTqqrs705FfosbmNeKgE99euDwHhjI8TIJexsQ7PWb7JvJqjDhql6+DjA5vL9y7mIS3N
	+AFeE1+LL8OtyL3d68NAGmW7DUCvmygaIlW/s6bJ3Bb6sdrh9a1oO87YwLBlOJNGal5mFeOof4oZ2
	5HmApmg6/jF1W6b20/haUI8zJJe+Goz3zdWO8cFGMkJX1BEL0PzfgiMkRcjZnusLuJYmt67XqJN+u
	gbBz7K1w==;
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBqsV-00000003bF5-2ZJ2
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 09:45:39 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b042e00f7so49624f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 02:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790761528; x=1791366328; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LgbFwFf3kyX27WOpLMv6Xb6CpV1FPVf/xdu8hGwwUVg=;
        b=YN60LVR29Pvhi5qnU3sk7M95WCw38kxx3yuKTxanltUjM0ptegAp0/GIp0AIEQvKD0
         bD+R7zloGx0G0HVFeR/QKlf1lLpJbEtB0/ktV/W6Gmx5AtFY+PW34hEHOWaUrLSuEb4z
         ejeJ9NysyTISnCj+c3YFEbHbGaIKJJRY2lM74YVIYJkIDCGeV25V85kT69oWSYU0JH7l
         U81uSDjB1/X/dgF8EZUG87EQ505YOK9CVcK8HIkI1nVPYGEP5MCihmb7pxBlDW2V/QEL
         UZiO/28VMQQlEw5PsBUeYgOWK7OOqXB4h51+cQUhFgdkpwJe7ovEHrl0K23fFlhnjk+X
         E+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761528; x=1791366328;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgbFwFf3kyX27WOpLMv6Xb6CpV1FPVf/xdu8hGwwUVg=;
        b=y1bYh5Z7cjP0oAsLbS7SBEvnECt4K+lcpgo2+u7LJE8oDvFdVHBssxu85zpycUVsIF
         M3YYlcHldRjB6wd5fPWYCaRIt8Utk6anrjCq39cVyk7sGE3liEgQPyyaxsoCsPBLSc+v
         6dg8iJ3ZuFtATTPa5xDH4uFK52HoJ6IELozLY7R16eqgdKWZg2BBi40aR/770FqnFf6m
         DiCtM9jPxGQGyHrVLlpGaNp59j+RYCJMRoiTIh62sl98iCTO/91qBBnnK3/gqEJLMDJ1
         wMEr51DdV2wchjgTb4oWO79tRK22bwni7gkuoMk1uLvldXGYu6LizdQpjG/4UbCQGYtF
         PlMw==
X-Forwarded-Encrypted: i=1; AKwUvBzIJpaN7qjpSpcTg9pD33X99eI5mXl8Ibtzd+HvD/NVrSiGrYfcm+6pOBwwa/zDL3mEMAx+hEpPl+fA/g==@lists.infradead.org
X-Gm-Message-State: AFq9FYLfojRmGfZq7c5NLNixc76t6Qa+lrr+aykKUmceEUlcfAvDVqJi
	lx+JS2YMexRtkvHX1v9KAXvCgYPAiJq5E6pS6TJnmdkcrJU8zSMdUeXc2GW5NLBth1c=
X-Gm-Gg: AYBFou3kCa756hNtexkT4G9vRvDBDK02XhddAY0HkIxlrsLT7oUMcqHm6BrZmt6dXMH
	jln+wU1+9B7ltzlZqLg1pLQo11Y42yt6Hgg6v3OX4uXqX2sj7xCqIJxZTfXhkLGTsvZrLZQ2+WM
	5MN2VHCFuAKa2nICxkwxTgihCAE1nV2wHtzF3bfrzBIjxjFKslPW0v3HVaWdMjH0u5Lw6N/cn8C
	F22QjBD+tOXIzzCwdMHo/7hoi8mqGTmjw9nQpfdAbyN5VuXbDNswQmx2WxZ7Ob4/FuKcCM1WXSn
	rkXKh3VUJuCTWKclHUuOFfUIG1lGzoMzcZSskXWQyUl43VFUY3LtX4q7Imp6kKzY1Cnr32EG/+C
	4W03C6D/IO2RO6tcMgwuBKU9DwoG7yhHho5ry5BOudcX9v/oxrFeKrCGfhY4Ke+sZOoZq/mr/xP
	K4DFbUIFA9VfqtQYcOoCHrTjqPEgiVzGex32H0QMDy2Ynhjm9yXy0it4EpvqacAmGFUDI19T4K9
	xbYTvtgxWOL1PWf4xSMiLyvwumT
X-Received: by 2002:a05:6000:388:b0:488:83fc:a7d1 with SMTP id ffacd0b85a97d-48b024bc1b2mr2035063f8f.9.1790761526270;
        Wed, 30 Sep 2026 02:45:26 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949a4fsm2230406f8f.3.2026.09.30.02.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:45:25 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/8] clk: starfive: Add peripheral-0 domain PLL
 clock driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Alexey Charkov <alchark@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260828095608.19955-4-changhuang.liang@starfivetech.com>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-4-changhuang.liang@starfivetech.com>
Date: Wed, 30 Sep 2026 11:45:24 +0200
Message-Id: <179076152492.1471718.9285719072832956935.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3887; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9n/49c355Yjo7co7RhyMpSztpBFoVYDbvsKmMO9oZlo=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl7bpnekiyczmTo6/bg+JMI3hmqZyqUAyV2f75axaLrf
 kni5dySjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkhRPDPwXFj7m36+u+zFmf
 u5Gl2p5/z99LXE+fHP27rEequVUiYCPDX/F/Oo9VXMwfmix5t/jg08xHCe7H5ly8afSKceqPPfp
 6W5gB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_104533_358396_FBFE80CB 
X-CRM114-Status: GOOD (  26.18  )
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

On 2026-08-28 02:56 -0700, Changhuang Liang wrote:
> Add peripheral-0 domain PLL clock driver support for StarFive JHB100
> SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clk/starfive/clk-starfive-jhb100-pll.c    | 60 +++++++++++++++----
>  1 file changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> index e23365164497..f6ebaaf5aa18 100644
> --- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> @@ -30,6 +30,9 @@
>  #define JHB100_PLL4_OFFSET		0x18
>  #define JHB100_PLL5_OFFSET		0x24
>  
> +/* Peripheral-0 domain PLL */
> +#define JHB100_PLL6_OFFSET		0x00
> +
>  #define JHB100_PLL_CFG0_OFFSET		0x0
>  #define JHB100_PLL_CFG1_OFFSET		0x4
>  #define JHB100_PLL_CFG2_OFFSET		0x8
> @@ -417,16 +420,21 @@ static int jhb100_pll_probe(struct platform_device *pdev)
>  	unsigned int idx;
>  	int ret;
>  
> -	id = platform_get_device_id(pdev);
> -	if (!id)
> -		return dev_err_probe(dev, -EINVAL, "no match data\n");
> -
> -	/*
> -	 * Instantiated as an MFD cell of the sys0 system controller,
> -	 * which owns the DT node describing the PLL registers.
> -	 */
> -	match_data = (const struct jhb100_pll_match_data *)id->driver_data;
> -	np = dev_of_node(dev->parent);
> +	match_data = device_get_match_data(dev);
> +	if (match_data) {
> +		np = dev_of_node(dev);
> +	} else {
> +		id = platform_get_device_id(pdev);
> +		if (!id)
> +			return dev_err_probe(dev, -EINVAL, "no match data\n");
> +
> +		/*
> +		 * Instantiated as an MFD cell of the sys0 system controller,
> +		 * which owns the DT node describing the PLL registers.
> +		 */
> +		match_data = (const struct jhb100_pll_match_data *)id->driver_data;
> +		np = dev_of_node(dev->parent);
> +	}

This is quite ugly.

It looks like your PLL is a building block you'll be re-using.
Just make a module out it and re-use it is different platform drivers rather
than trying to fit all your devices in the same platform driver.

>  
>  	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pll, match_data->num_pll),
>  			    GFP_KERNEL);
> @@ -504,6 +512,28 @@ static const struct jhb100_pll_match_data jhb100_sys0_pll = {
>  	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
>  };
>  
> +static const struct jhb100_pll_preset jhb100_pll6_presets[] = {
> +	{
> +		.freq = 2400000000,
> +		.fbdiv = 192,
> +		.frac = 0,
> +		.refdiv = 1,
> +		.postdiv = 0,
> +		.foutpostdiv_en = 1,
> +		.foutvcop_en = 0,
> +	},
> +};
> +
> +static const struct jhb100_pll_info jhb100_per0_pll_info[] = {
> +	JHB100_PLL(JHB100_PER0PLL_PLL6_OUT, "pll6_out", jhb100_pll6_presets,
> +		   ARRAY_SIZE(jhb100_pll6_presets), JHB100_PLL6_OFFSET, false),
> +};
> +
> +static const struct jhb100_pll_match_data jhb100_per0_pll = {
> +	.pll_info = jhb100_per0_pll_info,
> +	.num_pll = ARRAY_SIZE(jhb100_per0_pll_info),
> +};
> +
>  static const struct platform_device_id jhb100_pll_ids[] = {
>  	{
>  		.name = "jhb100-sys0-pll",
> @@ -513,11 +543,21 @@ static const struct platform_device_id jhb100_pll_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(platform, jhb100_pll_ids);
>  
> +static const struct of_device_id jhb100_pll_match[] = {
> +	{
> +		.compatible = "starfive,jhb100-per0-syscon",
> +		.data = &jhb100_per0_pll,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jhb100_pll_match);
> +
>  static struct platform_driver jhb100_pll_driver = {
>  	.probe = jhb100_pll_probe,
>  	.id_table = jhb100_pll_ids,
>  	.driver = {
>  		.name = "clk-starfive-jhb100-pll",
> +		.of_match_table = jhb100_pll_match,
>  		.suppress_bind_attrs = true,
>  	},
>  };
> -- 
> 2.25.1
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
