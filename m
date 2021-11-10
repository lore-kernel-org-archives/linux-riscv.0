Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87ADC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 12:16:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE29861247
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 12:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE29861247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtF2cZ1ixMnAuiGJkviR9HnI0vwC6TQw28PZqmDui+A=; b=BGjs+BmT5zaZdU
	UgdqE7hzRh1qC7Ww2mz1ave7TyL+WG+Vdddp/JkZc85atNWu2isOo4baf2n0IG80QfdHTXyUUYRpc
	49ZRzjnd62/dthcvUE+OOxCM6K6ogeolG8AoXvWN2H1bt/01jG5eaC9q4SmRcGMi2AgLRjsBGYz1k
	DfFYiaw5UBI2VA/XCSrwwn9TJ92pwsgZ+cxzBPsJ50z19h448bvOjsxUpXfxM+Z+3EA2pv/Ake8e3
	TzX2gbPdgkyr78JwREmZmAN50X7LXpFsr7MLtK5Vz4Tg0yUFqhHUb/VJfgcimR5sSgT/cQ5xE0Vju
	P8fYSiUViDzA4KFpNiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkmWs-005N5q-Tu; Wed, 10 Nov 2021 12:16:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkmWf-005N30-EZ; Wed, 10 Nov 2021 12:16:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B97761247;
 Wed, 10 Nov 2021 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636546584;
 bh=ZYFWL/ZZSINDrj9gVT8HDnC1qKVafjx6t2mJPgowNVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=reIhBKYtcg8k442u+V9YxuQbe8lxhoFCd41JIRHoPfobRr49BEKhEDTBUAwCjT0Vf
 Rp0CEx223jng3x8zHBLJMnLNfaS0xrx15PkY/xJ/7cFe1uXdqc3JdekDpP+80ysXF5
 uUmkOdyU7+Wi/2sF8m32JRo1J72u5NLS28WSnUedYUGEo6g9aIKdkF6VK8DT/14LCF
 ldkxpAYsUNmVgj31jZvsa4NSzTQ1O+B7RtbRT0Ib8LuZGZcG8gaFJ6KBFy1462TVDu
 9u7Yz0LaUUv7rD9tiA3F07iRoRI1/GvF2wO12X+hvrZa8UwsCawwpXMey99vsww45J
 VbXyxJRP5OlBw==
Date: Wed, 10 Nov 2021 14:16:18 +0200
From: Abel Vesa <abelvesa@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
Message-ID: <YYu4EglV7SBZU2Iy@ryzen>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210929000735.585237-2-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_041625_569953_1D956DD0 
X-CRM114-Status: GOOD (  36.08  )
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

On 21-09-28 17:07:33, Saravana Kannan wrote:
> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
> 
> However, there are instances of devices that are not simple buses (they get
> probed by their specific drivers) that also list the "simple-bus" (or other
> bus only compatible strings) in their compatible property to automatically
> populate their child devices. We still want these devices to get probed by
> their specific drivers. So, we make sure this driver only probes devices
> that are only buses.
> 
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 01a3d0cd08ed..6b8d6257ed8a 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -13,11 +13,36 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
> -
>  static int simple_pm_bus_probe(struct platform_device *pdev)
>  {
> -	const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> -	struct device_node *np = pdev->dev.of_node;
> +	const struct device *dev = &pdev->dev;
> +	const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> +	struct device_node *np = dev->of_node;
> +	const struct of_device_id *match;
> +
> +	/*
> +	 * Allow user to use driver_override to bind this driver to a
> +	 * transparent bus device which has a different compatible string
> +	 * that's not listed in simple_pm_bus_of_match. We don't want to do any
> +	 * of the simple-pm-bus tasks for these devices, so return early.
> +	 */
> +	if (pdev->driver_override)
> +		return 0;
> +
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	/*
> +	 * These are transparent bus devices (not simple-pm-bus matches) that
> +	 * have their child nodes populated automatically.  So, don't need to
> +	 * do anything more. We only match with the device if this driver is
> +	 * the most specific match because we don't want to incorrectly bind to
> +	 * a device that has a more specific driver.
> +	 */
> +	if (match && match->data) {
> +		if (of_property_match_string(np, "compatible", match->compatible) == 0)
> +			return 0;
> +		else
> +			return -ENODEV;
> +	}

This change is breaking the expected behavior for the already existent
simple-bus nodes. All the simple-bus compatibles should be replaced now
to simple-pm-bus. In my case, on some i.MX8 platforms, without the
devlink, the devices suspend sequence changes (and even breaks).

To avoid breaking the already existent simple-bus nodes, maybe the logic
should've been reversed: keep the simple-bus as is and add another
compatible, IDK, something like simple-trasnparent-bus, or something.

>  
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
>  
> @@ -31,14 +56,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
>  
>  static int simple_pm_bus_remove(struct platform_device *pdev)
>  {
> +	const void *data = of_device_get_match_data(&pdev->dev);
> +
> +	if (pdev->driver_override || data)
> +		return 0;
> +
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
>  
>  	pm_runtime_disable(&pdev->dev);
>  	return 0;
>  }
>  
> +#define ONLY_BUS	((void *) 1) /* Match if the device is only a bus. */
> +
>  static const struct of_device_id simple_pm_bus_of_match[] = {
>  	{ .compatible = "simple-pm-bus", },
> +	{ .compatible = "simple-bus",	.data = ONLY_BUS },
> +	{ .compatible = "simple-mfd",	.data = ONLY_BUS },
> +	{ .compatible = "isa",		.data = ONLY_BUS },
> +	{ .compatible = "arm,amba-bus",	.data = ONLY_BUS },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
> -- 
> 2.33.0.685.g46640cef36-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
