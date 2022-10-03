Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F7BC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OeWD9kijvjD+jhVX3XZGcX6mfRqAk5XP82XdxY5J+Ro=; b=mSvLsSW9CJ1O69
	gWgGLJMpBxtD2mwjLjZxI04yxYwhspwAedSrKtEhsza2LSFFNKCw4SV6Jsdc5UsXCvqKz/lDIYGta
	9pToaP92lT57d4EH0YLwK3qPYM0+/g4sMWrVHTzfmHu7UJsSzZmvv2HNd/mmTIjxbVquFqAYTSQ4I
	BiYdMXgnOxO/Mm67YuZYidROKhsoajoD+ArKUBQVV+I5HVlfQetN/cwJmR7vgTka9K2kFhP+cNRXl
	yh+XA0cFtvNQvu6VSUE+Kd9Wgfl+/cXdfbY+bn4+GZ+FYV4QVsSw2yK45p6On2HmJ7XxjjGcfIQBO
	KTWGgLiElNjw9aTiyUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnW-00659e-Id; Mon, 03 Oct 2022 13:47:54 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnQ-006561-6z
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 13:47:51 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowACHzoj05zpjo2sYAw--.64668S3;
	Mon, 03 Oct 2022 21:47:34 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v5 1/4] mm: modify pte format for Svnapot
Date: Mon,  3 Oct 2022 21:47:18 +0800
Message-Id: <20221003134721.1772455-2-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHzoj05zpjo2sYAw--.64668S3
X-Coremail-Antispam: 1UD129KBjvJXoW3AryfGFWDKw15CF1UCrWruFg_yoWxKryrpr
	4kCr9a9FZ8Gw1xC3yIyrn8Wws5Ja1DG39xKw1v9rW8JrWUZryxXryqka43Jw18XFWvqa40
	9a95WF4Fvw43AwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84
	ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	nxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
	1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjfUYBTYUUUUU
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwAIDGM6pWJZpgAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_064748_675622_8C897E83 
X-CRM114-Status: GOOD (  14.94  )
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

This commit adds two erratas to enable/disable svnapot support, patches
code dynamicly when "svnapot" is in the "riscv,isa" field of fdt and
SVNAPOT compile option is set. It will influence the behavior of
has_svnapot function and pte_pfn function. All code dependent on svnapot
should make sure that has_svnapot return true firstly.

Also, this commit modifies PTE definition for Svnapot, and creates some
functions in pgtable.h to mark a PTE as napot and check if it is a Svnapot
PTE. Until now, only 64KB napot size is supported in draft spec, so some
macros has only 64KB version.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d557cc50295d..4354024aae21 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -383,6 +383,20 @@ config RISCV_ISA_C
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_SVNAPOT
+	bool "SVNAPOT extension support"
+	depends on 64BIT && MMU
+	select RISCV_ALTERNATIVE
+	default n
+	help
+	  Say Y if you want to allow kernel to detect SVNAPOT ISA-extension
+	  dynamically in boot time and enable its usage.
+
+	  SVNAPOT extension helps to mark contiguous PTEs as a range
+	  of contiguous virtual-to-physical translations, with a naturally
+	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
+	  size.
+
 config RISCV_ISA_SVPBMT
 	bool "SVPBMT extension support"
 	depends on 64BIT && MMU
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 19a771085781..f3aff5ef52e4 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -22,7 +22,8 @@
 
 #define	CPUFEATURE_SVPBMT 0
 #define	CPUFEATURE_ZICBOM 1
-#define	CPUFEATURE_NUMBER 2
+#define	CPUFEATURE_SVNAPOT 2
+#define	CPUFEATURE_NUMBER 3
 
 #ifdef __ASSEMBLY__
 
@@ -142,6 +143,26 @@ asm volatile(ALTERNATIVE_2(						\
 	    "r"((unsigned long)(_start) + (_size))			\
 	: "a0")
 
+#define ALT_SVNAPOT(_val)						\
+asm(ALTERNATIVE("li %0, 0", "li %0, 1", 0,				\
+		CPUFEATURE_SVNAPOT, CONFIG_RISCV_ISA_SVNAPOT)		\
+		: "=r"(_val) :)
+
+#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)	\
+asm(ALTERNATIVE("and %0, %0, %1\n\t"					\
+		"srli %0, %0, %2\n\t"					\
+		__nops(3),						\
+		"srli t3, %0, %3\n\t"					\
+		"and %0, %0, %1\n\t"					\
+		"srli %0, %0, %2\n\t"					\
+		"sub  t4, %0, t3\n\t"					\
+		"and  %0, %0, t4",					\
+		0, CPUFEATURE_SVNAPOT, CONFIG_RISCV_ISA_SVNAPOT)	\
+		: "+r"(_val)						\
+		: "r"(_pfn_mask),					\
+		  "i"(_pfn_shift),					\
+		  "i"(_napot_shift))
+
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6f59ec64175e..83b8e21a3573 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -54,10 +54,11 @@ extern unsigned long elf_hwcap;
  */
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
+	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_SVNAPOT,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
-	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index dc42375c2357..25ec541192e5 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -74,6 +74,19 @@ typedef struct {
  */
 #define _PAGE_PFN_MASK  GENMASK(53, 10)
 
+/*
+ * [63] Svnapot definitions:
+ * 0 Svnapot disabled
+ * 1 Svnapot enabled
+ */
+#define _PAGE_NAPOT_SHIFT 63
+#define _PAGE_NAPOT      BIT(_PAGE_NAPOT_SHIFT)
+#define NAPOT_CONT64KB_ORDER 4UL
+#define NAPOT_CONT64KB_SHIFT (NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
+#define NAPOT_CONT64KB_SIZE BIT(NAPOT_CONT64KB_SHIFT)
+#define NAPOT_CONT64KB_MASK (NAPOT_CONT64KB_SIZE - 1UL)
+#define NAPOT_64KB_PTE_NUM BIT(NAPOT_CONT64KB_ORDER)
+
 /*
  * [62:61] Svpbmt Memory Type definitions:
  *
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7ec936910a96..c3fc3c661699 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -264,10 +264,39 @@ static inline pte_t pud_pte(pud_t pud)
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
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
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
index 553d755483ed..3557c5cc6f04 100644
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
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
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
+		cpu_req_feature |= BIT(CPUFEATURE_SVNAPOT);
+
 	return cpu_req_feature;
 }
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
