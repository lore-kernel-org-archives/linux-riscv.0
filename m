Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368CDC83F1A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Jul 2025 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8+kBzx58/rX+BsE4o1DgUCzZSv1DpsOEuh3q/dqIQk=; b=ZV9+GKjPF1zwL7
	wFNTuKcb8Hz3cpD1RZpDUFNMpWSR62XyPvwUEKRUzQpy2D499LYWDgvP7rRWkIUEbohCSQZyBShbj
	ZHimk+m5WjTjaYs+vsEn/Y8D8HEoH893KEJJBxBnxar0sKYuxDhwbgTJw4BebCQccNW/0ECIUBOfA
	Zg+dwufH6/K+oBUOa0lztUJNgXyf2Yvnx08tAC+xtLceeFvNDxHvzVQ32RsgyZ4Auxzg96EWGHK0k
	UVX9Lwjae3UmiP2KY+G/+vWwuAN+ePN6giSmDWWW6Q0lUxinUIpmogxZwStQ+rbL0cZ9sA9F/zqE/
	oCw+OtpZc++eucK6MN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udNd2-0000000ExVk-3XGD;
	Sun, 20 Jul 2025 06:34:32 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udNd0-0000000ExVL-1vY5
	for linux-riscv@lists.infradead.org;
	Sun, 20 Jul 2025 06:34:32 +0000
Date: Sun, 20 Jul 2025 14:34:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752993255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4a6BlUCJFTdlEQ0RUAp02uN+GKSkSEWnLMZUJiFP/Xk=;
	b=JngO2yWGJIX+G68ni4+M6O1sO3WqdOl9dvW1ZsxEuDyoyBlLfX5g4CLYxGldviUuuqCvOb
	h/EoN6HmwwW/NvPOIah/8/xaWXF+/+RnoPO5OhHIuJyk6/C7cJ5UzPsTDjJSqdfvDXHXVa
	IdkWEH/vy/bP69RebiZhRlIO29plDBk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Alex Elder <elder@ieee.org>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: dwc3: add generic driver to support flattened
Message-ID: <aHyN3-uoHofF8Hg3@monica.localdomain>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
 <20250712-dwc3_generic-v6-2-cc87737cc936@linux.dev>
 <d2e9a521-568e-433d-a59b-9b98138ace2b@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2e9a521-568e-433d-a59b-9b98138ace2b@ieee.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_233431_006267_73F56222 
X-CRM114-Status: GOOD (  43.50  )
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

On Tue, Jul 15, 2025 at 03:50:54PM -0500, Alex Elder wrote:
> On 7/12/25 2:49 AM, Ze Huang wrote:
> > To support flattened dwc3 dt model and drop the glue layer, introduce the
> > `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> > and offers an alternative to the existing glue driver `dwc3-of-simple`.
> 
> I'm not familiar with dwc-of-simple.c, and won't comment on
> how this differs from that (or does not).
> 
> Given you're implementing an alternative though, can you explain
> in a little more detail what's different between the two?  Why
> would someone choose to use this driver rather than the other one?

They are basically the same.

dwc-generic use a plain dt node while dwc-of-simple will nest the dwc3
node as its child.

Both will use dwc3_core_probe() to finish the probe process. But now we
can simplify the process by just calling it, instead of calling
of_platform_populate() and create another snps,dwc3 device driver.

> 
> > 
> > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > ---
> >   drivers/usb/dwc3/Kconfig             |  11 +++
> >   drivers/usb/dwc3/Makefile            |   1 +
> >   drivers/usb/dwc3/dwc3-generic-plat.c | 182 +++++++++++++++++++++++++++++++++++
> >   3 files changed, 194 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 310d182e10b50b253d7e5a51674806e6ec442a2a..4925d15084f816d3ff92059b476ebcc799b56b51 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -189,4 +189,15 @@ config USB_DWC3_RTK
> >   	  or dual-role mode.
> >   	  Say 'Y' or 'M' if you have such device.
> > +config USB_DWC3_GENERIC_PLAT
> > +	tristate "DWC3 Generic Platform Driver"
> > +	depends on OF && COMMON_CLK
> > +	default USB_DWC3
> > +	help
> > +	  Support USB3 functionality in simple SoC integrations.
> > +	  Currently supports SpacemiT DWC USB3. Platforms using
> > +	  dwc3-of-simple can easily switch to dwc3-generic by flattening
> > +	  the dwc3 child node in the device tree.
> > +	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
> > +
> >   endif
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 830e6c9e5fe073c1f662ce34b6a4a2da34c407a2..96469e48ff9d189cc8d0b65e65424eae2158bcfe 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> >   obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
> >   obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
> >   obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> > +obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
> > diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..766f4cf17b6909793956f44660d3b3febad50a23
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> > @@ -0,0 +1,182 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * dwc3-generic-plat.c - DesignWare USB3 generic platform driver
> > + *
> > + * Copyright (C) 2025 Ze Huang <huang.ze@linux.dev>
> > + *
> > + * Inspired by dwc3-qcom.c and dwc3-of-simple.c
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +#include "glue.h"
> > +
> > +struct dwc3_generic {
> > +	struct device		*dev;
> > +	struct dwc3		dwc;
> > +	struct clk_bulk_data	*clks;
> > +	int			num_clocks;
> > +	struct reset_control	*resets;
> > +};
> > +
> > +static void dwc3_generic_reset_control_assert(void *data)
> > +{
> > +	reset_control_assert(data);
> > +}
> > +
> 
> The next function can go away.  (See below.)
> 

OK

> > +static void dwc3_generic_clk_bulk_disable_unprepare(void *data)
> > +{
> > +	struct dwc3_generic *dwc3 = data;
> > +
> > +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> > +}
> > +
> > +static int dwc3_generic_probe(struct platform_device *pdev)
> > +{
> > +	struct dwc3_probe_data probe_data = {};
> > +	struct device *dev = &pdev->dev;
> > +	struct dwc3_generic *dwc3;
> > +	struct resource *res;
> > +	int ret;
> > +
> > +	dwc3 = devm_kzalloc(dev, sizeof(*dwc3), GFP_KERNEL);
> > +	if (!dwc3)
> > +		return -ENOMEM;
> > +
> > +	dwc3->dev = dev;
> > +
> > +	platform_set_drvdata(pdev, dwc3);
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "missing memory resource\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	dwc3->resets = devm_reset_control_array_get_optional_exclusive(dev);
> > +	if (IS_ERR(dwc3->resets))
> > +		return dev_err_probe(dev, PTR_ERR(dwc3->resets), "failed to get resets\n");
> > +
> 
> It isn't enforced on exclusive resets, but I'm pretty sure
> resets are assumed to be asserted initially.
> 

I'd like to keep it. We cannot guarantee what environment was passed
in (from bootloader), right?

> > +	ret = reset_control_assert(dwc3->resets);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to assert resets\n");
> > +
> > +	ret = devm_add_action_or_reset(dev, dwc3_generic_reset_control_assert, dwc3->resets);
> > +	if (ret)
> > +		return ret;
> 
> The re-assert shouldn't be set up unless the deassert below
> succeeds.
> 

Will move behind the deassert.

> > +	usleep_range(10, 1000);
> 
> This seems like a large range.  You could just do msleep(1);
> Also, can you add a comment explaining why a delay is needed,
> and why 1 millisecond is the right amount of time to sleep?
> 

I will check the range with spacemit and reply soon.

> > +	ret = reset_control_deassert(dwc3->resets);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to deassert resets\n");
> > +
> > +	ret = devm_clk_bulk_get_all(dwc3->dev, &dwc3->clks);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> 
> Call devm_clk_bulk_get_all_enabled() instead of doing the two
> steps separately here.
> 

Will do, thanks.

> 					-Alex
> 
> > +	dwc3->num_clocks = ret;
> > +
> > +	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
> > +	if (ret)
> j> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");
> > +
> > +	ret = devm_add_action_or_reset(dev, dwc3_generic_clk_bulk_disable_unprepare, dwc3);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dwc3->dwc.dev = dev;
> > +	probe_data.dwc = &dwc3->dwc;
> > +	probe_data.res = res;
> > +	probe_data.ignore_clocks_and_resets = true;
> > +	ret = dwc3_core_probe(&probe_data);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static void dwc3_generic_remove(struct platform_device *pdev)
> > +{
> > +	struct dwc3_generic *dwc3 = platform_get_drvdata(pdev);
> > +
> > +	dwc3_core_remove(&dwc3->dwc);
> > +}
> > +
> > +static int dwc3_generic_suspend(struct device *dev)
> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = dwc3_pm_suspend(&dwc3->dwc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int dwc3_generic_resume(struct device *dev)
> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = dwc3_pm_resume(&dwc3->dwc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int dwc3_generic_runtime_suspend(struct device *dev)
> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +
> > +	return dwc3_runtime_suspend(&dwc3->dwc);
> > +}
> > +
> > +static int dwc3_generic_runtime_resume(struct device *dev)
> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +
> > +	return dwc3_runtime_resume(&dwc3->dwc);
> > +}
> > +
> > +static int dwc3_generic_runtime_idle(struct device *dev)
> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +
> > +	return dwc3_runtime_idle(&dwc3->dwc);
> > +}
> > +
> > +static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
> > +	SYSTEM_SLEEP_PM_OPS(dwc3_generic_suspend, dwc3_generic_resume)
> > +	RUNTIME_PM_OPS(dwc3_generic_runtime_suspend, dwc3_generic_runtime_resume,
> > +		       dwc3_generic_runtime_idle)
> > +};
> > +
> > +static const struct of_device_id dwc3_generic_of_match[] = {
> > +	{ .compatible = "spacemit,k1-dwc3", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
> > +
> > +static struct platform_driver dwc3_generic_driver = {
> > +	.probe		= dwc3_generic_probe,
> > +	.remove		= dwc3_generic_remove,
> > +	.driver		= {
> > +		.name	= "dwc3-generic-plat",
> > +		.of_match_table = dwc3_generic_of_match,
> > +		.pm	= pm_ptr(&dwc3_generic_dev_pm_ops),
> > +	},
> > +};
> > +module_platform_driver(dwc3_generic_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare USB3 generic platform driver");
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
