Return-Path: <SRS0=2RK3=K4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C562EC4708F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 16:05:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67C3E6161E
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 16:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67C3E6161E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+6c4CC1IlNEeUFcNl6+g7/QZ+UqUY8xAX7DF5/yot8=; b=2TaexDH9/4ETy7
	UDFPw9NxNpurEuABuK4AQc127GsLEPuUt8mI6oRfQSc3jzUQ4uAFSJUCunaIdqr1ym+vhaacyFuaH
	j1wZiU7UfeP764yYZFA/mFCXCTg3i5SF/+Qg78n/Jmy8PA3S4bs7mu5wwWr4Wh8ffsztpPTS5FtbO
	G6cg+jRJzi1q5IE0ZwGbcoWWFF/Mxpz9ViTfFUj7kNHI66vMK2XaPtR8UBwBl4672j+skjFSFpuQD
	LyEsSPlUa86eflu5nySxw7pqvZLpFa3sR3JQlN2W2PP1uQ+ut+L0bCTTkRfsW3hnigXMBf5/jQUiP
	uvucwHKeMHVsrAzJY35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loTMa-00512N-HX; Wed, 02 Jun 2021 16:05:00 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loTML-0050xs-8L
 for linux-riscv@lists.infradead.org; Wed, 02 Jun 2021 16:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=IYktHWIC/0pL/enp8IB48kzyHdrmC1fbP3
 nK9BPUAq0=; b=mkmRLrAMXE4tQvtea7k9dyvMdo2FB/mIsk1qrUDf+o2F+dW3lw
 lFdyu7FJnzvFG5aC8jbLFNxZdH5NcS0SGfYzoEDAIRpv8ZWUjCdKXE6bpsa9Clx1
 gsE3DQ3nPBpbvov60rzcMCF6imnsIOVw0jAF3NtoPoY438SyPLQ35k9OU=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygD3+YEArLdgTdSAAA--.30389S2; 
 Thu, 03 Jun 2021 00:04:16 +0800 (CST)
Date: Wed, 2 Jun 2021 23:58:51 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: init: Consolidate vars, functions
Message-ID: <20210602235851.001a0d41@xhacker>
In-Reply-To: <20210602231226.0e45524b@xhacker>
References: <20210516211556.43c00055@xhacker>
 <YLaWseLdg5JYElVx@Ryzen-9-3900X.localdomain>
 <20210602231226.0e45524b@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygD3+YEArLdgTdSAAA--.30389S2
X-Coremail-Antispam: 1UD129KBjvJXoW3tw48Jr4kAr15tryftw43Wrg_yoWDZw18pF
 WUJF4UKF48Xr1UJayIqry5uF1Fyw1DCa43Gr17Gw1rJ3Wqgrnrur18GrWa9r98ArWxW3Wf
 Jr1kta1xtr4UJaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73UjIFyTuYvjxUqEoXUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_090447_392168_A39BF24E 
X-CRM114-Status: GOOD (  32.64  )
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

On Wed, 2 Jun 2021 23:12:26 +0800
Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:

> On Tue, 1 Jun 2021 13:21:05 -0700
> Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > Hi Jisheng,  
> 
> Hi Nathan,
> 
> > 
> > On Sun, May 16, 2021 at 09:15:56PM +0800, Jisheng Zhang wrote:  
> > > From: Jisheng Zhang <jszhang@kernel.org>
> > > 
> > > Consolidate the following items in init.c
> > > 
> > > Staticize global vars as much as possible;
> > > Add __initdata mark if the global var isn't needed after init
> > > Add __init mark if the func isn't needed after init
> > > Add __ro_after_init if the global var is read only after init
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/include/asm/set_memory.h |  2 +-
> > >  arch/riscv/mm/init.c                | 36 +++++++++++++++--------------
> > >  2 files changed, 20 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> > > index 086f757e8ba3..9d4d455726d4 100644
> > > --- a/arch/riscv/include/asm/set_memory.h
> > > +++ b/arch/riscv/include/asm/set_memory.h
> > > @@ -27,7 +27,7 @@ static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0;
> > >  #endif
> > >  
> > >  #if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> > > -void protect_kernel_linear_mapping_text_rodata(void);
> > > +void __init protect_kernel_linear_mapping_text_rodata(void);
> > >  #else
> > >  static inline void protect_kernel_linear_mapping_text_rodata(void) {}
> > >  #endif
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index 4c4c92ce0bb8..eac2d5c27b3e 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -53,7 +53,7 @@ struct pt_alloc_ops {
> > >  #endif
> > >  };
> > >  
> > > -static phys_addr_t dma32_phys_limit __ro_after_init;
> > > +static phys_addr_t dma32_phys_limit __initdata;
> > >  
> > >  static void __init zone_sizes_init(void)
> > >  {
> > > @@ -184,7 +184,7 @@ extern char _sdata[], _edata[];
> > >  #endif /* CONFIG_XIP_KERNEL */
> > >  
> > >  #ifdef CONFIG_MMU
> > > -static struct pt_alloc_ops _pt_ops __ro_after_init;
> > > +static struct pt_alloc_ops _pt_ops __initdata;
> > >  
> > >  #ifdef CONFIG_XIP_KERNEL
> > >  #define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&_pt_ops))
> > > @@ -200,13 +200,13 @@ EXPORT_SYMBOL(va_pa_offset);
> > >  #endif
> > >  /* Offset between kernel mapping virtual address and kernel load address */
> > >  #ifdef CONFIG_64BIT
> > > -unsigned long va_kernel_pa_offset;
> > > +unsigned long va_kernel_pa_offset __ro_after_init;
> > >  EXPORT_SYMBOL(va_kernel_pa_offset);
> > >  #endif
> > >  #ifdef CONFIG_XIP_KERNEL
> > >  #define va_kernel_pa_offset    (*((unsigned long *)XIP_FIXUP(&va_kernel_pa_offset)))
> > >  #endif
> > > -unsigned long va_kernel_xip_pa_offset;
> > > +unsigned long va_kernel_xip_pa_offset __ro_after_init;
> > >  EXPORT_SYMBOL(va_kernel_xip_pa_offset);
> > >  #ifdef CONFIG_XIP_KERNEL
> > >  #define va_kernel_xip_pa_offset        (*((unsigned long *)XIP_FIXUP(&va_kernel_xip_pa_offset)))
> > > @@ -216,7 +216,7 @@ EXPORT_SYMBOL(pfn_base);
> > >  
> > >  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> > >  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> > > -pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> > > +static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> > >  
> > >  pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
> > >  
> > > @@ -253,7 +253,7 @@ static inline pte_t *__init get_pte_virt_fixmap(phys_addr_t pa)
> > >  	return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
> > >  }
> > >  
> > > -static inline pte_t *get_pte_virt_late(phys_addr_t pa)
> > > +static inline pte_t *__init get_pte_virt_late(phys_addr_t pa)
> > >  {
> > >  	return (pte_t *) __va(pa);
> > >  }
> > > @@ -272,7 +272,7 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
> > >  	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> > >  }
> > >  
> > > -static phys_addr_t alloc_pte_late(uintptr_t va)
> > > +static phys_addr_t __init alloc_pte_late(uintptr_t va)
> > >  {
> > >  	unsigned long vaddr;
> > >  
> > > @@ -296,10 +296,10 @@ static void __init create_pte_mapping(pte_t *ptep,
> > >  
> > >  #ifndef __PAGETABLE_PMD_FOLDED
> > >  
> > > -pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
> > > -pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
> > > -pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> > > -pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> > > +static pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
> > > +static pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
> > > +static pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> > > +static pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> > >  
> > >  #ifdef CONFIG_XIP_KERNEL
> > >  #define trampoline_pmd ((pmd_t *)XIP_FIXUP(trampoline_pmd))
> > > @@ -319,7 +319,7 @@ static pmd_t *__init get_pmd_virt_fixmap(phys_addr_t pa)
> > >  	return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
> > >  }
> > >  
> > > -static pmd_t *get_pmd_virt_late(phys_addr_t pa)
> > > +static pmd_t *__init get_pmd_virt_late(phys_addr_t pa)
> > >  {
> > >  	return (pmd_t *) __va(pa);
> > >  }
> > > @@ -336,7 +336,7 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
> > >  	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> > >  }
> > >  
> > > -static phys_addr_t alloc_pmd_late(uintptr_t va)
> > > +static phys_addr_t __init alloc_pmd_late(uintptr_t va)
> > >  {
> > >  	unsigned long vaddr;
> > >  
> > > @@ -454,14 +454,16 @@ asmlinkage void __init __copy_data(void)
> > >  #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
> > >  #endif
> > >  
> > > -uintptr_t load_pa, load_sz;
> > > +static uintptr_t load_pa __initdata;    
> > 
> > Making load_pa static causing clang built kernels to no longer boot,
> > hanging after just a few lines of output in the console:
> > 
> > https://github.com/ClangBuiltLinux/continuous-integration2/runs/2717606254?check_suite_focus=true
> > 
> > I am not sure why that would make a difference nor why GCC is okay with
> > it. If it is a clang bug, it appears to be there for a while, given that
> > it reproduces back to clang-11.  
> 
> I can reproduce the issue. Here are my findindings:
> 
> * gcc + binutils can't reproduce it
> * clang + llvm-utils + ias can reproduce it
> * clang + binutils can reproduce it
> 
> 
> All below tests are done with clang + binutils.
> 
> Then I applied below modification:
> 
> -static uintptr_t load_pa __initdata;
> +uintptr_t load_pa __initdata;
> 
> I got below panic log:
> [    0.015418] Unable to handle kernel paging request at virtual address fffffffffffffff9
> [    0.016432] Oops [#1]
> [    0.016679] Modules linked in:
> [    0.017103] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.13.0-rc1+ #5
> [    0.017711] Hardware name: riscv-virtio,qemu (DT)
> [    0.018201] epc : trace_hardirqs_on+0x60/0xb2
> [    0.018582]  ra : restore_all+0xe/0x66
> [    0.018879] epc : ffffffff800cb09a ra : ffffffff800027b8 sp : ffffffff80c03dd0
> [    0.019376]  gp : ffffffff80d001c8 tp : ffffffff80c0c180 t0 : 0000000000000020
> [    0.019870]  t1 : ffffffff80006e40 t2 : ffffffff800d2e0a s0 : ffffffff80c03e00
> [    0.020346]  s1 : 0000000000000001 a0 : 0000000000000001 a1 : 0000000000000001
> [    0.020800]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.021243]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000054494d45
> [    0.021717]  s2 : ffffffff800027b8 s3 : ffffffff80d35968 s4 : ffffffff8061e1d8
> [    0.022179]  s5 : ffffffff80c0c180 s6 : ffffffe000e34b50 s7 : 00000000800130f0
> [    0.022674]  s8 : 000000000000007f s9 : 0000000080012010 s10: 0000000000000000
> [    0.023176]  s11: 0000000000000000 t3 : ffffffff80d00108 t4 : ffffffff80006e40
> [    0.023693]  t5 : ffffffff80006e40 t6 : ffffffff800d2e0a
> [    0.024153] status: 0000000000000100 badaddr: fffffffffffffff9 cause: 000000000000000d
> [    0.025367] Call Trace:
> [    0.025749] [<ffffffff800cb09a>] trace_hardirqs_on+0x60/0xb2
> [    0.026402] [<ffffffff800027b8>] restore_all+0xe/0x66
> [    0.027261] Unable to handle kernel paging request at virtual address fffffffffffffffa
> [    0.027827] Oops [#2]
> [    0.028013] Modules linked in:
> [    0.028321] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D           5.13.0-rc1+ #5
> [    0.028839] Hardware name: riscv-virtio,qemu (DT)
> [    0.029166] epc : trace_hardirqs_on+0x60/0xb2
> [    0.029505]  ra : restore_all+0xe/0x66
> [    0.029785] epc : ffffffff800cb09a ra : ffffffff800027b8 sp : ffffffff80c03a80
> [    0.030266]  gp : ffffffff80d001c8 tp : ffffffff80c0c180 t0 : 0000000000000020
> [    0.030748]  t1 : ffffffff80006e40 t2 : ffffffff800d2e0a s0 : ffffffff80c03ab0
> [    0.031227]  s1 : 0000000000000001 a0 : 0000000000000002 a1 : 0000000000000002
> [    0.031717]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.032199]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000054494d45
> [    0.032680]  s2 : ffffffff800027b8 s3 : ffffffff80d35968 s4 : ffffffff8061e1d8
> [    0.033160]  s5 : ffffffff80c0c180 s6 : ffffffe000e34b50 s7 : 00000000800130f0
> [    0.033642]  s8 : 000000000000007f s9 : 0000000080012010 s10: 0000000000000000
> [    0.034123]  s11: 0000000000000000 t3 : ffffffff80d00108 t4 : ffffffff80006e40
> [    0.034601]  t5 : ffffffff80006e40 t6 : ffffffff800d2e0a
> [    0.034965] status: 0000000000000100 badaddr: fffffffffffffffa cause: 000000000000000d
> [    0.035492] Call Trace:
> [    0.035682] [<ffffffff800cb09a>] trace_hardirqs_on+0x60/0xb2
> [    0.036077] [<ffffffff800027b8>] restore_all+0xe/0x66
> [    0.036545] ---[ end trace 7f4fbff09d927668 ]---
> [    0.037188] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.038107] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> 
> Then I checked 5.13-rc1, above panic log can be reproduced too. So the issue
> should exist there for a while. I never tried clang with riscv, did you remember
> which last commit or version clang works, I may try to bisect.
> 

More findings:

*The above panic issue can also be seen from 5.12-rc2. If disable FTRACE, then
the panic disappears, kernel can boot

*so I retested riscv next tree w/ FTRACE disabled, kernel can boot w/ below
modification:

-static uintptr_t load_pa __initdata;
+uintptr_t load_pa __initdata;

This is a weird issue. Any clue is appreciated.

Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
