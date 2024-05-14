Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697D8C25B79
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 18:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dC4Jiq4q+9e+tXi/zxXT6ntcR2hODZhs/p1M23YZYJo=; b=XcB6vB7+Yenmbb
	gHRF6/KMzUgtwl2x1LS+Pyaj6yGqGaIzIKCu2zJ0lRsB8ZLCl5CAT20oX1iwvRajw1HEjzUDrDO5L
	HYGBgCyoW4vVlJ+Ylio4sg1HSvE3r/BLXdzCY4iYF8bO+rBVGzKsCbsrC7TPet0MmUWBOcYfZlO6Y
	9vdzyfcLI55ikKv5vvxLWy8nb6Srvwj4NIQHxXjdxqmt6y9xwVpiGLdElE8rYN0YYMrSkgKepw17p
	Qa4GNL58V756VTP4M3FC8JO8BeAjgnBN0AXFgWNiWYTNzjzRmXY1epqf+7RdygijBJDUH9ZBtWLyx
	bLtLAxHUh8JXepp33XoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wi3-0000000GncD-4AjG;
	Tue, 14 May 2024 18:17:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6whx-0000000GnZh-2z6i
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 18:17:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ee954e0aa6so46872545ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 11:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715710616; x=1716315416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntO07EHzeIxaUBkro0cUslEIHaRtwBKGDIWKPBR2eTs=;
        b=TQxCUt5jW16peXLHpCqIxalXvaSiNIXefERkUlleFcHquqWafh5CqmTBESdAbQIqYL
         Gr86W81XAvlaxKRk43BC/ujO5KsMg/8NKpAsYxl4LvcAfufsT6kHkiwmKQhBX6PVhOVV
         rHnzGyszQssKIgJ4By7dWZvbHBHZ1sJYMeRaRlrBhMJzIDAHLIKyqg1CIh9cotpOs6rV
         zTeFsiXxMpVG3e32vOqqwsrcGzxgeC+HUPKFopHXhR6QhAB9+KznkXZa3hbizp5ZsESZ
         ckRQIkWn2HYyx4W/q1EIwDyGp7kOZTiUdpJaeqxQcQNnCOm+5qPob2E3McfRYZR8ssPG
         XAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715710616; x=1716315416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntO07EHzeIxaUBkro0cUslEIHaRtwBKGDIWKPBR2eTs=;
        b=qZvMBWiTxtntIHqbiI8/C74sJZB/NiNQdvTpkXK8fyu5/caCotLGlZNQigNadmfTUY
         xgQSf/c2W3+XgP8dCqpZ80zavemAf1BroZwPXmrsuNQjiXS847bt5q41rOwYMfdYj4Aa
         YgtTmNUUTMxUL0VuvYfFPGpJP6TEtQ7vm26zRkxVhq21gDg5kfVgam1W/ER052B4ToVU
         Uzpy+z0jU4ZSR1SwClLOvdAR/7wVZfrbYpyo16dZQi4MVUXpF4x9kVOuGu2UTtmkxaQF
         7c0HOa2UkKdvL+/LEH9Jmhr+Aonsk/OCdgM99H4NEP8yO97sIVfeeQBPpsG5atGJIqI3
         p9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVk13yL4cxg8fR/WBl+S+XX8zVaAKXJsQesF4sNnVgs+2KaMaBEu33f9kbalXp03q3mdpGaoM/AoVLyQPnmLXvuR99CLdVh2lGDl8LuSuTV
X-Gm-Message-State: AOJu0YyMhHR1/glSjiDXrYUCVuytFzwc95poKoo3E7sKLyTZ4+ztXAOE
	RoIA8Gyv4X7NeTRrhtSt0vt0NpEGvC3F9dQwJRtmLoWpb37N+XBMArSkQxa/N4g=
X-Google-Smtp-Source: AGHT+IGqGcf03rTwtWMBdNE4/haqu6VFE+kKrC31BtqQAytwyc6gPRJ3RofHiXGCTNvKefmCls52yQ==
X-Received: by 2002:a17:902:e5cb:b0:1eb:63d9:8d85 with SMTP id d9443c01a7336-1ef43d2e27bmr175023605ad.14.1715710615977;
        Tue, 14 May 2024 11:16:55 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad6386sm100993625ad.80.2024.05.14.11.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 11:16:55 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v5 0/7] Linux RISC-V IOMMU Support
Date: Tue, 14 May 2024 11:16:12 -0700
Message-Id: <cover.1715708679.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_111701_782727_A183E360 
X-CRM114-Status: GOOD (  16.73  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series introduces support for RISC-V IOMMU architected
hardware into the Linux kernel.

The RISC-V IOMMU specification, which this series is based on, is
ratified and available at GitHub/riscv-non-isa [1].

At a high level, the RISC-V IOMMU specification defines:

1) Data structures:
  - Device-context: Associates devices with address spaces and holds
    per-device parameters for address translations.
  - Process-contexts: Associates different virtual address spaces based
    on device-provided process identification numbers.
  - MSI page table configuration used to direct an MSI to a guest
    interrupt file in an IMSIC.
2) In-memory queue interface:
  - Command-queue for issuing commands to the IOMMU.
  - Fault/event queue for reporting faults and events.
  - Page-request queue for reporting "Page Request" messages received
    from PCIe devices.
  - Message-signaled and wire-signaled interrupt mechanisms.
3) Memory-mapped programming interface:
  - Mandatory and optional register layout and description.
  - Software guidelines for device initialization and capabilities discovery.


This series introduces RISC-V IOMMU hardware initialization and complete
single-stage translation with paging domain support.

The patches are organized as follows:

Patch 1: Introduces minimal required device tree bindings for the driver.
Patch 2: Defines RISC-V IOMMU data structures, hardware programming interface
         registers layout, and minimal initialization code for enabling global
         pass-through for all connected masters.
Patch 3: Implements the device driver for PCIe implementation of RISC-V IOMMU
         architected hardware.
Patch 4: Introduces IOMMU interfaces to the kernel subsystem.
Patch 5: Implements device directory management with discovery sequences for
         I/O mapped or in-memory device directory table location, hardware
         capabilities discovery, and device to domain attach implementation.
Patch 6: Implements command and fault queue, and introduces directory cache
         invalidation sequences.
Patch 7: Implements paging domain, using highest page-table mode advertised
         by the hardware. This series enables only 4K mappings; complete support
         for large page mappings will be introduced in follow-up patch series.

Follow-up patch series, providing large page support and updated walk cache
management based on the revised specification, and complete ATS/PRI/SVA support,
will be posted to GitHub [2].

Changes from v4:
- riscv_iommu_iotlb_inval(): barriers, domain attach synchronization, comments
- riscv_iommu_bond_unlink(): invalidate IOATC on last unlink call
- riscv_iommu_cmd_sync(): separate IOFENCE.C call with optional timeout
- probe_device() fix: check dev_iommu_fwspec_get() return value
- editorial changes: s/IVEC/IVCEC, phys_to_ppn(va)

Patch series depends on (applied to iommu-next):
  IOMMU memory observability, v6 [3]
  iommu, dma-mapping: Simplify arch_setup_dma_ops(), v4 [4]

Best regards,
 Tomasz Jeznach

[1] link: https://github.com/riscv-non-isa/riscv-iommu
[2] link: https://github.com/tjeznach/linux
[3] link: https://lore.kernel.org/linux-iommu/20240413002522.1101315-1-pasha.tatashin@soleen.com/
[4] link: https://lore.kernel.org/linux-iommu/cover.1713523152.git.robin.murphy@arm.com/
v4 link:  https://lore.kernel.org/linux-iommu/cover.1714752293.git.tjeznach@rivosinc.com/
v3 link:  https://lore.kernel.org/linux-iommu/cover.1714494653.git.tjeznach@rivosinc.com/
v2 link:  https://lore.kernel.org/linux-iommu/cover.1713456597.git.tjeznach@rivosinc.com/
v1 link:  https://lore.kernel.org/linux-iommu/cover.1689792825.git.tjeznach@rivosinc.com/


Tomasz Jeznach (7):
  dt-bindings: iommu: riscv: Add bindings for RISC-V IOMMU
  iommu/riscv: Add RISC-V IOMMU platform device driver
  iommu/riscv: Add RISC-V IOMMU PCIe device driver
  iommu/riscv: Enable IOMMU registration and device probe.
  iommu/riscv: Device directory management.
  iommu/riscv: Command and fault queue support
  iommu/riscv: Paging domain support

 .../bindings/iommu/riscv,iommu.yaml           |  147 ++
 MAINTAINERS                                   |    8 +
 drivers/iommu/Kconfig                         |    1 +
 drivers/iommu/Makefile                        |    2 +-
 drivers/iommu/riscv/Kconfig                   |   20 +
 drivers/iommu/riscv/Makefile                  |    3 +
 drivers/iommu/riscv/iommu-bits.h              |  782 ++++++++
 drivers/iommu/riscv/iommu-pci.c               |  119 ++
 drivers/iommu/riscv/iommu-platform.c          |   92 +
 drivers/iommu/riscv/iommu.c                   | 1674 +++++++++++++++++
 drivers/iommu/riscv/iommu.h                   |   88 +
 11 files changed, 2935 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 create mode 100644 drivers/iommu/riscv/Kconfig
 create mode 100644 drivers/iommu/riscv/Makefile
 create mode 100644 drivers/iommu/riscv/iommu-bits.h
 create mode 100644 drivers/iommu/riscv/iommu-pci.c
 create mode 100644 drivers/iommu/riscv/iommu-platform.c
 create mode 100644 drivers/iommu/riscv/iommu.c
 create mode 100644 drivers/iommu/riscv/iommu.h


base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
message-id: 20240413002522.1101315-1-pasha.tatashin@soleen.com
message-id: cover.1713523152.git.robin.murphy@arm.com
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
