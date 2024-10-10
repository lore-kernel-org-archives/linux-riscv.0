Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E0DD24452
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=knz+45SaQT2UByoni0IQ+clsU2rcTia1Y6rWedWcz60=; b=0kOkiHDOTWzmsR
	scVTcyxkc+UiztruaY6QmW0roZZAjjdL+lwGUhfymKt3X6WJr17IcnmALA4JMGLZx7te0yRUdCRQk
	yd6gWTlIIIlhiH1xCMbNx99FUqlwfYV3rvjKUkCmZuSliAMuVCB3Dv9zbZL7FBwt4yB4bp/v7OaOm
	d44De0798JekOe+MVTJ7smTs3ADNt/qNEloPo+Bio7tKcfDcoRZkSPyT2hK6J/XkDltC/JQUNFskq
	GmVeK4k+n4/b8I/jlJJwOM9JgPiY7fOuHv/3ftw9wiTV4OeXGV8K4vaTeAvECrb4y/5hwF0z2Dvfg
	s9bo48V8UZOLTcKQ3j6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzxc-0000000EIM1-2KPa;
	Thu, 10 Oct 2024 20:40:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz9H-0000000EBh8-1Lv8
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Oct 2024 19:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=B61VLO+BRSEyfmIsrGmAx21/fZCaGHpfFXaCOhd6vL8=; b=WNSj1sOgQv2V6npB/d0mzIlQbX
	CNRU6ImFWfopzmdEk3+/tCsidpyp0jbyZ7a92n9gKhX3uUhkJrSZqr6SlAJWwNI5x6PiVIL11rVQb
	5kUrnLwlSUQLRr5ffslg+YEWUdj6G+AFrhGc3mn8umS4iZqdAGbO90PMbGjakZKFjhVRUIObaCgbn
	IJPVZslWa0bAIpQCp4BdrJmW4Mg+S9HmHlgPCXnKxrH2TQRszV3QNyyHNygOa7jdKnfMgsoVkeMql
	xOFX0SbAhSt9FFaxOMZnNYVHDLBEH8JZKPI0jpM5qq/Frvmr17vxLbb5k8JLykqqw6iScmnevDLkn
	8jUeOroA==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz9D-00000005asV-112A
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 19:48:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e2840bb4a0so1089922a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 12:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728589708; x=1729194508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B61VLO+BRSEyfmIsrGmAx21/fZCaGHpfFXaCOhd6vL8=;
        b=uXueILPVsPUDQp6mY703AqZgmkat4W4hB/KAWuGQ1rYpfI/v9srVE44m2UVE3ikLfN
         fOA1FiI3Oi7Uw33RSeYRjJukBk6MNyK+8cdKmS1b4cJ3z+iOoiBeh8UAbXHVjA01ZqcL
         q1xkTUJ1Eyf08HBQEOrA8+mpVHDwoKroMSPrG76omdN7j2JeTG+EbUuqFfSTDCG3EfIw
         gvDlq+wWVOrghqLBOyv7w5pft7tCvjFK724rS/kfHxbPENwNjvr1wdldUT1y/KrQVQA+
         +RxxC3NaUQLPIGN9uYFHu+2hq5R5SYVXNhMiQOhARJec6QjWUQOTtf+NZq04AvV5zSS1
         gW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589708; x=1729194508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B61VLO+BRSEyfmIsrGmAx21/fZCaGHpfFXaCOhd6vL8=;
        b=CDamJpvaxd1u/gW+LODeK+X3Qx1lJ0ZxwrOc/VUs6qoTiTjSYnG0g3IMeDx5gOlE5o
         3znBJ/Icbuwj0ENSUrr6qM2wkeZ0Q+dr6/Vktce40ezIXJTsHbyvg3DeQtoxG/wo1MGy
         G9ryqLjdGVfHH9kDcwOa+5Po7QHlgQxW0iGVpi52EjRwmctvQAoTwFyisKt7dStVHmMP
         zun0+jK9aUT2ODimPzPRFwjA+okjgqHg+cI9OYVjhOFxy4CtnT0xd7gNXFFJCMq1033Y
         qiL6WSn8nNKk9a/R9KL90UxF7S7/DhLMKEiRWlaAD0XVWR2FZd9vYQQWiAhRvyS/rdbt
         QvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXofqMA7A1ODladD4HX2mhCciTJwpXYrc6JNE4PCanvq9J957AObV3I2jZKcGpYPPD/2XPXiORLk+zr+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoVbPgWC+XgTJRcBanfzUSv1j643vProDnt0yatmB482243ivR
	XM0ANa2Kfxcl3twwprYHcxR7t7I6ETF4HuUciRWYh3vasmCMmAV3yjfwm2fNnbof5dEirCEAWoO
	a
X-Google-Smtp-Source: AGHT+IGhMyUe9CQbTggLp54HZtGSVOanaEnnb26ySY+CMmJkiGcpjx4Ar0dmYh7j+BEdl/j0GACsgA==
X-Received: by 2002:a17:90a:eb01:b0:2e2:8d33:f79d with SMTP id 98e67ed59e1d1-2e2f0ae8d45mr332736a91.19.1728589707698;
        Thu, 10 Oct 2024 12:48:27 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2e6ef1ad0sm749135a91.49.2024.10.10.12.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:48:27 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v9 0/7] Linux RISC-V IOMMU Support
Date: Thu, 10 Oct 2024 12:48:03 -0700
Message-Id: <cover.1728579958.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_204831_505411_4CF3DA9D 
X-CRM114-Status: GOOD (  16.72  )
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

Follow-up patch series providing MSI interrupt remapping, complete ATS/PRI/SVA
and VFIO/IOMMUFD support are available at the GitHub [2], and has been tested
with published QEMU RISC-V IOMMU device model [3].

Changes from v8:
- rebase on v6.12-rc2
- #1 MAINTAINERS file updated to point out IOMMU subsystem source repository location.
- #3 Update PCIe device IDs, use Red-Hat assigned VID:DID for QEMU RISC-V IOMMU model,
     Update Rivos PCIe IOMMU hardware VID:DID.
- #7 Fix incorrect pgsize calculation in riscv_iommu_map_pages().
     Fix supported page size reporting for paging domain.
     Fix boolean type for riscv_iommu_domain.amo_enabled.
     Remove workaround for dev == NULL in ops->domain_alloc_paging, no longer needed
     with domain allocation interface refactoring patches [4].

Best regards,
 Tomasz Jeznach

[1] link: https://github.com/riscv-non-isa/riscv-iommu
[2] link: https://github.com/tjeznach/linux/riscv_iommu.next
[3] link: https://lore.kernel.org/qemu-devel/20241004155721.2154626-1-dbarboza@ventanamicro.com/
[4] link: https://lore.kernel.org/linux-iommu/20241009041147.28391-1-baolu.lu@linux.intel.com/
v8 link:  https://lore.kernel.org/linux-iommu/cover.1718388908.git.tjeznach@rivosinc.com/
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
 MAINTAINERS                                   |    9 +
 drivers/iommu/Kconfig                         |    1 +
 drivers/iommu/Makefile                        |    2 +-
 drivers/iommu/riscv/Kconfig                   |   20 +
 drivers/iommu/riscv/Makefile                  |    3 +
 drivers/iommu/riscv/iommu-bits.h              |  784 ++++++++
 drivers/iommu/riscv/iommu-pci.c               |  120 ++
 drivers/iommu/riscv/iommu-platform.c          |   92 +
 drivers/iommu/riscv/iommu.c                   | 1656 +++++++++++++++++
 drivers/iommu/riscv/iommu.h                   |   88 +
 11 files changed, 2921 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 create mode 100644 drivers/iommu/riscv/Kconfig
 create mode 100644 drivers/iommu/riscv/Makefile
 create mode 100644 drivers/iommu/riscv/iommu-bits.h
 create mode 100644 drivers/iommu/riscv/iommu-pci.c
 create mode 100644 drivers/iommu/riscv/iommu-platform.c
 create mode 100644 drivers/iommu/riscv/iommu.c
 create mode 100644 drivers/iommu/riscv/iommu.h


base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
