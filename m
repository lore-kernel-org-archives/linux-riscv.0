Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565ACC531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vy4eAbsx11ZL2ssVVuyoAdpuIAre8Ojt7FrMFNVEbw4=; b=iHvHakodm8ErqZ
	fYAT+aloJkduUwVyu5ghLF+SZxApsigPydOb8SnYhHqpbF3aQiFUFrP2TyfYh19TIoh6x/JFF+FOA
	DsTiaLEVGQDvBRRBnPQlFLGKtQEKR+4CVGw5PdHMCI3h6JrYXcCdWLwddlA8q4C2eh0Z1/uLg4wqp
	tM4Wuaykmdgb75iv+2p5HNy+aZ7m7sUVrNke1Je7X0FOy8dd7IYXmESYo6a4lgCNi8S1h2KeegIdM
	08rqn3lPitIR5mX99zgeMrynAeL1YXKaZvnSjRX83aI1pGfx7yKZA+Cnwm1hMHVbvGIQd+v9L4xpy
	vwwA20s/+ZuwUOZQKgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncET-00000000N0a-268q;
	Sat, 25 Jul 2026 13:16:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncES-00000000N0L-0ANx
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 13:16:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56022600AA;
	Sat, 25 Jul 2026 13:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ADE1F000E9;
	Sat, 25 Jul 2026 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784985359;
	bh=kT5XrLFshmt7cvuC4cpsKMz5cnoF+ktfQ+kqzEfCPuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SFJfQxef8TkdhDhuHbCYgas9g0LlIQnUIIhdbCouH/cKjxxpZbbujjdsrJpiW9nLE
	 +yfo5ZMcHjUKhAhKGmrfJvMw7pu2Y4s424P5tM4KL2tCbDYPCYkZdhOCcmJrqOG95b
	 2OTNB/fhFOhPyGGVryhbRfVE14Ag9lAgc2/JDvXOmi4yDcrq/55Ty4ETL0a8FADyCO
	 OOHTTQGukDWXnARLvg3GnsHUFF2VkGCZEWmc//4FMXZJ8YQFwXb51qcIaR8gW6w8zT
	 DvckpRVH3c4HHuRBHyRhfItKxBnhHqObNnH76AabdflG1pqb2eyfpqk0TveoLeyI1Z
	 YXzavmMCwjQrQ==
Date: Sat, 25 Jul 2026 13:15:55 +0000
From: Yixun Lan <dlan@kernel.org>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, wefu@redhat.com,
	liyeshan <yeshan.li@spacemit.com>,
	Guodong Xu <docular.xu@gmail.com>
Subject: Re: [PATCH 1/4] riscv: dts: spacemit: add K3 PDMA request numbers
Message-ID: <20260725131555-GKF77545@kernel.org>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
 <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-1-969a1b0f783f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-1-969a1b0f783f@gmail.com>
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

Hi Zhengyu,

On 07:45 Fri 17 Jul     , Zhengyu He wrote:
> From: liyeshan <yeshan.li@spacemit.com>
> 
> Add a local DTS header that gives symbolic names to the SpacemiT K3
> PDMA request lines of the non-secure peripherals. Device trees can use
> these K3_PDMA_* macros instead of hard-coded request numbers when wiring
> a peripheral "dmas" property.
> 
> Signed-off-by: liyeshan <yeshan.li@spacemit.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> Signed-off-by: Zhengyu He <hezhy472013@gmail.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-pdma.h | 83 ++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pdma.h b/arch/riscv/boot/dts/spacemit/k3-pdma.h
> new file mode 100644
> index 000000000000..a5b723ad616a
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-pdma.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * DMA request number (DRQ) definitions for non-secure peripherals of
> + * the SpacemiT K3 PDMA.
> + *
> + * Copyright (c) 2025 SpacemiT
> + * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
> + */
> +
> +#ifndef _DTS_SPACEMIT_K3_PDMA_H
> +#define _DTS_SPACEMIT_K3_PDMA_H
> +
> +/* UART DMA request numbers */
> +#define K3_PDMA_UART0_TX	3
> +#define K3_PDMA_UART0_RX	4
> +#define K3_PDMA_UART2_TX	5
> +#define K3_PDMA_UART2_RX	6
> +#define K3_PDMA_UART3_TX	7
> +#define K3_PDMA_UART3_RX	8
> +#define K3_PDMA_UART4_TX	9
> +#define K3_PDMA_UART4_RX	10
> +#define K3_PDMA_UART5_TX	25
> +#define K3_PDMA_UART5_RX	26
> +#define K3_PDMA_UART6_TX	27
> +#define K3_PDMA_UART6_RX	28
> +#define K3_PDMA_UART7_TX	29
> +#define K3_PDMA_UART7_RX	30
> +#define K3_PDMA_UART8_TX	31
> +#define K3_PDMA_UART8_RX	32
> +#define K3_PDMA_UART9_TX	33
> +#define K3_PDMA_UART9_RX	34
> +#define K3_PDMA_UART10_TX	53
> +#define K3_PDMA_UART10_RX	54
> +
> +/* I2C DMA request numbers */
> +#define K3_PDMA_I2C0_TX	11
> +#define K3_PDMA_I2C0_RX	12
> +#define K3_PDMA_I2C1_TX	13
> +#define K3_PDMA_I2C1_RX	14
> +#define K3_PDMA_I2C2_TX	15
> +#define K3_PDMA_I2C2_RX	16
> +#define K3_PDMA_I2C4_TX	17
> +#define K3_PDMA_I2C4_RX	18
> +#define K3_PDMA_I2C5_TX	35
> +#define K3_PDMA_I2C5_RX	36
> +#define K3_PDMA_I2C6_TX	37
> +#define K3_PDMA_I2C6_RX	38
> +#define K3_PDMA_I2C8_TX	41
> +#define K3_PDMA_I2C8_RX	42
> +
> +/* SSP/SPI DMA request numbers */
> +#define K3_PDMA_SSP3_TX	19
> +#define K3_PDMA_SSP3_RX	20
> +#define K3_PDMA_SSPA0_TX	21
> +#define K3_PDMA_SSPA0_RX	22
> +#define K3_PDMA_SSPA1_TX	23
> +#define K3_PDMA_SSPA1_RX	24
> +#define K3_PDMA_SSPA2_TX	56
> +#define K3_PDMA_SSPA2_RX	57
> +#define K3_PDMA_SSPA3_TX	58
> +#define K3_PDMA_SSPA3_RX	59
> +#define K3_PDMA_SSPA4_TX	60
> +#define K3_PDMA_SSPA4_RX	61
> +#define K3_PDMA_SSPA5_TX	62
> +#define K3_PDMA_SSPA5_RX	63
> +
> +/* CAN DMA request numbers */
> +#define K3_PDMA_CAN0_RX	43
> +#define K3_PDMA_CAN1_RX	44
> +#define K3_PDMA_CAN2_RX	51
> +#define K3_PDMA_CAN3_RX	52
> +
> +/* SSP0/1 DMA request numbers */
> +#define K3_PDMA_SSP0_TX	64
> +#define K3_PDMA_SSP0_RX	65
> +#define K3_PDMA_SSP1_TX	66
> +#define K3_PDMA_SSP1_RX	67
> +
> +/* QSPI DMA request numbers */
> +#define K3_PDMA_QSPI_RX	84
> +#define K3_PDMA_QSPI_TX	85
> +
> +#endif /* _DTS_SPACEMIT_K3_PDMA_H */
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
