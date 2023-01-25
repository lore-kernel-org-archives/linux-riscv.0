Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D57C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTsd6ev/uS02NChdISwyOtlT35VDNdmzY/drhm6MioY=; b=26Br1q7XQQIiaW
	XEOrxkwK7w83RPevRTQ2NOvdVF7eCMDiyswTw2YLtiP5DTqz+dkMrRDNT1aWMBOBTt9L6rW21WmOq
	IXl7F6138k3FEArFeFtsdcszzZgJG8UXJr/jz1krSwFk29Milatp8ATvheT+ZHY/jpeCyWQHtHhTi
	DPTPkDKBhY1MlMLnAlFP6/fCjoL8CybWqqVUto9ewdlaig2v9qCQw6oxpF78JECqI87wL/jc/9JRp
	n0gsDABZCyNc1kbljOVc+azCH7etiI6UKfhXIlhXaD4t8WH66hlan20Ea5KN7BsUZlbdiIfj4P+i2
	X8kYXtgtCVTKu2ET44Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKauK-006Lqq-I3; Wed, 25 Jan 2023 08:13:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKauI-006Lnq-0C
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 08:13:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so662018wms.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 00:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRMBYXDDfGwQT0ouwoUhoXMTDZlIFt+s+o6xL3IiRLY=;
        b=6SHjABAYsb9sIxgAv1yTgtlFmDL+DXfi+ajm3smPcn19BZzxrisi1qt06XocrXURXb
         wQLBdO4CEXOsZhznrRPj8vFcM/nTgOkR59EEhz70DMNfAWHRS9/6JORIAcGjtp996dpw
         bKDNrdYGhtNIl8pGFHDgYXV3MJqJVCNQRsq0F7GIludpClpOR6K1m7kZMU1jBbkCS0Ut
         AlSKBJC2rloal0MVNyqQJtmlR4qn6fdWolrZ59c3tPILMAoK4rCmuxArBApe8g2T8TKD
         XXOCMW/RXuVVDEfu4DPUI5Q0fgGeEcO25uwyijHgFfyqitESiWiDoxB1ZeDyMEXJnhYO
         wF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRMBYXDDfGwQT0ouwoUhoXMTDZlIFt+s+o6xL3IiRLY=;
        b=c/NCGv1ZZoX5iXm1qPQdb+B8ECppMTS0VWqeXGWdASFwP9vw/y7RamODOAKi0Nijcj
         cH2yboK9zh8uc7kkgp1lua9rPVmYE6EC+Cn60J2TaGdYnjiDJFC2eNTB0bpwmHFwFLjD
         cvWnm3uNUpGKpg1r1hMIsVpnM6yMQ0kiEIFehiYmyRQQjWYf3tNjZRzzREypImfpJzL7
         qgkyUEBmtoaTcjwtB1zAJPnW+mx+EgyA+xBnBN8/jI+O9Fe0w3OTsmRKtJivwRPv60H0
         +hev/GdS8WU5hksrDbsym3/WxQplFpowI6HC8zilfqF9rTUP7jP+wG8PvZw6fDSoQHNV
         9HqA==
X-Gm-Message-State: AFqh2koDsGJFJlZ3whbWSs3VbhkSEvUITpeXqbhCFTw3hI0CGFCHCV4G
	hpaLB0Z1X+zjCrOH5K83sCZGTg==
X-Google-Smtp-Source: AMrXdXvWfWdoytoOqidg1cHLUyDe1MVkKUECDjQaq67xQo8MEZOVr9cCg+Ez9pnaBdNwW4QEaggpMg==
X-Received: by 2002:a7b:c5cb:0:b0:3d3:4f99:bb32 with SMTP id n11-20020a7bc5cb000000b003d34f99bb32mr29381871wmk.36.1674634398316;
        Wed, 25 Jan 2023 00:13:18 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id a19-20020a05600c349300b003cfa622a18asm1139569wmq.3.2023.01.25.00.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:13:17 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 1/2] riscv: Get rid of riscv_pfn_base variable
Date: Wed, 25 Jan 2023 09:12:13 +0100
Message-Id: <20230125081214.1576313-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125081214.1576313-1-alexghiti@rivosinc.com>
References: <20230125081214.1576313-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001322_078567_CE92FC74 
X-CRM114-Status: GOOD (  16.75  )
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

Use directly phys_ram_base instead, riscv_pfn_base is just the pfn of
the address contained in phys_ram_base.

Even if there is no functional change intended in this patch, actually
setting phys_ram_base that early changes the behaviour of
kernel_mapping_pa_to_va during the early boot: phys_ram_base used to be
zero before this patch and now it is set to the physical start address of
the kernel. But it does not break the conversion of a kernel physical
address into a virtual address since kernel_mapping_pa_to_va should only
be used on kernel physical addresses, i.e. addresses greater than the
physical start address of the kernel.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/page.h | 3 +--
 arch/riscv/mm/init.c          | 6 +-----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 9f432c1b5289..728eee53152a 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -91,8 +91,7 @@ typedef struct page *pgtable_t;
 #endif
 
 #ifdef CONFIG_MMU
-extern unsigned long riscv_pfn_base;
-#define ARCH_PFN_OFFSET		(riscv_pfn_base)
+#define ARCH_PFN_OFFSET		(PFN_DOWN(phys_ram_base))
 #else
 #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 478d6763a01a..225a7d2b65cc 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -271,9 +271,6 @@ static void __init setup_bootmem(void)
 #ifdef CONFIG_MMU
 struct pt_alloc_ops pt_ops __initdata;
 
-unsigned long riscv_pfn_base __ro_after_init;
-EXPORT_SYMBOL(riscv_pfn_base);
-
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
@@ -285,7 +282,6 @@ static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAG
 
 #ifdef CONFIG_XIP_KERNEL
 #define pt_ops			(*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
-#define riscv_pfn_base         (*(unsigned long  *)XIP_FIXUP(&riscv_pfn_base))
 #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
 #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
 #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
@@ -985,7 +981,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 
-	riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
+	phys_ram_base = kernel_map.phys_addr;
 
 	/*
 	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
