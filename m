Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB652E75421
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QVukY02Nk9BF2MCnXqMujg1T+pR8ADMSnfdrNlUMbyc=; b=Nk7/l/IF2DqtzT
	cFgDuh72sx+jrtfgcdqNKwBXpDIOenZIXtlKokwIzRgbJvuYwMwj+lZaNN9C6BrbKSny2vJsAh/Xn
	ZnLBBgWtzmUlBWeylY9saBnTRsicN1PCopFf1Yq2es6Qc+0+949ZdT4u9AqKSq5AIRgr2jOxKjpyi
	2WAJKHb+Z57+Yk1yX7Bwta+jnAIIPqJeyLfaPx3WCtNGeeU2p9bjrMOUDVCeIGA/cqRvzxOpwdaPG
	Izys1dR7tP6RQYT8j01p/8xrZmmJEtWd21bgWiP8mwwJUUzbXu8fJnIAUqTS9AYf3xxllonOpLxzx
	Q8kLGSDzr7Z7AVhWtDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXGx-00DnrO-03;
	Tue, 03 Oct 2023 04:44:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXGt-00Dnr2-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:44:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so365736b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308273; x=1696913073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TjbE8uX71LLSwVZuJeo15FlkQKTT8tUnSt7nDx48Qbk=;
        b=H52jlw3FZIdBFuFarOOxTvun2f7/5p/pQ9Y8usFiG5gd954iBSeyg2Y9cQRkfMJDNi
         0cvFEdmuZtV+yyd/BoVzKAmf4q5hF7ruDQSebln8txXPJgEin1GByXqBa5tJ/0DLjIdu
         zqeMteZXQ+qVCa2nKvnWytuQE/9gWTC3WjOQZG8HFACvrHqGdGPlLmt8xEop8DCmjgM8
         GKoT1H5SIi/zdSHPZoeoHRkprtDxlJzub09WOeQ2Nv+pGy6tclcANwKBfkj50pCumg0f
         8HayR/jqGBJnl7HOin3Ukc50nrt/KjGnDQ4YT2VG0Lc7sSCJMblkbjnPpCWXX5Z2qbRe
         gAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308273; x=1696913073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjbE8uX71LLSwVZuJeo15FlkQKTT8tUnSt7nDx48Qbk=;
        b=UQNiX50mfd/g2emc6u0O+S6xy4VTf7iQcRhmK+2t2RYOJ1hcEy4TMyLd2B8LSg64+H
         3vs4N9Tvpn87Szkc1qYRhqlFSX6JOskc1KBcHl7ZqPpLtUOzpIjHSlyOo9StDE4HdN9c
         gLJezwzb/2TjTbxzNBjXcHBGPo4ZlWj4nEUXYgARw6+27HlYmSScdq8QB/l3OsN0uUYr
         GrCXxZ9f/0uLi/PLN6y5hAvBZ53eS/RfP4ODNCwGFRjMnGKa7xAfKkaiwVvw/gqDGPPz
         /0cdPce7+B7vUPo1lVEa8hGN57PjRlL4y0GKVRHqIYAHiEJWtaGXxvqy3dTlIYbAjdSI
         I/FQ==
X-Gm-Message-State: AOJu0Yzyjo5FoypiULVVzT51QZOUCe/mG9O1rshy7RgOBabV/lYG5dY3
	p8RJJnuDqUvQ1cRjtctmZRo8ZA==
X-Google-Smtp-Source: AGHT+IFI2zSNTFfrsT7+gx7O9gi1BfXyjAK1sLcXRSVueaDfZFD28tzvs5rJ6/KTXTYGT91xnfZJpw==
X-Received: by 2002:a05:6a20:430e:b0:141:d640:794a with SMTP id h14-20020a056a20430e00b00141d640794amr17673256pzk.39.1696308273182;
        Mon, 02 Oct 2023 21:44:33 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:44:32 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 00/15] Linux RISC-V AIA Support
Date: Tue,  3 Oct 2023 10:13:48 +0530
Message-Id: <20231003044403.1974628-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214435_177442_7F243BDA 
X-CRM114-Status: GOOD (  22.09  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V AIA specification is ratified as-per the RISC-V international
process. The latest ratified AIA specifcation can be found at:
https://github.com/riscv/riscv-aia/releases/download/1.0/riscv-interrupts-1.0.pdf

At a high-level, the AIA specification adds three things:
1) AIA CSRs
   - Improved local interrupt support
2) Incoming Message Signaled Interrupt Controller (IMSIC)
   - Per-HART MSI controller
   - Support MSI virtualization
   - Support IPI along with virtualization
3) Advanced Platform-Level Interrupt Controller (APLIC)
   - Wired interrupt controller
   - In MSI-mode, converts wired interrupt into MSIs (i.e. MSI generator)
   - In Direct-mode, injects external interrupts directly into HARTs

For an overview of the AIA specification, refer the AIA virtualization
talk at KVM Forum 2022:
https://static.sched.com/hosted_files/kvmforum2022/a1/AIA_Virtualization_in_KVM_RISCV_final.pdf
https://www.youtube.com/watch?v=r071dL8Z0yo

To test this series, use QEMU v7.2 (or higher) and OpenSBI v1.2 (or higher).

These patches can also be found in the riscv_aia_v10 branch at:
https://github.com/avpatel/linux.git

Changes since v9:
 - Rebased on Linux-6.6-rc4
 - Use builtin_platform_driver() in PATCH5, PATCH9, and PATCH12

Changes since v8:
 - Rebased on Linux-6.6-rc3
 - Dropped PATCH2 of v8 series since we won't be requiring
   riscv_get_intc_hartid() based on Marc Z's comments on ACPI AIA support.
 - Addressed Saravana's comments in PATCH3 of v8 series
 - Update PATCH9 and PATCH13 of v8 series based on comments from Sunil

Changes since v7:
 - Rebased on Linux-6.6-rc1
 - Addressed comments on PATCH1 of v7 series and split it into two PATCHes
 - Use DEFINE_SIMPLE_PROP() in PATCH2 of v7 series

Changes since v6:
 - Rebased on Linux-6.5-rc4
 - Updated PATCH2 to use IS_ENABLED(CONFIG_SPARC) instead of
   !IS_ENABLED(CONFIG_OF_IRQ)
 - Added new PATCH4 to fix syscore registration in PLIC driver
 - Update PATCH5 to convert PLIC driver into full-blown platform driver
   with a re-written probe function.

Changes since v5:
 - Rebased on Linux-6.5-rc2
 - Updated the overall series to ensure that only IPI, timer, and
   INTC drivers are probed very early whereas rest of the interrupt
   controllers (such as PLIC, APLIC, and IMISC) are probed as
   regular platform drivers.
 - Renamed riscv_fw_parent_hartid() to riscv_get_intc_hartid()
 - New PATCH1 to add fw_devlink support for msi-parent DT property
 - New PATCH2 to ensure all INTC suppliers are initialized which in-turn
   fixes the probing issue for PLIC, APLIC and IMSIC as platform driver
 - New PATCH3 to use platform driver probing for PLIC
 - Re-structured the IMSIC driver into two separate drivers: early and
   platform. The IMSIC early driver (PATCH7) only initialized IMSIC state
   and provides IPIs whereas the IMSIC platform driver (PATCH8) is probed
   provides MSI domain for platform devices.
 - Re-structure the APLIC platform driver into three separe sources: main,
   direct mode, and MSI mode.

Changes since v4:
 - Rebased on Linux-6.5-rc1
 - Added "Dependencies" in the APLIC bindings (PATCH6 in v4)
 - Dropped the PATCH6 which was changing the IOMMU DMA domain APIs
 - Dropped use of IOMMU DMA APIs in the IMSIC driver (PATCH4)

Changes since v3:
 - Rebased on Linux-6.4-rc6
 - Droped PATCH2 of v3 series instead we now set FWNODE_FLAG_BEST_EFFORT via
   IRQCHIP_DECLARE()
 - Extend riscv_fw_parent_hartid() to support both DT and ACPI in PATCH1
 - Extend iommu_dma_compose_msi_msg() instead of adding iommu_dma_select_msi()
   in PATCH6
 - Addressed Conor's comments in PATCH3
 - Addressed Conor's and Rob's comments in PATCH7

Changes since v2:
 - Rebased on Linux-6.4-rc1
 - Addressed Rob's comments on DT bindings patches 4 and 8.
 - Addessed Marc's comments on IMSIC driver PATCH5
 - Replaced use of OF apis in APLIC and IMSIC drivers with FWNODE apis
   this makes both drivers easily portable for ACPI support. This also
   removes unnecessary indirection from the APLIC and IMSIC drivers.
 - PATCH1 is a new patch for portability with ACPI support
 - PATCH2 is a new patch to fix probing in APLIC drivers for APLIC-only systems.
 - PATCH7 is a new patch which addresses the IOMMU DMA domain issues pointed
   out by SiFive

Changes since v1:
 - Rebased on Linux-6.2-rc2
 - Addressed comments on IMSIC DT bindings for PATCH4
 - Use raw_spin_lock_irqsave() on ids_lock for PATCH5
 - Improved MMIO alignment checks in PATCH5 to allow MMIO regions
   with holes.
 - Addressed comments on APLIC DT bindings for PATCH6
 - Fixed warning splat in aplic_msi_write_msg() caused by
   zeroed MSI message in PATCH7
 - Dropped DT property riscv,slow-ipi instead will have module
   parameter in future.

Anup Patel (15):
  RISC-V: Don't fail in riscv_of_parent_hartid() for disabled HARTs
  of: property: Add fw_devlink support for msi-parent
  drivers: irqchip/riscv-intc: Mark all INTC nodes as initialized
  irqchip/sifive-plic: Fix syscore registration for multi-socket systems
  irqchip/sifive-plic: Convert PLIC driver into a platform driver
  irqchip/riscv-intc: Add support for RISC-V AIA
  dt-bindings: interrupt-controller: Add RISC-V incoming MSI controller
  irqchip: Add RISC-V incoming MSI controller early driver
  irqchip/riscv-imsic: Add support for platform MSI irqdomain
  irqchip/riscv-imsic: Add support for PCI MSI irqdomain
  dt-bindings: interrupt-controller: Add RISC-V advanced PLIC
  irqchip: Add RISC-V advanced PLIC driver for direct-mode
  irqchip/riscv-aplic: Add support for MSI-mode
  RISC-V: Select APLIC and IMSIC drivers
  MAINTAINERS: Add entry for RISC-V AIA drivers

 .../interrupt-controller/riscv,aplic.yaml     | 172 ++++++
 .../interrupt-controller/riscv,imsics.yaml    | 172 ++++++
 MAINTAINERS                                   |  14 +
 arch/riscv/Kconfig                            |   2 +
 arch/riscv/kernel/cpu.c                       |  11 +-
 drivers/irqchip/Kconfig                       |  24 +
 drivers/irqchip/Makefile                      |   3 +
 drivers/irqchip/irq-riscv-aplic-direct.c      | 343 +++++++++++
 drivers/irqchip/irq-riscv-aplic-main.c        | 232 +++++++
 drivers/irqchip/irq-riscv-aplic-main.h        |  53 ++
 drivers/irqchip/irq-riscv-aplic-msi.c         | 285 +++++++++
 drivers/irqchip/irq-riscv-imsic-early.c       | 259 ++++++++
 drivers/irqchip/irq-riscv-imsic-platform.c    | 319 ++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c       | 570 ++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h       |  67 ++
 drivers/irqchip/irq-riscv-intc.c              |  44 +-
 drivers/irqchip/irq-sifive-plic.c             | 242 +++++---
 drivers/of/property.c                         |   2 +
 include/linux/irqchip/riscv-aplic.h           | 119 ++++
 include/linux/irqchip/riscv-imsic.h           |  86 +++
 20 files changed, 2915 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
 create mode 100644 drivers/irqchip/irq-riscv-aplic-direct.c
 create mode 100644 drivers/irqchip/irq-riscv-aplic-main.c
 create mode 100644 drivers/irqchip/irq-riscv-aplic-main.h
 create mode 100644 drivers/irqchip/irq-riscv-aplic-msi.c
 create mode 100644 drivers/irqchip/irq-riscv-imsic-early.c
 create mode 100644 drivers/irqchip/irq-riscv-imsic-platform.c
 create mode 100644 drivers/irqchip/irq-riscv-imsic-state.c
 create mode 100644 drivers/irqchip/irq-riscv-imsic-state.h
 create mode 100644 include/linux/irqchip/riscv-aplic.h
 create mode 100644 include/linux/irqchip/riscv-imsic.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
