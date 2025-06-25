Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32EAC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 22:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0N7uf+epYO33rJCfxuTAT67Rz2TIYF13StkFzsIR3k=; b=2YXRs/oX0OGmB6
	91UnBrSkB6FUnLODpSC6NBqMCjA1XUTdJmvUTWrV4p2a0632U/oEOoPBL7LiFpbAHi5wIhM2DPuQI
	81mEAxwQm6hDTjubJG/UDRw8wKXDCU9JFlAH0OsxwAphogIGz3bCr3dT8u3f9wgGajUcJ5umGl/dz
	zFD5JwKjp7CGobR0/vYWNDQGjmayNdn4easW+A5QKN33Ph/AGxn2gnYX4UZ6AWSZoeKOH/dHvk3uX
	uEiHnQ2q1jSXGbQAZSOMuUJH7l+CFAN7K1CFcaYevnEwTljM3Rws/TF8E1KYL8a1tkB7Ug9fWjUXa
	1zJQSVksF/U6A1cYDIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYvz-0000000A6gB-03wz;
	Wed, 25 Jun 2025 22:49:39 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYBU-0000000A1ug-2s7L
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 22:01:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BFE44386A;
	Wed, 25 Jun 2025 22:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750888891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HKnWMQGLSwUmkBmCbW4MfLJK1vhlzOPpUC3CJuRa9WE=;
	b=I0fAPyXKU2K1hOg5G1lq/+URqNSdvClGSaTmtwEfUEA8eFoQaXiZOcfntjBCyy5ojuweU2
	dcOjcQLKIPmNX9x2YmBqnp8HEKAx98FOY/mqnkwlMrGS2RE4wpi32qQls88NhSH3nbNVVZ
	e8dvXeK9+qcI1DTj0/x28LnG6P+xVaeqsRM+vwpiblPzgkel78S+Llfwun+XiohwL5+Ro/
	m3idZtDCwpxGAPps6IPtHQ2UkPPzsaRvC2inxFA1xVbJa8o7xwSNfMAZ7fbYSaz9NY4Njs
	nYQqoXZszzRkA9uRxsQtibN5DXrV4HcM2xFn445WxriCY0QPlEN6TO4S6VBn1g==
Date: Thu, 26 Jun 2025 00:01:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] rtc: spacemit: support the SpacemiT P1 RTC
Message-ID: <202506252201262779aa6c@mail.local>
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-5-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625164119.1068842-5-elder@riscstar.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfeeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegvlhguvghrsehrihhstghsthgrrhdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgto
 hhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthdrjhhonhgtiiihkhesohdvrdhplh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_150137_340466_8F8AC4EA 
X-CRM114-Status: GOOD (  23.72  )
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

On 25/06/2025 11:41:15-0500, Alex Elder wrote:
> +/*
> + * The P1 hardware documentation states that the register values are
> + * latched to ensure a consistent time snapshot within the registers,
> + * but these are in fact unstable due to a bug in the hardware design.
> + * So we loop until we get two identical readings.
> + */
> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	struct regmap *regmap = p1->regmap;
> +	u32 count = RTC_READ_TRIES;
> +	u8 times[2][6];
> +	size_t size;
> +	u32 i = 0;
> +	u8 *time;
> +	int ret;
> +
> +	size = sizeof(times[0]);
> +	ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
> +	if (ret)
> +		return ret;
> +
> +	do {
> +		i = 1 - i;
> +		ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
> +		if (ret)
> +			return ret;
> +	} while (memcmp(times[i], times[1 - i], size) && --count);

Simply checking the seconds is enough, unless you expect regmap_bulk_read to ake
more than a minute so you don't need a two dimension array.

> +
> +	if (!count)
> +		return -EIO;
> +
> +	time = &times[0][0];
> +
> +	t->tm_sec = time[0] & GENMASK(5, 0);
> +	t->tm_min = time[1] & GENMASK(5, 0);
> +	t->tm_hour = time[2] & GENMASK(4, 0);
> +	t->tm_mday = (time[3] & GENMASK(4, 0)) + 1;
> +	t->tm_mon = time[4] & GENMASK(3, 0);
> +	t->tm_year = (time[5] & GENMASK(5, 0)) + 100;
> +
> +	return 0;
> +}
> +
> +/*
> + * The P1 hardware documentation states that values in the registers are
> + * latched so when written they represent a consistent time snapshot.
> + * Nevertheless, this is not guaranteed by the implementation, so we must
> + * disable the RTC while updating it.
> + */
> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	struct regmap *regmap = p1->regmap;
> +	u8 time[6];
> +	int ret2;
> +	int ret;
> +
> +	time[0] = t->tm_sec;
> +	time[1] = t->tm_min;
> +	time[2] = t->tm_hour;
> +	time[3] = t->tm_mday - 1;
> +	time[4] = t->tm_mon;
> +	time[5] = t->tm_year - 100;
> +
> +	/* Disable the RTC to update; re-enable again when done */
> +	ret = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
> +
Honnestly, I'd simply go for

	if (ret)
		return ret;

Here, you are trying to set the time, I'm not sure it is worth trying to
reenable the rtc while hoping the previous time has been kept.

This also shows that p1_rtc_read_time should check that RTC_EN is set, else it
knows the time has never been set and is invalid.


> +	ret2 = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, RTC_EN);
> +
> +	return ret ? : ret2;		/* Return the first error */


> +}
> +
> +static const struct rtc_class_ops p1_rtc_class_ops = {
> +	.read_time = p1_rtc_read_time,
> +	.set_time = p1_rtc_set_time,
> +};
> +
> +static int p1_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtc_device *rtc;
> +	struct p1_rtc *p1;
> +
> +	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
> +	if (!p1)
> +		return -ENOMEM;
> +	dev_set_drvdata(dev, p1);
> +
> +	p1->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!p1->regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
> +
> +	rtc = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(rtc))
> +		return dev_err_probe(dev, PTR_ERR(rtc),
> +				     "error allocating device\n");
> +	p1->rtc = rtc;
> +
> +	rtc->ops = &p1_rtc_class_ops;
> +	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	rtc->range_max = RTC_TIMESTAMP_END_2063;
> +
> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
> +
> +	return devm_rtc_register_device(rtc);
> +}
> +
> +static struct platform_driver p1_rtc_driver = {
> +	.probe = p1_rtc_probe,
> +	.driver = {
> +		.name = MOD_NAME,
> +	},
> +};
> +
> +module_platform_driver(p1_rtc_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" MOD_NAME);
> -- 
> 2.45.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
