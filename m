Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93632C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 21:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yt8HSLNYk85d8wan0wC2XQ7ZeU9DCPVGb5wyixqm8qo=; b=Ot9+mizoF64v56
	NkGm14L2s5Gonf57lCpkrOagSa/4hhwI6iSDLL1CM6UaloOj+sKYaSqIudcYRVNJlqjf3b8eTF+ae
	ZShABzdyTwiaea7lLBah5qdQuhbeAfalOBdE9RutmYavT7gk1+p5E8+61wPEO6KMOO/Du364wOyNy
	RGHT2gfB1wHQUqOuLQvVVqFECMav91VZgJp8ge9QXavl1BIrU6Ofl7rM4BRNPLiH70gGW+GyHZ0Fu
	aHUUWv0mIEj337mjfDO5Ro2RWOiQ4yes6zrOCloYs3nS8wftWQCTH/DYI01YNrDtuo4DcIt2yepcU
	foloX99XHPEyYYbEuyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr4RV-00Ft4A-Pn; Tue, 17 May 2022 21:09:21 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr4RR-00Ft1X-KJ
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 21:09:20 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B921E240003;
 Tue, 17 May 2022 21:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652821751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4X0RThNZxtIdbfYHNEBRnxF0Yn3t5Yg/fIL7z0LUq1k=;
 b=Kw37BgzduEUeCEtlDU3OFs5YdMk0lvNTTZwRFRUpLg7h7hyTe7ZpI6ACJ/GpabFbiiN/JL
 jzMLbuNfs/Ds9ZW44fXyg3AEaPjtQ7k+NApU2CCjcREfzAk+ujwfwz6zVHLTB7qZunt3kL
 6ItRvBX8bgC5kBa74qnrwazeRYUFNWksJt4fzzkBH0hLXpOJ/B/2d/P54JbaimIJ5Dh8V1
 9wMgJ+kGIUGFEaon43qC5Nwqt3kz3H5zZUTYvPl5+WBzJ78Tz4CKmf++nvaWDz4y/cG2sh
 qal+2nPLsy79cymLNK9ZLdhzz3+lYkAK8Nw/+j3nr+rVsDyFg7m/3vAJ9GwMeg==
Date: Tue, 17 May 2022 23:09:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: a.zummo@towertech.it, daire.mcnamara@microchip.com,
 lewis.hanly@microchip.com, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/2] rtc: Add driver for Microchip PolarFire SoC
Message-ID: <YoQO9or6g2r3EU8w@mail.local>
References: <20220516082838.3717982-1-conor.dooley@microchip.com>
 <20220516082838.3717982-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516082838.3717982-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_140918_293116_FDDE715E 
X-CRM114-Status: GOOD (  19.67  )
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

Hello,

On 16/05/2022 09:28:38+0100, Conor Dooley wrote:
> +struct mpfs_rtc_dev {
> +	struct rtc_device *rtc;
> +	void __iomem *base;
> +	int wakeup_irq;

I believe this is only used in .probe so you make it local to this
function.

> +};
> +


> +static int mpfs_rtc_readtime(struct device *dev, struct rtc_time *tm)
> +{
> +	struct mpfs_rtc_dev *rtcdev = dev_get_drvdata(dev);
> +	u64 time;
> +
> +	time = ((u64)readl(rtcdev->base + DATETIME_UPPER_REG) & DATETIME_UPPER_MASK) << 32;
> +	time |= readl(rtcdev->base + DATETIME_LOWER_REG);

Are the registers properly latched on a DATETIME_UPPER_REG read?

> +	rtc_time64_to_tm(time + rtcdev->rtc->range_min, tm);

range_min is never set so it will end up being 0. I guess you can avoid
a bunch of arithmetic in all the driver. Offsetting will happen in the
core which will probably never happen anyway because the max year is
141338. I guess we will all be gone by then ;)

> +
> +	return 0;
> +}
> +

> +static int mpfs_rtc_probe(struct platform_device *pdev)
> +{
> +	struct mpfs_rtc_dev *rtcdev;
> +	struct clk *clk;
> +	u32 prescaler;
> +	int ret;
> +
> +	rtcdev = devm_kzalloc(&pdev->dev, sizeof(struct mpfs_rtc_dev), GFP_KERNEL);
> +	if (!rtcdev)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rtcdev);
> +
> +	rtcdev->rtc = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtcdev->rtc))
> +		return PTR_ERR(rtcdev->rtc);
> +
> +	rtcdev->rtc->ops = &mpfs_rtc_ops;
> +
> +	/* range is capped by alarm max, lower reg is 31:0 & upper is 10:0 */
> +	rtcdev->rtc->range_max = GENMASK_ULL(42, 0);
> +
> +	clk = mpfs_rtc_init_clk(&pdev->dev);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	rtcdev->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rtcdev->base)) {
> +		dev_dbg(&pdev->dev, "invalid ioremap resources\n");
> +		return PTR_ERR(rtcdev->base);
> +	}
> +
> +	rtcdev->wakeup_irq = platform_get_irq(pdev, 0);
> +	if (rtcdev->wakeup_irq <= 0) {
> +		dev_dbg(&pdev->dev, "could not get wakeup irq\n");
> +		return rtcdev->wakeup_irq;
> +	}
> +	ret = devm_request_irq(&pdev->dev, rtcdev->wakeup_irq, mpfs_rtc_wakeup_irq_handler, 0,
> +			       dev_name(&pdev->dev), rtcdev);
> +	if (ret) {
> +		dev_dbg(&pdev->dev, "could not request wakeup irq\n");
> +		return ret;
> +	}
> +
> +	/* prescaler hardware adds 1 to reg value */
> +	prescaler = clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) - 1;
> +
> +	if (prescaler > MAX_PRESCALER_COUNT) {
> +		dev_dbg(&pdev->dev, "invalid prescaler %d\n", prescaler);
> +		return -EINVAL;
> +	}
> +
> +	writel(prescaler, rtcdev->base + PRESCALER_REG);
> +	dev_info(&pdev->dev, "prescaler set to: 0x%X \r\n", prescaler);
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	ret = dev_pm_set_wake_irq(&pdev->dev, rtcdev->wakeup_irq);
> +	if (ret)
> +		dev_err(&pdev->dev, "failed to enable irq wake\n");
> +
> +	return devm_rtc_register_device(rtcdev->rtc);
> +}
> +
> +static int mpfs_rtc_remove(struct platform_device *pdev)
> +{
> +	mpfs_rtc_alarm_irq_enable(&pdev->dev, 0);

This is not something you want to do if you want to wake up from
hibernate or any similar sleep state.

> +	device_init_wakeup(&pdev->dev, 0);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mpfs_rtc_of_match[] = {
> +	{ .compatible = "microchip,mpfs-rtc" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, mpfs_rtc_of_match);
> +
> +static struct platform_driver mpfs_rtc_driver = {
> +	.probe = mpfs_rtc_probe,
> +	.remove = mpfs_rtc_remove,
> +	.driver	= {
> +		.name = "mpfs_rtc",
> +		.of_match_table = mpfs_rtc_of_match,
> +	},
> +};
> +
> +module_platform_driver(mpfs_rtc_driver);
> +
> +MODULE_DESCRIPTION("Real time clock for Microchip Polarfire SoC");
> +MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.36.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
