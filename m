Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E01C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+nIqDYqH889Dlg8bZ2BnweMcpIzbk7PDD6C5MuU21o=; b=4qpgpu1oMdiIEw
	U4yctRpLACIPts7JX03/LKjzuzOW+pP20SrEgpaz3rR0ofCi5MRpUR8X/DYQ2NrC6Lu4+L4T+fk5B
	ddDe4jWAU6t5gQxRvyF/rfnH70Zuj9N3Z7CQeu3x/erPk3bR7OhW71682OwYOBhfEPUajuz/ODLKc
	M6MPxdMTeZdMpAYaKqvWfr9Qc15wQKNc5TjCanAH3giRF+Dkpuqsvg63axpU1YPN/W+7tVRcsyQ01
	s8Ov1A5ahMFpFmTIAj1OX0UFGCxJRDqsx6qAm0X7s8gnaRZavQgSRWyM4V8UbOfXIdX0MsvlEM/K5
	TZ9Pyt0ptLmfqdfaIsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCjF-0000000FOCP-3QOz;
	Fri, 27 Jun 2025 17:19:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBWo-0000000FCk3-0Z5C
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 16:02:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBWT-00038m-D8; Fri, 27 Jun 2025 18:01:53 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBWS-005dyk-2s;
	Fri, 27 Jun 2025 18:01:52 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBWS-000Olw-2X;
	Fri, 27 Jun 2025 18:01:52 +0200
Message-ID: <905dc44cf6e7fc4d4500b47f493ec073991a849b.camel@pengutronix.de>
Subject: Re: [PATCH v3 4/9] reset: mpfs: add non-auxiliary bus probing
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>, sboyd@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, 
 valentina.fernandezalanis@microchip.com, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Lee
 Jones <lee@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 18:01:52 +0200
In-Reply-To: <20250623-equate-ogle-0ce3293567e2@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
	 <20250623-equate-ogle-0ce3293567e2@spud>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_090214_175160_53CD70DA 
X-CRM114-Status: GOOD (  22.72  )
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

On Mo, 2025-06-23 at 13:56 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While the auxiliary bus was a nice bandaid, and meant that re-writing
> the representation of the clock regions in devicetree was not required,
> it has run its course. The "mss_top_sysreg" region that contains the
> clock and reset regions, also contains pinctrl and an interrupt
> controller, so the time has come rewrite the devicetree and probe the
> reset controller from an mfd devicetree node, rather than implement
> those drivers using the auxiliary bus. Wanting to avoid propagating this
> naive/incorrect description of the hardware to the new pic64gx SoC is a
> major motivating factor here.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v2:
> Implement the request to use regmap_update_bits(). I found that I then
> hated the read/write helpers since they were just bloat, so I ripped
> them out. I replaced the regular spin_lock_irqsave() stuff with a
> guard(spinlock_irqsave), since that's a simpler way of handling the two
> different paths through such a trivial pair of functions.
> ---
>  drivers/reset/reset-mpfs.c | 81 ++++++++++++++++++++++++++++++--------
>  1 file changed, 65 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index 574e59db83a4f..9c3e996f3a099 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -7,12 +7,15 @@
>   *
>   */
>  #include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/regmap.h>

Maybe sort these alphabetically.

>  #include <linux/reset-controller.h>
>  #include <dt-bindings/clock/microchip,mpfs-clock.h>
>  #include <soc/microchip/mpfs.h>
> @@ -27,11 +30,14 @@
>  #define MPFS_SLEEP_MIN_US	100
>  #define MPFS_SLEEP_MAX_US	200
>  
> +#define REG_SUBBLK_RESET_CR	0x88u
> +
>  /* block concurrent access to the soft reset register */
>  static DEFINE_SPINLOCK(mpfs_reset_lock);
>  
>  struct mpfs_reset {
>  	void __iomem *base;
> +	struct regmap *regmap;
>  	struct reset_controller_dev rcdev;
>  };
>  
> @@ -46,41 +52,50 @@ static inline struct mpfs_reset *to_mpfs_reset(struct reset_controller_dev *rcde
>  static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
>  
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
> +
> +	if (rst->regmap) {
> +		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), BIT(id));

mpfs_reset_lock is only needed for the readl()/writel() below.
regmap has its own locking.

> +		return 0;
> +	}
>  
>  	reg = readl(rst->base);
>  	reg |= BIT(id);
>  	writel(reg, rst->base);
>  
> -	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> -
>  	return 0;
>  }
>  
>  static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
>  
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
> +
> +	if (rst->regmap) {
> +		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), 0);

Same as above.


regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
