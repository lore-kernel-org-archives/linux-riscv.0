Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB4DC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 01:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwZqY9brFOsDD7LNZL6K3xoq0PIGQUwFy+isPOvmBAQ=; b=0IqQvDTJzLNZiP
	LnEZVF1P/scnTC/sSmd4cciD30tcinZOqZgxbLRmcQ/nzTvl6iEbuZnGm2xVyW2u2rciLhVfooaiu
	9nK//sYn1JEQ4fua3iiigEoFmrmBoFSJVLESkB81Oe3OfgTpb6E1ZxCteBwNEsjnd+xm2g4pqNk5H
	FsigX5sVEWS9qmruByPrNVeKu4t6dDVV7ALKyDc7G/sLDrXESKit8zupWMxDupYozLbRb/a5xYoPQ
	7TLEOQCw/zBMEs3GxbqoNkd45lToK8qwlyEWk0E6eUp1VeFH93dMDQz2yFsm7Pj/AOfQoenwbHrTy
	pKO64TJSRtoyS3DT0v1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oswix-001jDb-ET; Thu, 10 Nov 2022 01:51:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oswiu-001jCg-BQ
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 01:51:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 177A061D45
	for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 01:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCD1C43147
	for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 01:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668045077;
	bh=oKQwTFxHq2kGMa1vOhC7zSnxTLyv7w68uwwH5S/nliI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UYHpTR2osa/At5V9rma90+CY0h1rg1v2er7L0mB22stbhBlmugc6AcyivNg3UfygE
	 jMrJzBKNITunZAIwg2JN48ZT5QemaEWsYodcu9XoEF90IRKC/ZiJBiC24G19xbJOo8
	 UlBiacYo+NXc4TJvQgguynB5OPo+8eTGjs/i3s9BCtouYlpWg0Rpdj0YyhKRv6iX7V
	 ay52QE9kxKWyORVxjxmwipJeHuRNS0krUf3IrdgOPBCsheisH21VjxOG6GXDD5/jpe
	 U8ct0IFCoyaTWTsxHNscP/NTjJ4aAdE3Z9ZipGLlRMWDIhZ/yfZ2+sUn7deljGhJiB
	 FMqhKCU8RJO9Q==
Received: by mail-oi1-f182.google.com with SMTP id h132so514094oif.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Nov 2022 17:51:17 -0800 (PST)
X-Gm-Message-State: ACrzQf1bKZ5Oxc9eDZISMqfiQqqh72f1Cj6+mkm3ZB2a46tdxH2BU7bv
	VsFoNfUXkdQaycbJ7opNsKYeLxiAxp6dBniCLAI=
X-Google-Smtp-Source: AMsMyM4MWhEeTyU4aE0ONp7ineIbT2o/2KCHK9CodVfC9wzPYs8zSZ/0JrI+Yf5WwekiZlcEN05rAOwpdwK659+BHfk=
X-Received: by 2002:aca:c1d4:0:b0:359:b15f:23f2 with SMTP id
 r203-20020acac1d4000000b00359b15f23f2mr1024667oif.112.1668045076113; Wed, 09
 Nov 2022 17:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20221109054056.3618089-1-guoren@kernel.org> <20221109094503.he4ihaow7axjseuj@kamzik>
In-Reply-To: <20221109094503.he4ihaow7axjseuj@kamzik>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 10 Nov 2022 09:51:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRoeog55EMEZeziLxX0QNxD_pjBh979y8zp6sVwdarNpQ@mail.gmail.com>
Message-ID: <CAJF2gTRoeog55EMEZeziLxX0QNxD_pjBh979y8zp6sVwdarNpQ@mail.gmail.com>
Subject: Re: [PATCH V2] riscv: asid: Fixup stale TLB entry cause application crash
To: Andrew Jones <ajones@ventanamicro.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, philipp.tomsich@vrull.eu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_175120_508221_9FEE03F2 
X-CRM114-Status: GOOD (  42.83  )
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

On Wed, Nov 9, 2022 at 5:45 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Nov 09, 2022 at 12:40:56AM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > After use_asid_allocator is enabled, the userspace application will
> > crash by stale TLB entries. Because only using cpumask_clear_cpu without
> > local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
> > Then set_mm_asid would cause the user space application to get a stale
> > value by stale TLB entry, but set_mm_noasid is okay.
> >
> > Here is the symptom of the bug:
> > unhandled signal 11 code 0x1 (coredump)
> >    0x0000003fd6d22524 <+4>:     auipc   s0,0x70
> >    0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
> > => 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
> > (gdb) i r s0
> > s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
> > (gdb) x /2x 0x3fd6d92490
> > 0x3fd6d92490:   0xd80ac8a8      0x0000003f
> > The core dump file shows that register s0 is wrong, but the value in
> > memory is correct. Because 'ld s0, -148(s0)' used a stale mapping entry
> > in TLB and got a wrong result from an incorrect physical address.
> >
> > When the task ran on CPU0, which loaded/speculative-loaded the value of
> > address(0x3fd6d92490), then the first version of the mapping entry was
> > PTWed into CPU0's TLB.
> > When the task switched from CPU0 to CPU1 (No local_tlb_flush_all here by
> > asid), it happened to write a value on the address (0x3fd6d92490). It
> > caused do_page_fault -> wp_page_copy -> ptep_clear_flush ->
> > ptep_get_and_clear & flush_tlb_page.
> > The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need TLB
> > flush, but CPU0 had cleared the CPU0's mm_cpumask in the previous
> > switch_mm. So we only flushed the CPU1 TLB and set the second version
> > mapping of the PTE. When the task switched from CPU1 to CPU0 again, CPU0
> > still used a stale TLB mapping entry which contained a wrong target
> > physical address. It raised a bug when the task happened to read that
> > value.
> >
> > The solution is to keep all CPUs' footmarks of cpumask(mm) in switch_mm,
> > which could prevent losing pieces of stuff during TLB flush.
> >
> > Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Anup Patel <apatel@ventanamicro.com>
> > Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> > Changes in v2:
> >  - Fixup nommu compile problem (Thx Conor, Also Reported-by: kernel
> >    test robot <lkp@intel.com>)
> >  - Keep cpumask_clear_cpu for noasid
> > ---
> >  arch/riscv/mm/context.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > index 7acbfbd14557..f58e4b211595 100644
> > --- a/arch/riscv/mm/context.c
> > +++ b/arch/riscv/mm/context.c
> > @@ -317,7 +317,11 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >        */
> >       cpu = smp_processor_id();
> >
> > -     cpumask_clear_cpu(cpu, mm_cpumask(prev));
> > +#ifdef CONFIG_MMU
> > +     if (!static_branch_unlikely(&use_asid_allocator))
> > +#endif
>
> That's not very pretty. Can't we just do the following, instead?
>
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..ace419761e31 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -16,10 +16,11 @@
>  #include <asm/cacheflush.h>
>  #include <asm/mmu_context.h>
>
> -#ifdef CONFIG_MMU
>
>  DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
Define use_asid_allocator in nommu part? How about:

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..ed3f8de7ef97 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -205,12 +205,16 @@ static void set_mm_noasid(struct mm_struct *mm)
        local_flush_tlb_all();
 }

-static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
+static inline void set_mm(struct mm_struct *prev,
+                         struct mm_struct *next, unsigned int cpu)
 {
-       if (static_branch_unlikely(&use_asid_allocator))
-               set_mm_asid(mm, cpu);
-       else
-               set_mm_noasid(mm);
+       cpumask_set_cpu(cpu, mm_cpumask(next));
+       if (static_branch_unlikely(&use_asid_allocator)) {
+               set_mm_asid(next, cpu);
+       } else {
+               cpumask_clear_cpu(cpu, mm_cpumask(prev));
+               set_mm_noasid(next);
+       }
 }

 static int __init asids_init(void)
@@ -264,7 +268,8 @@ static int __init asids_init(void)
 }
 early_initcall(asids_init);
 #else
-static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
+static inline void set_mm(struct mm_struct *prev,
+                         struct mm_struct *next, unsigned int cpu)
 {
        /* Nothing to do here when there is no MMU */
 }
@@ -317,10 +322,7 @@ void switch_mm(struct mm_struct *prev, struct
mm_struct *next,
         */
        cpu = smp_processor_id();

-       cpumask_clear_cpu(cpu, mm_cpumask(prev));
-       cpumask_set_cpu(cpu, mm_cpumask(next));
-
-       set_mm(next, cpu);
+       set_mm(prev, next, cpu);

        flush_icache_deferred(next, cpu);

>
> +#ifdef CONFIG_MMU
> +
>  static unsigned long asid_bits;
>  static unsigned long num_asids;
>  static unsigned long asid_mask;
>
>
> Thanks,
> drew
>
> > +             cpumask_clear_cpu(cpu, mm_cpumask(prev));
> > +
> >       cpumask_set_cpu(cpu, mm_cpumask(next));
> >
> >       set_mm(next, cpu);
> > --
> > 2.36.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
