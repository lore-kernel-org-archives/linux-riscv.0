Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DF4C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/VjKFwP+/lyfwmrQ/cRanheqSUVnnX/d6Fa7J3RRA4=; b=LmQOLfV9979IiQ
	e0jEI1yfAOBEL/BP40erjBeIpIC13XauLK7gBlWR/a5UcGVPC3b2VXYoLCsdaY/B7AA//qZISwcPy
	2GIKkmwKuDtgEJCjxYqlCHRHcWMECrvqLGmzuOkEbhnFT8BGAMsVh3CmT3K86EOMnmOxeq44Zg4re
	YHQm6O7r/+2xVQ8XPunFALS8kTJw2YF5d8tC0wYUxx/GRxxOBeXook8H6XW1JfnvIHEEt9MC7HRzK
	U4szWcYgTlqLMaP3bTB7z8cDiXkiCQ7ZEEMnW0CtjjnJFvA7TU//NILZmKU8IlIHjMXLjys6Xks7D
	gOFC0VWyuSTsCz3yjStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRY3-0000000Bg9h-0vWH;
	Mon, 29 Jul 2024 14:40:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRHv-0000000BYqx-0vf3
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:23:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fc65329979so25472375ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722263026; x=1722867826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wik61eI9STwwE7HFXon2+/PZ3nVDVD4F5v9olaEmjiw=;
        b=knmalRYOEDeanc48pmrS6kBYS9bKFQi3+sG4lg/qK+81GkT+xYCxIS1zAP5M+r6OwQ
         Xcou9yKnGrwaoCShMmKWosQRz7mTQHkZ5o36HLPoAXSWclRmx6AM4wRT+YqOtndabcmz
         lIdTpyEYVd3SOyWxzphU6SEet5Agk6trsgu6JmnnRqlDOxXpP3qlpaYBkHhp/eCa5TJl
         421VTFeMEVyH83yCYbMPGa5hBeyABKyrwfVGmzkQH0McELxT9eMH9bM3aFOcLEm/ctIo
         ddpUw8mD78+V65LjPt4UQDvdNprNBC/f9UrJqtlum3lHVxhdvobqsl/97Ynpx3TUmy8Z
         1xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263026; x=1722867826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wik61eI9STwwE7HFXon2+/PZ3nVDVD4F5v9olaEmjiw=;
        b=xEAAk9TLRSD3M4d4Wl6GzGhXSFilZdZG4M4+gkXJpML/hK7j2gykdxX5qSAxfV5iU6
         wXkLIGRNCVZ4aYxmGUqaprRXwiwBUyu2G3WeykgPxGBIwS2tAOlVTYf3l/ywzntUtvus
         1NnIam5kAdmGLoCvlFzdHMHArw7Sk1uvh409sK5qgpSM3sSTpkU3yK3yssNr0F4KA58t
         DAIbHYPbAe5iq94MEroVJVLE6qUFwultl62+Yf+z0QNLM2YpnkebLpPCR07bD7oykT21
         NJtQMCAonMb0GSCnEVihg27zA6i4GmhG/njp4OJmiHXzESK5oI/V/tQ1tdMkG1GJAUa1
         SrMg==
X-Forwarded-Encrypted: i=1; AJvYcCWaXT8mXUXiwcvaSD4xW0pl2Jzc3+w2ZVvdDHiX52xOfewDI123PHAI4NhPgSzFZl0Lp/S3eniTpWLUllICvGpNLBBblfIzMwMmCIya+j6O
X-Gm-Message-State: AOJu0YwMLkUXMgTQvhAXaov3hDF5UNCw4BxRNVYVLFPaJTSnOuDsjeye
	KBApKGleJQxQDvjb7wPR7l7Qzw+/u/QwPv02qPqirAy1El7sQKMvrBPCOVPRp9U=
X-Google-Smtp-Source: AGHT+IE3ECdlWv0nwo/WvLQaYyG8zcevZP66vRc2T+ol778my9cQeDUxkiVxja9PHSoePX+A01NXaQ==
X-Received: by 2002:a17:902:dace:b0:1fa:b7ea:9f0f with SMTP id d9443c01a7336-1ff047fed8fmr110813265ad.7.1722263026091;
        Mon, 29 Jul 2024 07:23:46 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:23:45 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 09/17] ACPI: RISC-V: Implement PCI related functionality
Date: Mon, 29 Jul 2024 19:52:31 +0530
Message-ID: <20240729142241.733357-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072347_352794_24A3757F 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, Anup Patel <anup@brainfault.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
 arch/riscv/kernel/acpi.c | 33 +++++++++++++++------------------
 drivers/pci/pci-acpi.c   |  2 +-
 3 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..a269e577284e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -13,6 +13,7 @@ config 32BIT
 config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_MCFG if (ACPI && PCI)
 	select ACPI_PPTT if ACPI
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ACPI_SPCR_TABLE if ACPI
@@ -188,6 +189,7 @@ config RISCV
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
+	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
 	select RISCV_APLIC
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index ba957aaca5cb..6e0d333f57e5 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -311,29 +311,26 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
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
+	struct pci_bus *b = pci_find_bus(domain, bus);
+
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	return b->ops->read(b, devfn, reg, len, val);
 }
 
-int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devfn,
-		  int reg, int len, u32 val)
+int raw_pci_write(unsigned int domain, unsigned int bus,
+		  unsigned int devfn, int reg, int len, u32 val)
 {
-	return PCIBIOS_DEVICE_NOT_FOUND;
+	struct pci_bus *b = pci_find_bus(domain, bus);
+
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	return b->ops->write(b, devfn, reg, len, val);
 }
 
-int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
-{
-	return -1;
-}
-
-struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
-{
-	return NULL;
-}
 #endif	/* CONFIG_PCI */
diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 8ed81a373bd7..af370628e583 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1543,7 +1543,7 @@ static int __init acpi_pci_init(void)
 }
 arch_initcall(acpi_pci_init);
 
-#if defined(CONFIG_ARM64)
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 
 /*
  * Try to assign the IRQ number when probing a new device
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
