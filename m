Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA62CC001DF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1t5pqJ7hdx+mNkoEdzt0tkX9z8rYAUEYqo6jfEUkdFw=; b=NZh0o34gujrGBd
	2D/c3YGc8JIRvCQgEI7txBwWiizaejlz3wrNYVM93If+H5u970zIl+JcYBVaidUnfJJbANsEPRTik
	dmK4Bf9zjfhLcpNEI7UlyI+bRF2fSKSIplhu5NlRO2sd7f0WGImLrclR4AdhJ6zcJwA1AAyT3y1RF
	4wUW/aWZHVm7f6Wy6kIXEF/mLAwEiOmgns9aUfyWZISqGDA88ao3DG+9t7FUo3FpqSFOY0Myrskyh
	9RwkSpwL4m/Ak6fBzNZBAEIE8tj/lWHRVC4Sk21a8OvLdBivKmmNqekkgMzMQItqvwEK266SX4xJD
	Upp4fgmPAfZM5VAO+Ouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNadd-001J2x-0w;
	Sun, 23 Jul 2023 15:04:49 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNada-001J22-1G
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 15:04:48 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3465bd756afso20637085ab.3
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jul 2023 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690124681; x=1690729481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eu16HQ4OcruSJQofjc02TY9kOytBuyjJiF1LEsu4nUQ=;
        b=TlqShghqrhz17x7MmVFH5LTHDrveCfVh85QwDOnLArUI3ciz/2m86DHS6OeQJkkBlV
         sXJ904QbkbHAJNsF2XQSqWiokQ9dx46rzk0JQ+b52Rm7JjMPAhbd1OCbqijxEQDo9O1I
         g0oS6KDu95lHjKV75RjWR0yVE1zaKs8eOoZ27Gv3JfIfdO/mL69sqXiqgF5q1cf0dmQt
         8Mwl+z0UZLjutEo2tvEmG7ZKuikcBLIlhWwAa1gj4McLYsOCBIqB3ETz0WQjrDGiv5HG
         i+rXn79Vb9ZphOPS6Uk+fs0dvNiyhOOF+kR9h38i1NY0Xi35kNe4CJ7R0XKNO+okFADD
         qQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690124681; x=1690729481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eu16HQ4OcruSJQofjc02TY9kOytBuyjJiF1LEsu4nUQ=;
        b=NlcHl9Xlwf+1wz/5SdKgJLjqWUExO63X3jfILFoHfOzUiPk0KI868R8BV58CxINJ8v
         qmHl35QXv5nmk0DT/qj5tXH8RAnDGB77jEQdmnXTLOQQANmQpKWvrwqeAiCDDMUEUS4u
         SaPGT+bC0B/PqLJ8X6SWmwS6RDIH1y41VC3uhGJrFH5OIKRQ6riSn8u5qI3yskBYxY+W
         8fMMkYLKentpxCOuVkxMd+H0X8Cpl+SWCPP61w2ULMg2FXmn0OkDHdiS5KwGZfyghVHV
         4hCcjcXzulzaXkV2VoxcxdkY/Rva8PXwqZW25o68hDEq9UvBa/hyfdvIt2olMy0MVsVn
         dU5Q==
X-Gm-Message-State: ABy/qLanAy0pdgHj3ndM6AomEs/v+rLYK3CHt96Fg/32MM6/JSBcuWkG
	hEbH3b+vPKnpwJvEaUhL2kDgrzSip5dsr3RGbFo=
X-Google-Smtp-Source: APBJJlEMCS/tpUIcHTEW18goCjpg4K+Toaa+SwNpLfBj9cFvrEyUiWSFoii7KZ+W2B0Z0uIeaBQAAA==
X-Received: by 2002:a05:6e02:1c8a:b0:346:d51:9922 with SMTP id w10-20020a056e021c8a00b003460d519922mr6732380ill.13.1690124681070;
        Sun, 23 Jul 2023 08:04:41 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
        by smtp.gmail.com with ESMTPSA id o2-20020a639202000000b00563397f1624sm6596583pgd.69.2023.07.23.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 08:04:40 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem address
Date: Sun, 23 Jul 2023 20:34:34 +0530
Message-Id: <20230723150434.1055571-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_080446_434781_B51B82C4 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, kernel test robot <lkp@intel.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix the acpi_os_ioremap() to return iomem address and
use memory attributes from EFI memory map while remapping.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@intel.com/
Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig       |  1 +
 arch/riscv/kernel/acpi.c | 88 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..4892418e0821 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -38,6 +38,7 @@ config RISCV
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_VDSO_DATA
+	select ARCH_KEEP_MEMBLOCK
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 5ee03ebab80e..ce28a530c81d 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/pci.h>
 #include <linux/efi.h>
+#include <linux/memblock.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
 int acpi_disabled = 1;
@@ -215,9 +216,92 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 	early_iounmap(map, size);
 }
 
-void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
+void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 {
-	return memremap(phys, size, MEMREMAP_WB);
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
+				pr_warn(FW_BUG "requested region covers kernel memory @ %p\n",
+					&phys);
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
+				(region->attribute & EFI_MEMORY_WT))
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
