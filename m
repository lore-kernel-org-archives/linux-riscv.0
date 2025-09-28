Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AC6CAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcOPBjzRUJw2sLy9+uUeXrpVIx14p2+6xlDWQCdAroA=; b=ahHnKxJ4KxRX5u
	AsIfhe569/leQN4lHLMPx1PJBRYjMV0j5CON0vx2vBM9LKKKG39HfNgnV9cZJfeUOheDHAOYDU0qf
	+ztlKUccHnpxF7wCu97CMrSg6Nhvu/Q0UYe/MjX8Ev54fu+fCjwT72IYsos7jsDDLxBrd6rLepjmT
	+nFhQnubY81Pyx3ilTuc5kniShJce+Nh7AoTHjDL+uSr4EFVuRyy+S/5JIBO0C7Ue+158Jrry4jzt
	xQgSCXYsTymkRd4iwjOVQiaWiKkBu0oWAFBQnAv8gKE4wGIXo5aXdLee3vEjFN+wbgC1OVBgdaO+V
	7I5HK9sKzPS+dlzB39wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2qdj-0000000FWRn-2rx5;
	Sun, 28 Sep 2025 12:36:31 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2qdh-0000000FWQJ-2cC8
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 12:36:30 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BCC58340D91;
	Sun, 28 Sep 2025 12:36:27 +0000 (UTC)
Date: Sun, 28 Sep 2025 20:36:22 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
Message-ID: <20250928123622-GYA1347020@gentoo.org>
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-3-elder@riscstar.com>
 <20250922230639-GYA1303776@gentoo.org>
 <786f4a5e-f62e-4cd0-a017-7b61408f34aa@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <786f4a5e-f62e-4cd0-a017-7b61408f34aa@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_053629_689176_77026FF2 
X-CRM114-Status: GOOD (  24.46  )
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

Hi Alex,

On 07:49 Tue 23 Sep     , Alex Elder wrote:
> On 9/22/25 6:06 PM, Yixun Lan wrote:
> > Hi Alex,
> > 
> > On 11:17 Mon 22 Sep     , Alex Elder wrote:
> >> This patch introduces the driver for the SPI controller found in the
> >> SpacemiT K1 SoC.  Currently the driver supports master mode only.
> >> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
> >> supports both PIO and DMA mode transfers.
> >>
> >> Signed-off-by: Alex Elder <elder@riscstar.com>
> >> ---
..
> 
> >> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
> >> new file mode 100644
> >> index 0000000000000..2b932d80cc510
> >> --- /dev/null
> >> +++ b/drivers/spi/spi-spacemit-k1.c
> >> @@ -0,0 +1,965 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Support for SpacemiT K1 SPI controller
> >> + *
> >> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
> >> + * Copyright (c) 2023, spacemit Corporation.
> >> + */
> 
> . . .
> 
> >> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
> >> +{
> >> +	struct k1_spi_driver_data *drv_data = dev_id;
> >> +	bool rx_done;
> >> +	bool tx_done;
> >> +	u32 val;
> >> +
> >> +	/* Get status and clear pending interrupts */
> >> +	val = readl(drv_data->base + SSP_STATUS);
> >> +	writel(val, drv_data->base + SSP_STATUS);
> >> +
> >> +	if (!drv_data->message)
> >> +		return IRQ_NONE;
> >> +
> >> +	/* Check for a TX underrun or RX underrun first */
> > s/RX underrun/RX overrun/
> 
> OK.
> 
> >> +	if (val & (SSP_STATUS_TUR | SSP_STATUS_ROR)) {
> >> +		/* Disable all interrupts on error */
> >> +		writel(0, drv_data->base + SSP_INT_EN);
> > should clear status of SSP_STATUS instead of disabling ISR, see commet below
> 
> The status is cleared immediately after reading, above.  We hold
> the status value so we can act on the current state of the FIFOs.
> 
I'm surprised by this, do you mean the status will be cleared by reading?
can you double checck and prove it? by reading twice and compare?

while according to the docs - 18.2.4.6 SSSR REGISTERS, the status bits has
two types: 
  R - Read only
  R/W1C - Read only, write 1 to clear

if you're right, then the docs should be fixed.

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
