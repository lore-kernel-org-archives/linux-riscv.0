Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A2C83000
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 03:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ukRJL7qoc2y9fi7JUK6FCD5ZR6Z+1f36KZ10wtHrE2Q=; b=nflKe4tUZ7Rau5
	+BI2D7Bb465lebbPlaeCTVZ9/xpAm2H5FGI68/ZKtbtmHM8FI7vBt0ZcCB1tvDni002fGV57VAAOD
	ua6Rc61erIBjmGN37aDLn3O2kdo9+oR6CaF9kO/IJ5Uf98GkXQLxyY2QiYD9SVoj9tqUfhTeOVqS+
	HceOXnrWwBdIiqH7Q66gggQ3d2PkxpKu3SVlM3eHXswoiRi4/IZOoWguTLPlJvWkTKj0YBFimMzF2
	a5cCQu7TpA7v+sxqXh2J1u+5WCh8V5dYiOmfx9nXBnCAozTMPnxXxxc2ZqwTOcWFuNMnFso4juWlj
	Jyv55ByrWYuHQBdMAEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5Wt-000000019Ka-0XaY;
	Mon, 30 Jun 2025 03:50:03 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5V6-000000018yM-3W1e
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 03:48:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2032515b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jun 2025 20:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751255291; x=1751860091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFeBhYBHOrC/0c43zTo39sGlheeTzLpojcRGicgsOS8=;
        b=YfuxqToWdGy1lHJWSYd0hpbY/6R5oWB4fxEUwEEV2YIIxnm3DyUoHYbX9HFD4ul+OL
         8LIo6QhwoFPi1D7lQTZqCVE67FWdWI9raoPlRmoLDPauHFg39HbSez7WixKDhJieIfq+
         NuUFEc86dB5cHeh97w8tnk8LUZnFi96grNb/CdTcRjhA1QRJ4vbtI/YZ62zPMYw4Xhxl
         jWRQpH3wKxf2pckLO73ifYrbU1B1RHQ28AtA311zBzeHHV+h0p0qZ2jsCc/HKnnYe7sx
         xPRWd3UjLDzAWPIQvlEr6VdWXJlVwS5VdCmfkFZgH1I2aCBhCiVATOxNgoWtCPe8Ft36
         bIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255291; x=1751860091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFeBhYBHOrC/0c43zTo39sGlheeTzLpojcRGicgsOS8=;
        b=ZcvwXTGLsd+6LdjTH7q6MykAhkfTq3YdvN4UbXKImdVOs2ek2ZYSVtiSn9OTJJH1fI
         LBurWEkmSTV1rrFoWkX3/UbRF58luh9OdcEjnQymt5b0boJfI7qEz5Yk1p+jRajGxhX3
         V9t+URsCP4TOtiBLKwEtrnW5olk+V07ABZsbfRGbYdCZBzjOJqMj48JqfJ6TqHetC1Os
         igSadMb8oVjHadUtfAooaiQKaByh4WGrdyXd2ARcxIpAOoA8DVs21egu3x0VtVN1512L
         92s1Sl12OrhxznQHzR93bwsPoyCzGOe4b82Ei2SmCko3Sb9kQ4AtWH432Rw5le4sv9zV
         CZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCWHkmfFHH+g9PgWZ/HZPHou2RLoFKAT339gQ3bcLiayh/RCqglEtrLZdwsJkS8yk0OV1RynE4VickznsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUE/8fZ3fCiiZHpaEI3EE3uA4XLu9Zy5Irb8EQCx3FlMESXL+d
	MCBzeKmZoh+pZ4M2/NONM5vEjYFKTGgsr1tjQnQ2LDGurRtfd7GHhsVL8AxPzjlzsfM=
X-Gm-Gg: ASbGnctK0cCJ0p/lFlLkNKjffixNGiGo07gziuEWOlUGIRC07veePKdpqOX2ZJW2Acz
	HGKfe3Qz8rxLQMDIPSNwMbPCFp09eqJUkJIVauu6uCWxwOTdR9bjtUuMt9IdBlBD1BMlfYvksIT
	FugKeOb1S7SqP0zTIIIfM0xUE63UMKRaUVNyjLgggGQA5fwkIr/wu6ri/sxzfIHYgUSBaqmEP12
	fygQZFsaqxE1UPpNFEKnru86RRiO5m3Pe6K6+TsxL/4z4/U+rtw7jYyCd3LpRbpHZtB9+Luj06m
	Ue6b+JC3wCkTpI7AZiC0g0sSE1E9a4MzKdJuUM2rX76TFj2+90kGWssBsyoH1zkIErgnebR1
X-Google-Smtp-Source: AGHT+IEzTTqz9HI75CbRtfblsCPZ+bl54XYhiD9/Nlz3V+rIBZOaNxNzGv638imyLy83nUUnGEXiUg==
X-Received: by 2002:a05:6a00:3e25:b0:748:2f4e:ab4e with SMTP id d2e1a72fcca58-74af6fcf67emr16315764b3a.11.1751255291494;
        Sun, 29 Jun 2025 20:48:11 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57efaecsm7837862b3a.161.2025.06.29.20.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:48:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v3 0/3] RISC-V: Add ACPI support for IOMMU
Date: Mon, 30 Jun 2025 09:18:00 +0530
Message-ID: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_204812_882214_96C6C4BF 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for RISC-V IOMMU on ACPI based platforms.
RISC-V IO Mapping Table (RIMT) is a new static ACPI table [1] introduced
to communicate IOMMU information to the OS.

[1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf

Changes since v2:
	1) Rebased to 6.16-rc4
	2) Removed Anup's SOB and link tags added by mistake in v2.

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
