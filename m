Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73445C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpnexZQ534zjsggHz2pYe+Fjg1DgfF36LHhjhs1ZGsI=; b=mUPp3jDUPdAsC9
	+ZZeHE/TAdhLpj1HSNPmPTRaPLAujeHedk7XJoo9gxKY1cqPW9dOlW22d7zp4RqYiW9Ky99H6j1Sm
	G+P3vNljd5iGTt6+HzaxR9LiLLlkyTtToRnimrdf0zqYUVSCaIn6MqYMxyR38RAVGTpgZz3enhc0g
	T5obL9WNIQg/Ma9+gJu8JY9ryauWtTqrYUTOByU6FGbtwbDW5eGaPGNtowrA70USONn3BXIa/8580
	LDilYklVeRbDwWoG9/J4fNGAx/2OuNiwSva7KfbU/Of/lYDWEXK0jKS0I65X8IRan9jwcvOmJxiPw
	Fqe1QPZTE+jY7VV2ElDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9Ru-00CGUg-GY; Mon, 22 Aug 2022 15:34:46 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9Rh-00CGJl-4p
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 15:34:38 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowACXnpL+oQNj_a29Cw--.4579S3;
	Mon, 22 Aug 2022 23:34:29 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v4 1/4] mm: modify pte format for Svnapot
Date: Mon, 22 Aug 2022 23:34:10 +0800
Message-Id: <20220822153413.4038052-2-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
References: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXnpL+oQNj_a29Cw--.4579S3
X-Coremail-Antispam: 1UD129KBjvJXoW3GF47Cr4xZF4DZFy3uw1UGFg_yoWxZr4Upr
	Wvkr9a9Fs8Gw1xC3yIvrnxWw45Ja1DWasxKw1v9rW8J3y5J348Jryqya43Jw1UXFWvqa4I
	ka95WF1ruwsxJ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vY
	z4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
	kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
	0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1I6r4UMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	0JU9SdkUUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwAGDGKY1q7WPAAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_083433_649948_F8E1DB4E 
X-CRM114-Status: GOOD (  14.16  )
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

This commit adds two erratas to enable/disable svnapot support, patches code
dynamicly when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT
compile option is set. It will influence the behavior of has_svnapot
function and pte_pfn function. All code dependent on svnapot should make
sure that has_svnapot return true firstly.

Also, this commit modifies PTE definition for Svnapot, and creates some
functions in pgtable.h to mark a PTE as napot and check if it is a Svnapot
PTE. Until now, only 64KB napot size is supported in draft spec, so some
macros has only 64KB version.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..c43708ae7f38 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -432,6 +432,13 @@ config FPU
 
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
index 19a771085781..f22723174cd9 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -22,7 +22,8 @@
 
 #define	CPUFEATURE_SVPBMT 0
 #define	CPUFEATURE_ZICBOM 1
-#define	CPUFEATURE_NUMBER 2
+#define	CPUFEATURE_SVNAPOT 2
+#define	CPUFEATURE_NUMBER 3
 
 #ifdef __ASSEMBLY__
 
@@ -142,6 +143,27 @@ asm volatile(ALTERNATIVE_2(						\
 	    "r"((unsigned long)(_start) + (_size))			\
 	: "a0")
 
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
index 6f59ec64175e..e4c7ce5a7e1a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -58,6 +58,7 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_SVNAPOT,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index dc42375c2357..a23b71cf5979 100644
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
index 7ec936910a96..37547dd04010 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -264,10 +264,41 @@ static inline pte_t pud_pte(pud_t pud)
 	return __pte(pud_val(pud));
 }
 
+static inline bool has_svnapot(void)
+{
+	u64 _val;
+
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
+
+	ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
+			    _PAGE_PFN_MASK, _PAGE_PFN_SHIFT);
+	return _val;
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 0be8a2403212..d2a61122c595 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -96,6 +96,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 553d755483ed..8cf52f0c5f1a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -204,6 +204,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
+				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
 			}
 #undef SET_ISA_EXT_MAP
 		}
@@ -284,6 +285,20 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
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
@@ -301,6 +316,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
 	if (cpufeature_probe_zicbom(stage))
 		cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
 
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
