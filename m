Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9890EC02193
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 12:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeT/AhGMLyLFkJCRwvDp4/z2VeBWq3D/l9n3VY5rkb0=; b=vSZEHL0B36nPEh
	4r3AxJvXe0DmmV/HeDJbupai5jEzBOBCd34Jrv8xd8mLfq2sOEXh7MH7KsNyusSmSULxBGV6m56H6
	lBOuMn8bOcojMBy3FwEG4fNJjSweMegPl/HxY2Mfam9O5xskov2gP2RgtYgWVrePjApciN6ifRkZh
	anO42UxU5FbC1AiPP407EAadkWkhIKHTIoGc2AcUlWZF+WNv86LUN2o8/vaTe3ptGAiFLOMEnwzvo
	FJFVECCe3ngVZ9xmQi/Sx9rQqEBawrRWHu4A6m0y/aUkfTD+cfJpbQGg5zKukNaNuuL840C7hFYop
	ipP703sCXyd2aLIl9SQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td6pF-00000006uR6-0SFY;
	Wed, 29 Jan 2025 12:05:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td6pC-00000006uQS-28v5
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 12:05:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1td6oV-00084D-9t; Wed, 29 Jan 2025 13:04:59 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1td6oP-002SPe-2U;
	Wed, 29 Jan 2025 13:04:53 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1td6oP-000561-27;
	Wed, 29 Jan 2025 13:04:53 +0100
Message-ID: <f79109bad50ed926af7ffc06bc3ab155fe6224ed.camel@pengutronix.de>
Subject: Re: [PATCH v4 09/18] reset: thead: Add TH1520 reset controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
 jassisinghbrar@gmail.com,  paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu,  frank.binns@imgtec.com, matt.coster@imgtec.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
  airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org,  m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Date: Wed, 29 Jan 2025 13:04:53 +0100
In-Reply-To: <20250128194816.2185326-10-m.wilczynski@samsung.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
	 <CGME20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301@eucas1p1.samsung.com>
	 <20250128194816.2185326-10-m.wilczynski@samsung.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_040542_551109_F0B7A414 
X-CRM114-Status: GOOD (  19.66  )
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

On Di, 2025-01-28 at 20:48 +0100, Michal Wilczynski wrote:
> Add reset controller driver for the T-HEAD TH1520 SoC that manages
> hardware reset lines for various subsystems. The driver currently
> implements support for GPU reset control, with infrastructure in place
> to extend support for NPU and Watchdog Timer resets in future updates.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS | 1 +
>  drivers/reset/Kconfig | 10 ++
>  drivers/reset/Makefile | 1 +
>  drivers/reset/reset-th1520.c | 178 +++++++++++++++++++++++++++++++++++
>  4 files changed, 190 insertions(+)
>  create mode 100644 drivers/reset/reset-th1520.c
> 
[...]
> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> new file mode 100644
> index 000000000000..48afbc9f1cdd
> --- /dev/null
> +++ b/drivers/reset/reset-th1520.c
> @@ -0,0 +1,178 @@
[...]
> +static int th1520_reset_xlate(struct reset_controller_dev *rcdev,
> + const struct of_phandle_args *reset_spec)
> +{
> + unsigned int index = reset_spec->args[0];
> +
> + /* currently, only GPU reset is implemented in this driver */
> + if (index == TH1520_RESET_ID_GPU)
> + return index;
> +
> + return -EOPNOTSUPP;

It is customary to return -EINVAL for unsupported resets.

Further, you don't have to implement a custom .of_xlate at all.
With nr_resets being set to 1, and because TH1520_RESET_ID_GPU happens
to be 0, the of_reset_simple_xlate() default implementation will do
exactly the same.

[...]
> +static int th1520_reset_probe(struct platform_device *pdev)
> +{
> + struct device *dev = &pdev->dev;
> + struct th1520_reset_priv *priv;
> + void __iomem *base;
> +
> + priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> + if (!priv)
> + return -ENOMEM;
> +
> + base = devm_platform_ioremap_resource(pdev, 0);
> + if (IS_ERR(base))
> + return PTR_ERR(base);
> +
> + priv->map = devm_regmap_init_mmio(dev, base,
> + &th1520_reset_regmap_config);
> + if (IS_ERR(priv->map))
> + return PTR_ERR(priv->map);
> +
> + mutex_init(&priv->gpu_seq_lock);
> +
> + priv->rcdev.owner = THIS_MODULE;
> + priv->rcdev.nr_resets = 1;
> + priv->rcdev.ops = &th1520_reset_ops;
> + priv->rcdev.of_node = dev->of_node;
>    A. > + priv->rcdev.of_xlate = th1520_reset_xlate;
> + priv->rcdev.of_reset_n_cells = 1;

You could just drop these two lines again. With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
