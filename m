Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1977C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKIc2jQFeko/X1Z3E7x1wpnvZr3gmJQRgyssLRDVspA=; b=Z+iov2GvPEaPWP
	3gqn0tyjD4kjuccgZlnTbojUz3g/3kjnNNQI/8mc9q2DE3B+7v4iyWXVWNXJ8FtsoRw9OmwHSRDrv
	hyeeZFWNZ7Oot1rNG6X22fpZiMvaWg30iMrJq5ZYFDauiTdZ9I9bMvAMMQgiMJ9MhHI+P+twhSVQv
	nIbeOhzmNxFVFcBRvBhgbdf6Z5zWUQaVEdNU0d3z0iXqsmfBurHsHOXnFsSAWOph6TS27YSoH+jGa
	Ui9MvAzyFiNbK/h4gV/g0A7rt70c/auy539MORGicTI3QJW5W0xLR0H5/ri/gZB1svOVT1t+r8BVp
	bSCJk3ago1NbrIVgVRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muGgd-004jgs-0g; Mon, 06 Dec 2021 16:17:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muGgZ-004jeb-9M
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 16:17:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6588E61383;
 Mon,  6 Dec 2021 16:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C772C341C1;
 Mon,  6 Dec 2021 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638807469;
 bh=FfP+RnCEexOp4vGvCs/p1dGSWLbwqJCwgkifSRtYpwY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gnuUaKasyVuNKr9sRsH18xjgWFR/GTSkm1FW6WIECtpHcTG8SA72apwS5CxUSPCNZ
 HH3izHUjaG7niz7SU6WZ7V+ZRMMCpZudXwEBY7JgF7sv2wCHOY5QeemzPYAF0LvUqH
 NzopceFPooy9YHmvrgwEHpBsNf1KeYJucgv9ci8B1JsUHOnaPtlhZSdIWQPpYSaeHX
 ZvjjxLlMuq/pKMTPnGknFqX9xBQfhva08Kczdf8yeu1bKuxFtBDNLPHJA8aU5QYRn/
 rYOkWZZG72kcL+oIcP+SiHOHhqhrAzfgXQ43MigdR/Gce9FW6uKSvggCIoAimP+14d
 q4HCKiPHdXLdg==
Date: Tue, 7 Dec 2021 00:10:30 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] riscv: mm: init: try best to
 IS_ENABLED(CONFIG_64BIT) instead of #ifdef
In-Reply-To: <3344a7ae-aaa6-2f35-09fc-60039bb8184d@ghiti.fr>
References: <20211203050317.2102-1-jszhang@kernel.org>
 <20211203050317.2102-3-jszhang@kernel.org>
 <3344a7ae-aaa6-2f35-09fc-60039bb8184d@ghiti.fr>
MIME-Version: 1.0
Message-Id: <20211206161748.0C772C341C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_081751_473027_404AD0A5 
X-CRM114-Status: GOOD (  32.29  )
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

On Fri, 3 Dec 2021 09:33:12 +0100
Alexandre ghiti <alex@ghiti.fr> wrote:

> On 12/3/21 06:03, Jisheng Zhang wrote:
> > Try our best to replace the conditional compilation using
> > "#ifdef CONFIG_64BIT" by a check for "IS_ENABLED(CONFIG_64BIT)", to
> > simplify the code and to increase compile coverage.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   arch/riscv/mm/init.c | 38 +++++++++++++++++---------------------
> >   1 file changed, 17 insertions(+), 21 deletions(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 745f26a3b02e..bd445ac778a8 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -102,10 +102,9 @@ static void __init print_vm_layout(void)
> >   		  (unsigned long)VMALLOC_END);
> >   	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
> >   		  (unsigned long)high_memory);
> > -#ifdef CONFIG_64BIT
> > -	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
> > -		  (unsigned long)ADDRESS_SPACE_END);
> > -#endif
> > +	if (IS_ENABLED(CONFIG_64BIT))
> > +		print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
> > +			  (unsigned long)ADDRESS_SPACE_END);
> >   }
> >   #else
> >   static void print_vm_layout(void) { }
> > @@ -172,17 +171,16 @@ static void __init setup_bootmem(void)
> >   
> >   	memblock_enforce_memory_limit(memory_limit);
> >   
> > -	/*
> > -	 * Reserve from the start of the kernel to the end of the kernel
> > -	 */
> > -#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> >   	/*
> >   	 * Make sure we align the reservation on PMD_SIZE since we will
> >   	 * map the kernel in the linear mapping as read-only: we do not want
> >   	 * any allocation to happen between _end and the next pmd aligned page.
> >   	 */
> > -	vmlinux_end = (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
> > -#endif
> > +	if (IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > +		vmlinux_end = (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
> > +	/*
> > +	 * Reserve from the start of the kernel to the end of the kernel
> > +	 */
> >   	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
> >   
> >   
> > @@ -190,7 +188,6 @@ static void __init setup_bootmem(void)
> >   #ifndef CONFIG_XIP_KERNEL
> >   	phys_ram_base = memblock_start_of_DRAM();
> >   #endif
> > -#ifndef CONFIG_64BIT
> >   	/*
> >   	 * memblock allocator is not aware of the fact that last 4K bytes of
> >   	 * the addressable memory can not be mapped because of IS_ERR_VALUE
> > @@ -200,10 +197,11 @@ static void __init setup_bootmem(void)
> >   	 * address space is occupied by the kernel mapping then this check must
> >   	 * be done as soon as the kernel mapping base address is determined.
> >   	 */
> > -	max_mapped_addr = __pa(~(ulong)0);
> > -	if (max_mapped_addr == (phys_ram_end - 1))
> > -		memblock_set_current_limit(max_mapped_addr - 4096);
> > -#endif
> > +	if (!IS_ENABLED(CONFIG_64BIT)) {
> > +		max_mapped_addr = __pa(~(ulong)0);
> > +		if (max_mapped_addr == (phys_ram_end - 1))
> > +			memblock_set_current_limit(max_mapped_addr - 4096);
> > +	}
> >   
> >   	min_low_pfn = PFN_UP(phys_ram_base);
> >   	max_low_pfn = max_pfn = PFN_DOWN(phys_ram_end);
> > @@ -616,13 +614,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >   	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
> >   	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
> >   
> > -#ifdef CONFIG_64BIT
> >   	/*
> >   	 * The last 4K bytes of the addressable memory can not be mapped because
> >   	 * of IS_ERR_VALUE macro.
> >   	 */
> > -	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
> > -#endif
> > +	if (IS_ENABLED(CONFIG_64BIT))
> > +		BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);  
> 
> 
> For this one, I think we can just get rid of the condition since this is 
> true for every kernel actually.

Thanks for pointing out this out. Addressed in v2

> 
> 
> >   
> >   	pt_ops.alloc_pte = alloc_pte_early;
> >   	pt_ops.get_pte_virt = get_pte_virt_early;
> > @@ -735,10 +732,9 @@ static void __init setup_vm_final(void)
> >   		}
> >   	}
> >   
> > -#ifdef CONFIG_64BIT
> >   	/* Map the kernel */
> > -	create_kernel_page_table(swapper_pg_dir, false);
> > -#endif
> > +	if (IS_ENABLED(CONFIG_64BIT))
> > +		create_kernel_page_table(swapper_pg_dir, false);  
> 
> 
> Wouldn't it be better to introduce a create_kernel_page_table function 
> that does nothing for !CONFIG_64BIT?
> 

If so, we will have something as:
#ifdef CONFIG_64BIT
create_kernel_page_table()
{
...
}
#else
create_kernel_page_table() { }
#endif

Since we already have different create_kernel_page_table() version for
XIP and !XIP, the code would be more complex.

Thanks for your code review

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
