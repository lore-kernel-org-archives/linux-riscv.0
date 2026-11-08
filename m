Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104E3606A330
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tbi1tqvU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6m3DuiP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8rcj8JPhE9S4n7GJLzkUKYyyMVoJ0mQ+d1AzvKKNCdg=; b=tbi1tqvUFLLn8xuAttwASrwnv7
	q+SHsu+BWhe22r3nOXOvjfgB0g8Xm0nJGDz/zSNle9BCWiUNwiHCqwJxa6zOZRfsdXiwwxHsqovJe
	4VJGWVHg0kTFZ3ue4+kpfmg5Hk8xazPJEkHZPxMpLarMd8ECnB6M0MRB8mAs9Rq6e+CblXn813j7h
	uQqKfW5CfxtYSU8GzkBIV7koG0OXTzudHUJaGIIDeufyikhsUX4UKOly0aYvL9S8EhVrCo2w6t4iR
	D61s6hbOQUmySW2cZmPW44mYPGuiQppzmNyUbn5OAalDUB0uCiUGuZb/zl5Yebw9qJ775USu1ZCXv
	EOY0VWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0FK-0000000Fyve-3LwC;
	Sun, 08 Nov 2026 10:35:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0FJ-0000000FyvR-42Vh;
	Sun, 08 Nov 2026 10:35:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9550615B5;
	Sun,  8 Nov 2026 10:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634381F0089F;
	Sun,  8 Nov 2026 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794134132;
	bh=biMNnuk3Zlmj9i5odT0zZonccKXcOUkOod+xD4mMBfI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=S6m3DuiPCro/XVd9cTVILY+yPCtzVh9cHIV+UfdN6l8+YrF40Kn2cFHQ8q2z1DCtD
	 4s8UKkireKEwxex+AFmUaSCEcEbwna400Hlm3HcUr961wosTKtozeUVLHX0k0hgrGv
	 uZ6aTNHBksLDsX3C5IogzhsQTh3Xs2kdeyhJHHOmpaOoKvXYIB9Gl3AZj7mXsDBz5o
	 DQa5n3qXqViIIUWS1gpYcwxv6BrOmAh9CH/wvwTdBtscnuQyIpNj7m+BsLgrITzmsN
	 ECGCu7Tq6B5AdbnecxOgF9vIU0YfCNvDhOsOnyyrN2tYALCRMaBr/OyvfiBufmCWxv
	 KNAz4FCcHKIKw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7861D2BDF2ED;
	Sun, 08 Nov 2026 10:35:30 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 17/25] spi: atcspi200: add optional interrupt support
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jun Chang <jun.chang@metanoia-comm.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Ben Zong-You Xie <ben717@andestech.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>, 
 Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>, 
 Minas Harutyunyan <hminas@synopsys.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-17-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-17-86087eaf5af4@bootlin.com>
Date: Sun, 08 Nov 2026 10:35:28 +0000
Message-Id: <179413412862.3424803.13503591139483354665.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nZ4p7qaMdUmUqeh0nBYdZQklXm66HLo9DRQs7Nyk6nw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+BBSp6d+beeDcy2WPH+13K7z/edOeA5c2WgYkFUt/2
 b5CKJGPq6OUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATSVFgZPg3m+NHgS/D5yks
 Qh36OjbTa86LF9nmHJ6w4fPxPbf/ip8GqtBw2vv6YbL1paYdsqznI81qzuZ5rO73OWFmLW6uxv2
 KBwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> For PIO transfers, the driver busy-polls the FIFO empty/full flags and
> the SPI active bit for completion. When the controller's interrupt is
> available, use it instead of polling to keep the FIFO serviced and to
> detect the end of transfer.

> +static irqreturn_t atcspi_irq(int irq, void *dev_id)
> +{

> +	if (st & ATCSPI_TX_FIFO_INT) {
> +		n = min(atcspi_tx_fifo_avail(spi, status), spi->tx_words);
> +		atcspi_fifo_write(spi, spi->tx_ptr, n);
> +		spi->tx_words -= n;
> +		spi->tx_ptr = (unsigned char *)spi->tx_ptr + n * num_byte;

You're casting away const here for some reason...

> +	regmap_read(spi->regmap, ATCSPI_CTRL, &ctrl);
> +	ctrl &= ~(CTRL_TX_THRES | CTRL_RX_THRES);
> +	ctrl |= FIELD_PREP(CTRL_TX_THRES, spi->txfifo_size / 2) |
> +	FIELD_PREP(CTRL_RX_THRES, spi->rxfifo_size / 2);

Weird indentation of the continuation.

> +	if (spi->tx_words) {
> +		unsigned int status, nb_words;
> +
> +		regmap_read(spi->regmap, ATCSPI_STATUS, &status);
> +		nb_words = min(atcspi_tx_fifo_avail(spi, status), spi->tx_words);
> +		atcspi_fifo_write(spi, spi->tx_ptr, nb_words);
> +		spi->tx_words -= nb_words;
> +		spi->tx_ptr = (unsigned char *)spi->tx_ptr + nb_words * num_byte;
> +	}
> +
> +	regmap_write(spi->regmap, ATCSPI_INTR_ST, ATCSPI_INTR_ALL);
> +	regmap_write(spi->regmap, ATCSPI_INTR_EN, en);

Do we need the TX interrupt if everything fit into the FIFO?

> +	regmap_write(spi->regmap, ATCSPI_INTR_EN, 0);
> +	regmap_write(spi->regmap, ATCSPI_INTR_ST, ATCSPI_INTR_ALL);

This just blindly clears all the interrupts, including the under/overrun
interrupts but we didn't handle them all.

-- 
Mark Brown <broonie@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
