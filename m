Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A722C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZkqFqbxnMDqalrbPbbsux3Byo1nfTXNM2fMOCAPURM=; b=gXHM2+sJfNJHh/
	+hiRGwfTn9xJySRZk32Ev+SBR2a/tMmNwIp30h0HMUSjOXZnpEHT/EiatZiW5TJuj6EJVqUjQXwlV
	1PU4G1iPz9RTBI78FK4//bwP9cBWvRXZZoueje/B3ZAvPfgKSHy4jSWfMDj0sjexl+cAYilR1kS+R
	E9wHgxJcTBgbgg8XtK6ZEn1412YaZRcrB9RaoTcBIJNMbkKcGLF9s1JdGKtHBvBn9pktYXJDvs2Pp
	vvGIuToREOTgOCP672wXicJsjy/waEi2WqaZHXrB3ouUUxAaIV8g6aBmkMJqvhCZxTENwYZdwKRtu
	6Jn7z/StkILqUmx0klyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYh9x-0000000HFlu-1uVH;
	Fri, 17 Jan 2025 07:52:53 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYh9u-0000000HFkQ-2iQK
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 07:52:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3B12A68BFE; Fri, 17 Jan 2025 08:52:38 +0100 (CET)
Date: Fri, 17 Jan 2025 08:52:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] riscv: select DMA_DIRECT_REMAP by RISCV_ISA_SVPBMT and
 ERRATA_THEAD_MAE
Message-ID: <20250117075238.GA25422@lst.de>
References: <20250116172950.1989748-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250116172950.1989748-1-geomatsi@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_235250_836798_D1933D7A 
X-CRM114-Status: GOOD (  12.61  )
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

On Thu, Jan 16, 2025 at 08:29:35PM +0300, Sergey Matyukevich wrote:
> Select DMA_DIRECT_REMAP for the RISC-V extensions that allow to set
> page-based memory types in PTEs according to the requested DMA
> attributes. This is the purpose of Svpbmt or XTheadMae extensions.
> Zicbom or XTheadCmo serve a different purpose, providing instructions
> to flush/invalidate cache blocks.

Please explain what this is supposed to solve, because the above
explanation dosn't make any sense.  DMA_DIRECT_REMAP is one
of the implementations supporting dma coherent allocatiosn for
non-coherent devices.  So selecting it from something that
just keyes off support for an extension, but not the dma
implementation is wrong.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
