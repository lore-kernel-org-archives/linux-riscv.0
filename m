Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFD8C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O1kOn4wGOErCIO7GHNAE1drfFYj0G2/3nryrGuwoEAQ=; b=I3KptfP3qZv0aD
	yD2WwY2zeWNvw2l2yHRBX0Ek77xJIIAfHs76VXGOfnm9zkIoGEScmma6z7hv2vfqm/M5wEhIV8HYd
	pChT9q96j/eqJXnlwJKqNs9dLt0GfRRNGVSfa4bkwNyTPdNnjiVauNCfyP2vvNNTyVyl1+UuUd8uX
	xq4PN3edyZggiNJVCNEHNWK/qur+ly3YsrB/JKhY/WOrFiHPSEMdfKSRFMnnLmenpUiZpnVy0+sJo
	JkI/SRnvhQluYtOsLLFX0p9RjksEuLxSvtMnD95SYyntIaz0Myqru2cJL1xcNUBDfnE3e3Kol6t7J
	EHkzWEyDD8I5jUDrAuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXhU8-00000006kSV-11o2;
	Sat, 27 Jul 2024 13:29:20 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXhU5-00000006kS4-0RrS
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jul 2024 13:29:19 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-70943713472so83955a34.2
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jul 2024 06:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722086955; x=1722691755; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUGRsq+vCLngtXGB30eSlNXo6L9MN+Jqn7L0QKGWZmA=;
        b=GLECkTb8KDPoqzRAY77q20cxPmVqnLa4cBS3/EdosM2d3GS1/O/U93tx6LNawl/vWG
         vL8kiOiGYfwbpY718QWLehl7SP69W+uykjVE4Lgz547ZjSgYNpZDuO72f7o4dczBVagu
         QcBEo+q9Lu6NwXNemCFQHvGa+xQg3BbXYCivvc364JbwT0pX1ZsheFih+vx3HgHUIQWh
         aTQ46KS7tYSL0Vt13jDliMJD2X14HgEBh9mpQx09mYeCeEIhJK/USoy9W+dPNFCQBRRO
         7urTaF5hHCRPMmkhJ56BIz+xnuuR6iBcV3gpS21mvVIabByV5yi9j9Mo7ojbonj3selC
         /bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722086955; x=1722691755;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUGRsq+vCLngtXGB30eSlNXo6L9MN+Jqn7L0QKGWZmA=;
        b=PWqUezsWKbphkdHpp8BGefQCVXOHA4SGa4cld3caJtNwhBYEXSdzjCySm1d6Gf14Bd
         IWIgl7N7jM07D9HWs901MdriD5N33hcs5eEtb4zs2Vp2LiplzIALeMR7Q9vA1ocLFz4e
         AfjOFSIzIQH05OGjHkGDGLbJeFn8VkBN+LawYHiBfByHezfvxHesAu7FYR+st+2bDWDn
         4mvMceVA7bTb2dQGggVQ4Z+j8FVYXS2EEXlrbmpTsMTDkYArjzgcJ0JxlJm6ZyfCWDEB
         Rw6Li4AqRxxv5v0MOewS90Bh1t+gsdgsXJ00C8BIGw9VQTbGL2wHZk0lvFZXaF8tW9bu
         TKGQ==
X-Gm-Message-State: AOJu0YzvsncuQFp4JQGrYApZEtGwJFME9L5Kx1zJ4H95TtAYrdwEfbWB
	7aIzIcMafKsH7kFMk8pLePvc8jY6CHNPiten+f7Ftz51PksToIl5s7buQ99JkgEYWueuLweljQT
	K
X-Google-Smtp-Source: AGHT+IGCrx5jxQfpDSBIVvqabtCiff+EZ+vTsuBJY29BgRHQ1sU1FWsAf3VMoslAZWqE87SgkxOpmg==
X-Received: by 2002:a05:6870:d0c3:b0:261:211:9d14 with SMTP id 586e51a60fabf-267d4f26f45mr3171453fac.37.1722086955064;
        Sat, 27 Jul 2024 06:29:15 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f816da19sm3806708a12.32.2024.07.27.06.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 06:29:14 -0700 (PDT)
Date: Sat, 27 Jul 2024 06:29:14 -0700 (PDT)
X-Google-Original-Date: Sat, 27 Jul 2024 06:28:52 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.11 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-d1533559-79a3-401a-8eee-a743b80b3bb2@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_062917_360792_4CE4B203 
X-CRM114-Status: GOOD (  13.52  )
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

merged tag 'riscv-for-linus-6.11-mw1'
The following changes since commit f557af081de6b45a25e27d633b4d8d2dbc2f428e:

  Merge tag 'riscv-for-linus-6.11-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2024-07-20 09:11:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-mw2

for you to fetch changes up to 52420e483d3e1562f11a208d3c540b27b5e5dbf4:

  RISC-V: Provide the frequency of time CSR via hwprobe (2024-07-26 05:50:51 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.11 Merge Window, Part 2

* Support for NUMA (via SRAT and SLIT), console output (via SPCR), and
  cache info (via PPTT) on ACPI-based systems.
* The trap entry/exit code no longer breaks the return address stack
  predictor on many systems, which results in an improvement to trap
  latency.
* Support for HAVE_ARCH_STACKLEAK.
* The sv39 linear map has been extended to support 128GiB mappings.
* The frequency of the mtime CSR is now visible via hwprobe.

----------------------------------------------------------------
Sorry this one's late again, I'd accidentally picked up a patch that went
through another tree and didn't notice until yesterday morning.  There should
be no post-merge code chages, but I wanted to give it a day for the testers
just in case.

----------------------------------------------------------------
Anton Blanchard (1):
      riscv: Improve exception and system call latency

Charlie Jenkins (4):
      riscv: Extend cpufeature.c to detect vendor extensions
      riscv: Add vendor extensions to /proc/cpuinfo
      riscv: Introduce vendor variants of extension helpers
      riscv: cpufeature: Extract common elements from extension checking

Conor Dooley (2):
      RISC-V: hwprobe: sort EXT_KEY()s in hwprobe_isa_ext0() alphabetically
      RISC-V: run savedefconfig for defconfig

Haibo Xu (4):
      ACPI: RISCV: Add NUMA support based on SRAT and SLIT
      ACPI: NUMA: Add handler for SRAT RINTC affinity structure
      ACPI: NUMA: change the ACPI_NUMA to a hidden option
      ACPI: NUMA: replace pr_info with pr_debug in arch_acpi_numa_init

Jinjie Ruan (1):
      trace: riscv: Remove deprecated kprobe on ftrace support

Jisheng Zhang (2):
      riscv: boot: remove duplicated targets line
      riscv: enable HAVE_ARCH_STACKLEAK

Palmer Dabbelt (5):
      Merge patch series "Add ACPI NUMA support for RISC-V"
      Merge patch series "riscv: Separate vendor extensions from standard extensions"
      Merge patch "Enable SPCR table for console output on RISC-V"
      Merge patch series "RISC-V: Select ACPI PPTT drivers"
      RISC-V: Provide the frequency of time CSR via hwprobe

Sia Jee Heng (1):
      RISC-V: ACPI: Enable SPCR table for console output on RISC-V

Stuart Menefy (1):
      riscv: Extend sv39 linear mapping max size to 128G

Yunhui Cui (3):
      riscv: cacheinfo: remove the useless input parameter (node) of ci_leaf_init()
      riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
      RISC-V: Select ACPI PPTT drivers

Zhongqiu Han (1):
      riscv: signal: Remove unlikely() from WARN_ON() condition

 Documentation/arch/riscv/hwprobe.rst             |   2 +
 Documentation/arch/riscv/vm-layout.rst           |  11 +-
 arch/arm64/Kconfig                               |   1 -
 arch/loongarch/Kconfig                           |   1 -
 arch/riscv/Kconfig                               |   6 +-
 arch/riscv/Kconfig.vendor                        |  19 +++
 arch/riscv/boot/Makefile                         |   1 -
 arch/riscv/configs/defconfig                     |  26 ++---
 arch/riscv/errata/andes/errata.c                 |   3 +
 arch/riscv/errata/sifive/errata.c                |   3 +
 arch/riscv/errata/thead/errata.c                 |   3 +
 arch/riscv/include/asm/acpi.h                    |  15 ++-
 arch/riscv/include/asm/cpufeature.h              | 103 ++++++++++------
 arch/riscv/include/asm/hwcap.h                   |  25 ++--
 arch/riscv/include/asm/hwprobe.h                 |   2 +-
 arch/riscv/include/asm/page.h                    |   2 +-
 arch/riscv/include/asm/thread_info.h             |   1 +
 arch/riscv/include/asm/vendor_extensions.h       | 104 +++++++++++++++++
 arch/riscv/include/asm/vendor_extensions/andes.h |  19 +++
 arch/riscv/include/uapi/asm/hwprobe.h            |   1 +
 arch/riscv/kernel/Makefile                       |   3 +
 arch/riscv/kernel/acpi.c                         |  17 ++-
 arch/riscv/kernel/acpi_numa.c                    | 131 +++++++++++++++++++++
 arch/riscv/kernel/cacheinfo.c                    |  35 ++++--
 arch/riscv/kernel/cpu.c                          |  35 +++++-
 arch/riscv/kernel/cpufeature.c                   | 143 ++++++++++++++++-------
 arch/riscv/kernel/entry.S                        |  21 ++--
 arch/riscv/kernel/probes/Makefile                |   1 -
 arch/riscv/kernel/probes/ftrace.c                |  65 -----------
 arch/riscv/kernel/setup.c                        |   4 +-
 arch/riscv/kernel/signal.c                       |   2 +-
 arch/riscv/kernel/smpboot.c                      |   2 -
 arch/riscv/kernel/stacktrace.c                   |   4 +-
 arch/riscv/kernel/sys_hwprobe.c                  |  48 ++++----
 arch/riscv/kernel/vendor_extensions.c            |  56 +++++++++
 arch/riscv/kernel/vendor_extensions/Makefile     |   3 +
 arch/riscv/kernel/vendor_extensions/andes.c      |  18 +++
 drivers/acpi/numa/Kconfig                        |   5 +-
 drivers/acpi/numa/srat.c                         |  32 ++++-
 drivers/base/arch_numa.c                         |   2 +-
 drivers/firmware/efi/libstub/Makefile            |   3 +-
 drivers/perf/riscv_pmu_sbi.c                     |  11 +-
 include/linux/acpi.h                             |   6 +
 43 files changed, 750 insertions(+), 245 deletions(-)
 create mode 100644 arch/riscv/Kconfig.vendor
 create mode 100644 arch/riscv/include/asm/vendor_extensions.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/andes.h
 create mode 100644 arch/riscv/kernel/acpi_numa.c
 delete mode 100644 arch/riscv/kernel/probes/ftrace.c
 create mode 100644 arch/riscv/kernel/vendor_extensions.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/Makefile
 create mode 100644 arch/riscv/kernel/vendor_extensions/andes.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
