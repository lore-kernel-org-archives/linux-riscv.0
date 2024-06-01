Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CACDC25B76
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3niWWTZ7ENUUWaXJhkjt6cTVvWk/a/LIq0iZNyZa4U=; b=n+zzF1cUjadlVB
	zPmpSCq1OXtbBczU2YvPjGnVhbxUZJvetrp0M5L3EN2EzPVM0mQCj7gstnaAlaHUFC3ICaV1HUKFN
	9qTUCuLAQvX5szJOmR5C9TWV241NnirUkGKXTmFfcQGGThW3KPvP4W//aozOoiscFtFcSC9ONh3cK
	FVwk7dPkao0Z/rhB8SnwTm4HNaKtx/okIV2ZaQq4lPCfv4NEFJ8E6nQI30RfJmer/nwAcxzx9QMQf
	bQL7OZ1VNz95Nz0qBRSyK2h4UG8pnVjDhElfOKiZVACJCLBq4oru2OY1jZQQTRSkbeMrEwUr7NXvz
	yc+aJy0vA/RxUj5ADOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQIv-0000000Cpcn-33xn;
	Sat, 01 Jun 2024 15:05:57 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQIS-0000000Cp9i-2lnl
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:05:36 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36dd6110186so12062455ab.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254325; x=1717859125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFsOtJr39QOitF1KwZRd+YQFJB+PCc/GRrrdZlZj/hE=;
        b=dfZWoqEuYLsv/IAEW6FA6AqdCzyluk6fi5+dUWvRfwda+GOt4M7boz7qjD1yViM/vN
         YTUgyM5yCTpSrbCHZqsKqR4z3pHCuq5Tqd3AfRgtcUY7+E9Jvlj+yCbGF63teHk+0eyt
         4mDVJ8fjOMCq6d2QBU7ffUR49+OOLIsjgZWc/DxSEc8MqF8yvW6DsW60hKU8Aj7nYcGP
         snJTfSSqwB63Hiqr/h1jKcfrnkvrySf7EbkYkrqYNLigZc/T1bbWFiP8CdhA8CXj8USc
         W/PQatvu6t9GkI/sWmn1wKiAjli+VRJHqU+Ha+z5zNAmazSEgxz0kuYCWONhJmMe4Zar
         0Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254325; x=1717859125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFsOtJr39QOitF1KwZRd+YQFJB+PCc/GRrrdZlZj/hE=;
        b=gK5hfNXH8OlCPRF4Bm3rgnD5MGaqXz1EO0jO6SB3G4jjj/mlE4L+6jpojxUf+Sjfqr
         1iKxMEopqaLmSZ1yRJsQ0z/AiaMBBYdRMBVHXC53YflnmqsnB4GuNcDF/c3jDjbp59wv
         6DndI7ITSnBOrDfLsbHgBkUGj9HBRo/sswUMds2r1X15B3bQLBxsbwFXaFGlcybCYdAl
         5P3E/a18hSRl1APKjjMm+vA3IsWgIVp7vCXiIv0MReNDGXhuv+dxOitRVrMNH2KH2nkI
         JCrCAvyli6zO6IuctaOG0OTtlsut6yCh8poFBFOwuf4jWtAlxB/QvZpQvU5eJODbMmL+
         wmKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxk9rIU0lXmHJIXb4VCPwSB9mir6tIJ7sAIki6/0yYCtUc5+KVFmDwNCFYKSQfKQSmANPHa+RpqozKM9oo/8VyCws/invj0/DRVY+gqSLE
X-Gm-Message-State: AOJu0YxwGWuT2n+KnRHwsOZP8//n2HjYfbQv+d2usRro71JN+bYtmRo5
	gveLPYN5GUZNYFfE01DnPOrJrClm3mOriX+rBhgP5uHR1XsSZZL2QYci8hdm4Jg=
X-Google-Smtp-Source: AGHT+IEJRIuFWfACl4C/2OdIIJGx8aK6TxTUuoEk2JLfaDxuwQLQymMr8D5iU52VLgMZ5cmUpvU7ag==
X-Received: by 2002:a05:6e02:1d0b:b0:374:593f:913e with SMTP id e9e14a558f8ab-3748b98e53dmr55865925ab.14.1717254325230;
        Sat, 01 Jun 2024 08:05:25 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:05:24 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 09/17] ACPI: RISC-V: Implement PCI related functionality
Date: Sat,  1 Jun 2024 20:34:03 +0530
Message-Id: <20240601150411.1929783-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080529_855826_B309334F 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index b94176e25be1..f143fbeea572 100644
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
@@ -181,6 +182,7 @@ config RISCV
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
