Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45048C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vCQerAa0Y07TOnTTJS466MyMQSsH4f4dYklgq8PhS1s=; b=c4sO+ueyVOSc6e
	/pJqRPpb/lWSDUDC7bU0b/KqHwfhQErM0u8DYtJ+pyGNgWjBKInok6k7p7IAnhKF5iHa1Pa7kuoNu
	FrH5G4r9biGxhqnhr3titw5faCgSIZRfNOKf+/ZsSFor/0pR7Z6+ZlAkiQrIBmKPF5/YWKZKCH8fQ
	rS24q24EAnwXLOxYyLitbZ2rXkr3P6bAmdzFdyUUYt9ecN5fASW+8NaSkHVLV7KJVO5UJAV+lqexy
	C53s5kVL9uHtO/A1OZ9/chCBxUwTzKK+1bCab1Wu4iMZkGD0s1VYD6xrKWYSdNWlOvwmLaf8DS2gX
	M7G1Et1h6oUEYa+QH1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vWr-0000000HAV4-1c0C;
	Fri, 03 May 2024 16:12:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vWl-0000000HATI-25Eq
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 16:12:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e3c3aa8938so62642255ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714752769; x=1715357569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+SsYPCHFIzDKMqt+c2VcTik9i4CFhHISqpzih2Y5YwM=;
        b=ULQdSjS6Kz5YX4eXypO0D294uPQiEjmVcEVn0Ib31IsduZ6Pl1PFz9NIOaAoL2F56b
         BVAG0+mgamxQSCadKyB8J2WHiJfPejP2B8jvyg3LkzL1AKSdGC3NKHYXXQvSCOgrwHGB
         5logIy+6fLPu3joyZzpwvxZ0KDkLzZ7USGYlOCPDCFcTmez9f9JwCndhu1YcpF+s32aO
         IIHFrX1qBS1Fzo8JMnwqWG+YyKfDAX2d+qbstV1hmRy2HnMyaQBsf2VIV3OT1tUMI/XE
         aJJNptjCnCsattl59Af8lKKam588F4LRUO+tFuolGEr7eEwtjMLRbayMEwtDSFD78YXm
         cmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714752769; x=1715357569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SsYPCHFIzDKMqt+c2VcTik9i4CFhHISqpzih2Y5YwM=;
        b=CerWYSjH5G/LfWYFHHMfDHPRQRt7IK7cSy9NbKRoAMuRutYLYWBSoFvEvPPpMs/gxm
         pkqcCqSNeh8M9lq4RqBOHw6sv9hH5aUlLDFmP620NUdRQdtxBcl7Q3JQ3eUQAhketD9d
         Ok+vZ8jQqIJYyaBORc6EDO/mOkghwBkMBYlHZmKbjuxNMOCdA19E5hRmliZumZu1rFtB
         2/ULzqnAmXFbvE1DdX0PhO8xOpy1pPqib1volnLhI5CnYtDExFwobxYu3U2p38goVOG7
         T3K9ofMs8MOiRcaHe3O2cMYaYEmS07rC++Imot4JAYm3mwEfYCPXxYr/RUKQA6l5m9Dw
         6iyA==
X-Forwarded-Encrypted: i=1; AJvYcCWi31EV6+ZscUxA2c1pe5JRoUILyEVJmKvm5RAThF9ROfavJg/scONbhAqgbN2uVO9V8+bl/Edqjn3Fyv08s6DoumugGyYjpNGLpggh28X1
X-Gm-Message-State: AOJu0Yx6obzxrRMETYEfYTDq8nmjFVQcLu+KkmLLr1R/5UxV/dPHTY3W
	fxliBaiiTk12GeP02A2X8Az1C9Vf9qBBsNNGlucWJHkp72zec0HMNX7OYYE0syI=
X-Google-Smtp-Source: AGHT+IHI9LbCKHBkbWwHrBelW4UzMSUbdbIWW4nvucUsVTKhhMXlCsPu0hGFWBuw389Bh7kh55CCEw==
X-Received: by 2002:a17:902:e80c:b0:1e8:813f:4009 with SMTP id u12-20020a170902e80c00b001e8813f4009mr3673385plg.14.1714752768891;
        Fri, 03 May 2024 09:12:48 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902ec8300b001e2086fddecsm3424746plg.139.2024.05.03.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 09:12:47 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v4 0/7] Linux RISC-V IOMMU Support
Date: Fri,  3 May 2024 09:12:33 -0700
Message-Id: <cover.1714752293.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_091251_921170_CF3AA0F4 
X-CRM114-Status: GOOD (  16.81  )
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

Changes from v3:
- dt-bindings: s/qemu,iommu/qemu,riscv-iommu/, fix iommu-map sample
- device probe will fail if IOMMU if running in restricted BARE mode
- synchronize_rcu moved to release_device, fixes for bonds locking, iotlb_inval fix
- page table radix tree selection based on IOMMU capabilities, failover to use SATP
- private iommu per device data structure added
- Editorial changes: rename goto labels, blocking_domain/blocking_domain, reformat
  to fit mostly under 80 characters per line

Patch series depends on (applied to iommu-next):
  IOMMU memory observability, v6 [3]
  iommu, dma-mapping: Simplify arch_setup_dma_ops(), v4 [4]

Best regards,
 Tomasz Jeznach

[1] link: https://github.com/riscv-non-isa/riscv-iommu
[2] link: https://github.com/tjeznach/linux
[3] link: https://lore.kernel.org/linux-iommu/20240413002522.1101315-1-pasha.tatashin@soleen.com/
[4] link: https://lore.kernel.org/linux-iommu/cover.1713523152.git.robin.murphy@arm.com/
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
 drivers/iommu/riscv/iommu.c                   | 1616 +++++++++++++++++
 drivers/iommu/riscv/iommu.h                   |   88 +
 11 files changed, 2877 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 create mode 100644 drivers/iommu/riscv/Kconfig
 create mode 100644 drivers/iommu/riscv/Makefile
 create mode 100644 drivers/iommu/riscv/iommu-bits.h
 create mode 100644 drivers/iommu/riscv/iommu-pci.c
 create mode 100644 drivers/iommu/riscv/iommu-platform.c
 create mode 100644 drivers/iommu/riscv/iommu.c
 create mode 100644 drivers/iommu/riscv/iommu.h


base-commit: e67572cd2204894179d89bd7b984072f19313b03
message-id: 20240413002522.1101315-1-pasha.tatashin@soleen.com
message-id: cover.1713523152.git.robin.murphy@arm.com
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
