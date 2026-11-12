Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B931F606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xSlz2gD6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNcnWw8J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IVNTXu0vUHqtEg38cUy8Wk3B+Frzy+V8I0A30wJSwTY=; b=xSlz2gD6q88zHjYupZq5Hetmw/
	rymuWLcUPUgisdw3UbpFD51XJ7CTA/p+sZr5pRu5/yIqOIGwJIhTHp3c1cS/blaCE56COb4IuJ2+7
	VgiwMwNPVdW2ols9zf7D00zWWMtYeVx19adyB3XCXNkuAbG0LgLh7tkH1zd4BjlPS28fvyS/ettZF
	00cZtMs1xXtnaJvVPln9UaznohFbkMG1rS75rlmkuDo1qQ45riE+Ys2k9eIyPOqVZG0TU7Ys4q0y7
	rcnpEe0VhnlznXBx1HtBb00zH61v0Gb2IXiNG7nxVYkBP7VRGVCgwH0rpHCXoloZpLLmBlEsKfBW7
	Ocbs3CAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTmz-00000009qTn-0oJN;
	Thu, 12 Nov 2026 12:20:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTmw-00000009qTg-3rbW
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 12:20:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07C5063358;
	Thu, 12 Nov 2026 12:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33E41F00A05;
	Thu, 12 Nov 2026 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794486020;
	bh=VG4ibvh6nxXQ0qIYLiGl4aEGTtxF3L9vWHyMTCZCIEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QNcnWw8JP2dYKGfFeDoCDIndoy7/rNnerrfu+gun40tmG2sSLwGEU9mhoYzr2U+EK
	 RftKsXs3JlU4GPq1/eAxOPvBk1NS/9UfjZHnTb7MIXRimM9h9pIgq/hRXGghZdtcjH
	 +QDW1OP1UUEk90b09h/4j/Nf4O/ASSbrbW57jBkytbxBLt05NF7DO9WaafuHQzGTLh
	 9l9mt0hbLZJzZB6gWiPcjZm/EppxzIQESchHyRvRp74OuRu4w1foOR+dGrZIlAsfWF
	 S3uDpySOkQ7sdmlFw+j/nz2Qmwp36uIBUphnPf/klYEnHg/U3oJuq/ec/3DixfpQSE
	 BtUKnQcutr+3g==
Date: Thu, 12 Nov 2026 20:00:06 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: hu.shengming@zte.com.cn
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com, wangruikang@iscas.ac.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhang.run@zte.com.cn, luo.haiyang@zte.com.cn
Subject: Re: [PATCH] riscv: mm: Limit per-page TLB flushes for large PTE
 batches
Message-ID: <avWqRtXhDwSDqlgs@xhacker>
References: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 11:05:25AM +0800, hu.shengming@zte.com.cn wrote:
> From: Shengming Hu <hu.shengming@zte.com.cn>
> 
> On systems without Svvptc, update_mmu_cache_range() performs one local
> TLB invalidation per PTE. With 4 KiB pages, installing a PTE-mapped
> 1 MiB anonymous folio requires 256 SFENCE.VMA instructions, or 256
> SINVAL.VMA instructions bracketed by SFENCE.W.INVAL and
> SFENCE.INVAL.IR.
> 
> Apply the existing local TLB range-flush policy to PTE batch updates.
> When nr exceeds tlb_flush_all_threshold, use local_flush_tlb_all_asid()
> to replace per-page invalidations with a single ASID-wide SFENCE.VMA.
> This orders the PTE writes before subsequent implicit page-table
> accesses and invalidates translations for the entire batch. As with
> range flushes, this may also evict unrelated translations for the same
> ASID.
> 
> Benchmark results from will-it-scale's page_fault1_processes under
> QEMU 9.1.93 (qemu-9.2.0-0.3.rc3.fc40), with svvptc=false and
> CONFIG_TRANSPARENT_HUGEPAGE=y (higher is better):

Can you test on real hw rather than on qemu to get the performance numbers?

> 
> Folio size      Before       After     Change
> =============================================
> 4 KiB           116537      113503      -2.6%
> 512 KiB        1431962     1977519     +38.1%
> 1 MiB          1528457     2208209     +44.5%

Since one page is the most case, if we really regressed about 2.6%, then I
think we need to evaluate whether the gain deserves the pay.

> 
> Signed-off-by: Shengming Hu <hu.shengming@zte.com.cn>
> ---
>  arch/riscv/include/asm/pgtable.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 2ebd5fa5adc5..ebe42fcf35ae 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -571,6 +571,11 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
>  		return;
> 
> +	if (nr > tlb_flush_all_threshold) {

unlikely(...)

> +		local_flush_tlb_all_asid(asid);
> +		return;
> +	}
> +
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
>  		local_sfence_w_inval();
>  		while (nr--)
> -- 
> 2.25.1
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
