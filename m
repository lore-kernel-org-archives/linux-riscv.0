Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6E3EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uEUXFXn24byotZh0Yh6MCqQtPHQOj+PS75TBfrPDpYk=; b=I7TIz8DedBLpg+
	uNC96q/6jTPiYc1Yu3NV2a+9CGzhwhGTVRLr2FtAC9KOyZNQoXKQcyQJlmZr5yhXDTefhjcMv4QRb
	h7/i2aLDBimIRo+HS3YlaB46W+NMggF7Oa8oP8ErJa0JzbAWsY2mouDY7umovEULf0fDIpXu3TfHJ
	z17iyjZ0WviMNIIj6zrgnRwwTRN1NvwkCHfrgpuzFFIxJVvhY4++AxprfY6US2TMeAt03Iv9V7Ybl
	pdEBTT0fzaPcURoLPQJREWd7nIxygB6W926bO8K6RrgQj4piZ5M/pcM6PDMwl+FxQG2P56wM6QYT5
	/04Ar4rFXINIOjo9Z0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcUl-00ATby-2c;
	Thu, 03 Aug 2023 17:52:19 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcUi-00ATap-0t
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 17:52:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so879770b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 10:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085134; x=1691689934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaI7fI3M5YP9w6pz8mvrFaji+j10/oJLgbr5Sgiyug8=;
        b=e9tSk2Lz0f+uk2NwCCZSrPkOJwVQN+srfiSADOX8z6U8s0voJ/9V2syfmKv+xT0nTA
         CFMYsmvyoN5Ek5L5nmyycpkdNsYQsyRsZyRzC2tre7ewYkPpJUCPUy9jMrunYpMk9/4Z
         BGMfKUg3rjhemUeKS85ff4NkRy5YwNs05TJASd2Ki5eux1sbpKsdyqk6a/gztlxNnqsF
         yMERiPl6rzZH5OFYJOxIwcw/nALMtmZE/mDNN/4DdfyBlykrY4tZD83KawFWzgH69R0H
         n3tZM7W/jpRK/OBm1gz0ijUuTEfxtXcApljDwqgjMXQDeTixMtMpp9Sf0NGTy3xa0KDL
         uTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085134; x=1691689934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaI7fI3M5YP9w6pz8mvrFaji+j10/oJLgbr5Sgiyug8=;
        b=GITKvlnodmVrqS66gaRVF7Ciztfs2I9v8bbjJNbwLgDGk2boI9zzJgMKOdzq2pMSxk
         qh/vL6OAQqHXwoEPViwl010GEOjL1lY6NnoUfzSWGAdpPIbcqzCgj7pclL+HfAeILuxP
         nfORK8h7kt5RHpDPLBhrvGRWGEiXfHQmt9mZphxLDWCr5BZ2b7UojwXECX5N/CuS2c7H
         9ZWetq1ZbadOcNMz3viZ3BPxoV4evBzvFpfQq/A2UiFStqFg1imtY6f9Vzngwy6NL5H7
         KlmpV6kuZyT56V5Uat8bfk3pB99cCzeJx2oVTIp7VrYXulrFEsbxPk0/pnLIPrzZMwku
         8BNw==
X-Gm-Message-State: ABy/qLZrL49UPbZOE0n11WnG/EQhtiPnFcTch8UOZgV8YgmuT/AHNy3X
	0mBKQ3EGskmG8TgMetykjVTPsA==
X-Google-Smtp-Source: APBJJlH/TxrbX63ED89L3m57EPRl5UCCCRrK2WDITT468OXcUgoqJeG95n4wPLeVLccJHACSpDQ36w==
X-Received: by 2002:a05:6a20:3d03:b0:13f:3d25:d83 with SMTP id y3-20020a056a203d0300b0013f3d250d83mr4614678pzi.19.1691085133387;
        Thu, 03 Aug 2023 10:52:13 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id m6-20020aa78a06000000b006871bea2eeesm145153pfa.34.2023.08.03.10.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:52:13 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 00/21] Add external interrupt controller support
Date: Thu,  3 Aug 2023 23:21:41 +0530
Message-Id: <20230803175202.3173957-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_105216_315232_ED47C344 
X-CRM114-Status: GOOD (  18.11  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for the below ECRs approved by ASWG recently.
1) MADT - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
2) RHCT - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing

The series primarily adds below features.

1) ACPI support for external interrupt controller drivers (IMSIC, APLIC and PLIC).
2) Get CBO block sizes from RHCT.
3) Set timer_can_not_wakeup in timer driver based on the flag in RHCT.

PCI ACPI related functions are migrated from arm64 to common file
so that we don't need to duplicate them for RISC-V.

It uses software node framework to create the fwnode for the interrupt
controllers. This helps in keeping the actual drivers code mostly common
for DT and ACPI.

This series is based on Anup's AIA v7 series. The first 2 ACPICA
patches in this series will be merged via ACPICA release process. PATCH3 is a
fix patch. These patches are included in this series only to enable build.

To test the series,

1) Qemu should be built using the riscv_acpi_b2_v1_plic branch at
https://github.com/vlsunil/qemu.git

2) EDK2 should be built using the instructions at:
https://github.com/tianocore/edk2/blob/master/OvmfPkg/RiscVVirt/README.md

3) Build Linux using this series on top of Anup's AIA v7 series.

Run Qemu:
qemu-system-riscv64 \
 -M virt,pflash0=pflash0,pflash1=pflash1,aia=aplic-imsic \
 -m 2G -smp 8 \
 -serial mon:stdio \
 -device virtio-gpu-pci -full-screen \
 -device qemu-xhci \
 -device usb-kbd \
 -blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd \
 -blockdev node-name=pflash1,driver=file,filename=RISCV_VIRT_VARS.fd \
 -netdev user,id=net0 -device virtio-net-pci,netdev=net0 \
 -kernel arch/riscv/boot/Image \
 -initrd rootfs.cpio \
 -append "root=/dev/ram ro console=ttyS0 rootwait earlycon=uart8250,mmio,0x10000000"

To boot with APLIC only, use aia=aplic.
To boot with PLIC, remove aia= option.

This series is also available in riscv_acpi_b2_v1 brach at
https://github.com/vlsunil/linux.git

Based-on: 20230802150018.327079-1-apatel@ventanamicro.com
(https://lore.kernel.org/lkml/20230802150018.327079-1-apatel@ventanamicro.com/)

Anup Patel (1):
  swnode: Add support to create early during boot

Sunil V L (20):
  ACPICA: MADT: Add RISC-V external interrupt controllers
  ACPICA: RHCT: Add flags, CMO and MMU nodes
  RISC-V: ACPI: Fix acpi_os_ioremap to return iomem address
  RISC-V: ACPI: Enhance acpi_os_ioremap with MMIO remapping
  arm64: PCI: Migrate ACPI related functions to pci-acpi.c
  RISC-V: ACPI: Implement PCI related functionality
  RISC-V: Kconfig: Select ECAM and MCFG
  RISC-V: ACPI: RHCT: Add function to get CBO block sizes
  RISC-V: cacheflush: Initialize CBO variables on ACPI systems
  clocksource/timer-riscv: ACPI: Add timer_cannot_wakeup_cpu
  irqchip/riscv-intc: Use swnode framework to create fwnode
  irqchip/riscv-imsic-early: Add ACPI support
  ACPI: bus: Add acpi_riscv_init function
  ACPI: RISC-V: Create IMSIC platform device
  ACPI: Add APLIC IRQ model for RISC-V
  ACPI: RISC-V: Create APLIC platform device
  irqchip/irq-riscv-aplic-msi: Add ACPI support
  ACPI: bus: Add PLIC IRQ model
  RISC-V: ACPI: Create PLIC platform device
  irqchip/sifive-plic: Add GSI conversion support

 Documentation/riscv/acpi.rst            |  33 ++
 arch/arm64/kernel/pci.c                 | 193 ---------
 arch/riscv/Kconfig                      |   3 +
 arch/riscv/include/asm/acpi.h           |  21 +-
 arch/riscv/kernel/acpi.c                | 120 +++++-
 arch/riscv/mm/cacheflush.c              |  37 +-
 drivers/acpi/bus.c                      |   7 +
 drivers/acpi/riscv/Makefile             |   2 +-
 drivers/acpi/riscv/init.c               |  16 +
 drivers/acpi/riscv/init.h               |   6 +
 drivers/acpi/riscv/irqchip.c            | 507 ++++++++++++++++++++++++
 drivers/acpi/riscv/rhct.c               |  61 +++
 drivers/base/swnode.c                   | 117 +++++-
 drivers/clocksource/timer-riscv.c       |   4 +
 drivers/irqchip/irq-riscv-aplic-msi.c   |  14 +-
 drivers/irqchip/irq-riscv-imsic-early.c |  28 ++
 drivers/irqchip/irq-riscv-imsic-state.c |  33 +-
 drivers/irqchip/irq-riscv-intc.c        |  12 +-
 drivers/irqchip/irq-sifive-plic.c       |  16 +
 drivers/pci/pci-acpi.c                  | 182 +++++++++
 include/acpi/actbl2.h                   |  76 +++-
 include/linux/acpi.h                    |   8 +
 include/linux/property.h                |   3 +
 23 files changed, 1248 insertions(+), 251 deletions(-)
 create mode 100644 drivers/acpi/riscv/init.c
 create mode 100644 drivers/acpi/riscv/init.h
 create mode 100644 drivers/acpi/riscv/irqchip.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
