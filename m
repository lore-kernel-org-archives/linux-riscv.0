Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47C7C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WIjLhkij6Te7mhlwhO5iMjYrqG4A8uMHC27N/vC2/cs=; b=VIOkX7697OQkXY
	sJZPOAUW00H3FDeUmbUb8AOc0Mv5Q2SmkacRLuXnGWqeKSksDMHBJ+lDPNyOPMsVumQyuC3/YQTzF
	biljqyY5iL1cvZzMBdRbbgQfxacrXlzKmy8Yhf/oT/xCV2CBHh+NgnI2KzeP1pCQdxbyuMhJW/QtB
	HBiWSGpDxELkOBh7bmbodLasUIi+H3/5FegOKRTdwatnNcpfMrYqAKBukRYzZsh/oKRdTgMaQWySE
	d504sBhimn0azB2+Tk4zfguLwwh24MrVEH5AgHH/TEKPlwpg/PmlnStBiMArWe3FwJbuMv2S2d4wu
	/B3ccByMqehzMm4I7psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruy4Q-0000000DKiH-0tam;
	Thu, 11 Apr 2024 17:18:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwvp-0000000Cvy4-3BOa;
	Thu, 11 Apr 2024 16:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E47776206D;
	Thu, 11 Apr 2024 16:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6739C113CE;
	Thu, 11 Apr 2024 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851544;
	bh=B2UPTwvZ8YRZSWkmTYRU/Sp3RonIqh19BHZ95160r7o=;
	h=From:To:Cc:Subject:Date:From;
	b=nUquO4a1/6ZTCNZbRLuv4NNQcqijBDkbIKlsZevPGl461/ZAm/d/negh5wrvgBCEY
	 R1teI17GnUQ8WHezjocLnqxNY/YMCaQzL6Atj23S2xvmsKGYIJpQN2PbQLQvmn3ZpL
	 fXgFWWrrB1dxwNQnNpbdq+kT/DxZA0kF5nLY58SYRgrOrT5+pwun09BfqFJZQ4nrSU
	 lBV8GXmV0rOpfqCddCsAahKorRytLs4uqJ0ZtXVAw0IqI62FLkfq3S8CI4TwHztRUU
	 JnFs5quLmmnkCSs0ER4U9IQFddPY6ug8EGp9CfxVibDAZWQYbaUOr4gCPUVMw+WuAe
	 c6XnkSextJR5g==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [RFC PATCH 0/7] x86/module: use large ROX pages for text allocations
Date: Thu, 11 Apr 2024 19:05:19 +0300
Message-ID: <20240411160526.2093408-1-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_090546_252285_831C3C63 
X-CRM114-Status: GOOD (  17.90  )
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

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Hi,

These patches add support for using large ROX pages for allocations of
executable memory on x86.

They address Andy's comments [1] about having executable mappings for code
that was not completely formed.

The approach taken is to allocate ROX memory along with writable but not
executable memory and use the writable copy to perform relocations and
alternatives patching. After the module text gets into its final shape, the
contents of the writable memory is copied into the actual ROX location
using text poking.

The allocations of the ROX memory use vmalloc(VMAP_ALLOW_HUGE_MAP) to
allocate PMD aligned memory, fill that memory with invalid instructions and
in the end remap it as ROX. Portions of these large pages are handed out to
execmem_alloc() callers without any changes to the permissions. When the
memory is freed with execmem_free() it is invalidated again so that it
won't contain stale instructions.

The module memory allocation, x86 code dealing with relocations and
alternatives patching takes into account the existence of the two copies,
the writable memory and the ROX memory at the actual allocated virtual
address.

This is an early RFC, it is not well tested and there is a lot of room for
improvement. For example, the locking of execmem_cache can be made more
fine grained, freeing of PMD-sized pages from execmem_cache can be
implemented with a shrinker, the large pages can be removed from the direct
map when they are added to the cache and restored there when they are free
from the cache.

Still, I'd like to hear feedback on the approach in general before moving
forward with polishing the details.

The series applies on top of v4 of "jit/text allocator" [2] and also
available at git:

https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=execmem/v4%2bx86-rox

[1] https://lore.kernel.org/all/a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com
[2] https://lore.kernel.org/linux-mm/20240411160051.2093261-1-rppt@kernel.org 

Mike Rapoport (IBM) (6):
  asm-generic: introduce text-patching.h
  mm: vmalloc: don't account for number of nodes for HUGE_VMAP allocations
  module: prepare to handle ROX allocations for text
  x86/module: perpare module loading for ROX allocations of text
  execmem: add support for cache of large ROX pages
  x86/module: enable ROX caches for module text

Song Liu (1):
  ftrace: Add swap_func to ftrace_process_locs()

 arch/alpha/include/asm/Kbuild                 |   1 +
 arch/arc/include/asm/Kbuild                   |   1 +
 .../include/asm/{patch.h => text-patching.h}  |   0
 arch/arm/kernel/ftrace.c                      |   2 +-
 arch/arm/kernel/jump_label.c                  |   2 +-
 arch/arm/kernel/kgdb.c                        |   2 +-
 arch/arm/kernel/patch.c                       |   2 +-
 arch/arm/probes/kprobes/core.c                |   2 +-
 arch/arm/probes/kprobes/opt-arm.c             |   2 +-
 .../asm/{patching.h => text-patching.h}       |   0
 arch/arm64/kernel/ftrace.c                    |   2 +-
 arch/arm64/kernel/jump_label.c                |   2 +-
 arch/arm64/kernel/kgdb.c                      |   2 +-
 arch/arm64/kernel/patching.c                  |   2 +-
 arch/arm64/kernel/probes/kprobes.c            |   2 +-
 arch/arm64/kernel/traps.c                     |   2 +-
 arch/arm64/net/bpf_jit_comp.c                 |   2 +-
 arch/csky/include/asm/Kbuild                  |   1 +
 arch/hexagon/include/asm/Kbuild               |   1 +
 arch/loongarch/include/asm/Kbuild             |   1 +
 arch/m68k/include/asm/Kbuild                  |   1 +
 arch/microblaze/include/asm/Kbuild            |   1 +
 arch/mips/include/asm/Kbuild                  |   1 +
 arch/nios2/include/asm/Kbuild                 |   1 +
 arch/openrisc/include/asm/Kbuild              |   1 +
 .../include/asm/{patch.h => text-patching.h}  |   0
 arch/parisc/kernel/ftrace.c                   |   2 +-
 arch/parisc/kernel/jump_label.c               |   2 +-
 arch/parisc/kernel/kgdb.c                     |   2 +-
 arch/parisc/kernel/kprobes.c                  |   2 +-
 arch/parisc/kernel/patch.c                    |   2 +-
 arch/powerpc/include/asm/kprobes.h            |   2 +-
 .../asm/{code-patching.h => text-patching.h}  |   0
 arch/powerpc/kernel/crash_dump.c              |   2 +-
 arch/powerpc/kernel/epapr_paravirt.c          |   2 +-
 arch/powerpc/kernel/jump_label.c              |   2 +-
 arch/powerpc/kernel/kgdb.c                    |   2 +-
 arch/powerpc/kernel/kprobes.c                 |   2 +-
 arch/powerpc/kernel/module_32.c               |   2 +-
 arch/powerpc/kernel/module_64.c               |   2 +-
 arch/powerpc/kernel/optprobes.c               |   2 +-
 arch/powerpc/kernel/process.c                 |   2 +-
 arch/powerpc/kernel/security.c                |   2 +-
 arch/powerpc/kernel/setup_32.c                |   2 +-
 arch/powerpc/kernel/setup_64.c                |   2 +-
 arch/powerpc/kernel/static_call.c             |   2 +-
 arch/powerpc/kernel/trace/ftrace.c            |   2 +-
 arch/powerpc/kernel/trace/ftrace_64_pg.c      |   2 +-
 arch/powerpc/lib/code-patching.c              |   2 +-
 arch/powerpc/lib/feature-fixups.c             |   2 +-
 arch/powerpc/lib/test-code-patching.c         |   2 +-
 arch/powerpc/lib/test_emulate_step.c          |   2 +-
 arch/powerpc/mm/book3s32/mmu.c                |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |   2 +-
 arch/powerpc/mm/book3s64/slb.c                |   2 +-
 arch/powerpc/mm/kasan/init_32.c               |   2 +-
 arch/powerpc/mm/mem.c                         |   2 +-
 arch/powerpc/mm/nohash/44x.c                  |   2 +-
 arch/powerpc/mm/nohash/book3e_pgtable.c       |   2 +-
 arch/powerpc/mm/nohash/tlb.c                  |   2 +-
 arch/powerpc/net/bpf_jit_comp.c               |   2 +-
 arch/powerpc/perf/8xx-pmu.c                   |   2 +-
 arch/powerpc/perf/core-book3s.c               |   2 +-
 arch/powerpc/platforms/85xx/smp.c             |   2 +-
 arch/powerpc/platforms/86xx/mpc86xx_smp.c     |   2 +-
 arch/powerpc/platforms/cell/smp.c             |   2 +-
 arch/powerpc/platforms/powermac/smp.c         |   2 +-
 arch/powerpc/platforms/powernv/idle.c         |   2 +-
 arch/powerpc/platforms/powernv/smp.c          |   2 +-
 arch/powerpc/platforms/pseries/smp.c          |   2 +-
 arch/powerpc/xmon/xmon.c                      |   2 +-
 arch/riscv/errata/andes/errata.c              |   2 +-
 arch/riscv/errata/sifive/errata.c             |   2 +-
 arch/riscv/errata/thead/errata.c              |   2 +-
 .../include/asm/{patch.h => text-patching.h}  |   0
 arch/riscv/include/asm/uprobes.h              |   2 +-
 arch/riscv/kernel/alternative.c               |   2 +-
 arch/riscv/kernel/cpufeature.c                |   3 +-
 arch/riscv/kernel/ftrace.c                    |   2 +-
 arch/riscv/kernel/jump_label.c                |   2 +-
 arch/riscv/kernel/patch.c                     |   2 +-
 arch/riscv/kernel/probes/kprobes.c            |   2 +-
 arch/riscv/net/bpf_jit_comp64.c               |   2 +-
 arch/riscv/net/bpf_jit_core.c                 |   2 +-
 arch/sh/include/asm/Kbuild                    |   1 +
 arch/sparc/include/asm/Kbuild                 |   1 +
 arch/um/kernel/um_arch.c                      |  16 +-
 arch/x86/entry/vdso/vma.c                     |   3 +-
 arch/x86/include/asm/alternative.h            |  14 +-
 arch/x86/include/asm/text-patching.h          |   1 +
 arch/x86/kernel/alternative.c                 | 152 ++++++----
 arch/x86/kernel/ftrace.c                      |  41 ++-
 arch/x86/kernel/module.c                      |  17 +-
 arch/x86/mm/init.c                            |  29 +-
 arch/xtensa/include/asm/Kbuild                |   1 +
 include/asm-generic/text-patching.h           |   5 +
 include/linux/execmem.h                       |  25 ++
 include/linux/ftrace.h                        |   2 +
 include/linux/module.h                        |  11 +
 include/linux/text-patching.h                 |  15 +
 kernel/module/main.c                          |  70 ++++-
 kernel/module/strict_rwx.c                    |   3 +
 kernel/trace/ftrace.c                         |  13 +-
 mm/execmem.c                                  | 278 +++++++++++++++++-
 mm/vmalloc.c                                  |   9 +-
 105 files changed, 663 insertions(+), 193 deletions(-)
 rename arch/arm/include/asm/{patch.h => text-patching.h} (100%)
 rename arch/arm64/include/asm/{patching.h => text-patching.h} (100%)
 rename arch/parisc/include/asm/{patch.h => text-patching.h} (100%)
 rename arch/powerpc/include/asm/{code-patching.h => text-patching.h} (100%)
 rename arch/riscv/include/asm/{patch.h => text-patching.h} (100%)
 create mode 100644 include/asm-generic/text-patching.h
 create mode 100644 include/linux/text-patching.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
