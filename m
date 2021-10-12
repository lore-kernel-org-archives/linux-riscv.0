Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A9DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:31:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D63D60240
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D63D60240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUAgrP3AVtKCOY626M8JxTANbZRSO0L2idrFQvg5/mc=; b=nSKg9KSyTDcceT
	eqA00opIEt5oXWWzrDQmtauTPHlLlhrqY+iYIc/o3uL7eXME9vEFHI2G5ixxx9D9ROVnNsLT36nTL
	/anhLRG4gjuErZvahnIrwuyXSR23p6IW+YFD8w2l2g1pz+FQ/S9QPmn5/Ya3ZKGCIZwKH5EUnsQet
	hSSqwWelILKpeYGaAb41QwIn7okbJf5p25DRN/J9p7SHkOAY9upIK1rnbkxDtdktkK32jzckZMvbr
	av3lEb0sdWT7wlq/ya9xmUncDEWPNpGB1u76vRDZVgee538gafg7t3q4AVeNFTpBqGwa9kuX65VAG
	HfCLfaiEmBvQKWQrFSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maIoX-00DCFM-6l; Tue, 12 Oct 2021 14:31:33 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maIoU-00DCEf-Kr
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 14:31:31 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1maIoT-00014a-Ay; Tue, 12 Oct 2021 16:31:29 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1maIoQ-00049f-J4; Tue, 12 Oct 2021 16:31:26 +0200
Message-ID: <99ddc44924bcb89110a74d3182b1d3eea623dce1.camel@pengutronix.de>
Subject: Re: [PATCH v1 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jiri Slaby
 <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, Sagar
 Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>, Atish
 Patra <atish.patra@wdc.com>,  Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Date: Tue, 12 Oct 2021 16:31:26 +0200
In-Reply-To: <20211012134027.684712-10-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-10-kernel@esmil.dk>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_073130_703608_3AD8393C 
X-CRM114-Status: GOOD (  17.85  )
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

On Tue, 2021-10-12 at 15:40 +0200, Emil Renner Berthing wrote:
> Add a driver for the StarFive JH7100 reset controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  MAINTAINERS                           |   7 ++
>  drivers/reset/Kconfig                 |   8 ++
>  drivers/reset/Makefile                |   1 +
>  drivers/reset/reset-starfive-jh7100.c | 164 ++++++++++++++++++++++++++
>  4 files changed, 180 insertions(+)
>  create mode 100644 drivers/reset/reset-starfive-jh7100.c
> 
[...]
> diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
> new file mode 100644
> index 000000000000..26bc5b59c1f3
> --- /dev/null
> +++ b/drivers/reset/reset-starfive-jh7100.c
> @@ -0,0 +1,164 @@
[...]
> +static int jh7100_reset_update(struct reset_controller_dev *rcdev,
> +			       unsigned long id, bool assert)
> +{
> +	struct jh7100_reset *data = jh7100_reset_from(rcdev);
> +	unsigned long offset = id / 32;
> +	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + 4 * offset;
> +	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + 4 * offset;
> +	u32 mask = BIT(id % 32);
> +	u32 done = jh7100_reset_asserted[offset] & mask;
> +	unsigned long flags;
> +	u32 value;
> +
> +	if (!assert)
> +		done ^= mask;
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	value = readl(reg_assert);
> +	if (assert)
> +		value |= mask;
> +	else
> +		value &= ~mask;
> +	writel(value, reg_assert);
> +
> +	do {
> +		value = readl(reg_status) & mask;
> +	} while (value != done);

Looking at the barebox driver, this could loop indefinitely if the
caller forgets to enable the corresponding peripheral clock. Maybe
use readl_poll_timeout() as a safety net.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
