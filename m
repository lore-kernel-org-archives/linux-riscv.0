Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF24D5C0C0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 04:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIsz7tqNDFAeAxZQTTPXTwa9XnF4F+bPjixVo4ksg3A=; b=32WK90OXWtGM1c
	VTNvQlIuk0el7QCxVRJIXJIntWLABdFYXe76qfzVtK+D3ofPx0bPOzswE32xcZdjNDLvT9PjW6Ml2
	L9obvDWvF2WGiHyspVlhwIAicAtTj/klgLVx8AV2I5oYN0DG0ByQkF9eEPF97azOzdwS77lx42eg/
	5Rk0t0UyZcnsH3UzYii+Lvwk2HKNYqA6Rc18mVmNb7vcIPXav6b9v7wEic5IrnVvq8+CYX7Y8Wumx
	5KsktLI0eUI0TnB2PjhOvFCtZfUCgkRw7T8r3OJut0OQ46K4rsgvVCKTihZx6Qa0ool9nFP7wh1GV
	RmZC4cg55sNX0q2dUqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVMUW-00000004fkW-2pzA;
	Tue, 16 Dec 2025 04:16:52 +0000
Received: from mail76.out.titan.email ([3.216.99.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVMUU-00000004fjH-1VKs
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 04:16:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVkCN0kqRz7t9J;
	Tue, 16 Dec 2025 04:16:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=7n7qMq2z773A6crxSe2h52Ruo5UwRmT1FP0PMQ4p+ec=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=to:message-id:in-reply-to:date:from:subject:cc:references:mime-version:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765858608; v=1;
	b=C8ai/uUIcIC2/r/nA4mW3Nq1ffkkSI+I3YlQXUq3FWa23HXh8a/tFdEMWU2roXuU9kbCsiYu
	lZSGqUF/tkrawoRz5rj97BGdWFBLWoJ5ggk0HP1c6Rt9P1a8ylySQHB3BRYR1NKllYeTq9M89qc
	pHolYxhgXdEU8CuzjKVQ9730=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVkCF3YM3z7t7t;
	Tue, 16 Dec 2025 04:16:41 +0000 (UTC)
Date: Tue, 16 Dec 2025 04:16:27 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Shuwei Wu <shuweiwoo@163.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] thermal: spacemit: k1: Add thermal sensor support
Message-ID: <aUDc-o63KJpY8xLG@pie>
References: <20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com>
 <20251216-patchv2-k1-thermal-v1-2-d4b31fe9c904@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216-patchv2-k1-thermal-v1-2-d4b31fe9c904@163.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765858607931248556.30087.3778824715309203318@prod-use1-smtp-out1002.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=TPG/S0la c=1 sm=1 tr=0 ts=6940dd2f
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=Byx-y9mGAAAA:8
	a=K1kigjf773wChWhSffkA:9 a=CjuIK1q_8ugA:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_201650_494200_A192C770 
X-CRM114-Status: GOOD (  23.73  )
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

On Tue, Dec 16, 2025 at 10:00:36AM +0800, Shuwei Wu wrote:
> The thermal sensor on K1 supports monitoring five temperature zones.
> The driver registers these sensors with the thermal framework
> and supports standard operations:
> - Reading temperature (millidegree Celsius)
> - Setting high/low thresholds for interrupts
> 
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> ---
> Changes in v2:
> - Rename k1_thermal.c to k1_tsensor.c for better hardware alignment
> - Move driver to drivers/thermal/spacemit/
> - Add Kconfig/Makefile for spacemit and update top-level build files
> - Refactor names, style, code alignment, and comments
> - Simplify probe and error handling
> ---
>  drivers/thermal/Kconfig               |   2 +
>  drivers/thermal/Makefile              |   1 +
>  drivers/thermal/spacemit/Kconfig      |  19 +++
>  drivers/thermal/spacemit/Makefile     |   3 +
>  drivers/thermal/spacemit/k1_tsensor.c | 283 ++++++++++++++++++++++++++++++++++
>  5 files changed, 308 insertions(+)
> diff --git a/drivers/thermal/spacemit/k1_tsensor.c b/drivers/thermal/spacemit/k1_tsensor.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f164754e807ddd311c8cf98bcc074fd580514aa2
> --- /dev/null
> +++ b/drivers/thermal/spacemit/k1_tsensor.c

...

> +static void k1_tsensor_init(struct k1_tsensor *ts)
> +{

Configuration of K1_TSU_PCTRL2 (offset 0x04) is removed in this
revision, but why? Isn't it necessary for the sensor to function?

And you didn't ask my question raised in v1 about the source of 24MHz
clock. I still suspect whether the binding is complete or not.

> +	u32 val;
> +
> +	/* Disable all the interrupts */
> +	writel(0xffffffff, ts->base + K1_TSENSOR_INT_EN_REG);
> +
> +	/* Configure ADC sampling time and filter period */
> +	val = readl(ts->base + K1_TSENSOR_TIME_REG);
> +	val &= ~K1_TSENSOR_TIME_MASK;
> +	val |= K1_TSENSOR_TIME_FILTER_PERIOD |
> +		K1_TSENSOR_TIME_ADC_CNT_RST |
> +		K1_TSENSOR_TIME_WAIT_REF_CNT;

It's more natural to align K1_TSENSOR_TIME_ADC_CNT_RST and other
following constants with K1_TSENSOR_TIME_FILTER_PERIOD. This applies for
other multiple-line assignments, too.

...

> +static int k1_tsensor_probe(struct platform_device *pdev)
> +{

...

> +	for (i = 0; i < MAX_SENSOR_NUMBER; ++i) {
> +		ts->ch[i].id = i;
> +		ts->ch[i].ts = ts;
> +		ts->ch[i].tzd = devm_thermal_of_zone_register(dev, i, ts->ch + i, &k1_tsensor_ops);
> +		if (IS_ERR(ts->ch[i].tzd))
> +			return PTR_ERR(ts->ch[i].tzd);

Would emitting a error message with dev_err_probe() help here?

> +
> +		/* Attach sysfs hwmon attributes for userspace monitoring */
> +		ret = devm_thermal_add_hwmon_sysfs(dev, ts->ch[i].tzd);
> +		if (ret)
> +			dev_warn(dev, "Failed to add hwmon sysfs attributes\n");
> +
> +		k1_tsensor_enable_irq(ts->ch + i);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;

Same as the above question.

> +	ret = devm_request_threaded_irq(dev, irq, NULL,
> +					k1_tsensor_irq_thread,
> +					IRQF_ONESHOT, "k1_tsensor", ts);
> +	if (ret < 0)
> +		return ret;

Same as above.

Besides these questions, the driver itself looks pretty nice to me :)

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
