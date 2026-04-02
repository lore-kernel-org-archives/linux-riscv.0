Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5DED39418
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRWFRUIjwHDbvuWYTzy37ihLsrIxis9Gd73HeR7gBCw=; b=q1CH6CymUhaI2R
	h9omhYBmeWvaSH1/UYfcGfhwvhqmBqNyxl6cVe6rKPYLjxjX3zsrLsB7C8ukZizYnyySlc8916PgS
	pdyttsf1nqq0hIk9+Rm7unOY0BJX9ElAy5PBDubV9gZDhTKkfkPRUEIM00y5s00RS/M32qCpopEhI
	XixSwA76XMb4WJSIp2f7SVeXd8QEw2OcoJxudrgI96HvaPfW2iXUKqzpABVsk8Z+NzyZKSFKVWc4/
	H1Q+VmcATgK0ZqY/kvZsYdRWaKrsWZ4K8mRpKLwSqxLR31csO5shEdKTWhbTk+/neeTwtVDLDBDYI
	UAu2IarmEqw/JhB13DZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8H4S-0000000Ha04-3aG9;
	Thu, 02 Apr 2026 12:22:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8H4Q-0000000HZzk-1xWI
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 12:22:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8H4B-0002P0-Bs; Thu, 02 Apr 2026 14:22:31 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8H49-003N51-1P;
	Thu, 02 Apr 2026 14:22:29 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8H49-000000009AC-1Nzj;
	Thu, 02 Apr 2026 14:22:29 +0200
Message-ID: <2d3ef7359f63fb364cb7bc13b721132894428874.camel@pengutronix.de>
Subject: Re: [PATCH v1 05/22] dt-bindings: clock: Add StarFive JHB100
 System-0 clock and reset generator
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Michael Turquette	
 <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti	 <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, Kees Cook	
 <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, Richard
 Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org, Sia Jee Heng
	 <jeeheng.sia@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, Ley
 Foon Tan <leyfoon.tan@starfivetech.com>
Date: Thu, 02 Apr 2026 14:22:29 +0200
In-Reply-To: <20260402105523.447523-6-changhuang.liang@starfivetech.com>
References: <20260402105523.447523-1-changhuang.liang@starfivetech.com>
	 <20260402105523.447523-6-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_052246_510691_E080EFD7 
X-CRM114-Status: GOOD (  15.02  )
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

On Do, 2026-04-02 at 03:55 -0700, Changhuang Liang wrote:
> Add bindings for the System-0 clocks and reset generator (SYS0CRG) on
> JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../clock/starfive,jhb100-sys0crg.yaml        | 63 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 56 +++++++++++++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   | 30 +++++++++
>  3 files changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys0crg.yaml
>  create mode 100644 include/dt-bindings/clock/starfive,jhb100-crg.h
>  create mode 100644 include/dt-bindings/reset/starfive,jhb100-crg.h
>
[...]
> diff --git a/include/dt-bindings/reset/starfive,jhb100-crg.h b/include/dt-bindings/reset/starfive,jhb100-crg.h
> new file mode 100644
> index 000000000000..71affdcdf733
> --- /dev/null
> +++ b/include/dt-bindings/reset/starfive,jhb100-crg.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_RESET_STARFIVE_JHB100_CRG_H__
> +#define __DT_BINDINGS_RESET_STARFIVE_JHB100_CRG_H__
> +
> +/* SYS0CRG resets */
> +#define JHB100_SYS0RST_RESOURCE_ARB					0

Where are resets 1 and 2, ...

> +#define JHB100_SYS0RST_SYS0_IOMUX_PRESETN				3
> +#define JHB100_SYS0RST_SYS0H_IOMUX_PRESETN				4
> +#define JHB100_SYS0RST_RST_ADAPTOR_TIMEOUT_RSTN				5

... where are 6-13?

> +
> +#define JHB100_SYS0RST_BMCPCIERP_RSTN_BUS				14
[...]

If there are non-reset bits in these registers, please enumerate reset
controls in a contiguous range for this binding and add a mapping table
in the driver.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
