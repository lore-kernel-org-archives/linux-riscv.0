Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0FCC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 17:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsEpyfN0FyEyP1Mv0LUJjdHsvKoqlTM3fT4OigY3PCs=; b=xDRicnUIG8u4Q0
	0qEX+MNs4vtcIx5Vja3VNQ2PfDt/zITCfAGqvFdOmXIReMzPf1hth3qgOK/X9gc21c2AArCeZvbkJ
	43XQRJ4pkUbAEBsOm0Gs0X5miCSNUd6bqhvxI7qPO8Lc4uIy91MD3Zj6B3z2atuPYU8nXlVhI9RKw
	O/HADJcnkifLOr5MH+n2hMF2rJofAlTjUU+PLVATJT6b0cLdg1r4z3xlbgI6dNb/1qKcKSJSj/pVY
	dpRTutiO1MTv3UHUh3qIliER2xKT29XqT9Od5Ou3S1p+8zyKXALhg4vlDmE1Qf8TC92iZKl4rsqk2
	BLRfIQbElq0FvOq8uiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7xG-00000008g9C-0gq8;
	Wed, 29 Jul 2026 17:20:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7xF-00000008g8B-124V
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 17:20:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3C7F42DEC;
	Wed, 29 Jul 2026 17:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A753B1F000E9;
	Wed, 29 Jul 2026 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345628;
	bh=6LmnnzmtLruyVMKB+f0uEMK6JgvjHc+y3ZREpchl5Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RV0wWywd1X4OPHJtdaaPb0FhKGMCVJdvDj+ycBLEvlAFiaqzMybzOe+wIsD6HnOzx
	 s20+tp50W+A6bJkyGuo1nlEOrmmqaatwTCm8WbFi25BERlqqXlbRnWJqlXC+vJJrgq
	 Z0ofCpzBPLrrtPxi8FsQCz3Q1oPZzeKNwU0/yGBmy7Hm5oB5Rt9FQzbMFaMuZbpuag
	 bJjLavjpzauGcznxqkEKnRCsHbwKCnQMjg6UkKjoFRKchovd9CN72ubPTLfumU+Y9j
	 0JC8HqPCizIx1xMvpnp6aiYo/SRDZmjMzx/6/F/t+GZw+zTSAypzxAkQ5Vk5pvJ45m
	 BNmmPF+LmIdFA==
Date: Wed, 29 Jul 2026 10:20:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH v3] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
Message-ID: <amo2W_XZDiJ_2sLg@thelio>
References: <20260727-fix-riscv-swiotlb-v3-1-59479b23736c@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260727-fix-riscv-swiotlb-v3-1-59479b23736c@linux.dev>
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

On Mon, Jul 27, 2026 at 01:08:44AM -0700, Troy Mitchell wrote:
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
> ---
> Changes in v3:
> - clarify when kmalloc() buffers require bouncing for non-coherent DMA
> - Link to v2: https://patch.msgid.link/20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev
> 
> Changes in v2:
> - add Anirudh's TB tag
> - Link to v1: https://lore.kernel.org/r/20260331-fix-riscv-swiotlb-v1-1-74dd5e6be0f1@linux.dev

Maybe fixes tag should be added like this?

Fixes: dcb2743d1e70 ("riscv: mm: still create swiotlb buffer for kmalloc() bouncing if required")

Aside from that, LGTM and resolves the issue for Linux running on the
X280 clusters in the Tenstorrent Blackhole.

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
