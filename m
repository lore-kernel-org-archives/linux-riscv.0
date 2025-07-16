Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61755C83F34
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zKMaGmZJ2FGJzBuw1MhjpnC8vNsDTIcZP3Uk5XaXojg=; b=4VOZNoV2+XlsZY
	3UMVa1jLeb1x9wsE5cb4iSJMWjmW+fdZQuwW2a1Z3Jp1Su7vjVZKy5TON70IV/EA1SyXPUyai6blM
	mwAkSM43/PtwxV/SV6fPqOGDcVijKI52GdeHuX8YzFoPwp3Z6JaNXrjfTTMujxG19ctkRD/TGL7tF
	IIjAgNbYsSjzV7sDiYjsVvMqH1xcPTSnOjvvvgAJOlnHj8jiUncGegbQoVUUVynrGSuURLR/q7KVR
	6jqdVDbWbNMmAC9jJg/DmgTI25Z09l7KH/QaYCAQ3DsXlVeDtoAt5sh9NEBjMWuTBNuIv4s7twpGk
	uNVkkUYE5pQBcimg2Jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzzD-00000007VE6-1bKg;
	Wed, 16 Jul 2025 11:07:43 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzZU-00000007S2v-0li1
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 10:41:10 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74b52bf417cso4088295b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752662467; x=1753267267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4apPAacfnG+LIip3esQe+tr2nBhJ26sQmQ443HLd2x4=;
        b=i7rxxaD798qNUZjgkLE6Cz1Su43R/m9nFnEgyYcvs3Z5CwQyOkyPZt0Ho5HDJMauGt
         9Dd7WiovTE1Ieblg+7IuKFsZYDhnE0uTi+aVkbBjSrsxik/Fnw6+uNpjeqqPY9QcKWzK
         BckU6QTV+rXg9twWUV7T/TlqdXSz+3+5WSx9uuPxi8Upgl0zrFxHwNH4W3BPPKTq1kFs
         W/BCGlOW77PUEa80N6QQ/TOQ9SwDFxBBbENgcSwFrRgnSezPhdI8pMZz0Qwea7H/Mnxs
         tLgOjvmBz8WxfffOQYvC11lTuv+AELCG+LwhZ/HadWkxDLGChoVNblWrRhJwJaPfC0jj
         +slA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662467; x=1753267267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4apPAacfnG+LIip3esQe+tr2nBhJ26sQmQ443HLd2x4=;
        b=GZuwos0Uust2OGq8cajSyaonabywAwzerW96kehdRdpMDk+hNMDoGqq/7hPIt+DP11
         gUwbGp5P89tluhVfbgTqCS2JnFoMRB/bBfvcqH8CpE4P/F7OhjAJSrUd6zLPCaJfoJO3
         UBXtA4oz5DzAl7+qH89ZzeLk95rl4XlSR17wpGFArypXHc2gG5HB2dFy3mNTw5d2KDjF
         bUtswwEndXfGjWPt2FUFt5BDRUjE2Iz+BJLm73qyufgtBRUxZQzp/KAEQ/e71M5Wndco
         jCffJXfvEWyLgdpfQZMcQPDX60ZlXQXsg7aYmxHvfGxjINB+5ejaLvFUSVsbfB8sQ39w
         hyPA==
X-Forwarded-Encrypted: i=1; AJvYcCXJiiS+cNSz4wfdY5HZ/9ly9wLfuwdux39jAg7PsJvKPEeoeL0AE13ygQw4IyZl8m0/wUhklybleTkIcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbYVjSRkxWgSRNzXt+Z/S1WgfuJTbnXStnnNrYrTxEOg4nYTlT
	zNBtA25Ui5bDXkphvoXN0l3QXJjX48ETAPWsXxfuvPihu671xX2H2duLSWv7pEQAZNs=
X-Gm-Gg: ASbGnctc3JeEDtbqqta9CSGlnG9Xey4ahwbEMNFZDsnisBksD9lNJ9AhmNqoJSrxuQI
	6peQ4IvRF8mW+eWL7B2FRr1R7+XXzTwZntCubImZ/7E3HoG6WZFUM42nRazhMeszkmN1Q6uFXNa
	kr+nK+YfLoi66yq1Mdemu6ogpCrP341RVXlRoK7kqmiEgO/wI41MunfoA5p1Bb9kEBvnzaS+RGd
	/gPsefbZmkxzMQa8DbwIAPwF6MmgNNPN3kx9cQ3X+x/xnI8yPewPdLrWrCZPMnWNwsFAPQdVOd9
	P8w/Fj+pOK/Jbv8AHKZ5/DNxyoPWwN1EhtkDOUchPz+MKl71hk3H8dhEm5mjXQSR5S0dF1NBW2u
	/AN10L5BLL0M+a8WvfGNBqJOooG6lnsnAqrPWv/0Z1Io=
X-Google-Smtp-Source: AGHT+IE3037YRMGIAaI7C47Ttp1jNsxpPaygBpXftTBTzmjePBr4Bv4yntp0VcQZcAzTwEwQx0RJ2A==
X-Received: by 2002:a05:6a00:2e28:b0:748:e1e4:71e7 with SMTP id d2e1a72fcca58-75724872367mr3013646b3a.23.1752662467352;
        Wed, 16 Jul 2025 03:41:07 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1af40sm13946709b3a.72.2025.07.16.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 03:41:06 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v5 0/3] RISC-V: Add ACPI support for IOMMU
Date: Wed, 16 Jul 2025 16:10:56 +0530
Message-ID: <20250716104059.3539482-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_034108_221083_4BD3E3D2 
X-CRM114-Status: GOOD (  10.33  )
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
