Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA55C47258
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 17:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XzlNhYZ/L6iGY6pcDWaBmvY0HfhyoifH8ssaXHQ2rDs=; b=G3l
	WVvVQvZaR9AWEKDoXQ07Ec0fFN8wBLWxKMKIEQBihduLSIirQ8A2u3SSAxut+9TUwHM+NRsyk+cD4
	vdCSt4WAinnhGS9LS/yT0dOFpNPpsZV1fiUybIe6Bg2f/4IP+XWLAYAmaGZzlSa3WUsq5aF6KaIN1
	SQyV1I3xwoIniBx+/MFyY4IGztbn1BY7g54sLIBTGy8Mx3Wa0sJeYuQ/C05vWQiwNPDk/38N5Fz82
	0Pp7WU4NKXzktpceZLMRx/U+qVrgYsMKt/uuWNCPZnMRCLBzmSIUBL+mt8cSKwo2TdK8iO2VMj0z/
	1o2YoNN0gEPxlfwMuZGIHJVCsM3aM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKvh-003O4E-07;
	Fri, 12 Jan 2024 17:02:49 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKvd-003O35-2w
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 17:02:47 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3bd4f062aa2so1013953b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 09:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705078963; x=1705683763; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZqWdlUl0XQlF086prusk+6ID238UceJ2KU8wzc+35M=;
        b=mod+sp7xPvLja8yDrEJA+9CDlxIuUL+IKN/yCBPdIrOEwniyYqiRUt7atkbvp0zXQV
         X8nQ03Yi0VvPGuqxAD5CRnUmAZEO2s+YgV/L97RC95AIT+wv/2YMqpPm02ExLX2Wldct
         XuXLhPdBAGW/fAFGzS2ELI1AHPkl07t6LcIdJhsK1OYR8U5q4Yf2+yO+p35Cec+OND1X
         dL950CnSAJiUN/PqmI67l5QdbBf9HRelvjGK/1RroqLaIzuBWiRdg+Czo/1QlpnCd9vF
         AVkZsBlSJ5SM3phOkT+nehxWB5L27aqvjDi599v3t5Ykj9GsapJKD9g51zJqD6JqRN6h
         ugdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705078963; x=1705683763;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZqWdlUl0XQlF086prusk+6ID238UceJ2KU8wzc+35M=;
        b=kHkabGsTzNGZyqkxBOcPXMV2w/XOJRpKPCjGuFcv1IIwXjWSB0xtCyMaNo6SW0A+kf
         s87gZ+ezXkGHezeOZ34dvc0PxdrlfEUWZpnR6bBu26gzjigZ9Of1UzBLYUkjldLDNftf
         r7hlEos8DrSc7VKPUKIP8ctzqSp4HKItdMTZA8t+SwZtm94Z+mo4tjB+Oybq44YcgLda
         +LzRElkGlw9OomlDu3uiW00gqm/qWIfeISmY81mXT4/ZcAHGnniRDOtuCo5JxQ80y9tH
         6nROA9uvlCYf+Fb4hlZvzxICIl3nKA7vWQFXvGrUNCxEujrvlazdPeIZ1N3MRFf1KMs3
         BM/Q==
X-Gm-Message-State: AOJu0YwQ4A+l4WCD7/G/7mBx+8sO6HXcUj0L6jIBJC9CqeUpYwSWiYuY
	sz9tCXvmRt/HIfh1cxdK6FavxB7YsJ3acQ==
X-Google-Smtp-Source: AGHT+IFuC+zwXcADuq8BSizVhLjVJBZlQOVtFMCknLiKckAuGQAEOwlTFcPndv1twUuxlAN0zeTb0Q==
X-Received: by 2002:a05:6808:13ca:b0:3bd:61ba:6333 with SMTP id d10-20020a05680813ca00b003bd61ba6333mr500205oiw.13.1705078963541;
        Fri, 12 Jan 2024 09:02:43 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id db14-20020a056808408e00b003bd5aa5397asm472673oib.11.2024.01.12.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 09:02:42 -0800 (PST)
Date: Fri, 12 Jan 2024 09:02:42 -0800 (PST)
X-Google-Original-Date: Fri, 12 Jan 2024 09:02:21 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 6.8 Merge Window, Part 1
CC: linux-kernel@subspace.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-9a7c8503-91d4-4b92-a594-964a5983ecab@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_090245_955588_82929BAE 
X-CRM114-Status: GOOD (  19.60  )
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
Content-Type: multipart/mixed; boundary="===============2903766211896570246=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2903766211896570246==
Content-Type: text/plain

The following changes since commit ed5b7cfd7839f9280a63365c1133482b42d0981f:

  riscv: errata: andes: Probe for IOCP only once in boot stage (2023-12-06 07:18:58 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw1

for you to fetch changes up to cb51bfee7f62a8e26b694f9d84c0041b3e3ccc71:

  Merge patch series "riscv: hwprobe: add Zicond, Zacas and Ztso support" (2024-01-09 20:14:51 -0800)

----------------------------------------------------------------
RISC-V Patches for the 6.8 Merge Window, Part 1

* Support for many new extensions in hwprobe, along with a handful of
  cleanups.
* Various cleanups to our page table handling code, so we alwayse use
  {READ,WRITE}_ONCE.
* Support for the which-cpus flavor of hwprobe.
* Support for XIP kernels has been resurrected.

----------------------------------------------------------------
There will almost certainly be a part 2 next week, I've already got a few
things in for-next and there's some more on the mailing lists to get through.

I think the only odd thing here is that I merged in my fixes branch, which I
don't usually do.  I just ended up not being very productive over the holidays
and missed the last few RCs, so I figured it'd be best to just merge them in
rather than cherry pick them over.

----------------------------------------------------------------
Al Viro (1):
      use linux/export.h rather than asm-generic/export.h

Alexandre Ghiti (8):
      riscv: Use WRITE_ONCE() when setting page table entries
      mm: Introduce pudp/p4dp/pgdp_get() functions
      riscv: mm: Only compile pgtable.c if MMU
      riscv: Use accessors to page table entries instead of direct dereference
      riscv: Check if the code to patch lies in the exit section
      riscv: Fix wrong usage of lm_alias() when splitting a huge linear mapping
      riscv: Fix module_alloc() that did not reset the linear mapping permissions
      riscv: Fix set_direct_map_default_noflush() to reset _PAGE_EXEC

Andrew Jones (4):
      RISC-V: hwprobe: Clarify cpus size parameter
      RISC-V: Move the hwprobe syscall to its own file
      RISC-V: hwprobe: Introduce which-cpus flag
      RISC-V: selftests: Add which-cpus hwprobe test

Ben Dooks (2):
      riscv: fix __user annotation in traps_misaligned.c
      riscv; fix __user annotation in save_v_state()

Clément Léger (25):
      riscv: add ISA extension parsing for Zbc
      riscv: hwprobe: export missing Zbc ISA extension
      riscv: hwprobe: add support for scalar crypto ISA extensions
      dt-bindings: riscv: add scalar crypto ISA extensions description
      riscv: add ISA extension parsing for vector crypto
      riscv: hwprobe: export vector crypto ISA extensions
      dt-bindings: riscv: add vector crypto ISA extensions description
      riscv: add ISA extension parsing for Zfh/Zfh[min]
      riscv: hwprobe: export Zfh[min] ISA extensions
      dt-bindings: riscv: add Zfh[min] ISA extensions description
      riscv: add ISA extension parsing for Zihintntl
      riscv: hwprobe: export Zhintntl ISA extension
      dt-bindings: riscv: add Zihintntl ISA extension description
      riscv: add ISA extension parsing for Zvfh[min]
      riscv: hwprobe: export Zvfh[min] ISA extensions
      dt-bindings: riscv: add Zvfh[min] ISA extension description
      riscv: add ISA extension parsing for Zfa
      riscv: hwprobe: export Zfa ISA extension
      dt-bindings: riscv: add Zfa ISA extension description
      riscv: add ISA extension parsing for Ztso
      riscv: hwprobe: export Ztso ISA extension
      dt-bindings: riscv: add Zacas ISA extension description
      riscv: add ISA extension parsing for Zacas
      riscv: hwprobe: export Zacas ISA extension
      riscv: hwprobe: export Zicond extension

Evan Green (1):
      riscv: add ISA extension parsing for scalar crypto

Frederik Haxel (3):
      riscv: Make XIP bootable again
      riscv: Fixed wrong register in XIP_FIXUP_FLASH_OFFSET macro
      riscv: Allow disabling of BUILTIN_DTB for XIP

Jisheng Zhang (1):
      riscv: Select ARCH_WANTS_NO_INSTR

Michal Simek (1):
      dt-bindings: riscv: cpus: Add AMD MicroBlaze V compatible

Palmer Dabbelt (8):
      Merge patch series "riscv: report more ISA extensions through hwprobe"
      Merge patch series "riscv: Use READ_ONCE()/WRITE_ONCE() for pte accesses"
      RISC-V: Remove the removed single-letter extensions
      Merge patch series "RISC-V: hwprobe: Introduce which-cpus"
      Merge patch series "riscv: CPU operations cleanup"
      Merge remote-tracking branch 'palmer/fixes' into for-next
      Merge patch series "Fix XIP boot and make XIP testable in QEMU"
      Merge patch series "riscv: hwprobe: add Zicond, Zacas and Ztso support"

Samuel Holland (4):
      riscv: Deduplicate code in setup_smp()
      riscv: Remove unused members from struct cpu_operations
      riscv: Use the same CPU operations for all CPUs
      riscv: Remove obsolete rv32_defconfig file

Song Shuai (1):
      riscv: Remove SHADOW_OVERFLOW_STACK_SIZE macro

 Documentation/arch/riscv/hwprobe.rst               | 122 +++++-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/extensions.yaml      | 219 +++++++++++
 arch/arm/include/asm/pgtable.h                     |   2 +
 arch/riscv/Kconfig                                 |   7 +-
 arch/riscv/configs/rv32_defconfig                  | 139 -------
 arch/riscv/include/asm/cpu_ops.h                   |  14 +-
 arch/riscv/include/asm/cpufeature.h                |   4 +-
 arch/riscv/include/asm/hwcap.h                     |  38 +-
 arch/riscv/include/asm/hwprobe.h                   |  24 ++
 arch/riscv/include/asm/kfence.h                    |   4 +-
 arch/riscv/include/asm/pgtable-64.h                |  22 +-
 arch/riscv/include/asm/pgtable.h                   |  33 +-
 arch/riscv/include/asm/sections.h                  |   1 +
 arch/riscv/include/asm/thread_info.h               |   1 -
 arch/riscv/include/asm/xip_fixup.h                 |   2 +-
 arch/riscv/include/uapi/asm/hwprobe.h              |  32 ++
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/cpu-hotplug.c                    |  19 +-
 arch/riscv/kernel/cpu_ops.c                        |  14 +-
 arch/riscv/kernel/cpu_ops_sbi.c                    |  19 -
 arch/riscv/kernel/cpu_ops_spinwait.c               |  11 -
 arch/riscv/kernel/cpufeature.c                     | 195 ++++++++--
 arch/riscv/kernel/efi.c                            |   2 +-
 arch/riscv/kernel/head.S                           |   6 +-
 arch/riscv/kernel/mcount-dyn.S                     |   2 +-
 arch/riscv/kernel/mcount.S                         |   2 +-
 arch/riscv/kernel/module.c                         |   3 +-
 arch/riscv/kernel/patch.c                          |  11 +-
 arch/riscv/kernel/setup.c                          |   1 -
 arch/riscv/kernel/signal.c                         |   2 +-
 arch/riscv/kernel/smp.c                            |   2 +-
 arch/riscv/kernel/smpboot.c                        |  38 +-
 arch/riscv/kernel/sys_hwprobe.c                    | 411 +++++++++++++++++++++
 arch/riscv/kernel/sys_riscv.c                      | 285 --------------
 arch/riscv/kernel/traps_misaligned.c               |   6 +-
 arch/riscv/kernel/vdso/hwprobe.c                   |  86 ++++-
 arch/riscv/kernel/vmlinux-xip.lds.S                |   2 +
 arch/riscv/kernel/vmlinux.lds.S                    |   2 +
 arch/riscv/kvm/mmu.c                               |  22 +-
 arch/riscv/lib/clear_page.S                        |   2 +-
 arch/riscv/lib/tishift.S                           |   2 +-
 arch/riscv/lib/uaccess.S                           |   2 +-
 arch/riscv/mm/Makefile                             |   3 +-
 arch/riscv/mm/fault.c                              |  16 +-
 arch/riscv/mm/hugetlbpage.c                        |  12 +-
 arch/riscv/mm/init.c                               |   8 +-
 arch/riscv/mm/kasan_init.c                         |  45 +--
 arch/riscv/mm/pageattr.c                           |  55 +--
 arch/riscv/mm/pgtable.c                            |  51 ++-
 include/linux/pgtable.h                            |  21 ++
 tools/testing/selftests/riscv/hwprobe/Makefile     |   5 +-
 tools/testing/selftests/riscv/hwprobe/hwprobe.c    |   2 +-
 tools/testing/selftests/riscv/hwprobe/hwprobe.h    |   2 +-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c | 154 ++++++++
 .../testing/selftests/riscv/vector/vstate_prctl.c  |  10 +-
 56 files changed, 1471 insertions(+), 726 deletions(-)
 delete mode 100644 arch/riscv/configs/rv32_defconfig
 create mode 100644 arch/riscv/kernel/sys_hwprobe.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/which-cpus.c


--===============2903766211896570246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2903766211896570246==--
