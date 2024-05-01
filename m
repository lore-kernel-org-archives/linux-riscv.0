Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D03C25B10
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3Kr3hwYAPvC9CTHi0oN4cNAjh8a8HRqPZXBnfIU0R8=; b=weZ5tU9NAEH1pZ
	FUlJ+JjRxmr+RRQgwZcFmIlIcDntGwyS8EhTjzCnNiJmD+uIV8nZI6idlxI5Fd6aWj++oZksXCfto
	CTPyHp1jHfT3dksq3nGnPI3yB4iSae+K2bsYQHH8vhaO2Pf+6qSxgYsXXxKmQbYQtwgpdREVYbEnm
	f3nPwpdrCeDBiKMk3wNoHEr6VNH1tC38taUPPA6gCkGvwyF+dub9Dy4zVXjeuamHFo7Wzca06OgWY
	+JB/oLgocxBCuHjkKUtxq7BP7ZD7LpErq9uelZ1ekf40868mzAccCaY09O9aW/kWyLIeOsuRHU9Nf
	bkKyQGpi61WwOC97YvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2AHX-00000009iYo-0QlP;
	Wed, 01 May 2024 13:45:59 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28va-00000009Mx5-2rg3
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:19:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e3c3aa8938so44176515ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565954; x=1715170754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycPsvBm29e5SjcL+mnP2CfCAXKwmh5unfT08m5gLAm0=;
        b=Ef8Oi1iqrcuPzZKrEBI/t4V4X6nNPW7FnN1cliv3reTDu4+R3iOH4ScDZXAL6GteRM
         V0qgBubpRzrPf7Su6cOuQc+Ll4fcdcGrooBsSaHRS2BsAVg8Gor2/MKMHxjbnMsbHzk2
         96N5gHNcNOG2uWktSGGVucgcq2NjD7zta3ves5oABFlkHCCBN9k5n+9X71yV8ibaNfrx
         GUx0EpYFI9+zTiWRrKdB/0cwj6rfxaie7+ggE/eq3Vm1t/7wDlW51ueDT1y6SEvJlC07
         2Yuok7sgBxoup/X2po57WVa9SH9VjekHsw4avzyg4TZzSwjURuI00+6KoT01qdKWlEXW
         tjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565954; x=1715170754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ycPsvBm29e5SjcL+mnP2CfCAXKwmh5unfT08m5gLAm0=;
        b=AmBMg7zLhPKPpKYceChQ36t+m6sS3cru/7j6eMzkEFAQPaAwG+u4vJYqLVrfYQM33s
         TWCJwoaVhAruOmc4/IsZuyjuzcTnXji7n8XierIHI75DhJroPFGwN2+bhZjIsQHqbGuW
         noBg3d6IVuT/zPNVVaPT+4aHOQdoruGkv+P2adNdURuveSvUs6el4ghtlHRg+TyM6paw
         Qc4qOsCUb6CfEtQU+CspFtXecE+FXcfCkzsuIcsZY8ol8+UNcIhS5VbbXRD6SWzk4117
         WHZ4xJGdnvDE7IRTP5qxJXyiFZlGDtkyA+tCgqBq476Xwk/QpfWr5H1SFJKKPbeeisAS
         uWOg==
X-Forwarded-Encrypted: i=1; AJvYcCVadD31RwTLZTLk8/dAtQGpdXW5Dzj96pTHopNS4op6LB7791aGZkCHvwXTLQZjxWg5djpX7c0+1mIXLv6uexoAd9o3Zq+VZFJPjVG5fLaj
X-Gm-Message-State: AOJu0YyrtzV9uIhbcKHjo5NbLyA6pRRtaJZDjautuwNCOD2dRLNGIcOp
	CsF8gGmQ8N3pIOxBpcNv8LqTQxlDzWC9D0hWb/cd7bKBg+qwLxpp4UykPpN7B/M=
X-Google-Smtp-Source: AGHT+IEDg6A+K3iip7ZStHi7uQnpL11UU8DLGuIplAfF1OsmX8JbUJctZLyYRcjpa+LuwJ/5zvxvdQ==
X-Received: by 2002:a17:902:864a:b0:1ea:5ac0:ce46 with SMTP id y10-20020a170902864a00b001ea5ac0ce46mr1772335plt.66.1714565953984;
        Wed, 01 May 2024 05:19:13 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:19:13 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 09/17] ACPI: RISC-V: Implement PCI related functionality
Date: Wed,  1 May 2024 17:47:34 +0530
Message-Id: <20240501121742.1215792-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051914_757254_BE99724B 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>, Robert Moore <robert.moore@intel.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
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
index f7a36d79ff1a..09a86256ddfa 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -13,6 +13,7 @@ config 32BIT
 config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_MCFG if (ACPI && PCI)
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_ACPI_DEFERRED_GSI if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
@@ -176,6 +177,7 @@ config RISCV
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
