Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8E110BA432
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvfsWXBO6wvdxT4XxWHSHAb84dmgfs5c7IZkM9EPhzk=; b=tqOZZLP6PhEdSQ
	2P9/PojeftbzmkPPPMEIz279HcsqWhAnqwFQe34tYTUWNp+NCfsQxcfIOFumk9UTtDiA+O9mAErBG
	wVSYd5I37cSH7Uto6rcE/fCTja/z9eiY4tCWpHG0RChvmHtoTJl7YeXoE44kzJ1gsjne1tZoTvVsv
	f9xuB6kzbTiKHf1h9OsoJra+Gl5/LdTdXMfE7Ad9AV9ShuVp0Ijry74EAaTNcnqEpOw+UhDblmzbK
	hXdX/ltY9PW4GxKuI0drIfsqTtMJ614SHWdHmHaXL0hDz33WB9k7jLWF3aBE8oVH2u2qrpwzhwxeO
	MHw9S2xRuGKhkdaRSyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61bg-00000006sxc-33RI;
	Fri, 27 Mar 2026 07:27:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61bf-00000006sxM-3WVM
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 07:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29A8F60133;
	Fri, 27 Mar 2026 07:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF35C19423;
	Fri, 27 Mar 2026 07:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774596466;
	bh=MCVzKj0IwMKiyZBuXwlPOEx7tDkpVOQV0iBLV4nD+0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzR1m7VU+m3n7hqd0FwRCWj8NCiLUYdas3mWtiJjg4l2PnT9Qv6C5wNAGfA7eMPWl
	 GOpxUp5hJHh+walrfJIjJAVtxPY4AU3vi6OcO4IPoWsUyhnrlxHpoewAU5h5RlWROj
	 fZ6mUZVL2XNCVd7a0Wh3k4LK6X35KXZ0MXxdgxJQpkdfuAo1x2V3YubNatIUEX9CRC
	 WZMyvhmNtFpF7J0nIrkyoABiLAdK8HO8DZZFGgnbdj/A1F9iHoE+FGpSi9hWLi/7XV
	 hlUuTIdFaPNPQrTw2DMPrpjMJC92lqsf0NZMUa8KmaR9v7G5CVm0pSLpKijmwmkWOX
	 y28lUHMq15c+Q==
Date: Fri, 27 Mar 2026 08:27:44 +0100
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
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: dmaengine: Add SpacemiT K1 DMA
 request definitions
Message-ID: <20260327-fancy-nondescript-mouse-cfd6f3@quoll>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
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

On Thu, Mar 26, 2026 at 04:17:16PM +0800, Troy Mitchell wrote:
> From: Guodong Xu <guodong@riscstar.com>
> 
> Add the DMA request numbers for non-secure peripherals of the K1 SoC
> from SpacemiT.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---

No changelog - neither here, nor in commit msg.

>  include/dt-bindings/dma/k1-pdma.h | 56 +++++++++++++++++++++++++++++++++++++++

So previous review applies, no? Was there such?

>  1 file changed, 56 insertions(+)
> 
> diff --git a/include/dt-bindings/dma/k1-pdma.h b/include/dt-bindings/dma/k1-pdma.h
> new file mode 100644
> index 000000000000..061748c177dc
> --- /dev/null
> +++ b/include/dt-bindings/dma/k1-pdma.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides DMA request number for non-secure peripherals of
> + * SpacemiT K1 PDMA.
> + *
> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> + */
> +
> +#ifndef __DT_BINDINGS_DMA_K1_PDMA_H__
> +#define __DT_BINDINGS_DMA_K1_PDMA_H__
> +
> +#define K1_PDMA_UART0_TX	3

abstract IDs start from 0 or 1.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
