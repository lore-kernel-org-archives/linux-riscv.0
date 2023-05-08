Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF3BC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M0TrPTCQR7Yt0ynB/Bba663YpGz0C0EuX4R6WlQ/a4I=; b=iw2LR1XqvJQyC/
	TGQf0byTg/vWcd8rNS9c5ZS5UZV7E1S9Q0LFG1XfrDK64e6AIE2JWR9YPcg4NK1WqUN8aIBwEynN7
	QOM2VfFWSPiVZsoWGra+yseD4eh8X9NRBm14TjYshmjWB/VXxUx9zH/6kIe4g/S/5BOG5leIsuZ3d
	HFZjKAgNm9rtWuWQtaNYespQMM7ZEu57ou8Mfuii1obAKoQAtXlQ1XoNdsq1a83PdKqKb56s5LdGc
	/J34eTPmTswG0D0OIIPp2gSiIhH5UvqyO/Qba9vEE6fLMGw2mSOJnZoyqdQAeZRBQDZbu4Cmx8xxd
	AFGon0pZ+ffR9HlRevVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzQN-000Ru9-0M;
	Mon, 08 May 2023 11:53:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzQL-000Rtw-2O
	for linux-riscv@bombadil.infradead.org;
	Mon, 08 May 2023 11:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Z2Y6V/YituSxYMT9MKT/kC3H8mpZSafPKSyryqKuDM4=; b=EDA8NH5sX8EJgOCEb2CBwrdcDl
	QOTjhw4PvME3qKAd+zPxINUe3nc/njy4MXQe5mK1dhWNlYtWz6bCFkN7wJI4YdD8f4439OlvyBgkE
	nrSf66dID+hSlxN/2n9yMyotOZrWtr6KwzKN0V5cxkrG0kS/E82/qFpfdC6fn9pOEqz7D1fAZ2nDH
	tX/CW/gn0200wa4QcOWxxQDbb82fVAx1DzGfDQ/8npZDM+ddNw9D73mNzdL0ursFdeBd3ScVJo9By
	Q5wAxqXdgGffaj4Ni17UTJILPctguYORR5ax6hn+oN70OhZomtLCaDpm8SS3zJJzZZsN0Gcxzqw0g
	tyaXcg9Q==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzQH-0059OB-2H
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:53:00 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-51f6461af24so3052718a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546774; x=1686138774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2Y6V/YituSxYMT9MKT/kC3H8mpZSafPKSyryqKuDM4=;
        b=V3nYn5EL0y1Ojcml3lwOj2QjAW7B9L25T1oC99mYgTjiDU2F/e+SV1rumPYxsFvn2i
         pykgj+wvD0+FHHjlsCQDBaOKA/tQl1oXAlZaWzQjUQc4HrLq+aSkMaeYaOkdPHSmsgOy
         QMG6QPBWu11XcTx7k8V/3DL7eBvxuysW3cQCTPGbF/cp4feril8E6yJTmY1uewsrnQVK
         ZG0ZXSIdWYPZ7oUD0gZEsgMESfvwsSstF6miQxya+tzM4IdKnFpNNc5aNxAsPLAYJNXF
         WkOhoua8NR0VbgYL7CBx4w5ctn9OMlE/2UnkywoGlNQajIqLkzv6w5I/A/h4gRPRmE75
         9Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546774; x=1686138774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2Y6V/YituSxYMT9MKT/kC3H8mpZSafPKSyryqKuDM4=;
        b=Gp0qS/9zUoNmeOc0QUa9hU3Yw6mL4PxYPp7kLKWFc6/qa+GaDE1bK/4HlUirWwFh4P
         C+eHJVUwpMenPbZuhkFXXRp/vIm9H9D3tT8S57I46bvhLZqlqUm4Y02SxFf4sM7ZCyWl
         tJSTCFDb7fKg8zJiugyacMHVL1WM0GM6ekU9FumD0Bi0q++8lT6auuRfHgo6j2gp+pcB
         oYg68x5rJmmPMUsQcuMwT0xpS/dws5d82lHUHnbnCV6L+We+yh2bl+PdM0aUe3zLYSd2
         zvXCHLrFOoLM36I4JXWbwMJFyryEp8Fs02GaW8OqyeQwEl6XBMf2QZs+9H2wN/HfBYW8
         VPFw==
X-Gm-Message-State: AC+VfDx/Q8oDLGDlFsEfqQRiVbKYV2STNQ4Vre6tGuO6R0a2mg2v91OQ
	HrCfp7S89IuOgOetgYznepRucA==
X-Google-Smtp-Source: ACHHUZ4prNAdICwAaSQsV2rt6Xb7oE8D3s56s6rB058xABbz/MUOwr8u2I6R4O2V7x9xTDq54l7HqA==
X-Received: by 2002:a17:902:c947:b0:1ab:2659:b533 with SMTP id i7-20020a170902c94700b001ab2659b533mr12659351pla.3.1683546774038;
        Mon, 08 May 2023 04:52:54 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:52:53 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 00/21] Add basic ACPI support for RISC-V
Date: Mon,  8 May 2023 17:22:16 +0530
Message-Id: <20230508115237.216337-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_125257_853009_E4222B3E 
X-CRM114-Status: GOOD (  18.64  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Nick Desaulniers <ndesaulniers@google.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Herbert Xu <herbert@gondor.apana.org.au>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Len Brown <lenb@kernel.org>
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

Below are two ECRs approved by ASWG.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view


Changes since V4:
	1) Rebased with 6.4-rc1 which has ACPICA patches now.
	2) Split cpufeature.c patch into two by adding patch 2/7 from Conor's series [2]
	3) Updated caching RINTC logic to avoid global.
	4) Added driver patches to enable allmodconfig build at the start of the series.
	5) Updated tags

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

[1] https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/
[2] http://lists.infradead.org/pipermail/linux-riscv/2023-May/031239.html

These changes are available at
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_v5

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

Sunil V L (20):
  platform/surface: Disable for RISC-V
  crypto: hisilicon/qm: Fix to enable build with RISC-V clang
  ACPI: tables: Print RINTC information when MADT is parsed
  ACPI: OSL: Make should_use_kmap() 0 for RISC-V
  RISC-V: Add support to build the ACPI core
  ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
  RISC-V: ACPI: Cache and retrieve the RINTC structure
  drivers/acpi: RISC-V: Add RHCT related code
  RISC-V: smpboot: Create wrapper setup_smp()
  RISC-V: smpboot: Add ACPI support in setup_smp()
  RISC-V: only iterate over possible CPUs in ISA string parser
  RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
  RISC-V: cpu: Enable cpuinfo for ACPI systems
  irqchip/riscv-intc: Add ACPI support
  clocksource/timer-riscv: Refactor riscv_timer_init_dt()
  clocksource/timer-riscv: Add ACPI support
  RISC-V: time.c: Add ACPI support for time_init()
  RISC-V: Add ACPI initialization in setup_arch()
  RISC-V: Enable ACPI in defconfig
  MAINTAINERS: Add entry for drivers/acpi/riscv

 .../admin-guide/kernel-parameters.txt         |   8 +-
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig                            |   5 +
 arch/riscv/configs/defconfig                  |   1 +
 arch/riscv/include/asm/acenv.h                |  11 +
 arch/riscv/include/asm/acpi.h                 |  84 ++++++
 arch/riscv/include/asm/cpu.h                  |   8 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/acpi.c                      | 250 ++++++++++++++++++
 arch/riscv/kernel/cpu.c                       |  30 ++-
 arch/riscv/kernel/cpufeature.c                |  42 ++-
 arch/riscv/kernel/setup.c                     |  11 +-
 arch/riscv/kernel/smpboot.c                   |  77 +++++-
 arch/riscv/kernel/time.c                      |  25 +-
 drivers/acpi/Makefile                         |   2 +
 drivers/acpi/osl.c                            |   2 +-
 drivers/acpi/processor_core.c                 |  29 ++
 drivers/acpi/riscv/Makefile                   |   2 +
 drivers/acpi/riscv/rhct.c                     |  83 ++++++
 drivers/acpi/tables.c                         |  10 +
 drivers/clocksource/timer-riscv.c             |  92 ++++---
 drivers/crypto/hisilicon/qm.c                 |  13 +-
 drivers/irqchip/irq-riscv-intc.c              |  70 +++--
 drivers/platform/surface/aggregator/Kconfig   |   2 +-
 24 files changed, 774 insertions(+), 92 deletions(-)
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
