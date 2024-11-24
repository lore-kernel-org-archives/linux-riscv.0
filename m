Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDE9E668B9
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Nov 2024 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CdiGL1Re/cDI2rny8FPANdDWMlZ5VKRN1GOL9/67D8=; b=PlNuAiNhO/i99G
	HSFriDyGpkZFV2AgBGaCzryztY1UdWqMO22UNlXC0MmgoIGhqtQyb0fGnNBTsfpz1uB3iWC3QHbDw
	3HrYG4r8rAC+jeqGwyPy1OwkAu71AlzKy/maEmNUJlSHQy53zAY7D9fkr+vVXEiWm3IHKLfe/sYYV
	bsCGYKNiAbUNGKe75cOWCRwS/I5cUrFYe42I4w/A3/XUjhkgP9rlI/d3KmMU3zXYngwbFt61rVbAK
	mzoxP6HxMUsFIz6zihx9mRKKS+aXNG79fcGM5l2tiGXwvc4qKltpgUWriOTnLxAk6D2uPCbpK0F3S
	UVklluSUxxFMzJYKQNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFEb7-00000006GGL-2XSO;
	Sun, 24 Nov 2024 15:32:29 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFEb5-00000006GF7-0hU1
	for linux-riscv@lists.infradead.org;
	Sun, 24 Nov 2024 15:32:28 +0000
Date: Sun, 24 Nov 2024 23:32:13 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <20241124153213-GYA3212048@gentoo>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
 <20241112-k1-i2c-master-v3-2-5005b70dc208@gmail.com>
 <20241114064943-GYA998060@gentoo>
 <46a81098-3092-44a0-a625-bd17b4ba0e2b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46a81098-3092-44a0-a625-bd17b4ba0e2b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_073227_237158_4C6BAA5F 
X-CRM114-Status: GOOD (  23.61  )
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

Hi Troy:

On 12:11 Thu 21 Nov     , Troy Mitchell wrote:
> Hi, Yixun. thanks for ur review.
> 
> On 2024/11/14 14:49, Yixun Lan wrote:
> > On 11:07 Tue 12 Nov     , Troy Mitchell wrote:
> >> From: Troy Mitchell <troymitchell988@gmail.com>
> >>
> >> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> >> utilizing interrupts for transfers.
> >>
> >> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> >> and basic I2C read/write operations have been confirmed to work.
> >>
> >> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> >> ---
> >>  drivers/i2c/busses/Kconfig  |  19 ++
> >>  drivers/i2c/busses/Makefile |   1 +
> >>  drivers/i2c/busses/i2c-k1.c | 656 ++++++++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 676 insertions(+)
> >>
...
> >> +
> >> +static int spacemit_i2c_probe(struct platform_device *pdev)
> >> +{
> >> +	struct spacemit_i2c_dev *i2c;
> >> +	struct device_node *of_node = pdev->dev.of_node;
> >> +	struct clk *clk;
> >> +	int ret = 0;
> >> +
> >> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> >> +	if (!i2c)
> >> +		return -ENOMEM;
> >> +
> >> +	i2c->dev = &pdev->dev;
> >> +
> >> +	i2c->base = devm_platform_ioremap_resource(pdev, 0);
> >> +	if (IS_ERR(i2c->base))
> >> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->base), "failed to do ioremap");
> >> +
> >> +	i2c->irq = platform_get_irq(pdev, 0);
> >> +	if (i2c->irq < 0)
> >> +		return dev_err_probe(&pdev->dev, i2c->irq, "failed to get irq resource");
> >> +
> >> +	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> >> +			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
> >> +	if (ret)
> >> +		return dev_err_probe(&pdev->dev, ret, "failed to request irq");
> >> +
> >> +	disable_irq(i2c->irq);
> >> +
> >> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
> >> +	if (IS_ERR(clk))
> >> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to enable clock");
> >> +
> > I'd suggest also to handle pin request here, since pinctrl driver is merged
> > 
> > https://lore.kernel.org/all/CACRpkdYnaJsKKfcdhHeMGTTp86M+wNODzZx2e=OYbxQ4Jc4Rjw@mail.gmail.com/
> sry, I don't understand what pin I need to request?
> > 

I was suggesting to add devm_pinctrl_get(), but after checking,
this is not needed anymore since it's already handled by device core,
so no need to change here..

check drivers/core/pinctrl.c -> pinctrl_bind_pins()

> >> +	i2c_set_adapdata(&i2c->adapt, i2c);
> >> +	i2c->adapt.owner = THIS_MODULE;
> >> +	i2c->adapt.algo = &spacemit_i2c_algo;
> >> +	i2c->adapt.dev.parent = i2c->dev;
> >> +	i2c->adapt.nr = pdev->id;
> >> +
> >> +	i2c->adapt.dev.of_node = of_node;
> >> +	i2c->adapt.algo_data = i2c;
> >> +
> >> +	strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
> >> +
> >> +	init_completion(&i2c->complete);
> >> +
> >> +	ret = i2c_add_numbered_adapter(&i2c->adapt);
> >> +	if (ret)
> >> +		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
> >> +
> >> +	platform_set_drvdata(pdev, i2c);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void spacemit_i2c_remove(struct platform_device *pdev)
> >> +{
> >> +	struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
> >> +
> >> +	i2c_del_adapter(&i2c->adapt);
> >> +}
> >> +
> >> +static const struct of_device_id spacemit_i2c_of_match[] = {
> >> +	{ .compatible = "spacemit,k1-i2c", },
> >> +	{ /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
> >> +
> >> +static struct platform_driver spacemit_i2c_driver = {
> >> +	.probe = spacemit_i2c_probe,
> >> +	.remove = spacemit_i2c_remove,
> >> +	.driver = {
> >> +		.name = "i2c-k1",
> >> +		.of_match_table = spacemit_i2c_of_match,
> >> +	},
> >> +};
> >> +module_platform_driver(spacemit_i2c_driver);
> >> +
> >> +MODULE_LICENSE("GPL");
> >> +MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");
> >>
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> -- 
> Troy Mitchell

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
