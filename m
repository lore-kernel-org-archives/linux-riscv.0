Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599E4CD6E69
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKlBDSKdMG+q++YRwZJOaBTXzauO61fFMj71fEthg+0=; b=HNjEqUVA7spljJ
	qmaWTgstTbtJNera2x04rq0EcXcjAQ5r+GL5J1ySMjhfxLvQ73o74B6PQMaGbP7gXAEiOyXToE8ls
	FwYCTp99EwCMcstJHwmOTG4Raqw09pxoSfCaGonD7FAxOBYxVGyyXlfN0VavZrcMWpE14CsPkceq5
	eepSfCgAdXe3qigOzCB3ruQs8Q8i78Cw7VH0YSCiCn/sM5ZDbznL9BzYOuzFtoZXZ0v8Kz8I/S3BU
	2EMNiUOP0N+z3B/3ql0Jc2syKrWYwf2saiKxYhs5vyizOGywf0ARMGofq6OsEqfA9DXthDIwDXCzD
	ICwrnvxbQN1ggk7WV8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhAT-0000000EcZQ-3sgL;
	Wed, 03 Jun 2026 08:41:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhAM-0000000EcS7-2Sq7
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:41:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhA7-0004gW-O9; Wed, 03 Jun 2026 10:41:19 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhA3-000svg-2g;
	Wed, 03 Jun 2026 10:41:15 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhA3-000000003PW-30NA;
	Wed, 03 Jun 2026 10:41:15 +0200
Message-ID: <05c54522ba76bfc4421e6838e8ff108437f69636.camel@pengutronix.de>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Emil Renner
 Berthing	 <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou	
 <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre
 Ghiti	 <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Lianfeng
 Ouyang	 <lianfeng.ouyang@starfivetech.com>
Date: Wed, 03 Jun 2026 10:41:15 +0200
In-Reply-To: <20260603055347.66845-5-changhuang.liang@starfivetech.com>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
	 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_014134_646914_2822E32A 
X-CRM114-Status: GOOD (  15.58  )
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

On Di, 2026-06-02 at 22:53 -0700, Changhuang Liang wrote:
> Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
> 
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
[...]
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> new file mode 100644
> index 000000000000..52b97870b991
> --- /dev/null
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> @@ -0,0 +1,1607 @@
[...]
> +int jhb100_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_irq_chip *girq;
> +	const struct jhb100_pinctrl_domain_info *info;
> +	struct jhb100_pinctrl *sfp;
> +	struct pinctrl_desc *jhb100_pinctrl_desc;
> +	struct starfive_pinctrl_regs *pinctrl_regs;
> +	struct reset_control *rst;
> +	struct clk *clk;
> +	int ret;
> +	int irq;
> +
> +	info = of_device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	pinctrl_regs = info->regs;
> +
> +	sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
> +	if (!sfp)
> +		return -ENOMEM;
> +
> +	sfp->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(sfp->base))
> +		return PTR_ERR(sfp->base);
> +
> +	clk = devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "could not get & enable clock\n");
> +
> +	rst = devm_reset_control_array_get_optional_shared(dev);

Why is this shared? Are there multiple pinctrl controllers sharing
reset lines?

> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst), "could not get reset control\n");
> +
> +	/*
> +	 * we don't want to assert reset and risk undoing pin muxing for the
> +	 * early boot serial console, but let's make sure the reset line is
> +	 * deasserted in case someone runs a really minimal bootloader.
> +	 */
> +	ret = reset_control_deassert(rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "could not deassert reset\n");

Missing reset_control_assert() in .remove will unbalance the
deassertion counter if a pin controller with shared reset is
unbound/rebound, causing the reset to never be asserted again.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
