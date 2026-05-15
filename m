Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72772CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 09:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzqsQrDhyxrHitY8RezE7jgLJgEdiU1r/KwpB4jsv88=; b=gc5bBRqr/yQ1Kv
	tiPNLoeZvZwrnDTpmtUEwkOcT/RpiIWIMDCBDmElXgWahZdbqG2VJ6ZzbmtNuAyas5ub3Nej6JU+0
	pD3jYRef1R/KI9ndKFL4FDelKj+WBEpEMaspot3EzXciIefvF1STMXPU5FQfmFvZ2GbdRJdbhXM9A
	0JIxj1v2awAyPx1uRQwcCWDySgWZ41MRMrcXbMyeLbczZ/Vdu6DK+0y6fyrQVrqZvl7v3uZvOLNtG
	FP245EYWe3ZZzbxmEYB+eZt41KCrXrKmT2zVBHmhQpLGlBjKhxhe4aHssGl/Xgcslmx5+qehSlS7j
	IYCIJhqpP17S1351fZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNomp-00000007sQD-0VVT;
	Fri, 15 May 2026 09:24:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoml-00000007sOc-40t2
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 09:24:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wNomG-00020n-GL; Fri, 15 May 2026 11:24:16 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wNomC-000u10-1s;
	Fri, 15 May 2026 11:24:12 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wNomC-000000007wg-1zKf;
	Fri, 15 May 2026 11:24:12 +0200
Message-ID: <2fdfe98c2b99f3cb6b1e0af0f1db3df32d21288a.camel@pengutronix.de>
Subject: Re: [PATCH v2 09/12] reset: starfive: Introduce assert_polarity
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Michael Turquette	
 <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Paul
 Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Emil Renner
 Berthing	 <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>,  Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang	
 <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Fri, 15 May 2026 11:24:12 +0200
In-Reply-To: <20260512083521.3448-10-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
	 <20260512083521.3448-10-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_022447_994889_7DB6C7BF 
X-CRM114-Status: GOOD (  13.98  )
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

On Di, 2026-05-12 at 01:35 -0700, Changhuang Liang wrote:
> The JHB100 SoC supports inverted operations for reset
> assertion/deassertion, introducing the an assert_polarity field to
> distinguish between different operation logics.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/reset/starfive/reset-starfive-common.c | 18 +++++++++++++++---
>  drivers/reset/starfive/reset-starfive-common.h |  6 ++++++
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/reset/starfive/reset-starfive-common.c
> index 8ea142ecbd15..c7289c2b2a28 100644
> --- a/drivers/reset/starfive/reset-starfive-common.c
> +++ b/drivers/reset/starfive/reset-starfive-common.c
> @@ -68,7 +68,7 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
>  	reg_status = data->status + offset * sizeof(u32);
>  	done = data->asserted ? data->asserted[offset] & mask : 0;
>  
> -	if (!assert)
> +	if (data->info && data->info->assert_polarity == assert)
>  		done ^= mask;
>  
>  	spin_lock_irqsave(&data->lock, flags);
> @@ -90,13 +90,25 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
>  static int starfive_reset_assert(struct reset_controller_dev *rcdev,
>  				 unsigned long id)
>  {
> -	return starfive_reset_update(rcdev, id, true);

Please keep this.

> +	struct starfive_reset *data = starfive_reset_from(rcdev);
> +	bool assert = true;
> +
> +	if (data->info && data->info->assert_polarity)
> +		assert = false;

And move this into starfive_reset_update().

Consider renaming assert_polarity to active_low or similar, to align
nomenclature with other drivers.

> +
> +	return starfive_reset_update(rcdev, id, assert);
>  }
>  
>  static int starfive_reset_deassert(struct reset_controller_dev *rcdev,
>  				   unsigned long id)
>  {
> -	return starfive_reset_update(rcdev, id, false);
> +	struct starfive_reset *data = starfive_reset_from(rcdev);
> +	bool deassert = false;
> +
> +	if (data->info && data->info->assert_polarity)
> +		deassert = true;

Same as for starfive_reset_assert().

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
