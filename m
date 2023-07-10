Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130BAEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ysaZ0hsME0DekIlM0wE/b8CmRJUUv21h/bUzWeQb40c=; b=eljTV+XApT+Jqv
	sohYPVzQQW/S4C1DuMLz06vLeKWt7vt6pySFJM709Z93DNOS/dmZ0k4EKEvq+fWwKuMI4KLZKhteL
	sguvP4SCfdAKit/1ghrQ5Ytth+Nhs2v4dbSVBKsouwxO1egqYm55CHaHGs/KO2Ta4Mn0+5Xy/Sqo8
	Mw4R6A6hokrS0/SQ3EyeN8+Ux7wKFM9jyjA5aH8hLBLm/oiFooOpWO0I3R+2aP8Y9mKckAb+zSuHX
	ecCiwqPbKv0xujdxesNObP03q/AzQGOgxWWddZsulNAFVkjdOtyFZxIiyYo+zdKMjilR3/joVCiTl
	vkdvTMd2OkRvzoO5oJwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInQq-00B53c-1t;
	Mon, 10 Jul 2023 09:43:48 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInQl-00B50d-1S
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:43:46 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7866189cff1so206034039f.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688982219; x=1691574219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsDadgu4zFYxaidCyMCgBtLLg4ch6o0hizhw6Xf+JWI=;
        b=QEeq93mIOqTIkpTS2TDFGGcf3T/pxS5GqRaurc0PEkWCpbbc/YuE6hUpWBiQ9V0ydh
         BuWxNcIdnGrEnAv//Nh74drOi0NHIeLcrhNOLEZ+IamGRy4QAtQp5fdb+nOvCiz6jfeH
         ygk/f+fs0BQR6x6EFmkS98arVVrz/iJw2VB3pxkmHRgstWXSa7xbgE/mtj10BNCI5XZs
         I+sOkHlYWWZwGGqKSgGzn5DwhKlRmlMswoNvFdIuOe+ZLzQbpDap7+xlIOeIoACsotoa
         gqB3YTI6bavR3VFNDfGyceM0AHyllAc4fHdN5ETBYlDA29EjN0OhEipPBziwIlZGadMI
         L/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688982219; x=1691574219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsDadgu4zFYxaidCyMCgBtLLg4ch6o0hizhw6Xf+JWI=;
        b=cFvx+1xj+5AeHyxvQC3KVtPZGxb02402y3qA7J+8TraQN7s06N1BKdNCM3rPNdCWyU
         8wIDkLN6ISvbkGEKbb0kjPYMTW9eq5bB5DnIoZ5rWus4/4jDW05p/knzaypZUU/1eZ/7
         +WjZAH5bWSFcxOM683BUjGws5Pj2IuQIZTISxQSCa26rFAyJSwrKsYwlBLFC8NMzYYHB
         cZ5Q6c4m/rQ5d14bexHMNWYbHjbbjHMuW62IIce/DYX/zuJcwQLP0YLOb11lXujgAxBq
         p8JVk1AmOLy46ydo8MPJMky7eO6ESW6dgqE0l4BRP9rbmFgLujbtl16f2F8D7B8CsHDo
         YCsA==
X-Gm-Message-State: ABy/qLY3MU79mjknCgRQ8nGSdZiS1+rbqwUKHNFWK8BxNLRZqTxNwdN0
	4IYyIsIA7+DOHZeA6sG46dHf7g==
X-Google-Smtp-Source: APBJJlEKO1Ti+cjyC3HuUM8xLoZTM567hECGaUeRYBdWlSgOmax+9711bNT2933KYdLzT9Dw5jHtKQ==
X-Received: by 2002:a5e:de44:0:b0:787:8cf:fe8a with SMTP id e4-20020a5ede44000000b0078708cffe8amr3889581ioq.2.1688982218808;
        Mon, 10 Jul 2023 02:43:38 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k1-20020a6b7a41000000b007870c56387dsm936938iop.49.2023.07.10.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:43:38 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 0/9] Linux RISC-V AIA Support
Date: Mon, 10 Jul 2023 15:13:12 +0530
Message-Id: <20230710094321.1378351-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_024343_490483_F5A1F1F4 
X-CRM114-Status: GOOD (  16.50  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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

These patches can also be found in the riscv_aia_v5 branch at:
https://github.com/avpatel/linux.git

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

Anup Patel (9):
  RISC-V: Add riscv_fw_parent_hartid() function
  irqchip/riscv-intc: Add support for RISC-V AIA
  dt-bindings: interrupt-controller: Add RISC-V incoming MSI controller
  irqchip: Add RISC-V incoming MSI controller driver
  irqchip/riscv-imsic: Add support for PCI MSI irqdomain
  dt-bindings: interrupt-controller: Add RISC-V advanced PLIC
  irqchip: Add RISC-V advanced PLIC driver
  RISC-V: Select APLIC and IMSIC drivers
  MAINTAINERS: Add entry for RISC-V AIA drivers

 .../interrupt-controller/riscv,aplic.yaml     |  172 +++
 .../interrupt-controller/riscv,imsics.yaml    |  172 +++
 MAINTAINERS                                   |   12 +
 arch/riscv/Kconfig                            |    2 +
 arch/riscv/include/asm/processor.h            |    3 +
 arch/riscv/kernel/cpu.c                       |   16 +
 drivers/irqchip/Kconfig                       |   20 +-
 drivers/irqchip/Makefile                      |    2 +
 drivers/irqchip/irq-riscv-aplic.c             |  774 ++++++++++++
 drivers/irqchip/irq-riscv-imsic.c             | 1060 +++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c              |   36 +-
 include/linux/irqchip/riscv-aplic.h           |  119 ++
 include/linux/irqchip/riscv-imsic.h           |   86 ++
 13 files changed, 2467 insertions(+), 7 deletions(-)
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
