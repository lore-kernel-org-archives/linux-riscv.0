Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F54C61DD3
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sedZXHHAXAmJWBylHCDMYwQFy0bM9dnFC3HumnDM68g=; b=skkej19DHvdO5z
	U5rCL7CFiBqmGPglTiyAgJTeof/Gwid9e6sEQF1NkwcNXuoB8dx4RSKROXd+g19BywJmeaPRAAgUR
	VvwTyCB79mKmTtDL0+DbzsqKUao2CerOZpTlSVYR28XlypiIe1EQLycrrz77Eivz5Jjg9qtWgxmPm
	Cgx19JqyDiSBv/TMQJ2KPi9uXhqInWFaLEMSTojdWaoQGKa6YZkorNloQPlc9gyD25yLaI5KixpNl
	Obizpq456EEIGqIrBOoLUtcl2/zRLmY1Ch77hfxbpDsmNdH+XLy3mGpZEbPqEJDY4z9OUdZTWr5vJ
	6kU3AIW9HF9wHMbnZyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AJd-00000000AVM-1fTr;
	Thu, 03 Sep 2026 16:29:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AJb-00000000AVC-373R
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 16:29:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 207DA601EF;
	Thu,  3 Sep 2026 16:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5391F000E9;
	Thu,  3 Sep 2026 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452966;
	bh=cfSjg9mYPeipAFTfWafkpUPGHsGkJcChBkU88AONxrA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=owWrTvcHaaMVBQz0yIU2NpcrGuguWiwBZTGUVFQ0ZFUSnmfTGWIGq+p9biUqiODWH
	 cZ44Uz+/THd7Vv4jmtP3GNtw/0YSAyrEdRMWDNkvSx6hX6McW7Sjiw3TJVRweiqqGF
	 74AyXYJiBbR/g/Dca2Exuh+HmHvAhOFPpLM5Zio9sIDWZmgYgLKTFEYPh2D4j9O8kA
	 obatEXDz6FjrSxl+xiAXA2oTzqaQvNUm1dwWhw+kV0B5rVqvIBGGnIn9WCWkRbOq/W
	 w2PPc0DHEsby3+zbGlIU7r4qsgW0cC1imIlhg4E6K6GWpBnconCjSQF4QeNMAjTLXK
	 /mZWznQ4oINzA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20260727-k3-pdma-fix-drcmr-base-v2-1-afba55cba1f3@linux.spacemit.com>
References: <20260727-k3-pdma-fix-drcmr-base-v2-1-afba55cba1f3@linux.spacemit.com>
Subject: Re: [PATCH v2] dmaengine: mmp_pdma: fix wrong extended DRCMR base
 for SpacemiT K3
Message-Id: <178845296259.1679748.15919618755814250880.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 21:59:22 +0530
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


On Mon, 27 Jul 2026 01:26:15 -0700, Troy Mitchell wrote:
> The extended DRCMR window on SpacemiT K3 starts at 0x1100. Commit
> 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support") incorrectly
> set it to 0x1000, causing DRCMR accesses for request IDs >= 64 to target
> offsets 0x100 too low.
> 
> The 0x1100 base has been verified on K3 silicon using real SPI and QSPI
> DMA transactions. The K3 DMA documentation [1] was updated on June 24,
> 2026, to reflect the corrected register addresses.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mmp_pdma: fix wrong extended DRCMR base for SpacemiT K3
      commit: d1fc569fcbc7be6de06b034cf954a95e30ca1fb2

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
