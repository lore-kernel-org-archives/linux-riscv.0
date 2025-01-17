Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C8EC02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tiv9IhPb3TGJCjMZXEKnO/z1q/has7l9wjvra6B6t/0=; b=BYThk2QUUVnafu
	C+FdfCmBXVjipuunJH3i00iOr3rZWlRo0J6qsofubTqzPq9KynCzBrO71Dv1LCRCCELTFzYxZhPUH
	dNaHzBcYeRFc8hIbxz6kXoUG4rhQ0rBcWKjvNIqrJZ2xHbAguPESuCBG6UbpFITIHuD5ZI9GzVvM2
	f/l7yNKHgPs+5rYTWZkZXJ8CB4Aj9o5KL6vozjSSv8y2UZSmCAuWrX2DUO8dx/k1rISmd5qMh7nY7
	GNx6aZ/Ihv7Ac3dKNEgE74K9PoNUpVi7OGybvzVcSJhFIqHBsYBzbUJBWmbu5NTVfe7OEHoNum4jI
	NVpNUGE/wYNA+AXH+BZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYj7g-0000000HW9s-2ZTR;
	Fri, 17 Jan 2025 09:58:40 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYj7e-0000000HW93-3L9o
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 09:58:40 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 81DB168BEB; Fri, 17 Jan 2025 10:58:32 +0100 (CET)
Date: Fri, 17 Jan 2025 10:58:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] riscv: select DMA_DIRECT_REMAP by RISCV_ISA_SVPBMT and
 ERRATA_THEAD_MAE
Message-ID: <20250117095832.GB2585@lst.de>
References: <20250116172950.1989748-1-geomatsi@gmail.com> <20250117075238.GA25422@lst.de> <Z4oXF2ewizIIk1cL@curiosity>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4oXF2ewizIIk1cL@curiosity>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_015838_988851_EED007C1 
X-CRM114-Status: GOOD (  15.94  )
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

On Fri, Jan 17, 2025 at 11:38:47AM +0300, Sergey Matyukevich wrote:
> > Please explain what this is supposed to solve, because the above
> > explanation dosn't make any sense.  DMA_DIRECT_REMAP is one
> > of the implementations supporting dma coherent allocatiosn for
> > non-coherent devices.  So selecting it from something that
> > just keyes off support for an extension, but not the dma
> > implementation is wrong.
> 
> Now DMA_DIRECT_REMAP is selected either by Zicbom (standard) or XTheadCmo
> (vendor) RISC-V extensions.

Because they need DMA_DIRECT_REMAP to implement DMA coherent.

> However neither of them can help to implement
> DMA_DIRECT_REMAP on RISC-V. So selection of DMA_DIRECT_REMAP has been
> moved in Kconfigs to Svpbmt and XTheadMae extensions.

But Svpbmt does not imply that you even need DMA_DIRECT_REMAP.

Are you tying to solve a problem here?  If so can you explain it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
