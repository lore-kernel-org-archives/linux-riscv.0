Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57492C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wa1rySYs63x6/mBgIdZwiVbRkMltxJOnz6d8aLTq8Zk=; b=poSUXBNr5jVCQZ
	BR4k76xhGYfQ5j/eKyPeVnYLIzspt4b1Dzj6dVXGCW9KO8MaXInVpu9RbNy8BcLB76FhtARLKvnfB
	vNztlx+gycvpp/2n/SoR59PkX6rqVNX3n81x8sfACzIdkxJa/yqDsA/ghBlIwT8cyw4mnTDrOmtVo
	TpWYQ4A4TiRzBEz21mRXDzpU4OKYCFQUmk6+WdhIJJ5Dh/NL15hOikqVVdLTB/bYsP82QlDwz6Ksn
	XAAmuoB/S/RPHD1NcFQEw6kgfemRa2oj9Ji2ET7U2fidS6O1gGJLvvWPBRJLTm6scd19M4HBaAIB4
	ag89e4tsgPKz+3hH41JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlH3-002Tm9-2L;
	Tue, 04 Apr 2023 18:20:53 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlGz-002Tli-2r
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:20:51 +0000
Received: by mail-pg1-x535.google.com with SMTP id y19so20216732pgk.5
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8QsXaZPHEAsPoW0flCc0TOSQrLjDGzZjDEO/EvIfsw=;
        b=mpiCxWKuWoSzlX40nQKfKAaOH87Uuf9nu3eXg7EdGg557PNonvadIn6JVXiN/uM9Wy
         phW/msttEsKDnZh1vVFo1bN9XZtZKEUa4wk/18xxEDCarICge5UwlYnQAxJzm03rXFSI
         DJBprbDLPojSOI3lW4sui5GKgMuD72aL4oaagoTPk8faAqerVaiDZ6mu538E2hh9oqF7
         0oK8ht9mRNdYe4sIkdaSTzl6G8Fs9E31epNQi3UPNlN8wJObdPa2hsumipAUSGbg3eKo
         jvrjjdXwkTaMmkoq5VnpbS/FL/eFSGqJVfftsC93axZyll8/J5G4pPsWk+JEQJidr9Ym
         fv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8QsXaZPHEAsPoW0flCc0TOSQrLjDGzZjDEO/EvIfsw=;
        b=GrQM+hwX8Hf0aCzN73zZ3PsLcL2MqGQAQ29LHD1OSMQtTKsqmf89W4Pq/v7ITlLCr4
         vJpfj4XQ0TwggD2653s7jMaROoN6jbjRmGA56hL77S/jBVrjSyiGMG0IofXVbI4angNU
         pGHE0JFh/PYRSEcDG03+UZ7xnvZGKU2rU65iEMI0GUivNpqwvqmLyV3w4CYePy6vbrdR
         6Xp9qrsQlmxxSakDEDzqYFlW2XglCnLv1qPFJbQ1xKAjazrxX7uIUslV+JellCxo0k9s
         CeMDh2kkoQNzoPAGY3t1Ks3MG1yqtPHuku08X6A5ac+7PCHynAfyQoY1jMDIOizlvMPX
         awBQ==
X-Gm-Message-State: AAQBX9d94ArJTsgOzf80GqyMzo+lVqG+MRv2U7fF98yQmDpRYDePWvw9
	0lESB+ody8+VkU3iBpJmPwSDZQ==
X-Google-Smtp-Source: AKy350ZueCB8uPytSB434Qm4r5EaO+Vwyt0FglDeSJ0S0BeLW50LyieSkwwAgxgd1F0EJCZ+ZvbMfw==
X-Received: by 2002:a62:1d41:0:b0:62a:4503:53b8 with SMTP id d62-20020a621d41000000b0062a450353b8mr3341665pfd.1.1680632447664;
        Tue, 04 Apr 2023 11:20:47 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:20:47 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 00/23] Add basic ACPI support for RISC-V
Date: Tue,  4 Apr 2023 23:50:14 +0530
Message-Id: <20230404182037.863533-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112049_951847_FDE3416F 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series enables the basic ACPI infrastructure for RISC-V.
Supporting external interrupt controllers is in progress and hence it is
tested using poll based HVC SBI console and RAM disk.

The first patch in this series is one of the patch from Jisheng's
series [1] which is not merged yet. This patch is required to support
ACPI since efi_init() which gets called before sbi_init() can enable
static branches and hits a panic.

Patch 2 and 3 are ACPICA patches which are merged now into acpica
but not yet pulled into the linux sources. They exist in this patch set
as reference. This series can be merged only after those ACPICA patches
are pulled into linux.

Below are two ECRs approved by ASWG.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view


Based-on: 20230328035223.1480939-1-apatel@ventanamicro.com
(https://lore.kernel.org/lkml/20230328035223.1480939-1-apatel@ventanamicro.com/)

[1] https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/

Changes since V3:
	1) Added two more driver patches to workaround allmodconfig build failure.
	2) Separated removal of riscv_of_processor_hartid() to a different patch.
	3) Addressed Conor's feedback.
	4) Rebased to v6.3-rc5 and added latest tags

Changes since V2:
	1) Dropped ACPI_PROCESSOR patch.
	2) Added new patch to print debug info of RISC-V INTC in MADT
	3) Addressed other comments from Drew.
	4) Rebased and updated tags

Changes since V1:
	1) Dropped PCI changes and instead added dummy interfaces just to enable
	   building ACPI core when CONFIG_PCI is enabled. Actual PCI changes will
	   be added in future along with external interrupt controller support
	   in ACPI.
	2) Squashed couple of patches so that new code added gets built in each
	   commit.
	3) Fixed the missing wake_cpu code in timer refactor patch as pointed by
	   Conor
	4) Fixed an issue with SMP disabled.
	5) Addressed other comments from Conor.
	6) Updated documentation patch as per feedback from Sanjaya.
	7) Fixed W=1 and checkpatch --strict issues.
	8) Added ACK/RB tags

These changes are available at
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V4

Testing:
1) Build latest Qemu 

2) Build EDK2 as per instructions in
https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support

3) Build Linux after enabling SBI HVC and SBI earlycon
CONFIG_RISCV_SBI_V01=y
CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
CONFIG_HVC_RISCV_SBI=y

4) Build buildroot.

Run with below command.
qemu-system-riscv64   -nographic \
-drive file=Build/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \
-machine virt -smp 16 -m 2G \
-kernel arch/riscv/boot/Image \
-initrd buildroot/output/images/rootfs.cpio \
-append "root=/dev/ram ro console=hvc0 earlycon=sbi"


Jisheng Zhang (1):
  riscv: move sbi_init() earlier before jump_label_init()

Sunil V L (22):
  ACPICA: MADT: Add RISC-V INTC interrupt controller
  ACPICA: Add structure definitions for RISC-V RHCT
  ACPI: tables: Print RINTC information when MADT is parsed
  ACPI: OSL: Make should_use_kmap() 0 for RISC-V
  RISC-V: Add support to build the ACPI core
  ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
  RISC-V: ACPI: Cache and retrieve the RINTC structure
  drivers/acpi: RISC-V: Add RHCT related code
  RISC-V: smpboot: Create wrapper smp_setup()
  RISC-V: smpboot: Add ACPI support in smp_setup()
  RISC-V: cpufeature: Avoid calling riscv_of_processor_hartid()
  RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
  RISC-V: cpu: Enable cpuinfo for ACPI systems
  irqchip/riscv-intc: Add ACPI support
  clocksource/timer-riscv: Refactor riscv_timer_init_dt()
  clocksource/timer-riscv: Add ACPI support
  RISC-V: time.c: Add ACPI support for time_init()
  RISC-V: Add ACPI initialization in setup_arch()
  RISC-V: Enable ACPI in defconfig
  MAINTAINERS: Add entry for drivers/acpi/riscv
  platform/surface: Disable for RISC-V
  crypto: hisilicon/qm: Workaround to enable build with RISC-V clang

 .../admin-guide/kernel-parameters.txt         |   8 +-
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig                            |   5 +
 arch/riscv/configs/defconfig                  |   1 +
 arch/riscv/include/asm/acenv.h                |  11 +
 arch/riscv/include/asm/acpi.h                 |  77 +++++
 arch/riscv/include/asm/cpu.h                  |   8 +
 arch/riscv/kernel/Makefile                    |   2 +
 arch/riscv/kernel/acpi.c                      | 266 ++++++++++++++++++
 arch/riscv/kernel/cpu.c                       |  30 +-
 arch/riscv/kernel/cpufeature.c                |  44 ++-
 arch/riscv/kernel/setup.c                     |  27 +-
 arch/riscv/kernel/smpboot.c                   |  77 ++++-
 arch/riscv/kernel/time.c                      |  25 +-
 drivers/acpi/Makefile                         |   2 +
 drivers/acpi/osl.c                            |   2 +-
 drivers/acpi/processor_core.c                 |  29 ++
 drivers/acpi/riscv/Makefile                   |   2 +
 drivers/acpi/riscv/rhct.c                     |  83 ++++++
 drivers/acpi/tables.c                         |  10 +
 drivers/clocksource/timer-riscv.c             |  92 +++---
 drivers/crypto/hisilicon/qm.c                 |  13 +-
 drivers/irqchip/irq-riscv-intc.c              |  74 ++++-
 drivers/platform/surface/aggregator/Kconfig   |   2 +-
 include/acpi/actbl2.h                         |  69 ++++-
 25 files changed, 867 insertions(+), 100 deletions(-)
 create mode 100644 arch/riscv/include/asm/acenv.h
 create mode 100644 arch/riscv/include/asm/acpi.h
 create mode 100644 arch/riscv/include/asm/cpu.h
 create mode 100644 arch/riscv/kernel/acpi.c
 create mode 100644 drivers/acpi/riscv/Makefile
 create mode 100644 drivers/acpi/riscv/rhct.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
