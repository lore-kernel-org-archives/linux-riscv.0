Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8560CCDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCDwZQZdrxDGbN01TlGvMiQEJ6Bv4kmC4XWRdmTS6fk=; b=cPxtEY8tohOGHX
	3A7fcyyXRHCB4LwF30S6IK1jPuYCIs5cCqcCCqOf7PB2VzZpjEFVOX0Ko/RS/yfNR6CvQ+BnOSxOG
	oPPVJrd685Re00OU62qW3rvgTNjeB2sTPHPXn3DWwJpr8dYiGJh1FFM1l3Vb77R9A4xrhrBTo+tkV
	q/1Bo81GJABOJ4JISD1XG98ALoaw0v8mAThycQz71KyqcDwt5KsYx9b+4Nv5vGZD00GCkPGMxU/8Y
	pLmUoeddbgRJbEj5aCcuNyxvh+b1QrBU/IcwmDcwE+3n/zMsACnaG0aYDdsL0G924w254s/u56Js4
	j296bZQP810py69oOluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQnL-00AAzs-0O;
	Mon, 16 Oct 2023 16:50:19 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQnH-00AAxP-2e
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 16:50:17 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ba172c5f3dso1551960b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697475011; x=1698079811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGpfWXp12h96iIrhrZ9w/4qboCYb79h5kFDLjoFea9A=;
        b=UnIwFHDc1QyOtdW8hmTFxE9gbnSeP6jTV/VVM+nqGDFQl6o9C2bHNwp1H8y7a1kZI9
         KdYxxcI/Sp8jxWK6CVzLnhY35sYxbIZpTbJzqO6FbaLk/SZXjOMiZ2+lhy+Y+p8D2xqF
         /q+LKIe+xLOq8uZjdf+ngVnbYNcrKNA9QuOdVdtPrSY9CHIVM/RNEA3U3xB/ZPIsZf80
         ZLU1pv1T0OS3HH07sn8mvXjPAGQwVQ6Tg9Fc5NjYDUVHcCqzioYif9lkKDIh+V66u1eE
         H6iSaeWlUFJpuz0EfHcsK7EcTcDf//mjIWIBP84oEhixozNtEAT8n8xi6mrb97hR7ANg
         GoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475011; x=1698079811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGpfWXp12h96iIrhrZ9w/4qboCYb79h5kFDLjoFea9A=;
        b=BPKtGBwJo7RCpaqt02jlGUcxNW2tCsCFbQXM7r9LZIf8rWe6QSGhLO1GlhxOBhqd2z
         6OdO2o09vktaPUT46+4dvQWny7dN596DBCu+CCuyiOkFtRJOvOyVuic7JDiPQ3/beRal
         78eeajtTS3W+FrfeAr7EysFnBZqYPKRq3hlWIjnyG83Y5SFP982g8MKjHYyWZeC+LNLe
         XhTPrq1nQPzAp+DlrRJzA1MgiaaktZcjhPSeIyF3DVdoP9vWdhJG1mj8vAlo2qhyWcDv
         LLqC707ThzZ0obzdCP2kIw43P0A5kC6KfgEw2diVNOja17OET12FioydeFFkZfd/4jgn
         8hyQ==
X-Gm-Message-State: AOJu0YwgJ6/HlOAwcHzZkY7rXKPmkRkx8yM/yi0jIRAv2Ui/llouFCxN
	JC9pYwJhDhWs394gyUHq4KkOm88lmzCWdqvOQQM=
X-Google-Smtp-Source: AGHT+IGjQ2ofm9vq+rM9KYxzcQbOI6U0lRLO3PtlSK9ezYbqJA021qj0LVOx7aeW/7sHzfS/fqtlUw==
X-Received: by 2002:a05:6a00:1389:b0:6b2:6835:2a82 with SMTP id t9-20020a056a00138900b006b268352a82mr9317417pfg.13.1697475010850;
        Mon, 16 Oct 2023 09:50:10 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id t21-20020a056a0021d500b006b1e8f17b85sm111252pfj.201.2023.10.16.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:50:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 -next 1/3] RISC-V: ACPI: Enhance acpi_os_ioremap with MMIO remapping
Date: Mon, 16 Oct 2023 22:19:56 +0530
Message-Id: <20231016164958.1191529-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
References: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_095015_859616_5A285ED8 
X-CRM114-Status: GOOD (  19.46  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enhance the acpi_os_ioremap() to support opregions in MMIO space. Also,
have strict checks using EFI memory map to allow remapping the RAM similar
to arm64.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig       |  1 +
 arch/riscv/kernel/acpi.c | 87 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6d..805c8ab7f23b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -39,6 +39,7 @@ config RISCV
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_VDSO_DATA
+	select ARCH_KEEP_MEMBLOCK if ACPI
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 56cb2c986c48..e619edc8b0cc 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -14,9 +14,10 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/efi.h>
 #include <linux/io.h>
+#include <linux/memblock.h>
 #include <linux/pci.h>
-#include <linux/efi.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
 int acpi_disabled = 1;
@@ -217,7 +218,89 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 
 void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 {
-	return (void __iomem *)memremap(phys, size, MEMREMAP_WB);
+	efi_memory_desc_t *md, *region = NULL;
+	pgprot_t prot;
+
+	if (WARN_ON_ONCE(!efi_enabled(EFI_MEMMAP)))
+		return NULL;
+
+	for_each_efi_memory_desc(md) {
+		u64 end = md->phys_addr + (md->num_pages << EFI_PAGE_SHIFT);
+
+		if (phys < md->phys_addr || phys >= end)
+			continue;
+
+		if (phys + size > end) {
+			pr_warn(FW_BUG "requested region covers multiple EFI memory regions\n");
+			return NULL;
+		}
+		region = md;
+		break;
+	}
+
+	/*
+	 * It is fine for AML to remap regions that are not represented in the
+	 * EFI memory map at all, as it only describes normal memory, and MMIO
+	 * regions that require a virtual mapping to make them accessible to
+	 * the EFI runtime services.
+	 */
+	prot = PAGE_KERNEL_IO;
+	if (region) {
+		switch (region->type) {
+		case EFI_LOADER_CODE:
+		case EFI_LOADER_DATA:
+		case EFI_BOOT_SERVICES_CODE:
+		case EFI_BOOT_SERVICES_DATA:
+		case EFI_CONVENTIONAL_MEMORY:
+		case EFI_PERSISTENT_MEMORY:
+			if (memblock_is_map_memory(phys) ||
+			    !memblock_is_region_memory(phys, size)) {
+				pr_warn(FW_BUG "requested region covers kernel memory\n");
+				return NULL;
+			}
+
+			/*
+			 * Mapping kernel memory is permitted if the region in
+			 * question is covered by a single memblock with the
+			 * NOMAP attribute set: this enables the use of ACPI
+			 * table overrides passed via initramfs.
+			 * This particular use case only requires read access.
+			 */
+			fallthrough;
+
+		case EFI_RUNTIME_SERVICES_CODE:
+			/*
+			 * This would be unusual, but not problematic per se,
+			 * as long as we take care not to create a writable
+			 * mapping for executable code.
+			 */
+			prot = PAGE_KERNEL_RO;
+			break;
+
+		case EFI_ACPI_RECLAIM_MEMORY:
+			/*
+			 * ACPI reclaim memory is used to pass firmware tables
+			 * and other data that is intended for consumption by
+			 * the OS only, which may decide it wants to reclaim
+			 * that memory and use it for something else. We never
+			 * do that, but we usually add it to the linear map
+			 * anyway, in which case we should use the existing
+			 * mapping.
+			 */
+			if (memblock_is_map_memory(phys))
+				return (void __iomem *)__va(phys);
+			fallthrough;
+
+		default:
+			if (region->attribute & EFI_MEMORY_WB)
+				prot = PAGE_KERNEL;
+			else if ((region->attribute & EFI_MEMORY_WC) ||
+				 (region->attribute & EFI_MEMORY_WT))
+				prot = pgprot_writecombine(PAGE_KERNEL);
+		}
+	}
+
+	return ioremap_prot(phys, size, pgprot_val(prot));
 }
 
 #ifdef CONFIG_PCI
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
