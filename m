Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A22E77173
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iOTLn209lWzSw6kWGwKKV9AGKjDLkXTTDtWlOWxY6g=; b=x/ct4bI+k+svjl
	CgOhOK2uke/q+d3jOdxY39cpL/5DCXvOraGCx8f8mID6Ff86QcBJV0+I0SURRQBTNAoF9MZpr7j6L
	3j5+Fx7F+Cd3gDOn74kg92vXEA7vhd+bTm9iUtDcE1i6WKVfLvl5sTWK5qlJCpiKWiqPOs6T26aj0
	tXMlqPq9qRy9QXFcB1SKU2eVa7GfPrbPsChK6G6D+8U7mPCT1keEYceS98KutBoPomeV6XH1DT/yg
	qEme+gc7WOeoQlDc8geVa7OXZnMGw7l3p49zcyBLyX7RIXmLrMdBUZniA38veK9E2vu0+BtietLL4
	AGRJXECyXlwyMfKuBs5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lv-0000000FaVa-2cyd;
	Thu, 05 Dec 2024 10:44:59 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Fk-0000000FYHX-3bp8
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:37 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-71d41932d32so398936a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395116; x=1733999916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxSp7kmSqkSnu4KEBfrma7Z74EMZDahAlv9AUZJtR6k=;
        b=JHZwtCtGVdYldN0D80a2oLO4WnQXaC+rw9DeAxJrxW8AVxCLMaADISFwq9qZC+Vbx2
         pFillrXdzGu52segu27uRncVBF/jikxo4D3KTYU4xQybc4eBIkzAzec4GD+VsNQfcdQt
         00v0hJwlcwiwNf6/idBhJ294EcyFK8nxfYiUqbzBGo03JL/FPazlWDsZSX1UvmOwdqjI
         ojD/EKeBApj25FRbQbH2k5T9juwJ32+B7mXJkkIkusiGvW9DBuJABCaIpdl0ySZFaIsl
         Yn9nopeMoYemuCsqRHiz16Mr74lsbDZ185YnnCpLh8HULmRqxEMsqq28s7GJaiaxBtN/
         DX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395116; x=1733999916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxSp7kmSqkSnu4KEBfrma7Z74EMZDahAlv9AUZJtR6k=;
        b=I3n0xohsIXf4SBP3XknVai5usqwJ69l/+4S2nrnBfKM+2Qglu74CQn0x+0jTj8fyAO
         HadShzynG0rOOhtuUi1rtiJqMZxf5BRLGJvQfu1QxIJCQH0Y78yTqNXIw6PuzRSwQXw5
         GC69BagwtHb1EwDPAl+mzJI4qcGjEHRcmZXhEKZvstR0Ib97GM6hSPMtalk01iqVr6jh
         uR1Dp6vynLTidhpLntTPykLAX2OYQbl/prWHH9sDYcp7ZTiXWbX9djPN4G1DbOCtjcCN
         6H+tKOhb7+1DTuPdhaIHLRvV4YKLkdLsnQYHHzagj3/W6o9ngU20sxr6ghH17WXSap8+
         3o+w==
X-Forwarded-Encrypted: i=1; AJvYcCU27xdMnAZgii6C/SjiYJTFady9Zs9buGz75qm9YqbgHKGcsWAgMW1i5gzDM8CH06xw9InLQwfpfVw9Bw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb/mMfE/xrhc9otFuiYwXkSZMIXGaV8aaML2w+GRqZMxTUHm6l
	rjyGTmGnzNgxiJEjqGAbqO9U2/iWaujt+tH7Tr4fG/xt3B4prkiKPnlFq9k6104=
X-Gm-Gg: ASbGncvk8C91Ox1hpXGL1aLNZZFiqTfG8PZy92BwWYDDZvLNqB6eE+iKfvNtubGPzDF
	y6ENS0K0TQejullNHRX1V1Bp+W9u73ws9NzlA3lcjqgyX/9zhJYxIJ+YceDl6ZGwhxBdEmrpbiP
	5W3L30wkmxqhSC+YpAo3KHFxlvd78mPJmiWrC0MPIos4upwsAqoAbe0U8yMd4wMbm4Mj9v5dcBH
	EbcZB8UE8Yq0ghF19MLp4toT7p1CMze/l5Cr16/uTdluVQoW6oETGdCDpZv6WbldReyHcjtaouT
	Y3GIXH/LVFJZJhSn18nP4/6QvEEHhTN9
X-Google-Smtp-Source: AGHT+IGAja+xIu0LL2xTFT4mUl3KDqN8KlPjYMDJCXFuXRD/rOHFiqKg6itfbSNH2M80yhGpilt+dg==
X-Received: by 2002:a05:6830:4882:b0:71d:6272:862f with SMTP id 46e09a7af769-71dad6d401bmr10590081a34.22.1733395115810;
        Thu, 05 Dec 2024 02:38:35 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:35 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 14/21] riscv: mm: Only apply svnapot region bigger than software page
Date: Thu,  5 Dec 2024 18:37:22 +0800
Message-Id: <20241205103729.14798-15-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023836_896480_3D610472 
X-CRM114-Status: GOOD (  14.73  )
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

Usually, when it comes to napot pte order, we refer to the order of
software page number. Thus, this commit updates the napot order
calculation method. Also, we only apply svnapot pte as huge pte when its
napot size is bigger than software page.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable-64.h | 21 +++++++++---
 arch/riscv/include/asm/pgtable.h    | 50 +++++++++++++++++++++++------
 arch/riscv/mm/hugetlbpage.c         |  7 ++--
 3 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 26c13484e721..fbdaad9a98dd 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -124,12 +124,23 @@ enum napot_cont_order {
 	NAPOT_ORDER_MAX,
 };
 
+#define NAPOT_PAGE_ORDER_BASE							\
+	((NAPOT_CONT_ORDER_BASE >= (PAGE_SHIFT - HW_PAGE_SHIFT)) ?		\
+	 (NAPOT_CONT_ORDER_BASE - (PAGE_SHIFT - HW_PAGE_SHIFT)) : 1)
+#define NAPOT_PAGE_ORDER_MAX							\
+	((NAPOT_ORDER_MAX > (PAGE_SHIFT - HW_PAGE_SHIFT)) ?			\
+	 (NAPOT_ORDER_MAX - (PAGE_SHIFT - HW_PAGE_SHIFT)) :			\
+	 NAPOT_PAGE_ORDER_BASE)
+
 #define for_each_napot_order(order)						\
-	for (order = NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++)
+	for (order = NAPOT_PAGE_ORDER_BASE;					\
+		order < NAPOT_PAGE_ORDER_MAX; order++)
 #define for_each_napot_order_rev(order)						\
-	for (order = NAPOT_ORDER_MAX - 1;					\
-	     order >= NAPOT_CONT_ORDER_BASE; order--)
-#define napot_cont_order(val)	(__builtin_ctzl((pte_val(val) >> _PAGE_PFN_SHIFT) << 1))
+	for (order = NAPOT_PAGE_ORDER_MAX - 1;					\
+		order >= NAPOT_PAGE_ORDER_BASE; order--)
+#define napot_cont_order(val)							\
+	(__builtin_ctzl((pte_val(val) >> _PAGE_HWPFN_SHIFT) << 1) -		\
+		(PAGE_SHIFT - HW_PAGE_SHIFT))
 
 #define napot_cont_shift(order)	((order) + PAGE_SHIFT)
 #define napot_cont_size(order)	BIT(napot_cont_shift(order))
@@ -137,7 +148,7 @@ enum napot_cont_order {
 #define napot_pte_num(order)	BIT(order)
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
+#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_PAGE_ORDER_BASE))
 #else
 #define HUGE_MAX_HSTATE		2
 #endif
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0fd9bd4e0d13..07d557bc8b39 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -130,7 +130,7 @@
 #include <asm/compat.h>
 
 #define __page_val_to_hwpfn(_val)  (((_val) & _PAGE_HW_PFN_MASK) >> _PAGE_HWPFN_SHIFT)
-#define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
+static inline unsigned long __page_val_to_pfn(unsigned long val);
 
 #ifdef CONFIG_64BIT
 #include <asm/pgtable-64.h>
@@ -470,15 +470,42 @@ static inline unsigned long pte_napot(pte_t pte)
 	return __pte_napot(pte_val(pte));
 }
 
-static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
+static inline unsigned long __pte_mknapot(unsigned long pteval,
+					  unsigned int order)
 {
 	int pos = order - 1 + _PAGE_PFN_SHIFT;
 	unsigned long napot_bit = BIT(pos);
-	unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
+	unsigned long napot_mask = ~GENMASK(pos, _PAGE_HWPFN_SHIFT);
+
+	BUG_ON(__pte_napot(pteval));
+	pteval = (pteval & napot_mask) | napot_bit | _PAGE_NAPOT;
 
-	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
+	return pteval;
 }
 
+#ifdef CONFIG_RISCV_USE_SW_PAGE
+static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
+{
+	unsigned long pteval = pte_val(pte);
+	unsigned int i;
+
+	pteval = __pte_mknapot(pteval, order);
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++)
+		pte.ptes[i] = pteval;
+
+	return pte;
+}
+#else
+static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
+{
+	unsigned long pteval = pte_val(pte);
+
+	pte_val(pte) = __pte_mknapot(pteval, order);
+
+	return pte;
+}
+#endif /* CONFIG_RISCV_USE_SW_PAGE */
+
 #else
 
 static __always_inline bool has_svnapot(void) { return false; }
@@ -495,15 +522,20 @@ static inline unsigned long pte_napot(pte_t pte)
 
 #endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
-/* Yields the page frame number (PFN) of a page table entry */
-static inline unsigned long pte_pfn(pte_t pte)
+static inline unsigned long __page_val_to_pfn(unsigned long pteval)
 {
-	unsigned long res  = __page_val_to_pfn(pte_val(pte));
+	unsigned long res = __page_val_to_hwpfn(pteval);
 
-	if (has_svnapot() && pte_napot(pte))
+	if (has_svnapot() && __pte_napot(pteval))
 		res = res & (res - 1UL);
 
-	return res;
+	return hwpfn_to_pfn(res);
+}
+
+/* Yields the page frame number (PFN) of a page table entry */
+static inline unsigned long pte_pfn(pte_t pte)
+{
+	return __page_val_to_pfn(pte_val(pte));
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 8896c28ec881..4286c7dea68d 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -212,7 +212,7 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 			break;
 		}
 	}
-	if (order == NAPOT_ORDER_MAX)
+	if (order == NAPOT_PAGE_ORDER_MAX)
 		entry = pte_mkhuge(entry);
 
 	return entry;
@@ -405,7 +405,8 @@ static __init int napot_hugetlbpages_init(void)
 		unsigned long order;
 
 		for_each_napot_order(order)
-			hugetlb_add_hstate(order);
+			if (napot_cont_shift(order) > PAGE_SHIFT)
+				hugetlb_add_hstate(order);
 	}
 	return 0;
 }
@@ -426,7 +427,7 @@ static bool __hugetlb_valid_size(unsigned long size)
 		return true;
 	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
 		return true;
-	else if (is_napot_size(size))
+	else if (is_napot_size(size) && size > PAGE_SIZE)
 		return true;
 	else
 		return false;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
