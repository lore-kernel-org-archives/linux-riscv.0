Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22478D74EC2
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0THU8erHYqsXe3PzSqjN2ZtLmG+Qugltfa4QDuJOr4=; b=ZmK0Hn9K1JHZd5
	yNe4O1tsI8AYQOyu7HaIDl7mUkilRHYPBN4te5iJ3gB8FMFAOwSgYJoF7qCCX/sl/WjbF31xwjshu
	cOwyomIDbfyRWBrWuY6PJBwcFcYLfsaCRW2va8wBN6oaOnTvtl8nWjP23OA30zrrJLW/UFr3yUgwQ
	mGtp8557wp8/lEKAW9YxRXR7NMkFpvXUYLvgWftg/zj7vSyk+nf9qyHnWaAic8TICUnomWhtQ6eVX
	TyeCzZiM4xJWL8jwnJOg0cbtDemtb9993pZt+/P8oKW8LLw28wEJ8qSpoT9lQduJP+vKgtdcBG7h+
	SzaO6gmkIWLxd8x/ZScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGmG-00000008wDe-1t7g;
	Fri, 23 Jan 2026 13:00:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGmC-00000008wCu-3w00
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 13:00:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vjGmA-0001AG-1F; Fri, 23 Jan 2026 14:00:34 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vjGm8-0025tQ-1d;
	Fri, 23 Jan 2026 14:00:31 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vjGm7-000000006dr-38JD;
	Fri, 23 Jan 2026 14:00:31 +0100
Message-ID: <1adc068bbf1a15b1b10651f6ad9385415f6d4227.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Drew Fustini	
 <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com,
 	bmasney@redhat.com
Date: Fri, 23 Jan 2026 14:00:31 +0100
In-Reply-To: <20260122-atlantis-clocks-v2-2-c66371639e66@oss.tenstorrent.com>
References: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
	 <20260122-atlantis-clocks-v2-2-c66371639e66@oss.tenstorrent.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_050036_978372_28A2C5A8 
X-CRM114-Status: GOOD (  17.52  )
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

On Do, 2026-01-22 at 16:36 -0600, Anirudh Srinivasan wrote:
> Adds Atlantis Reset Controller and auxiliary device definitions for
> reset to share same regmap interface as clock controller.
> 
> This version of the reset controller driver covers resets from the RCPU
> syscon.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  MAINTAINERS                                |   2 +
>  drivers/reset/Kconfig                      |  11 ++
>  drivers/reset/Makefile                     |   1 +
>  drivers/reset/reset-tenstorrent-atlantis.c | 158 +++++++++++++++++++++++++++++
>  include/soc/tenstorrent/atlantis-syscon.h  |  26 +++++
>  5 files changed, 198 insertions(+)
> 
[...]
> diff --git a/drivers/reset/reset-tenstorrent-atlantis.c b/drivers/reset/reset-tenstorrent-atlantis.c
> new file mode 100644
> index 000000000000..2e7f09409f79
> --- /dev/null
> +++ b/drivers/reset/reset-tenstorrent-atlantis.c
> @@ -0,0 +1,158 @@
[...]
> +static int atlantis_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
> +{
> +	unsigned int val;
> +	struct atlantis_reset_controller *rst =
> +		to_atlantis_reset_controller(rcdev);
> +	const struct atlantis_reset_data *data = &rst->data->reset_data[id];
> +	unsigned int mask = BIT(data->bit);
> +	struct regmap *regmap = rst->regmap;
> +
> +	if (data->active_low ^ assert)
> +		val = mask;
> +	else
> +		val = ~mask;

		val = 0;

The ~mask bits will be ignored anyway.

[...]
> diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
> new file mode 100644
> index 000000000000..2c6387e5c21a
> --- /dev/null
> +++ b/include/soc/tenstorrent/atlantis-syscon.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 Tenstorrent
> + */
> +#ifndef __SOC_ATLANTIS_SYSCON_H__
> +#define __SOC_ATLANTIS_SYSCON_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>

#include <linux/auxiliary_bus.h>

struct regmap;

> +
> +struct atlantis_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};
> +
> +#define to_atlantis_ccu_adev(_adev) \
> +	container_of((_adev), struct atlantis_ccu_adev, adev)

Please use an inline function instead of a macro.

> +
> +/* RCPU Reset Register Offsets */
> +#define RCPU_BLK_RST_REG	0x001c
> +#define LSIO_BLK_RST_REG	0x0020
> +#define HSIO_BLK_RST_REG	0x000c
> +#define PCIE_SUBS_RST_REG	0x0000
> +#define MM_RSTN_REG		0x0014

Why not move these into reset-tenstorrent-atlantis.c, they are not part
of the interface between clock and reset drivers.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
