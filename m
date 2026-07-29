Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9048EC53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 17:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DRiK80Y46Jx6IAql3CAqgm9wXpl1NO8jlDh7We+9Nw=; b=j/cp3BgxiDFkG3
	FpE0YrsNRfhbVFFV8sklVkevNk9gvd0G1K1OKiQ0ES998575nN3Na9Es/rSWmiD1xbdzUDVFSRVBk
	JIoVtIziZXMOoaECawuSKbV5k7vv1kcpWKkix8wCyE+tQmJJx6SScrYVQhk7yuPjHUY4SH9OpnD6F
	zrHGjltgIYd2pZh/JoUdTdEK3iwubGsabrTkouWWLfi5N3erR7EOXxDZF3K+0z225C3UMZ/pvVoR2
	r8/WQ149tPoUiU8oQrTUCJga+5pv0WRXiKssXQH+9ia+J58dKfjLamP+FUXmTujUhpHTepQ7IgHLM
	XdqRtxW4WpJj3rvxN0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8M8-00000008jW8-21CJ;
	Wed, 29 Jul 2026 17:46:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8M7-00000008jVv-1U3c
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 17:46:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B9F5401B1;
	Wed, 29 Jul 2026 17:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DF01F000E9;
	Wed, 29 Jul 2026 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785347169;
	bh=j+KzCNqLy3yQ1eL2PsZviAGvITLUBt7YOwZ4tNjmMAQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=CfNmUtNJ3MZg0Ge/qrtlWqVG/M33BQfXPeRo4HZM7k8kgihZpG0DzTq+GJUSylxdx
	 g2yZ4x/pcRI5tJ2EPfq1Sx8nmOoP1ZSHORa2swwi0n48ahIvsS1Xju1ih+nUoDr5EL
	 kXVEwVrzh5Wpyrw/WOC+FRevQIkIFPNnupm123GwdeOtjGZEJoExAWIRDfLnhPhAHB
	 cBo8MK0PWCds3qhpoduVNkareSZclZgTjZ1HvGgTXEbxjNJBYXa8MIb+GNLS2LsqRh
	 4/GjSjqR6hTqKkcdkGHve+sir2tXpgKnGHeoP0owSKBFYUZrZ+d3qGA8kiBfDMbYjD
	 OBTWEXfiyWypA==
Date: Wed, 29 Jul 2026 11:46:06 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    spacemit@lists.linux.dev, 
    Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH v3] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
In-Reply-To: <20260727-fix-riscv-swiotlb-v3-1-59479b23736c@linux.dev>
Message-ID: <0189bbe2-2aab-4d1d-1424-f83f5d1fb007@kernel.org>
References: <20260727-fix-riscv-swiotlb-v3-1-59479b23736c@linux.dev>
MIME-Version: 1.0
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

On Mon, 27 Jul 2026, Troy Mitchell wrote:

> On RISC-V platforms where the entire physical memory (DRAM) resides
> above the 32-bit address space (i.e., above dma32_phys_limit), the
> current SWIOTLB initialization logic fails.
> 
> This patch addresses two interconnected issues on such platforms:
> 
> 1. Incorrect 32-bit DMA bounce assumption:
> The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
> that a 32-bit DMA bounce buffer is required simply because the maximum
> PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
> no memory exists below the limit to satisfy this allocation. Fix
> this by adding a check to ensure `memblock_start_of_DRAM()` is actually
> below the 32-bit limit before enforcing 32-bit SWIOTLB.
> 
> 2. kmalloc() bounce buffer allocation failure on non-coherent systems:
> For non-coherent DMA, kmalloc() buffers whose sizes are not
> cache-line-aligned still require bouncing, even if 32-bit DMA bouncing
> is skipped. Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to
> allocating from low memory, which fails completely when DRAM only exists
> in high memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator
> is permitted to allocate this bounce buffer from high memory.
> 
> With this patch, systems with non-coherent DMA and DRAM entirely above
> 4GB can successfully map the software IO TLB in high memory and boot
> normally.
> 
> Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
