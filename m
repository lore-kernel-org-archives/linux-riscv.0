Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A763BCD8CA8
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 01:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOBet3ILduNMg2DYDDI9do1DkryADGARWRlgWL8qTW8=; b=lDPBNWS6dNo+Uo
	pUm9PWJG0LL3IZMh/q5qOIL4HUBO7vdIVunZ31N9uD+Kw7yfy+RunwlQc8TlM3MJUH16SbPr9qf6Q
	8L9Dbk+KuiZBNkAPCjOna6UPeorTa2evgtVxO9/dn9IGJh9a7FGuivnk4AeUKs//hPJ8QMsvkUdfx
	Ek3kWWVtG4kZ7JgNjEmAoBNkEF99uI135TkELxNoKfQt1/jisofU8LQg1Pq6pEzHVgP+zEE0Zdlcn
	fRW16NKmgCKfJRQvtpcBdryDKxGmecNAOyxIXb0ZkWcbjs4GpJpG0RliIXuV+fdJIe4caL9qX39Xh
	hOCKOVJ8tSOHDp0ZgvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYvv6-0000000DQyL-1K1L;
	Mon, 15 Jun 2026 01:15:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYvv5-0000000DQyE-1oGw
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 01:15:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE1E943B8D;
	Mon, 15 Jun 2026 01:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18ED21F000E9;
	Mon, 15 Jun 2026 01:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781486118;
	bh=hGK8hBUI3VJwq85vtwBACfkguai9KZPSsva45uV6o8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fsEMYjGjf5tatKUMlRl+xWUzn0TKC1A34OI58zH3ZiUeMP2E8i4XmYEF87azothCT
	 9ek/9edj0jdsw9MFuK0kdpL20DR/mrms3qf470wYg2dgDQMMLKuGiT+wtQC2CJ1Irt
	 96X//sIvLVuP+AkmQ0rprEtDV7ONEE16OC7YKbdfa/4SJQpcPKU3GG6uXYfpjXgY+f
	 I1Dmgx/k3D8GpNaVwMuXYGflsHsWx4bWJeJJncMX1cWGQlBwSC8HCkXKIj+MO+ipx2
	 DDfVNbPIp01h4wy3Ycnx1wRs7HXgWPn6Sr/emkSffsx9YueSBT6T8VPHDqHIq2NVf1
	 RSOoraI21QF8Q==
Date: Mon, 15 Jun 2026 01:15:16 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3] riscv: dts: spacemit: Use symbolic PDMA request
 numbers on K1
Message-ID: <20260615011516-GKB1002079@kernel.org>
References: <20260611-b4-k1-pdma-req-macros-v3-1-ae8416052571@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260611-b4-k1-pdma-req-macros-v3-1-ae8416052571@gmail.com>
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

Hi Guodong,
 The patch itself looks good to me, only few minor comments

On 09:17 Thu 11 Jun     , Guodong Xu wrote:
> Add a local DTS header, k1-pdma.h, that gives symbolic names to the K1
> PDMA request numbers. These request numbers are hardware-fixed; their
> allocation can be found in K1 manual.
> 
..
> Replace the hard-coded numbers in the SPI3 "dmas" property with the
> K1_PDMA_SPI3_RX/TX macros.
> 
As it's too obvious that people can tell from the diff, then I feel it's
unnecessary to repeat in commit message..

> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> Add a local DTS header naming the K1 PDMA request lines and convert the
> current user (the K1 SPI3 node) to the new K1_PDMA_* macros.
..
> The request
> numbers come from the SpacemiT K1 User Manual [1], Chapter 9.4.3 DMA
> Connectivity & Assignments.
> 
I'd suggest to put above into commit message, as more detailed description.
Here is my attempt to slightly reconstruct the commit message:

The PDMA request numbers (DRQ) are fixed values specific to the SoC from a
hardware perspective. The detailed definition can be found in K1 User Manual,
Chapter 9.4.3 DMA Connectivity & Assignments. Add a DTS header file to define
the symbolic names for the DRQs of non-secure DMA peripherals.

> [1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md
> 
> Changes in v3:
> - Move the request-number macros from include/dt-bindings/dma/ to a local
>   DTS header arch/riscv/boot/dts/spacemit/k1-pdma.h (Conor).
> - Squash the header and its user into a single patch.
> - Link to v2: https://patch.msgid.link/20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com
> 
> Changes in v2:
> - Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the request
>   numbers are hardware-fixed and unused by the driver (Conor)
> - Link to v1: https://patch.msgid.link/20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com
> 
> BR,
> Guodong Xu
> ---
>  arch/riscv/boot/dts/spacemit/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi   |  4 ++-
>  2 files changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pdma.h b/arch/riscv/boot/dts/spacemit/k1-pdma.h
> new file mode 100644
> index 0000000000000..65112d5847add
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-pdma.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides DMA request number for non-secure peripherals of
> + * SpacemiT K1 PDMA.
slightly less redundant,
  DMA request number (DRQ) defintion for non-secure peripherals

> + *
> + * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
> + */
> +
> +#ifndef _DTS_SPACEMIT_K1_PDMA_H
> +#define _DTS_SPACEMIT_K1_PDMA_H
> +
> +#define K1_PDMA_UART0_TX	3
> +#define K1_PDMA_UART0_RX	4
> +#define K1_PDMA_UART2_TX	5
> +#define K1_PDMA_UART2_RX	6
> +#define K1_PDMA_UART3_TX	7
> +#define K1_PDMA_UART3_RX	8
> +#define K1_PDMA_UART4_TX	9
> +#define K1_PDMA_UART4_RX	10
> +#define K1_PDMA_I2C0_TX		11
> +#define K1_PDMA_I2C0_RX		12
> +#define K1_PDMA_I2C1_TX		13
> +#define K1_PDMA_I2C1_RX		14
> +#define K1_PDMA_I2C2_TX		15
> +#define K1_PDMA_I2C2_RX		16
> +#define K1_PDMA_I2C4_TX		17
> +#define K1_PDMA_I2C4_RX		18
> +#define K1_PDMA_SPI3_TX		19
> +#define K1_PDMA_SPI3_RX		20
> +#define K1_PDMA_I2S0_TX		21
> +#define K1_PDMA_I2S0_RX		22
> +#define K1_PDMA_I2S1_TX		23
> +#define K1_PDMA_I2S1_RX		24
> +#define K1_PDMA_UART5_TX	25
> +#define K1_PDMA_UART5_RX	26
> +#define K1_PDMA_UART6_TX	27
> +#define K1_PDMA_UART6_RX	28
> +#define K1_PDMA_UART7_TX	29
> +#define K1_PDMA_UART7_RX	30
> +#define K1_PDMA_UART8_TX	31
> +#define K1_PDMA_UART8_RX	32
> +#define K1_PDMA_UART9_TX	33
> +#define K1_PDMA_UART9_RX	34
> +#define K1_PDMA_I2C5_TX		35
> +#define K1_PDMA_I2C5_RX		36
> +#define K1_PDMA_I2C6_TX		37
> +#define K1_PDMA_I2C6_RX		38
> +#define K1_PDMA_I2C7_TX		39
> +#define K1_PDMA_I2C7_RX		40
> +#define K1_PDMA_I2C8_TX		41
> +#define K1_PDMA_I2C8_RX		42
> +#define K1_PDMA_CAN0_RX		43
> +#define K1_PDMA_QSPI_RX		44
> +#define K1_PDMA_QSPI_TX		45
> +
> +#endif /* _DTS_SPACEMIT_K1_PDMA_H */
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 08a0f28d011fe..7d414e15d2cc2 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -6,6 +6,8 @@
>  #include <dt-bindings/clock/spacemit,k1-syscon.h>
>  #include <dt-bindings/phy/phy.h>
>  
> +#include "k1-pdma.h"
> +
>  /dts-v1/;
>  / {
>  	#address-cells = <2>;
> @@ -1094,7 +1096,7 @@ spi3: spi@d401c000 {
>  				clock-names = "core", "bus";
>  				resets = <&syscon_apbc RESET_SSP3>;
>  				interrupts = <55>;
> -				dmas = <&pdma 20>, <&pdma 19>;
> +				dmas = <&pdma K1_PDMA_SPI3_RX>, <&pdma K1_PDMA_SPI3_TX>;
>  				dma-names = "rx", "tx";
>  				status = "disabled";
>  			};
> 
> ---
> base-commit: 793cc54475b49b5b558902b5c13e4bfe66530a50
> change-id: 20260607-b4-k1-pdma-req-macros-8d276d0126df
> 
> Best regards,
> --  
> Guodong Xu <docular.xu@gmail.com>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
