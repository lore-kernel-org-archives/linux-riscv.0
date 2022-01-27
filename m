Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A09BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 02:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qa5/juPqxgxSEgYtxXRKPBVav4yM8TO1ySk7GvIx1Ew=; b=A5/Lw0fUP8r6VJ
	fnXdNkAOcz5HbJnAMwaF8kDz0r/xrd52g4HbCHXrWBy24mMOY+y0lSb6XTNtlXJmvKg0JOdv27Zrs
	DYw2rghkKOUN1dsCiSspOQDSgnx0DRT2tSSHRjDwEh/MtN9hksXYo2u5kTPfSntSvw/XaUHroiEFL
	m26AULowMg64QHOJRhmOC++0qRnFFOI3qloF2Y+bwovKemXO38JKWtx+uXKZqvVKNC6esS2T6Nex4
	B/q+uJlb301c+YiGTFLGBoiA+/qx3Gk/Vy6imGmxzqH7K7Sm/dsLU8NfAmR4VVUiBBdaMY5OUCBhn
	2Am/l36XnO+AqvD2bcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCuqV-00E80k-BD; Thu, 27 Jan 2022 02:49:11 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCuqL-00E7xi-O2
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 02:49:06 +0000
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-01 (Coremail) with SMTP id qwCowADHz8cOCPJhFmwLAA--.8245S5;
 Thu, 27 Jan 2022 10:48:56 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 3/4] riscv: mm: Set sv57 on defaultly
Date: Thu, 27 Jan 2022 10:48:43 +0800
Message-Id: <20220127024844.2413385-4-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
References: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHz8cOCPJhFmwLAA--.8245S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr47uw47Wry5Gr43GrW3KFg_yoW7XrW5pr
 srGFsYkrW8JF9Yqr4rJryDXr17Jws8Ca43KFyjkFyUJ3yqkrW5Jrs7t39rAry8ZFsrZFyS
 yrnFgayav3y8tw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
 nxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
 1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
 3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
 WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
 cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
 AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
 Xa7VUbTa0DUUUUU==
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_184902_220807_41DB77A0 
X-CRM114-Status: GOOD (  11.26  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

This patch sets sv57 on defaultly if CONFIG_64BIT. And do fallback to try
to set sv48 on boot time if sv57 is not supported in current hardware.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fd60ab94260b..818c08a351bf 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -151,7 +151,7 @@ config PAGE_OFFSET
 	hex
 	default 0xC0000000 if 32BIT
 	default 0x80000000 if 64BIT && !MMU
-	default 0xffffaf8000000000 if 64BIT
+	default 0xff60000000000000 if 64BIT
 
 config KASAN_SHADOW_OFFSET
 	hex
@@ -202,7 +202,7 @@ config FIX_EARLYCON_MEM
 
 config PGTABLE_LEVELS
 	int
-	default 4 if 64BIT
+	default 5 if 64BIT
 	default 2
 
 config LOCKDEP_SUPPORT
diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index ae711692eec9..299abdef0cd6 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -47,6 +47,7 @@
 #define SATP_PPN	_AC(0x00000FFFFFFFFFFF, UL)
 #define SATP_MODE_39	_AC(0x8000000000000000, UL)
 #define SATP_MODE_48	_AC(0x9000000000000000, UL)
+#define SATP_MODE_57	_AC(0xa000000000000000, UL)
 #define SATP_ASID_BITS	16
 #define SATP_ASID_SHIFT	44
 #define SATP_ASID_MASK	_AC(0xFFFF, UL)
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 160e3a1e8f8b..28ee1b05f3aa 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -41,6 +41,7 @@
  * By default, CONFIG_PAGE_OFFSET value corresponds to SV48 address space so
  * define the PAGE_OFFSET value for SV39.
  */
+#define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
 #define PAGE_OFFSET_L3		_AC(0xffffffd800000000, UL)
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ad0a7e9f828b..3e7e35d50e69 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -79,7 +79,9 @@ static void print_mmu(struct seq_file *f)
 #if defined(CONFIG_32BIT)
 	strncpy(sv_type, "sv32", 5);
 #elif defined(CONFIG_64BIT)
-	if (pgtable_l4_enabled)
+	if (pgtable_l5_enabled)
+		strncpy(sv_type, "sv57", 5);
+	else if (pgtable_l4_enabled)
 		strncpy(sv_type, "sv48", 5);
 	else
 		strncpy(sv_type, "sv39", 5);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 425377c97c40..df8ddde2e750 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -38,14 +38,14 @@ EXPORT_SYMBOL(kernel_map);
 #endif
 
 #ifdef CONFIG_64BIT
-u64 satp_mode = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_48 : SATP_MODE_39;
+u64 satp_mode = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
 #else
 u64 satp_mode = SATP_MODE_32;
 #endif
 EXPORT_SYMBOL(satp_mode);
 
 bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
-bool pgtable_l5_enabled = false;
+bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
 EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
 
@@ -659,6 +659,13 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
 #ifdef CONFIG_64BIT
+static void __init disable_pgtable_l5(void)
+{
+	pgtable_l5_enabled = false;
+	kernel_map.page_offset = PAGE_OFFSET_L4;
+	satp_mode = SATP_MODE_48;
+}
+
 static void __init disable_pgtable_l4(void)
 {
 	pgtable_l4_enabled = false;
@@ -675,12 +682,12 @@ static void __init disable_pgtable_l4(void)
 static __init void set_satp_mode(void)
 {
 	u64 identity_satp, hw_satp;
-	uintptr_t set_satp_mode_pmd;
+	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
+	bool check_l4 = false;
 
-	set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
-	create_pgd_mapping(early_pg_dir,
-			   set_satp_mode_pmd, (uintptr_t)early_pud,
-			   PGDIR_SIZE, PAGE_TABLE);
+	create_p4d_mapping(early_p4d,
+			set_satp_mode_pmd, (uintptr_t)early_pud,
+			P4D_SIZE, PAGE_TABLE);
 	create_pud_mapping(early_pud,
 			   set_satp_mode_pmd, (uintptr_t)early_pmd,
 			   PUD_SIZE, PAGE_TABLE);
@@ -692,6 +699,11 @@ static __init void set_satp_mode(void)
 			   set_satp_mode_pmd + PMD_SIZE,
 			   set_satp_mode_pmd + PMD_SIZE,
 			   PMD_SIZE, PAGE_KERNEL_EXEC);
+retry:
+	create_pgd_mapping(early_pg_dir,
+			   set_satp_mode_pmd,
+			   check_l4 ? (uintptr_t)early_pud : (uintptr_t)early_p4d,
+			   PGDIR_SIZE, PAGE_TABLE);
 
 	identity_satp = PFN_DOWN((uintptr_t)&early_pg_dir) | satp_mode;
 
@@ -700,10 +712,17 @@ static __init void set_satp_mode(void)
 	hw_satp = csr_swap(CSR_SATP, 0ULL);
 	local_flush_tlb_all();
 
-	if (hw_satp != identity_satp)
+	if (hw_satp != identity_satp) {
+		if (!check_l4) {
+			disable_pgtable_l5();
+			check_l4 = true;
+			goto retry;
+		}
 		disable_pgtable_l4();
+	}
 
 	memset(early_pg_dir, 0, PAGE_SIZE);
+	memset(early_p4d, 0, PAGE_SIZE);
 	memset(early_pud, 0, PAGE_SIZE);
 	memset(early_pmd, 0, PAGE_SIZE);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
