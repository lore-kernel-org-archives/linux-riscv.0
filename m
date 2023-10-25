Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9A8C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ag8FodBDMj16QwZPwt4kP7mkvU4IsjTcQihXIMQPMYM=; b=VtD4xUQUWWGcUt
	VPASYzd87GYfZlsFNYfM8ATA2w6iXD7LC81v9l6boNB/Z86Iqj6Fosw0LatZfu9kMgLzwR1J3h+9T
	Yt2U+4me5lIdLpdXq36lDBoSb3q8rmMW2g+tXyvRdR7+22BA7uLU+eDItv7dT1jDujXNos5xRmKSP
	sNrL8VtFUCanQ9aaVblRGyrq5lvEKmV24G2dNfB689TJ6xtsIM9VbAmEGULq9h1Vx480vi7E1mArg
	tTYbLnMkPbHt8KyEf+7FtoRGEHlj+Qx/awKC6soQtm4wC5JFzrmmGtwqyFGuqK/OHhlY+M7rapYAg
	j+b/4kbrkThbDhCl+KxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQJ-00D2Ve-2i;
	Wed, 25 Oct 2023 20:24:15 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQF-00D2Tx-38
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:24:13 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-577fff1cae6so96453a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265449; x=1698870249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F9/pedB262IMNHEh1PUtoWlFeNdn65+nq0ZZR6F2re8=;
        b=JfnEzr/dEuhLnaHLSZ11jj3pfm9j99hZ7rcVD5TW5C0SSsAEeDrOrjaNUyUwnx1tVm
         VxI2P02ltDwjvaYNW6wPkvrtUWhJeMihw/TT+Cw/eQOua3Ys3abQDbG8eFXSH5LPx05O
         lcyzvqqIeQGwG096EK6RxT7VbL6GdJ+sKXMqJ8HhqTPHVWWM1hLD/mGf/MOU6zrl4FDb
         gLDDIGZyxuDp2xgr64SpFRuLYN2m3pSAjnK0cQ3ZcQfpFZNyw+ImcOyO/19Be4hecIln
         F86luJApG0CaKXzCCD/N8lx1cecZKs3z3HIp06RBVAao5TizaeH1GRKn41XVNFJyi3WW
         2r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265449; x=1698870249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9/pedB262IMNHEh1PUtoWlFeNdn65+nq0ZZR6F2re8=;
        b=JvAKFduJgOZ7hwf30fw+fTMrZlRPRsMbncOqh3A8tNsVV6878RBT2XaXEoSwjDeepX
         clSA9EekBisTyqf7ZAwlxIN23MsXg3KYu/+Gql9MlpfeMoP2yMNPmHJXwC3n+AJmQBzh
         HRLPzO7HGq7ifzFqmxruDe1g8gKb4e/cnl9huTQ9yASiXc4FbfcFmT3nUP/NB6wpDzTb
         pbcUCGWIYT9FoPwvWeJstkwH5wPTctW02boS/wLQW0yAw2Gu0yF0bwhgCdmImF+Lzxr7
         DqU1xJAU+5bwYXCabO3hEworqCHs74guC8Cyo+icOTz+oRRndxfQQa65cezZswsw14Wm
         WkNA==
X-Gm-Message-State: AOJu0Yw51JShYs4UPA0kh6iGDPWI8NNYW+BjawD5y6SvK0EsKbMcWbVn
	3Sp28363Lqt8bn2I38G7ypfKXA==
X-Google-Smtp-Source: AGHT+IEV4o/13i3hZesUJvr2asiwuxud0jha6gl4OJB79xQ7DR2BCPeSNSC6qZTwPjauiylzsIcCjw==
X-Received: by 2002:a05:6a20:8e12:b0:14e:2208:d62f with SMTP id y18-20020a056a208e1200b0014e2208d62fmr801359pzj.22.1698265448502;
        Wed, 25 Oct 2023 13:24:08 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:24:08 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 00/21] RISC-V: ACPI: Add external interrupt controller support 
Date: Thu, 26 Oct 2023 01:53:23 +0530
Message-Id: <20231025202344.581132-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132412_037739_1E706059 
X-CRM114-Status: GOOD (  16.11  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for the below ECR approved by ASWG.
1) MADT - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing

The series primarily enables irqchip drivers for RISC-V ACPI based
platforms.

In addition, PCI ACPI related functions are migrated from arm64 to
common file so that we don't need to duplicate them for RISC-V.

On RISC-V platforms, apart from root irqchips which provide local
interrupts and IPI, all other interrupt controllers are probed late
during boot. Hence, the drivers for the devices connected to these
interrupt controllers which are probed late, should also support
deferred probe. While ACPI platform devices/drivers seem to support
deferred probe since they use acpi_irq_get(), the PNP devices and the
PCI INTx expect GSIs are registered early. So, patches are required
to enable few essential drivers to support deferred probe. To minimize
the impact, a new CONFIG option is introduced which can be enabled only
by the architecture like RISC-V which supports deferred irqchip probe.

This series is based on Anup's AIA v11 series. Since Anup's AIA v11 is
not merged yet and first time introducing deferred probe, this series is
still kept as RFC. Looking forward for the feedback!

Changes since RFC v1:
	1) Abandoned swnode approach as per Marc's feedback.
	2) To cope up with AIA series changes which changed irqchip driver
	   probe from core_initcall() to platform_driver, added patches
	   to support deferred probing.
	3) Rebased on top of Anup's AIA v11 and added tags.

To test the series,

1) Qemu should be built using the riscv_acpi_b2_v4 branch at
https://github.com/vlsunil/qemu.git

2) EDK2 should be built using the instructions at:
https://github.com/tianocore/edk2/blob/master/OvmfPkg/RiscVVirt/README.md

3) Build Linux using this series on top of Anup's AIA v11 series.

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

This series is also available in acpi_b2_v2_riscv_aia_v11 branch at
https://github.com/vlsunil/linux.git

Based-on: 20231023172800.315343-1-apatel@ventanamicro.com
(https://lore.kernel.org/lkml/20231023172800.315343-1-apatel@ventanamicro.com/)

Sunil V L (21):
  arm64: PCI: Migrate ACPI related functions to pci-acpi.c
  RISC-V: ACPI: Implement PCI related functionality
  ACPI: Kconfig: Introduce new option to support deferred GSI probe
  ACPI: irq: Add support for deferred probe in acpi_register_gsi()
  pnp.h: Return -EPROBE_DEFER for disabled IRQ resource in pnp_irq()
  RISC-V: Kconfig: Select deferred GSI probe for ACPI systems
  serial: 8250_pnp: Add support for deferred probe
  ACPI: pci_irq: Avoid warning for deferred probe in
    acpi_pci_irq_enable()
  ACPI: scan.c: Add weak arch specific function to reorder the IRQCHIP
    probe
  ACPI: RISC-V: Implement arch function to reorder irqchip probe entries
  PCI: MSI: Add helper function to set system wide MSI support
  PCI: pci-acpi.c: Return correct value from pcibios_alloc_irq()
  irqchip: riscv-intc: Add ACPI support for AIA
  irqchip: riscv-imsic: Add ACPI support
  irqchip: riscv-aplic: Add ACPI support
  irqchip: irq-sifive-plic: Add ACPI support
  ACPI: bus: Add RINTC IRQ model for RISC-V
  irqchip: riscv-intc: Set ACPI irqmodel
  ACPI: bus: Add acpi_riscv_init function
  ACPI: RISC-V: Create APLIC platform device
  ACPI: RISC-V: Create PLIC platform device

 arch/arm64/kernel/pci.c                    | 191 ---------------------
 arch/riscv/Kconfig                         |   3 +
 arch/riscv/include/asm/irq.h               |  31 ++++
 arch/riscv/kernel/acpi.c                   |  31 ++--
 drivers/acpi/Kconfig                       |   3 +
 drivers/acpi/bus.c                         |   4 +
 drivers/acpi/irq.c                         |  12 +-
 drivers/acpi/pci_irq.c                     |   7 +-
 drivers/acpi/riscv/Makefile                |   2 +-
 drivers/acpi/riscv/init.c                  |  15 ++
 drivers/acpi/riscv/init.h                  |   6 +
 drivers/acpi/riscv/irq.c                   | 120 +++++++++++++
 drivers/acpi/scan.c                        |   3 +
 drivers/irqchip/irq-riscv-aplic-direct.c   |  22 ++-
 drivers/irqchip/irq-riscv-aplic-main.c     | 105 ++++++++---
 drivers/irqchip/irq-riscv-aplic-main.h     |   1 +
 drivers/irqchip/irq-riscv-aplic-msi.c      |  10 +-
 drivers/irqchip/irq-riscv-imsic-early.c    |  52 +++++-
 drivers/irqchip/irq-riscv-imsic-platform.c |  51 ++++--
 drivers/irqchip/irq-riscv-imsic-state.c    | 128 +++++++-------
 drivers/irqchip/irq-riscv-imsic-state.h    |   2 +-
 drivers/irqchip/irq-riscv-intc.c           | 114 +++++++++++-
 drivers/irqchip/irq-sifive-plic.c          | 113 ++++++++++--
 drivers/pci/msi/msi.c                      |   5 +
 drivers/pci/pci-acpi.c                     | 182 ++++++++++++++++++++
 drivers/pci/pci.h                          |   2 +
 drivers/tty/serial/8250/8250_pnp.c         |  18 +-
 include/linux/acpi.h                       |   9 +
 include/linux/irqchip/riscv-imsic.h        |  10 ++
 include/linux/pnp.h                        |  10 +-
 30 files changed, 906 insertions(+), 356 deletions(-)
 create mode 100644 drivers/acpi/riscv/init.c
 create mode 100644 drivers/acpi/riscv/init.h
 create mode 100644 drivers/acpi/riscv/irq.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
