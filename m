Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B27C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 02:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWtb+34g+4p4U1PVbmJ1reNrnjTKpSIfSGVbhw7GfgA=; b=mTxm7LI9031+a8
	mWXa5auU0VsI+GWEGgeJtszNNp2TrcJsFHUrSrsPR421yze6gvSvIEj0TFHMWZr/utpHCglcT7GBo
	46W9Hqw66l31uk9vAOMvLRw9hjgudykqDVLHPnjd/Z/lSo1ggHCC8XGYSNxix1NP9+7n/NpYza78p
	MVWlshIMsf93vSK/N/RMaVgtucHzk2g+JLkn6GyoqZzft9aP+GVVbNlxQUk9SxKrqs5Ltl1Y+n1M1
	HmsvWt/td2UM6lDiek52Kkw7OsHj6kzvC1r5WPe6oklZrEg9aPT0Ig4ow8SbTO2pvhWxU6Z3DI7R7
	DN89biSlstp/wyvdEZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTrw-00Ezyf-I8; Mon, 28 Nov 2022 02:27:40 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTrs-00Ezvo-Vb
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 02:27:39 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowADn7_eRHIRjGpnlAg--.14781S3;
	Mon, 28 Nov 2022 10:27:32 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	alex@ghiti.fr,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v8 1/3] riscv: mm: modify pte format for Svnapot
Date: Mon, 28 Nov 2022 10:27:17 +0800
Message-Id: <20221128022719.328770-2-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221128022719.328770-1-panqinglin2020@iscas.ac.cn>
References: <20221128022719.328770-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn7_eRHIRjGpnlAg--.14781S3
X-Coremail-Antispam: 1UD129KBjvJXoW3XF15tw48Gr1rZrWxJFy7Wrg_yoW3Gr4xpr
	4kGFZa9Fs8Gw1fC3yIyrn8Gw18Xw4DGwsxKw1I9r48Jay7AryxAryDA3W3Gr1DXayvq340
	gFWrWF4S9a1DA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErc
	IFxwAKzVCY07xG64k0F24lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7VUbItC3UUUUU==
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAw4EDGODbwz0SAAAs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_182737_497181_321AF260 
X-CRM114-Status: GOOD (  14.76  )
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

Add one static key to enable/disable svnapot support, enable this static
key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
option is set. It will influence the behavior of has_svnapot. All code
dependent on svnapot should make sure that has_svnapot return true firstly.

Modify PTE definition for Svnapot, and creates some functions in pgtable.h
to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
64KB napot size is supported in spec, so some macros has only 64KB version.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3b41165a8b10..1671938f2f81 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -394,6 +394,20 @@ config RISCV_ISA_C
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_SVNAPOT
+	bool "SVNAPOT extension support"
+	depends on 64BIT && MMU
+	select RISCV_ALTERNATIVE
+	default y
+	help
+	  Allow kernel to detect SVNAPOT ISA-extension dynamically in boot time
+	  and enable its usage.
+
+	  SVNAPOT extension helps to mark contiguous PTEs as a range
+	  of contiguous virtual-to-physical translations, with a naturally
+	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
+	  size.
+
 config RISCV_ISA_SVPBMT
 	bool "SVPBMT extension support"
 	depends on 64BIT && MMU
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b22525290073..15cda8f131aa 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
  */
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
+	RISCV_ISA_EXT_SVNAPOT,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
@@ -69,6 +70,7 @@ enum riscv_isa_ext_id {
  */
 enum riscv_isa_ext_key {
 	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
+	RISCV_ISA_EXT_KEY_SVNAPOT,
 	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
 	RISCV_ISA_EXT_KEY_SVINVAL,
 	RISCV_ISA_EXT_KEY_MAX,
@@ -90,6 +92,8 @@ static __always_inline int riscv_isa_ext2key(int num)
 		return RISCV_ISA_EXT_KEY_FPU;
 	case RISCV_ISA_EXT_d:
 		return RISCV_ISA_EXT_KEY_FPU;
+	case RISCV_ISA_EXT_SVNAPOT:
+		return RISCV_ISA_EXT_KEY_SVNAPOT;
 	case RISCV_ISA_EXT_ZIHINTPAUSE:
 		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
 	case RISCV_ISA_EXT_SVINVAL:
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ac70b0fd9a9a..349fad5e35de 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -16,11 +16,6 @@
 #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE - 1))
 
-#ifdef CONFIG_64BIT
-#define HUGE_MAX_HSTATE		2
-#else
-#define HUGE_MAX_HSTATE		1
-#endif
 #define HPAGE_SHIFT		PMD_SHIFT
 #define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
 #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index dc42375c2357..598958cbda50 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -74,6 +74,40 @@ typedef struct {
  */
 #define _PAGE_PFN_MASK  GENMASK(53, 10)
 
+/*
+ * [63] Svnapot definitions:
+ * 0 Svnapot disabled
+ * 1 Svnapot enabled
+ */
+#define _PAGE_NAPOT_SHIFT	63
+#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
+/*
+ * Only 64KB (order 4) napot ptes supported.
+ */
+#define NAPOT_CONT_ORDER_BASE 4
+enum napot_cont_order {
+	NAPOT_CONT64KB_ORDER = NAPOT_CONT_ORDER_BASE,
+	NAPOT_ORDER_MAX,
+};
+
+#define for_each_napot_order(order)						\
+	for (order = NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++)
+#define for_each_napot_order_rev(order)						\
+	for (order = NAPOT_ORDER_MAX - 1;					\
+	     order >= NAPOT_CONT_ORDER_BASE; order--)
+#define napot_cont_order(val)	(__builtin_ctzl((val.pte >> _PAGE_PFN_SHIFT) << 1))
+
+#define napot_cont_shift(order)	((order) + PAGE_SHIFT)
+#define napot_cont_size(order)	BIT(napot_cont_shift(order))
+#define napot_cont_mask(order)	(napot_cont_size(order) - 1UL)
+#define napot_pte_num(order)	BIT(order)
+
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
+#else
+#define HUGE_MAX_HSTATE		2
+#endif
+
 /*
  * [62:61] Svpbmt Memory Type definitions:
  *
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index c61ae83aadee..af6174e3fd97 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -6,10 +6,12 @@
 #ifndef _ASM_RISCV_PGTABLE_H
 #define _ASM_RISCV_PGTABLE_H
 
+#include <linux/jump_label.h>
 #include <linux/mmzone.h>
 #include <linux/sizes.h>
 
 #include <asm/pgtable-bits.h>
+#include <asm/hwcap.h>
 
 #ifndef CONFIG_MMU
 #define KERNEL_LINK_ADDR	PAGE_OFFSET
@@ -264,10 +266,45 @@ static inline pte_t pud_pte(pud_t pud)
 	return __pte(pud_val(pud));
 }
 
+static __always_inline bool has_svnapot(void)
+{
+	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVNAPOT]);
+}
+
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+
+static inline unsigned long pte_napot(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_NAPOT;
+}
+
+static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
+{
+	int pos = order - 1 + _PAGE_PFN_SHIFT;
+	unsigned long napot_bit = BIT(pos);
+	unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
+
+	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
+}
+
+#else
+
+static inline unsigned long pte_napot(pte_t pte)
+{
+	return 0;
+}
+
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
+
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
-	return __page_val_to_pfn(pte_val(pte));
+	unsigned long res  = __page_val_to_pfn(pte_val(pte));
+
+	if (has_svnapot() && pte_napot(pte))
+		res = res & (res - 1UL);
+
+	return res;
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index bf9dd6764bad..88495f5fcafd 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -165,6 +165,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
+	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..ad12fb5363c3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -205,6 +205,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
