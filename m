Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EAAC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 18:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H5tQM8FhaFIXVXxIXKlrV2TfHytCGSEcWjbFjaxlAQY=; b=JXy4swYlJ9F+Ix
	6P4OcqSS1qziPh/f/x5k0iwPRwCpNVZdIPD3aJlEYNnpDj6RnizJxbVkF5Scg+Wrs63LgomNfpMI0
	IVuptmhCSYpc1nSmyrgdlYIxqN+ExbExXI5oMNbIO2XcYjglIQHp2AWBcLgPb1WpRlQyjKNCyXnKy
	VQ8RI2rla8sP5FqinOUkQEoSKnj23gIEDixukUIZ6DbzOo1xWgoNAyUlqtGVi0FKsm+6lRHAaHUMF
	ye4hyzwXyNbhK9NkQV6Ri32DeGlbJCQYzseYq2RerEwo3uiywSNJeyZYZG+0pWtRuk7RwyBriDSdA
	UOq+bDql02QKh01tjojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFf7A-00FEIE-0j;
	Tue, 19 Dec 2023 18:46:48 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe9z-00F0Y4-39
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:45:41 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6d411636a95so2188434b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007937; x=1703612737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=959oPX30wMegwb1RPQMugDw8tMBDjS9o+5BG/fh0FBc=;
        b=IHKVhmNCpTTt0i23Gu7vjUJwVOBbsZ1irTsN/pJfDvvD18xWFOryRkGRIEVpGS0F3U
         LR9B9xu1OITnWLYr09FpEMKQ59vlvP0ZZmrIIFFyU1Pm9GbrOziozLBNKKwJr+4au8j7
         Eogbdo04iaW6rv9RyVHfVq4Mh1OLj04M4EFYFLH9Xe7xo5BIly0bJVew+ojPVjEJIQHq
         uLPXCw2hA0jDGlIIB4aftPB8W5cuK2JMIGC0YnMUUCA1g1OewM+1P4uxyHesM+zz0ueQ
         I1trExWzKPjPTmtkil8aQGQaBCqBdWdVycADhncwGSLxU1/hxWzKKEeCZAh3G7Gt9Aup
         MOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007937; x=1703612737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=959oPX30wMegwb1RPQMugDw8tMBDjS9o+5BG/fh0FBc=;
        b=wVA34LK2f+KBtlsUeF/S9GvYlOj5V5DhF84wvvny2qJkVjFRcA2Ew/RahmsjVxZvj0
         wkLfjppZnoNHQNRiikcjGdkT92EGsx1iIh5Yj8gZ/WoRRJ7yZHAezUpKLEhg30Wz9GpN
         whsL8iIh+QpmL9/zrhMrBbVyO6c2T9vD72xkkuG8APP/Sh6vhuFlSQVZF0meBi1gIuxL
         BPRWmF3KivsiAsE/GMEIwmAQq3jS45beS45zrQq+sF8qzZcDQKjxiVg2A6OFDocK+Kuh
         3+SoHlVnyGneGxJzRRoHponLzevNhmMdob/qqskHA9NtAVpRfwstCrCli5uYwR8B/opq
         wBLQ==
X-Gm-Message-State: AOJu0YwYFRskSlJ8yYK2SEemNl5/aQ1ieooBntaR2Ys20dGVS7LgO51K
	A1+avFilA4l2AUvl33xbMwvFNw==
X-Google-Smtp-Source: AGHT+IFwXvF0wStLmtEexCX7/btdTXes/e+r4u90Q61lIBg2zzfPyLBBBtaNfs0lLogbWkW5yL7UDQ==
X-Received: by 2002:a17:903:11d1:b0:1d0:6ffd:6117 with SMTP id q17-20020a17090311d100b001d06ffd6117mr1910887plh.57.1703007935507;
        Tue, 19 Dec 2023 09:45:35 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:45:35 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 00/17] RISC-V: ACPI: Add external interrupt controller support
Date: Tue, 19 Dec 2023 23:15:09 +0530
Message-Id: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094540_014211_5EE6CD4E 
X-CRM114-Status: GOOD (  17.95  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for the below ECR approved by ASWG.
1) MADT - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing

The series primarily enables irqchip drivers for RISC-V ACPI based
platforms.

The series can be broadly categorized like below. 

1) PCI ACPI related functions are migrated from arm64 to common file so
that we don't need to duplicate them for RISC-V.

2) Introduced support for fw_devlink for ACPI nodes for IRQ dependency.
This helps to support deferred probe of interrupt controller drivers.

3) Modified pnp_irq() to try registering the IRQ  again if it sees it in
disabled state. This solution is similar to how
platform_get_irq_optional() works for regular platform devices.

4) Added support for re-ordering the probe of interrupt controllers when
IRQCHIP_ACPI_DECLARE is used.

5) ACPI support added in RISC-V interrupt controller drivers.

This series is based on Anup's AIA v11 series. Since Anup's AIA v11 is
not merged yet and first time introducing fw_devlink, deferred probe and
reordering support for IRQCHIP probe, this series is still kept as RFC.
Looking forward for the feedback!

Changes since RFC v2:
	1) Introduced fw_devlink for ACPI nodes for IRQ dependency.
	2) Dropped patches in drivers which are not required due to
	   fw_devlink support.
	3) Dropped pci_set_msi() patch and added a patch in
	   pci_create_root_bus().
	4) Updated pnp_irq() patch so that none of the actual PNP
	   drivers need to change.

Changes since RFC v1:
	1) Abandoned swnode approach as per Marc's feedback.
	2) To cope up with AIA series changes which changed irqchip driver
	   probe from core_initcall() to platform_driver, added patches
	   to support deferred probing.
	3) Rebased on top of Anup's AIA v11 and added tags.

To test the series,

1) Qemu should be built using the riscv_acpi_b2_v8 branch at
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

This series is also available in acpi_b2_v3_riscv_aia_v11 branch at
https://github.com/vlsunil/linux.git

Based-on: 20231023172800.315343-1-apatel@ventanamicro.com
(https://lore.kernel.org/lkml/20231023172800.315343-1-apatel@ventanamicro.com/)

Sunil V L (17):
  arm64: PCI: Migrate ACPI related functions to pci-acpi.c
  RISC-V: ACPI: Implement PCI related functionality
  PCI: Make pci_create_root_bus() declare its reliance on MSI domains
  ACPI: Add fw_devlink support for ACPI fwnode for IRQ dependency
  ACPI: irq: Add support for deferred probe in acpi_register_gsi()
  pnp.h: Reconfigure IRQ in pnp_irq() to support deferred probe
  ACPI: scan.c: Add weak arch specific function to reorder the IRQCHIP
    probe
  ACPI: RISC-V: Implement arch function to reorder irqchip probe entries
  irqchip: riscv-intc: Add ACPI support for AIA
  irqchip: riscv-imsic: Add ACPI support
  irqchip: riscv-aplic: Add ACPI support
  irqchip: irq-sifive-plic: Add ACPI support
  ACPI: bus: Add RINTC IRQ model for RISC-V
  ACPI: bus: Add acpi_riscv_init function
  ACPI: RISC-V: Create APLIC platform device
  ACPI: RISC-V: Create PLIC platform device
  irqchip: riscv-intc: Set ACPI irqmodel

 arch/arm64/kernel/pci.c                    | 191 ---------------------
 arch/riscv/Kconfig                         |   2 +
 arch/riscv/include/asm/irq.h               |  46 +++++
 arch/riscv/kernel/acpi.c                   |  31 ++--
 drivers/acpi/bus.c                         |   4 +
 drivers/acpi/irq.c                         |  22 +++
 drivers/acpi/property.c                    |  20 +++
 drivers/acpi/riscv/Makefile                |   2 +-
 drivers/acpi/riscv/init.c                  |  15 ++
 drivers/acpi/riscv/init.h                  |   6 +
 drivers/acpi/riscv/irq.c                   | 169 ++++++++++++++++++
 drivers/acpi/scan.c                        |   3 +
 drivers/irqchip/irq-riscv-aplic-direct.c   |  21 ++-
 drivers/irqchip/irq-riscv-aplic-main.c     |  64 ++++---
 drivers/irqchip/irq-riscv-aplic-main.h     |   1 +
 drivers/irqchip/irq-riscv-aplic-msi.c      |   9 +-
 drivers/irqchip/irq-riscv-imsic-early.c    |  52 +++++-
 drivers/irqchip/irq-riscv-imsic-platform.c |  51 ++++--
 drivers/irqchip/irq-riscv-imsic-state.c    | 128 +++++++-------
 drivers/irqchip/irq-riscv-imsic-state.h    |   2 +-
 drivers/irqchip/irq-riscv-intc.c           |  96 ++++++++++-
 drivers/irqchip/irq-sifive-plic.c          |  76 ++++++--
 drivers/pci/pci-acpi.c                     | 182 ++++++++++++++++++++
 drivers/pci/probe.c                        |   1 +
 drivers/pnp/pnpacpi/core.c                 |   7 +
 include/linux/acpi.h                       |  18 ++
 include/linux/irqchip/riscv-imsic.h        |  10 ++
 include/linux/pnp.h                        |  14 +-
 28 files changed, 895 insertions(+), 348 deletions(-)
 create mode 100644 drivers/acpi/riscv/init.c
 create mode 100644 drivers/acpi/riscv/init.h
 create mode 100644 drivers/acpi/riscv/irq.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
