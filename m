Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43552C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 21:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdDeHW8eOgfFIFG2C0hXpULBkztUZMtPOZ3Ydxt/GV0=; b=mWzerEjGm86NF0
	e9/ASyWgG8iiY4F5Ccr5K/BpA4/UwFtNLIwe+J1tRS2Dg614cvI5tQqjRBlj3XyXxMKtp67A7Ns6w
	sZ0e2p6EZGOJCA/7juK9QGOckrTV8MWTLieYnS+5RbynkeC5SEJn+HCQ352UyylBjtb813BcEFbwG
	KpYEJbUIvlrpln0Lxe3SRstLB81N5OH2Y9jHPtKkyniRhzGjgmisOuHFXP/gNacafDADQKPE4/WM2
	fx0hEnjstYOkJl1lRUnPfC6+1sAApRhMSCDbV8zwJ6eDpJVNeynpiTPlAqjhIXsQ/DzLgbwhzQBTk
	2zfc4eBhkcGlE4esPtZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuIEb-000000043fK-2ObY;
	Mon, 17 Mar 2025 21:42:57 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuIEZ-000000043eY-0Zvv
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 21:42:56 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d450154245so38564605ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1742247774; x=1742852574; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3xQ5zZmXUjhGDYgf9JDZwTpw40dRx5XKZ5GtTioiJg=;
        b=d8/2I0e2Sk4HSCqxMQ036T8E5TRea9LMZLytOO5QM75PLVy0XhpJ4AGV+kwMDgN+oh
         oC8R2dND6qpia0orH0T5ZZAZ/VSF6uQnOsw3IiiuMQobgHbEbAooE0erdlMRkU1/t4PK
         TS0A88DktkNqjuTuUQ9QSiGZ4q5JdDzytJKVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742247774; x=1742852574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3xQ5zZmXUjhGDYgf9JDZwTpw40dRx5XKZ5GtTioiJg=;
        b=sT5hUa3O/4oM3pXIV2mTArVPzlY3+RtDuM0WQ7ymCCumSp492EskS3NT4kQG0a/wGO
         RrntxBv9xTxZGpwKJSEU0xOw1D0/5Vh02btwUodXfdl3EAFcBcolXQfQfpw/SSE5121S
         WmB3EiNzW8qe8Q/Wz4wXrjRL/lbarVZpQ+w2SXwVa2u2yvPiZMOHDLnZYIM+Sfq5wI8S
         sGBJbnL/WQHge2sp3zmKSt4zFAjLHG98MlvGKcsZOPfPZPo6OxwOdgtXEUjmTeaL1NCy
         l+i0/op5nJV7UZe0Ga8ZaqC9QdzMh9SelGJCxIG2XZrOzilT5N8/tB7MKTNXncX703RT
         dE1w==
X-Gm-Message-State: AOJu0Yx49KPGvdKXfAmwmmwJsT9B/aRe6xCS7E2Qp0CATDc/SUY6jN6O
	zJkhGcmwPoakHi0EvnxqFGjNaqyuKYoo5Zp4iyHxM2hpKrCNi7vYle0mflQXZg==
X-Gm-Gg: ASbGncut1Zuw6WD6jPuOc8Hl3odoiLP3zSOJOemxXkrXkzXDV2dIMAt7Ah8uYb0f1+x
	WBpbh/q9XnpqQK2mXouUF0N9fI6DjzJm12rptj3gknkPlCpxqgep2f3drkNuf7Zn3Ay6TjqWlX7
	WbPb27atng+TodZNvg9QdR+DZj46RwCEZTHf4qtQR/q+1/gHvrRatK2zKSngyB0JNvLixBiX5Hx
	HSwGgdLruFU1syurX9kwHW+pYTUlVp4OW3SmnpnBCvqSuXOUke05K9yT44vAQejodutZ+SG6s06
	ROgMgrn/Bl/1CRYzP7OpMl7pDspX2K+nUNv4sM1HFnFcR1xlEsvpZRMAmWH8dEfZBkDeNlP6p/t
	4NTw=
X-Google-Smtp-Source: AGHT+IFodoEZ0iTIZiA6FhVLkShreO9KYufA0wdJJTCzNeJU0iLZRijzbSwcc1+/UDyTpRTIB0KdFg==
X-Received: by 2002:a05:6e02:12e8:b0:3d4:6f37:3748 with SMTP id e9e14a558f8ab-3d483a6ef52mr154160345ab.16.1742247773772;
        Mon, 17 Mar 2025 14:42:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4f2637faa36sm2431266173.77.2025.03.17.14.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 14:42:53 -0700 (PDT)
Message-ID: <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
Date: Mon, 17 Mar 2025 16:42:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_144255_185563_51022D7B 
X-CRM114-Status: GOOD (  29.89  )
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

On 3/16/25 2:43 AM, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

I know I said it was fine, but I'm going to reiterate two comments in
the probe function.

> ---
>   drivers/i2c/busses/Kconfig  |  17 ++
>   drivers/i2c/busses/Makefile |   1 +
>   drivers/i2c/busses/i2c-k1.c | 605 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 623 insertions(+)
> 

. . .

> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ae43dcd31e8aa480766b44be91656657c7aaaf4a
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -0,0 +1,605 @@

. . .

> +static int spacemit_i2c_probe(struct platform_device *pdev)
> +{
> +	struct clk *clk;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct spacemit_i2c_dev *i2c;
> +	int ret;
> +
> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
> +	if (ret)
> +		dev_warn(dev, "failed to read clock-frequency property\n");

If the property doesn't exist, I don't think this warrants a warning,
because it's optional.  Perhaps if a different error (something other
than -EINVAL) is returned it would warrant a warning.

> +
> +	/* For now, this driver doesn't support high-speed. */
> +	if (!i2c->clock_freq || i2c->clock_freq < 1 ||

For an unsigned value, !i2c->clock_freq is *the same as*
i2c->clock_freq < 1.  Get rid of the latter.

I'll leave it up to the maintainer to decide whether these
comments can just be ignored--my Reviewed-by is fine, even
if you don't change these.

					-Alex

> +	    i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> +		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> +			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> +		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> +	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> +		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> +			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> +		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> +	}
> +
> +	i2c->dev = &pdev->dev;
> +
> +	i2c->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c->base))
> +		return dev_err_probe(dev, PTR_ERR(i2c->base), "failed to do ioremap");
> +
> +	i2c->irq = platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0)
> +		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
> +
> +	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> +			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq");
> +
> +	clk = devm_clk_get_enabled(dev, "func");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
> +
> +	clk = devm_clk_get_enabled(dev, "bus");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
> +
> +	spacemit_i2c_reset(i2c);
> +
> +	i2c_set_adapdata(&i2c->adapt, i2c);
> +	i2c->adapt.owner = THIS_MODULE;
> +	i2c->adapt.algo = &spacemit_i2c_algo;
> +	i2c->adapt.dev.parent = i2c->dev;
> +	i2c->adapt.nr = pdev->id;
> +
> +	i2c->adapt.dev.of_node = of_node;
> +
> +	strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
> +
> +	init_completion(&i2c->complete);
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	ret = i2c_add_numbered_adapter(&i2c->adapt);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
> +
> +	return 0;
> +}
> +
> +static void spacemit_i2c_remove(struct platform_device *pdev)
> +{
> +	struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adapt);
> +}
> +
> +static const struct of_device_id spacemit_i2c_of_match[] = {
> +	{ .compatible = "spacemit,k1-i2c", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
> +
> +static struct platform_driver spacemit_i2c_driver = {
> +	.probe = spacemit_i2c_probe,
> +	.remove = spacemit_i2c_remove,
> +	.driver = {
> +		.name = "i2c-k1",
> +		.of_match_table = spacemit_i2c_of_match,
> +	},
> +};
> +module_platform_driver(spacemit_i2c_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
