Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED39BC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SNsjR5SvBk0H+xOzdRRuNYUU7APuSsoTsGeWxFF//rg=; b=ZklGY1JsdK/TFV
	keWabO0YsaLRSuVNTMj9ilsHC74OaB0IgUNCB/SyAL1S59ms+K5EGDOqtI/KO7lnENsqRbVvR1/wv
	kfcQJPKYnzNOAy6yOVDhBUuEhEZNe442Yhf3knvA305cUTKjvsmjDCEj43/Xjs3qFza1mR7ggllLN
	tugwfrS/LfntZOQrQQy9E3y0d5zUIAgEzD3V41YNyaPKRZNcz8MrYG81+ZUL7nJ3rBNjR/6nMEI36
	uUtLTMvs/XXA3eJJxuRUdukA5zA8g4KaoRbz1c0EBp5InG6KCrvPy9TTgr4i+pcQapyY4HdPhssGi
	6ssNVkFoW4A/EDC9Jyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riELJ-00000004vUR-2kZ5;
	Thu, 07 Mar 2024 14:03:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEL9-00000004vMy-3muP
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 14:03:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dc13fb0133so7323255ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 06:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709820199; x=1710424999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IX2p+Qigk307xirvs6Xg2x/v1iXimPPLp2xeUw2lyCM=;
        b=Ku9E0qFzIpMX7lubE51GbiumCX1IMTbu5ELLqGBB7DTgXCIdVj0hZqNFBuE4E6+lb3
         9b98+GcjnCKFLE8Y/CrBtSBYizuOTCWzGsUeLV//T/6pzDLD0hDmOunFvzL6qn4syIT3
         B7VAzELYRlGP2ZjvQRAY86ZTgxq5pk889xmG+0diA3EHrPWLnfKo9SVQQczNVo3XuFhT
         3IWL4D6+z1MIutDHKLXAebZDHnFngkEhqUS8HrDnJh5kfrNssexZ8lmM+BUoasYBziuH
         wNrmtBrv6B6fVaS4lIgYmi6cGVppN9U122bILvioYSXmaGNOvHpLeAWx3CVj61pApjaI
         M0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820199; x=1710424999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IX2p+Qigk307xirvs6Xg2x/v1iXimPPLp2xeUw2lyCM=;
        b=N5HriEjH118JliPeoesB7hXE55FNWyqf0DsLrU79CpSLoSUd6Y/WJ6WcXptQpwzRTN
         vQuOpBxDNc0l319PG0kUauCE3dRq5LNv/loIAvvMpJxrsNa1IDGOzVTYUdG+Ll2+pHdr
         lZ0g0fYiFG71kqtY05JKVi+EzMwPy5W9xpakV5hlqC9aZ3UfDujzFosXgghzlLkQZ992
         j4FpndKeCXnZGceXYrUi745+eFTzlkkHbOm2L1UUZdsgkMeGnggsFpnGiC1oLOmYJXjk
         QQR3wot+Yqt3kyBcYJC8hJQkrE8E3+1prE7PImXalMVUh3h/cODKDaCYEqFzG2ChERym
         tSxg==
X-Forwarded-Encrypted: i=1; AJvYcCWw4p7ftkihtUI5Vg6FNgZVV66+ONkj6C0AvtJ6J3HFgvjvXXVfCSkZ9eMu0uvbyHOLBXnqfIvwuhC/nmv94NYKRUCFLecz+3ulfs6DFJKt
X-Gm-Message-State: AOJu0YyROBh/nrsjF5MHTRwH/zxTxmVF+RbZPoO7iwyaMGqc6e7PYrLL
	mLuVdUIR0TSAHwdkHFg4xWfNRrhJekATg6ea1+hOnqpqaGCG0TtbRE2qf7wF8vE=
X-Google-Smtp-Source: AGHT+IGyO+EIw1HjH1Ri5Nd3epuWwE+qGFF/zJKkJADaBt6lOZgWfg2Kwca8/i7VDQ6zq5BBPwVTsA==
X-Received: by 2002:a17:902:e9d4:b0:1db:e089:7461 with SMTP id 20-20020a170902e9d400b001dbe0897461mr7988515plk.31.1709820198411;
        Thu, 07 Mar 2024 06:03:18 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.79])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709026f0100b001dd6174c651sm386228plk.149.2024.03.07.06.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:03:17 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v16 0/9] Linux RISC-V AIA Support
Date: Thu,  7 Mar 2024 19:32:58 +0530
Message-Id: <20240307140307.646078-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_060320_228105_3E8C43C7 
X-CRM114-Status: GOOD (  25.41  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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

This series depends upon per-device MSI domain (and few other) patches merged
by Thomas (tglx) which are available in irq/msi branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git

These patches can also be found in the riscv_aia_v16 branch at:
https://github.com/avpatel/linux.git

Changes since v15:
 - Dropped PATCH1 since it is already merged by Thomas (tglx) and available in
   his irq/msi branch at git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
 - Simplified aplic_msi_irq_eoi() in PATCH7 based on the section "4.9.2 Special
   consideration for level-sensitive interrupt sources"  of the RISC-V AIA
   specification and also provided handler name.

Changes since v14:
 - Dropped 9 patches which are already merged by Thomas (tglx) and available in
   his irq/msi branch at git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
 - Added new PATCH1 which adds changes missed out in merging AIA support for
   RISC-V INTC.
 - Added a separate cpuhp state for IMSIC driver in PATCH3 which ensures that
   cpuhp notifiers of IMSIC are called as early as possible.
 - Removed redundant barriers in PATCH3.
 - Addressed few other nit comments.

Changes since v13:
 - Split PATCH1 into six granular patches
 - Addressed nit comments from Thomas and Bjorn

Changes since v12:
 - Rebased on Linux-6.8-rc5
 - Dropped per-device MSI domain patches which are already merged by Thomas (tglx)
 - Addressed nit comments from Thomas and Clement
 - Added a new patch2 to fix lock dependency warning
 - Replaced local sync IPI in the IMSIC driver with per-CPU timer
 - Simplified locking in the IMSIC driver to avoid lock dependency issues
 - Added a dirty bitmap in the IMSIC driver to optimize per-CPU local sync loop

Changes since v11:
 - Rebased on Linux-6.8-rc1
 - Included kernel/irq related patches from "genirq, irqchip: Convert ARM
   MSI handling to per device MSI domains" series by Thomas.
   (PATCH7, PATCH8, PATCH9, PATCH14, PATCH16, PATCH17, PATCH18, PATCH19,
    PATCH20, PATCH21, PATCH22, PATCH23, and PATCH32 of
    https://lore.kernel.org/linux-arm-kernel/20221121135653.208611233@linutronix.de/)
 - Updated APLIC MSI-mode driver to use the new WIRED_TO_MSI mechanism.
 - Updated IMSIC driver to support per-device MSI domains for PCI and
   platform devices.

Changes since v10:
 - Rebased on Linux-6.6-rc7
 - Dropped PATCH3 of v10 series since this has been merged by MarcZ
   for Linux-6.6-rc7
 - Changed the IMSIC ID management strategy from 1-n approach to
   x86-style 1-1 approach

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
 - Dropped PATCH2 of v3 series instead we now set FWNODE_FLAG_BEST_EFFORT via
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
  dt-bindings: interrupt-controller: Add RISC-V incoming MSI controller
  irqchip: Add RISC-V incoming MSI controller early driver
  irqchip/riscv-imsic: Add device MSI domain support for platform
    devices
  irqchip/riscv-imsic: Add device MSI domain support for PCI devices
  dt-bindings: interrupt-controller: Add RISC-V advanced PLIC
  irqchip: Add RISC-V advanced PLIC driver for direct-mode
  irqchip/riscv-aplic: Add support for MSI-mode
  RISC-V: Select APLIC and IMSIC drivers
  MAINTAINERS: Add entry for RISC-V AIA drivers

 .../interrupt-controller/riscv,aplic.yaml     | 172 ++++
 .../interrupt-controller/riscv,imsics.yaml    | 172 ++++
 MAINTAINERS                                   |  14 +
 arch/riscv/Kconfig                            |   2 +
 drivers/irqchip/Kconfig                       |  25 +
 drivers/irqchip/Makefile                      |   3 +
 drivers/irqchip/irq-riscv-aplic-direct.c      | 326 +++++++
 drivers/irqchip/irq-riscv-aplic-main.c        | 211 +++++
 drivers/irqchip/irq-riscv-aplic-main.h        |  52 ++
 drivers/irqchip/irq-riscv-aplic-msi.c         | 257 ++++++
 drivers/irqchip/irq-riscv-imsic-early.c       | 201 ++++
 drivers/irqchip/irq-riscv-imsic-platform.c    | 374 ++++++++
 drivers/irqchip/irq-riscv-imsic-state.c       | 865 ++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h       | 108 +++
 include/linux/cpuhotplug.h                    |   1 +
 include/linux/irqchip/riscv-aplic.h           | 145 +++
 include/linux/irqchip/riscv-imsic.h           |  87 ++
 17 files changed, 3015 insertions(+)
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
