Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E069DC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 12:46:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91642207B1
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 12:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91642207B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B0BOj7fOPNqjdq/qzOhmaOttf/BEhZdBfNc0jj6QQEA=; b=UpfUgwMBCeo5VJbgjv+1JWw3ZL
	pmHepEYauD4lBKJKlVYeRkJx8aM5PD0ByhQq1fL9O74FDL/tSAQOk9Qdp0tV7YR2OySRtOd/rk0UC
	D+LoWKXqvhzP6EoRgJx9FbSeaddyHBuB7KXpGYLbWe93SnrolyqrcQtlRYySuCMU6+Bl3SVzRPfCK
	lXuWx+wBerEOXM+vNCqoCPT+FmM1+UN+ag6oJD7shhrX6+mWXTeB1Iu1y29VU5BIzEmXRxjKcT/5c
	DfgI8vhOKj72I4scnjkDS8aQfNydpEHmBzk4Nc0ZETfd3gCgIorpwOaVkOoNNzgX96DOJ4F5yM5uR
	Xybs8wNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPFC-0001LS-I1; Mon, 04 Jan 2021 12:45:54 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPF6-000175-Dr
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 12:45:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id i24so27173127edj.8
 for <linux-riscv@lists.infradead.org>; Mon, 04 Jan 2021 04:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuNuwNPfijpuOBaWzlXtwbGMCXD1JMeJ1Mw1oOpUEwI=;
 b=aMaSeiP7KGjA0OhAkOvLzSLVjFZdVsZ85/cizFv8E+NSdJRTvvX2B3Ni6fVe9sUKNq
 qy1EaxZOrmPlwo1CyyvpUZirfa9fMK3WDNgjDhniKi1CDIgjYY7V2rkLKticUOnVADEl
 R02Zu1Jfz60Yj9NjNqfUp+o8RbpJDe0ax1AvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuNuwNPfijpuOBaWzlXtwbGMCXD1JMeJ1Mw1oOpUEwI=;
 b=s9eKp5j4wQVDfHwgCp9YXz8xY3QtsQzkDQhQdzqm1xofDa5Lt+sRbK8d7wKTsGD9gn
 yJdtjnvOCnlQfiesgqMdwX+4pz3AgDzahUruoCU0yS4G9gOZok1DfgjYfdmYwUJ4dXkq
 wgO00FnFYWaUMHhG6fKkvAZ8oXPlMXJAmnJhyF10CrwvJ8FEcCtIeWNWNXCwVVVvuCxD
 OjjOg0OxNWZrxOru9lJrZkQBwDtaEajnN9euATIdlT9vZ8txkBtqNO3QTzPQO9QAAoQw
 /ldt2Ar+4x34yyOlrOS+qHibdIt2C/GLRtDc0FdjNTwXr6+xCvFSAnNx0UyaddCJSki2
 uWMA==
X-Gm-Message-State: AOAM533eu/4G5hf5qghdxpLk5DnvIux18l+8ijTXkRaSLX/Zu8kg8Pdx
 59/R0pIx/o2Swv2D1ljDHgxh6RqYRmJ+8Q==
X-Google-Smtp-Source: ABdhPJz1KtHMUthPUBeUyVRx9fuh2PGb9Fx0q0E3aCfc4hmnurWmE0pnveDcE/KyB/+cWsFCHLfPjQ==
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr69825763edr.97.1609764344822; 
 Mon, 04 Jan 2021 04:45:44 -0800 (PST)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id r18sm25359916edx.41.2021.01.04.04.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 04:45:44 -0800 (PST)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: add BUILTIN_DTB support for MMU-enabled targets
Date: Mon,  4 Jan 2021 14:43:15 +0200
Message-Id: <20210104124314.7489-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_074548_623016_C6DEF1DD 
X-CRM114-Status: GOOD (  14.75  )
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
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 Vitaly Wool <vitaly.wool@konsulko.com>
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

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
Changelog from v1:
* no direct initial_boot_params assignment
* skips the temporary mapping for DT if BUILTIN_DTB=y 

 arch/riscv/Kconfig   |  1 -
 arch/riscv/mm/init.c | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 81b76d44725d..07a8bdcc423f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -416,7 +416,6 @@ endmenu
 
 config BUILTIN_DTB
 	def_bool n
-	depends on RISCV_M_MODE
 	depends on OF
 
 menu "Power management options"
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 13ba533f462b..04aeee276817 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -191,10 +191,13 @@ void __init setup_bootmem(void)
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
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
