Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FD6C2BA1A
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jun 2024 05:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=REbCgSYKWIkT71Ew2H4gUY0pfNdE0RZfRAwXTUEAHb8=; b=RlShOzKvsP0HeZ
	IFjQG9wgc1fxrp4nKw42VEOXvPT0snQOsq7hBOb//DcbL22+Tqdv/fvgo7NxbgXCzAzk3xSKmNUoK
	aRFhhxUB9FsCbZdflaB5Pr7Nt/K39grzpkK2aqmyryswYMuR/hEvGpWkkwizHEUSlu8LK8or/bwrc
	35qH21zU8KGcS1npucY4UblD73o8bcfdmBGGMuOLiynUOEH+0fBWzbarY89IxCulvs5ccasmRiu88
	LJK4kFA38myNhUUlnHbFdRf31NnwfmjRT1r6bozP8aVnwbxhak9QQnked492Y0B61c0U7EP89E8wC
	hUlIm+z/xYP85TtyzUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sILxE-00000004iX4-3MlX;
	Sat, 15 Jun 2024 05:27:56 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sILxA-00000004iVZ-2wpt
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jun 2024 05:27:55 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6f980c89db8so1536821a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 22:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718429267; x=1719034067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4HWY3DwYhS1DC6ssfyK/mGNM91IszoPLT/Xd+boZpqg=;
        b=11CncUlCIdHxuMNJOu3ZYXCCNQSqRJM8Sa2BNLTj1q0rnSgT4y7CQ5qOIx5KWz50Ks
         Xn91yBD6pMhVylcTdzEVRyA3eTEiyn3yz6daLX8FURV1XQFkvWj+VrLXoEftFlSqcV0S
         QHpoKvBwnST0MsU/kWaRgqGHiIIRF3YnW0ts5qeSVlbkWA1kVYHlUzsluVQI5J5ykfbg
         ytO/2XtjgSP97bX+8eP07oaTpTGZ7X/E4ykC9YSqkx8y0pofpBmWLgxZW229ZMEiZWvE
         PitoKOHqLV4mjTeJuYA8MLLBbJaURD6u23AurSPlHqgJsarTADeeEq9EgVSR4WV+d2WS
         eaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718429267; x=1719034067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HWY3DwYhS1DC6ssfyK/mGNM91IszoPLT/Xd+boZpqg=;
        b=RQoZO8a2itocXXwcrWqDbEQ1NeJMu4B5NjRiINJkgEwxG7TuDWsmV1cHhQcpI1/AXA
         xIDKvpPcA/tFcLxN8c9FmpP/twjMrWKFBqLvN4LTfBNZaLrbmsSw/Wd9FPee1aj0yTn1
         iuPhZBkJvusHsq7LrJH9SkXYFROQR/LwZM/pdL+PFWK5eSIpYKM7A1/km1RfM5te/P+T
         5Tzq6p6SSXcBAjP89cKnpjOuj8Rpei9n9eYSQOR9XIkeizxugEOO0TPK9Fq8zzQZ4yG7
         4jRvoQBPiXV3MSuDtgh/9VONnU5ZSEqhxoo3+ylxGAQZhJlISbX8zQ5dHeEr8NuSQmY7
         SBUA==
X-Forwarded-Encrypted: i=1; AJvYcCVI03YUb0EEOVdTXkQPducd6XJydHF65unnxWmoy8sQzPAzgQBKoVD+m/HzkoF23yslfkupVYSKqVYxXO7uuQqfttf1Li2UYBV/CjnRp2x4
X-Gm-Message-State: AOJu0YwA+TV9+rZcU9eSwQHC3gnxrYHZcSMYjlipwfL39OT770yCzTAo
	/VPyWu9kDCBCzRq+tnjf3Y33HckWvmL5FdHgj7lSEDU0S1GG+O26iLlCRcHlXf0=
X-Google-Smtp-Source: AGHT+IEkw9bzoLUdXSiey6gWd/rfVSdgAg0oVru00fWS+E2CLByqzysRddxec15KuDMJ9oecqX3IyA==
X-Received: by 2002:a05:6830:3443:b0:6fb:8193:85dc with SMTP id 46e09a7af769-6fb93b07c46mr4566313a34.30.1718429267234;
        Fri, 14 Jun 2024 22:27:47 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b99bsm4081578b3a.143.2024.06.14.22.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 22:27:46 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v8 0/7] Linux RISC-V IOMMU Support
Date: Fri, 14 Jun 2024 22:27:30 -0700
Message-Id: <cover.1718388908.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_222752_878552_7554D157 
X-CRM114-Status: GOOD (  15.65  )
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

Changes from v7:
- rebase on v6.10-rc3
- fix address shift (ppn -> pfn) for queue base register read
- add invalidation after DDTE update

Best regards,
 Tomasz Jeznach

[1] link: https://github.com/riscv-non-isa/riscv-iommu
[2] link: https://github.com/tjeznach/linux
v7 link:  https://lore.kernel.org/linux-iommu/cover.1717612298.git.tjeznach@rivosinc.com/
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
 drivers/iommu/riscv/iommu.c                   | 1684 +++++++++++++++++
 drivers/iommu/riscv/iommu.h                   |   88 +
 11 files changed, 2947 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 create mode 100644 drivers/iommu/riscv/Kconfig
 create mode 100644 drivers/iommu/riscv/Makefile
 create mode 100644 drivers/iommu/riscv/iommu-bits.h
 create mode 100644 drivers/iommu/riscv/iommu-pci.c
 create mode 100644 drivers/iommu/riscv/iommu-platform.c
 create mode 100644 drivers/iommu/riscv/iommu.c
 create mode 100644 drivers/iommu/riscv/iommu.h


base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
