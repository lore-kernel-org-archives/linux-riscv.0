Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC19BCD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKzGTGjzLkF+IvHBzXsQa2OXob5kw5/p314ulIHHtbU=; b=oD6mqb3ro6ggoC
	Il2X8Bh8VCRSxZWHYzfrVSpXtD05FPz2oMoZ5LfA7mzMPKhO2CSwdqDwg2vSLmOYlexqQUmi3Jn/e
	cX7+tAQLn/PMs7s8MAXo7L5+foE+D5ALG59XecHgbtm8wx63AHZjyA5fZk/ZMmZbSJAF133pcrG1I
	l9x9B39UVcfMhhZo7aABEPJGNJL8HMa7UlA6WJ2hRqu+hyNoLWniHkAKkdIguNEYt8nrACbe1u2+I
	L6Vu+UW8rgPfwZRKbbSeFKDtnF7+AMCO9a2Kj+gN9M/Q+aP/NFh4e/crfbhVjM+85wHlKbwqT6RMS
	Tp9DcHnQIwMKBLxWyyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOR3-00000002QKB-0Em0;
	Tue, 19 May 2026 17:40:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOR1-00000002QK1-2QZI
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 17:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D0E86022D;
	Tue, 19 May 2026 17:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194C8C2BCB3;
	Tue, 19 May 2026 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779212450;
	bh=roncchQ6gRIvDa6f3EmKw01L4C9zHft5fUpPmg64Ig4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d3ZEqBwDa0DWUqJMsmhhTGT6C+kFcGKS5uTqPAQOpmOobLBT0fgvJcqyeRw+ryL9h
	 uKPsi8d8WIT8FLjU4PE0psjZj8upRSI2NCeBS/9H4JDA6kNuTfBFNBL+BTvjHc5Epj
	 Cn58lvbDWYVTNY79TkHeFQl2NuxqSy0eDsv51JUNatQeGGG4fuyu5vKH7kg0vBbkwW
	 gUM/UJr/r67cSryalNsrSgXMH9bx4cJgeEEEJhdio39kwEYFZz1CBS/llPTL2UZ28A
	 SzzDExhuaWi+f8a9llPCX8rD5T78XW20un6Hk0QMZzzneefZAlKvZIVzU29m4b6iEY
	 LT0IUyJsw8Q4A==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
References: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
Subject: Re: (subset) [PATCH v6 0/4] dmaengine: Add Peripheral DMA support
 for SpacemiT K3 SoC
Message-Id: <177921244361.339411.17197667376748873904.b4-ty@kernel.org>
Date: Tue, 19 May 2026 23:10:43 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
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


On Mon, 18 May 2026 11:32:40 +0800, Troy Mitchell wrote:
> This patch series introduces Peripheral DMA (PDMA) support for the
> SpacemiT K3 SoC, leveraging the existing mmp_pdma driver.
> 
> The K3 PDMA IP is largely based on the design found in the previous
> SpacemiT K1 SoC, but introduces a few key architectural differences:
> 1. It features a variable extended DRCMR base address for DMA request
>    numbers (>= 64) depending on the hardware implementation.
> 2. Unlike the K1 SoC, where some DMA masters had memory addressing
>    limitations (requiring a dedicated dma-bus), the K3 DMA masters
>    have full memory addressing capabilities.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: dmaengine: Add SpacemiT K3 DMA compatible string
      commit: 55620b11186c81757b05fb8e2df9ddc7127d6fd2
[2/4] dmaengine: mmp_pdma: refactor DRCMR access with helper function
      commit: f46b47623e70dea8b03794a5420ffba060425e85
[3/4] dmaengine: mmp_pdma: add SpacemiT K3 support
      commit: 6587b8661a0b61c2f4b260bfc9f0e9ef9de0ea2e

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
