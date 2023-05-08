Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEB3C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wJqtn6evH3FbLAiFQ/VUiLxOsfx2Rkl4ZHnnBGsfxpI=; b=t17lxLy6AaC8nC
	ho25uMRoPfGzWFMJjX5VqqszOajVacVZwSERLGu+HkRNIiZkXBK6hNVfjQorZjoFu23HZrTM9c9gJ
	8WT9iOZE78lJr5O+3uFP30HcsdmCzQsA1C3gTsluFE9fzviwfFtfUlLBTg/WSh+SN6J3jgAOXc/0E
	2pEM1z9LKnyMJfYMDJjaaWoIUHvpxk7czpySduY9ATPU+d2nXoxOxuirgpK4caK/sB4WEJuC0dpXw
	3NPMvNcJ2sOoOMY+NsnIsDtlljYr28SuckqB6N31cLT+cmzcIDAiU6pH5yu8iwLNJ79fcBeoQahK3
	phF2VcmbHdvEpJq5UH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1rM-000kQ4-1w;
	Mon, 08 May 2023 14:29:04 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1rJ-000kOy-2K
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:29:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-643b7b8f8ceso1450992b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683556140; x=1686148140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LF2qNorYNLRrXW28snaYMh/0mPEE++mM1Q0BSuQRSa4=;
        b=kcHDao+S780JBaV1TVug8QoMhZqjuxlDyLk91S1Z3S7CbJUtjYpQUJoeJmIB4KkmTS
         AaQLA/HqwR+8aeckGXkUsVofYU6PkE4DTFkMasE3xP2IwuQUszK3rYnt46m2fwomfnfW
         BAzq2z44tuRWB+IeEXwY8b5zUBiEKksmje/vDiUFlm7PdT9wj5BB+NPDeGgz7BC7VxDt
         3IrQ6dkStHgY7fA53CT531zYrc4RaJwe8uv9LxKEQeyc1rPGW3iniMfU6GOPN2R9Y18i
         4uY0QY2Q6k8oLiXEpyBAQTXY9c9EDyGlgSkPLWaoKaVFjesa+3ISvi9jb0JHB+MiGYXJ
         cYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683556140; x=1686148140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LF2qNorYNLRrXW28snaYMh/0mPEE++mM1Q0BSuQRSa4=;
        b=RYTZMzKo6nh8GzygkDC2YQrP5gQyWRHAGc7xaC7gVJIUPF80Ved62vUx0QqEHdOlUM
         tNzh9Bxx4U20s0gRZCFY4EPUBWoCja+6ie8ZnwLmvPM9fEsz1h2Zw1ajrjxmNReedieY
         CZAHAVSrp3RvJ1pT0+5vvt7xX5J/O06pd2hRy7/ObxICQGvowKVBWfLZ+XyCkQTZm6Zb
         Xxf65YqsXT3Ok8zU9fLsxoLMrfHLJKq3W4TRyx83Fhz3yu4D06pSCstVFp3AzkAmsgBS
         0LNmFoAOc+42iLFt5ogAwQ05VPOuio5ro+LySBvDpsxoCTKYRBFD61wtejYDP3/dVZsD
         jXPg==
X-Gm-Message-State: AC+VfDxZ5NLgBxKmJJ8Koape2FZ015ylooF+CwcdrUe+98q6tw7H8Jsd
	ZAjVI0zijw2iHUp7zo3ql9/4dA==
X-Google-Smtp-Source: ACHHUZ79HQjgxg2rLlN2Li60VZ7yxkETrrybO4Lw/VSG8fE5OPE74vz3oUoA/TjdCH+4TkgRWFk3ww==
X-Received: by 2002:a05:6a20:5488:b0:100:fc8d:feaf with SMTP id i8-20020a056a20548800b00100fc8dfeafmr1080471pzk.21.1683556140030;
        Mon, 08 May 2023 07:29:00 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.206])
        by smtp.gmail.com with ESMTPSA id k3-20020aa790c3000000b0063d46ec5777sm6082pfk.158.2023.05.08.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:28:59 -0700 (PDT)
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
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 00/11] Linux RISC-V AIA Support
Date: Mon,  8 May 2023 19:58:31 +0530
Message-Id: <20230508142842.854564-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_072901_760671_EEA2BBD1 
X-CRM114-Status: GOOD (  15.91  )
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

The PATCH3 of this series conflicts with the "irqchip/riscv-intc: Add ACPI
support" patch of the "Add basic ACPI support for RISC-V" series.
(Refer, https://lore.kernel.org/linux-riscv/20230508115237.216337-1-sunilvl@ventanamicro.com/)

To test this series, use QEMU v7.2 (or higher) and OpenSBI v1.2 (or higher).

These patches can also be found in the riscv_aia_v3 branch at:
https://github.com/avpatel/linux.git

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

Anup Patel (11):
  RISC-V: Add riscv_fw_parent_hartid() function
  of/irq: Set FWNODE_FLAG_BEST_EFFORT for the interrupt controller DT
    nodes
  irqchip/riscv-intc: Add support for RISC-V AIA
  dt-bindings: interrupt-controller: Add RISC-V incoming MSI controller
  irqchip: Add RISC-V incoming MSI controller driver
  irqchip/riscv-imsic: Add support for PCI MSI irqdomain
  irqchip/riscv-imsic: Improve IOMMU DMA support
  dt-bindings: interrupt-controller: Add RISC-V advanced PLIC
  irqchip: Add RISC-V advanced PLIC driver
  RISC-V: Select APLIC and IMSIC drivers
  MAINTAINERS: Add entry for RISC-V AIA drivers

 .../interrupt-controller/riscv,aplic.yaml     |  162 +++
 .../interrupt-controller/riscv,imsics.yaml    |  172 +++
 MAINTAINERS                                   |   12 +
 arch/riscv/Kconfig                            |    2 +
 arch/riscv/include/asm/processor.h            |    3 +
 arch/riscv/kernel/cpu.c                       |   12 +
 drivers/iommu/dma-iommu.c                     |   38 +
 drivers/irqchip/Kconfig                       |   20 +-
 drivers/irqchip/Makefile                      |    2 +
 drivers/irqchip/irq-riscv-aplic.c             |  750 ++++++++++++
 drivers/irqchip/irq-riscv-imsic.c             | 1080 +++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c              |   36 +-
 drivers/of/irq.c                              |   10 +
 include/linux/iommu.h                         |    6 +
 include/linux/irqchip/riscv-aplic.h           |  119 ++
 include/linux/irqchip/riscv-imsic.h           |   86 ++
 16 files changed, 2503 insertions(+), 7 deletions(-)
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
