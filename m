Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16509C47DAF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZGoPwpwoo2qpQkQzV2T3/VYYAJmlRYjNy6Gj3AiE7UE=; b=cNU
	juEtGcd4JLk1EvUh9hfyDRXH8o9qDqH0kYHdMe4JuAh6LN6VZfVFry4ICpgKZ3ubdMSJdyAZo03ks
	ZoGd0cGmovP5OU67HkRTOHy6ccVG7dB29CQSsLF8ze7UpJaadZ6iwWmhvA2QPgps/cbTRwq9kr0+l
	/5ga+yk+L9X0hZUcuLfHOeMA3892H1z2DaPQ3WTM/L4eV8TQ8LV9XJYoytcVPtSD59GMWcKS/f92w
	VP7JOmpohnNF4GEdInInychmbQR34aw/xUOYOEimeQotBcyAWQuu1/9lj/KHA44NePrueuyKrs8sB
	ONCyfcf8o3fPACjvNLoDLjnf3FiSGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQpJe-005ldh-2q;
	Fri, 19 Jan 2024 13:53:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQpJa-005ldC-0q
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 13:53:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d71cb97937so5883195ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 05:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705672423; x=1706277223; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18/X7dedl18t7gKBy33vs2gEUxK1Wp/60iRN/Swn/uU=;
        b=E5F56mSJGOnxrAPjuShS6HZFev/jhtbXWp/zEzV2jf2FMBBDBkxVynwYnmINzyPtuS
         e/sDkB6bBruOpIcWXrqt4BE6dNo1PTGiLrKmJXDveGyvJv2BfqrYxBpMuG2HKezoj2lQ
         I0v/agUXqOKSLlagirvewt1cTxVIkQo0sGcWlJAWRhtWpYZONeMFaxm3UOxJAEAj7zZI
         VdRQi89GkthnZtZ9DfOzG+4BtnoN9Rs9oCkgD3IQtHCjQyfsDGj4I2lBnew3tEVV0nfz
         L0RvQN2tEMJdIbJdXczgUkLG43lOAHQde+nElAE301rXJxhn+MkPGIev2P8KaId4Dcn4
         eM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705672423; x=1706277223;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18/X7dedl18t7gKBy33vs2gEUxK1Wp/60iRN/Swn/uU=;
        b=mV/lpdRxsjBYmEh9kJEMg4LDT7gHoA+klKX8XnOaeTKlzJW6cQTwfbKbpmI/n5cqCO
         kIdGhyf/mhTiOXkuu6v6KYRZv5IzCS3Nk+nXQatPKut5lzWk7sbkDS/MsFIsL6C7AfHh
         fsYFoSstPFmFnC8kDL4mSEAezNSKrWGoeInHy8qz/IMYQeT/wSXmz3w9VjXU12O6ScBR
         7VilL0/YDoL1PifsLgEhAePYDRey2wt7WG7RloTuoDhthK875LtfXlPDQq7cgoxoLmmc
         8Y0XBaNWintbNc3p6BglkNi+iSJr+AqYqwaJaycslQcAJP2+YfpznbRfnKGZww55/M3t
         /hYw==
X-Gm-Message-State: AOJu0Yz5Knj0En75fFa7C6IMQaZOK+Tx8Zl/dJ8k3Qk62W6vkfMw+Cvm
	XLHvKq5mqOGd1UUg8blDlWmCrsnajH9HuTX6FHThU5O8lYn3Rb6v7v7PYrLSMUGFwSq73mMzHS+
	C
X-Google-Smtp-Source: AGHT+IGgTPAoREBtkXUJvLm9S9Jq9QP94gTR0lO/gOQPI3JXUqxG0vQqmk+iFUm6Knrl30bYgVR45A==
X-Received: by 2002:a17:902:ec8e:b0:1d5:e004:e768 with SMTP id x14-20020a170902ec8e00b001d5e004e768mr2481782plg.69.1705672422985;
        Fri, 19 Jan 2024 05:53:42 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id v12-20020a170903238c00b001d6f78ab422sm3046170plh.139.2024.01.19.05.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:53:42 -0800 (PST)
Date: Fri, 19 Jan 2024 05:53:42 -0800 (PST)
X-Google-Original-Date: Fri, 19 Jan 2024 05:47:44 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 6.8 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@subspace.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-690cf774-fd28-4d25-be9f-69e19fb84d5c@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_055347_341286_3AED1EEA 
X-CRM114-Status: GOOD (  19.06  )
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
Content-Type: multipart/mixed; boundary="===============6594895405624416114=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6594895405624416114==
Content-Type: text/plain

The following changes since commit cb51bfee7f62a8e26b694f9d84c0041b3e3ccc71:

  Merge patch series "riscv: hwprobe: add Zicond, Zacas and Ztso support" (2024-01-09 20:14:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw2

for you to fetch changes up to 4525462dd0db9e86bb67c10dedbbaa4f8d62697d:

  riscv: lib: Check if output in asm goto supported (2024-01-18 14:41:38 -0800)

----------------------------------------------------------------
RISC-V Patches for the 6.8 Merge Window, Part 2

* Support for tuning for systems with fast misaligned accesses.
* Support for SBI-based suspend.
* Support for the new SBI debug console extension.
* The T-Head CMOs now use PA-based flushes.
* Support for enabling the V extension in kernel code.
* Optimized IP checksum routines.
* Various ftrace improvements.
* Support for archrandom, which depends on the Zkr extension.

----------------------------------------------------------------
I had a spinlock magic BUG show up over the weekend, but it stopped reproducing
earlier this week.  So I think this is all clean and it was just a middle of
the merge window issue, but if someone ends up with a reproducer then please
say something.

----------------------------------------------------------------
Alexandre Ghiti (3):
      riscv: Use hugepage mappings for vmemmap
      riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
      riscv: Fix build error on rv32 + XIP

Andrew Jones (2):
      riscv: sbi: Introduce system suspend support
      RISC-V: selftests: cbo: Ensure asm operands match constraints

Andy Chiu (8):
      riscv: vector: make Vector always available for softirq context
      riscv: sched: defer restoring Vector context for user
      riscv: lib: vectorize copy_to_user/copy_from_user
      riscv: fpu: drop SR_SD bit checking
      riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
      riscv: vector: use a mask to write vstate_ctrl
      riscv: vector: use kmem_cache to manage vector context
      riscv: vector: allow kernel-mode Vector with preemption

Anup Patel (4):
      RISC-V: Add stubs for sbi_console_putchar/getchar()
      RISC-V: Add SBI debug console helper routines
      tty/serial: Add RISC-V SBI debug console based earlycon
      RISC-V: Enable SBI based earlycon support

Atish Patra (1):
      tty: Add SBI debug console support to HVC SBI driver

Charlie Jenkins (9):
      riscv: Fix module loading free order
      riscv: Correctly free relocation hashtable on error
      riscv: Fix relocation_hashtable size
      asm-generic: Improve csum_fold
      riscv: Add static key for misaligned accesses
      riscv: Add checksum header
      riscv: Add checksum library
      kunit: Add tests for csum_ipv6_magic and ip_fast_csum
      riscv: lib: Check if output in asm goto supported

Christoph Müllner (5):
      tools: selftests: riscv: Fix compile warnings in hwprobe
      tools: selftests: riscv: Fix compile warnings in cbo
      tools: selftests: riscv: Add missing include for vector test
      tools: selftests: riscv: Fix compile warnings in vector tests
      tools: selftests: riscv: Fix compile warnings in mm tests

Christophe JAILLET (1):
      riscv: Fix an off-by-one in get_early_cmdline()

Conor Dooley (1):
      dt-bindings: riscv: permit numbers in "riscv,isa"

Daniel Henrique Barboza (1):
      dt-bindings: riscv: Document cbop-block-size

Greentime Hu (2):
      riscv: Add support for kernel mode vector
      riscv: Add vector extension XOR implementation

Guo Ren (2):
      riscv: mm: Fixup compat mode boot failure
      riscv: mm: Fixup compat arch_get_mmap_end

Jisheng Zhang (4):
      riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
      riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW
      riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
      riscv: errata: thead: use pa based instructions for CMO

Masahiro Yamada (1):
      riscv: add dependency among Image(.gz), loader(.bin), and vmlinuz.efi

Maxim Kochetkov (1):
      riscv: optimize ELF relocation function in riscv

Nathan Chancellor (3):
      riscv: Hoist linker relaxation disabling logic into Kconfig
      riscv: Restrict DWARF5 when building with LLVM to known working versions
      lib/Kconfig.debug: Update AS_HAS_NON_CONST_LEB128 comment and name

Palmer Dabbelt (10):
      Merge patch series "riscv: enable EFFICIENT_UNALIGNED_ACCESS and DCACHE_WORD_ACCESS"
      Merge patch series "riscv: modules: Fix module loading error handling"
      Merge patch series "RISC-V SBI debug console extension support"
      Merge patch series "riscv: errata: thead: use riscv_nonstd_cache_ops for CMO"
      Merge patch series "tools: selftests: riscv: Fix compiler warnings"
      Merge patch series "riscv: mm: Fixup & Optimize COMPAT code"
      Merge patch series "riscv: support kernel-mode Vector"
      Merge patch series "riscv: Add fine-tuned checksum functions"
      Merge patch series "RISC-V: Disable DWARF5 with known broken LLVM versions"
      Merge patch series "riscv: ftrace: Miscellaneous ftrace improvements"

Samuel Holland (1):
      dt-bindings: riscv: cpus: Clarify mmu-type interpretation

Samuel Ortiz (1):
      RISC-V: Implement archrandom when Zkr is available

Song Shuai (4):
      riscv: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
      riscv: ftrace: Make function graph use ftrace directly
      riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
      samples: ftrace: Add RISC-V support for SAMPLE_FTRACE_DIRECT[_MULTI]

Xiao Wang (1):
      riscv: Optimize hweight API with Zbb extension

 Documentation/devicetree/bindings/riscv/cpus.yaml  |   9 +-
 .../devicetree/bindings/riscv/extensions.yaml      |   2 +-
 Documentation/features/vm/TLB/arch-support.txt     |   2 +-
 arch/riscv/Kconfig                                 |  57 +++-
 arch/riscv/Kconfig.errata                          |   1 +
 arch/riscv/Makefile                                |   8 +-
 arch/riscv/configs/defconfig                       |   1 +
 arch/riscv/errata/thead/errata.c                   |  69 ++++-
 arch/riscv/include/asm/arch_hweight.h              |  78 +++++
 arch/riscv/include/asm/archrandom.h                |  72 +++++
 arch/riscv/include/asm/asm-extable.h               |  15 +
 arch/riscv/include/asm/asm-prototypes.h            |  27 ++
 arch/riscv/include/asm/bitops.h                    |   4 +-
 arch/riscv/include/asm/checksum.h                  |  93 ++++++
 arch/riscv/include/asm/cpufeature.h                |   2 +
 arch/riscv/include/asm/csr.h                       |   9 +
 arch/riscv/include/asm/entry-common.h              |  17 ++
 arch/riscv/include/asm/errata_list.h               |  50 +---
 arch/riscv/include/asm/ftrace.h                    |  18 +-
 arch/riscv/include/asm/pgtable.h                   |   2 +-
 arch/riscv/include/asm/processor.h                 |  43 ++-
 arch/riscv/include/asm/sbi.h                       |  19 ++
 arch/riscv/include/asm/simd.h                      |  64 ++++
 arch/riscv/include/asm/switch_to.h                 |   3 +-
 arch/riscv/include/asm/thread_info.h               |   2 +
 arch/riscv/include/asm/tlbbatch.h                  |  15 +
 arch/riscv/include/asm/tlbflush.h                  |   8 +
 arch/riscv/include/asm/vector.h                    |  90 +++++-
 arch/riscv/include/asm/word-at-a-time.h            |  27 ++
 arch/riscv/include/asm/xor.h                       |  68 +++++
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/cpufeature.c                     |  90 +++++-
 arch/riscv/kernel/entry.S                          |   8 +
 arch/riscv/kernel/ftrace.c                         |  30 +-
 arch/riscv/kernel/kernel_mode_vector.c             | 247 ++++++++++++++++
 arch/riscv/kernel/mcount-dyn.S                     | 198 ++++++++++---
 arch/riscv/kernel/module.c                         |  34 ++-
 arch/riscv/kernel/pi/cmdline_early.c               |   3 +-
 arch/riscv/kernel/process.c                        |  13 +-
 arch/riscv/kernel/ptrace.c                         |   7 +-
 arch/riscv/kernel/sbi.c                            |  66 +++++
 arch/riscv/kernel/signal.c                         |   7 +-
 arch/riscv/kernel/suspend.c                        |  44 +++
 arch/riscv/kernel/vector.c                         |  53 +++-
 arch/riscv/lib/Makefile                            |   6 +
 arch/riscv/lib/csum.c                              | 328 +++++++++++++++++++++
 arch/riscv/lib/riscv_v_helpers.c                   |  45 +++
 arch/riscv/lib/uaccess.S                           |  10 +
 arch/riscv/lib/uaccess_vector.S                    |  53 ++++
 arch/riscv/lib/xor.S                               |  81 +++++
 arch/riscv/mm/extable.c                            |  31 ++
 arch/riscv/mm/init.c                               |  25 +-
 arch/riscv/mm/tlbflush.c                           |  69 +++--
 drivers/tty/hvc/Kconfig                            |   2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c                    |  37 ++-
 drivers/tty/serial/Kconfig                         |   2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c            |  27 +-
 include/asm-generic/checksum.h                     |   6 +-
 lib/Kconfig.debug                                  |  12 +-
 lib/checksum_kunit.c                               | 284 +++++++++++++++++-
 samples/ftrace/ftrace-direct-modify.c              |  35 +++
 samples/ftrace/ftrace-direct-multi-modify.c        |  41 +++
 samples/ftrace/ftrace-direct-multi.c               |  25 ++
 samples/ftrace/ftrace-direct-too.c                 |  28 ++
 samples/ftrace/ftrace-direct.c                     |  24 ++
 tools/testing/selftests/riscv/hwprobe/cbo.c        |  24 +-
 tools/testing/selftests/riscv/hwprobe/hwprobe.c    |   4 +-
 tools/testing/selftests/riscv/mm/mmap_test.h       |   3 +
 .../selftests/riscv/vector/v_initval_nolibc.c      |   2 +-
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |   3 +
 .../testing/selftests/riscv/vector/vstate_prctl.c  |   4 +-
 71 files changed, 2674 insertions(+), 213 deletions(-)
 create mode 100644 arch/riscv/include/asm/arch_hweight.h
 create mode 100644 arch/riscv/include/asm/archrandom.h
 create mode 100644 arch/riscv/include/asm/checksum.h
 create mode 100644 arch/riscv/include/asm/simd.h
 create mode 100644 arch/riscv/include/asm/tlbbatch.h
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/lib/csum.c
 create mode 100644 arch/riscv/lib/riscv_v_helpers.c
 create mode 100644 arch/riscv/lib/uaccess_vector.S
 create mode 100644 arch/riscv/lib/xor.S


--===============6594895405624416114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6594895405624416114==--
