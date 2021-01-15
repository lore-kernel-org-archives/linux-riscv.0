Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274E1C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 23:58:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C093C239E5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 23:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C093C239E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gNeQQ25s9oF28VTyPTbLr249P2lCIoaZ80wEUJyGjkQ=; b=JLcjh7GB64l1E0ajv0NFe6YM7L
	5S9HwFEFUaunQRR0Y9H7LxEi47NGgtiFFWefcmovGkh+5oZtB/tfUqiJXlvWhcQngAqlU0ukBIZjL
	8UOy0LqABnV7g38mk46k5mgx38HTPrGUAnf9xl6eYSbox49/F7riA/DmcM+79x+pBU4jjhpBSoCBE
	NTHMm7oCQCHzUmyhvLHCCiZ5oWnGQInpmK0zlpuRrxrRSkAPGk6PflNQQYgbGyG6xGqKWLIzZduTf
	Unx0j20dDRZ/XlwNgrDo3ZtZshH+N03VG/WMNTxuZF+4B9DqvwUGL2oZY21qUdCKrrTpCNX1OiNfq
	VmW2trhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0YyU-0007uO-OK; Fri, 15 Jan 2021 23:57:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0YyR-0007td-Gz
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 23:57:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v15so7238034wrx.4
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 15:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MoPtjiXICTHSPG1bOGTrCCNZTOSTe5/uvK3NlSNpsME=;
 b=P6c5VHbPJHhV3m5glbcNs1X4ni0LaxJ0aJvGxTIZiHbF62g7Yk9LYnegO8LLFLeSW4
 zY4c7kGUxjrMvYUe1Wtt0J6ecKqZiMnr3Q9vNGOgfggz9M18srY84FBSlstqxD3MST8O
 2NTfIyRlO2St4c857jF8StbkAbOeklFU2L0eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MoPtjiXICTHSPG1bOGTrCCNZTOSTe5/uvK3NlSNpsME=;
 b=CBbBrS/T6mqybfmTHtihjTqOTJKq6yOY97iCQ9HeOb9XH84dK/Sy65zM7l93I2XsVK
 mysCTNWBsrd7WEQMkF0N1eGAXa/zUi0FLGhyF9VdS1o5ETsTUsrczNosAtJkcVRsIYJn
 +mamMP6xI+HLZQ3R7HObI9DtWaMfJ7dvyOfh6rtcChwBMULpX/MReoByuOyYtsXXG4s4
 1+pfpdVQJ6XtPfO1MEq8KS4/5lqdgRvyU/bo1DOMGyLnHRYVz9JBWoXMLAgSUi+9WPYm
 ieCI8etBGFnGIHCp+ssJwlpnx9fZta1M7A3OUHPiLHWSBJIlHzj58zZwUY726CIuQZU8
 X+fw==
X-Gm-Message-State: AOAM532HDhfKvOrmcJzUk4q6PASv6MZjji7ps1S9meUqh0moIGhpF7ex
 o1bS4XApmCqhrfU1a8FDK+B9+e2bT3Qg835B
X-Google-Smtp-Source: ABdhPJyzaAoIhOk/GMqgKLaMgQVcJWC5+f3xqU3qia1R871iR9aXyDcVTmXzmwp+jgMVzzeLhj+Pag==
X-Received: by 2002:a5d:5147:: with SMTP id u7mr15852760wrt.114.1610755065729; 
 Fri, 15 Jan 2021 15:57:45 -0800 (PST)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id l7sm13736464wme.4.2021.01.15.15.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 15:57:45 -0800 (PST)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v3] riscv: add BUILTIN_DTB support for MMU-enabled targets
Date: Sat, 16 Jan 2021 01:49:48 +0200
Message-Id: <20210115234947.44014-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_185747_714617_5C64B589 
X-CRM114-Status: GOOD (  15.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel@vger.kernel.org, Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sometimes, especially in a production system we may not want to
use a "smart bootloader" like u-boot to load kernel, ramdisk and
device tree from a filesystem on eMMC, but rather load the kernel
from a NAND partition and just run it as soon as we can, and in
this case it is convenient to have device tree compiled into the
kernel binary. Since this case is not limited to MMU-less systems,
let's support it for these which have MMU enabled too.

While at it, provide __dtb_start as a parameter to setup_vm() in
BUILTIN_DTB case, so we don't have to duplicate BUILTIN_DTB specific
processing in MMU-enabled and MMU-disabled versions of setup_vm().

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
Changes from v2:
* folded "RISC-V: simplify BUILTIN_DTB processing" patch
[http://lists.infradead.org/pipermail/linux-riscv/2021-January/004153.html]
Changes from v1:
* no direct initial_boot_params assignment
* skips the temporary mapping for DT if BUILTIN_DTB=y

 arch/riscv/Kconfig       |  1 -
 arch/riscv/kernel/head.S |  4 ++++
 arch/riscv/mm/init.c     | 19 +++++++++++++------
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2ef05ef921b5..444a1ed1e847 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -445,7 +445,6 @@ endmenu
 
 config BUILTIN_DTB
 	def_bool n
-	depends on RISCV_M_MODE
 	depends on OF
 
 menu "Power management options"
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 16e9941900c4..f5a9bad86e58 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -260,7 +260,11 @@ clear_bss_done:
 
 	/* Initialize page tables and relocate to virtual addresses */
 	la sp, init_thread_union + THREAD_SIZE
+#ifdef CONFIG_BUILTIN_DTB
+	la a0, __dtb_start
+#else
 	mv a0, s1
+#endif /* CONFIG_BUILTIN_DTB */
 	call setup_vm
 #ifdef CONFIG_MMU
 	la a0, early_pg_dir
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 30b61f2c6b87..45faad7c4291 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -192,10 +192,13 @@ void __init setup_bootmem(void)
 #endif /* CONFIG_BLK_DEV_INITRD */
 
 	/*
-	 * Avoid using early_init_fdt_reserve_self() since __pa() does
+	 * If DTB is built in, no need to reserve its memblock.
+	 * Otherwise, do reserve it but avoid using
+	 * early_init_fdt_reserve_self() since __pa() does
 	 * not work for DTB pointers that are fixmap addresses
 	 */
-	memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
+	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
+		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
 
 	early_init_fdt_scan_reserved_mem();
 	dma_contiguous_reserve(dma32_phys_limit);
@@ -499,6 +502,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	/* Setup early PMD for DTB */
 	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
 			   (uintptr_t)early_dtb_pmd, PGDIR_SIZE, PAGE_TABLE);
+#ifndef CONFIG_BUILTIN_DTB
 	/* Create two consecutive PMD mappings for FDT early scan */
 	pa = dtb_pa & ~(PMD_SIZE - 1);
 	create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
@@ -506,7 +510,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
 			   pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
 	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
+#else /* CONFIG_BUILTIN_DTB */
+	dtb_early_va = __va(dtb_pa);
+#endif /* CONFIG_BUILTIN_DTB */
 #else
+#ifndef CONFIG_BUILTIN_DTB
 	/* Create two consecutive PGD mappings for FDT early scan */
 	pa = dtb_pa & ~(PGDIR_SIZE - 1);
 	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
@@ -514,6 +522,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
 			   pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
 	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
+#else /* CONFIG_BUILTIN_DTB */
+	dtb_early_va = __va(dtb_pa);
+#endif /* CONFIG_BUILTIN_DTB */
 #endif
 	dtb_early_pa = dtb_pa;
 
@@ -604,11 +615,7 @@ static void __init setup_vm_final(void)
 #else
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
-#ifdef CONFIG_BUILTIN_DTB
-	dtb_early_va = (void *) __dtb_start;
-#else
 	dtb_early_va = (void *)dtb_pa;
-#endif
 	dtb_early_pa = dtb_pa;
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
