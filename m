Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D68CA0EF2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mj3V4+cpU4bvf3aOPxmv01BsjyVgiGaBuQ442Q1mCNQ=; b=JHl6nYEWerpPQj
	HU7Tg6+Rgw9c80cudT9wO+4r//kOhCubTY/TsX7dmL/SrRX0cTTi7aHQMlNNFhnNr/Fw8PprIVJA7
	xf2RqjqGDr1sqdGWUiu+1H1GI4flhNYm/pjm4IEoUd+kfzj0tSvhKb5dmAiIGkzAbJ144/qSlrCgI
	TRSD5cQja2PY2Y4q881RN/bvLaE3xQUMgBcdr7SlfXY0pBw1dzG14JJVe9DQ0YbipHFoBX+YzyI5E
	t+rqqZJy/2znQiRpWhkmmHZAH+jIuzN1BFIlCqS0FZTvrFbGOnrrJqGJpHQvBOiha1tUcqS8w38Tn
	MOjf2aVgRVnQ/gkrm7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unue6-00000006p7r-2UN0;
	Mon, 18 Aug 2025 07:51:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrwm-00000006Vbf-1cEv
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:58:17 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b474a38b25cso264013a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755493096; x=1756097896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3V/meoXkl+wsGtPedKQJxOsDVawZ6HAz5fY7bg7lxk=;
        b=k5n8CPvR4En5SSGvRlyfxN6HHEaara33wVpJjMEypYbkfgL4K75i6i6DJx5p0IzkmH
         2dU0K6OjN83Osk5BYOSOpdJ4pcRQivA0Nm6O1bZ4FQbaWbkVMQ6a4QLovkKZhtDkMKtA
         xvIT+DqD9qpQiOc24vs0UejbIjlup17KZMBAthvf453RjDmucL1DQTfJmbNjWl/yY47R
         t4PsYJq7UWOabmCclGWD4vInhw3iYP4+EP0JdezORqJ13MojRhWRUSr9z2jyZV7dCpIe
         50NxjhNhDVboRusME82YXxPCDinKmY8o97k7cTiC/OjxCkWTd2KAbQ5pU3iQxqr9qnZx
         hyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755493096; x=1756097896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3V/meoXkl+wsGtPedKQJxOsDVawZ6HAz5fY7bg7lxk=;
        b=vTr1apHf9IX2bsxJudy289FFu7PRwJoKujA/fo4xIyKq5bXVGgFG9pAyXfxQDJrrnm
         lBi+1dQkCT6CLIg/VnosleYHpzc/5jY+/oivtdVNsL7SPFZ6BWg1hTXgVUn7pGXW+9J7
         odViEdBb47JJetbQOzoH9T6ict5JDsE7i+y6hmZbicAyJezzbS4KuJH7Aih57Lnzj3A8
         timjI44+r53PcRT0l8Vx6115bShj8rNzEEeZ21oVIvfnpgcvZgvLztdORPtQ3fyGgpJ7
         BMs50sBxE1ON+rdBCFKLQwClWgxRayPWGSqBeEd0wJBoE51TmW5gxzDWLvUEFMdJdipo
         MoTw==
X-Forwarded-Encrypted: i=1; AJvYcCWB9AM8O/1e4ilFiiRjGwnWwtxW4xAukENJsjAHnKegswHBubjYYMCF6FqHfIJCa24HC2KtNx9JLXqeTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYFSgDFfE61pv5O4kNQtoneP9GqOkWq7DV4BGjpMB5RhHYMP/w
	1Q6FZ68aGyKArXkpCc3oAtdxLOT3jPTyy9uGWqssikku5lzNHNE3WasQWcm9+PJrFsM=
X-Gm-Gg: ASbGnctOM3JOMSqsuYUoD8kSZXytFYcGvXejvtCtEV8iLG9LZHbX46p2DAjFJcjUcRL
	/TKHb/Qd0Tvln1H87rxOe9+00XE+b5yIlLFwL1XA+Xn6OJWG2lVbw7d8idtcwxfx9LltYHfhOS5
	Y16rHv965RHVo4wA6IUeJzFQTwJAk4o7doxxufLxi2+yF1hdkrFFGdrg/o+rJXZx3Xyx/2pi3S3
	R0qBjpZIHmh/SWsTxGQUlIcEnpyoUhwbi9r2DCbKkmfFiTj2iL+My1sxSs70W4bRBqB/P1RYO7I
	Ld1aqcyn506zt+s+kTqB7v05YD9p19dj7dmNYF5QPbKquBr9L4kvu+QK5gjtQy7e/W6y2V1BeYd
	tFHobPiyo5sV22Zv0g/o2HE06MkcA1Q==
X-Google-Smtp-Source: AGHT+IFCk2BSwqNgThH6PEkau6i2nlNB+untLX8ay7e+tXj4jOXYDkG8+9f1odmZ7Mh1rjQjGkHVpw==
X-Received: by 2002:a17:903:b07:b0:243:7cf:9bcf with SMTP id d9443c01a7336-2446d71ab96mr143054605ad.2.1755493095547;
        Sun, 17 Aug 2025 21:58:15 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4528c264sm6124047b3a.43.2025.08.17.21.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:58:14 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 0/3] RISC-V: Add ACPI support for IOMMU
Date: Mon, 18 Aug 2025 10:28:04 +0530
Message-ID: <20250818045807.763922-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_215816_422750_8884AF11 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for RISC-V IOMMU on ACPI based platforms.
RISC-V IO Mapping Table (RIMT) is a new static ACPI table [1] introduced
to communicate IOMMU information to the OS.

[1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf

Changes since v5:
	1) Rebased to 6.17-rc2
	2) Fixed incorrect id_out assignment (Reported by Xianliang)

Changes since v4:
	1) Rebased to 6.16-rc6
	2) Addressed Anup's feedback on formatting.
	3) Added RB tag from Will and Anup.

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
