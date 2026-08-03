Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A29C55184
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SO3Bs5GRUvyIrUyT8JP9B0YacO2bCPf134JsUNbJ2dk=; b=Oh7/6pB+/Xo37+
	cinmms1kMKK7xxhAGcOQ8pch9DprkpVebidrFSA6PVsbMPtQLdnjLzzbDfUu9y31UwNGcq///az7i
	YYc/Mjt5wIzc5zNwHGKZzNF0WfJ3ktzFgCsF2NVBVj1/otlzMlWMA7RMmR6NHmTJT2RyqEajONkVb
	IXD2fejN+tpHYQ5dPupG/rEU/TxLzYGWDIy2nVKs3gZY6PWLttUyDpn5ARlY6NNpNydbj46nuCfso
	d0M9w/ETvsIvTRc/TcVz/HMWHMbJ0oSVCLxdfQTV5RAjk8oEaeofIeQMkK/V7cPSHdjpIRmNAkej9
	CmsjoVVm0zbLWFfqSPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquad-0000000HWyF-29Si;
	Mon, 03 Aug 2026 15:28:31 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquaa-0000000HWxs-27HU
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 15:28:30 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 69855200425;
	Mon, 03 Aug 2026 17:28:22 +0200 (CEST)
Message-ID: <a4a807f1f0a4ea49feb0a3f39474ad0cb0b2ec49.camel@pengutronix.de>
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
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
Date: Mon, 03 Aug 2026 17:28:22 +0200
In-Reply-To: <20260801072711.153217-5-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
	 <20260801072711.153217-5-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_082828_686762_E06AB9F7 
X-CRM114-Status: GOOD (  15.97  )
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

On Sa, 2026-08-01 at 00:26 -0700, Changhuang Liang wrote:
> Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
> 
> Simultaneously add a generic pinctrl driver framework for registering
> the pinctrl of other domains (sys1, sys2, and so on) in the JHB100 SoC.
> 
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |    9 +
>  drivers/pinctrl/starfive/Kconfig              |   20 +
>  drivers/pinctrl/starfive/Makefile             |    3 +
>  .../starfive/pinctrl-starfive-jhb100-sys0.c   |  119 ++
>  .../starfive/pinctrl-starfive-jhb100.c        | 1456 +++++++++++++++++
>  .../starfive/pinctrl-starfive-jhb100.h        |  159 ++
>  6 files changed, 1766 insertions(+)
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
> 
[...]
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
> new file mode 100644
> index 000000000000..ed23c0c43960
> --- /dev/null
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
> @@ -0,0 +1,119 @@
[...]
> +int jhb100_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_irq_chip *girq;
> +	const struct jhb100_pinctrl_domain_info *info;
> +	struct jhb100_pinctrl *sfp;
> +	struct pinctrl_desc *jhb100_pinctrl_desc;
> +	const struct starfive_pinctrl_regs *pinctrl_regs;
> +	struct reset_control *rst;
> +	struct clk *clk;
> +	int ret;
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

The dt-binding specifies a single reset control. Why does this use the
array API?

Using devm_reset_control_get_optional_shared_deasserted() could
simplify this a little bit.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
