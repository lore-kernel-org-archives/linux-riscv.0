Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4077FC6FD1E
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40SorDkMfGpmoJFd7KbNh3+54c0VCP2equ4dCsiyt0Q=; b=CVw7b0NJTP6otq
	cOSqbQs65eszTed0VmKT635Z1fD13rwHZ1MT5OPE0BJK336d8oRBLUvtQ3I8+VY+xG5EBVIu7Msyi
	MOgyHHg9Yb0vNSNUJJSHIy3NxSMYvtzWB5dbNwIfpfS597pwcRXVhkv2sucHCPpuqBCoUFEwrIG3x
	VM6K89cIGvE+emyZoSMvSfTSJFz3Pd1yT+b4mBPoOcZ2KaDNyxTrxj3/NJNHN2+erGWDsVNbC2PtW
	WsYmLgprtL65z2IXCXA3V/Tb3oRi9fXWWTiafXn3WfJxIgi/z5OjdBysuIrMOmN1cFDUPsTTN0Kg9
	SR0l8pWixez1BnvVtb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoXx-003qqf-P7; Wed, 08 Mar 2023 07:49:13 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoXu-003qpo-BT
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 07:49:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id b20so9656993pfo.6
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 23:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678261748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnkPTZcWRHnAWf8lNwlg/TMlBpf0/fGHaiSmulP9JI0=;
        b=GwZ70sEAUg6st0Cm0lKyZKJc8Cp9lsEiV6ixkCUVfdCb5q9icaUK/Sa1sxkgO7Jnod
         XDfMzWxj8hV0+jChEzBPsusAsKmIvG+2LTtmq+sGCxzAAQGWY/q397JXJl0BOD/5So78
         A755nKCbvP+w09tFtRkYtAMTXZJZRc+3LsYkAD8M6PfwfUsF7eEQjcHCal3ZleVpkH8R
         g76qhLXwXsyCaePqKQP3Vesib3+FyJ7z9yd340T7LyafERvOtN/IEUwyvNptkUd4fqG+
         M5pePxvI4Whn23Prno7gtWZt2SaHmYryA4vcA0TcdvQ2HB7azqn5vYUz9tD56nxR/DYW
         LbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678261748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnkPTZcWRHnAWf8lNwlg/TMlBpf0/fGHaiSmulP9JI0=;
        b=Gcq4PoKQP5L07GkddwPy0sBsSRKRxa1ZpuOsvjh3DCbaK8VIhNQWPddFNIAd6oRWSg
         WsR2mhieOK576Zq8FbV/JZXGUfpBTJfYdq+iyrTyEcN6e6fsF8sz3+N3b0vucp4R9Xgz
         m5sGMwORfTY4hs7HJyTCe0e/eIGyv+QfWd3FFA/uOO6+4cgbaU1tn7PzuiKEXMeg4xC9
         DaUl0E0VFy54MAyhCrQrxu0cuK4mjGoIyWc8dvtk0xmdzlR/IbXlWpwRD2qy1DFX9ecS
         0yI/aHRGa7MZTMBWvb45oXr3TO04WSOj8iXrMPf8jq2HQtwUFQ4/4ZEe94KilQqbGh6B
         URWQ==
X-Gm-Message-State: AO0yUKU+PMnqhPIYoTCs/2wk0/fYivzCBK5SASLEz/26Nfjt90U8FStB
	+Rl2sDB4OSolkth4jgmM3tU=
X-Google-Smtp-Source: AK7set+zz8FiXkbMI975bS8QHS/meL8yAaDaNHYb+95DfTuOoeNiUjFCmaCabhRPxZvlAKc9DKxTpA==
X-Received: by 2002:a62:5386:0:b0:5e3:af7:3bdf with SMTP id h128-20020a625386000000b005e30af73bdfmr17683083pfb.30.1678261748515;
        Tue, 07 Mar 2023 23:49:08 -0800 (PST)
Received: from localhost.localdomain ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id b9-20020aa78109000000b005a8e97fc71bsm8873038pfi.84.2023.03.07.23.49.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Mar 2023 23:49:08 -0800 (PST)
From: Qinglin Pan <panqinglin00@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Qinglin Pan <panqinglin00@gmail.com>
Subject: [PATCH v14 1/3] riscv: mm: modify pte format for Svnapot
Date: Wed,  8 Mar 2023 15:48:51 +0800
Message-Id: <20230308074853.4393-2-panqinglin00@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308074853.4393-1-panqinglin00@gmail.com>
References: <20230308074853.4393-1-panqinglin00@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_234910_420582_2209CF13 
X-CRM114-Status: GOOD (  18.39  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5e42cc37604..43a101369aa5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -398,6 +398,25 @@ config RISCV_ISA_C
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_SVNAPOT
+	bool "SVNAPOT extension support"
+	depends on 64BIT && MMU
+	default y
+	select RISCV_ALTERNATIVE
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
index e3021b2590de..ba9f4650f051 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -42,9 +42,10 @@
 #define RISCV_ISA_EXT_ZBB		30
 #define RISCV_ISA_EXT_ZICBOM		31
 #define RISCV_ISA_EXT_ZIHINTPAUSE	32
+#define RISCV_ISA_EXT_SVNAPOT		33
 
 #define RISCV_ISA_EXT_MAX		64
-#define RISCV_ISA_EXT_NAME_LEN_MAX	32
+#define RISCV_ISA_EXT_NAME_LEN_MAX	33
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 7fed7c431928..0f3220e253bc 100644
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
index ab05f892d317..3303fc03d724 100644
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
index 8400f0cc9704..7d0271c4d525 100644
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
index 59d58ee0f68d..a4728bf60b84 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -224,6 +224,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
