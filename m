Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF2CCC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSpu6Ne/Y3EG7PNZXhba2hytxZ148eYj39NUd4bOA7c=; b=OjKtn8LX0O8SLF
	P+VnGsHQLR8jYciGkAFE6LVfwqN5R70tVOn+b/TgPKY0r7OCj2W+mlgevpr/FcxjXRB9NG01yMGQu
	jCuCovMvOAuz63+SKdtDpwvtrp+IEyn5J8whBCm/JFwgkIuu+QLEmczRynN29TP1N5oKifDhkKFc6
	iyP6DsoY/ludKLJfHj55mXvdGBMKNur3qt0xFZf7vIvHoHO4HYuwjecedXczOxdGsdxq54IwJZk/g
	B+/uRT0CSwIjefQ6dw4ViiWxFTtrEhIdS/qLsAj5PhvYIJ/0MmcSN3Ck9Ju7lw3VLoEKSOwXBClEY
	a4TF3SMhGJiNaABuec8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGdQ-0000000H7zs-2DXB;
	Thu, 15 Oct 2026 08:16:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGdO-0000000H7zR-3e5o
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 08:16:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5710B417E5;
	Thu, 15 Oct 2026 08:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37BB1F000C4;
	Thu, 15 Oct 2026 08:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052178;
	bh=5o7xsZFTTFM2WuI57OlieYgdarxkwcy1AXb2N5U0PlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D+2ATOFoltP2nF981paY8m+3M3kd+Tjj49sknPJQJTqIexCCDVBowBAaT4iXrPvkQ
	 FWqyVyOm+GtBh+CyAbIWI4Vmz7NZHkeBIA+V58wTv/YUKIbdNmh0CRUOSsDKMkGZlp
	 2Pvze3OMXHOreuqUXKrhGYXUqBQ7PtMqWnrgPqJNrdjehCZJWUGpJq5bEi2xCJYdcf
	 kT3/GHacDQ4CrZrxoFB6qKOPwGvAEqgT4DT5MqKLoqFAMxMEJNf1QG5H/Aq+Guw0bg
	 4Gv3++dwqzxwhVP4ErsCfK+W6NL8G/MuKPWW3LcOd2pu91diTykdvJZAvyCyTSF3VU
	 RLbvsO4Ql8T7g==
Date: Thu, 15 Oct 2026 11:16:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: Pre-allocate module page tables for execmem
Message-ID: <atCLy-3RZbf3fGRp@kernel.org>
References: <20261015033643.84972-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015033643.84972-1-kmehltretter@gmail.com>
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

On Thu, Oct 15, 2026 at 05:36:43AM +0200, Karl Mehltretter wrote:
> RV64 pre-allocates page-table levels for late kernel mappings. The module
> range is guarded by CONFIG_MODULES, although execmem can use it without
> modules.
> 
> With CONFIG_BPF_JIT=y and CONFIG_MODULES=n, execmem adds a mapping to
> init_mm while the current process retains an empty PGD entry. Initializing
> a BPF program pack then faults:
> 
>   Unable to handle kernel paging request ...
>   [ffffffff78000000] pgd=0000000000000000
>   ...
>   bpf_jit_fill_hole_with_zero
>   bpf_prog_pack_alloc
> 
> Use CONFIG_EXECMEM for the module-range pre-allocation, as powerpc does
> for its execmem page-table setup. Both CONFIG_MODULES and CONFIG_BPF_JIT
> select it.

I think the commit message should mention that BPF_JIT_REGION is inside
MODULES region.
 
> Fixes: 2c9e5d4a0082 ("bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> 
> Notes:
>     Tested on a BeagleV Ahead with matched LLVM 18.1.3 builds based on
>     v7.3-rc7:
>     
>     - unpatched: a native XDP attach triggered the Oops above
>     - patched: native XDP attach and detach completed without an Oops
>
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fb37b0b67efe..d92342c162e2 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1437,7 +1437,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
>  void __init pgtable_cache_init(void)
>  {
>  	preallocate_pgd_pages_range(VMALLOC_START, VMALLOC_END, "vmalloc");
> -	if (IS_ENABLED(CONFIG_MODULES))
> +	if (IS_ENABLED(CONFIG_EXECMEM))
>  		preallocate_pgd_pages_range(MODULES_VADDR, MODULES_END, "bpf/modules");
>  	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG)) {
>  		preallocate_pgd_pages_range(VMEMMAP_START, VMEMMAP_END, "vmemmap");
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
