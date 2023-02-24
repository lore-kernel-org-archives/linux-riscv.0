Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1726C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 18:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XfvlKBlDp/OD+jBy+jRERPI5A60d68j8nMt8ghHRbWw=; b=a1G
	vfiEAGjPkZChfgeWtrK0A8/7YxfAQaobN6tf6zRPDeUwm5zMfhO1sOh5WgquAKaOHpw4FQECx/BH0
	A4gRLLB8HgDOYXN3+PgNh8/dkSxzMbB5ok5wiwDlWzOhHowIVeK5CMA7IrXBFJDtYmhrtNq7/vJ3v
	UR6pxudGX85FM4arBxKXDZoph7OZ2iWScXu7wlnmv3tefZ/oTPQMwxumYhmEvguLGkow2/cdBMkIM
	3fvIGodEJuG8Vptypf+Pk3UhPD/Cx2YNVyARtthCrtsYUL8k7u3Fjk986SXo+JJQ796TGc7Uz75LI
	qQYjuyO5NlVJZSwXlmqzIuaRAd3g9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVcrY-003WSZ-5m; Fri, 24 Feb 2023 18:32:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVcrU-003WRk-2v
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 18:32:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id bh1so354734plb.11
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 10:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677263521;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoSQIyPvDws6wGlfdXO3bflj7W4sNaNooSBfxQXsbK4=;
        b=niWL4YTQMo0mz36uP5YXlZbDbF+z0vDdU17qyvaRqoJm2JaciBql9CbM8q/++HBWG6
         QOgxDQgB7tGqel9GuzfzfYF4N1rUSrnV0YQSq4OxegbXBm1HD3ixlZSGewuRxXX29Z9i
         X1NdwgyEVqgiJ+/BtPv4qk9xwaxLQ2KBLs3S9AuIhcJVCMfKQ3IqdHHS2Me35mBqscZt
         IpCdjGpAWBLrNm5JzphlYnCC+DUBu+UJW5ndU8nu27zA9MBdrwUrlc1N6I4Tyh3vZqtr
         jhyate6CzHkJmwsKzQfN/zgefqR/yaeWDScNVDkpXmDa+2cwWxL09m0ma8G3KWVgQ9PX
         fylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677263521;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoSQIyPvDws6wGlfdXO3bflj7W4sNaNooSBfxQXsbK4=;
        b=ZusWn5spzcq+1XavxB5UHTW7V4L81TPbGTy/zd4DjvPZyzvvyZcaDq54H2c0riiXWS
         rNB4Afh7C2lJZ1YOSVN1H4PGNkx8wBqsW2TpRG1Muog9YNzRPtETp1m5KVWkgI801MXv
         slAYYHfAk/Q+TjX5P9Q3Z+nONdaNuPp3CAQo7dNJdqA73J5rMoTNecTGNaS6XDmVo+P3
         xYL2VvmlVl61wVQ/Aocwr8+xHnOmB3tEzVm8k9SpBflzT6SuHiLJZNK0N7jIx9XOmwTq
         5hyuKBGNRR7KNT/JG4vpEEUSpzl7sNmEi8liab0QN8D9ZfAEujbWvPblQdJ/6+WyF+u3
         3RkA==
X-Gm-Message-State: AO0yUKWsZ3iFWhAUHBF569f43/RWPGBekJbeRMQdB5vpuAG9LTRHEQL/
	c3oy1Up/mWumrlhZ+EZ92cFPRYatclfAQOhk
X-Google-Smtp-Source: AK7set+hTx0p397Ze93K9awCkj2a4jBOOGgfjbrZRozthZ/JGKWNm7WQ0LTdQzOW6YhyTTEA8UUIMw==
X-Received: by 2002:a05:6a20:6a03:b0:bf:58d1:cea0 with SMTP id p3-20020a056a206a0300b000bf58d1cea0mr374616pzk.31.1677263521182;
        Fri, 24 Feb 2023 10:32:01 -0800 (PST)
Received: from localhost ([135.180.224.71])
        by smtp.gmail.com with ESMTPSA id w21-20020a639355000000b004dff15fc121sm8353297pgm.36.2023.02.24.10.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 10:32:00 -0800 (PST)
Date: Fri, 24 Feb 2023 10:32:00 -0800 (PST)
X-Google-Original-Date: Fri, 24 Feb 2023 10:28:22 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 6.3 Merge Window, Part 1
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-9df18be9-c02d-41f8-93ee-7e1e124a31ec@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_103204_355804_160C6AC5 
X-CRM114-Status: GOOD (  29.11  )
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
Content-Type: multipart/mixed; boundary="===============4601611760868582853=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4601611760868582853==
Content-Type: text/plain

The following changes since commit c1d6105869464635d8a2bcf87a43c05f4c0cfca4:

  riscv: Move call to init_cpu_topology() to later initialization stage (2023-01-25 07:20:00 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-mw1

for you to fetch changes up to eb9be8310c58c166f9fae3b71c0ad9d6741b4897:

  RISC-V: add a spin_shadow_stack declaration (2023-02-22 06:48:30 -0800)

----------------------------------------------------------------
RISC-V Patches for the 6.3 Merge Window, Part 1

There's a bunch of fixes/cleanups throughout the tree as usual, but we
also have a handful of new features.

* Various improvements to the extension detection and alternative
  patching infrastructure.
* Zbb-optimized string routines.
* Support for cpu-capacity in the RISC-V DT bindings.
* Zicbom no longer depends on toolchain support.
* Some performance and code size improvements to ftrace.
* Support for ARCH_WANT_LD_ORPHAN_WARN.
* Oops now contain the faulting instruction.

----------------------------------------------------------------
This is passing my tests, but there's already some fixes on the list so
there'll almost certainly be a part 2.  There are also some patches with
dependencies that might still be candidates for the merge window, depending on
how things go.

I have a somewhat ugly merge conflict this time between my fixes and for-next,
as there were some fixes to the extension handling code at the same time it was
being refactored.  Here's my resolution, if that helps any -- essentially we're
just moving away from the enums in hwcap so we can use these in assembly, and
have inlined the check in cpu_relax():

diff --cc arch/riscv/include/asm/hwcap.h
index 8f3994a7f0ca,64ad1937e714..000000000000
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@@ -24,36 -37,43 +24,32 @@@
  #define RISCV_ISA_EXT_u		('u' - 'a')

  /*
 - * Increse this to higher value as kernel support more ISA extensions.
 + * These macros represent the logical IDs of each multi-letter RISC-V ISA
 + * extension and are used in the ISA bitmap. The logical IDs start from
 + * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
 + * letter extensions. The maximum, RISCV_ISA_EXT_MAX, is defined in order
 + * to allocate the bitmap and may be increased when necessary.
 + *
 + * New extensions should just be added to the bottom, rather than added
 + * alphabetically, in order to avoid unnecessary shuffling.
   */
 -#define RISCV_ISA_EXT_MAX	64
 -#define RISCV_ISA_EXT_NAME_LEN_MAX 32
 +#define RISCV_ISA_EXT_BASE		26

 -/* The base ID for multi-letter ISA extensions */
 -#define RISCV_ISA_EXT_BASE 26
 +#define RISCV_ISA_EXT_SSCOFPMF		26
 +#define RISCV_ISA_EXT_SSTC		27
 +#define RISCV_ISA_EXT_SVINVAL		28
 +#define RISCV_ISA_EXT_SVPBMT		29
 +#define RISCV_ISA_EXT_ZBB		30
 +#define RISCV_ISA_EXT_ZICBOM		31
 +#define RISCV_ISA_EXT_ZIHINTPAUSE	32

 -/*
 - * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
 - * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
 - * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
 - * extensions while all the multi-letter extensions should define the next
 - * available logical extension id.
 - */
 -enum riscv_isa_ext_id {
 -	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
 -	RISCV_ISA_EXT_SVPBMT,
 -	RISCV_ISA_EXT_ZICBOM,
 -	RISCV_ISA_EXT_ZIHINTPAUSE,
 -	RISCV_ISA_EXT_SSTC,
 -	RISCV_ISA_EXT_SVINVAL,
 -	RISCV_ISA_EXT_ID_MAX
 -};
 -static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
 +#define RISCV_ISA_EXT_MAX		64
 +#define RISCV_ISA_EXT_NAME_LEN_MAX	32

 -/*
 - * This enum represents the logical ID for each RISC-V ISA extension static
 - * keys. We can use static key to optimize code path if some ISA extensions
 - * are available.
 - */
 -enum riscv_isa_ext_key {
 -	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
 -	RISCV_ISA_EXT_KEY_SVINVAL,
 -	RISCV_ISA_EXT_KEY_MAX,
 -};
 +#ifndef __ASSEMBLY__
 +
 +#include <linux/jump_label.h>

- enum {
- 	CAP_HWCAP = 1,
- };
-
  struct riscv_isa_ext_data {
  	/* Name of the extension displayed to userspace via /proc/cpuinfo */
  	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
diff --cc arch/riscv/include/asm/vdso/processor.h
index edf0e25e43d1,14f5d27783b8..000000000000
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h

----------------------------------------------------------------
Andrew Jones (4):
      riscv: module: Add ADD16 and SUB16 rela types
      riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
      RISC-V: insn-def: Add I-type insn-def
      riscv: hwcap: Don't alphabetize ISA extension IDs

Andy Chiu (2):
      riscv: ftrace: Fixup panic by disabling preemption
      riscv: jump_label: Fixup unaligned arch_static_branch function

Björn Töpel (3):
      riscv: Add instruction dump to RISC-V splats
      scripts/decodecode: Add support for RISC-V
      riscv, mm: Perform BPF exhandler fixup on page fault

Conor Dooley (12):
      RISC-V: fix incorrect type of ARCH_CANAAN_K210_DTB_SOURCE
      RISC-V: clarify ISA string ordering rules in cpu.c
      RISC-V: resort all extensions in consistent orders
      Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo
      Documentation: riscv: fix insufficient list item indent
      RISC-V: re-order Kconfig selects alphanumerically
      dt-bindings: arm: move cpu-capacity to a shared loation
      dt-bindings: riscv: add a capacity-dmips-mhz cpu property
      RISC-V: replace cbom instructions with an insn-def
      RISC-V: remove toolchain version checks for Zicbom
      RISC-V: take text_mutex during alternative patching
      RISC-V: add a spin_shadow_stack declaration

Geert Uytterhoeven (1):
      RISC-V: Kconfig: Remove trailing whitespace

Guo Ren (4):
      riscv: pgtable: Fixup comment for KERN_VIRT_SIZE
      riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
      riscv: ftrace: Reduce the detour code size to half
      riscv: mm: hugetlb: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP

Heiko Stuebner (17):
      RISC-V: fix funct4 definition for c.jalr in parse_asm.h
      RISC-V: add prefix to all constants/macros in parse_asm.h
      RISC-V: detach funct-values from their offset
      RISC-V: add ebreak instructions to definitions
      RISC-V: add auipc elements to parse_asm header
      RISC-V: Move riscv_insn_is_* macros into a common header
      RISC-V: rename parse_asm.h to insn.h
      RISC-V: kprobes: use central defined funct3 constants
      RISC-V: add U-type imm parsing to insn.h header
      RISC-V: add rd reg parsing to insn.h header
      RISC-V: add helpers for handling immediates in U-type and I-type pairs
      RISC-V: fix auipc-jalr addresses in patched alternatives
      RISC-V: Fix do_notify_resume / do_work_pending prototype
      RISC-V: add infrastructure to allow different str* implementations
      RISC-V: add zbb support to string functions
      RISC-V: move some stray __RISCV_INSN_FUNCS definitions from kprobes
      RISC-V: fix ordering of Zbb extension

Jisheng Zhang (18):
      riscv: fix jal offsets in patched alternatives
      riscv: move riscv_noncoherent_supported() out of ZICBOM probe
      riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
      riscv: hwcap: make ISA extension ids can be used in asm
      riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
      riscv: introduce riscv_has_extension_[un]likely()
      riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
      riscv: module: move find_section to module.h
      riscv: switch to relative alternative entries
      riscv: alternative: patch alternatives in the vDSO
      riscv: cpu_relax: switch to riscv_has_extension_likely()
      riscv: remove riscv_isa_ext_keys[] array and related usage
      riscv: lds: define RUNTIME_DISCARD_EXIT
      riscv: vmlinux.lds.S: explicitly catch .rela.dyn symbols
      riscv: vmlinux.lds.S: explicitly catch .riscv.attributes sections
      riscv: vmlinux.lds.S: explicitly catch .init.bss sections from EFI stub
      riscv: select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL
      riscv: alternative: proceed one more instruction for auipc/jalr pair

Liao Chang (1):
      riscv: Add header include guards to insn.h

Mattias Nissler (1):
      riscv: Avoid enabling interrupts in die()

Palmer Dabbelt (12):
      Merge tag 'soc2arch-immutable' of git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into for-next
      Merge patch series "Allow calls in alternatives"
      Merge patch "RISC-V: fix incorrect type of ARCH_CANAAN_K210_DTB_SOURCE"
      Merge patch series "Putting some basic order on isa extension lists"
      Merge patch series "Zbb string optimizations"
      Merge patch series "riscv: improve boot time isa extensions handling"
      Merge patch series "dt-bindings: Add a cpu-capacity property for RISC-V"
      Merge patch series "Remove toolchain dependencies for Zicbom"
      Merge patch series "riscv: Optimize function trace"
      RISC-V: Only provide the single-letter extensions in HWCAP
      Merge patch series "riscv: improve link and support ARCH_WANT_LD_ORPHAN_WARN"
      Merge patch series "riscv: Dump faulting instructions in oops handler"

Samuel Holland (2):
      riscv: Fix early alternative patching
      riscv: Fix Zbb alternative IDs

Sergey Matyukevich (1):
      riscv: mm: fix regression due to update_mmu_cache change

 Documentation/devicetree/bindings/arm/cpus.yaml    |   2 +-
 .../bindings/{arm => cpu}/cpu-capacity.txt         |   4 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +
 Documentation/riscv/uabi.rst                       |  42 +++
 Documentation/scheduler/sched-capacity.rst         |   2 +-
 .../zh_CN/scheduler/sched-capacity.rst             |   2 +-
 arch/riscv/Kconfig                                 |  78 +++--
 arch/riscv/Kconfig.socs                            |  40 ++-
 arch/riscv/Makefile                                |  11 +-
 arch/riscv/boot/dts/Makefile                       |   2 +-
 arch/riscv/boot/dts/canaan/Makefile                |  14 +-
 arch/riscv/boot/dts/microchip/Makefile             |   8 +-
 arch/riscv/boot/dts/sifive/Makefile                |   4 +-
 arch/riscv/boot/dts/starfive/Makefile              |   2 +-
 arch/riscv/errata/sifive/errata.c                  |   6 +-
 arch/riscv/errata/thead/errata.c                   |  17 +-
 arch/riscv/include/asm/alternative-macros.h        |  20 +-
 arch/riscv/include/asm/alternative.h               |  20 +-
 arch/riscv/include/asm/elf.h                       |  10 +-
 arch/riscv/include/asm/errata_list.h               |  12 +-
 arch/riscv/include/asm/ftrace.h                    |  50 ++-
 arch/riscv/include/asm/hwcap.h                     | 117 +++----
 arch/riscv/include/asm/insn-def.h                  |  58 ++++
 arch/riscv/include/asm/insn.h                      | 381 +++++++++++++++++++++
 arch/riscv/include/asm/jump_label.h                |   2 +
 arch/riscv/include/asm/module.h                    |  16 +
 arch/riscv/include/asm/parse_asm.h                 | 219 ------------
 arch/riscv/include/asm/pgtable.h                   |   4 +-
 arch/riscv/include/asm/signal.h                    |   2 +-
 arch/riscv/include/asm/string.h                    |  10 +
 arch/riscv/include/asm/switch_to.h                 |   3 +-
 arch/riscv/include/asm/thread_info.h               |   1 +
 arch/riscv/include/asm/vdso.h                      |   4 +
 arch/riscv/include/asm/vdso/processor.h            |   2 +-
 arch/riscv/kernel/alternative.c                    | 113 ++++++
 arch/riscv/kernel/cpu.c                            |  54 ++-
 arch/riscv/kernel/cpufeature.c                     |  85 ++---
 arch/riscv/kernel/ftrace.c                         |  65 +---
 arch/riscv/kernel/kgdb.c                           |  63 ++--
 arch/riscv/kernel/mcount-dyn.S                     |  42 +--
 arch/riscv/kernel/module.c                         |  31 +-
 arch/riscv/kernel/probes/simulate-insn.c           |  19 +-
 arch/riscv/kernel/probes/simulate-insn.h           |  29 +-
 arch/riscv/kernel/riscv_ksyms.c                    |   3 +
 arch/riscv/kernel/setup.c                          |   3 +
 arch/riscv/kernel/traps.c                          |  30 +-
 arch/riscv/kernel/vdso.c                           |   5 -
 arch/riscv/kernel/vdso/vdso.lds.S                  |   7 +
 arch/riscv/kernel/vmlinux.lds.S                    |   9 +
 arch/riscv/kvm/tlb.c                               |   3 +-
 arch/riscv/lib/Makefile                            |   3 +
 arch/riscv/lib/strcmp.S                            | 121 +++++++
 arch/riscv/lib/strlen.S                            | 133 +++++++
 arch/riscv/lib/strncmp.S                           | 139 ++++++++
 arch/riscv/mm/fault.c                              |  10 +-
 arch/riscv/purgatory/Makefile                      |  13 +
 scripts/decodecode                                 |  12 +-
 57 files changed, 1507 insertions(+), 656 deletions(-)
 rename Documentation/devicetree/bindings/{arm => cpu}/cpu-capacity.txt (98%)
 create mode 100644 arch/riscv/include/asm/insn.h
 delete mode 100644 arch/riscv/include/asm/parse_asm.h
 create mode 100644 arch/riscv/lib/strcmp.S
 create mode 100644 arch/riscv/lib/strlen.S
 create mode 100644 arch/riscv/lib/strncmp.S


--===============4601611760868582853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4601611760868582853==--
