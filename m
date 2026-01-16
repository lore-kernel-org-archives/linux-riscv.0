Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09CDD4A609
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1roqWD9SfNQvjfeFHUlewyVRCA51qbM6cLaQ62dfeQM=; b=gPct+zjqeqSSJX
	bxVoRLM1gCQuJTssMH1+d9QP4ZEBCYbVBqNRGgvdR5fwAzhBALq/k1JefqKEBIAQai8FPlDEhHGvb
	HvrdmrwAcC0osVCP223xuuOavgpPS5SFwclIPg66vbmxcyjUo6otGnBZXVVv1HOoJ0a9123iu3V1+
	ix5HCooNmt0fGpw1EoGGsg6PNehY36+TWsstF9BFghX8imycOkj4F1nbuMiVIP8h93Dh/ZdBDHd3/
	MQgkeHPxr2HwMCvKHbBe9NL9qSICU+9CMF54htXOGM/I0gm2jYjgFLJjxknlGX5r75TtKEuFYSPeu
	28xPmtH5aofDtPGS+J9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfmZ-0000000Douw-40bI;
	Fri, 16 Jan 2026 09:06:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfmZ-0000000Douo-0ivl
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 09:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7278A60167;
	Fri, 16 Jan 2026 09:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9526AC116C6;
	Fri, 16 Jan 2026 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554373;
	bh=le8Zgq0NLp5H0KZpWSKIGxlPn+iqhSKGcu3U97owM5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTIPOGS41uTKyeqT/qIxVxpkln1XbISxzwXitSSxGezwZ/lS3f6KqQ64ZTLUtoiVz
	 FXW1NcmDyjoIeQtLIbHuwLb5tlevf0K8mrJXugfRvfYGUmebGvl2OLE21f9mazm1Mr
	 jWd1SLLnZghdXxJymgTjZ98vX0I/LC7bpP32ETp53c5x8cI1MiHJ37iIgKsb8AUTY2
	 AJ/jqVfuDroIHhf77UqRKKul/sQi6401HbKvkCqV9nK7WKT3OAy7t+crNjUI526cwz
	 Rp40AUvNVChBT3cOUwIkv/VtVoFK8Dao+2F5NqDySI3sLx9tLbAUx1JzucmlzjnmM0
	 i67yfVHpMC5/g==
Date: Fri, 16 Jan 2026 10:06:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 2/8] soc: tenstorrent: Add header with Atlantis syscon
 register offsets
Message-ID: <20260116-debonair-tangible-reindeer-debcee@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-2-7356e671f28b@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-2-7356e671f28b@oss.tenstorrent.com>
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

On Thu, Jan 15, 2026 at 05:42:01PM -0600, Anirudh Srinivasan wrote:
> Document register offsets used for controlling clocks in Atlantis
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  MAINTAINERS                               |  1 +
>  include/soc/tenstorrent/atlantis-syscon.h | 38 +++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19a98b1fa456..4a2017d647b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22538,6 +22538,7 @@ F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
>  F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
> +F:	include/soc/tenstorrent/
>  
>  RISC-V THEAD SoC SUPPORT
>  M:	Drew Fustini <fustini@kernel.org>
> diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
> new file mode 100644
> index 000000000000..b15dabfb42b5
> --- /dev/null
> +++ b/include/soc/tenstorrent/atlantis-syscon.h

There is no user of this. Split your work in logical patches. Adding
unused header is not a meaningful logical split because it is unused.

> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2026 Tenstorrent
> + */
> +#ifndef __SOC_ATLANTIS_SYSCON_H__
> +#define __SOC_ATLANTIS_SYSCON_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +/* RCPU Clock Register Offsets */
> +#define RCPU_PLL_CFG_REG 0x0000
> +#define RCPU_NOCC_PLL_CFG_REG 0x0004
> +#define RCPU_NOCC_CLK_CFG_REG 0x0008
> +#define RCPU_DIV_CFG_REG 0x000C
> +#define RCPU_BLK_CG_REG 0x0014
> +#define LSIO_BLK_CG_REG 0x0018
> +#define PLL_RCPU_EN_REG 0x11c
> +#define PLL_NOCC_EN_REG 0x120
> +#define BUS_CG_REG 0x01FC

Completely unreadable: missing any sort of reasonable indent between
values.

Why do you need to doicument register values and provide them to all
kernel drivers?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
