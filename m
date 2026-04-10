Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A546E9905C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xg827OTrz4iE/BABFy9yaWYYWXtgjyTtYDpG6YwntL0=; b=3gs54pG+xQl3p6
	yX6T5+2vVEgf98/17xdtAcV65IUDf7AHmtD3QxqhAcEfuA7qPaCZ4vuHpFJo7wDxj3NusaKVXoHfQ
	zHV0iVo/tL2EyTiHBLmPLRS7aByB9IzVeT+cwk5oM+bNoU6BQMDMo/Daay+mtbJml0oUZg0UeOUPj
	3hjQDj9NQ+xfHq5IPvImMgbu6vPzt+otcDkaqtFJ6zJOOfVtTmM1EFi5p4P9bOoHK6PtFHV82OnON
	HnyYB+wlHykdGOZ8sSlxFPH292gK575CWkHlRafxFHPN4WV+7hz8eWyO3dl9UF01PoyKQGoD/9pwq
	eBdDKGWB1qfcL5KMdDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB89M-0000000BubD-2dHd;
	Fri, 10 Apr 2026 09:27:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB89K-0000000Buat-1PfS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 09:27:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wB894-00024B-BF; Fri, 10 Apr 2026 11:27:22 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wB892-004fJl-2Z;
	Fri, 10 Apr 2026 11:27:20 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wB892-000000005x8-3035;
	Fri, 10 Apr 2026 11:27:20 +0200
Message-ID: <631d4d65fdbda29cfbc0b96987b5f56fcd5116ea.camel@pengutronix.de>
Subject: Re: [PATCH v1 3/5] irqchip: starfive: Use devm_ interfaces to
 simplify resource release
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>
Date: Fri, 10 Apr 2026 11:27:20 +0200
In-Reply-To: <20260410090106.622781-4-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
	 <20260410090106.622781-4-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_022738_397267_76DFF434 
X-CRM114-Status: GOOD (  13.60  )
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

On Fr, 2026-04-10 at 02:01 -0700, Changhuang Liang wrote:
> Use devm_ interfaces to simplify resource release. Make clock and reset
> get optional as they are not used on the JHB100 SoC. Replace pr_ logging
> with dev_* logging.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/irqchip/irq-starfive-jhb100-intc.c | 44 ++++++++--------------
>  1 file changed, 15 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
> index 2c9cdad7f377..312a4634870a 100644
> --- a/drivers/irqchip/irq-starfive-jhb100-intc.c
> +++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
[...]
> @@ -127,48 +125,44 @@ static int starfive_intc_probe(struct platform_device *pdev, struct device_node
>  	if (!irqc)
>  		return -ENOMEM;
>  
> -	irqc->base = of_iomap(intc, 0);
> +	irqc->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (!irqc->base) {
> -		pr_err("Unable to map registers\n");
> +		dev_err(&pdev->dev, "unable to map registers\n");
>  		ret = -ENXIO;
>  		goto err_free;
>  	}
>  
> -	rst = of_reset_control_get_exclusive(intc, NULL);
> +	rst = devm_reset_control_get_optional(&pdev->dev, NULL);

Please use devm_reset_control_get_optional_exclusive() directly.

>  	if (IS_ERR(rst)) {
> -		pr_err("Unable to get reset control %pe\n", rst);
> +		dev_err(&pdev->dev, "Unable to get reset control %pe\n", rst);

Consider using dev_err_probe() to stop printing -EPROBE_DEFER.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
