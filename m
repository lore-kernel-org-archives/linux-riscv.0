Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEB9C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 03:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fenysYXXcEdIIH7+apbpe76Rs0AoZ5ywWvDJ10kDgTE=; b=FsHa1kLRs3okMG
	eE3b3SXdZB+2LJ38wOSIM5jES1g42XRwT2YjJD63CU0ssqJRf/63BTDJyroOxeD6ltF8zhYUzEp0p
	AJfnWdSYr9b87Exw9tSs0SDlCE+OYxaTW18TZ3nRBVPD/13Oyb/Om5qwYpt4/JEzcEe9qMzylWtla
	8BWl3GptQ8uyvFxuscf9uYB1aDGiWM9aJmrOh3dIAJfFE7uamU1ScKUJ1bf/Byik2t02kZWjpyXWo
	iZTQ/EhhQ3TrmtoCrBnK5eL7A/DH6i1m9sW/8ojkbArdljRHPjuFqWCrvErjS0xd5znvUoH+8eZPH
	0i6u1lIl0wP6yrc0QF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPy0X-0004Fg-Uk; Thu, 09 Feb 2023 03:54:01 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPy0U-0004El-Ip
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 03:54:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d8so308725plr.10
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 19:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rX83g2rE7xhxdRrv/F8DeHMbia5c19vJlw5JMpsFfLw=;
        b=RarN26cErz2r9UnIJ83p+BcEM+sgHrBHH2EiM6spx2GoZzBIibEEzHKzkIu/5Er6rq
         k/hQ0+BbmFDIGsQ8Z66Fd26XHa6C1AVlXPfBLqtD1Lfg9ibzsFUNA0kZ5sJqTQLX8+Tl
         arwHw1X3v/y7vpEt6wHgfbDu3PyiY1GxwQDkE0chjV1hVtohz5cCz4X4sEmfTGEKuhz9
         wkqAmq694tG33WErRGpG3xreLHEVq7v5CrCcCDH6K/BBQQgQcbQyrb7DPWGZx0r/5xzq
         95AsemUDL/HKvcG3StEMYZUGH+LQfV0zteIt1M4rL0NulNlgxl23FvgC19UF/gPTkDir
         rJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rX83g2rE7xhxdRrv/F8DeHMbia5c19vJlw5JMpsFfLw=;
        b=nayMBcM7r+8sZD8xcf/HnpxTjGDZF2B6SnJoEQQT9+CvDc+cHSvl473+SU6g/iLFn2
         jit/mxj/kqeAC6ohJwibV0luTTl/go6Nq5YTOUu3I1na++wSE/01hEtGWGOmamB9L7R1
         m2SxWF7WhKyeeg5a8h7Jiqh45CnnMnnTkumUgieknAPGQA9N2Dn7a3QPwAbf/dJdGdYz
         CfJ8XhR4ebzqIuWeZ/NZQ/yQHI98zPHKZCWVamuGq9cEUsM2TTjlN6n+Dnlfwa1wVryu
         IuhK+WDJ95xK+cwqU+i607m26IckeSqVlJoxNkUOrkRvRdR1omIt+vz7wvL6SzDdOs4u
         IzKA==
X-Gm-Message-State: AO0yUKVkX+Ugm8Qr6VPxGkifh0dadzekHJQ6q2GVxiulkpae25Rua6tm
	v0OGfdOywFlioPu4kftMvgA=
X-Google-Smtp-Source: AK7set/S6aSA0hkKI97CNeG6037hJzWobq3MDjHAhtL/jSmc3Xq2xXf+yGXx3V3H8J70IEx12Jq9BQ==
X-Received: by 2002:a17:902:ea10:b0:196:5cfe:70b2 with SMTP id s16-20020a170902ea1000b001965cfe70b2mr11478039plg.52.1675914834899;
        Wed, 08 Feb 2023 19:53:54 -0800 (PST)
Received: from localhost.localdomain ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b00192820d00d0sm252602pld.120.2023.02.08.19.53.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 19:53:54 -0800 (PST)
From: Qinglin Pan <panqinglin00@gmail.com>
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Qinglin Pan <panqinglin00@gmail.com>
Subject: [PATCH v12 1/3] riscv: mm: modify pte format for Svnapot
Date: Thu,  9 Feb 2023 11:53:41 +0800
Message-Id: <20230209035343.15282-2-panqinglin00@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209035343.15282-1-panqinglin00@gmail.com>
References: <20230209035343.15282-1-panqinglin00@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_195358_649462_8596A7AF 
X-CRM114-Status: GOOD (  18.00  )
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

Add one alternative to enable/disable svnapot support, enable this static
key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
option is set. It will influence the behavior of has_svnapot. All code
dependent on svnapot should make sure that has_svnapot return true firstly.

Modify PTE definition for Svnapot, and creates some functions in pgtable.h
to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
64KB napot size is supported in spec, so some macros has only 64KB version.

Signed-off-by: Qinglin Pan <panqinglin00@gmail.com>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7c814fbf9527..5b051ca93fa7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -397,6 +397,25 @@ config RISCV_ISA_C
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_SVNAPOT
+	bool "SVNAPOT extension support"
+	depends on 64BIT && MMU
+	select RISCV_ALTERNATIVE
+	default y
+	help
+	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
+	  time and enable its usage.
+
+	  The SVNAPOT extension is used to mark contiguous PTEs as a range
+	  of contiguous virtual-to-physical translations for a naturally
+	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
+	  size. When HUGETLBFS is also selected this option unconditionally
+	  allocates some memory for each NAPOT page size supported by the kernel.
+	  When optimizing for low memory consumption and for platforms without
+	  the SVNAPOT extension, it may be better to say N here.
+
+	  If you don't know what to do here, say Y.
+
 config RISCV_ISA_SVPBMT
 	bool "SVPBMT extension support"
 	depends on 64BIT && MMU
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index ee9c80fe0062..6e368d3f6631 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -43,10 +43,11 @@
 #define RISCV_ISA_EXT_SSCOFPMF         26
 #define RISCV_ISA_EXT_SSTC             27
 #define RISCV_ISA_EXT_SVINVAL          28
-#define RISCV_ISA_EXT_SVPBMT           29
-#define RISCV_ISA_EXT_ZBB              30
-#define RISCV_ISA_EXT_ZICBOM           31
-#define RISCV_ISA_EXT_ZIHINTPAUSE      32
+#define RISCV_ISA_EXT_SVNAPOT          29
+#define RISCV_ISA_EXT_SVPBMT           30
+#define RISCV_ISA_EXT_ZBB              31
+#define RISCV_ISA_EXT_ZICBOM           32
+#define RISCV_ISA_EXT_ZIHINTPAUSE      33
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 9f432c1b5289..24a3dd265183 100644
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
index 42a042c0e13e..7a5097202e15 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -78,6 +78,40 @@ typedef struct {
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
+#define napot_cont_mask(order)	(~(napot_cont_size(order) - 1UL))
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
index 2a88362dffa5..76502bc7bef2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -264,10 +264,47 @@ static inline pte_t pud_pte(pud_t pud)
 	return __pte(pud_val(pud));
 }
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+
+static __always_inline bool has_svnapot(void)
+{
+	return riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
+}
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
+static __always_inline bool has_svnapot(void) { return false; }
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
index 420228e219f7..5670909619c8 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -191,6 +191,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
+	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 21fb567e1b22..271e391d436d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -223,6 +223,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
