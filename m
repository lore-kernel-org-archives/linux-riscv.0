Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7F3606A327
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X3WA61ma;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CjMWOcYp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YKko/NSpCosAMsbsyO3S6ywn/ndcWfIEVfUTxgGj0fw=; b=X3WA61maBGnLZjrDDcUGHcEXHL
	AkOJN7pjHbWHCMybgAr/cbBhFisR3zms+/NFBduekYnLHI7DgoVCOVOcAX0M+9xGmVScLko9WGZFZ
	3wG7yfArzn3IhFRO/EpXbGA61G6cc21MpQF3fK3x6tqayYq/bTdk3NpVOjBicWm3ylOyKZTUzUQMq
	oUEVfBL30jGBSh7/OSPs92GuILuxObiLD/C0pfhKqp52jCwR+ZdzXhMZ/mLQZQI3Yn3vBs17gdWQY
	v9nEpeMblf03nwG2zDD7hVwF0CV4G2IekCIgQjiB0tGFjSfodCzVnKi0P4xUvSpKZxC7F8kuwb9e6
	XPo+ecRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp0Z-0000000DpEz-0sHO;
	Thu, 22 Oct 2026 09:22:48 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp0U-0000000DpDZ-40bU
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 09:22:45 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 612022004FF;
	Thu, 22 Oct 2026 11:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792660958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qqxhTJtPctCyqw/BO+NTJMLL3v9u0VV3WUg4oH05iZA=;
	b=CjMWOcYps4eodHQ/s7GPzencBo2C4SpUH2PMkLLZyuJdQbRfjV+1nZY1goYKC71teKkHSC
	n0tocyMGun3g/fKCB2hUJvz7sYnmOrga67IlxvjEIs/ceqig2aEB4uw2nYGI7R4rv9secK
	0iN6hQ1q8oF5v9ipuTScKeXtl1Msu8rPrOokI6LZZOAsQ2sNyeYMmMXEFPaKioq6K2AjH3
	RJce8gIk6THb2yP6wcDHdX5yGvvpWGPs2x69RAEe3MhSWl0M10oR1Psp2iVFBl4sZf7YRn
	uokfWiyw2qntCIwy1r6H1bBZS5cbxO0gSuR2BEYYRyZeO3sXvMcMdQjPEd3lPg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792660958; a=rsa-sha256;
	cv=none;
	b=bxgLHvqvs5tv6FeBl3YzHZC3Y6D7ILoDdSoFhbKcRMyDnL8+MCtU5EiMv9Mo+b+i2OqaA2
	PEIyJNchn6FykrWCFTlTCWrKcNsu3WAkto0iAOK5Z6+mr61wljAwKv9RrGGGASJjMx4A0N
	kvirEK2k6ezMCov/eTBMZPT34W/eMtNlGdNF/HBP3N+34EByPQnkxjGQ2weKUBgdAmoUhk
	JxHKnih6spVxTSvZLL784K3r/TqnXYbWiZZwLYn2VPRhggQEEc4qvQveazYgXePDOOzDDp
	HtFxMWvmtWttAJIxkOP0VSmdSgh70P0PmSPNFSNHbzDcH+tBtqKxeXS3fAvR2g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792660958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qqxhTJtPctCyqw/BO+NTJMLL3v9u0VV3WUg4oH05iZA=;
	b=FRXtW2bJ0F+6W++thfASxvZu13hbSvDCTPNqTwriF92QXgbvqLQ22wfBb+/3HTVjJw24B5
	LP9Gip2zS465cUDzUecBSAXu3WPOkmc3r5lEizRd855I9U1UAt3AWDwLzJOUcqL/pdmtto
	lE/YYJ1uSH4WyZGM1wixHQraLa2PAh2VSP0pD+vAbOnhTnj07qjbgFMopHPXHxf7j7OVzH
	45gIRAIuRgbYMFuVKW6xPywhkkm/zF//zeWJrXg/jEkVTm96N/CGuzBKpYeYNZ9IUMUvjf
	ZCNht5bX5n3WXTb/g8wRDLwxNamxz2McjlZPH2Q5l+Qc91xNyDFiY445ejGvZg==
Message-ID: <8afa649f656a136eb302a0ab76f9f76ca7bfe9e6.camel@pengutronix.de>
Subject: Re: [PATCH 07/18] reset: zhihe: add A210 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: gaohan@iscas.ac.cn, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley	
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu	
 <zhiguo.zhu@linux.alibaba.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney	 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Thomas Gleixner	 <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Samuel
 Holland	 <samuel.holland@sifive.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>,  Anup Patel <anup@brainfault.org>, Icenowy
 Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Date: Thu, 22 Oct 2026 11:22:38 +0200
In-Reply-To: <20261022-a210-init-v1-7-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
	 <20261022-a210-init-v1-7-5e438f972d24@iscas.ac.cn>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_022243_449211_5772D3A9 
X-CRM114-Status: GOOD (  26.58  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Do, 2026-10-22 at 03:53 +0800, Han Gao via B4 Relay wrote:
> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> 
> Add support for A210 reset banks and linked reset signals. Check
> register readback to detect rejected writes.

Please explain why the linked reset mechanism is required. To me it
looks like these should be separate resets.

> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  drivers/reset/Kconfig      |  11 +
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-a210.c | 589 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 601 insertions(+)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 3168ab1eea88..039e8a4046dc 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -428,6 +428,17 @@ config RESET_UNIPHIER_GLUE
>  	  on UniPhier SoCs. Say Y if you want to control reset signals
>  	  provided by the glue layer.
>  
> +config RESET_ZHIHE_A210
> +	tristate "ZhiHe A210 reset controller"
> +	depends on OF && (ARCH_ZHIHE || COMPILE_TEST)
> +	default ARCH_ZHIHE
> +	help
> +	  Build the reset controller driver for the ZhiHe A210 SoC.
> +
> +	  This driver provides reset control for the various hardware
> +	  blocks in the A210 SoC. Say Y if you are building a kernel
> +	  for the ZhiHe A210 platform.
> +
>  config RESET_ZYNQ
>  	bool "ZYNQ Reset Driver" if COMPILE_TEST
>  	default ARCH_ZYNQ
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 45ad17062462..3620e94e4539 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -52,5 +52,6 @@ obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
>  obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
>  obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
> +obj-$(CONFIG_RESET_ZHIHE_A210) += reset-a210.o
>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>  obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
> diff --git a/drivers/reset/reset-a210.c b/drivers/reset/reset-a210.c
> new file mode 100644
> index 000000000000..38bad400d6b8
> --- /dev/null
> +++ b/drivers/reset/reset-a210.c
> @@ -0,0 +1,589 @@
[...]
> +static int a210_reset_update(struct reset_controller_dev *rcdev,
> +			     unsigned long id, bool assert)
> +{
> +	struct a210_reset *rst = to_a210_reset(rcdev);
> +	const struct a210_rst_signal *signal;
> +	unsigned long flags;
> +	u32 value;
> +	int ret = 0;
> +
> +	if (id >= rst->data->num_signals)
> +		return -EINVAL;

Unnecessary, the core already checks id < rcdev->num_resets before
creating the reset control.

> +
> +	spin_lock_irqsave(&rst->lock, flags);

If you use guard() here ...

> +	do {
> +		signal = &rst->data->signals[id];
> +		value = readl(rst->base + signal->offset);
> +		if (assert)
> +			value &= ~signal->mask;
> +		else
> +			value |= signal->mask;
> +		writel(value, rst->base + signal->offset);
> +		/* Firmware can lock individual reset controls against AP writes. */
> +		if ((readl(rst->base + signal->offset) & signal->mask) !=
> +		    (value & signal->mask)) {
> +			ret = -EIO;
> +			break;

... this could just return -EIO;

> +		}
> +		id = signal->nextid;
> +	} while (id);

Is this loop a workaround for the UART driver not handling two resets?

Or do the two linked reset bits really have to be asserted, one
directly after the other, without any other write to the same register
in-between and without setting them at the same time? If so, why?

> +	spin_unlock_irqrestore(&rst->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int a210_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return a210_reset_update(rcdev, id, true);
> +}
> +
> +static int a210_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return a210_reset_update(rcdev, id, false);
> +}
> +
> +static int a210_reset_status(struct reset_controller_dev *rcdev, unsigned long id)

Do you actually need this for any consumer?

> +{
> +	struct a210_reset *rst = to_a210_reset(rcdev);
> +	const struct a210_rst_signal *signal;
> +	unsigned long flags;
> +	bool asserted;
> +
> +	if (id >= rst->data->num_signals)
> +		return -EINVAL;
> +
> +	/* The logical reset is asserted if any linked signal is asserted. */

What is the "logical reset" in this context?

When there are multiple reset lines that can be in different states,
I'd expect this to return an error.

> +	spin_lock_irqsave(&rst->lock, flags);
> +	do {
> +		signal = &rst->data->signals[id];
> +		asserted = (readl(rst->base + signal->offset) & signal->mask) !=
> +			   signal->mask;
> +		if (asserted)
> +			break;
> +		id = signal->nextid;
> +	} while (id);
> +	spin_unlock_irqrestore(&rst->lock, flags);
> +
> +	return asserted;
> +}

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
