Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90EFCCD19A
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQ6s847HvCy7JXTTZ507uEUXU2CC5pWZ+e+pqsimqVU=; b=OEx7gHwDIMnO0QXO3A8itWFO0e
	C4BPrRbSSyVcdH1BNsx7R5NIp+TCy91CiHCh1elm7QUTS8eJQMwniNGPqnU8uyok0zLE6PTkZu6Ww
	oVh2rSyIgq4Z6k5Fd6L5noAT9p/DlgGmHgpZas7XM/Q81f20EhxVlSDuE0YSj5CRZKGgc8YQkFnAP
	rwbivofxNYYeIfEgL4cXCt4A48dy7wClJSZOeZ0+Sb3CWFrhYRMGIYLPjl7MQBnUzxmiq+2VmzPAh
	CjpfS6tYcwmrdFYn1NuYYMco5B2tc63SyPxsmNcGIg9qp/IqL+ZPZ9bwWr8dG//82ObR5VuCo2jXL
	Kx/2StVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKhLU-0000000F1VU-0Zwc;
	Sun, 16 Nov 2025 18:19:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKhLR-0000000F1Uz-3X6b
	for linux-riscv@lists.infradead.org;
	Sun, 16 Nov 2025 18:19:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2399660183;
	Sun, 16 Nov 2025 18:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81E5C4CEF1;
	Sun, 16 Nov 2025 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763317163;
	bh=dEgW1rRC+aV4R5Ukz5J6zVPHu6vjYC2y2EAyWUhddoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSi7FKFRHP4Ad+VAlITP7/J6SSBMdsbE4vUro/7SbibOD8oPHLNSLMHF9SbCtIXvr
	 ZyMdL872/xepUnVZfxG63K6l6NTgsUtFExlLZLjmCDG0YDj6W6DfMEVW2hXnc0X94J
	 XmzsVl1DYGxPN6sF2vHMhAtdSHp7b28pDcWi1WsiQkGDa1wxZWyMPI+5LAhIsSPJQm
	 GKG5aqQEFqBOsw88fMe75jV8TpYPj61haUrTJKVse196/f22gWRS6SpuJMmt2qLRvx
	 iCM+0xkZDfTGHVW1ep1aiLGoVq8E2YXKaEUryZdgQxM84akd/q0dD3qBJXDuncmM+4
	 4pH0+VsTnjIrg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1DE341ACCC98; Sun, 16 Nov 2025 18:19:21 +0000 (GMT)
Date: Sun, 16 Nov 2025 18:19:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: dlan@gentoo.org, p.zabel@pengutronix.de, linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
Message-ID: <aRoVqVtYLJJAPCia@sirena.co.uk>
References: <20251114185745.2838358-1-elder@riscstar.com>
 <20251114185745.2838358-3-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251114185745.2838358-3-elder@riscstar.com>
X-Cookie: marriage, n.:
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
Content-Type: multipart/mixed; boundary="===============0479316274599437445=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0479316274599437445==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m79HQmrzkmVitIUm"
Content-Disposition: inline


--m79HQmrzkmVitIUm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 14, 2025 at 12:57:43PM -0600, Alex Elder wrote:

> This patch introduces the driver for the SPI controller found in the
> SpacemiT K1 SoC.  Currently the driver supports master mode only.
> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
> supports both PIO and DMA mode transfers.

This looks mostly good but there's a bit of open coding that looks like
the driver could make more use of the core.

> @@ -0,0 +1,966 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SpacemiT K1 SPI controller driver
> + *
> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
> + * Copyright (c) 2023, spacemit Corporation.
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static bool k1_spi_map_dma_buffer(struct k1_spi_io *io, size_t len, void *dummy)
> +{
> +	struct device *dmadev = io->chan->device->dev;
> +	unsigned int nents = DIV_ROUND_UP(len, SZ_2K);
> +	struct sg_table *sgt = &io->sgt;
> +	void *bufp = io->buf ? : dummy;
> +	struct scatterlist *sg;
> +	unsigned int i;

The SPI core can do DMA mapping for you, the only thing this is doing
that's unusual is that it's imposing a fixed 2K limit on block sizes.
If this limit comes from the DMA controller (which looks to be the case
since we feed the entire table into the DMA controller at once?) the
core will already DTRT here, assuming the DMA controller correctly
advertises this restriction.

> +static bool k1_spi_map_dma_buffers(struct k1_spi_driver_data *drv_data)
> +{

...

> +	/* Don't bother with DMA if we can't do even a single burst */
> +	if (drv_data->len < dma_burst_size)
> +		return false;
> +
> +	/* We won't use DMA if the transfer is too big, either */
> +	if (drv_data->len > K1_SPI_MAX_DMA_LEN)
> +		return false;

The core has a can_dma() callback for this.

> +static int k1_spi_transfer_one_message(struct spi_controller *host,
> +					   struct spi_message *message)
> +{

...

> +	/* Hold frame low to avoid losing transferred data */
> +	val = readl(drv_data->base + SSP_TOP_CTRL);
> +	val |= TOP_HOLD_FRAME_LOW;
> +	writel(val, drv_data->base + SSP_TOP_CTRL);

This looks like it should be a set_cs() operation?

> +
> +	list_for_each_entry(transfer, &message->transfers, transfer_list) {
> +		reinit_completion(completion);
> +
> +		/* Issue the next transfer */
> +		if (!k1_spi_transfer_start(drv_data, transfer)) {
> +			message->status = -EIO;
> +			break;
> +		}
> +
> +		k1_spi_transfer_wait(drv_data);
> +
> +		k1_spi_transfer_end(drv_data, transfer);

Why not just implement the transfer_one() callback?  This just looks
like it's duplicating code.

> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
> +{

> +	/* Get status and clear pending interrupts */
> +	val = readl(drv_data->base + SSP_STATUS);
> +	writel(val, drv_data->base + SSP_STATUS);

This unconditionally acknowledges all interrupts even if we didn't
handle anything...

--m79HQmrzkmVitIUm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkaFagACgkQJNaLcl1U
h9B8Pgf/Zmjhqwvzz1HwGWIb7Kl/LZ6HBUoyYaZVe4SZCCreL+g9lu2juH2Nzs4r
mZzkYbZx4Xt+bbnKjx/QNjA2I+3oBNzOjpN4HydZatG/yQN9W7Bx64Xous2fXeU6
0RH400LlVzR10eCpPAVWUOg9v9zbotGBAN7hgY6pLm+9AOWkJf4HDqaymiY1ZUSZ
uusOILxXFySQ1/k4itKYVrzybcTEBfOqf3t2I3jAv/q1ADCHnsgI5NDvY1eIi5eX
4GPg14RiN7PXIyjUWERuVyjA9hvpXLhJQYeMgHa8ads9/t1Av1zkN+b904rMYDKQ
pn/l2ypyAVEkMGgblGryYghc4WPYtw==
=fc2P
-----END PGP SIGNATURE-----

--m79HQmrzkmVitIUm--


--===============0479316274599437445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0479316274599437445==--

