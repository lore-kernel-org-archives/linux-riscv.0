Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA345C5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 18:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Qppcuuc2phXVUHTuOyJzZ83hCmcguBUfkBkdhWfR+4M=; b=kok
	bpgatcsoY686EoG2x314pCg24LlqlY3XEacUbHOBiORCpDakibTo/Tf51B2WVhebQA3KTUMbvrOEz
	mzxclMmbImEii5gSovXex+x8FRdbbHRO3Xphdr3aTIT4aQXfQQUDfvG6BUKOPLtH5YCQZSPhZ7xJr
	2lBv92C9uRIFfEqWhJ9FMpfyNDUKOzoMzNhnRFaSSLS80p+puywkRjI0emfgT9fzF/8tdB2qVEsnK
	kv4NGgSmN+SsNl1R0bEDcp1xcTiIjwdrf0Bafl8sVHJUqpGxpG0WFgh4Y6FiksE9qsPnD/R9Nkud9
	k5yQySbP92OQ9mFeWFlyUSxNivTcOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbWd-00000000mOL-33Qc;
	Fri, 06 Jun 2025 18:10:43 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbWa-00000000mNx-013u
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 18:10:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22e09f57ed4so32349015ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 11:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749233438; x=1749838238; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aEAN0z0rEb6MTT6tFdFj4VAFXSdmMFatRAaXMJXGjw=;
        b=Hg1U0DpncvQ0AwvGX93JMUtdJlKQM1D9YpTD6VhZMvwh4MOYcmaXd8zMIC3SIK1rjv
         h0f6IgIuMMe7kkp8zFGcLKkJdpUuazs/tS/DOd+ChfehImuDSiksp3rgfyfJagDfoltS
         wVL1KZcQeHLEFwCHTeuZGcr/ApNNvp9z2aq1MDGRi/fiUPGi+4kr1+8qX70puOprAiaa
         xu9XxtvEspoQhf460rMuETjWbzW2ZMRay9cMlF9uB75ObKIv+/eLmoP+azN2v4egeQBG
         gr1kn8hAJ8Mr4uxxAPOeREc/+b2KkpXbTa+ab610gv8O21bhgBnE21I8lsMQVMwnsY73
         QKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749233438; x=1749838238;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aEAN0z0rEb6MTT6tFdFj4VAFXSdmMFatRAaXMJXGjw=;
        b=L9K6yf3xYw8qhPZ0aGK2FxYSkrXL35S0fy+sPRnvQVadgRCNphfeB1LdxmMXTkvDTE
         gud9Uc7hmj6/hxgQyucbzpSA7hd5linU3Zg6T5WuzOaDQCerNbKTK14v50OYEt1U9HZt
         MsUEX0cahljZBcKWtDPI8VklqUN6Vc8/57L2z3oJTGgdywIs+rP+s3X/CR3l3LCdyVpi
         /hhyc5eLxNoiRdB3MR6ZJobbhTPGW095cLhNxa/SkIcqB0/oc05Z/odtEQ51gmVMPVIh
         PVIoWGLcZWPXz5x6DT0E2Oivp6UQiCwxGHDMhEv50IF6S1azsdjB7m9iWI+pi8fkqu+E
         dGuA==
X-Gm-Message-State: AOJu0YxJMZ7RtwCwLFfd39mlv5Z7TVF+oryu3EOymyix9YVopPQ54uYZ
	DlZkIMSj+Rzr4tLVPzh8t/E5z49ywMjYYbgSyd36tHgpyta5ErjXcDHG91vn6TtybyMZUT+Dnyh
	sf/Be
X-Gm-Gg: ASbGncsq/t6gQvDr7fW65fEoDsiEIhvNwrKxNpheMZ2a7qvdjSyg9Mc4qyHqmtmPFTH
	yp1bgAFP/+QvWro+SOXZNIY9pndfGZcEhSJeLPr590NQHcYYPlpBvhdJXyCmvodM0pAOffqnE65
	ks+Ip7F7SNThJ+omXyXNludpENiM1jVLzbuXC1tHKd88WVMcTI2ZS/xQVyNzpr9LeZ5Ua/wSoSy
	lCYlgPQvmFoJwdCo6cNA0Lm+s1vqX+nbh7J9UtaxWASuFS3LVw/zRdv5IzE0pB2A+NnngRulR9o
	cpUzsb/bjS6C8WbS9dtAEg9jkWYim9ebJbIVghiDkjjpevVgtZVvwHg=
X-Google-Smtp-Source: AGHT+IGFC9wJPGy9w9zM4lQbeHkV4J++XWAD0duAQoWFoAKPpYUeIdoLVDuFGCHBWcITLHWBGnstPQ==
X-Received: by 2002:a17:903:234d:b0:231:e413:986c with SMTP id d9443c01a7336-23612451420mr970445ad.11.1749233438355;
        Fri, 06 Jun 2025 11:10:38 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:2724])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2360340605csm15254075ad.164.2025.06.06.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:10:37 -0700 (PDT)
Date: Fri, 06 Jun 2025 11:10:37 -0700 (PDT)
X-Google-Original-Date: Fri, 06 Jun 2025 11:09:56 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_111040_294394_9EE5A313 
X-CRM114-Status: GOOD (  20.20  )
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
Content-Type: multipart/mixed; boundary="===============3644825746804802641=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3644825746804802641==
Content-Type: text/plain

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1

for you to fetch changes up to 51f1b16367dfde89a4ef5bee2270f6a4d523ef3b:

  Merge patch series "riscv: add SBI FWFT misaligned exception delegation support" (2025-06-05 14:03:19 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.16 Merge Window, Part 1

* Support for the FWFT SBI extension, which is part of SBI 3.0 and a
  dependency for many new SBI and ISA extensions.
* Support for getrandom() in the VDSO.
* Support for mseal.
* Optimized routines for raid6 syndrome and recovery calculations.
* kexec_file() supports loading Image-formatted kernel binaries.
* Improvements to the instruction patching framework to allow for atomic
  instruction patching, along with rules as to how systems need to
  behave in order to function correctly.
* Support for a handful of new ISA extensions: Svinval, Zicbop, Zabha,
  some SiFive vendor extensions.
* Various fixes and cleanups, including: misaligned access handling, perf
  symbol mangling, module loading, PUD THPs, and improved uaccess
  routines.

----------------------------------------------------------------
I don't plan on sending a part 2, it's way too late already.

Apologies in advance if something has gone off the rails here: between changing
jobs and some tree-related chaos there's been a lot of git surgery here.  I
poked around and think I managed to get things sane, but I've screwed that up
in the past.

The tests are all clean on my end for this one, both pre and post merge, and I
don't have anything from the bots overnight.

----------------------------------------------------------------
Alexandre Ghiti (7):
      riscv: Introduce Zicbop instructions
      riscv: Add support for Zicbop
      riscv: Add support for PUD THP
      Merge patch series "riscv: ftrace: atmoic patching and preempt improvements"
      riscv: hwprobe: export Zabha extension
      riscv: make unsafe user copy routines use existing assembly routines
      Merge patch series "riscv: Add Zicbop & prefetchw support"

Andy Chiu (11):
      riscv: ftrace: support fastcc in Clang for WITH_ARGS
      riscv: ftrace factor out code defined by !WITH_ARG
      riscv: ftrace: align patchable functions to 4 Byte boundary
      kernel: ftrace: export ftrace_sync_ipi
      riscv: ftrace: prepare ftrace for atomic code patching
      riscv: ftrace: do not use stop_machine to update code
      riscv: vector: Support calling schedule() for preemptible Vector
      riscv: add a data fence for CMODX in the kernel mode
      riscv: ftrace: support PREEMPT
      riscv: ftrace: support direct call using call_ops
      riscv: Documentation: add a description about dynamic ftrace

Atish Patra (1):
      MAINTAINERS: Update Atish's email address

Ben Dooks (1):
      riscv: save the SR_SUM status over switches

Chunyan Zhang (1):
      raid6: Add RISC-V SIMD syndrome and recovery calculations

Clément Léger (12):
      riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
      riscv: sbi: remove useless parenthesis
      riscv: sbi: add new SBI error mappings
      riscv: sbi: add FWFT extension interface
      riscv: sbi: add SBI FWFT extension calls
      riscv: misaligned: request misaligned exception from SBI
      riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
      riscv: misaligned: declare misaligned_access_speed under CONFIG_RISCV_MISALIGNED
      riscv: misaligned: move emulated access uniformity check in a function
      riscv: misaligned: add a function to check misalign trap delegability
      riscv: process: use unsigned int instead of unsigned long for put_user()
      riscv: uaccess: do not do misaligned accesses in get/put_user()

Cyan Yang (12):
      dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
      riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
      riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
      riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq
      dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
      riscv: Add SiFive xsfvfnrclipxfqf vendor extension
      riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
      riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
      dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
      riscv: Add SiFive xsfvfwmaccqqq vendor extension
      riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
      riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension

Cyril Bur (1):
      riscv: uaccess: Only restore the CSR_STATUS SUM bit

Guo Ren (2):
      riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
      riscv: xchg: Prefetch the destination word for sc.w

Haibo Xu (1):
      perf symbols: Ignore mapping symbols on riscv

Jisheng Zhang (5):
      riscv: implement user_access_begin() and families
      riscv: uaccess: use input constraints for ptr of __put_user()
      riscv: uaccess: use 'asm goto' for put_user()
      riscv: uaccess: use 'asm_goto_output' for get_user()
      riscv: enable mseal sysmap for RV64

Joel Stanley (1):
      riscv: defconfig: Remove EXPERT

Mayuresh Chitale (1):
      riscv: mm: Add support for Svinval extension

Miquel Sabaté Solà (1):
      riscv: Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE

Nylon Chen (2):
      riscv: misaligned: fix sleeping function called during misaligned access handling
      riscv: misaligned: Add handling for ZCB instructions

Palmer Dabbelt (10):
      Merge patch series "riscv: misaligned: Add ZCB handling and fix sleeping function"
      Merge patch series "riscv: uaccess: optimisations"
      Merge patch series "riscv: Add vendor extensions support for SiFive"
      Revert "RISC-V: vDSO: Wire up getrandom() vDSO implementation"
      Merge patch series "riscv: kexec_file: Support loading Image binary file"
      Merge tag 'riscv-mw1-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next
      RISC-V: Documentation: Add enough title underlines to CMODX
      Merge tag 'riscv-mw2-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next
      Merge patch series "riscv: misaligned: fix misaligned accesses handling in put/get_user()"
      Merge patch series "riscv: add SBI FWFT misaligned exception delegation support"

Puranjay Mohan (1):
      riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS

Samuel Holland (1):
      riscv: module: Optimize PLT/GOT entry counting

Song Shuai (2):
      riscv: kexec_file: Split the loading of kernel and others
      riscv: kexec_file: Support loading Image binary file

Tiezhu Yang (1):
      riscv: Make regs_irqs_disabled() more clear

Xi Ruoyao (3):
      RISC-V: vDSO: Wire up getrandom() vDSO implementation
      riscv: vDSO: Remove --hash-style=both
      RISC-V: vDSO: Wire up getrandom() vDSO implementation

Yao Zi (1):
      riscv/kexec_file: Fix comment in purgatory relocator

谢致邦 (XIE Zhibang) (1):
      RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND

 .mailmap                                           |    3 +-
 Documentation/arch/riscv/cmodx.rst                 |   46 +-
 Documentation/arch/riscv/hwprobe.rst               |   26 +
 .../devicetree/bindings/riscv/extensions.yaml      |   25 +
 MAINTAINERS                                        |    4 +-
 arch/riscv/Kconfig                                 |   38 +-
 arch/riscv/Kconfig.vendor                          |   13 +
 arch/riscv/Makefile                                |    4 +-
 arch/riscv/configs/defconfig                       |   24 +-
 arch/riscv/include/asm/asm-prototypes.h            |    2 +-
 arch/riscv/include/asm/barrier.h                   |    5 -
 arch/riscv/include/asm/cacheflush.h                |    1 +
 arch/riscv/include/asm/cmpxchg.h                   |    4 +-
 arch/riscv/include/asm/cpufeature.h                |   14 +-
 arch/riscv/include/asm/ftrace.h                    |   62 +-
 arch/riscv/include/asm/hwcap.h                     |    1 +
 arch/riscv/include/asm/hwprobe.h                   |    3 +-
 arch/riscv/include/asm/image.h                     |    2 +
 arch/riscv/include/asm/insn-def.h                  |   66 ++
 arch/riscv/include/asm/kexec.h                     |    6 +
 arch/riscv/include/asm/pgtable-64.h                |    5 +-
 arch/riscv/include/asm/pgtable.h                   |   97 ++
 arch/riscv/include/asm/processor.h                 |   31 +-
 arch/riscv/include/asm/ptrace.h                    |    2 +-
 arch/riscv/include/asm/sbi.h                       |   60 +
 arch/riscv/include/asm/tlbflush.h                  |    2 +
 arch/riscv/include/asm/uaccess.h                   |  218 +++-
 arch/riscv/include/asm/vdso/getrandom.h            |   30 +
 arch/riscv/include/asm/vector.h                    |   22 +-
 arch/riscv/include/asm/vendor_extensions/sifive.h  |   16 +
 .../include/asm/vendor_extensions/sifive_hwprobe.h |   19 +
 arch/riscv/include/uapi/asm/hwprobe.h              |    2 +
 arch/riscv/include/uapi/asm/vendor/sifive.h        |    6 +
 arch/riscv/kernel/Makefile                         |    2 +-
 arch/riscv/kernel/asm-offsets.c                    |   18 +
 arch/riscv/kernel/cpufeature.c                     |   21 +
 arch/riscv/kernel/elf_kexec.c                      |  485 --------
 arch/riscv/kernel/entry.S                          |    9 +
 arch/riscv/kernel/ftrace.c                         |  242 ++--
 arch/riscv/kernel/kexec_elf.c                      |  144 +++
 arch/riscv/kernel/kexec_image.c                    |   96 ++
 arch/riscv/kernel/machine_kexec_file.c             |  361 ++++++
 arch/riscv/kernel/mcount-dyn.S                     |  117 +-
 arch/riscv/kernel/module-sections.c                |   81 +-
 arch/riscv/kernel/process.c                        |    2 +-
 arch/riscv/kernel/sbi.c                            |   81 +-
 arch/riscv/kernel/sys_hwprobe.c                    |    6 +
 arch/riscv/kernel/traps_misaligned.c               |  116 +-
 arch/riscv/kernel/unaligned_access_speed.c         |    8 +-
 arch/riscv/kernel/vdso.c                           |    2 +-
 arch/riscv/kernel/vdso/Makefile                    |   15 +-
 arch/riscv/kernel/vdso/getrandom.c                 |   10 +
 arch/riscv/kernel/vdso/vdso.lds.S                  |    3 +
 arch/riscv/kernel/vdso/vgetrandom-chacha.S         |  249 ++++
 arch/riscv/kernel/vendor_extensions.c              |   10 +
 arch/riscv/kernel/vendor_extensions/Makefile       |    2 +
 arch/riscv/kernel/vendor_extensions/sifive.c       |   21 +
 .../kernel/vendor_extensions/sifive_hwprobe.c      |   22 +
 arch/riscv/lib/riscv_v_helpers.c                   |   11 +-
 arch/riscv/lib/uaccess.S                           |   50 +-
 arch/riscv/lib/uaccess_vector.S                    |   15 +-
 arch/riscv/mm/cacheflush.c                         |   29 +-
 arch/riscv/mm/pgtable.c                            |   10 +
 arch/riscv/mm/tlbflush.c                           |   38 +
 include/linux/ftrace.h                             |    2 +
 include/linux/raid/pq.h                            |    5 +
 kernel/trace/ftrace.c                              |    2 +-
 lib/raid6/Makefile                                 |    1 +
 lib/raid6/algos.c                                  |    9 +
 lib/raid6/recov_rvv.c                              |  229 ++++
 lib/raid6/rvv.c                                    | 1212 ++++++++++++++++++++
 lib/raid6/rvv.h                                    |   39 +
 tools/perf/util/symbol-elf.c                       |    6 +
 tools/testing/selftests/vDSO/vgetrandom-chacha.S   |    2 +
 74 files changed, 3787 insertions(+), 855 deletions(-)
 create mode 100644 arch/riscv/include/asm/vdso/getrandom.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 delete mode 100644 arch/riscv/kernel/elf_kexec.c
 create mode 100644 arch/riscv/kernel/kexec_elf.c
 create mode 100644 arch/riscv/kernel/kexec_image.c
 create mode 100644 arch/riscv/kernel/vdso/getrandom.c
 create mode 100644 arch/riscv/kernel/vdso/vgetrandom-chacha.S
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
 create mode 100644 lib/raid6/recov_rvv.c
 create mode 100644 lib/raid6/rvv.c
 create mode 100644 lib/raid6/rvv.h


--===============3644825746804802641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3644825746804802641==--
