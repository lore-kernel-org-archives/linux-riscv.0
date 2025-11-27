Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174EDD111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpXWjfUhJv+NiAxjDNEbq+2TjjH56NmFF+0fESPimWU=; b=Mb8DZm+6XkpFlP
	GNqPEp84enwViiWfoHTEGKAsCkrJ9Y1XRl8Qnc6yhvXT4UEGvPwOEUnHLhLMEsX9lS0Qm++CQelqm
	VWUOUkXG4+4gAfco2xTLrcqASemB0TV6HJ/cOFhCj5z2mdDn4Y/Vhi3/+g6ssVesgKKBMABnzzqir
	gmQpPoOqYAw07KtAjYfZWg6xj5pdlUOKnHQBto3wmUYOduMgd+UPtltDr37F6luMKtT/p5j5y1ySK
	ZGQhhmV8Vu0Lp0zqjJDy4CKDBkshJcQVkg8RdzaFaK34v3pDq1gJ3r8wM7/wvTdsIe9Gz4WfI3pQs
	OIBLtakxN+fJFaJ0WZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOkx1-0000000HHsg-1uc3;
	Thu, 27 Nov 2025 22:58:59 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOkwy-0000000HHsE-2e64
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 22:58:57 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0560C341F8A;
	Thu, 27 Nov 2025 22:58:52 +0000 (UTC)
Date: Fri, 28 Nov 2025 06:58:48 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] thermal: K1: Add driver for K1 SoC thermal sensor
Message-ID: <20251127225848-GYA1797866@gentoo.org>
References: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
 <20251127-b4-k1-thermal-v1-2-f32ce47b1aba@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251127-b4-k1-thermal-v1-2-f32ce47b1aba@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_145856_732663_561B1F70 
X-CRM114-Status: GOOD (  18.08  )
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

Hi Shuwei, 

for the title, you could simplify it by adding short prefix/annotation with
my previous comments

thermal: K1: Add driver for K1 SoC thermal sensor
-> thermal: spacemit: k1: Add thermal sensor support


On 02:44 Thu 27 Nov     , Shuwei Wu wrote:
> The thermal sensor unit (TSU) on K1 supports monitoring five temperature
> zones. The driver registers these sensors with the thermal framework
> and supports standard operations:
> - Reading temperature (millidegree Celsius)
> - Setting high/low thresholds for interrupts
> 
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> ---
>  drivers/thermal/Kconfig      |  14 ++
>  drivers/thermal/Makefile     |   1 +
>  drivers/thermal/k1_thermal.c | 307 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 322 insertions(+)
> 
> +}
[snip]..
> +
> +static int k1_thermal_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct k1_thermal_priv *priv;
> +	int i, irq, ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(priv->reset))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
> +				     "Failed to get/deassert reset control\n");
no need to break the line, it's ok to have 100 column per line
https://elixir.bootlin.com/linux/v6.18-rc7/source/Documentation/dev-tools/checkpatch.rst#L688

P.S: this isn't hard rule and may still up to maintainer..
> +
> +	priv->clk = devm_clk_get_enabled(dev, "core");
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "Failed to get core clock\n");
ditto
> +
> +	priv->bus_clk = devm_clk_get_enabled(dev, "bus");
> +	if (IS_ERR(priv->bus_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->bus_clk),
> +				     "Failed to get bus clock\n");
ditto
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
I suggest to group this with dev_request_threaded_irq(), since both of them
are taking care of IRQ related operation
> +
> +	ret = k1_init_sensors(pdev);
> +
> +	for (i = 0; i < MAX_SENSOR_NUMBER; ++i) {
> +		priv->sensors[i].id = i;
> +		priv->sensors[i].priv = priv;
> +		priv->sensors[i].tzd = devm_thermal_of_zone_register(dev,
> +									i, priv->sensors + i,
> +									&k1_thermal_ops);
                                                                  ~~~~~~~~
here is wrong, alignment should match open parentheses, didn't checkpatch.pl warn about this?

> +		if (IS_ERR(priv->sensors[i].tzd))
> +			return dev_err_probe(dev, PTR_ERR(priv->sensors[i].tzd),
> +						"Failed to register thermal zone: %d\n", i);
I'd say, no need to do the verbose print, almost every error path has
print message already
> +
> +		/* Attach sysfs hwmon attributes for userspace monitoring */
> +		ret = devm_thermal_add_hwmon_sysfs(dev, priv->sensors[i].tzd);
> +		if (ret)
> +			dev_warn(dev, "Failed to add hwmon sysfs attributes\n");
> +
> +		k1_enable_sensor_irq(priv->sensors + i);
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL,
> +					k1_thermal_irq_thread,
> +					IRQF_ONESHOT, "k1_thermal", priv);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
no need to print extra error message, please refer to:
 https://lore.kernel.org/all/20250805092922.135500-2-panchuang@vivo.com
 https://github.com/torvalds/linux/commit/55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
