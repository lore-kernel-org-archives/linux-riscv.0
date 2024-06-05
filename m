Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C177C27C52
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 19:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lmq6mPeoNROqMvTx71OT4Qc2L2hhaoRoVtJkAFx8AEs=; b=SVSIds0xYErgT6
	0Em+XxvVPDka11EoopO/CgyF6WISgIz/y6zeI2GeZW5GHSBh83gW0IGO64eQEjlOvEn8myLATXVNC
	CCwnHVmgit5aTJ7dXOlHiLOcYe+VUnSgmFZTkkRTQ9YYH9zqrXHoyTwL9OdUysv0bxxHmcRa5hhYT
	qPkotAfszz+mi8Koo7QKmwsXEsAHHwctvSUglESKbwuejThfDLuFwxIGA2c79uBa6HKlobXt7ouxt
	3WSkjc47c1vUT9nJOGyT375+n8Nggm/xsvGnLsxcT91434NWB2ufR321scRaDDOR9ujepv5Db57+g
	NtBZHjLPriHL4qVNTFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwlm-00000007NCP-1LwE;
	Wed, 05 Jun 2024 19:58:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwlj-00000007NB4-1yvq
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 19:58:01 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7024494f7daso136061b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 12:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717617476; x=1718222276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ISuOcjK6nJKqnAu/IEdqzzoElkUOKEX7y0pHx2W7vds=;
        b=Zicb3RlJFyVKpD5hXDerXjTom+lWr0JzXOw/0oEakP9XXkoo9tE6VaIt6Fe2y+iC2/
         YzuvPT1b3eBC6SGFT1kLYG61gbrtAyKWTSc7SuXGAaiphhp3KVdtEQ5hyc+Sziv6oBSg
         jTCg3P8Q01IJrY5u8+6fxFqiZ1wI/506kpeCyRg22zKyvPDM9T/TOTigaPM8P3eVpHDR
         591294o1Fqj7nwsuqRGf4OI7nYcL2w9ZtjU/Eu6ZGDm7F2otcI0Ct6Jrzq1qzoHA3P1u
         h1TPTH8mdmwUD3zjQpwu+JDU76TXkrmm28NCs0gLo121uQ4pM9DtQbu6Mxi1QfRjLCBE
         3kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717617476; x=1718222276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISuOcjK6nJKqnAu/IEdqzzoElkUOKEX7y0pHx2W7vds=;
        b=s2iErxd6FbOnf/9ooQZMXU2rU4SkwZ2n3SC2gIleXpBtqo9s27xJ6BxQl1G/PogbH2
         AMgYreO7/uI6jipkmrPaENpIC94sQH4JJUwajYhvMKIkK9XX5+lemnVi8qUvILAQTvcj
         fKxi26P2bQDju/qjuE3cHkD9sf0OH/wFjsBL6l3GPxNfBGE0pgZIC4IE76CuZ+XyuSPp
         lMBMXhyOMNCrWu+puOuYgj9TaUU/zhvvLD1w+wFqKl5+f7XnLwgPexyZoHa2YMJOg86n
         OENbgu7t6idejj8cpsYQ7YlKX7YcCRrhXPZu2/yFFdHb7Nhu4aJSfHqP437zTKptSPyu
         SgKg==
X-Forwarded-Encrypted: i=1; AJvYcCUCYXcd0BGfGENP6QHZlLRGP6V3nJJYpJzwFGyFBHIH91Q6vCKpe5tyMvVTcYrGAV5Qq+qqIBmWk16F6fweGOhUwEwpTnpKFhfYCgsOOQ4j
X-Gm-Message-State: AOJu0YyxPFHKlCf4DSpmKI+gCjPlWmwGV3Qb7/Ff9Okb85Gu/RLUSoLl
	mvR5mC68d+6X2Kp5PF2pXPiglPW6vCJ45Y8b592HlfoM9UOXCWE3qSMrfL0jX9I=
X-Google-Smtp-Source: AGHT+IHCjuOWDjOPKFWsNkX8yL3PSDZTll04mMQb3hcxhcJpvd1lGdIxeYB8M2evG2kMCM9zEi8BsQ==
X-Received: by 2002:a05:6a20:9492:b0:1b1:f0d4:71b6 with SMTP id adf61e73a8af0-1b2b7186cf0mr3529279637.54.1717617476365;
        Wed, 05 Jun 2024 12:57:56 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70244900ee9sm8664209b3a.124.2024.06.05.12.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 12:57:55 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v7 0/7] Linux RISC-V IOMMU Support
Date: Wed,  5 Jun 2024 12:57:42 -0700
Message-Id: <cover.1717612298.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_125759_547580_DF68A68B 
X-CRM114-Status: GOOD (  16.29  )
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

Changes from v6:
- rebase on v6.10-rc2
- editorial changes in iommu-bits.h addressing Drew's comments
- fix IOVA length check in riscv_iommu_iotlb_inval()

Best regards,
 Tomasz Jeznach

[1] link: https://github.com/riscv-non-isa/riscv-iommu
[2] link: https://github.com/tjeznach/linux
v6 link:  https://lore.kernel.org/linux-iommu/cover.1716578450.git.tjeznach@rivosinc.com/
v5 link:  https://lore.kernel.org/linux-iommu/cover.1715708679.git.tjeznach@rivosinc.com/
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
 drivers/iommu/riscv/iommu-bits.h              |  784 ++++++++
 drivers/iommu/riscv/iommu-pci.c               |  119 ++
 drivers/iommu/riscv/iommu-platform.c          |   92 +
 drivers/iommu/riscv/iommu.c                   | 1677 +++++++++++++++++
 drivers/iommu/riscv/iommu.h                   |   88 +
 11 files changed, 2940 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 create mode 100644 drivers/iommu/riscv/Kconfig
 create mode 100644 drivers/iommu/riscv/Makefile
 create mode 100644 drivers/iommu/riscv/iommu-bits.h
 create mode 100644 drivers/iommu/riscv/iommu-pci.c
 create mode 100644 drivers/iommu/riscv/iommu-platform.c
 create mode 100644 drivers/iommu/riscv/iommu.c
 create mode 100644 drivers/iommu/riscv/iommu.h


base-commit: c3f38fa61af77b49866b006939479069cd451173
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
