Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E967C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 20:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fabn8ju008YH93F+Lkr/R/RLHlWtJ0tmSs4eERiVvG4=; b=1fhkNA2Q1nLyQu
	NsmYoYi5oL4acfMGUS59iQ48MDXdWcGaO30Lje5g8H1yVgJoq/a1UDgsqN+zMtLxmKo30cO5qxGk6
	NnMQA1JlJqq00jbfZSqWr4PJq/9zkM5cI52lCPHFddJSVlYg/eAPktB8OEqdujRY1ox2sx5ZkP7Nf
	DwFagXcdMDUnMh1J/rfQOV67LR0RmSqqxcC1R2xNfICBJ5qEfpE39HQUMpcHLjs3vsgBuTrFttIIg
	YBLC4qu4SXcIsRmJC1BKBeJNwH7q4napFXP/GgINVtVDhkjAFHFHeOtJYXROPdJ5A/M946UnA7o8B
	3rVS1ZyYNxTRlgA6Nuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigI0-0000000Ccze-31dz;
	Thu, 13 Feb 2025 20:58:28 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigHy-0000000Ccxe-019W
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 20:58:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26DE544300;
	Thu, 13 Feb 2025 20:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739480301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LWJiM1NFkSJ0D7UA78bKmM5hHyORgZQGH37a4foanvg=;
	b=b67JlGuCv3yJdSsndGs/nZkpiGYuhphZ7pGjGTTiU7QbULpqySbNoRzg6g/b9mZ1plFOF9
	iiSZCrQdbFnpB39cmPO+F25DJft8U343DgI8Rp5buSMRtiJDyv+2Cxd/XgYqn2cWjJPgFJ
	cbbmdxOCqfxm5uFQGc0r3of/Jxg+b7/k7I4Ow5NUa+dwlGGHRRsAyC22uq4bYsXrPeoPk7
	GLv4a9o2UjkuisxIFWbePEjQt90HCmYnc3Ov9dMhxNc7QrgjvzUcIJx5DdO4N4xq6ixznu
	mMacCfwcvgU1jVo/6m5aRFthKxWbyrTIFO4XJxPXHv6rOrPYV65LnXxpLlMbzQ==
Date: Thu, 13 Feb 2025 21:58:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, inochiama@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	dlan@gentoo.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] rtc: sophgo: add rtc support for Sophgo CV1800
 SoC
Message-ID: <20250213205818f14edd30@mail.local>
References: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
 <20250213184622.2099324-3-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213184622.2099324-3-alexander.sverdlin@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhor
 hhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehqihhujhhinhhgsggrohdrughlmhhusehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhnohgthhhirghmrgesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkihdoughtsehlihhnrghrohdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_125826_175690_8D795899 
X-CRM114-Status: GOOD (  15.21  )
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

On 13/02/2025 19:46:15+0100, Alexander Sverdlin wrote:
> +static int cv1800_rtc_probe(struct platform_device *pdev)
> +{
> +	struct cv1800_rtc_priv *rtc;
> +	u32 ctrl_val;
> +	void __iomem *base;
> +	int ret;
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	rtc->rtc_map = devm_regmap_init_mmio(&pdev->dev, base,
> +					     &cv1800_rtc_regmap_config);
> +	if (IS_ERR(rtc->rtc_map))
> +		return PTR_ERR(rtc->rtc_map);
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0)
> +		return rtc->irq;
> +
> +	rtc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(rtc->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
> +				     "clk not found\n");
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtc->rtc_dev))
> +		return PTR_ERR(rtc->rtc_dev);
> +
> +	rtc->rtc_dev->ops = &cv1800_rtc_ops;
> +	rtc->rtc_dev->range_max = U32_MAX;
> +
> +	ret = devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler,
> +			       IRQF_TRIGGER_HIGH, "rtc alarm", rtc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "cannot register interrupt handler\n");
> +
> +	rtc_enable_sec_counter(rtc);

Really, this must be avoided, this loses precious information and
changing it later will break users. What must be done is to check
whether the RTC is started in .read_time if this is not the case, return
-EINVAL instead of an invalid date/time.
The RTC must be started once the time is set for the first time. This
ensures we can detect when the time is invalid.


> +
> +	return devm_rtc_register_device(rtc->rtc_dev);
> +}
> +
> +static const struct of_device_id cv1800_dt_ids[] = {
> +	{ .compatible = "sophgo,cv1800-rtc" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_dt_ids);
> +
> +static struct platform_driver cv1800_rtc_driver = {
> +	.driver = {
> +		.name = "sophgo-cv1800-rtc",
> +		.of_match_table = cv1800_dt_ids,
> +	},
> +	.probe = cv1800_rtc_probe,
> +};
> +
> +module_platform_driver(cv1800_rtc_driver);
> +MODULE_AUTHOR("Jingbao Qiu");
> +MODULE_DESCRIPTION("Sophgo cv1800 RTC Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.48.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
