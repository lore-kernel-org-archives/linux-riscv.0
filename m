Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2910BC04FFF
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNq0Odz+5AwTnScVY60dPvA79WdreL1ZVBKVVtTUbtg=; b=CdT29aXZZy+3LL
	ty+VNRVfsW2h4YCeG8GDuZxk89+kBwLKPqLy25qdRjySTFigeiKkcg8kd8R+Pvr2W6rUDtOKPY3ou
	kfQy0jRvw+NGQNI7P3yurqd/ZXKjCY5ZSHn4JzR+gal4h0dcJ69YlvNlWLV+h/ZG+N29gaUAeq/Qd
	3eTuavblaSOyYRvEW/vdnG2DhKd7Cbb+EHth0GhtzGXIVG4H1hbavcRHH7J8liJVYlLLj6x4TKnzw
	8lJLITPLgEHs3gxGqYpQX0aZpNv49AyVqO2FdrY5SktXusoHjgu7RArlWGBIv9BYiq71JkZ8plQq2
	yYmvTCnDX6vob6QTxyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPiB-00000009BQm-2SKh;
	Mon, 15 Apr 2024 17:01:43 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPi6-00000009BML-1TWN
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:01:42 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ecf1bb7f38so3169608b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200497; x=1713805297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFAtcNyUPfmOo+WuzK4Rac+GFz0TbHOwinmWYmcFrxc=;
        b=Kl0KCs+fMaGJrjSTDgArtfSeubx0ZNL3zWYC1kbexJWTtaq5jaOMrOXDXW2fmA3fIi
         8D8vfmprCvwEP/ZAu+Qq+WDvjUEiBq5dC6h6AsfFfLv5OWGwR8rvZ9t0vDH/VlWuh/ao
         jFWhyd17JDdQpJ/gEf7ivsoo3LbVlDLY/mCBFiv9RjlifU6mdmLHV841YLhiucWDrF6j
         yhy5zM2JS9n6fy5OAH6v9kGliID4u+/jXx0r39yFfO8hSqDYRi+zhUpGPxgvWoOYEn1B
         aA4dKAXxhElWxIWPBLItUKYh4uW2vpmxQyUboF8j2roeSUbd9k7l8+9O55dL+z4I110J
         19aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200497; x=1713805297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFAtcNyUPfmOo+WuzK4Rac+GFz0TbHOwinmWYmcFrxc=;
        b=Mp3ABcw3HL2iJJx+mK7qw/1vQsDcyWAdTMyWsFZLUtB44NQ5Hy4FiN61bvhP0jh0qM
         reqTOTpKEwMriRPQaL7bTXWJOHmQ7UitaUg+gbxrgnSJFf++ap6AzkF5LLUHlI+F7Ww8
         qVZaOkEUTond9dxlKW9mSAAfRdJoaC2PcHauV+4PkUPG5A/DEoW3SKuQtk1HsupMlUu7
         Ph2I/09l0elgIG87/njTf8khNkVSEV+qV+HV5ND6lz5loObu12sdScolCIE8lBTkyuOm
         X5xiB6iSLCw1PdUiU3AxVspCqUyFRjmFlnRigWDAGOVX0ljGrr9u1eBprO62ATyty4ld
         yttQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvKttL8GodXso69jONlArmPt1lvLfwmQaz86xRh6nmMF48Fjwcpe2+kDX8utcTY6W7BMH76dgotG45c638cu1xEMXvY7h9bUfX7CVBHaZL
X-Gm-Message-State: AOJu0YxiYAdqystTp89HRBNIMyYNZ5UJes62Uj6bIZRR/MON6r8PM2Kh
	t4eIveGNYc33KCNQpjzqC2TwAqwN3fnGF0yin4fVidlDv/bDzOoEemCbDgXC87w=
X-Google-Smtp-Source: AGHT+IGqYjIa76YfWohzDrF4RGeNhNZq2I7mTi99zpcmd5VEKjXE94y5JlYL9p7qJRGZUYYL3web8A==
X-Received: by 2002:a05:6a00:22cf:b0:6eb:2b:43b4 with SMTP id f15-20020a056a0022cf00b006eb002b43b4mr11021959pfj.27.1713200496609;
        Mon, 15 Apr 2024 10:01:36 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:01:36 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 02/20] RISC-V: ACPI: Implement PCI related functionality
Date: Mon, 15 Apr 2024 22:30:55 +0530
Message-Id: <20240415170113.662318-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100138_461703_5DFD3F6F 
X-CRM114-Status: GOOD (  13.73  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Replace the dummy implementation for PCI related functions with actual
implementation. This needs ECAM and MCFG CONFIG options to be enabled
for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig       |  2 ++
 arch/riscv/kernel/acpi.c | 31 ++++++++++++++-----------------
 drivers/pci/pci-acpi.c   |  2 +-
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6d64888134ba..69cc0509a19a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -13,6 +13,7 @@ config 32BIT
 config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_MCFG if (ACPI && PCI)
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
@@ -173,6 +174,7 @@ config RISCV
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
+	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
 	select RISCV_APLIC
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index e619edc8b0cc..41aa77c8484b 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -306,29 +306,26 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 #ifdef CONFIG_PCI
 
 /*
- * These interfaces are defined just to enable building ACPI core.
- * TODO: Update it with actual implementation when external interrupt
- * controller support is added in RISC-V ACPI.
+ * raw_pci_read/write - Platform-specific PCI config space access.
  */
-int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn,
-		 int reg, int len, u32 *val)
+int raw_pci_read(unsigned int domain, unsigned int bus,
+		 unsigned int devfn, int reg, int len, u32 *val)
 {
-	return PCIBIOS_DEVICE_NOT_FOUND;
-}
+	struct pci_bus *b = pci_find_bus(domain, bus);
 
-int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devfn,
-		  int reg, int len, u32 val)
-{
-	return PCIBIOS_DEVICE_NOT_FOUND;
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	return b->ops->read(b, devfn, reg, len, val);
 }
 
-int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
+int raw_pci_write(unsigned int domain, unsigned int bus,
+		  unsigned int devfn, int reg, int len, u32 val)
 {
-	return -1;
-}
+	struct pci_bus *b = pci_find_bus(domain, bus);
 
-struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
-{
-	return NULL;
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	return b->ops->write(b, devfn, reg, len, val);
 }
+
 #endif	/* CONFIG_PCI */
diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index e8d84fa435da..b5892d0fa68c 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1521,7 +1521,7 @@ static int __init acpi_pci_init(void)
 }
 arch_initcall(acpi_pci_init);
 
-#if defined(CONFIG_ARM64)
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 
 /*
  * Try to assign the IRQ number when probing a new device
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
