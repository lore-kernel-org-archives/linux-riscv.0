Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929D2C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ih0yGYdeBy4g7iERM55gy01ngqv3fFFJxouY5swenfM=; b=pxNj4FFN/EfIYE
	YAu47kj3Yn2MZm7PsXx6NpC8bRkGgePgggrsACAhNPCpnFleAA5Gp3/rmct4xeCTOcMO+JRP67UYK
	+z0NFKVKhEZixkCoAam0jPSshYlxZXdldAd/UcCfT9KUQSjiKyIGQlCwNwJkLjb4qPT/jfL+/KZyB
	kEGCo8FGOCo++JjUUepqf3s6QhiKoRuavez8oL5AC4X6JY+lE2yxltjsju3iv6lKITDJLgA8VdaKJ
	ZOwQ5Cq9iNm3ZDdtcoZ/nLU04iTYCzh9uS302mZzLfYSvxE6eynl1bQqK5nENztw+6eouViJ8qR00
	/n2lPMCPMCsB15qm/M0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naKLW-006aMr-AA; Fri, 01 Apr 2022 16:41:58 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naKLT-006aKK-Pf
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 16:41:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so5770710pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=7f6j0z1BP2YZI8+G8t2I0PO2IUnoEVp389XAIMLoiBI=;
 b=B5MLssde5G3aFHKLWrw2bfzfhMbch92H4uyalWdGGwDvxnn6VjCCTrYcJz8K9TljT9
 9uqV4/v7fPjUUP9dVZXbJtj3JJIsGQO0+819dndJ9iV7yC9M7s32U9e6i++crdEJfbHT
 e3Gaeet+Ezf5YVxpgpWtvqT0N/U5AqOcVHpxFpx5UR4IWe7061cI0WExmozTbV8FkT9F
 PC6IfbS8wLaxp7fgLk/EeZVvVMEUJqswxpQEkY6d4oz2nIDDijdB0Aqulgdl+tnUOaPr
 ihSLtsdeVGolXwA+l2EBKScB72d2U+Vv8T01fe8gAbFUd+Qp9xK75Ub+zCPpkoWUxeOs
 L9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=7f6j0z1BP2YZI8+G8t2I0PO2IUnoEVp389XAIMLoiBI=;
 b=vxuDHKNnxiGiioax3sfObDPYeL5hskpLMG0kELKSo+97oBiyKaB6ZSo3E96w+5Y3cY
 kJwXAs/bFY2g36ZXMEZEh6Rs0fsJDgTEegKO1/KvbTeIHWrR+zEctDsd7ru/9ESmINie
 /iA5dmZcH1Uw4ZKwxnGb7PHs4/2NWoFVyCnRkA1DMqRMqgToeEBt0vFzatAw1QfyTK0L
 UyVGp98Orw3kGLAByB2sf+eofUvliffc9tiLB+7iSDndUSnqPBbcJKwC/SJGf/uEpYHD
 PMwDz5KeHJOshjdToj6aXQiWbOPZ5xUkllnsdVMYYdOBPdxyi2VkC5adeBAYmGWmBztU
 vjjA==
X-Gm-Message-State: AOAM531Te7JBXejjxvX09KUD4M/+zvq+0LT7+xhorvckCKpaTxwE/fwA
 yFZOAjAhnPdMmyAL8rVMP5ih67DuEWwDmw==
X-Google-Smtp-Source: ABdhPJxudcPgn55zLsGqr1hRo6Bevhqgl+MiYPI62e8CER1amNlGuSkHdMOGj+0wuEtAiqFtl8MIOQ==
X-Received: by 2002:a17:90a:205:b0:1c6:5b78:5c5 with SMTP id
 c5-20020a17090a020500b001c65b7805c5mr12729560pjc.54.1648831310254; 
 Fri, 01 Apr 2022 09:41:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 j16-20020a63e750000000b00373598b8cbfsm2862869pgk.74.2022.04.01.09.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 09:41:50 -0700 (PDT)
Date: Fri, 01 Apr 2022 09:41:50 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Apr 2022 09:41:27 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.18 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e0c01ab7-020f-4264-91da-0852f7e89534@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_094155_858403_35C94329 
X-CRM114-Status: GOOD (  15.97  )
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

merged tag 'riscv-for-linus-5.18-mw0'
The following changes since commit aa5b537b0ecc16992577b013f11112d54c7ce869:

  Merge tag 'riscv-for-linus-5.18-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-03-25 10:11:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-mw1

for you to fetch changes up to 1464d00b27b2e29a5556f6a4099cf083886e883f:

  RISC-V: K210 defconfigs: Drop redundant MEMBARRIER=n (2022-03-31 17:19:27 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.18 Merge Window, Part 2

This has a handful of new features

* Support for CURRENT_STACK_POINTER, which enables some extra stack
  debugging for HARDENED_USERCOPY.
* Support for the new SBI CPU idle extension, via cpuidle and suspend
  drivers.
* Profiling has been enabled in the defconfigs.

but is mostly fixes and cleanups.

----------------------------------------------------------------
There are no merge conflicts.  I'm getting on allyesconfig warning in
drivers/misc/habanalabs, but that appears to just be a 32-bit problem (it's
happening on 32-bit x86 as well).  I've sent a patch for that, but I doubt it's
a RISC-V issue so I'm sending this at the same time.

With that patch I get clean build that boot after my test merge.

----------------------------------------------------------------
Anup Patel (9):
      RISC-V: Enable CPU_IDLE drivers
      RISC-V: Rename relocate() and make it global
      RISC-V: Add arch functions for non-retentive suspend entry/exit
      RISC-V: Add SBI HSM suspend related defines
      cpuidle: Factor-out power domain related code from PSCI domain driver
      cpuidle: Add RISC-V SBI CPU idle driver
      dt-bindings: Add common bindings for ARM and RISC-V idle states
      RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine
      RISC-V: Enable profiling by default

Atish Patra (2):
      RISC-V: Fix a comment typo in riscv_of_parent_hartid()
      RISC-V: Declare per cpu boot data as static

Bagas Sanjaya (1):
      Documentation: riscv: remove non-existent directory from table of contents

Dmitry Vyukov (1):
      riscv: Increase stack size under KASAN

Fangrui Song (1):
      riscv module: remove (NOLOAD)

Kees Cook (1):
      riscv: Rename "sp_in_global" to "current_stack_pointer"

Nikita Shubin (1):
      riscv: Fix fill_callchain return value

Niklas Cassel (1):
      riscv: dts: canaan: Fix SPI3 bus width

Palmer Dabbelt (3):
      RISC-V CPU Idle Support
      RISC-V: defconfig: Drop redundant SBI HVC and earlycon
      RISC-V: K210 defconfigs: Drop redundant MEMBARRIER=n

Randy Dunlap (1):
      riscv: cpu.c: don't use kernel-doc markers for comments

Wu Caize (1):
      RISC-V: module: fix apply_r_riscv_rcv_branch_rela typo

 .../bindings/arm/msm/qcom,idle-state.txt           |   2 +-
 Documentation/devicetree/bindings/arm/psci.yaml    |   2 +-
 .../bindings/{arm => cpu}/idle-states.yaml         | 228 +++++++-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +
 Documentation/riscv/index.rst                      |   1 -
 MAINTAINERS                                        |  14 +
 arch/riscv/Kconfig                                 |   8 +
 arch/riscv/Kconfig.socs                            |   3 +
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts     |   2 +
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts    |   2 +
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts      |   2 +
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts    |   2 +
 arch/riscv/configs/defconfig                       |   5 +-
 arch/riscv/configs/nommu_k210_defconfig            |   1 -
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |   1 -
 arch/riscv/configs/nommu_virt_defconfig            |   1 -
 arch/riscv/configs/rv32_defconfig                  |   5 +-
 arch/riscv/include/asm/asm.h                       |  26 +
 arch/riscv/include/asm/cpuidle.h                   |  24 +
 arch/riscv/include/asm/current.h                   |   2 +
 arch/riscv/include/asm/module.lds.h                |   6 +-
 arch/riscv/include/asm/suspend.h                   |  36 ++
 arch/riscv/include/asm/thread_info.h               |  10 +-
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/asm-offsets.c                    |   3 +
 arch/riscv/kernel/cpu.c                            |   6 +-
 arch/riscv/kernel/cpu_ops_sbi.c                    |   2 +-
 arch/riscv/kernel/head.S                           |  27 +-
 arch/riscv/kernel/module.c                         |   4 +-
 arch/riscv/kernel/perf_callchain.c                 |   2 +-
 arch/riscv/kernel/process.c                        |   3 +-
 arch/riscv/kernel/stacktrace.c                     |   6 +-
 arch/riscv/kernel/suspend.c                        |  87 +++
 arch/riscv/kernel/suspend_entry.S                  | 124 ++++
 drivers/cpuidle/Kconfig                            |   9 +
 drivers/cpuidle/Kconfig.arm                        |   1 +
 drivers/cpuidle/Kconfig.riscv                      |  15 +
 drivers/cpuidle/Makefile                           |   5 +
 drivers/cpuidle/cpuidle-psci-domain.c              | 138 +----
 drivers/cpuidle/cpuidle-psci.h                     |  15 +-
 drivers/cpuidle/cpuidle-riscv-sbi.c                | 627 +++++++++++++++++++++
 drivers/cpuidle/dt_idle_genpd.c                    | 178 ++++++
 drivers/cpuidle/dt_idle_genpd.h                    |  50 ++
 43 files changed, 1491 insertions(+), 202 deletions(-)
 rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
 create mode 100644 arch/riscv/include/asm/cpuidle.h
 create mode 100644 arch/riscv/include/asm/suspend.h
 create mode 100644 arch/riscv/kernel/suspend.c
 create mode 100644 arch/riscv/kernel/suspend_entry.S
 create mode 100644 drivers/cpuidle/Kconfig.riscv
 create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.c
 create mode 100644 drivers/cpuidle/dt_idle_genpd.c
 create mode 100644 drivers/cpuidle/dt_idle_genpd.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
