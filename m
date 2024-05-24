Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BC5C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=chdExFr5tx3JXCbh8Hq9OHRfQlZ5nWb2rvXyLLHCJi0=; b=F01fyKZl2mOKq7
	GJw4Fe+AA8mGaqzbwI/j6LU7ntyJLLQ2SQJKJA2AJyk2yxO8hKSWvZvJcREIrzDDBj/Z1Qmbbx0xW
	8YIB+Zhficbn9GVGnYHmg8wxwtzzIXbynCwJgv2HqunFmkq9BzwHF+t0Ez8qb9ucmH0mBs+nDoEQf
	FN3ytREH76vwJWmBSg75UUxeFBCwnOxtpd2a7pP03Ry+2k5LvXzJXOAix2Y8522yTnms921tcy5mq
	Vy3iJtsemCGJIgqE/M5KmYF1vTfobd7GL0WjUgwyuzG+v5JQU14pH3fSk4gvbJyk1H0lxPeYhIL39
	iOo3OwiDdV6e/Hf70PVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAah0-00000009i2X-25Ti;
	Fri, 24 May 2024 19:35:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAagw-00000009i1C-0ZrD
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 19:35:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6f8e9555eabso1145416b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716579300; x=1717184100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=twMRxUCtZSr+seZ0b3xRB7CPy5cBgsYTAlk2ZKA97pU=;
        b=Sftr3VNp0BzaQ0LyAyzHOATRohhrzyo7N3bNwC/xDUBKlwkBZ/XBLPn+nnjjP8/YAi
         JKF9S86MAUH2g0xMpEdy/xjCvB0w7Iqb+bLqOUEQW2x9ltpvhhx2FnWpEfMck7o8wUKT
         cBTaDhb+gpFbonKPlRwUPdeQ28/h96ldH5FxhHHyxBB+CePHzJV5jNcQEa8YpalcFeH/
         50WhLgv/cUEKX/ZyQ0k/qVTQrXpBcHnxKG5WPm1NqQeqEV+hvR4HZMCtNFHzZYCUek7/
         eqhq0CSDlEfwjO3vTtTMRitFcwaxBTORzA9Y4L3vSMfln3xDezOWTPPxxdIukLD7XCGU
         tWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716579300; x=1717184100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twMRxUCtZSr+seZ0b3xRB7CPy5cBgsYTAlk2ZKA97pU=;
        b=kL8C7maxuR/ZAi+HCyMzq3mHXpZ93zyFjsTvvOXZLCChnF+f9uSwUpfqRcJ92mylui
         2Hn7dAOsez9Fi2HW0k+rC81ycpq2cSL0lDeP4os9OURo1npDASDXUxoEFkuLL1aUOtU2
         XITfStcOlXLaPmWUoOYx1RqbrunieWtozxiqwoEc3ZslS0Mo8tIJlfo8awAKpjn83GGm
         f4RbDy9/izp/iNOYFRWFHN0+Cm0ia8LUzWYnNUdPbGHjJN2PODhwszq/3h2Z+X/87OLK
         1I4xB8HWkP2jgmUsdT5qIRNnudPj03oshcTpt74usujhfxHuHFb5Od+d+IeD4THwbYS9
         zwhg==
X-Forwarded-Encrypted: i=1; AJvYcCWWyKejcHzy7y6yxIRUu/z18cWL7CFSyNnxpcB+aYJ8gGsXxEC5lpcf7CuSNJmUsOFUjiYzyBDbsXvWe/XSyQYzocGOxv+kCT4YPthmuP01
X-Gm-Message-State: AOJu0YzpD9kgksQ0giaMTzU5i6uCeSDaAJfueE/F9asDAW9Fxb9pbAMV
	cRr/0hflFzXbsL9Eq5xlM5eB6qzvFm2lUHAAXu3840l1nCi3NpgtNMgVfgVTdDk=
X-Google-Smtp-Source: AGHT+IFfYlOaukFeK0Acw8qQh3bHGn6ykj/ULsrJMIR71cvO0RlraJSJAmP/NYucgiy6i5xZ2M+0RA==
X-Received: by 2002:a05:6a20:9485:b0:1b1:d32f:38ba with SMTP id adf61e73a8af0-1b212e17127mr2979231637.42.1716579299800;
        Fri, 24 May 2024 12:34:59 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4d878esm1441684b3a.190.2024.05.24.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:34:59 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v6 0/7] Linux RISC-V IOMMU Support
Date: Fri, 24 May 2024 12:34:40 -0700
Message-Id: <cover.1716578450.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_123502_213800_95F969B4 
X-CRM114-Status: GOOD (  15.98  )
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

Changes from v5:
- rebase on master
- fix dc.tc.v check in riscv_iommu_iodir_update()
- fix to use list_for_each_entry (without _rcu) under lock
- editorial changes: comment spelling

Best regards,
 Tomasz Jeznach

[1] link: https://github.com/riscv-non-isa/riscv-iommu
[2] link: https://github.com/tjeznach/linux
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


base-commit: f1f9984fdc5e37303d7180ff7a85dfecb8e57e85
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
