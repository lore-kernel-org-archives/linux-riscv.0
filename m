Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC81C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4nxUaw3rntWi80PpzyhWKenDtQDIHHFkg3sggL3ZYes=; b=NTWXkrNdbSe1yZ
	db4k/rqGNulFLr5KyK9l3cwdr6/NZ6DGFCMKsr5Udfrm1UWvY4icStYfvQC5mC0ciguRURz4E3Kff
	YDor+vEWvtEo3pXyeQ7XKw9XXgWe845kIlAAqBUZ5O/FZy8nsBzhXERE0kWB/kZTxThtxyqXIDf8G
	YlJxOSTFVj2F+ime7fEQJln+IsxiROIdlk3UUm/8gkuFPx7VE4AJshD3QNgKyMCjBMlfiYT3z67Ew
	EN+Pmb0aytjJlycdzn9CuNpWtYGqVxeMI0Z8s53VG0PmY6KzXJYYdwXIB2MnT5InCCidXkNkpPd4u
	sak6yRvGsqLpwoe5F4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR5c-000za0-1P;
	Mon, 15 May 2023 05:49:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR5Y-000zYy-12
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:49:42 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1aad55244b7so93699455ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129778; x=1686721778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZ99alEe0A23tymHcdv/vfT8nEQiGh2D6cQUBbX+NYU=;
        b=YC+K75o6oTdqYCv/UpwXe9gABJK307bP4yAL6WMj+c0OGsLbwkOJ/0OoSCS/Hfnwsu
         GE65E5xvfgH6srsEB4tPrXUaOlutSgYPtnJ9OnZa6Sfly4dUMHmFpX5971LIfNSqGIdP
         Nv2gRNBDawMmNUWqOTu0rbCvluknVfp9eY5z9QAJU2PYdGv+chHD3N6e9l7aDmV5kzWK
         lSJdnZNxeGgWdSd74Lab4pJ/OB2qUQOL81v5QcFRSIwoBmezMntHOYaPBw740unBgypm
         Fdcxp34uF51fGVRKTaWQuNCk7Asr2mpnyQ189by4GCzwMaNY9+Mm6vBizXEnrYzhR8lK
         UKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129778; x=1686721778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZ99alEe0A23tymHcdv/vfT8nEQiGh2D6cQUBbX+NYU=;
        b=T7BqkwDAsm5OUEa16Iclq8gcxDIikuE6c3ivwWVjXPaCOXu57feG3sacXLlSuuPJNC
         WY/gJL89ZXWzmgCokqKrH4HK1XSHsjkPmqLpt6OhkOwSZnYr/PZ4x687p3RgbFgVR9l6
         YDA6p3kaTeTW3Sa/tlxjpU+fnfpryNmpmDnskF/iSC8g8QOBwtMVw14Q+WasS/l7IOuO
         LIME8oW2SF5Y7W3JXJHPGiBT3tt4vV3fQjvPos8SSlW7Qop/BccCHM2tsJX8dY9Z5joh
         Obve1V5/sLEiLYMST2+8+qFogdxJ/3ryEHSB4Vxui9RUEWgdonSUZr5EubhdpvcsYzR5
         DkKQ==
X-Gm-Message-State: AC+VfDxyTIyc2xEm0QaOcdaDoIp9aFC/+V+Fcy3IlEn0zmu4hbaV0BsG
	GaOpWB6mFAZAxjZGT5OCox0nHQ==
X-Google-Smtp-Source: ACHHUZ66EM/Ffo2wiDqrucRe8wNpu1TreTFryx+X27BDltpTe5DxTsemz+afopAg9iZvWFHQw1Mb4A==
X-Received: by 2002:a17:902:e9d5:b0:1ac:b52e:f3e5 with SMTP id 21-20020a170902e9d500b001acb52ef3e5mr18553911plk.43.1684129777671;
        Sun, 14 May 2023 22:49:37 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:49:37 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 00/21] Add basic ACPI support for RISC-V
Date: Mon, 15 May 2023 11:19:07 +0530
Message-Id: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_224940_386097_8CCE2D52 
X-CRM114-Status: GOOD (  18.15  )
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


Changes since V5:
	1) Reordered commits in the series to avoid intermediate build failure reported by Conor.
	2) Updated hisilicon driver patch as per feedback from Herbert Xu.
	3) Rebased to 6.4-rc2

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
[2] https://lore.kernel.org/linux-riscv/20230504-divisive-unsavory-5a2ff0c3c2d1@spud/

These changes are available at
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_v6

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
  RISC-V: Add ACPI initialization in setup_arch()
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
  RISC-V: Enable ACPI in defconfig
  MAINTAINERS: Add entry for drivers/acpi/riscv

 .../admin-guide/kernel-parameters.txt         |   8 +-
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig                            |   5 +
 arch/riscv/configs/defconfig                  |   1 +
 arch/riscv/include/asm/acenv.h                |  11 +
 arch/riscv/include/asm/acpi.h                 |  84 ++++++
 arch/riscv/include/asm/cpu.h                  |   8 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/acpi.c                      | 251 ++++++++++++++++++
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
 drivers/crypto/hisilicon/qm.c                 |   5 +
 drivers/irqchip/irq-riscv-intc.c              |  70 +++--
 drivers/platform/surface/aggregator/Kconfig   |   2 +-
 24 files changed, 772 insertions(+), 86 deletions(-)
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
