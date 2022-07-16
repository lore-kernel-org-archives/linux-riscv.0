Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D03BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJYTiKqgqpiT9+M07Up+OC9QUzQ7XrOIz6yShoLyf6U=; b=o91tI6VOS2e3Cv
	cibhTmHO1W809OITaVCQJlk4ahFIsJKSAliJ/HZfULyuqU5cjOw4fOAXUc52E0ys/V/ggbiT4TXoV
	ZFfa2CXlV2q0r2mNa8XGQ45CzuccAGC29a8jFQCt8fckWNuuhHm+NFIGpAi+YGqUrBtAZEaGK7Vzq
	ag0JjWENQOpNm60wCJ+uD1PGkxsYRtVytVr1igAwAqcvvZEM1CJJ5it48bcfJ2u9x1g/sTiYmT9aK
	wuwiKkdgIYFsqJ7WCyDQgc1m/0b+B7qsp/8bFhrBY8OHaJ6aTzM50GBdhNZB9cjZ/yqHhOQFemjo2
	ccPlrcC1xsiSlYwu4ueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdbz-00Epls-L8; Sat, 16 Jul 2022 08:57:19 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdbr-00EpgV-AS
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 08:57:15 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowAAXOX5afdJiXNlgDg--.22302S3;
	Sat, 16 Jul 2022 16:57:03 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 1/4] riscv, mm: detect svnapot cpu support at runtime
Date: Sat, 16 Jul 2022 16:56:45 +0800
Message-Id: <20220716085648.4156408-2-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
References: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXOX5afdJiXNlgDg--.22302S3
X-Coremail-Antispam: 1UD129KBjvJXoW3GF4xAr4DKFyUXF1kZryDGFg_yoWxCFyrpr
	4kCr9YkFZ8Gw1xCayIvrn8Ww45J3WDGasxKw1v9ry8J3y5JrW8X3s0yasxJw1UXFWvqa4x
	ua95WF1rua13JwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
	C7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZE
	Xa7VUbaZX7UUUUU==
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_015711_763996_6C66C944 
X-CRM114-Status: GOOD (  14.78  )
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

This patch add two erratas to enable/disable svnapot support, patches code
dynamicly when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
option is set. It will influence the behavior of has_svnapot function and
pte_pfn function. All code dependent on svnapot should make sure that has_svnapot
return true firstly.

Also, this patch modifies PTE definition for Svnapot, and creates some functions in
pgtable.h to mark a PTE as napot and check if it is a Svnapot PTE.
Until now, only 64KB napot size is supported in draft spec, so some macros
has only 64KB version.

Yours,
Qinglin

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b17fd4666b0c..c5e1629a6033 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -385,6 +385,13 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
+config SVNAPOT
+	bool "Svnapot support"
+	default n
+	help
+	  Select if your CPU supports Svnapot and you want to enable it when
+	  kernel is booting.
+
 endmenu # "Platform type"
 
 menu "Kernel features"
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 9e2888dbb5b1..84ad32075637 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -20,7 +20,8 @@
 #endif
 
 #define	CPUFEATURE_SVPBMT 0
-#define	CPUFEATURE_NUMBER 1
+#define	CPUFEATURE_SVNAPOT 1
+#define	CPUFEATURE_NUMBER 2
 
 #ifdef __ASSEMBLY__
 
@@ -93,6 +94,27 @@ asm volatile(ALTERNATIVE(						\
 #define ALT_THEAD_PMA(_val)
 #endif
 
+#define ALT_SVNAPOT(_val)						\
+asm(ALTERNATIVE("li %0, 0", "li %0, 1", 0,				\
+		CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)			\
+		: "=r"(_val) :)
+
+#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)	\
+asm(ALTERNATIVE("and %0, %1, %2\n\t"					\
+		"srli %0, %0, %3\n\t"					\
+		"nop\n\tnop\n\tnop",					\
+		"srli t3, %1, %4\n\t"					\
+		"and %0, %1, %2\n\t"					\
+		"srli %0, %0, %3\n\t"					\
+		"sub  t4, %0, t3\n\t"					\
+		"and  %0, %0, t4",					\
+		0, CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)			\
+		: "+r"(_val)						\
+		: "r"(_val),						\
+		  "r"(_pfn_mask),					\
+		  "i"(_pfn_shift),					\
+		  "i"(_napot_shift))
+
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e48eebdd2631..292ab93321e3 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_SVPBMT,
+	RISCV_ISA_EXT_SVNAPOT,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 5c2aba5efbd0..e8463515a46c 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -74,6 +74,20 @@ typedef struct {
  */
 #define _PAGE_PFN_MASK  GENMASK(53, 10)
 
+/*
+ * [63] Svnapot definitions:
+ * 0 Svnapot disabled
+ * 1 Svnapot enabled
+ */
+#define _PAGE_NAPOT_SHIFT 63
+#define _PAGE_NAPOT      (1UL << _PAGE_NAPOT_SHIFT)
+#define NAPOT_CONT64KB_ORDER 4UL
+#define NAPOT_CONT64KB_SHIFT (NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
+#define NAPOT_CONT64KB_SIZE (1UL << NAPOT_CONT64KB_SHIFT)
+#define NAPOT_CONT64KB_MASK (NAPOT_CONT64KB_SIZE - 1)
+#define NAPOT_64KB_PTE_NUM (1UL << NAPOT_CONT64KB_ORDER)
+#define NAPOT_64KB_MASK (7UL << _PAGE_PFN_SHIFT)
+
 /*
  * [62:61] Svpbmt Memory Type definitions:
  *
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1d1be9d9419c..34c4be9de79e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -284,10 +284,38 @@ static inline pte_t pud_pte(pud_t pud)
 	return __pte(pud_val(pud));
 }
 
+static inline bool has_svnapot(void) {
+	u64 _val;
+	ALT_SVNAPOT(_val);
+	return _val;
+}
+
+#ifdef CONFIG_SVNAPOT
+
+static inline unsigned long pte_napot(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_NAPOT;
+}
+
+static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
+{
+	unsigned long napot_bits = (1UL << (order - 1)) << _PAGE_PFN_SHIFT;
+	unsigned long lower_prot =
+		pte_val(pte) & ((1UL << _PAGE_PFN_SHIFT) - 1UL);
+	unsigned long upper_prot = (pte_val(pte) >> _PAGE_PFN_SHIFT)
+				   << _PAGE_PFN_SHIFT;
+
+	return __pte(upper_prot | napot_bits | lower_prot | _PAGE_NAPOT);
+}
+#endif /* CONFIG_SVNAPOT */
+
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
-	return __page_val_to_pfn(pte_val(pte));
+	unsigned long _val  = pte_val(pte);
+	ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
+			_PAGE_PFN_MASK, _PAGE_PFN_SHIFT);
+	return _val;
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index fba9e9f46a8c..9f1113fa2b96 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -89,6 +89,7 @@ int riscv_of_parent_hartid(struct device_node *node)
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b3ec44e25f5..9f38b7d02f2a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -198,6 +198,7 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
 			}
 #undef SET_ISA_EXT_MAP
 		}
@@ -259,6 +260,20 @@ static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
 	return false;
 }
 
+static bool __init_or_module cpufeature_probe_svnapot(unsigned int stage)
+{
+#ifdef CONFIG_SVNAPOT
+	switch (stage) {
+	case RISCV_ALTERNATIVES_EARLY_BOOT:
+		return false;
+	default:
+		return riscv_isa_extension_available(NULL, SVNAPOT);
+	}
+#endif
+
+	return false;
+}
+
 /*
  * Probe presence of individual extensions.
  *
@@ -273,6 +288,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
 	if (cpufeature_probe_svpbmt(stage))
 		cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
 
+	if (cpufeature_probe_svnapot(stage))
+		cpu_req_feature |= (1U << CPUFEATURE_SVNAPOT);
+
 	return cpu_req_feature;
 }
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
