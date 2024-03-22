Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA513C54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=TalF+zeceSa2t+eIt7ZWTZvfnDQlEcyPxAYdi2/ok5s=; b=u0B
	jXvBIY79zQ0PxJc9K5XS+0tUYEurJowSPg1buXUy84LShdIzQjtezFB2G8p6pQwccxJlW/uX2fOsu
	j7AtTGB/zqKI3XidNQcC0zPymSbrD6s66kRAn1QsHtRM3n9Vo0JdpKuq9UdXknO9U69T5YoXVQE+g
	bBZbRQ0Lqpjrs1meAEOhimLrBgoXtg4FFAsejsgu990KVac5IpW6pWSMFRlKsZxeP/uKF3NbS+QeJ
	K/tdRHB4+ISDSPbFnEBmqIeJRncYPULYrDE6KgqWunPmJbwl3hOtSV7MfrEwNB+ntggdK//JK1rNU
	dzhRePb/i1b1f5Ocr/OiVsDX4Poteeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnfti-00000007Xte-1huj;
	Fri, 22 Mar 2024 14:29:30 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnftf-00000007XsH-1P3J
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 14:29:28 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6e69543fc1eso1262807a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711117763; x=1711722563; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnpO+KHEiunJGmHhYTcLGtaH8aNQ7gaiB/0bX9RSjY0=;
        b=i8myKz0msX5+kHpPWGT17aQick3Da7+BlW06Bu8jZbDBE5EK5Lk0Llde8IPcfne5xR
         WBUMTrmiqyl8L8z28S+NMedOc/Zn5nnE02RQy06DlojSYNQv76mRMl+St0/Byy9KavP7
         RGz06plLGuEpj3IsbaU4zZ4lueMJy0lJK4sxP76zrued+K5IXCm/1puRQSr+93dHeZhB
         Hg6nqmbNSyOlFV8QHnR/50Zi6/GZhey6IDFDRgESZ7GKQFT/jC6DCyifPm30NRpDpkFX
         aHFuJHp9U8JsNCQPDaIeIrx3XJHDm52XYbHo7EVLzJj+QQhqZYp5Pop8TeKe8nLZ0jqO
         Ekqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711117763; x=1711722563;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnpO+KHEiunJGmHhYTcLGtaH8aNQ7gaiB/0bX9RSjY0=;
        b=pJmn1Xy1bUpfbpmdOYDfnbi0nbOR8abdrhxkoqV5gJNIcYYfCcfNgP1VP5s8i1PGh6
         tAN09MlbIT5iURresxrya+ElUXfRfjCoJE3KqI30SmdlHHAvQYI5SxDPjTwowkPjPy3D
         jP/35gVDT8NmIPygDcD2km3KowsokLJpDvU5JZS828y6g55/1mO72GEs0H1pICebi9JP
         GtfKiPvkFB+2skW/QKdGvRrPttxfqGOmI0LhVPnXGZJOkO7+C8FThd+oZuN3hQx+tBs5
         T8f+hxUh31pqkG40WBimjXf8nN+hJrUj1lnhKriiXPxkkN3Ao1N6HWPRDUa1/Ko+XrgT
         082w==
X-Gm-Message-State: AOJu0YxRvL8WEDeMQJS8GWBU72U0lJaSioBYbU1tRO7SCe/+j460NPqy
	kQBQE8FYkZe1XiFMNxAWSzfRDw8+7bn1B+xUgwj7rXjdp/vFpWUVSyebMpf0oTcLE6RMLbZzVHm
	7
X-Google-Smtp-Source: AGHT+IEjOQMnev0bkZ4FwCgpLPZGWjQERaQ0celRnABbJ/VBtvpcE70ZC05wWYcch8unleNLo/Qv/g==
X-Received: by 2002:a05:6a20:4c91:b0:1a3:6c63:8f9e with SMTP id fq17-20020a056a204c9100b001a36c638f9emr2258716pzb.27.1711117327738;
        Fri, 22 Mar 2024 07:22:07 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id n4-20020a62e504000000b006e64a9104fdsm1692757pff.114.2024.03.22.07.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 07:22:06 -0700 (PDT)
Date: Fri, 22 Mar 2024 07:22:06 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Mar 2024 07:19:53 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.9 Merge Window
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-105d6a21-7483-4a20-a9e7-8e72770737d8@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_072927_425702_6DBA42B7 
X-CRM114-Status: GOOD (  22.12  )
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
Content-Type: multipart/mixed; boundary="===============5216365543139877009=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5216365543139877009==
Content-Type: text/plain

The following changes since commit e0fe5ab4192c171c111976dbe90bbd37d3976be0:

  riscv: Fix pte_leaf_size() for NAPOT (2024-02-29 10:21:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-mw2

for you to fetch changes up to a9ad73295cc1e3af0253eee7d08943b2419444c4:

  riscv: Fix syscall wrapper for >word-size arguments (2024-03-20 11:37:51 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.9 Merge Window

* Support for various vector-accelerated crypto routines.
* Hibernation is now enabled for portable kernel builds.
* mmap_rnd_bits_max is larger on systems with larger VAs.
* Support for fast GUP.
* Support for membarrier-based instruction cache synchronization.
* Support for the Andes hart-level interrupt controller and PMU.
* Some cleanups around unaligned access speed probing and Kconfig
  settings.
* Support for ACPI LPI and CPPC.
* Various cleanus related to barriers.
* A handful of fixes.

----------------------------------------------------------------
Sorry this is so late, but we had a bit of churn this merge window that
resulted in a handful of build failures in master and I wanted to get
everything cleaned up before adding to the potential chaos (hence the -mw2 in
the tag, I never sent the -mw1 because stuff was a bit too broken).  The fixes
have all landed upstream and everyone I know about who's running builders are
reporting this clean, so I think these should be pretty safe.

I don't have anything else planned for this merge window, unless something goes
off the rails again and there's a last-minute fix for a catastrophic issue.
We've already got a few fixes smaller starting to come in, but that's all just
regular -fixes type stuff so it'll be next week's material.

I have a pair of merge conflicts for this one.  The Kconfig one is pretty
trivial.  The bitops one comes from a tree-wide refactoring that happened to
conflict with some cleanups, it's a little hairy looking because of the inline
ASM but I think actually pretty simple.  Here's my resolutions, in case that
helps any:

diff --cc arch/riscv/include/asm/bitops.h
index 329d8244a9b3,c4c2173dfe99..000000000000
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@@ -37,10 -47,8 +47,8 @@@

  static __always_inline unsigned long variable__ffs(unsigned long word)
  {
- 	int num;
-
 -	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 -				      RISCV_ISA_EXT_ZBB, 1)
 +	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
- 				      RISCV_ISA_EXT_ZBB, 1)
++			     RISCV_ISA_EXT_ZBB, 1)
  			  : : : : legacy);

  	asm volatile (".option push\n"
@@@ -93,10 -76,8 +76,8 @@@ legacy

  static __always_inline unsigned long variable__fls(unsigned long word)
  {
- 	int num;
-
 -	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 -				      RISCV_ISA_EXT_ZBB, 1)
 +	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
- 				      RISCV_ISA_EXT_ZBB, 1)
++			     RISCV_ISA_EXT_ZBB, 1)
  			  : : : : legacy);

  	asm volatile (".option push\n"
@@@ -149,15 -105,13 +105,16 @@@ legacy

  static __always_inline int variable_ffs(int x)
  {
- 	int r;
-
 -	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 -				      RISCV_ISA_EXT_ZBB, 1)
 +	if (!x)
 +		return 0;
 +
 +	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
- 				      RISCV_ISA_EXT_ZBB, 1)
++			     RISCV_ISA_EXT_ZBB, 1)
  			  : : : : legacy);

+ 	if (!x)
+ 		return 0;
+
  	asm volatile (".option push\n"
  		      ".option arch,+zbb\n"
  		      CTZW "%0, %1\n"
@@@ -204,15 -137,13 +140,16 @@@ legacy

  static __always_inline int variable_fls(unsigned int x)
  {
- 	int r;
-
 -	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 -				      RISCV_ISA_EXT_ZBB, 1)
 +	if (!x)
 +		return 0;
 +
 +	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
- 				      RISCV_ISA_EXT_ZBB, 1)
++			     RISCV_ISA_EXT_ZBB, 1)
  			  : : : : legacy);

+ 	if (!x)
+ 		return 0;
+
  	asm volatile (".option push\n"
  		      ".option arch,+zbb\n"
  		      CLZW "%0, %1\n"
diff --cc drivers/perf/Kconfig
index 54ff5cc17ccd,564e813d8c69..000000000000
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@@ -86,16 -86,20 +86,30 @@@ config RISCV_PMU_SB
  	  full perf feature support i.e. counter overflow, privilege mode
  	  filtering, counter configuration.

+ config ANDES_CUSTOM_PMU
+ 	bool "Andes custom PMU support"
+ 	depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
+ 	default y
+ 	help
+ 	  The Andes cores implement the PMU overflow extension very
+ 	  similar to the standard Sscofpmf and Smcntrpmf extension.
+
+ 	  This will patch the overflow and pending CSRs and handle the
+ 	  non-standard behaviour via the regular SBI PMU driver and
+ 	  interface.
+
+ 	  If you don't know what to do here, say "Y".
+
 +config STARFIVE_STARLINK_PMU
 +	depends on ARCH_STARFIVE || COMPILE_TEST
 +	depends on 64BIT
 +	bool "StarFive StarLink PMU"
 +	help
 +	   Provide support for StarLink Performance Monitor Unit.
 +	   StarLink Performance Monitor Unit integrates one or more cores with
 +	   an L3 memory system. The L3 cache events are added into perf event
 +	   subsystem, allowing monitoring of various L3 cache perf events.
 +
  config ARM_PMU_ACPI
  	depends on ARM_PMU && ACPI
  	def_bool y


----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Fix compilation error with FAST_GUP and rv32
      riscv: Only flush the mm icache when setting an exec pte

Andrea Parri (4):
      membarrier: riscv: Add full memory barrier in switch_mm()
      membarrier: Create Documentation/scheduler/membarrier.rst
      locking: Introduce prepare_sync_core_cmd()
      membarrier: riscv: Provide core serializing command

Charlie Jenkins (7):
      riscv: lib: Introduce has_fast_unaligned_access()
      riscv: Only check online cpus for emulated accesses
      riscv: Decouple emulated unaligned accesses from access speed
      riscv: Set unaligned access speed at compile time
      riscv: mm: Use hint address in mmap if available
      selftests: riscv: Generalize mm selftests
      docs: riscv: Define behavior of mmap

Clément Léger (1):
      riscv: blacklist assembly symbols for kprobe

Conor Dooley (1):
      Revert "RISC-V: mark hibernation as nonportable"

Drew Fustini (1):
      riscv: defconfig: Enable mmc and dma drivers for T-Head TH1520

Eric Biggers (4):
      RISC-V: add TOOLCHAIN_HAS_VECTOR_CRYPTO
      RISC-V: fix check for zvkb with tip-of-tree clang
      crypto: riscv - parallelize AES-CBC decryption
      crypto: riscv - add vector crypto accelerated AES-CBC-CTS

Eric Chan (4):
      riscv/barrier: Define __{mb,rmb,wmb}
      riscv/barrier: Define RISCV_FULL_BARRIER
      riscv/barrier: Consolidate fence definitions
      riscv/barrier: Add missing space after ','

Erick Archer (1):
      riscv: Use kcalloc() instead of kzalloc()

Heiko Stuebner (2):
      RISC-V: add helper function to read the vector VLEN
      RISC-V: hook new crypto subdir into build-system

Jerry Shih (7):
      crypto: riscv - add vector crypto accelerated AES-{ECB,CBC,CTR,XTS}
      crypto: riscv - add vector crypto accelerated ChaCha20
      crypto: riscv - add vector crypto accelerated GHASH
      crypto: riscv - add vector crypto accelerated SHA-{256,224}
      crypto: riscv - add vector crypto accelerated SHA-{512,384}
      crypto: riscv - add vector crypto accelerated SM3
      crypto: riscv - add vector crypto accelerated SM4

Jisheng Zhang (3):
      riscv: tlb: convert __p*d_free_tlb() to inline functions
      riscv: enable MMU_GATHER_RCU_TABLE_FREE for SMP && MMU
      riscv: enable HAVE_FAST_GUP if MMU

Leonardo Bras (5):
      riscv: Improve arch_get_mmap_end() macro
      riscv: Replace direct thread flag check with is_compat_task()
      riscv: add compile-time test into is_compat_task()
      riscv: Introduce is_compat_thread() into compat.h
      riscv: Introduce set_compat_task() in asm/compat.h

Locus Wei-Han Chen (1):
      riscv: andes: Support specifying symbolic firmware and hardware raw events

Masahiro Yamada (1):
      riscv: remove unneeded #include <asm-generic/export.h>

Palmer Dabbelt (17):
      Merge patch series "RISC-V crypto with reworked asm files"
      Merge patch series "riscv: Increase mmap_rnd_bits_max on Sv48/57"
      Merge patch series "riscv: support fast gup"
      Merge patch series "membarrier: riscv: Core serializing command"
      Merge commit '3aff0c459e77' into for-next
      Merge tag 'irq-for-riscv-02-23-24' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip into for-next
      Merge patch series "Support Andes PMU extension"
      Merge patch series "riscv: Use Kconfig to set unaligned access speed"
      Merge patch "riscv: Fix compilation error with FAST_GUP and rv32"
      Merge patch series "Support Andes PMU extension"
      Merge patch series "riscv: Use Kconfig to set unaligned access speed"
      Merge patch series "riscv: mm: Extend mappable memory up to hint address"
      Merge patch series "riscv: Introduce compat-mode helpers & improve arch_get_mmap_end()"
      Merge patch series "RISC-V: ACPI: Add LPI support"
      Merge patch series "RISC-V: ACPI: Enable CPPC based cpufreq support"
      Merge patch series "riscv/barrier: tidying up barrier-related macro"
      Merge patch series "riscv: mm: Extend mappable memory up to hint address"

Sami Tolvanen (3):
      mm: Change mmap_rnd_bits_max to __ro_after_init
      riscv: mm: Update mmap_rnd_bits_max
      riscv: Fix syscall wrapper for >word-size arguments

Song Shuai (2):
      riscv: Support RANDOMIZE_KSTACK_OFFSET
      riscv: vector: Fix a typo of preempt_v

Sunil V L (6):
      cpuidle: RISC-V: Move few functions to arch/riscv
      ACPI: RISC-V: Add LPI driver
      ACPI: Enable ACPI_PROCESSOR for RISC-V
      ACPI: RISC-V: Add CPPC driver
      cpufreq: Move CPPC configs to common Kconfig and add RISC-V
      RISC-V: defconfig: Enable CONFIG_ACPI_CPPC_CPUFREQ

Vincent Chen (1):
      clocksource: extend the max_delta_ns of timer-riscv and timer-clint to ULONG_MAX

Wende Tan (1):
      RISC-V: build: Allow LTO to be selected

Xiao Wang (1):
      riscv: Avoid code duplication with generic bitops implementation

Yang Li (1):
      RISC-V: Remove duplicated include in smpboot.c

Yu Chien Peter Lin (7):
      riscv: errata: Rename defines for Andes
      dt-bindings: riscv: Add Andes interrupt controller compatible string
      riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes INTC
      perf: RISC-V: Eliminate redundant interrupt enable/disable operations
      perf: RISC-V: Introduce Andes PMU to support perf event sampling
      dt-bindings: riscv: Add Andes PMU extension description
      riscv: dts: renesas: Add Andes PMU extension for r9a07g043f

 Documentation/arch/riscv/vm-layout.rst             |  16 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +-
 .../devicetree/bindings/riscv/extensions.yaml      |   7 +
 .../sched/membarrier-sync-core/arch-support.txt    |  18 +-
 Documentation/scheduler/index.rst                  |   1 +
 Documentation/scheduler/membarrier.rst             |  39 ++
 MAINTAINERS                                        |   4 +-
 arch/riscv/Kbuild                                  |   1 +
 arch/riscv/Kconfig                                 |  81 ++-
 arch/riscv/Makefile                                |   5 +
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi        |   4 +-
 arch/riscv/configs/defconfig                       |   3 +
 arch/riscv/crypto/Kconfig                          |  93 +++
 arch/riscv/crypto/Makefile                         |  23 +
 arch/riscv/crypto/aes-macros.S                     | 156 +++++
 arch/riscv/crypto/aes-riscv64-glue.c               | 637 +++++++++++++++++++++
 arch/riscv/crypto/aes-riscv64-zvkned-zvbb-zvkg.S   | 312 ++++++++++
 arch/riscv/crypto/aes-riscv64-zvkned-zvkb.S        | 146 +++++
 arch/riscv/crypto/aes-riscv64-zvkned.S             | 339 +++++++++++
 arch/riscv/crypto/chacha-riscv64-glue.c            | 101 ++++
 arch/riscv/crypto/chacha-riscv64-zvkb.S            | 294 ++++++++++
 arch/riscv/crypto/ghash-riscv64-glue.c             | 168 ++++++
 arch/riscv/crypto/ghash-riscv64-zvkg.S             |  72 +++
 arch/riscv/crypto/sha256-riscv64-glue.c            | 137 +++++
 .../crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S  | 225 ++++++++
 arch/riscv/crypto/sha512-riscv64-glue.c            | 133 +++++
 arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S     | 203 +++++++
 arch/riscv/crypto/sm3-riscv64-glue.c               | 112 ++++
 arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.S         | 123 ++++
 arch/riscv/crypto/sm4-riscv64-glue.c               | 107 ++++
 arch/riscv/crypto/sm4-riscv64-zvksed-zvkb.S        | 117 ++++
 arch/riscv/errata/andes/errata.c                   |  10 +-
 arch/riscv/include/asm/asm.h                       |  10 +
 arch/riscv/include/asm/atomic.h                    |  17 +-
 arch/riscv/include/asm/barrier.h                   |  21 +-
 arch/riscv/include/asm/bitops.h                    | 138 +----
 arch/riscv/include/asm/cmpxchg.h                   |   5 +-
 arch/riscv/include/asm/compat.h                    |  19 +
 arch/riscv/include/asm/cpufeature.h                |  31 +-
 arch/riscv/include/asm/elf.h                       |  11 +-
 arch/riscv/include/asm/errata_list.h               |  13 +-
 arch/riscv/include/asm/fence.h                     |  10 +-
 arch/riscv/include/asm/hwcap.h                     |   1 +
 arch/riscv/include/asm/io.h                        |   8 +-
 arch/riscv/include/asm/membarrier.h                |  50 ++
 arch/riscv/include/asm/mmio.h                      |   5 +-
 arch/riscv/include/asm/mmiowb.h                    |   2 +-
 arch/riscv/include/asm/pgalloc.h                   |  53 +-
 arch/riscv/include/asm/pgtable.h                   |  32 +-
 arch/riscv/include/asm/processor.h                 |  31 +-
 arch/riscv/include/asm/simd.h                      |   4 +-
 arch/riscv/include/asm/suspend.h                   |   3 +
 arch/riscv/include/asm/sync_core.h                 |  29 +
 arch/riscv/include/asm/syscall_wrapper.h           |  53 +-
 arch/riscv/include/asm/tlb.h                       |  18 +
 arch/riscv/include/asm/vector.h                    |  11 +
 arch/riscv/include/asm/vendorid_list.h             |   2 +-
 arch/riscv/kernel/Makefile                         |   4 +-
 arch/riscv/kernel/alternative.c                    |   2 +-
 arch/riscv/kernel/cpufeature.c                     | 256 +--------
 arch/riscv/kernel/entry.S                          |   3 +
 arch/riscv/kernel/pi/Makefile                      |   3 +
 arch/riscv/kernel/ptrace.c                         |   6 +-
 arch/riscv/kernel/smpboot.c                        |   1 -
 arch/riscv/kernel/suspend.c                        |  49 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  13 +
 arch/riscv/kernel/traps.c                          |  17 +-
 arch/riscv/kernel/traps_misaligned.c               |  17 +-
 arch/riscv/kernel/unaligned_access_speed.c         | 281 +++++++++
 arch/riscv/lib/csum.c                              |   7 +-
 arch/riscv/lib/uaccess_vector.S                    |   1 -
 arch/riscv/mm/cacheflush.c                         |   4 +-
 arch/riscv/mm/context.c                            |   2 +
 arch/riscv/mm/init.c                               |   6 +
 arch/riscv/mm/pgtable.c                            |   2 +-
 crypto/Kconfig                                     |   3 +
 drivers/acpi/Kconfig                               |   2 +-
 drivers/acpi/riscv/Makefile                        |   4 +-
 drivers/acpi/riscv/cppc.c                          | 157 +++++
 drivers/acpi/riscv/cpuidle.c                       |  81 +++
 drivers/clocksource/timer-clint.c                  |   2 +-
 drivers/clocksource/timer-riscv.c                  |   2 +-
 drivers/cpufreq/Kconfig                            |  29 +
 drivers/cpufreq/Kconfig.arm                        |  26 -
 drivers/cpuidle/cpuidle-riscv-sbi.c                |  49 +-
 drivers/irqchip/irq-riscv-intc.c                   |  82 ++-
 drivers/perf/Kconfig                               |  14 +
 drivers/perf/riscv_pmu_sbi.c                       |  37 +-
 include/asm-generic/bitops/__ffs.h                 |   8 +-
 include/asm-generic/bitops/__fls.h                 |   8 +-
 include/asm-generic/bitops/ffs.h                   |   8 +-
 include/asm-generic/bitops/fls.h                   |   8 +-
 include/linux/mm.h                                 |   2 +-
 include/linux/soc/andes/irq.h                      |  18 +
 include/linux/sync_core.h                          |  16 +-
 init/Kconfig                                       |   3 +
 kernel/sched/core.c                                |  16 +-
 kernel/sched/membarrier.c                          |  13 +-
 mm/mmap.c                                          |   2 +-
 scripts/Kconfig.include                            |   2 +-
 scripts/Makefile.compiler                          |   2 +-
 .../pmu-events/arch/riscv/andes/ax45/firmware.json |  68 +++
 .../arch/riscv/andes/ax45/instructions.json        | 127 ++++
 .../pmu-events/arch/riscv/andes/ax45/memory.json   |  57 ++
 .../arch/riscv/andes/ax45/microarch.json           |  77 +++
 tools/perf/pmu-events/arch/riscv/mapfile.csv       |   1 +
 tools/testing/selftests/riscv/mm/mmap_bottomup.c   |  23 +-
 tools/testing/selftests/riscv/mm/mmap_default.c    |  23 +-
 tools/testing/selftests/riscv/mm/mmap_test.h       | 107 ++--
 109 files changed, 5272 insertions(+), 749 deletions(-)
 create mode 100644 Documentation/scheduler/membarrier.rst
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile
 create mode 100644 arch/riscv/crypto/aes-macros.S
 create mode 100644 arch/riscv/crypto/aes-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned-zvbb-zvkg.S
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned-zvkb.S
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned.S
 create mode 100644 arch/riscv/crypto/chacha-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/chacha-riscv64-zvkb.S
 create mode 100644 arch/riscv/crypto/ghash-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zvkg.S
 create mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
 create mode 100644 arch/riscv/crypto/sha512-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S
 create mode 100644 arch/riscv/crypto/sm3-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.S
 create mode 100644 arch/riscv/crypto/sm4-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sm4-riscv64-zvksed-zvkb.S
 create mode 100644 arch/riscv/include/asm/membarrier.h
 create mode 100644 arch/riscv/include/asm/sync_core.h
 create mode 100644 arch/riscv/kernel/unaligned_access_speed.c
 create mode 100644 drivers/acpi/riscv/cppc.c
 create mode 100644 drivers/acpi/riscv/cpuidle.c
 create mode 100644 include/linux/soc/andes/irq.h
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json


--===============5216365543139877009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5216365543139877009==--
