Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAB3C83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hPsDXkd3FosYKXaeAm/rgqCRRphk3UGqYvZBQf9aRKc=; b=498Wl/fY3qxRkm
	Bjiqrq6CgyFYqPal+cWkEnqGWqRdxy/rMxzakiaR9yt/pAuV9mPGupmjTyzPqvqgem3eylKdS7BRD
	o+ZSXZ4lzkpMUxG8nX0GDZMBOco5r79RLAzCKRRQjqnnBbKX9vdmGSHy23xwGlt1YrsTYrPd0nNXp
	8eBDdlwUHH3GcAvYDUR/jrSPcy43xAekXj8FCsAU5sGNG77l/2wMwabulhF8eXAyvH0DPDBkPHoiE
	v01cqLWCzoJpA5ZQ3zpgMqQS7u8l8z9NNR192jL1QA3WlH50GmJ7Lo6MTgBFmpxLlqo1OA6Ta2JR5
	kDuh8yTK0Q5D0KMBUwMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoGm-0000000BQrj-1wiR;
	Thu, 10 Jul 2025 10:12:48 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZn5b-0000000BFlq-2CN6
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 08:57:12 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-748e63d4b05so482942b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752137830; x=1752742630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tlwOdpvqm2WGBMA6L87u6T1227AEA6wpnUUMMQcTASk=;
        b=XqYrH3+HKaQZbWjbmArfuzkoZszQNurmsGQe7p5RDXYxQlgO5DJG1oap0Q569F+vXD
         s5swajUFA8/wF/HKCoKhQ2qBO//Ot591RmK9OpvzQoHlqA/Lfrle/71yEyLMvYZ+xP/z
         gnCFx/hMiRHOsGcY67kbm0FzH3u/ymw8vcUH8gTWzjxLGx9/Lq/Xqv/WzDBkBfgyYtNx
         OsygGHFTOCGdOQnlEERPKXr5nDNvpv9htYFe55ZRuStsN1PCU4PnllZmka8AFVSuO+nQ
         R+jsFVprjCCu4y6mckSYDUzzK2RmepodIXUhQoR5wzjUW0+hfjnyN8umre/cb2Z44cpt
         eWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137830; x=1752742630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlwOdpvqm2WGBMA6L87u6T1227AEA6wpnUUMMQcTASk=;
        b=Sc+DwRKcreKUqIaDe8jgRiLStNj81n4dkJeHK3JGuk9OoejtXZT3g12OqbDY/hEvT6
         UT4DvhSBSmzHAaitfIOkahOxX7KKrX4FFlscynLU1JBSwzKn03a2dRgi0INnkjBPPqZj
         1vtCsL9MLP2JuDoutq0ceiyYFrKfnuiMn5aioI41aPZtd3BJ1JSLSyk84e7UokXXLNob
         X3k+X4zNQM5+5YW0i2iswNFBLkbCI1OUEWhZ0qSY0aM5CIoyWtHma5+0uzD1X0bWXccH
         ns+V3BZfYbyDFebRlLHemc+O03D+K4LpbY0jdhSbHdBD71VY9VMMVhcIwmTmkIE6BFPA
         K9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7Dct9CR2xN/0Hz6r1yWiRSFTLYs3y2LIUDCqy8YBDlamBnDpMKH68lIx3BaFrWRZPfLcs15Mm0+GqNg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0S83QboSsmC+pYPtULqBqUylOSLwRZ3eJ0qdVGKOO2YqS71MZ
	2lrpSXlErDrViZCAZccrxmbrO5NIcpvlV/x44ET8KnePJHUu15kgnV/5HBfegjFUFaM=
X-Gm-Gg: ASbGncuOMB9iIYlqvVYJu7qsSJey8Lg7cK3/bThmm8mNZGkX2WGmfEEwI2herLUQTTe
	yaYM0Cl6N6jWEDxUs4db+zWPH1pB6kJdvR5j6zRKqvbeKR2F2flTUgsVPbb60WVQFOPcsbMDuNx
	Ey09tf5RYP8PkHg5sB9/oFzQHO0eHplcApr07G6CEEkvLR0HFk8VXSuYMuHDKinDkxa9UYbNl6x
	2N1lCi5WUYKyq/NaD69C1p/1orePjEjShyNT01uIKzG2Er6l4rD1ah3IFBCsQh2jU5tPpmT8phR
	qyiWFIPbib4kgNxuFD4ykYgFHgBoVcEr2MnbhBE2mRpxCJmgJEPSJcnhmORiR9fM8JLiJarP
X-Google-Smtp-Source: AGHT+IG3AYRQgNXjyXFYNRoL/ZLuNKUvG5hVCj8blaqb5ns3MkUlB3z7gJs1Bhkd61noA6Imw9KgzA==
X-Received: by 2002:a05:6a20:e607:b0:216:1476:f71 with SMTP id adf61e73a8af0-23006851993mr3438087637.39.1752137830282;
        Thu, 10 Jul 2025 01:57:10 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe52ecdcsm1522323a12.14.2025.07.10.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:57:09 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v4 0/3] RISC-V: Add ACPI support for IOMMU
Date: Thu, 10 Jul 2025 14:26:54 +0530
Message-ID: <20250710085657.2844330-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_015711_566836_81411201 
X-CRM114-Status: GOOD (  10.53  )
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

Changes since v3:
	1) Rebased to 6.16-rc5
	2) Addressed Drew's feedback on v3.
		a) Reordered calling rimt_iommu_configure_id().
		b) Removed unnecessary inline.
		c) Added pr_fmt.
		d) Removed redundant rimt_iommu_configure_id() stub.
	3) Added Drew's RB tag in PATCH 3.

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
 drivers/acpi/riscv/rimt.c            | 520 +++++++++++++++++++++++++++
 drivers/acpi/scan.c                  |   4 +
 drivers/iommu/riscv/iommu-platform.c |  17 +-
 drivers/iommu/riscv/iommu.c          |  10 +
 include/linux/acpi_rimt.h            |  28 ++
 12 files changed, 595 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/riscv/Kconfig
 create mode 100644 drivers/acpi/riscv/rimt.c
 create mode 100644 include/linux/acpi_rimt.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
