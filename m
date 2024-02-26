Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE79C5478C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 04:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a7QUSxPzKSjeGwpAove+OwPWqepMhh1/di/QQSpeWyA=; b=Un01D8sHaOWfmV
	wALReI0O8FrUx1LbWYmdNP0/m1HnNyd2TY4HO+KoATD2QEakKoVYoqqTRAoI/I0Dzo+iA+71b/ckX
	3pQoYbQH1Ucv70sJjwiocZtNUywIHn5meyL/qKY1h/6fHICnV5r32y1pZUKt5TKiIQ36tU+ZOA5gD
	Wo9pJ18NLrGdnORnX0lL8q83E7rnjzqX+SAJHQsJtochpUhdKAFlQJ5KwCO34nqYleqS08hMeUD2d
	FXvdsyBrCxQdGM7oWEKYs/NKbEDvVOObiw+c25ezddlmtP70eVvoQIs+MXkZ4kqfL4W4pnKNnMsxI
	7W2tyvkDnYYZtJVpWddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reSIg-0000000GNJH-0cHs;
	Mon, 26 Feb 2024 04:09:10 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reSIZ-0000000GNEx-1cBg
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 04:09:07 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5d3907ff128so2286229a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Feb 2024 20:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708920542; x=1709525342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9zvVIB6oBypg9H0uxhMZz8KIEXtSS4WtHK2xE35xdw=;
        b=JwBxLJfQAye0laoZWjZ5Suay91fgNLH9iH7Zzk76rzNA6xShB9/452NHfD1qhXRSfw
         48rTRw3PJcEPeAH15+eX9Yd57C/P3GTBpyD2QJ60OtLoX+Yjln7ruBiVeCpxaLK8HzWu
         WF3wKvneenTxenE+5sTbYpSHvZfYb7DdXpjiiV9ANybO8cxo3Ksbp6Kd560zoEbNlJ49
         tQFVyOUqg8WsNcPNhpJ0iTuqKK1JdYJYH/9T1btzs0THdQN3r/Q97NZtJW96AYlxXiJn
         tQCw/0sESdzWJy0fpTFarpoElJDj1MIi3I44f2IRYwvKTAX4Bb+RSB0fIo/MyMILf35F
         5x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708920542; x=1709525342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9zvVIB6oBypg9H0uxhMZz8KIEXtSS4WtHK2xE35xdw=;
        b=Oi03LXl/cY8Wkz/B5HU/zTJ7S5Im/LHc8g1f9CbGtgIAM2W/Rf7BMVfK6fG2gFw/2L
         CNlFevHYX0nurinCDO8ffkXcvXIxEgkfZz6rFpT0Jw3oLyoeVHBEfWwPa7sWpAY4gp2q
         j3SG2+TiZvpiblad6jLp9HF9DAmPssa+M6tfLyAVM960XhdoMhyTNcVlOpuf9y52hKgL
         g4Q+6dtoS2M4H7LyjYx4joObVy+EgU5XZSHNQ0hd1dkc/C/kOa/RXS7+xjIv1gN4lxgZ
         yNnqdvjzL9FcI3o1ea3ciwt+6pYkHVQbFDAYYKZ7eBhAbDGdFdRS8nB/seOEtVK5CZiu
         CATA==
X-Forwarded-Encrypted: i=1; AJvYcCWqB773hb6alvWuGqLdvhjiVKvqAb5G4CFGCf7ptURKWMEM7qGMl2/sLGLa8iGPx4B+lXNtPZbXQnPwCLzv97lRL+WsDg77Td9HJrJt8rue
X-Gm-Message-State: AOJu0Yx+NpfGPmEjW3W2xw9RehDSCz0rxJFzSFQ7yfWHKkuQfXq9QKf4
	iftFLoZ0w1h8wbHr4LRoTPEhWm5qtQP1GMWfysZsyQKIE/wpBEq0PK2mIRZLpsY=
X-Google-Smtp-Source: AGHT+IEv4aDPCEAkK7hxZ837br8iS335dNlDEOA3dBElln/4xACcPsMwudLMDYnQJE5yvqHri2Mjow==
X-Received: by 2002:a05:6a21:2d09:b0:1a0:f9e1:2d11 with SMTP id tw9-20020a056a212d0900b001a0f9e12d11mr3543890pzb.8.1708920541716;
        Sun, 25 Feb 2024 20:09:01 -0800 (PST)
Received: from localhost.localdomain ([171.76.86.62])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001dc6f7e794dsm3023258pln.16.2024.02.25.20.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 20:09:01 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v15 00/10] Linux RISC-V AIA Support
Date: Mon, 26 Feb 2024 09:37:36 +0530
Message-Id: <20240226040746.1396416-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_200903_836752_65BDDBE4 
X-CRM114-Status: GOOD (  26.90  )
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

These patches can also be found in the riscv_aia_v15 branch at:
https://github.com/avpatel/linux.git

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

Anup Patel (10):
  irqchip/riscv-intc: Fix low-level interrupt handler setup for AIA
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
 drivers/irqchip/irq-riscv-aplic-msi.c         | 263 ++++++
 drivers/irqchip/irq-riscv-imsic-early.c       | 201 ++++
 drivers/irqchip/irq-riscv-imsic-platform.c    | 374 ++++++++
 drivers/irqchip/irq-riscv-imsic-state.c       | 865 ++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h       | 108 +++
 drivers/irqchip/irq-riscv-intc.c              |  10 +-
 include/linux/cpuhotplug.h                    |   1 +
 include/linux/irqchip/riscv-aplic.h           | 145 +++
 include/linux/irqchip/riscv-imsic.h           |  87 ++
 18 files changed, 3028 insertions(+), 3 deletions(-)
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
