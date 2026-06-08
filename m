Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B153CD8C90
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 01:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpIksN4vQyssbzvwQXsDrDWlEVt0Rew6V+UycXlYuhE=; b=SgE1lD29JM4Wr5
	jxbB7CsR2cQOoIqJK8bzlfBzKfCrI0gdIL17YVdWjPovMhCGv7SCYrHKgAXQDh1DKhYYiUgvF6qF4
	KfnJNZQD7MnEnKdin1qt+DOCt/TOT0mSqiN3f8nXKMHwPcQJIpnovDTS9AxCOmwiJTr0163kGRQpv
	sbc2/6/WpuxqRzmhjbtKsJ6VkDEOA+4zszcd+dh/rNwC1QwET3ybBcU8Ht9aNrXf/Mq/go1XsgYVm
	BbqC+2ewvL3L3B8SHrkqo7y9FH975Gb5yYGRkWKKZ7a45Slob/+WhXPJfD7XRFJKK5tch7iIvUABl
	RqzDVOgydeOPPu7y+D4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOgw-00000002gB4-3mRZ;
	Mon, 08 Jun 2026 01:22:14 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOgu-00000002gAV-2oHC
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 01:22:14 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780881730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96KtDTogFLQcqNpJ1tNB2dZyyE30C3Sd5kqsXZAmqvk=;
	b=CA+q6FXiJFlJAxwgb+M1iN4Q+TVJsUXxoBZRyopR7hwZcOc7SQyXN8B5NlVhkT7RbEh1ry
	z11kILWKwNcfojiY0pF3yBPlAmPa1ooIQ6YoCJWJzSIIEHk3C3eIX7fL8J8T3yoHBcrwIh
	GExbygnctX0vFikpM6tUMerHxPlsHzQ=
Date: Mon, 08 Jun 2026 09:22:03 +0800
Message-Id: <DJ39VTKU26KY.108UFYXIALHBC@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Anirudh Srinivasan"
 <asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
In-Reply-To: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_182212_864632_39290C5E 
X-CRM114-Status: GOOD (  13.36  )
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

On Wed Apr 29, 2026 at 7:41 PM CST, Troy Mitchell wrote:
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
> For non-coherent hardware, a bounce buffer is still mandatory for
> cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
> Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to allocating
> from low memory, which fails completely when DRAM only exists in high
> memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator is
> permitted to allocate this alignment buffer from high memory.
>
> With this patch, systems with non-coherent DMA and DRAM entirely above
> 4GB can successfully map the software IO TLB in high memory and boot
> normally.
>
> Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
Just a gentle ping on this series. 

Please let me know if anyone has any feedback or if there is anything 
I should update.

                                  - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
