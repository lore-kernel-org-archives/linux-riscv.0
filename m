Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9F410BA430
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwCOJbIlGU/XfoxmJDqFQb2Sf17OswNUmTQ6YaUcbyM=; b=c+6BDKsEJ2pZyR
	4Xh16rFK7Lr4Dig0VSCJ6RG/dL140WXj05VIUsGjl3hxG4HVVl3aiKRDSrH3Vh+Ij0smK2uELkL0h
	Kaaa86ZHfIn7C0fAWqy/bvZE3hP6YO48vzJhsnhB8oPB70XsGlaBww/G4M6feam3ARea+3Xw4Rcpe
	xgwbTtXUbhmHu4Or8ranckb36Xwd3MHLaKN5cDDWukT4cKlUw2LdM/CnBWHIIh/zNNIUrPwggB1Az
	2fZ3ewfUoMpZk2n3tWKDYVO5W8TPKQEHlLZxne9L9eZJIAau2p94oVb+bjJ91deYKBycQy3a/m7jx
	rAf11EwUCSOLxIOPcBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61eQ-00000006tKq-1Yvt;
	Fri, 27 Mar 2026 07:30:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61eO-00000006tKi-3Swo
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 07:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE31361334;
	Fri, 27 Mar 2026 07:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB64DC19423;
	Fri, 27 Mar 2026 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774596635;
	bh=Nhd4cukWDVjhukk+y+jGGeey4ytNdYgdQ3woWAlYkmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CD5kpQKplHtxUMkwh4qNh5ubCb+ekeCi+qMhmdW1hCwzBbHTMJh6ObRgztqu1hpD2
	 dHtsCYBHEr4o1AkbmeeWNQeLw1/Nwb6GE6TA1X4Dw0zY6cmabMamS8mkPN6B9V99k9
	 SpJh3NdbwgKAElQUPv0iTSR2naNIiaJLtYinIr2RnS4wyxfV/vf9FQzHUT1wiNdVbR
	 wJwnGY3k6tK7EuZyQ1z43FqBxwl+brHEMJcVl/eMYS9+wIcKNYGvunCpSveFYWJuxO
	 qqO7HHpI/9qJ5m8j9rtBWzTgsJZWmzxi+3eWVTWbLx3LEocQXm8wivxCG2Qizdm73e
	 Cncg2qzUbAjMQ==
Date: Fri, 27 Mar 2026 08:30:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Guodong Xu <guodong@riscstar.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-clk@vger.kernel.org, liyeshan <yeshan.li@spacemit.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 request definitions
Message-ID: <20260327-granite-giraffe-of-infinity-ff49a3@quoll>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-3-ca94ca7bb595@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326-k3-pdma-v2-3-ca94ca7bb595@linux.spacemit.com>
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

On Thu, Mar 26, 2026 at 04:17:18PM +0800, Troy Mitchell wrote:
> From: liyeshan <yeshan.li@spacemit.com>
> 
> Add device tree binding header for SpacemiT k3 DMA request numbers. This

Why?

> defines the DMA request mapping for non-secure peripherals including UART,
> I2C, SSP/SPI, CAN, and QSPI.
> 
> Signed-off-by: liyeshan <yeshan.li@spacemit.com>

Name looks close to login name?

> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  include/dt-bindings/dma/k3-pdma.h | 83 +++++++++++++++++++++++++++++++++++++++

I am already confused what is happening in this patchset - so which
device are you adding? K1 or K3?

>  1 file changed, 83 insertions(+)
> 
> diff --git a/include/dt-bindings/dma/k3-pdma.h b/include/dt-bindings/dma/k3-pdma.h
> new file mode 100644
> index 000000000000..05541a9a9973
> --- /dev/null
> +++ b/include/dt-bindings/dma/k3-pdma.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides DMA request number for non-secure peripherals of
> + * SpacemiT K3 PDMA.
> + *
> + * Copyright (c) 2025 SpacemiT
> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> + */
> +
> +#ifndef __DT_BINDINGS_DMA_K3_PDMA_H__
> +#define __DT_BINDINGS_DMA_K3_PDMA_H__
> +
> +/* UART DMA request numbers */
> +#define K3_PDMA_UART0_TX	3

This starts from 0 or 1.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
