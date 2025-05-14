Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8D4C3ABC5
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 05:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vSFn+Ac88NHX3vCEiXT8QJBJ54WfWiIQFDfBW4pIPjE=; b=hG6Zu9nwlDplwN
	2/2HcRDe7NDIkrXA/1rs2eN9S0ijKyuY5l8VJM21PtIhcGAhYS3oFAPnC3lDhYboqV2jUo+6GGnoz
	jJ1vLx19tu5ItMW50kqIsVVtCop13ST+MwXuQSh9gQp9QeDQCUsgYiBwIDMatIf/X8h79uiqcCSDF
	K8dbtLmx0rKoOeXItqS4nTo6gpk64j7tNKUNBm2g1vt8EuC1P/cpfxMQD0OxxQ3ULqbr0GYWOqHwO
	ELsWa/RSaDMgq8bOCKc0gVxQ2G/Y+YGSPmwTttSgCsF/JOOKFwMNXtEc4KK3NQ8L9FTpUdDBnRsga
	9aa0JNU6F9AEeBvVu47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF57a-0000000E7IL-1Ean;
	Wed, 14 May 2025 05:57:38 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF57X-0000000E7Hu-37iS
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 05:57:37 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b1fd59851baso4212887a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747202254; x=1747807054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7VBon2ln4fM6kR0PL6UdXDhBglynbmL1e31ZWLd3nM=;
        b=U97eaVk3PtNjw9z+dbR8AZwd5stLiHxf5b6FKW6F7YEui3vOlU8prF3Kvxh90zBrrX
         XBXnJoy/kVt8LchC6uwWAgu1kJZm5rpQ4OyFATK0OAJdI5uncqio1QZSzXylj+lAtO9B
         ulkLl5mpiCggZVU14M5RrY7WoTZQ6DCjGhcW1nuNZBZLM3dsIq/uyauOXbOIrNyv8gse
         LkNgh8eyf9L/Q4iIqf2h+TXJA9ju0/oBR5bf3hRw5f5x5YaJK0LH4DfHdN/0/Bl2TFGj
         8Rh9BCnr2Dpveu3yXmcb0Ox07qytKpkhz+rZXd86l9g3bGf47zkX7RkVNDFoc9Vv1fQX
         GW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747202254; x=1747807054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7VBon2ln4fM6kR0PL6UdXDhBglynbmL1e31ZWLd3nM=;
        b=iD5oYl5NZXbKualNC64Vo/FgTnUgR09uQ7s/PU7vbPCrXRIfzEWhkSMn0QBcj/Vq2k
         MgvQ/sjTY5bvFjme+LRFj5nhAahl2G7pUZTV7ZPDvSwPAC3crzrSc8hhMVoJbPSZSpI+
         5mIehfnI277d97WJDkOgTh/NapiPNDfRVEF/lPOfL8mppZkiEGuLh9NkJRFWgdU6ttlw
         eg/C2s2BOvntYcb3ZS9RewEv4zOZ2uEKHcGggDcbB5QTKxeNisGl6n/Q/TRszY1wGDuq
         1jobDXtz2TtvTqE63ZmJ4sfP2WHb5NF2lURldDphGBbA8H8TpWruuOa9YhWLZiwAzI9/
         6zbw==
X-Forwarded-Encrypted: i=1; AJvYcCV5oWIRRotugYnAsX0Xd6n9SvCam+BQ8pZYN/FNkK0oJgPTupD0bVu9F6ZjcZzqFYpcUuEL0xwW21Apbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtdrE7NkJoxKDqf0qrmfooaONuIq2Vw+ll/YPaoE0ykm7NJ/R3
	EsUpR8AeO4y7JCecL1IcAsIGIKB6xwNf2igotRbAAUS9vSz6WRiKh67EW8W8zB0=
X-Gm-Gg: ASbGnct1bQyHmI1n9rfj+oWiqgonQ05Dpt2ACXXSt5VtSPYT6nJUkkJZtQfidCuTB2V
	h2pWRqLcuslY5L0fZluAaBSd93bsKZm4kwlisy7KQ/bfJku9NDjpyztCv5cIebkhUsTpVFMOtkh
	4ykRYrp5XWOKESZVxVSMc8v7w2S5yH8anakY6N28Pwe7GlLo2m1x8BWlCaWyOGFZrVVab76TvXe
	qnLYeu1b4091OP8s5sFTeqy+kY23oKUCr4xwF5Hx6jJaUqsP3rPc5YZm5SlK2UFYFXY4WlqNeqT
	mgRQDOzYJ7y6Pj6pVYiGQj0dj44QrYOGfORd9T+9Gk89Et0s3Qbw91oxgyyM0w==
X-Google-Smtp-Source: AGHT+IHXp/JfgXqigWBcidR4kq8OP+kMXnDiqEfkci8MHcvamvdKxF9wFw2bKIstdi8Xr6ptuIylqQ==
X-Received: by 2002:a17:902:f644:b0:21f:7880:8472 with SMTP id d9443c01a7336-231981c8d93mr39801485ad.35.1747202254322;
        Tue, 13 May 2025 22:57:34 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c2dsm91721615ad.135.2025.05.13.22.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:57:33 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev,
	acpica-devel@lists.linux.dev
Subject: [PATCH 0/4] RISC-V: Add ACPI support for IOMMU
Date: Wed, 14 May 2025 11:27:19 +0530
Message-ID: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_225735_788398_B90F6BC1 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for RISC-V IOMMU on ACPI based platforms.
RISC-V IO Mapping Table (RIMT) is a new static ACPI table [1] introduced
to communicate IOMMU information to the OS.

The first patch in the series is a ACPICA patch which is already
available in linux-next but included in this series for completeness
only.

[1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf

Sunil V L (4):
  ACPICA: actbl2: Add definitions for RIMT
  ACPI: RISC-V: Add support for RIMT
  ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
  iommu/riscv: Add ACPI support

 MAINTAINERS                          |   1 +
 arch/riscv/Kconfig                   |   1 +
 drivers/acpi/Kconfig                 |   4 +
 drivers/acpi/riscv/Kconfig           |   8 +
 drivers/acpi/riscv/Makefile          |   1 +
 drivers/acpi/riscv/init.c            |   2 +
 drivers/acpi/riscv/init.h            |   1 +
 drivers/acpi/riscv/rimt.c            | 537 +++++++++++++++++++++++++++
 drivers/acpi/scan.c                  |   9 +-
 drivers/iommu/riscv/iommu-platform.c |  17 +-
 drivers/iommu/riscv/iommu.c          |  10 +
 include/acpi/actbl2.h                |  83 +++++
 include/linux/acpi_rimt.h            |  21 ++
 13 files changed, 692 insertions(+), 3 deletions(-)
 create mode 100644 drivers/acpi/riscv/Kconfig
 create mode 100644 drivers/acpi/riscv/rimt.c
 create mode 100644 include/linux/acpi_rimt.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
