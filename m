Return-Path: <SRS0=DbKB=MB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19975C07E99
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 19:58:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54CF3613CA
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 19:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54CF3613CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AkVX9xkT7OOUrhfcEH7/TBfS0QoBvO59qL3pl3cEFg=; b=d3ilJixLvPkFoCtyehspFs4LBE
	WsKlQBJQZtIp1+cyd+ETPC5DirQEezK7N+qEtlYtHygZ9xENwcjZbRacfsyqCjIWEP55/JAsVxBNQ
	WVuLuil/e7FdAK0Kv1qUe3Lpjn4ADChc3RjGcWcFzavarpq60d0fp/iq+lLPkZF/2cswI4/sfJ4HR
	uUHbAImytjmcTLPnmcVqEkaUnkFE+9MMtBDsEvbkrG8YRc8cjlak4lW38x+RCPPPcshZEDE6ZHO87
	+wbWpv5gQCaaw5U21ofiYv8x868z6LhOSdpd8wFitjJrcGB6X7/OHCEpQpzs7/3UEDVbRhucTcYuz
	SAT0UUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1wdh-002QVS-CN; Fri, 09 Jul 2021 19:58:21 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1wdd-002QUf-Jb
 for linux-riscv@lists.infradead.org; Fri, 09 Jul 2021 19:58:20 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 65F5C200003;
 Fri,  9 Jul 2021 19:58:11 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.14 Merge Window, Part 1
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-423e8bdb-977e-4b99-a1bb-b8c530664a51@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <df700c15-a7b6-5a0d-6ebd-484ecc8c7923@ghiti.fr>
Date: Fri, 9 Jul 2021 21:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <mhng-423e8bdb-977e-4b99-a1bb-b8c530664a51@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_125817_971949_A01F9101 
X-CRM114-Status: GOOD (  32.81  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



Le 9/07/2021 =E0 16:53, Palmer Dabbelt a =E9crit=A0:
> The following changes since commit 8a4102a0cf07cc76a18f373f6b49485258cc6a=
f4:
> =

>    riscv: mm: Fix W+X mappings at boot (2021-06-01 21:15:09 -0700)
> =

> are available in the Git repository at:
> =

>    git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/ris=
cv-for-linus-5.14-mw0
> =

> for you to fetch changes up to 1958e5aef5098e28b7d6e6a2972649901ebecace:
> =

>    riscv: xip: Fix duplicate included asm/pgtable.h (2021-07-06 16:17:40 =
-0700)
> =

> ----------------------------------------------------------------
> RISC-V Patches for the 5.14 Merge Window, Part 1
> =

> In addition to We have a handful of new features for 5.14:
> =

> * Support for transparent huge pages.
> * Support for generic PCI resources mapping.
> * Support for the mem=3D kernel parameter.
> * Support for KFENCE.
> * A handful of fixes to avoid W+X mappings in the kernel.
> * Support for VMAP_STACK based overflow detection.
> * An optimized copy_{to,from}_user.
> ----------------------------------------------------------------
> There are some Kconfig merge conflicts.  They should be pretty
> straight-forward, but we do have a symbol out of order -- I thought I had=
 a
> script to check for that, but I guess it doesn't work.  I just sent out a=
 patch
> to fix it up.
> =

> diff --cc arch/riscv/Kconfig
> index 3590eb76000e,469a70bd8da6..d36f3c5029fd
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@@ -60,12 -61,11 +61,12 @@@ config RISC
>          select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>          select HANDLE_DOMAIN_IRQ
>          select HAVE_ARCH_AUDITSYSCALL
> -       select HAVE_ARCH_JUMP_LABEL
> -       select HAVE_ARCH_JUMP_LABEL_RELATIVE
> +       select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
> +       select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>          select HAVE_ARCH_KASAN if MMU && 64BIT
>          select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
>   +      select HAVE_ARCH_KFENCE if MMU && 64BIT
> -       select HAVE_ARCH_KGDB
> +       select HAVE_ARCH_KGDB if !XIP_KERNEL
>          select HAVE_ARCH_KGDB_QXFER_PKT
>          select HAVE_ARCH_MMAP_RND_BITS if MMU
>          select HAVE_ARCH_SECCOMP_FILTER
> @@@ -81,11 -80,9 +82,14 @@@
>          select HAVE_GCC_PLUGINS
>          select HAVE_GENERIC_VDSO if MMU && 64BIT
>          select HAVE_IRQ_TIME_ACCOUNTING
>   +      select HAVE_KPROBES
>   +      select HAVE_KPROBES_ON_FTRACE
>   +      select HAVE_KRETPROBES
> +       select HAVE_KPROBES if !XIP_KERNEL
> +       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> +       select HAVE_KRETPROBES if !XIP_KERNEL
>   +      select HAVE_MOVE_PMD
>   +      select HAVE_MOVE_PUD
>          select HAVE_PCI
>          select HAVE_PERF_EVENTS
>          select HAVE_PERF_REGS
> @@@ -108,7 -104,7 +112,8 @@@
>          select SYSCTL_EXCEPTION_TRACE
>          select THREAD_INFO_IN_TASK
>          select UACCESS_MEMCPY if !MMU
>   +      select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
> +       select ZONE_DMA32 if 64BIT
> =

>    config ARCH_MMAP_RND_BITS_MIN
>          default 18 if 64BIT
> ----------------------------------------------------------------
> Akira Tsukamoto (1):
>        riscv: __asm_copy_to-from_user: Optimize unaligned memory access a=
nd pipeline stall
> =

> Alexandre Ghiti (6):
>        riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED
>        riscv: Simplify xip and !xip kernel address conversion macros

@Palmer: As said in the thread of this patchset multiple times, those 2 =

patches should not be merged as it assumes that the base DRAM address is =

always 0x8000_0000 for all rv64 platforms: I don't think it is true, is it?

>        riscv: Introduce set_kernel_memory helper
>        riscv: Map the kernel with correct permissions the first time
>        riscv: Introduce structure that group all variables regarding kern=
el mapping
>        riscv: Fix PTDUMP output now BPF region moved back to module region
> =

> Bixuan Cui (1):
>        riscv: fix build error when CONFIG_SMP is disabled
> =

> Christoph Hellwig (1):
>        riscv: pass the mm_struct to __sbi_tlb_flush_range
> =

> Guo Ren (3):
>        riscv: Use global mappings for kernel pages
>        riscv: Cleanup unused functions
>        riscv: add ASID-based tlbflushing methods
> =

> Jeff Xie (1):
>        riscv: ptrace: add argn syntax
> =

> Jiapeng Chong (1):
>        riscv: xip: Fix duplicate included asm/pgtable.h
> =

> Jisheng Zhang (7):
>        riscv: mremap speedup - enable HAVE_MOVE_PUD and HAVE_MOVE_PMD
>        riscv: mm: Remove setup_zero_page()
>        riscv: Optimize switch_mm by passing "cpu" to flush_icache_deferre=
d()
>        riscv: Turn has_fpu into a static key if FPU=3Dy
>        riscv: kprobes: Remove redundant kprobe_step_ctx
>        riscv: Add __init section marker to some functions again
>        riscv: mm: init: Consolidate vars, functions
> =

> Kefeng Wang (5):
>        riscv: Move setup_bootmem into paging_init
>        riscv: mm: Drop redundant _sdata and _edata declaration
>        riscv: mm: Use better bitmap_zalloc()
>        riscv: Only initialize swiotlb when necessary
>        riscv: Add mem kernel parameter support
> =

> Liu Shixin (1):
>        riscv: Enable KFENCE for riscv64
> =

> Nanyong Sun (5):
>        riscv: mm: add _PAGE_LEAF macro
>        riscv: mm: make pmd_bad() check leaf condition
>        riscv: mm: add param stride for __sbi_tlb_flush_range
>        riscv: mm: add THP support on 64-bit
>        riscv: mm: fix build errors caused by mk_pmd()
> =

> Palmer Dabbelt (2):
>        RISC-V: Use asm-generic for {in,out}{bwlq}
>        Merge branch 'riscv-wx-mappings' into for-next
> =

> Randy Dunlap (1):
>        riscv: TRANSPARENT_HUGEPAGE: depends on MMU
> =

> Stanislaw Kardach (1):
>        riscv: enable generic PCI resource mapping
> =

> Tong Tiangen (1):
>        riscv: add VMAP_STACK overflow detection
> =

> Vitaly Wool (1):
>        riscv: fix typo in init.c
> =

>   arch/riscv/Kconfig                      |  12 +-
>   arch/riscv/include/asm/asm-prototypes.h |   3 +
>   arch/riscv/include/asm/io.h             |  13 --
>   arch/riscv/include/asm/kfence.h         |  63 +++++++
>   arch/riscv/include/asm/kprobes.h        |   7 -
>   arch/riscv/include/asm/mmu_context.h    |   2 +
>   arch/riscv/include/asm/page.h           |  81 +++++----
>   arch/riscv/include/asm/pci.h            |   2 +
>   arch/riscv/include/asm/pgtable-64.h     |   5 +-
>   arch/riscv/include/asm/pgtable-bits.h   |   5 +
>   arch/riscv/include/asm/pgtable.h        | 171 ++++++++++++++++++-
>   arch/riscv/include/asm/ptrace.h         |  31 ++++
>   arch/riscv/include/asm/sections.h       |  17 ++
>   arch/riscv/include/asm/set_memory.h     |  24 ++-
>   arch/riscv/include/asm/switch_to.h      |  11 +-
>   arch/riscv/include/asm/thread_info.h    |  15 ++
>   arch/riscv/include/asm/tlbflush.h       |   5 +
>   arch/riscv/kernel/asm-offsets.c         |   2 +
>   arch/riscv/kernel/cpufeature.c          |   6 +-
>   arch/riscv/kernel/entry.S               | 108 ++++++++++++
>   arch/riscv/kernel/head.S                |   4 +-
>   arch/riscv/kernel/kexec_relocate.S      |   4 +-
>   arch/riscv/kernel/machine_kexec.c       |   2 +-
>   arch/riscv/kernel/probes/kprobes.c      |  40 +----
>   arch/riscv/kernel/process.c             |   2 +-
>   arch/riscv/kernel/setup.c               |  18 +-
>   arch/riscv/kernel/signal.c              |   4 +-
>   arch/riscv/kernel/traps.c               |  35 ++++
>   arch/riscv/kernel/vmlinux-xip.lds.S     |   1 -
>   arch/riscv/kernel/vmlinux.lds.S         |   2 +-
>   arch/riscv/lib/uaccess.S                | 181 ++++++++++++++++----
>   arch/riscv/mm/context.c                 |  14 +-
>   arch/riscv/mm/fault.c                   |  11 +-
>   arch/riscv/mm/init.c                    | 283 +++++++++++++++----------=
-------
>   arch/riscv/mm/physaddr.c                |   2 +-
>   arch/riscv/mm/ptdump.c                  |   6 +-
>   arch/riscv/mm/tlbflush.c                |  69 ++++++--
>   37 files changed, 901 insertions(+), 360 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kfence.h
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
