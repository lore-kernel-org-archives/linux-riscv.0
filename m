Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B0FEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jYd2WgYayWmeac0txA0/PHjSb9JBAHjie1sAT/5ARJE=; b=NMYdaTQPPafwXJ
	vlRUJQxXJF0fpJQ5NdDQy0uqRiuYWSajfMDVz3vogWKM/VGOstxU7z75U82UtyvCgaUKfVpV20EGE
	gia4DmPolbYqB1FuYaw+ZwLyL4guMXDsYS4gni1PVbAArH7VcOYEyangHDsiqS5Lv8v31IbCj8rEr
	07nYfbySVPFFlKq4DQsaQIHgc66PfNIZippjpJ2txpjaNzgDpx3gEAx2K2Z6BFKcY8xbKi+dbIS1H
	neOMUtBcuM1Pzlf2IWssr7TrhG1cu+uAQ3obf6ML8w9o9b7XbJtqt9rEvHmF80xszxd5j3MaXdSAC
	6b90Jt+CbDLYopxQixOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q962b-008Ton-0l;
	Tue, 13 Jun 2023 15:34:41 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q962W-008Tmj-0i
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 15:34:39 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-39ca48cd4c6so3082034b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686670473; x=1689262473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VsADkvrA5S1kbrkqvdaSHEE1vVM0lyWbIsRf34hJch0=;
        b=QcvoS6qCya0lGy2C9YBKXjfHCysqEV2Tg24L2Vp+nEQmSCcH3TK/NUl7vsZRw7Giph
         NHql/xcBrcrK8cCu7oiQXI5BZJKbKFXJEOC4eS57uWZ84WQ/CObt+fV97Aa3QikDz1/s
         aOhi24sVsYx1ZlzEuFhCW5ZjKZWI7CIQ4qsFDic+p9MAvEbihcWrphyw9WfFEV4FPhu5
         oTYIpXiwkFczKZLkbvIcyWeDAnO8BFaEcd0XvjCQyvl/a/8vLhO9baZOl2+z/szJ5SSZ
         6eai9sdV3DkHmGivTEPlkWhBaMUw1+TOz29I/gWwZbPKQQTsb4SVwrNC1SpVONI+JUuT
         sLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670473; x=1689262473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsADkvrA5S1kbrkqvdaSHEE1vVM0lyWbIsRf34hJch0=;
        b=O3b9IeaPIuMwt523TGKSQKnqMZRrKwMMPq6GWSA3a4VFGNWyIqNb5gEqrTmFlU6eVB
         ApSJ8Wum6KWBQlheST9gGjC7niKlwGfFFd4ZdFrYdNF4nTwODsdQCB0KCr9M4+IrlGV+
         msPkHsFv6RFI5QaA2ONvOkG/V7OE0xeTdTVowkhEJX1RgMwLTCk6NixL4hbpnxaxoEwA
         Ur7tB8oHP2InlCka+pcrgIsK0LXz2ya+0IfO1K2nvGZsSSJ84Z8thoupDQYEN1sBgDzE
         ZKg8I2+Annvcqo48xioF5y3h6eS3bPXBnZaed9GixVlGPTcwFQuMQREuiCDtXatk9JyC
         qRsw==
X-Gm-Message-State: AC+VfDw4TnLNf3QPCrC/5ZK2K6ETeXNV64x3/Y4GHYopahbDgT0C5l56
	+5ThQRJlWMxGCVPanVS2+av2cA==
X-Google-Smtp-Source: ACHHUZ5C6PHpJR9woDHJHbAl8srvmzU0pQcvBbUPxH8+bIF5BtDVwfB8mNfUN66XKC+7bA5NTe9D2w==
X-Received: by 2002:a05:6808:181f:b0:399:b0ee:de1 with SMTP id bh31-20020a056808181f00b00399b0ee0de1mr8291881oib.49.1686670472960;
        Tue, 13 Jun 2023 08:34:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n2-20020acabd02000000b0039ce305ea4fsm1630807oif.14.2023.06.13.08.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 08:34:32 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 00/10] Linux RISC-V AIA Support
Date: Tue, 13 Jun 2023 21:04:05 +0530
Message-Id: <20230613153415.350528-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_083436_261986_F1033424 
X-CRM114-Status: GOOD (  16.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V AIA specification is now frozen as-per the RISC-V international
process. The latest frozen specifcation can be found at:
https://github.com/riscv/riscv-aia/releases/download/1.0-RC1/riscv-interrupts-1.0-RC1.pdf

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

For an overview of the AIA specification, refer the recent AIA virtualization
talk at KVM Forum 2022:
https://static.sched.com/hosted_files/kvmforum2022/a1/AIA_Virtualization_in_KVM_RISCV_final.pdf
https://www.youtube.com/watch?v=r071dL8Z0yo

The PATCH2 of this series conflicts with the "irqchip/riscv-intc: Add ACPI
support" patch of the "Add basic ACPI support for RISC-V" series hence this
series is based upon the "Add basic ACPI support for RISC-V" series.
(Refer, https://lore.kernel.org/lkml/20230515054928.2079268-1-sunilvl@ventanamicro.com/)

To test this series, use QEMU v7.2 (or higher) and OpenSBI v1.2 (or higher).

These patches can also be found in the riscv_aia_v4 branch at:
https://github.com/avpatel/linux.git

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

Anup Patel (10):
  RISC-V: Add riscv_fw_parent_hartid() function
  irqchip/riscv-intc: Add support for RISC-V AIA
  dt-bindings: interrupt-controller: Add RISC-V incoming MSI controller
  irqchip: Add RISC-V incoming MSI controller driver
  irqchip/riscv-imsic: Add support for PCI MSI irqdomain
  irqchip/riscv-imsic: Improve IOMMU DMA support
  dt-bindings: interrupt-controller: Add RISC-V advanced PLIC
  irqchip: Add RISC-V advanced PLIC driver
  RISC-V: Select APLIC and IMSIC drivers
  MAINTAINERS: Add entry for RISC-V AIA drivers

 .../interrupt-controller/riscv,aplic.yaml     |  169 +++
 .../interrupt-controller/riscv,imsics.yaml    |  172 +++
 MAINTAINERS                                   |   12 +
 arch/riscv/Kconfig                            |    2 +
 arch/riscv/include/asm/processor.h            |    3 +
 arch/riscv/kernel/cpu.c                       |   16 +
 drivers/iommu/dma-iommu.c                     |   24 +-
 drivers/irqchip/Kconfig                       |   20 +-
 drivers/irqchip/Makefile                      |    2 +
 drivers/irqchip/irq-riscv-aplic.c             |  765 ++++++++++++
 drivers/irqchip/irq-riscv-imsic.c             | 1076 +++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c              |   36 +-
 include/linux/irqchip/riscv-aplic.h           |  119 ++
 include/linux/irqchip/riscv-imsic.h           |   86 ++
 14 files changed, 2492 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
 create mode 100644 drivers/irqchip/irq-riscv-aplic.c
 create mode 100644 drivers/irqchip/irq-riscv-imsic.c
 create mode 100644 include/linux/irqchip/riscv-aplic.h
 create mode 100644 include/linux/irqchip/riscv-imsic.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
