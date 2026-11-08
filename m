Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92555606A31A
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 03:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c8OC11ur;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQRE8BJc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4/MNT2h0xabIOG8FJLx2i5Y0rUAsKSIHnHMyXmRPUlI=; b=c8OC11ury2ZaspnlhrRdvsM4f5
	I10Ste1KcfRC3YEE89F6iWNH9xmwx3FLeV5KmNPy6l+SCkm1REL3SGs3fvOx2xWBbf2qbEgwaXLkT
	1wVeLju4uRrg3m0nwzr2WdJNkwV1TXPB0wo4FClXFEftTLs+RPCJlH55u0vpYOgx7OXXCHEF0XLs0
	tTTIBGu058UimwgKeRDgH1kL6hK5zXFpfZis9raCKlVLOG/AR4OxjLlNSaaR4dPSHaffBEo9ecFEZ
	vRmid+REHbljGVXd8lbaUu+ny8l7tHLBE0UOXfYJvw/wvprsk6LewKTEHzvcgVh0HxDqNvNAcYdLD
	8rJCG2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPtNW-0000000FdQn-0Ug0;
	Sun, 08 Nov 2026 03:15:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPtNV-0000000FdQ5-0G7L
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 03:15:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 514E644806;
	Sun,  8 Nov 2026 03:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788341F008A3;
	Sun,  8 Nov 2026 03:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794107732;
	bh=a/bZ5iXP4DDa9C3rE1j+9R8AKF/7AKe9/pell36SluI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gQRE8BJcf8LvyLbU47fcRumukgkMk2dqVAt4858j0hUiHCefBAFkrZdi+AsmTUQpM
	 REhZREwjELCnrvmjsck9IssG56NK7j45N6PlBZwUQI4HE8GD8GThzFGrJwatPFYveQ
	 WUYJQ3kzP0NS3TlardL7VE0gJhHe+YXtLVveZ54B096kZV2NYo+n9PrdQ/Io8BHiRY
	 pwzdVWv9Dmbnmp8idhvLp37xFaPETNxvefnR5wlk+o0Pr7NiNKkKinqIL3LPiavF2l
	 kNmbqZshDFTAKlrtFQHiGT1UsyjKasBC/viuUerMhAO+8RxwoOyQyGpxQJ4H6S+SXT
	 c4/hVjEF/2okQ==
Date: Sun, 8 Nov 2026 10:55:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Waterman <andrew@sifive.com>,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: mm: Skip the icache flush for special PTEs
Message-ID: <au_klz4_971bxJ_c@xhacker>
References: <20261017013634.792220-1-nickolai@csail.mit.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261017013634.792220-1-nickolai@csail.mit.edu>
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

On Fri, Oct 16, 2026 at 09:36:34PM -0400, Nickolai Zeldovich wrote:
> Mapping device memory executable crashes the kernel: an mmap() with
> PROT_EXEC of a physical range outside RAM, from /dev/mem, from a PCI
> BAR's sysfs resource file, from a frame buffer or from any driver whose
> mmap() uses remap_pfn_range(), io_remap_pfn_range() or vmf_insert_pfn(),
> oopses in flush_icache_pte() with the page table lock held; the task
> never completes its exit and its parent's wait() hangs. On QEMU virt
> with the riscv64 defconfig of v7.3-rc7, mapping the PCIe ECAM window
> from /dev/mem:
> 
> mmap(/dev/mem, phys 0x30000000, PROT_READ|PROT_EXEC, MAP_SHARED)
> Unable to handle kernel paging request at virtual address ff1c000000c00008
> Oops [#1]
> epc : flush_icache_pte+0x74/0xa0
>  ra : do_remap_pfn_range+0x2b2/0x3ee
> ...
> note: test[52] exited with preempt_count 2
> 
> With CONFIG_FLATMEM (32-bit, or a 64-bit configuration without
> SPARSEMEM) nothing faults: pte_page() of a pfn outside RAM is a pointer
> outside mem_map, and flush_icache_pte() tests and sets a bit of whatever
> memory it lands on. The privilege needed is that of the device file
> (root for /dev/mem and the PCI resource files). Present since the port
> was merged (v4.15).
> 
> __set_pte_at() calls flush_icache_pte() for every present executable
> PTE. flush_icache_pte() does the flush once per folio: it takes
> page_folio(pte_page(pte)) and tests and sets PG_dcache_clean. A special
> PTE (pte_mkspecial(), what remap_pfn_range() and vmf_insert_pfn() write
> into a VM_PFNMAP mapping) maps a frame the kernel does not manage as a
> page: there is no struct page behind it, so pte_page() returns a vmemmap
> address with no memory section, or with FLATMEM a pointer outside the
> array.
> 
> Skip the flush for special PTEs, as arm64 does since
> commit 71fdb6bf61bf ("arm64: Do not synchronise I and D caches for
> special ptes"). These mappings are device memory or buffers the kernel
> never wrote code into on the user's behalf; a user that writes code
> into one and executes it has to flush with the cache flush system
> call, as for any memory it writes itself.
> 
> Found while formally verifying remap_pte_range() against the kernel
> binary.
> 
> Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

this patch looks good to me, but the comment needs updating, see below
With that,
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> 
> Notes:
>     Every pte_special() PTE goes through this path: remap_pfn_range() and
>     io_remap_pfn_range() (remap_pte_range() writes pte_mkspecial(pfn_pte())),
>     vmf_insert_pfn() (insert_pfn()), and the huge variants through
>     set_pmd_at()/set_pud_at(), which also land in __set_pte_at(). The
>     pte_special() bit is _PAGE_SPECIAL (RSW bit 8) on every riscv
>     configuration; ARCH_HAS_PTE_SPECIAL is selected unconditionally.
>     
>     Non-special PTEs are unchanged: anonymous, page cache and
>     vm_insert_page() mappings keep the per-folio flush. A RAM-backed
>     VM_PFNMAP mapping (dma_mmap_coherent() of an allocated buffer, /dev/mem
>     over RAM) loses the flush it used to get; nothing in the kernel writes
>     instructions into such a buffer for userspace to execute, and the
>     PG_dcache_clean state of those pages was never maintained for that use.
>     
>     Reproducer (QEMU virt, riscv64 defconfig, as /init with /dev/mem c 1 1
>     in the initramfs; the PCIe ECAM window is at 0x30000000, any non-RAM
>     range does):
>     
>       riscv64-linux-gnu-gcc -O2 -static -o test exec_mmio_mmap.c
>       qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic \
>           -bios /usr/share/qemu/opensbi-riscv64-generic-fw_dynamic.bin \
>           -kernel Image -initrd initramfs.cpio -append "console=ttyS0 rdinit=/init"
>     
>       unpatched: Unable to handle kernel paging request at virtual address
>                  ff1c000000c00008, epc : flush_icache_pte+0x74/0xa0,
>                  ra : do_remap_pfn_range+0x2b2/0x3ee; the task never exits
>       patched:   mapped at 0x7fffab55d000, first word 0x00081b36
>                  (the host bridge's vendor and device ID)
>     
>       #include <fcntl.h>
>       #include <stdint.h>
>       #include <stdio.h>
>       #include <stdlib.h>
>       #include <sys/mman.h>
>       #include <unistd.h>
>     
>       int main(int argc, char **argv)
>       {
>       	unsigned long phys = argc > 1 ? strtoul(argv[1], NULL, 0) : 0x30000000UL;
>       	volatile uint32_t *p;
>       	int fd;
>     
>       	fd = open("/dev/mem", O_RDONLY | O_SYNC);
>       	if (fd < 0) {
>       		perror("open /dev/mem");
>       		return 2;
>       	}
>       	printf("mmap(/dev/mem, phys 0x%lx, PROT_READ|PROT_EXEC, MAP_SHARED)\n", phys);
>       	fflush(stdout);
>       	p = mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_SHARED, fd, phys);
>       	if (p == MAP_FAILED) {
>       		perror("mmap");
>       		return 2;
>       	}
>       	printf("mapped at %p, first word 0x%08x\n", p, p[0]);
>       	return 0;
>       }
> 
>  arch/riscv/include/asm/pgtable.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 40b1ed4f3ea8..7a4d60ccabb0 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -628,7 +628,8 @@ void flush_icache_pte(struct mm_struct *mm, pte_t pte);
>  
>  static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
>  {
> -	if (pte_present(pteval) && pte_exec(pteval))
> +	/* A special PTE has no struct page for flush_icache_pte() to track. */

what about "Special PTE mappings are not intended to be executable and
may not even have an associated struct page"?

> +	if (pte_present(pteval) && pte_exec(pteval) && !pte_special(pteval))
>  		flush_icache_pte(mm, pteval);
>  
>  	set_pte(ptep, pteval);
> 
> base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
