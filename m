Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732BEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8z78utvBNczVioB+zOuNhy2bU04p1b3XKBd1jfF92RI=; b=m9VsDKNitnWXQe
	6SFei/CNxw7nWFp+kJfVCGB+Zl2lU5GBd7UsQ0P/nLtVUwo0oW/j1NoDJumjd9ag9Uz/O5IowQ7E9
	CUS6O1ZgV5XoW2xzTk6R6La89NU6ynburr/VnWWfLFKh5r5JOtNRnI2BltGjf0YK/eObQUPGfY0r7
	FLXsqgmQ8f1/xl53a0Y1aknmtvA3C06oLv52DeACYaXxXprgb6pgSrZPYcuVFTOtIABzdJHYJ2DJ3
	34Ihwl5BbeAZNn8jZ9vCmlwxOrSnnw5Gnh8RKPV1kMgwDau7/pR57HxrbBTdruLXTg6cOzL3QKOG6
	ubtkSEfuOclaHECPR1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r01IY-00GxmR-1S;
	Mon, 06 Nov 2023 15:13:54 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r01IU-00Gxkm-1p
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:13:52 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1ea98ad294cso1831247fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 07:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699283628; x=1699888428; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3spO5ETrLmBsvu43PjhgRUZXO/C9Tz2M4av0kcBBilQ=;
        b=k8GiJdVDnUc6VnDDZ8uPdnNcJdfSL7yPLUqNkU2Ek2mOqrQe/bhLjXVRj/LULEyoTL
         cs9153j4GtTo74Xzfbtihybfq6waGZ6Usc7iVUJITwXslaHWif2e9OuHy7tHvafCaDj5
         6fXbILVgwG/bD/OH65RpyxiiEZVfUJggHW4APbJoGhyhMK26E+t+1me4Yg2Za7pbAMAd
         V0tJTjS4fscBuLbmEOxCzaQsQsZivD3PWJHttaGouOlwtSejqy77vRn4FSWEDZEogF85
         4mIdHVWp7ZG3PbV4sKaAtHQ56nGJZXfpqs3RjZECxaOXVpgShMvaF24kraDMh+NJEHBa
         gixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283628; x=1699888428;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3spO5ETrLmBsvu43PjhgRUZXO/C9Tz2M4av0kcBBilQ=;
        b=kHcNKrWbk69Xo6Tjw+haTj3TvmE5MPB9qWjtbuPeP9q03lkllj5ZPOLZ+xJLNOgfuF
         vUfb3Y8YS5Fm446eh2Hl3c8NtOZTdJ0WfV4rtlIG3VYElBcnmLhcDYZZiOXB7SuTfwNK
         f5zGHC6ceFIbyP6Uc2xWm6hxK66VuSWNdG7FeaiFrDQrFE7NdGfKlCkVAtZv4NMk4mLj
         zh9hPh5Nt7YMfbnkOZkTqjqX5+ews25ysUw9FSM4+78KA2vpTwx7wOndiqAcnLmhf/b1
         aCmFpMBqZRwJVYYibaEhj+RbE234MQESx+DNnFQ6tq5HSm4Vms/41u6VoIXcEg3YCVwT
         eIlQ==
X-Gm-Message-State: AOJu0YwL3VNvbayDcIFnvnRMs4qMflq4DgBhTQM+iJ8lM7w29ZUDHqWw
	/7ggnsQJ8DJJnqOfBY+8tTv+vFdnF7FaniEI4Mk=
X-Google-Smtp-Source: AGHT+IGAyarPCYrmZZOBn4GAEmUeaKUPhRthblTIVi53m+ZXxKxtPQoPcWUodSsrMzUUWXtKM4RcHA==
X-Received: by 2002:a05:6870:b88:b0:1ec:7e2a:6e31 with SMTP id lg8-20020a0568700b8800b001ec7e2a6e31mr31836691oab.35.1699283628256;
        Mon, 06 Nov 2023 07:13:48 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id m42-20020a05687088aa00b001e12f685592sm1421984oam.13.2023.11.06.07.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:13:47 -0800 (PST)
Date: Mon, 06 Nov 2023 07:13:47 -0800 (PST)
X-Google-Original-Date: Mon, 06 Nov 2023 07:13:33 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 6.7 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-ff3fd3dc-81e2-440e-9e77-b97a64e23520@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_071350_824959_32CE2CE8 
X-CRM114-Status: GOOD (  17.84  )
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

The following changes since commit 8eb8fe67e2c84324398f5983c41b4f831d0705b3:

  riscv: errata: fix T-Head dcache.cva encoding (2023-09-12 13:58:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-rc1

for you to fetch changes up to e1c05b3bf80f829ced464bdca90f1dfa96e8d251:

  RISC-V: hwprobe: Fix vDSO SIGSEGV (2023-11-02 14:05:30 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.7 Merge Window, Part 1

* Support for cbo.zero in userspace.
* Support for CBOs on ACPI-based systems.
* A handful of improvements for the T-Head cache flushing ops.
* Support for software shadow call stacks.
* Various cleanups and fixes.

----------------------------------------------------------------
I have two manually resolved merge conflicts.  There's one in csr.h, which is
just a list of CSR numbers.  There's also one in irq.c, which is the result of
a fix conflicting with some new functionality.  Here's my resolution, see
07a27665754b ("RISC-V: Fix wrong use of CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK"):

    --- a/arch/riscv/kernel/irq.c
    +++ b/arch/riscv/kernel/irq.c
    @@@ -60,41 -79,23 +79,23 @@@ static void init_irq_stacks(void
      }
      #endif /* CONFIG_VMAP_STACK */
    
     -#ifdef CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
     +#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
    + static void ___do_softirq(struct pt_regs *regs)
    + {
    +       __do_softirq();
    + }

I'll almost certainly have more for later this week, there's already some on
for-next that I wanted to give a little more time for testing.

----------------------------------------------------------------
Andrew Jones (7):
      RISC-V: Make zicbom/zicboz errors consistent
      RISC-V: Enable cbo.zero in usermode
      RISC-V: hwprobe: Expose Zicboz extension and its block size
      RISC-V: selftests: Statically link hwprobe test
      RISC-V: selftests: Convert hwprobe test to kselftest API
      RISC-V: selftests: Add CBO tests
      RISC-V: hwprobe: Fix vDSO SIGSEGV

Anup Patel (2):
      clocksource: timer-riscv: Don't enable/disable timer interrupt
      clocksource: timer-riscv: Increase rating of clock_event_device for Sstc

Deepak Gupta (1):
      riscv: VMAP_STACK overflow detection thread-safe

Icenowy Zheng (1):
      riscv: errata: prefix T-Head mnemonics with th.

Lad Prabhakar (1):
      riscv: configs: defconfig: Enable configs required for RZ/Five SoC

Minda Chen (1):
      riscv: Using TOOLCHAIN_HAS_ZIHINTPAUSE marco replace zihintpause

Nam Cao (1):
      riscv: put interrupt entries into .irqentry.text

Palmer Dabbelt (6):
      Merge patch series "riscv: kexec: cleanup and fixups"
      Merge patch series "RISC-V: Enable cbo.zero in usermode"
      RISC-V: Provide pgtable_l5_enabled on rv32
      Merge patch series "RISC-V: ACPI improvements"
      Merge patch "riscv: errata: improve T-Head CMO"
      Merge patch series "riscv: SCS support"

Sami Tolvanen (5):
      riscv: Deduplicate IRQ stack switching
      riscv: Move global pointer loading to a macro
      riscv: Implement Shadow Call Stack
      riscv: Use separate IRQ shadow call stacks
      lkdtm: Fix CFI_BACKWARD on RISC-V

Song Shuai (5):
      riscv: kexec: Cleanup riscv_kexec_relocate
      riscv: kexec: Align the kexeced kernel entry
      riscv: kexec: Remove -fPIE for PURGATORY_CFLAGS
      riscv: correct pt_level name via pgtable_l5/4_enabled
      riscv: mm: Update the comment of CONFIG_PAGE_OFFSET

Sunil V L (4):
      RISC-V: ACPI: Enhance acpi_os_ioremap with MMIO remapping
      RISC-V: ACPI: Update the return value of acpi_get_rhct()
      RISC-V: ACPI: RHCT: Add function to get CBO block sizes
      RISC-V: cacheflush: Initialize CBO variables on ACPI systems

Tsukasa OI (1):
      RISC-V: clarify the QEMU workaround in ISA parser

Xiao Wang (1):
      riscv/mm: Fix the comment for swap pte format

 Documentation/riscv/hwprobe.rst                 |   6 +
 arch/riscv/Kconfig                              |   7 +
 arch/riscv/Makefile                             |   4 +
 arch/riscv/configs/defconfig                    |  52 ++++++
 arch/riscv/include/asm/acpi.h                   |   6 +
 arch/riscv/include/asm/asm-prototypes.h         |   1 -
 arch/riscv/include/asm/asm.h                    |  41 +++++
 arch/riscv/include/asm/cpufeature.h             |   1 +
 arch/riscv/include/asm/csr.h                    |   1 +
 arch/riscv/include/asm/errata_list.h            |  14 +-
 arch/riscv/include/asm/hwcap.h                  |  16 ++
 arch/riscv/include/asm/hwprobe.h                |   7 +-
 arch/riscv/include/asm/irq_stack.h              |   3 +
 arch/riscv/include/asm/page.h                   |   4 +-
 arch/riscv/include/asm/pgtable-32.h             |   3 +
 arch/riscv/include/asm/pgtable.h                |   3 +-
 arch/riscv/include/asm/scs.h                    |  54 ++++++
 arch/riscv/include/asm/thread_info.h            |  16 +-
 arch/riscv/include/asm/vdso/processor.h         |   2 +-
 arch/riscv/include/uapi/asm/hwprobe.h           |   2 +
 arch/riscv/kernel/acpi.c                        |  87 ++++++++-
 arch/riscv/kernel/asm-offsets.c                 |   9 +
 arch/riscv/kernel/cpufeature.c                  |  17 +-
 arch/riscv/kernel/entry.S                       | 126 +++++++------
 arch/riscv/kernel/head.S                        |  19 +-
 arch/riscv/kernel/irq.c                         |  56 +++---
 arch/riscv/kernel/kexec_relocate.S              |  52 +++---
 arch/riscv/kernel/setup.c                       |   4 +
 arch/riscv/kernel/smpboot.c                     |   4 +
 arch/riscv/kernel/suspend_entry.S               |   5 +-
 arch/riscv/kernel/sys_riscv.c                   |  46 +++--
 arch/riscv/kernel/traps.c                       |  68 +------
 arch/riscv/kernel/vdso/Makefile                 |   2 +-
 arch/riscv/kernel/vdso/hwprobe.c                |   2 +-
 arch/riscv/mm/cacheflush.c                      |  25 ++-
 arch/riscv/mm/init.c                            |   2 +
 arch/riscv/mm/ptdump.c                          |   3 +
 arch/riscv/purgatory/Makefile                   |   8 +
 drivers/acpi/riscv/rhct.c                       |  93 +++++++++-
 drivers/clocksource/timer-riscv.c               |  17 +-
 drivers/misc/lkdtm/cfi.c                        |  13 +-
 tools/testing/selftests/riscv/hwprobe/Makefile  |   9 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c     | 228 ++++++++++++++++++++++++
 tools/testing/selftests/riscv/hwprobe/hwprobe.c |  64 +++----
 tools/testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 45 files changed, 919 insertions(+), 298 deletions(-)
 create mode 100644 arch/riscv/include/asm/scs.h
 create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
