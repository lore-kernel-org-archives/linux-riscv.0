Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB8FD5CCA5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0FE+W5B2kVYxiq9x/G5M7Q5ai5Ndr+Fyc6w2CO5Zmc=; b=W8uux3lM/DWj/s
	LKhJHN1IKW5CnOuadKAM72KZcCel/vsCFCzlPUhba4dMxH/kGpYZbtCdyY/zao0yqhElm9K1IALcD
	WLL62ya+PPGx2l7Fb7EzoAKGjDftQVE7cFqORlQ2vqv2FKP0Ie+8/SGX/SVg/SfaBukDJkTDFfFkK
	+QQPjY5/k7XhZrSiT9uo6s8niCNvTfbAQ4zMM3EMwyF6P0YO5NK+7oP4Wjzqwc2HEN7qr9cGc00NX
	Nhh0EtUPDeb/QcDx88YOjygfQMNMhhmo0Ro4rF6R/RkXe/X57z/0FsJMprsiEKb/LY53Td0Ys6O1H
	HexKC2UsTTdANvLI0GMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVS56-000000051S5-2RD0;
	Tue, 16 Dec 2025 10:15:00 +0000
Received: from mail74.out.titan.email ([3.216.99.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVS54-000000051RR-0Q8M
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 10:14:59 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVt8c21w0z2xDS;
	Tue, 16 Dec 2025 10:14:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=JRYE7dZuS1EyQE3Ha8bBcmdg8NdStYsYqAqgvc7/9LQ=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=to:subject:mime-version:date:from:cc:references:message-id:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765880096; v=1;
	b=WBalnqKOAoW25sYUqwKYrlMbSyNNpXVqfN7EF7jhqOVe2E3s1L4qYp4hr7pvThV7RcIdx4ay
	qtxtoxalS0/L8qkNry2nOh17pDBVHzE1GR4bkumqnoDBYEe6T0Bau7/Ccb4SMW/lEc2jvpG92US
	+KYseHiJnFFN6d/cJtmibi1U=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVt8T6kbgz2xDl;
	Tue, 16 Dec 2025 10:14:49 +0000 (UTC)
Date: Tue, 16 Dec 2025 10:14:46 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: wayne <shuweiwoo@163.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
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
Message-ID: <aUExFjJJh0rrRCdV@pie>
References: <20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com>
 <20251216-patchv2-k1-thermal-v1-2-d4b31fe9c904@163.com>
 <aUDc-o63KJpY8xLG@pie>
 <68620b24-256f-4032-8bc0-911d94bfb616@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68620b24-256f-4032-8bc0-911d94bfb616@163.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765880096091703187.27573.8248559529016179629@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=TPG/S0la c=1 sm=1 tr=0 ts=69413120
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=VwQbUJbxAAAA:8
	a=7mOBRU54AAAA:8 a=Byx-y9mGAAAA:8 a=aEzJoT4k0w9bqF-TWZ8A:9
	a=CjuIK1q_8ugA:10 a=wa9RWnbW_A1YIeRBVszw:22 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_021458_291129_4E64BCF8 
X-CRM114-Status: GOOD (  39.77  )
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

On Tue, Dec 16, 2025 at 05:31:06PM +0800, wayne wrote:
> |On 2025/12/16 12:16, |Yao Zi wrote:
> 
> > On Tue, Dec 16, 2025 at 10:00:36AM +0800, Shuwei Wu wrote:
> > > The thermal sensor on K1 supports monitoring five temperature zones.
> > > The driver registers these sensors with the thermal framework
> > > and supports standard operations:
> > > - Reading temperature (millidegree Celsius)
> > > - Setting high/low thresholds for interrupts
> > > 
> > > Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> > > ---
> > > Changes in v2:
> > > - Rename k1_thermal.c to k1_tsensor.c for better hardware alignment
> > > - Move driver to drivers/thermal/spacemit/
> > > - Add Kconfig/Makefile for spacemit and update top-level build files
> > > - Refactor names, style, code alignment, and comments
> > > - Simplify probe and error handling
> > > ---
> > >   drivers/thermal/Kconfig               |   2 +
> > >   drivers/thermal/Makefile              |   1 +
> > >   drivers/thermal/spacemit/Kconfig      |  19 +++
> > >   drivers/thermal/spacemit/Makefile     |   3 +
> > >   drivers/thermal/spacemit/k1_tsensor.c | 283 ++++++++++++++++++++++++++++++++++
> > >   5 files changed, 308 insertions(+)
> > > diff --git a/drivers/thermal/spacemit/k1_tsensor.c b/drivers/thermal/spacemit/k1_tsensor.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..f164754e807ddd311c8cf98bcc074fd580514aa2
> > > --- /dev/null
> > > +++ b/drivers/thermal/spacemit/k1_tsensor.c
> > ...
> > 
> > > +static void k1_tsensor_init(struct k1_tsensor *ts)
> > > +{
> > Configuration of K1_TSU_PCTRL2 (offset 0x04) is removed in this
> > revision, but why? Isn't it necessary for the sensor to function?
> > 
> > And you didn't ask my question raised in v1 about the source of 24MHz
> > clock. I still suspect whether the binding is complete or not.
> 
> Thank you for pointing this out, and I apologize for not addressing your
> question
> 
> about the 24MHz clock earlier.
> 
> In v1, I referenced the vendor's implementation, though their device tree
> 
> did not specify this clock for the thermal node.
> 
> After your review, I revisited the SpacemiT K1 clock tree published by the
> vendor,
> 
> and found that TSENSOR relies only on the APBC clock, which in turn is
> ultimately
> 
> sourced from the 24MHz crystal via the PLL.
> 
> Disabling the 24MHz clock for the syscon_apbc node in the device tree had no
> impact
> 
> on TSENSOR operation in my testing, so I did not include it in the binding.
> 
> As for the PCTRL2 configuration, I confirmed that its default value after
> reset is zero,
> 
> and changing its configuration had no effect on the temperature sensor's
> behavior.
> 
> This led me to remove the PCTRL2 configuration code in v2.

Thanks, this is a reasonable answer to me.

> > > +	u32 val;
> > > +
> > > +	/* Disable all the interrupts */
> > > +	writel(0xffffffff, ts->base + K1_TSENSOR_INT_EN_REG);
> > > +
> > > +	/* Configure ADC sampling time and filter period */
> > > +	val = readl(ts->base + K1_TSENSOR_TIME_REG);
> > > +	val &= ~K1_TSENSOR_TIME_MASK;
> > > +	val |= K1_TSENSOR_TIME_FILTER_PERIOD |
> > > +		K1_TSENSOR_TIME_ADC_CNT_RST |
> > > +		K1_TSENSOR_TIME_WAIT_REF_CNT;
> > It's more natural to align K1_TSENSOR_TIME_ADC_CNT_RST and other
> > following constants with K1_TSENSOR_TIME_FILTER_PERIOD. This applies for
> > other multiple-line assignments, too.
> > 
> > ...
> > 
> > > +static int k1_tsensor_probe(struct platform_device *pdev)
> > > +{
> > ...
> > 
> > > +	for (i = 0; i < MAX_SENSOR_NUMBER; ++i) {
> > > +		ts->ch[i].id = i;
> > > +		ts->ch[i].ts = ts;
> > > +		ts->ch[i].tzd = devm_thermal_of_zone_register(dev, i, ts->ch + i, &k1_tsensor_ops);
> > > +		if (IS_ERR(ts->ch[i].tzd))
> > > +			return PTR_ERR(ts->ch[i].tzd);
> > Would emitting a error message with dev_err_probe() help here?
> 
> In v1, the reviewer mentioned that it is no need to print extra error
> message.
> 
> See:
> 
> https://lore.kernel.org/spacemit/20251127225848-GYA1797866@gentoo.org/T/#mc335bea36323d2d8b3afb09aa40c9c7160440d39

Oops, yeah, I definitely read this link before, but forgot it. So
keeping it as-is is okay.

> > > +
> > > +		/* Attach sysfs hwmon attributes for userspace monitoring */
> > > +		ret = devm_thermal_add_hwmon_sysfs(dev, ts->ch[i].tzd);
> > > +		if (ret)
> > > +			dev_warn(dev, "Failed to add hwmon sysfs attributes\n");
> > > +
> > > +		k1_tsensor_enable_irq(ts->ch + i);
> > > +	}
> > > +
> > > +	irq = platform_get_irq(pdev, 0);
> > > +	if (irq < 0)
> > > +		return irq;
> > Same as the above question.
> Ditto.
> > > +	ret = devm_request_threaded_irq(dev, irq, NULL,
> > > +					k1_tsensor_irq_thread,
> > > +					IRQF_ONESHOT, "k1_tsensor", ts);
> > > +	if (ret < 0)
> > > +		return ret;
> > Same as above.
> Ditto.
> > Besides these questions, the driver itself looks pretty nice to me :)
> > 
> > Best regards,
> > Yao Zi
> 
> |Please let me know if you need further details or test results. Thank you
> for reviewing my patch. Best regards, Shuwei Wu|
> 
> 

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
