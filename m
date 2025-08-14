Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D00CA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 14:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySjBOvijxswxPdhbXuCNFtY7XezH8YfVacpm7/VaDFQ=; b=D2vtZZiB+c6p2+
	7cowHS3bdOjIlI1E8BjWL1u7hrSX6sdWp8w9n7FXlKPsJUBRM+OkA0guWB6r+0TdzC8/HgKenJ1jR
	stxeinoglIYDAtU45/p3HeqcfflPcWf9RGAeP292Z6MwBTiBizu6cBit8rCgmKOaJP6nAw/PoIZ7Q
	VtA1d9m3nnIXUYK+FIEmf4GHvkWtjCrgi98H77pzmOcKVoJ1s8MyNz1av7frWCdtHC0BQgM78BQit
	kgByS2lT+UjaUh3A7Y6eAQ2EGi/slYCsJCxkQEnitF8qzkIlXAGap7YyXhxGrkL7G2Fx08/Ysyeg5
	NJXygqFwfkI/FKWoFp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYkx-0000000HCqA-2o01;
	Thu, 14 Aug 2025 14:16:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVKO-0000000GcBN-1hfy
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 10:37:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVKB-0007cz-7f; Thu, 14 Aug 2025 12:36:47 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVK9-000Evw-1z;
	Thu, 14 Aug 2025 12:36:45 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVK9-000Gbg-1f;
	Thu, 14 Aug 2025 12:36:45 +0200
Message-ID: <851f1c3d96988920a28412a26d5cd951b684c020.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] ASoC: spacemit: i2s: add support for K1 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Liam Girdwood
	 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Jaroslav Kysela
	 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>
Date: Thu, 14 Aug 2025 12:36:45 +0200
In-Reply-To: <20250814-k1-i2s-v1-2-c31149b29041@linux.spacemit.com>
References: <20250814-k1-i2s-v1-0-c31149b29041@linux.spacemit.com>
	 <20250814-k1-i2s-v1-2-c31149b29041@linux.spacemit.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_033700_442139_E987BE68 
X-CRM114-Status: GOOD (  16.33  )
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

On Do, 2025-08-14 at 16:54 +0800, Troy Mitchell wrote:
> Add ASoC platform driver for the SpacemiT K1 SoC full-duplex I2S
> controller.
> 
> Co-developer: Jinmei Wei <weijinmei@linux.spacemit.com>
> Signed-off-by: Jinmei Wei <weijinmei@linux.spacemit.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  sound/soc/Kconfig           |   1 +
>  sound/soc/Makefile          |   1 +
>  sound/soc/spacemit/Kconfig  |  14 ++
>  sound/soc/spacemit/Makefile |   5 +
>  sound/soc/spacemit/k1_i2s.c | 444 ++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 465 insertions(+)
> 
[...]
> diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e41525afbf3f08ab9a26b562772861d86f39cd7
> --- /dev/null
> +++ b/sound/soc/spacemit/k1_i2s.c
> @@ -0,0 +1,444 @@
[...]

> +static int spacemit_i2s_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_dai_driver *dai;
> +	struct spacemit_i2s_dev *i2s;
> +	struct resource *res;
> +	struct clk *clk;
> +	int ret;
> +
> +	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
> +	if (!i2s)
> +		return -ENOMEM;
> +
> +	i2s->dev = &pdev->dev;
> +
> +	i2s->sysclk = devm_clk_get_enabled(i2s->dev, "sysclk");
> +	if (IS_ERR(i2s->sysclk))
> +		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sysclk),
> +				     "failed to enable sysbase clock\n");
> +
> +	i2s->bclk = devm_clk_get_enabled(i2s->dev, "bclk");
> +	if (IS_ERR(i2s->bclk))
> +		return dev_err_probe(i2s->dev, PTR_ERR(i2s->bclk), "failed to enable bit clock\n");
> +
> +	clk = devm_clk_get_enabled(i2s->dev, "sspa_bus");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa_bus clock\n");
> +
> +	i2s->sspa_clk = devm_clk_get_enabled(i2s->dev, "sspa");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa clock\n");
> +
> +	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(i2s->base))
> +		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");
> +
> +	i2s->reset =  devm_reset_control_get(&pdev->dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

> +	if (IS_ERR(i2s->reset))
> +		return dev_err_probe(i2s->dev, PTR_ERR(i2s->reset),
> +				     "failed to get reset control");
> +
> +	dev_set_drvdata(i2s->dev, i2s);
> +
> +	spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
> +
> +	ret = devm_snd_soc_register_component(i2s->dev,
> +					      &spacemit_i2s_component,
> +					      dai, 1);
> +	if (ret)
> +		return dev_err_probe(i2s->dev, ret, "failed to register component");
> +
> +	return devm_snd_dmaengine_pcm_register(&pdev->dev, &spacemit_dmaengine_pcm_config, 0);
> +}
> +
> +static void spacemit_i2s_remove(struct platform_device *pdev)
> +{
> +	struct spacemit_i2s_dev *i2s = dev_get_drvdata(&pdev->dev);
> +
> +	reset_control_assert(i2s->reset);

I'd move the reset_control_assert() be moved to snd_soc_dai_ops::remove
for symmetry.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
