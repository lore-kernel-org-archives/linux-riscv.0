Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B8EC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1c3TY69vVIEsj9wnnoLPRfA5gNYOCPu9YMyeiEMoDLQ=; b=q8Zhq16Ld1V12e
	2GiITqH42SJjVI7XSNqEDBABtm9uIysn8cbFXtSxY3lOpjtUs1fH4hAlUu5BnMu1BBwudNwSZwGSS
	anK0YlTyeiL+Ag9bMR6gb/ezYLhx4vS+MNPq0W6oSXG068xYcrghzZYme3j4HwHixHsrMBsPrF6k9
	kxur4t4Ld1h+D5LJ4/k98hn4OSRHkyD28XdNyH+GM7XOJPBgQ2Axkyln9NSdMdzpO4aACv0oQbZ9j
	wZdYF+FV0gL0WqY/YU9i6mv6vmsMcADFBg8aeQV/sekBuvGiOymD1IagjAt9R94m0iTk+lf5Ptxd0
	OGgvHl+2jZ6AoYSzJ0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwpa-00000006bxO-42Dk;
	Tue, 10 Jun 2025 11:07:50 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwVJ-00000006WrG-0Gzv
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:46:54 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74849e33349so1908951b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749552412; x=1750157212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7MV4ZMTiUsINwR8be14xviGNX2303UWr44QeNbdncU=;
        b=cmvOBSyyDhjLhDrTFssVONZV4nUr6th6/chVLWk0RFsWa4uuDvBVKcSmyk2Rgig8i2
         7Yle+xKBVYBnmYRjtYTuiarXMCsOk1XqV297XtBf1O8e3E0JUUPHdQ4k1qQL8a0nXssS
         DhjygDHY3aWXg6G0FFkkmKE+Xz0QBRbB0ebh/U6OGMZBFp1Ld95nfE4RT6UZJyUeWR95
         y968O2OH5p0wypsqMTn41zVmmiqgN9FtYShZtivYQi1ierVcgyhoD5wczP5Vpqy1I/1n
         BazMjQmdWgbzmakTfjlQDT+/DErkxLnqJHr/h5wzWNX7XLDyyCUlvcwZsDkfB7TDyor2
         UMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552412; x=1750157212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7MV4ZMTiUsINwR8be14xviGNX2303UWr44QeNbdncU=;
        b=FpEbv8UhT1lwc0uEstIgze14jq9lb/gRK6AaDM6pKg1BMtInhFfG/KlROV2OWzqkOQ
         CUaeyfukoehcYsNcoxwOXGeMTHMqFSfrzfFhm9PfGoit3Lu9p5kgmjn4mWw+BYGzB3eu
         fU4kz9RuRZ3dPYIM/VbHLrOtvGtF9B+EgfbqurjJhyds3S28MBawufApHj0ZWwa7n8Ds
         b81cjUzH/xWvGZZn6hC3rgQNq1iFDjIlSPA0OKw32AZptQIPy4xb/OBpG1m95FUAXi57
         /xP9csWfVGbdEogWjP1Uw+ZmYsDAowcD61GqFgUuYiYyZT0a3E8fyFQSYYC0cOaDKIrS
         uqzw==
X-Forwarded-Encrypted: i=1; AJvYcCVVYGHNZQU1cQKjORqgdvwdltwZ6TSZlPJsyo01hRcFrN+mIbtCqy8vCtx2FAiP16GQyC25aU01SQGnaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEgzhv+nXg3ReowrcUAR1Z6xIqL7DC+pzFOeomQl1GQkz2DwOb
	RXFuXJDk1yE3qF/b4rstWx/Kfei8fLxHxexlvl+nnVg4YSdxB2NdeiHMEoxzqXKur7c=
X-Gm-Gg: ASbGncsJ0KAYzOv1Y9a7A5rm5xtZPD19g/CmdNzaTH7CFqMipiDaar70ty/rPXZD8SU
	4fwsYGdweA1+gld34IePkx0my3fATKcggxSde8G7am7oaIxcwp6f11cEqcOKNXPX8J7tJ0b89Yj
	rS2XkqLbePjXY2TFbL9rDkKghFAtyoApJ5ovR7laF7EQmWOP/rrTMtDfh1l1Dq9Q21dBayWx7gL
	SwJMVzFcF+P7UCkCb6TKO8Qy1o6IFWeqvkm8kaGHFOwMMZEuYF+bgN93q4GCxRw1psXnycCCG44
	Fk4UDALJqjbQ+dTioi2k9Jr8c6XFFFW5LXJrAwXm+mLYPxyK2BPPK8v+6teUGCMgMFyVtoU+GbB
	CvtU2B24=
X-Google-Smtp-Source: AGHT+IHiwomQ11rrELOJ2Yf8/Tcge6XeBMEJudTG7v72UH6QPTwRLqU3OkHUxntGY1aE+8OCZaxGTQ==
X-Received: by 2002:a05:6a00:10c2:b0:736:6d4d:ffa6 with SMTP id d2e1a72fcca58-748618a8e87mr2593505b3a.15.1749552412214;
        Tue, 10 Jun 2025 03:46:52 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7152448b3a.73.2025.06.10.03.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:46:51 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v2 0/3] RISC-V: Add ACPI support for IOMMU
Date: Tue, 10 Jun 2025 16:16:38 +0530
Message-ID: <20250610104641.700940-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_034653_128453_B5CF96DE 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for RISC-V IOMMU on ACPI based platforms.
RISC-V IO Mapping Table (RIMT) is a new static ACPI table [1] introduced
to communicate IOMMU information to the OS.

[1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf

Changes since v1:
	1) Rebased to v6.16-rc1.
	2) Dropped ACPICA patch since it is already available in 6.16-rc1.
	3) Added Rafael's ACK.
	4) Fixed few issues found by bots.

Sunil V L (3):
  ACPI: RISC-V: Add support for RIMT
  ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
  iommu/riscv: Add ACPI support

 MAINTAINERS                          |   1 +
 arch/riscv/Kconfig                   |   1 +
 drivers/acpi/Kconfig                 |   4 +
 drivers/acpi/riscv/Kconfig           |   7 +
 drivers/acpi/riscv/Makefile          |   1 +
 drivers/acpi/riscv/init.c            |   2 +
 drivers/acpi/riscv/init.h            |   1 +
 drivers/acpi/riscv/rimt.c            | 523 +++++++++++++++++++++++++++
 drivers/acpi/scan.c                  |   9 +-
 drivers/iommu/riscv/iommu-platform.c |  17 +-
 drivers/iommu/riscv/iommu.c          |  10 +
 include/linux/acpi_rimt.h            |  26 ++
 12 files changed, 599 insertions(+), 3 deletions(-)
 create mode 100644 drivers/acpi/riscv/Kconfig
 create mode 100644 drivers/acpi/riscv/rimt.c
 create mode 100644 include/linux/acpi_rimt.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
