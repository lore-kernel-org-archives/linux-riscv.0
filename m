Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A4CCF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGtYMOZe7GQ3kIcc5DF82FjgphL6hYGtd35HKQ1VKRU=; b=enHqDck/iDx5kg
	AiXGIcKPVFUtVF3nDGyKLpqLa8danBIDlZk8i/O39TRgUxRuipysEsG2PkjXjCqHhhkPh2UHKou43
	fWGK4sXOYHE0WfYVueigIU7E8P2+F3PBQhWPxowbJIMN7aYaWWXuFwqSWnzy7O59dtUnIqilUsls8
	1DShxO7zUl7WInN88vTl+e5x0ewqduzMOeE30ZvDswdDe8iVYRepeYLMBbuWGW3T4uhqiBHCOeHlk
	O5OtxMergfXDphefVpe+XufNLl6UqqdlVuWD0s4hseY2JqNTNV/spGGajMagJGN91dUz4npJnJu+a
	nbdcZ/apJ4GJtjEn89dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st7F9-00000002daR-2cUv;
	Tue, 24 Sep 2024 15:14:23 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st7F6-00000002dZw-1fHe
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 15:14:22 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-205909afad3so64610975ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Sep 2024 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727190858; x=1727795658; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4l+X1VCUBncHtX8uzN7Cxn1jx5yxi3wDCVKx4RZGZw=;
        b=zIkjlTJU5BOM0NPWZCVx+tDEJgd7ahQe18gUvh9FquT79DVyPEYwxnD65AnD5eXnSN
         ZHis3ib2I0G0xxNYFBlDyOxBJKY9ilPMlaiDuJiGNo7iwWyQw+pabe5XFSM0Xz3eS/Fh
         HICdXIMxeDnk6TOhR3/sM8LxJvU3hnBIy3LDMg7lq+YbGOjDmLnGXXL8/I6UTlH9jtRL
         0daZkO5OncJcJn47GHwuoegD+zZgV2+V/bRqWltlz6F0PJXnlQd24XfB4bStglAQs/lJ
         y/1LKuPo4N6DKYdUje93FrXITWQ5Fy69kAGviatIMJko+WctzS3lxtLPsLDRtC5u646m
         tmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190858; x=1727795658;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4l+X1VCUBncHtX8uzN7Cxn1jx5yxi3wDCVKx4RZGZw=;
        b=gAwefoN41xeiA7oIN8TGGT+jfmJg/9FdYIEf8pj/A03Cs4Fax/fOUp1WuNLCoDrdUy
         IUR4Xf5Ou4n7QPAskKWi0/bOzHq42Ev463dfGFMvnFUnugoNMjAvtwi02yGb9fxpMTVF
         4O3xdNClSjz/zkLVWraGG+8YuZe4DgNKuOHUMtjqMVdkrJOEmOmYmjFERQssKS/nemf5
         M8WDfe/ad5ja7Vll+bRyje8vbEW+Wc+/nh1G6A/TV41BwbQZY7shSbmrXrAZhtPODS3f
         BxPaga2BCJAFbrlNs1L8A0GuvHwHx4xtxlxs243aEa3euuuvFTwqN/ahFouvJG5SGtLs
         ptzQ==
X-Gm-Message-State: AOJu0YwFm3YWF7qXcE3ZWz97l+GIIIczFocXg3IH1XODHmtAR5uQ6Nt4
	UzmqnodEsc4lKshbwIwbWxI2Z5opyA/tEX1sjDp/3jgNnxmEbv9ltxpHI35z89pgMxjXQfSlwpz
	EYQE=
X-Google-Smtp-Source: AGHT+IE/WYEdpLh4pu0dqCMPDAARpCPpEI0SeDzovukW3ugTzPsoCmkwVyRLyiS/gYPbFyWh4httig==
X-Received: by 2002:a17:902:d491:b0:205:5d12:3f24 with SMTP id d9443c01a7336-208d837546emr227270775ad.20.1727190858269;
        Tue, 24 Sep 2024 08:14:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:de5:d200:87a:d84a:dff5:3827])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1724ca5sm11453005ad.97.2024.09.24.08.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 08:14:17 -0700 (PDT)
Date: Tue, 24 Sep 2024 08:14:17 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Sep 2024 08:14:04 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.12 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-664fc7b8-c82b-414e-9c10-8fe7840f2c76@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_081420_736194_0DE460F7 
X-CRM114-Status: GOOD (  22.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 57d76bc51fd80824bcc0c84a5b5ec944f1b51edd:

  riscv: change XIP's kernel_map.size to be size of the entire kernel (2024-08-14 13:12:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.12-mw1

for you to fetch changes up to b3f835cd7339919561866252a11831ead72e7073:

  crash: Fix riscv64 crash memory reserve dead loop (2024-09-20 05:58:12 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.12 Merge Window, Part 1

* Support for using Zkr to seed KASLR.
* Support for IPI-triggered CPU backtracing.
* Support for generic CPU vulnerabilities reporting to userspace.
* A few cleanups for missing licenses.
* The size limit on the XIP kernel has been removed.
* Support for tracing userspace stacks.
* Support for the Svvptc extension.
* Various cleanups and fixes throughout the tree.

----------------------------------------------------------------
This is a bit small, but I'm not planning on taking anything else for this
merge window -- we had a few breakages over the last release so having a small
release probably isn't all that bad, and with all the conferences it's just a
bad time to be trying to stuff things in late (though I tell myself that every
cycle).

There are two conflicts here.  The IRQ one seems pretty straight-forward, just
two features colliding.  The testing one is a bit clunky, as I suppose I
probably just shouldn't have picked up the 32-bit fix in the first place given
it just conflicted and resulted in the same code.  Anyway, here's my conflict
results:

diff --cc arch/riscv/include/asm/irq.h
index 8330d16b05b5,7e9a84a005ed..000000000000
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@@ -12,11 -12,8 +12,13 @@@

  #include <asm-generic/irq.h>

+ #define INVALID_CONTEXT UINT_MAX
+
 +#ifdef CONFIG_SMP
 +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu);
 +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 +#endif
 +
  void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));

  struct fwnode_handle *riscv_get_intc_hwnode(void);
diff --cc tools/testing/selftests/riscv/mm/mmap_test.h
index 1c3313c201d5,75918d15919f..000000000000
--- a/tools/testing/selftests/riscv/mm/mmap_test.h
+++ b/tools/testing/selftests/riscv/mm/mmap_test.h


----------------------------------------------------------------
Alexandre Ghiti (4):
      riscv: Add ISA extension parsing for Svvptc
      dt-bindings: riscv: Add Svvptc ISA extension description
      riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
      riscv: Stop emitting preventive sfence.vma for new userspace mappings with Svvptc

Changbin Du (1):
      riscv: vdso: do not strip debugging info for vdso.so.dbg

Charlie Jenkins (6):
      riscv: Add license to fence.h
      riscv: Add license to vmalloc.h
      riscv: Make riscv_isa_vendor_ext_andes array static
      selftests: riscv: Allow mmap test to compile on 32-bit
      tools: Add riscv barrier implementation
      tools: Optimize ring buffer for riscv

Geert Uytterhoeven (1):
      riscv: defconfig: Disable RZ/Five peripheral support

Haibo Xu (1):
      ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE

Hanjun Guo (1):
      ACPI: RISCV: Make acpi_numa_get_nid() to be static

Jesse Taube (4):
      RISC-V: pi: Force hidden visibility for all symbol references
      RISC-V: lib: Add pi aliases for string functions
      RISC-V: pi: Add kernel/pi/pi.h
      RISC-V: Use Zkr to seed KASLR base address

Jinjie Ruan (7):
      riscv: Enable generic CPU vulnerabilites support
      riscv: Fix fp alignment bug in perf_callchain_user()
      riscv: stacktrace: Add USER_STACKTRACE support
      riscv: Remove unused _TIF_WORK_MASK
      RISC-V: Implement kgdb_roundup_cpus() to enable future NMI Roundup
      riscv: Use LIST_HEAD() to simplify code
      crash: Fix riscv64 crash memory reserve dead loop

Jisheng Zhang (4):
      riscv: errata: sifive: Use SYM_*() assembly macros
      riscv: select ARCH_USE_SYM_ANNOTATIONS
      riscv: define ILLEGAL_POINTER_VALUE for 64bit
      riscv: avoid Imbalance in RAS

Mayuresh Chitale (1):
      perf/riscv-sbi: Add platform specific firmware event handling

Nam Cao (8):
      riscv: cleanup XIP_FIXUP macro
      riscv: don't export va_kernel_pa_offset in vmcoreinfo for XIP kernel
      riscv: replace misleading va_kernel_pa_offset on XIP kernel
      riscv: drop the use of XIP_OFFSET in XIP_FIXUP_OFFSET
      riscv: drop the use of XIP_OFFSET in XIP_FIXUP_FLASH_OFFSET
      riscv: drop the use of XIP_OFFSET in kernel_mapping_va_to_pa()
      riscv: drop the use of XIP_OFFSET in create_kernel_page_table()
      riscv: remove limit on the size of read-only section for XIP kernel

Palmer Dabbelt (8):
      Merge patch series "RISC-V: Parse DT for Zkr to seed KASLR"
      Merge patch series "remove size limit on XIP kernel"
      Merge patch series "riscv: stacktrace: Add USER_STACKTRACE support"
      Merge patch series "riscv: select ARCH_USE_SYM_ANNOTATIONS"
      Merge patch series "Svvptc extension to remove preventive sfence.vma"
      Merge patch series "riscv: Improve KASAN coverage to fix unit tests"
      RISC-V: Don't have MAX_PHYSMEM_BITS exceed phys_addr_t
      Merge patch series "tools: Add barrier implementations for riscv"

Ryo Takakura (1):
      RISC-V: Enable IPI CPU Backtrace

Samuel Holland (2):
      riscv: Omit optimized string routines when using KASAN
      riscv: Enable bitops instrumentation

Steffen Persvold (1):
      riscv: cacheinfo: Add back init_cache_level() function

Stuart Menefy (1):
      riscv: Remove redundant restriction on memory size

Xiao Wang (1):
      drivers/perf: riscv: Remove redundant macro check

Ying Sun (1):
      riscv/kexec_file: Fix relocation type R_RISCV_ADD16 and R_RISCV_SUB16 unknown

Yunhui Cui (1):
      riscv: Randomize lower bits of stack address

 .../devicetree/bindings/riscv/extensions.yaml      |   7 +
 arch/riscv/Kconfig                                 |   8 +
 arch/riscv/configs/defconfig                       |  12 +-
 arch/riscv/errata/sifive/errata_cip_453.S          |   8 +-
 arch/riscv/include/asm/acpi.h                      |   2 -
 arch/riscv/include/asm/bitops.h                    |  43 +++---
 arch/riscv/include/asm/cacheflush.h                |  18 ++-
 arch/riscv/include/asm/exec.h                      |   8 +
 arch/riscv/include/asm/fence.h                     |   1 +
 arch/riscv/include/asm/hwcap.h                     |   1 +
 arch/riscv/include/asm/irq.h                       |   5 +
 arch/riscv/include/asm/page.h                      |  29 +++-
 arch/riscv/include/asm/pgtable.h                   |  28 ++--
 arch/riscv/include/asm/sbi.h                       |   1 +
 arch/riscv/include/asm/set_memory.h                |   2 +-
 arch/riscv/include/asm/sparsemem.h                 |   2 +-
 arch/riscv/include/asm/string.h                    |   2 +
 arch/riscv/include/asm/thread_info.h               |  11 +-
 arch/riscv/include/asm/vmalloc.h                   |   1 +
 arch/riscv/include/asm/xip_fixup.h                 |  30 +++-
 arch/riscv/kernel/acpi_numa.c                      |   4 +-
 arch/riscv/kernel/asm-offsets.c                    |   7 +
 arch/riscv/kernel/cacheinfo.c                      |   5 +
 arch/riscv/kernel/cpufeature.c                     |   1 +
 arch/riscv/kernel/elf_kexec.c                      |   6 +
 arch/riscv/kernel/entry.S                          |  91 ++++++++++-
 arch/riscv/kernel/module.c                         |   4 +-
 arch/riscv/kernel/perf_callchain.c                 |  46 +-----
 arch/riscv/kernel/pi/Makefile                      |   4 +-
 arch/riscv/kernel/pi/archrandom_early.c            |  30 ++++
 arch/riscv/kernel/pi/cmdline_early.c               |  10 +-
 arch/riscv/kernel/pi/fdt_early.c                   | 167 ++++++++++++++++++++-
 arch/riscv/kernel/pi/pi.h                          |  20 +++
 arch/riscv/kernel/process.c                        |   9 ++
 arch/riscv/kernel/riscv_ksyms.c                    |   3 -
 arch/riscv/kernel/smp.c                            |  43 +++++-
 arch/riscv/kernel/stacktrace.c                     |  43 ++++++
 arch/riscv/kernel/vdso/Makefile                    |   2 +-
 arch/riscv/kernel/vendor_extensions/andes.c        |   2 +-
 arch/riscv/kernel/vmcore_info.c                    |   7 +
 arch/riscv/kernel/vmlinux-xip.lds.S                |   5 +-
 arch/riscv/lib/Makefile                            |   2 +
 arch/riscv/lib/memset.S                            |   2 +
 arch/riscv/lib/strcmp.S                            |   2 +
 arch/riscv/lib/strlen.S                            |   1 +
 arch/riscv/lib/strncmp.S                           |   2 +
 arch/riscv/mm/init.c                               |  28 ++--
 arch/riscv/mm/pgtable.c                            |  13 ++
 arch/riscv/purgatory/Makefile                      |   2 +
 drivers/perf/riscv_pmu.c                           |   2 -
 drivers/perf/riscv_pmu_sbi.c                       |  31 ++--
 kernel/crash_reserve.c                             |   3 +-
 tools/arch/riscv/include/asm/barrier.h             |  39 +++++
 tools/arch/riscv/include/asm/fence.h               |  13 ++
 tools/include/asm/barrier.h                        |   2 +
 tools/include/linux/ring_buffer.h                  |   2 +-
 tools/testing/selftests/riscv/mm/mmap_test.h       |   6 +-
 57 files changed, 707 insertions(+), 171 deletions(-)
 create mode 100644 arch/riscv/include/asm/exec.h
 create mode 100644 arch/riscv/kernel/pi/archrandom_early.c
 create mode 100644 arch/riscv/kernel/pi/pi.h
 create mode 100644 tools/arch/riscv/include/asm/barrier.h
 create mode 100644 tools/arch/riscv/include/asm/fence.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
