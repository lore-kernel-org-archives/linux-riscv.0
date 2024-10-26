Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3863D10C00
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 17:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+sGStaqmkMbEO93AG7rFgaYaxV0BWeX+YxM5MoAGnU=; b=iVAgeQiIxXXYaY
	etRsGXj2IsMyiWPdLIYqlhJLNqAiK//YnEBkU26PrY6E8zuCwapIWK0MttE0lFKAVU1ZzhMPu/ZbL
	iVqqgE/qVu55bieaVp5hWKKvd/9xGjpG30R48DSFbDnFQMGetpAjjQgdsgMs8mzpdCYllgV1VrSAt
	CYNpqS5TC7dHCTPtfpmDTgjoR1FkPifwqk7vPydEcjuX3RyF6mCZZx3QW+DIMGPHDFaLy8WKGdFTe
	JfvcITsFb8+DJesapkgcOmsYyGvSvrRiQfDkLFWlgmt5rNxl3fXsicpDUZalq7vJ/eeRiH8t5syiK
	qj+64up/B96NtvZDzLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNP-00000006xD6-0wvz;
	Sat, 26 Oct 2024 17:14:59 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNH-00000006x7l-01oU
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 17:14:52 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ed9c16f687so2271320a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729962890; x=1730567690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32SXpWlDW0kkamANJs274cWuCXV1jWs6Ch/GFZy2syA=;
        b=OCm/w7P1RJxKJQUkYlEvfgP0swcc5rpK4ArTCkw1N06OdzYlzW1vayR3RpSTUZfFLC
         1fv7zrP2lG4eWZIEw5BaeTtzsFWw72MDqUFrMX7COhjzVejBzvGCM26qzacZYzn78p+u
         o+iLrdmKQiY9L5xcE7YvZh35XbPhDs2abB+s2TTp5MHd6Wr/oqSRpnAKHk4txLwo5M8D
         /dQmhN2ucuhBS4lb4SMl1MHCSZJoSwTMpuyQ+N1HZZ0VWkbs9W2M4XnZhGPBGwCdTNeQ
         9yPf0HL3MSNt+XB2FO6PUoH6vlEIpcT1zbh70QFmenI4Rm6Gm/QJ23VxPIidCtRvCwk5
         +Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729962890; x=1730567690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32SXpWlDW0kkamANJs274cWuCXV1jWs6Ch/GFZy2syA=;
        b=UZpTrOrhZv10gVZQQnd1bRokV0dNiWFu7uG8sATO9hu0xn8ODUde4fyuSf3fIpG/P5
         rAiuI3mYPUEDwyK7ynUPMPhPWljotBfZD7cCjWphxSwo/GRyy3yUNwAh4A5G1NavreNs
         +WEHgvTPl86USbJEMguoRTFRMu5obAZlGDqzIIJ26glcNlMMsJxV5Fq59rmujCr0QehK
         zP0tA+8yOJkL4LJk+ILjSnImM9zciQglyDxzLp1fnxVtNosrS/Hw+zNR3pX2/67yyNrW
         RI9S1u+oavz8F9GijuWAzysKWUFHSe1IILPf55wJe96dbivdDVTPPHqUQEugkcXuBz+k
         r0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUgd5TtLULEG/rBu8YzySqtpFkxiL9MBRNyb53l+k3r4SCgRa5fqjKs7edFSc2t/R2v+m4prErC4Uoc1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB3pyaHhex5LEs+ZsqgzV1nWHhORW6gaN9PfkgBExXCyJd8CnX
	A9r+H4fygE2bxI00FjnEoG8kKfMDPxVybXVk4tEdV2q4d+PqGrpmE2ibATwY01+LxheO18mD6K0
	k
X-Google-Smtp-Source: AGHT+IHuE/xLTvkb+BU83DmMK1Bc6hhBs45MKVg/zLV/CvtM1d0wHjLI0sEZOu1+WLDNR8rdwiJXEw==
X-Received: by 2002:a17:90a:5e07:b0:2e2:eacc:3227 with SMTP id 98e67ed59e1d1-2e8f107c664mr4417836a91.23.1729962889947;
        Sat, 26 Oct 2024 10:14:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e558114sm5663762a91.36.2024.10.26.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:14:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 5/6] riscv: Support CONFIG_RELOCATABLE on riscv32
Date: Sat, 26 Oct 2024 10:13:57 -0700
Message-ID: <20241026171441.3047904-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241026171441.3047904-1-samuel.holland@sifive.com>
References: <20241026171441.3047904-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_101451_069041_E3E39BBA 
X-CRM114-Status: GOOD (  15.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When adjusted to use the correctly-sized ELF types, relocate_kernel()
works on riscv32 as well. The caveat about crossing an intermediate page
table boundary does not apply to riscv32, since for Sv32 the early
kernel mapping uses only PGD entries. Since KASLR is not yet supported
on riscv32, this option is mostly useful for NOMMU.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig   |  2 +-
 arch/riscv/mm/init.c | 17 ++++++++---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4420419e7054..33aa79d84021 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -934,7 +934,7 @@ config PARAVIRT_TIME_ACCOUNTING
 
 config RELOCATABLE
 	bool "Build a relocatable kernel"
-	depends on 64BIT && !XIP_KERNEL
+	depends on !XIP_KERNEL
 	select MODULE_SECTIONS if MODULES
 	help
           This builds a kernel as a Position Independent Executable (PIE),
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a74e28367f9f..0aad925848a4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -20,15 +20,13 @@
 #include <linux/dma-map-ops.h>
 #include <linux/crash_dump.h>
 #include <linux/hugetlb.h>
-#ifdef CONFIG_RELOCATABLE
-#include <linux/elf.h>
-#endif
 #include <linux/kfence.h>
 #include <linux/execmem.h>
 
 #include <asm/fixmap.h>
 #include <asm/io.h>
 #include <asm/kasan.h>
+#include <asm/module.h>
 #include <asm/numa.h>
 #include <asm/pgtable.h>
 #include <asm/sections.h>
@@ -312,7 +310,7 @@ extern unsigned long __rela_dyn_start, __rela_dyn_end;
 
 static void __init relocate_kernel(void)
 {
-	Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
+	Elf_Rela *rela = (Elf_Rela *)&__rela_dyn_start;
 	/*
 	 * This holds the offset between the linked virtual address and the
 	 * relocated virtual address.
@@ -324,9 +322,9 @@ static void __init relocate_kernel(void)
 	 */
 	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
 
-	for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
-		Elf64_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
-		Elf64_Addr relocated_addr = rela->r_addend;
+	for ( ; rela < (Elf_Rela *)&__rela_dyn_end; rela++) {
+		Elf_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
+		Elf_Addr relocated_addr = rela->r_addend;
 
 		if (rela->r_info != R_RISCV_RELATIVE)
 			continue;
@@ -340,7 +338,7 @@ static void __init relocate_kernel(void)
 		if (relocated_addr >= KERNEL_LINK_ADDR)
 			relocated_addr += reloc_offset;
 
-		*(Elf64_Addr *)addr = relocated_addr;
+		*(Elf_Addr *)addr = relocated_addr;
 	}
 }
 #endif /* CONFIG_RELOCATABLE */
@@ -1155,7 +1153,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	 * makes the kernel cross over a PUD_SIZE boundary, raise a bug
 	 * since a part of the kernel would not get mapped.
 	 */
-	BUG_ON(PUD_SIZE - (kernel_map.virt_addr & (PUD_SIZE - 1)) < kernel_map.size);
+	if (IS_ENABLED(CONFIG_64BIT))
+		BUG_ON(PUD_SIZE - (kernel_map.virt_addr & (PUD_SIZE - 1)) < kernel_map.size);
 	relocate_kernel();
 #endif
 
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
