Return-Path: <SRS0=rvuQ=AN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4424C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 21:47:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA6C20772
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 21:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kdh4dRiV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhfWKe7U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA6C20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8cdY8VM8KdcWAqIwnsQS/VWbSOL5geV+CC/2gyNUWjk=; b=Kdh4dRiVEOWgl0stWXG7anQdR
	gdEcjA0bAxeLuld8z7Gs3XE8ble6sXnebYdQ1b5hFRILrzAK8/HHl6Ia05wAcxE+/YIq3OwT8jH3a
	cWPfT2vc3wjNw7ygxpGI3BB4+Hs/0r1PZF+bUybKwNShfSFkSD9EJcb2RZWXIzqISGGgrOVgFn4S4
	9cNRLyWCIdUYBbeTT90qHj55lW9LQTzYgrI3lS3MPGUiigTGIOejraQZbBIxAt4BIJrMckPp4fl2o
	cdBLyxQPSQt3X9mgpCLxrMZbgpSgrz8ptvnKl6nidjavAu/G3CWSGJZFFDQ4Yn5h6dYWWuCniKAxQ
	4wgG3Hn5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr736-0007Rc-Mo; Thu, 02 Jul 2020 21:47:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr730-0007Pp-RU; Thu, 02 Jul 2020 21:47:11 +0000
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E6352075D;
 Thu,  2 Jul 2020 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593726429;
 bh=gvP2zjzt3W4dfD2t75YDPObWaiQFVtNlgHUhH3gNn3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WhfWKe7UYTpsr66NZ2WC307AcyCJ1TtI7G2OBKp9HhrsKZKhdx1w7pMdeOwPIp2/g
 Vas6aAz3CGAbswd8kXCi7FErQYIQ1j+gLUFQSSZoQXfzuWLvKdc63AGpB15cUP2ho4
 d9OrkMXIELqL/mKuh/FECINnwBEdop8sjE8tgdOw=
Date: Fri, 3 Jul 2020 00:46:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/8] mm: cleanup usage of <asm/pgalloc.h>
Message-ID: <20200702214654.GB2999148@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_174711_101025_A022451F 
X-CRM114-Status: GOOD (  18.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Gentle ping.

On Sat, Jun 27, 2020 at 05:34:45PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Hi,
> 
> Most architectures have very similar versions of pXd_alloc_one() and
> pXd_free_one() for intermediate levels of page table. 
> These patches add generic versions of these functions in
> <asm-generic/pgalloc.h> and enable use of the generic functions where
> appropriate.
> 
> In addition, functions declared and defined in <asm/pgalloc.h> headers
> are used mostly by core mm and early mm initialization in arch and there is
> no actual reason to have the <asm/pgalloc.h> included all over the place.
> The first patch in this series removes unneeded includes of <asm/pgalloc.h>
> 
> In the end it didn't work out as neatly as I hoped and moving
> pXd_alloc_track() definitions to <asm-generic/pgalloc.h> would require
> unnecessary changes to arches that have custom page table allocations, so
> I've decided to move lib/ioremap.c to mm/ and make pgalloc-track.h local to
> mm/.
> 
> Joerg Roedel (1):
>   mm: move p?d_alloc_track to separate header file
> 
> Mike Rapoport (7):
>   mm: remove unneeded includes of <asm/pgalloc.h>
>   opeinrisc: switch to generic version of pte allocation
>   xtensa: switch to generic version of pte allocation
>   asm-generic: pgalloc: provide generic pmd_alloc_one() and pmd_free_one()
>   asm-generic: pgalloc: provide generic pud_alloc_one() and pud_free_one()
>   asm-generic: pgalloc: provide generic pgd_free()
>   mm: move lib/ioremap.c to mm/
> 
>  arch/alpha/include/asm/pgalloc.h             | 21 +----
>  arch/alpha/include/asm/tlbflush.h            |  1 -
>  arch/alpha/kernel/core_irongate.c            |  1 -
>  arch/alpha/kernel/core_marvel.c              |  1 -
>  arch/alpha/kernel/core_titan.c               |  1 -
>  arch/alpha/kernel/machvec_impl.h             |  2 -
>  arch/alpha/kernel/smp.c                      |  1 -
>  arch/alpha/mm/numa.c                         |  1 -
>  arch/arc/mm/fault.c                          |  1 -
>  arch/arc/mm/init.c                           |  1 -
>  arch/arm/include/asm/pgalloc.h               | 12 +--
>  arch/arm/include/asm/tlb.h                   |  1 -
>  arch/arm/kernel/machine_kexec.c              |  1 -
>  arch/arm/kernel/smp.c                        |  1 -
>  arch/arm/kernel/suspend.c                    |  1 -
>  arch/arm/mach-omap2/omap-mpuss-lowpower.c    |  1 -
>  arch/arm/mm/hugetlbpage.c                    |  1 -
>  arch/arm/mm/mmu.c                            |  1 +
>  arch/arm64/include/asm/pgalloc.h             | 39 +---------
>  arch/arm64/kernel/smp.c                      |  1 -
>  arch/arm64/mm/hugetlbpage.c                  |  1 -
>  arch/arm64/mm/ioremap.c                      |  1 -
>  arch/arm64/mm/mmu.c                          |  1 +
>  arch/csky/include/asm/pgalloc.h              |  7 +-
>  arch/csky/kernel/smp.c                       |  1 -
>  arch/hexagon/include/asm/pgalloc.h           |  7 +-
>  arch/ia64/include/asm/pgalloc.h              | 24 ------
>  arch/ia64/include/asm/tlb.h                  |  1 -
>  arch/ia64/kernel/process.c                   |  1 -
>  arch/ia64/kernel/smp.c                       |  1 -
>  arch/ia64/kernel/smpboot.c                   |  1 -
>  arch/ia64/mm/contig.c                        |  1 -
>  arch/ia64/mm/discontig.c                     |  1 -
>  arch/ia64/mm/hugetlbpage.c                   |  1 -
>  arch/ia64/mm/tlb.c                           |  1 -
>  arch/m68k/include/asm/mmu_context.h          |  2 +-
>  arch/m68k/include/asm/sun3_pgalloc.h         |  7 +-
>  arch/m68k/kernel/dma.c                       |  2 +-
>  arch/m68k/kernel/traps.c                     |  3 +-
>  arch/m68k/mm/cache.c                         |  2 +-
>  arch/m68k/mm/fault.c                         |  1 -
>  arch/m68k/mm/kmap.c                          |  2 +-
>  arch/m68k/mm/mcfmmu.c                        |  1 +
>  arch/m68k/mm/memory.c                        |  1 -
>  arch/m68k/sun3x/dvma.c                       |  2 +-
>  arch/microblaze/include/asm/pgalloc.h        |  6 --
>  arch/microblaze/include/asm/tlbflush.h       |  1 -
>  arch/microblaze/kernel/process.c             |  1 -
>  arch/microblaze/kernel/signal.c              |  1 -
>  arch/mips/include/asm/pgalloc.h              | 19 +----
>  arch/mips/sgi-ip32/ip32-memory.c             |  1 -
>  arch/nds32/mm/mm-nds32.c                     |  2 +
>  arch/nios2/include/asm/pgalloc.h             |  7 +-
>  arch/openrisc/include/asm/pgalloc.h          | 33 +-------
>  arch/openrisc/include/asm/tlbflush.h         |  1 -
>  arch/openrisc/kernel/or32_ksyms.c            |  1 -
>  arch/parisc/include/asm/mmu_context.h        |  1 -
>  arch/parisc/include/asm/pgalloc.h            | 12 +--
>  arch/parisc/kernel/cache.c                   |  1 -
>  arch/parisc/kernel/pci-dma.c                 |  1 -
>  arch/parisc/kernel/process.c                 |  1 -
>  arch/parisc/kernel/signal.c                  |  1 -
>  arch/parisc/kernel/smp.c                     |  1 -
>  arch/parisc/mm/hugetlbpage.c                 |  1 -
>  arch/parisc/mm/ioremap.c                     |  2 +-
>  arch/powerpc/include/asm/tlb.h               |  1 -
>  arch/powerpc/mm/book3s64/hash_hugetlbpage.c  |  1 -
>  arch/powerpc/mm/book3s64/hash_pgtable.c      |  1 -
>  arch/powerpc/mm/book3s64/hash_tlb.c          |  1 -
>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c |  1 -
>  arch/powerpc/mm/init_32.c                    |  1 -
>  arch/powerpc/mm/kasan/8xx.c                  |  1 -
>  arch/powerpc/mm/kasan/book3s_32.c            |  1 -
>  arch/powerpc/mm/mem.c                        |  1 -
>  arch/powerpc/mm/nohash/40x.c                 |  1 -
>  arch/powerpc/mm/nohash/8xx.c                 |  1 -
>  arch/powerpc/mm/nohash/fsl_booke.c           |  1 -
>  arch/powerpc/mm/nohash/kaslr_booke.c         |  1 -
>  arch/powerpc/mm/pgtable.c                    |  1 -
>  arch/powerpc/mm/pgtable_64.c                 |  1 -
>  arch/powerpc/mm/ptdump/hashpagetable.c       |  2 +-
>  arch/powerpc/mm/ptdump/ptdump.c              |  1 -
>  arch/powerpc/platforms/pseries/cmm.c         |  1 -
>  arch/riscv/include/asm/pgalloc.h             | 18 +----
>  arch/riscv/mm/fault.c                        |  1 -
>  arch/s390/include/asm/tlb.h                  |  1 -
>  arch/s390/include/asm/tlbflush.h             |  1 -
>  arch/s390/kernel/machine_kexec.c             |  1 -
>  arch/s390/kernel/ptrace.c                    |  1 -
>  arch/s390/kvm/diag.c                         |  1 -
>  arch/s390/kvm/priv.c                         |  1 -
>  arch/s390/kvm/pv.c                           |  1 -
>  arch/s390/mm/cmm.c                           |  1 -
>  arch/s390/mm/mmap.c                          |  1 -
>  arch/s390/mm/pgtable.c                       |  1 -
>  arch/sh/include/asm/pgalloc.h                |  4 +
>  arch/sh/kernel/idle.c                        |  1 -
>  arch/sh/kernel/machine_kexec.c               |  1 -
>  arch/sh/mm/cache-sh3.c                       |  1 -
>  arch/sh/mm/cache-sh7705.c                    |  1 -
>  arch/sh/mm/hugetlbpage.c                     |  1 -
>  arch/sh/mm/init.c                            |  1 +
>  arch/sh/mm/ioremap_fixed.c                   |  1 -
>  arch/sh/mm/tlb-sh3.c                         |  1 -
>  arch/sparc/include/asm/ide.h                 |  1 -
>  arch/sparc/include/asm/tlb_64.h              |  1 -
>  arch/sparc/kernel/leon_smp.c                 |  1 -
>  arch/sparc/kernel/process_32.c               |  1 -
>  arch/sparc/kernel/signal_32.c                |  1 -
>  arch/sparc/kernel/smp_32.c                   |  1 -
>  arch/sparc/kernel/smp_64.c                   |  1 +
>  arch/sparc/kernel/sun4m_irq.c                |  1 -
>  arch/sparc/mm/highmem.c                      |  1 -
>  arch/sparc/mm/io-unit.c                      |  1 -
>  arch/sparc/mm/iommu.c                        |  1 -
>  arch/sparc/mm/tlb.c                          |  1 -
>  arch/um/include/asm/pgalloc.h                |  9 +--
>  arch/um/include/asm/pgtable-3level.h         |  3 -
>  arch/um/kernel/mem.c                         | 17 -----
>  arch/x86/ia32/ia32_aout.c                    |  1 -
>  arch/x86/include/asm/mmu_context.h           |  1 -
>  arch/x86/include/asm/pgalloc.h               | 42 +---------
>  arch/x86/kernel/alternative.c                |  1 +
>  arch/x86/kernel/apic/apic.c                  |  1 -
>  arch/x86/kernel/mpparse.c                    |  1 -
>  arch/x86/kernel/traps.c                      |  1 -
>  arch/x86/mm/fault.c                          |  1 -
>  arch/x86/mm/hugetlbpage.c                    |  1 -
>  arch/x86/mm/kaslr.c                          |  1 -
>  arch/x86/mm/pgtable_32.c                     |  1 -
>  arch/x86/mm/pti.c                            |  1 -
>  arch/x86/platform/uv/bios_uv.c               |  1 +
>  arch/xtensa/include/asm/pgalloc.h            | 40 ++++------
>  arch/xtensa/kernel/xtensa_ksyms.c            |  1 -
>  arch/xtensa/mm/cache.c                       |  1 -
>  arch/xtensa/mm/fault.c                       |  1 -
>  drivers/block/xen-blkback/common.h           |  1 -
>  drivers/iommu/ipmmu-vmsa.c                   |  1 -
>  drivers/xen/balloon.c                        |  1 -
>  drivers/xen/privcmd.c                        |  1 -
>  fs/binfmt_elf_fdpic.c                        |  1 -
>  include/asm-generic/pgalloc.h                | 80 ++++++++++++++++++++
>  include/asm-generic/tlb.h                    |  1 -
>  include/linux/mm.h                           | 45 -----------
>  lib/Makefile                                 |  1 -
>  mm/Makefile                                  |  2 +-
>  mm/hugetlb.c                                 |  1 +
>  {lib => mm}/ioremap.c                        |  2 +
>  mm/pgalloc-track.h                           | 51 +++++++++++++
>  mm/sparse.c                                  |  1 -
>  mm/vmalloc.c                                 |  1 +
>  151 files changed, 194 insertions(+), 451 deletions(-)
>  rename {lib => mm}/ioremap.c (99%)
>  create mode 100644 mm/pgalloc-track.h
> 
> -- 
> 2.26.2
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
