Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FC2C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gKObKs6nTnfe3ko4/CjBSXp8jQQ6dCkAT7lLEuCZsas=; b=0UUvNmhU4AHZOL
	psv4hCrppl0r2h27/AxgR/xVV06CRxrCC6xrFrv0O55Z+tWGETsrAsZG6s5FothydSnLG9bhh1FkV
	HznGBstGRkHPLE2RPZgjHpJx5yBopH/gsS6brEVlQ3tWDe90ZtPnKd/FTETRboSEME37H3JTrNv0n
	XjKZAqT6NI5Y6s/OE1Q5evwIVH3j4NjNFVOuA9xCoi9imqDtODV56zHg7COE89YP/bG4h0lMkcd4O
	UeSH+BP10KTeICF9Gdb+JcVPFaxh8ycGmP5HE8a412nEgi6zAsldK6WC3DZi61TM11Ny0WTcjFuYp
	JcV4Gq4ImXCoiNuY7amg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDL6-0059XU-2y;
	Wed, 02 Aug 2023 15:00:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDL3-0059WZ-1Z
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:00:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bb84194bf3so43512345ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690988435; x=1691593235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfKkoXa7+kBOyCwMU8T00sJTcJ4VkfjJ/hsTco4Kb4w=;
        b=hT+nD43/E+Kv1QbuZjiqSWxMesbtkoQmPihv+chtZ8HvmZRxOH5fa7vnp6ppyDsqMo
         fDORcMAl6lIY+ApBzphm8qFqBveteN2ckvFdGe1jeZ8F9MADqEzwMbQC+rLC+rR8ImhV
         /Bud6UflnE9M0L2jQgBaTjIpwThDO9ik26AHIB3Kj4BhuvVHxK/h5SwPzIRsuVcX0hl3
         FRexBaF2OcZm0CsY55ybFrP4HPFABD3h0k3kMHSrbs/k0sxtTRTPf58t1G9BlvogdAGF
         Tv2fJGJMbwr3m6RHt3wlUBzv3p4pVkdC/n7xOvOxeT8z5SHhs/u92Ku/wXqaT8Hrg3fL
         WEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988435; x=1691593235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfKkoXa7+kBOyCwMU8T00sJTcJ4VkfjJ/hsTco4Kb4w=;
        b=VTlErcb8uZJRBtOkbWw7+Q57mLnE4f69rvknoaPf6Tno5jskfBwGIdMQuIYOPHGPwj
         q+Aev/aAZdoLqwBmZbGmj4FPDW/1cBqCliH9ZYm0tSvdv7wqWPSvj66puv5Aplc/O1LO
         oxbGfvL/5hqQnIvGAG/j3oSHkcwgGxlMyk/Buk1IhHnclnpVKOeMOHIP+5aB665vYay4
         ykyvmvLAHgj7YsnkELQGW+ERPsScLNl1l+G/Ml4sFmqjZk9Xm+NSC4E9bX+igSardI3K
         zBox4BXMCMGUGHMf6SUYpSZkSulmPSrC/dDhNl2p85d+1B/hoVu4mgX6et7T358/dPuU
         tcfw==
X-Gm-Message-State: ABy/qLZpzHMwjnfjn6bdbcPm3e7NNSgl2Y0rE3cYGf1Yl5fYk5jAnmpi
	qQo1jFJT1p+C1QKoWNwO0pt2qA==
X-Google-Smtp-Source: APBJJlH1CXm/FL0c603RsVOXfeCdy6u3gDMRG0mrhvuqgTX61IyM7sVcbgLdtHiJu2i+eXs1SD2B7Q==
X-Received: by 2002:a17:902:cec5:b0:1bb:d7d4:e0d with SMTP id d5-20020a170902cec500b001bbd7d40e0dmr18658909plg.64.1690988434697;
        Wed, 02 Aug 2023 08:00:34 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001bb99e188fcsm12503963plo.194.2023.08.02.08.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:00:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 00/15] Linux RISC-V AIA Support
Date: Wed,  2 Aug 2023 20:30:03 +0530
Message-Id: <20230802150018.327079-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080037_531160_ED587FC8 
X-CRM114-Status: GOOD (  21.28  )
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

The RISC-V AIA specification is now frozen as-per the RISC-V international
process. The latest frozen specifcation can be found at:
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

These patches can also be found in the riscv_aia_v7 branch at:
https://github.com/avpatel/linux.git

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
  RISC-V: Add riscv_get_intc_hartid() function
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
 arch/riscv/include/asm/processor.h            |   4 +-
 arch/riscv/kernel/cpu.c                       |  26 +-
 drivers/irqchip/Kconfig                       |  25 +-
 drivers/irqchip/Makefile                      |   3 +
 drivers/irqchip/irq-riscv-aplic-direct.c      | 326 +++++++++++
 drivers/irqchip/irq-riscv-aplic-main.c        | 240 ++++++++
 drivers/irqchip/irq-riscv-aplic-main.h        |  53 ++
 drivers/irqchip/irq-riscv-aplic-msi.c         | 285 ++++++++++
 drivers/irqchip/irq-riscv-imsic-early.c       | 258 +++++++++
 drivers/irqchip/irq-riscv-imsic-platform.c    | 328 +++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c       | 523 ++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h       |  67 +++
 drivers/irqchip/irq-riscv-intc.c              |  46 +-
 drivers/irqchip/irq-sifive-plic.c             | 200 ++++---
 drivers/of/property.c                         |  32 ++
 include/linux/irqchip/riscv-aplic.h           | 119 ++++
 include/linux/irqchip/riscv-imsic.h           |  86 +++
 21 files changed, 2879 insertions(+), 102 deletions(-)
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
