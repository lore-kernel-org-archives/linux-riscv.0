Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52587C87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 18:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XJI11dHwxk/d0BRN5sjg1PEykXfnQNhMkFUajKRuURc=; b=JZv
	LuSb80cE4lrIRT9aWf7aTaRSqhHNR36pBGVotDwrKQMi+By0kosImJ+nFKfAZd72XISDtXSgTkaJW
	U1PRxQG3fxRbsZ2Mac9IFZVkuvTKltYIGs7OJ7QIEA9DJMnpyVxvURoiVdoyYpLNwdP8fasQ0MY7S
	XdumlFe3VV4qMwXPidkPxMs3rI4mwbbW4qlTIPx33GNQB50/VaSPVPka/ziGGvm4RMX+4y3qbNbLn
	pNII+YAZy/M8jpNpDYT/OAF2XpnID++S4AIMqPpeRBnBgAsQbi9Td3AD03ECdCwMaOarmcHsj/DaP
	iVS3nOB/i2fDA9hVY5U17iCkevwAT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRgO-00000003T6Y-2BOR;
	Fri, 08 Aug 2025 18:19:12 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRgL-00000003T68-25do
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 18:19:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76bd6e84eddso3262251b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Aug 2025 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1754677148; x=1755281948; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ5+c29dU5b9O6qsUfKFbzu0LdrZfAtgF3Lb4XYiV98=;
        b=3bWa8KGpgiDCusJNaJaoHhvR9Bxz2SjKBF8J60ZQVipQECIAyw7ncVltsrxiPf1/hi
         9EaUozRZYADcJTLi9D1xOtUXDuZvUKXWfackan30HzFDsGUdzRRUSqvd1A/qkYYPB2YO
         IZBZC5P89vFcZoKMi6jg0vBprUfwint++J2nJ/gkhLzFp5ZfA9R4H2awvlplV7vu0JcL
         Iijnte7+X/HkToF/OSVjmuTTyvbRLouoRxvgAO1htfP+4gI3fXXXxkDcL+TCFuwF9UNx
         7SzoWuxsbzCahTjne3Xzu93C/NvYuX++qj5mz8C9AJ+ovhGO6BuuExhEYXPwMAhKSySL
         TUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754677148; x=1755281948;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ5+c29dU5b9O6qsUfKFbzu0LdrZfAtgF3Lb4XYiV98=;
        b=FQ3G7Yyr4/j7gvDH6MhqqGflWMA+MGks4y+qxOvw3kB8JXI9D8b+XX+zgj+U5IXPJP
         i8E0eEmdbaTyuy6xcZ2RD6SZFvRTGTrgetJo+dCN3Bdk3Iidk84Qs9y1kQTcJpUjjLTz
         956j4rnxZJf7+tCO/Wr0z2PXQdWf7iq0GFqY3b1k0I42cH9ecX+58sJRtpv9I18tFNg5
         g1gkSBXyWMwUiCykSLJ7ji53xQ4EClponFWbovailINDXHSO2JwwdTFgVz1yBr0GdoyZ
         AuLiFx53Gdz8AbvKnCBIuVZdRVek4U912rXZQj8IB09aGIAzZvrotIZC7hOs6PQofRya
         oZkQ==
X-Gm-Message-State: AOJu0YydJUYonClA+1LC9Mw9rfO/ovF1Au725vSUq1XfzHhcfSZYWc1q
	SiCRgXgtbcwK6io8QnVvidQve4IfvXMZBJp576rWteDy9XKiCOCVNiPaeWhGqzcTU5ejcsK41C/
	MsvzX5Yk=
X-Gm-Gg: ASbGnctoibTlCMeE59ayq+d1s19iWBf4uBFyD2ECjC+JQ8zR4A4L3yOI727x4zxmXM+
	MUp8KfCjw32AeVIVvrwh+w+yFlRMDnwHDogK3w3m0/+jJTmrsUNegAysbaCDOa6q0+nqO2jpVwu
	BBLtTpU0EBvnoGEsmoZU88NGFVl9xzbnaKUcgsKrtlUwXkwaWjbnzOBbtzxKWDZe1zRhKUwsmNp
	P1xEXoBH91DN7LsN0it37lrps+Q14VGA4nPW6ARWwqIOMXyvR7NHJDEGc0UWb2a/X9fUjbDaVto
	PbVEFUSAHvL9vikefP597wKRtxOHnnwNiAboecGErRwzNFNMuGNPSIILoD86MhOLCBzrTgd56FI
	1XU3rHUB5zGIL+yrB8neiqsPjs8huRUumk2YN
X-Google-Smtp-Source: AGHT+IFznI6jIeHELjqpkJA+jE2hApI+4SYig7h6psAZUpuWjO79NHZG/LqKPcTcxzxSgB2sCuSrJg==
X-Received: by 2002:a05:6a00:4fca:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-76c461a68e1mr6512775b3a.18.1754677147776;
        Fri, 08 Aug 2025 11:19:07 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:6f48])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76bcce8f800sm20948582b3a.42.2025.08.08.11.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 11:19:05 -0700 (PDT)
Date: Fri, 08 Aug 2025 11:19:05 -0700 (PDT)
X-Google-Original-Date: Fri, 08 Aug 2025 11:18:21 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.17 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-7755CB81-B0C6-42D3-82B5-CE37669F176C@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_111909_543875_235ACBDC 
X-CRM114-Status: GOOD (  20.61  )
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
Content-Type: multipart/mixed; boundary="===============5455743076420406636=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5455743076420406636==
Content-Type: text/plain

The following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:

  Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.17-mw1

for you to fetch changes up to 7b388bf7a9d9fe528559f896ab6c215e0194361e:

  Merge patch series "Linux SBI MPXY and RPMI drivers" (2025-08-06 09:46:31 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.17 Merge Window, Part 1

* Support for the RISC-V IOMMU in ACPI-based systems.
* Support for the ACPI BGRT table, to show vendor logos.
* An errata workaround for a store buffer merging issue that manifests
  on some T-Head based systems, including the Sophgo SG2042 and the
  T-Head TH1520.
* The MMU type can now be read from device tree.  This avoids issues
  on systems where probing the MMU width via CSR writes hangs, including
  the Nuclei UX900.
* Support for the Xmipsexectl extension, which is the MIPS flavor of
  Zihintpause.
* Performance improvements for the endianness swap routines on systems
  with Zbb, and raid6 on systems with V.
* Support for kprobetrace.
* Support for CFI (control-flow integrity) in userspace processes.
* Support for the MPXY and RPMI SBI extensions.

----------------------------------------------------------------
This is very late, so I don't plan on having a part 2 unless something goes off
the rails.  There's a few trivial merge conflicts with the SBI drivers, just
from having multiple drivers in flight.  Maybe it'd be better to have these
drivers in other trees, but the SBI stuff is pretty tied to RISC-V and they
seemed stuck.

Aside from that thinks look clean on my end.

----------------------------------------------------------------
Aleksa Paunovic (6):
      dt-bindings: riscv: Add xmipsexectl ISA extension description
      riscv: Add xmipsexectl as a vendor extension
      riscv: Add xmipsexectl instructions
      riscv: hwprobe: Add MIPS vendor extension probing
      riscv: hwprobe: Document MIPS xmipsexectl vendor extension
      riscv: Add tools support for xmipsexectl

Alexandre Ghiti (16):
      riscv: Fix typo EXRACT -> EXTRACT
      riscv: Strengthen duplicate and inconsistent definition of RV_X()
      riscv: Move all duplicate insn parsing macros into asm/insn.h
      Merge patch series "riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files"
      riscv: Fix typo EXRACT -> EXTRACT
      riscv: Strengthen duplicate and inconsistent definition of RV_X()
      riscv: Move all duplicate insn parsing macros into asm/insn.h
      Merge patch series "Move duplicated instructions macros into asm/insn.h"
      Merge patch series "riscv: kprobes: Clean up instruction simulation"
      Merge patch series "riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup"
      Merge patch series "Add an optimization also raid6test for RISC-V support"
      Merge patch series "riscv: mm: Use mmu-type from FDT as SATP mode limit"
      Merge patch series "riscv: minor thread_info.cpu improvements"
      Merge patch series "riscv: Add support for xmipsexectl"
      Merge patch series "ACPI: support BGRT table on RISC-V"
      Merge patch series "riscv control-flow integrity for usermode"

Andy Chiu (1):
      riscv: signal: abstract header saving for setup_sigcontext

Anup Patel (14):
      dt-bindings: mailbox: Add bindings for RPMI shared memory transport
      dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
      RISC-V: Add defines for the SBI message proxy extension
      mailbox: Add common header for RPMI messages sent via mailbox
      mailbox: Allow controller specific mapping using fwnode
      byteorder: Add memcpy_to_le32() and memcpy_from_le32()
      mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
      dt-bindings: clock: Add RPMI clock service message proxy bindings
      dt-bindings: clock: Add RPMI clock service controller bindings
      dt-bindings: Add RPMI system MSI message proxy bindings
      dt-bindings: Add RPMI system MSI interrupt controller bindings
      irqchip: Add driver for the RPMI system MSI service group
      RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
      MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers

Aurelien Jarno (1):
      riscv: uaccess: fix __put_user_nocheck for unaligned accesses

Chunyan Zhang (5):
      raid6: riscv: Clean up unused header file inclusion
      raid6: riscv: replace one load with a move to speed up the caculation
      raid6: riscv: Prevent compiler with vector support to build already vectorized code
      raid6: riscv: Allow code to be compiled in userspace
      raid6: test: Add support for RISC-V

Clément Léger (2):
      riscv: cpufeature: add validation for zfa, zfh and zfhmin
      selftests: riscv: add misaligned access testing

Deepak Gupta (25):
      mm: VM_SHADOW_STACK definition for riscv
      dt-bindings: riscv: zicfilp and zicfiss in dt-bindings (extensions.yaml)
      riscv: zicfiss / zicfilp enumeration
      riscv: zicfiss / zicfilp extension csr and bit definitions
      riscv: usercfi state for task and save/restore of CSR_SSP on trap entry/exit
      riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
      riscv/mm: manufacture shadow stack pte
      riscv/mm: teach pte_mkwrite to manufacture shadow stack PTEs
      riscv/mm: write protect and shadow stack
      riscv/mm: Implement map_shadow_stack() syscall
      riscv/shstk: If needed allocate a new shadow stack on clone
      riscv: Implements arch agnostic shadow stack prctls
      prctl: arch-agnostic prctl for indirect branch tracking
      riscv: Implements arch agnostic indirect branch tracking prctls
      riscv/traps: Introduce software check exception and uprobe handling
      riscv/signal: save and restore of shadow stack for signal
      riscv/kernel: update __show_regs to print shadow stack register
      riscv/ptrace: riscv cfi status and state via ptrace and in core files
      riscv/hwprobe: zicfilp / zicfiss enumeration in hwprobe
      riscv: kernel command line option to opt out of user cfi
      riscv: enable kernel access to shadow stack memory via FWFT sbi call
      riscv: create a config for shadow stack and landing pad instr support
      riscv: Documentation for landing pad / indirect branch tracking
      riscv: Documentation for shadow stack on riscv
      kselftest/riscv: kselftest for user mode cfi

Djordje Todorovic (1):
      riscv: errata: Fix the PAUSE Opcode for MIPS P8700

Guo Ren (Alibaba DAMO Academy) (2):
      riscv: Move vendor errata definitions to new header
      riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup

Heinrich Schuchardt (2):
      RISC-V: ACPI: enable parsing the BGRT table
      ACPI: support BGRT table on RISC-V

Ignacio Encinas (1):
      riscv: introduce asm/swab.h

Jessica Liu (1):
      riscv: mmap(): use unsigned offset type in riscv_sys_mmap

Jim Shu (1):
      arch/riscv: compile vdso with landing pad and shadow stack note

Junhui Liu (2):
      riscv: mm: Return intended SATP mode for noXlvl options
      riscv: mm: Use mmu-type from FDT to limit SATP mode

Masahiro Yamada (1):
      riscv: pi: use 'targets' instead of extra-y in Makefile

Nam Cao (12):
      riscv: kprobes: Move branch_rs2_idx to insn.h
      riscv: kprobes: Move branch_funct3 to insn.h
      riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
      riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
      riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
      riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
      riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
      riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
      riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
      riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
      riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
      riscv: Add kprobes KUnit test

Palmer Dabbelt (6):
      Merge patch "riscv: defconfig: run savedefconfig to reorder it"
      Merge patch series "Move duplicated instructions macros into asm/insn.h"
      Merge patch series "RISC-V: Add ACPI support for IOMMU"
      Merge tag 'riscv-mw1-6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next
      Merge tag 'riscv-mw2-6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next
      Merge patch series "Linux SBI MPXY and RPMI drivers"

Pu Lehui (1):
      riscv: Enable ARCH_HAVE_NMI_SAFE_CMPXCHG

Radim Krčmář (4):
      riscv: use lw when reading int cpu in new_vmalloc_check
      riscv: use lw when reading int cpu in asm_per_cpu
      riscv: use TASK_TI_CPU instead of TASK_TI_CPU_NUM
      riscv: pack rv64 thread_info better

Rahul Pathak (1):
      clk: Add clock driver for the RISC-V RPMI clock service group

Sunil V L (12):
      ACPI: RISC-V: Add support for RIMT
      ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
      iommu/riscv: Add ACPI support
      ACPI: property: Refactor acpi_fwnode_get_reference_args() to support nargs_prop
      ACPI: Add support for nargs_prop in acpi_fwnode_get_reference_args()
      ACPI: scan: Update honor list for RPMI System MSI
      ACPI: RISC-V: Create interrupt controller list in sorted order
      ACPI: RISC-V: Add support to update gsi range
      ACPI: RISC-V: Add RPMI System MSI to GSI mapping
      irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
      mailbox/riscv-sbi-mpxy: Add ACPI support
      irqchip/riscv-rpmi-sysmsi: Add ACPI support

Thomas Huth (2):
      riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
      riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

Yixun Lan (1):
      riscv: defconfig: run savedefconfig to reorder it

Yunhui Cui (1):
      riscv: introduce ioremap_wc()

 Documentation/admin-guide/kernel-parameters.txt    |    8 +
 Documentation/arch/riscv/hwprobe.rst               |    9 +
 Documentation/arch/riscv/index.rst                 |    2 +
 Documentation/arch/riscv/zicfilp.rst               |  115 +++
 Documentation/arch/riscv/zicfiss.rst               |  179 ++++
 .../bindings/clock/riscv,rpmi-clock.yaml           |   64 ++
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml      |   64 ++
 .../riscv,rpmi-mpxy-system-msi.yaml                |   67 ++
 .../riscv,rpmi-system-msi.yaml                     |   74 ++
 .../bindings/mailbox/riscv,rpmi-shmem-mbox.yaml    |  124 +++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml      |   51 +
 .../devicetree/bindings/riscv/extensions.yaml      |   20 +
 MAINTAINERS                                        |   16 +
 arch/riscv/Kconfig                                 |   23 +
 arch/riscv/Kconfig.errata                          |   40 +
 arch/riscv/Kconfig.vendor                          |   13 +
 arch/riscv/Makefile                                |    5 +-
 arch/riscv/configs/defconfig                       |    7 +-
 arch/riscv/configs/hardening.config                |    4 +
 arch/riscv/errata/Makefile                         |    1 +
 arch/riscv/errata/mips/Makefile                    |    5 +
 arch/riscv/errata/mips/errata.c                    |   67 ++
 arch/riscv/errata/thead/errata.c                   |   20 +
 arch/riscv/include/asm/alternative-macros.h        |   12 +-
 arch/riscv/include/asm/alternative.h               |    5 +-
 arch/riscv/include/asm/asm-extable.h               |    6 +-
 arch/riscv/include/asm/asm-prototypes.h            |    1 +
 arch/riscv/include/asm/asm.h                       |   12 +-
 arch/riscv/include/asm/assembler.h                 |   46 +-
 arch/riscv/include/asm/barrier.h                   |    4 +-
 arch/riscv/include/asm/cache.h                     |    4 +-
 arch/riscv/include/asm/cmpxchg.h                   |    3 +-
 arch/riscv/include/asm/cpu_ops_sbi.h               |    2 +-
 arch/riscv/include/asm/cpufeature.h                |   12 +
 arch/riscv/include/asm/csr.h                       |   20 +-
 arch/riscv/include/asm/current.h                   |    4 +-
 arch/riscv/include/asm/entry-common.h              |    2 +
 arch/riscv/include/asm/errata_list.h               |   38 +-
 arch/riscv/include/asm/errata_list_vendors.h       |   30 +
 arch/riscv/include/asm/ftrace.h                    |    6 +-
 arch/riscv/include/asm/gpr-num.h                   |    6 +-
 arch/riscv/include/asm/hwcap.h                     |    2 +
 arch/riscv/include/asm/hwprobe.h                   |    3 +-
 arch/riscv/include/asm/image.h                     |    4 +-
 arch/riscv/include/asm/insn-def.h                  |    8 +-
 arch/riscv/include/asm/insn.h                      |  215 ++++-
 arch/riscv/include/asm/io.h                        |    4 +
 arch/riscv/include/asm/irq.h                       |    6 +
 arch/riscv/include/asm/jump_label.h                |    4 +-
 arch/riscv/include/asm/kasan.h                     |    2 +-
 arch/riscv/include/asm/kgdb.h                      |    4 +-
 arch/riscv/include/asm/mman.h                      |   26 +
 arch/riscv/include/asm/mmu.h                       |    4 +-
 arch/riscv/include/asm/mmu_context.h               |    7 +
 arch/riscv/include/asm/page.h                      |    4 +-
 arch/riscv/include/asm/pgtable.h                   |   35 +-
 arch/riscv/include/asm/processor.h                 |    5 +-
 arch/riscv/include/asm/ptrace.h                    |    4 +-
 arch/riscv/include/asm/rwonce.h                    |   34 +
 arch/riscv/include/asm/sbi.h                       |   63 ++
 arch/riscv/include/asm/scs.h                       |    4 +-
 arch/riscv/include/asm/set_memory.h                |    4 +-
 arch/riscv/include/asm/swab.h                      |   87 ++
 arch/riscv/include/asm/thread_info.h               |    9 +-
 arch/riscv/include/asm/uaccess.h                   |    2 +-
 arch/riscv/include/asm/usercfi.h                   |   95 ++
 arch/riscv/include/asm/vdso.h                      |    4 +-
 arch/riscv/include/asm/vdso/getrandom.h            |    4 +-
 arch/riscv/include/asm/vdso/gettimeofday.h         |    4 +-
 arch/riscv/include/asm/vdso/processor.h            |    7 +-
 arch/riscv/include/asm/vdso/vsyscall.h             |    4 +-
 arch/riscv/include/asm/vector.h                    |    3 +
 arch/riscv/include/asm/vendor_extensions/mips.h    |   37 +
 .../include/asm/vendor_extensions/mips_hwprobe.h   |   22 +
 arch/riscv/include/asm/vendorid_list.h             |    1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |    3 +
 arch/riscv/include/uapi/asm/kvm.h                  |    2 +-
 arch/riscv/include/uapi/asm/ptrace.h               |   38 +-
 arch/riscv/include/uapi/asm/sigcontext.h           |    5 +-
 arch/riscv/include/uapi/asm/vendor/mips.h          |    3 +
 arch/riscv/kernel/Makefile                         |    1 +
 arch/riscv/kernel/acpi.c                           |    3 +
 arch/riscv/kernel/alternative.c                    |    5 +
 arch/riscv/kernel/asm-offsets.c                    |   11 +-
 arch/riscv/kernel/cpufeature.c                     |   33 +-
 arch/riscv/kernel/entry.S                          |   40 +-
 arch/riscv/kernel/head.S                           |   27 +
 arch/riscv/kernel/machine_kexec_file.c             |    2 +-
 arch/riscv/kernel/pi/Makefile                      |    2 +-
 arch/riscv/kernel/pi/cmdline_early.c               |    4 +-
 arch/riscv/kernel/pi/fdt_early.c                   |   40 +
 arch/riscv/kernel/pi/pi.h                          |    1 +
 arch/riscv/kernel/probes/simulate-insn.c           |   94 +-
 arch/riscv/kernel/process.c                        |   27 +-
 arch/riscv/kernel/ptrace.c                         |   95 ++
 arch/riscv/kernel/signal.c                         |  148 ++-
 arch/riscv/kernel/sys_hwprobe.c                    |   20 +-
 arch/riscv/kernel/sys_riscv.c                      |   12 +-
 arch/riscv/kernel/tests/Kconfig.debug              |   12 +
 arch/riscv/kernel/tests/Makefile                   |    1 +
 arch/riscv/kernel/tests/kprobes/Makefile           |    1 +
 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S |  229 +++++
 arch/riscv/kernel/tests/kprobes/test-kprobes.c     |   56 ++
 arch/riscv/kernel/tests/kprobes/test-kprobes.h     |   24 +
 arch/riscv/kernel/traps.c                          |   54 ++
 arch/riscv/kernel/traps_misaligned.c               |  144 +--
 arch/riscv/kernel/usercfi.c                        |  545 +++++++++++
 arch/riscv/kernel/vdso/Makefile                    |   11 +-
 arch/riscv/kernel/vdso/flush_icache.S              |    4 +
 arch/riscv/kernel/vdso/getcpu.S                    |    4 +
 arch/riscv/kernel/vdso/rt_sigreturn.S              |    4 +
 arch/riscv/kernel/vdso/sys_hwprobe.S               |    4 +
 arch/riscv/kernel/vdso/vgetrandom-chacha.S         |    5 +-
 arch/riscv/kernel/vector.c                         |    2 +-
 arch/riscv/kernel/vendor_extensions.c              |   10 +
 arch/riscv/kernel/vendor_extensions/Makefile       |    2 +
 arch/riscv/kernel/vendor_extensions/mips.c         |   22 +
 arch/riscv/kernel/vendor_extensions/mips_hwprobe.c |   23 +
 arch/riscv/kvm/vcpu_insn.c                         |  128 +--
 arch/riscv/mm/init.c                               |   14 +-
 arch/riscv/mm/pgtable.c                            |   16 +
 drivers/acpi/Kconfig                               |    6 +-
 drivers/acpi/property.c                            |  128 +--
 drivers/acpi/riscv/Kconfig                         |    7 +
 drivers/acpi/riscv/Makefile                        |    1 +
 drivers/acpi/riscv/init.c                          |    2 +
 drivers/acpi/riscv/init.h                          |    1 +
 drivers/acpi/riscv/irq.c                           |   75 +-
 drivers/acpi/riscv/rimt.c                          |  520 ++++++++++
 drivers/acpi/scan.c                                |    6 +
 drivers/base/property.c                            |    2 +-
 drivers/clk/Kconfig                                |    8 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-rpmi.c                             |  616 ++++++++++++
 drivers/iommu/riscv/iommu-platform.c               |   17 +-
 drivers/iommu/riscv/iommu.c                        |   10 +
 drivers/irqchip/Kconfig                            |    7 +
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-riscv-imsic-early.c            |    2 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c            |  328 +++++++
 drivers/mailbox/Kconfig                            |   11 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/mailbox.c                          |   65 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c              | 1017 ++++++++++++++++++++
 include/asm-generic/rwonce.h                       |    2 +
 include/linux/acpi_rimt.h                          |   28 +
 include/linux/byteorder/generic.h                  |   16 +
 include/linux/cpu.h                                |    4 +
 include/linux/mailbox/riscv-rpmi-message.h         |  243 +++++
 include/linux/mailbox_controller.h                 |    3 +
 include/linux/mm.h                                 |    7 +
 include/linux/wordpart.h                           |   16 +
 include/uapi/linux/elf.h                           |    2 +
 include/uapi/linux/prctl.h                         |   27 +
 kernel/sys.c                                       |   30 +
 lib/raid6/recov_rvv.c                              |    9 +-
 lib/raid6/rvv.c                                    |  362 +++----
 lib/raid6/rvv.h                                    |   17 +
 lib/raid6/test/Makefile                            |    8 +
 tools/arch/riscv/include/asm/csr.h                 |    6 +-
 tools/arch/riscv/include/asm/vdso/processor.h      |   31 +-
 tools/testing/selftests/riscv/Makefile             |    2 +-
 tools/testing/selftests/riscv/cfi/.gitignore       |    3 +
 tools/testing/selftests/riscv/cfi/Makefile         |   16 +
 tools/testing/selftests/riscv/cfi/cfi_rv_test.h    |   82 ++
 tools/testing/selftests/riscv/cfi/riscv_cfi_test.c |  173 ++++
 tools/testing/selftests/riscv/cfi/shadowstack.c    |  385 ++++++++
 tools/testing/selftests/riscv/cfi/shadowstack.h    |   27 +
 .../testing/selftests/riscv/misaligned/.gitignore  |    1 +
 tools/testing/selftests/riscv/misaligned/Makefile  |   12 +
 tools/testing/selftests/riscv/misaligned/common.S  |   33 +
 tools/testing/selftests/riscv/misaligned/fpu.S     |  180 ++++
 tools/testing/selftests/riscv/misaligned/gp.S      |  113 +++
 .../selftests/riscv/misaligned/misaligned.c        |  288 ++++++
 174 files changed, 7994 insertions(+), 808 deletions(-)
 create mode 100644 Documentation/arch/riscv/zicfilp.rst
 create mode 100644 Documentation/arch/riscv/zicfiss.rst
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
 create mode 100644 arch/riscv/configs/hardening.config
 create mode 100644 arch/riscv/errata/mips/Makefile
 create mode 100644 arch/riscv/errata/mips/errata.c
 create mode 100644 arch/riscv/include/asm/errata_list_vendors.h
 create mode 100644 arch/riscv/include/asm/mman.h
 create mode 100644 arch/riscv/include/asm/rwonce.h
 create mode 100644 arch/riscv/include/asm/swab.h
 create mode 100644 arch/riscv/include/asm/usercfi.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/mips.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/mips_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/mips.h
 create mode 100644 arch/riscv/kernel/tests/kprobes/Makefile
 create mode 100644 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
 create mode 100644 arch/riscv/kernel/tests/kprobes/test-kprobes.c
 create mode 100644 arch/riscv/kernel/tests/kprobes/test-kprobes.h
 create mode 100644 arch/riscv/kernel/usercfi.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/mips.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/mips_hwprobe.c
 create mode 100644 drivers/acpi/riscv/Kconfig
 create mode 100644 drivers/acpi/riscv/rimt.c
 create mode 100644 drivers/clk/clk-rpmi.c
 create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
 create mode 100644 include/linux/acpi_rimt.h
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h
 create mode 100644 tools/testing/selftests/riscv/cfi/.gitignore
 create mode 100644 tools/testing/selftests/riscv/cfi/Makefile
 create mode 100644 tools/testing/selftests/riscv/cfi/cfi_rv_test.h
 create mode 100644 tools/testing/selftests/riscv/cfi/riscv_cfi_test.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shadowstack.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shadowstack.h
 create mode 100644 tools/testing/selftests/riscv/misaligned/.gitignore
 create mode 100644 tools/testing/selftests/riscv/misaligned/Makefile
 create mode 100644 tools/testing/selftests/riscv/misaligned/common.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/fpu.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/gp.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/misaligned.c


--===============5455743076420406636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5455743076420406636==--
