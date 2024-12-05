Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBC4E77176
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBJaklUnQYDg8CHFK41N+FdH/3af5awmPagoOyrbmaM=; b=Oy7NMOHF3NqDuu
	MKesXDzq5P0TQ6wJfnlxApy1H5sLzSjei669eZwN3rgQFUIWvMDw1YunMlsTNSicXKDDbjsd8eEAY
	KWwmjnMkFQ7elIHsD86LSs1XKRNWlQM/b1tt5wWLWy/vxVtrDVq9CYLKd8rcxW6TTgqqGNgzYCJLY
	euaclKo1H7TRc4n8OzIqot8vGBt1jrC0cbUayVLCuH98gVLHGEA/mN+kiLs6pDozbL/HbCyoSn+vF
	9yYveaseZWsMAVMMzs+j4U6cmjvhZyMia5jc6RwVkt+pXmDBQVEHsNZJg37t2/1vkLaq0vC3zjqDC
	Ta/UwS70doxH6C1Ot/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lr-0000000FaRR-0woM;
	Thu, 05 Dec 2024 10:44:55 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9FM-0000000FY9t-0mSu
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:13 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7fcfb7db9bfso560804a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395091; x=1733999891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7hmUlID2KY6paYgoqiid5lfsbGFxDDCAN4DBvbC41c=;
        b=Db69tBvLGPpWgeE+FsWEKDnqqcFC8qjmfJL7zzIPl9qh/AredMThlb5hKDK1suPJ/m
         7hiE3+px+EzAUelV6vCKRrlHHcwLlQUA6P3CpJ+w6NTP+//VQJf+L7f8tjt0EVsnWzVo
         w0Ba8KB7wRRF75Iqry4oaL1QJpJaChaSzPMcRW6GAC31LPfESRbWuSWxv21n5f3kKc92
         1rJeMjcCaCBN3DR31+si8AGpX7ak52N0LVeNxNVAGtIJQFPF4X9mlyTyoHSuIxtTIZvI
         NtTw+hbx13Rj5vXEZ3oz2Qhj18VUgHTJXsp2gMtHLtutdOFXsdDqgGT7JRiUCT/Zqh2U
         wKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395091; x=1733999891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7hmUlID2KY6paYgoqiid5lfsbGFxDDCAN4DBvbC41c=;
        b=PVsCGHTuhuQ4RW9Bj0jUauNuMEkKo4c9oPln2cq7NKjjqxN4dJ8EtsLs416TJQQQuW
         0YL6NEZiO5UL6mFl+xR6mLBQpYW20iPc+YllrUUYPqtYanuyUlz86QwFAQirykJLNXZ6
         /LofzAe6DsE0UrkwmJQiNj3AeLrUkykV05IgWYnq3k6UMv22LK5tjJo3sfPxCC+jAndv
         XYDlrjn5p8MpmVF6NxTwM69YlxqiWoe8zAOnyhXRuWTToEq9qOowoM/0633+HTwz9uUa
         Adhfl9xEIy6yG0l5hKVhliIMxkONxqYz6Cy5xHlOBhJrV2HlUbgCto5pUmdlpZPAp4vr
         4tpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1/FLTapKdG8kQGelJF8uHQnxJvOxROhKhOi2Pvy2c7yCz3TElt90tbIslC2mwYzUV7rwre5JcAaolRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfZVg202j2p0f3fPsvMb6v+ZuEeOkMIl16w9CVc0X9DAnDr/7E
	LyAJoNb/yDvztik1PLAH8lsQNTiwr9+lqM4HlYRSIDOESGjL+KVeB+nlFX1/gK8=
X-Gm-Gg: ASbGncuueSyHvHIZql/Thi5iVHi7BfkuNIrRkzbpNz00PJ7lEnJJR5MbbcnJxIfdmdE
	oP4R3D7AhictJzW1QXWdFsZ8kpD3vPlGZfuMN9uCfwvvDR01fUvtsu1pFGiMv7v9RuTPkNgrYYS
	szXd5g84WDcBMTJN9XghNuuJUe//JMVW9EgbD0N5TAzBdL4YYp+zLAcCQS5ensuTffePyQ2IyPe
	yXiq2hBg4m5pF+nB+TOmLS7uMj4Engp8EiT+f0bUKrjSo3jxn5PyYfw5ku4V2vE5nKM4i5EIo6d
	VmU+zv5SUY86767VfRHk4nl0d+pyYSTn
X-Google-Smtp-Source: AGHT+IHbEOK4fVgmqFCn4T84ALhR/xBKYInyH1RV8Ugvahqt2YHHrGpIWPwGC34ww4f3ko0WEWYg3w==
X-Received: by 2002:a05:6a20:cfa4:b0:1e0:d104:4dbd with SMTP id adf61e73a8af0-1e16542f238mr16645992637.46.1733395091287;
        Thu, 05 Dec 2024 02:38:11 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:11 -0800 (PST)
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
Subject: [RFC PATCH v2 08/21] riscv: mm: Reimplement page table entry atomic get function
Date: Thu,  5 Dec 2024 18:37:16 +0800
Message-Id: <20241205103729.14798-9-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023812_224404_C127579A 
X-CRM114-Status: GOOD (  11.77  )
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

This commit implements lockless functions to atomically fetch pte's
value. For each pte structure, we atomically fetch the first mapping
entry, and then fetch the following entries and compare them with the
first mappin entry plus certain step path in a loop. If we find any
difference in their pfns or prots, then the pte structure has been
modified and need to be reloaded.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 156 +++++++++++++++++++++++++++++++
 include/linux/pgtable.h          |  21 +++++
 2 files changed, 177 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ba4a083b7210..fe42afb4441e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -220,6 +220,18 @@ static inline unsigned long satp_pfn(unsigned long satp)
 	return hwpfn_to_pfn(hwpfn);
 }
 
+static inline unsigned long __pte_pgprot(unsigned long pteval)
+{
+	unsigned long prot_mask = GENMASK(_PAGE_HWPFN_SHIFT - 1, 0);
+
+	return pteval & prot_mask;
+}
+
+static inline pgprot_t pte_pgprot(pte_t pte)
+{
+	return __pgprot(__pte_pgprot(pte_val(pte)));
+}
+
 static inline int __pgd_leaf(unsigned long pgdval)
 {
 	return __pgd_present(pgdval) && (pgdval & _PAGE_LEAF);
@@ -734,6 +746,150 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
 }
 #define pgdp_get	pgdp_get
 
+#ifdef CONFIG_RISCV_USE_SW_PAGE
+static inline pte_t ptep_get_lockless(pte_t *ptep)
+{
+	unsigned long pteval;
+	pte_t pte;
+	int i;
+
+retry:
+	pteval = READ_ONCE(ptep->ptes[0]);
+	pte = *ptep;
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++) {
+		if (__page_val_to_pfn(pteval) !=
+		    __page_val_to_pfn(pte.ptes[i]))
+			goto retry;
+		if ((__pte_pgprot(pteval) | _PAGE_DIRTY | _PAGE_ACCESSED) !=
+		    (__pte_pgprot(pte.ptes[i]) | _PAGE_DIRTY | _PAGE_ACCESSED))
+			goto retry;
+
+		if (__pte_present(pteval) && !__pte_napot(pteval))
+			pteval += 1 << _PAGE_HWPFN_SHIFT;
+	}
+
+	return pte;
+}
+#define ptep_get_lockless	ptep_get_lockless
+
+static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
+{
+	unsigned long pmdval;
+	pmd_t pmd;
+	int i;
+
+retry:
+	pmdval = READ_ONCE(pmdp->pmds[0]);
+	pmd = *pmdp;
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++) {
+		if (__page_val_to_pfn(pmdval) !=
+		    __page_val_to_pfn(pmd.pmds[i]))
+			goto retry;
+		if ((__pte_pgprot(pmdval) | _PAGE_DIRTY | _PAGE_ACCESSED) !=
+		    (__pte_pgprot(pmd.pmds[i]) | _PAGE_DIRTY | _PAGE_ACCESSED))
+			goto retry;
+
+		if (__pmd_leaf(pmdval))
+			pmdval += (1 << (PMD_SHIFT - PAGE_SHIFT)) <<
+					_PAGE_HWPFN_SHIFT;
+		else if (__pmd_present(pmdval))
+			pmdval += 1 << _PAGE_HWPFN_SHIFT;
+	}
+
+	return pmd;
+}
+#define pmdp_get_lockless	pmdp_get_lockless
+
+static inline void pmdp_get_lockless_sync(void)
+{
+}
+
+static inline pud_t pudp_get_lockless(pud_t *pudp)
+{
+	unsigned long pudval;
+	pud_t pud;
+	int i;
+
+retry:
+	pudval = READ_ONCE(pudp->puds[0]);
+	pud = *pudp;
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++) {
+		if (__page_val_to_pfn(pudval) !=
+		    __page_val_to_pfn(pud.puds[i]))
+			goto retry;
+		if ((__pte_pgprot(pudval) | _PAGE_DIRTY | _PAGE_ACCESSED) !=
+		    (__pte_pgprot(pud.puds[i]) | _PAGE_DIRTY | _PAGE_ACCESSED))
+			goto retry;
+
+		if (__pud_leaf(pudval))
+			pudval += (1 << (PUD_SHIFT - PAGE_SHIFT)) <<
+					_PAGE_HWPFN_SHIFT;
+		else if (__pud_present(pudval))
+			pudval += 1 << _PAGE_HWPFN_SHIFT;
+	}
+
+	return pud;
+}
+#define pudp_get_lockless	pudp_get_lockless
+
+static inline p4d_t p4dp_get_lockless(p4d_t *p4dp)
+{
+	unsigned long p4dval;
+	p4d_t p4d;
+	int i;
+
+retry:
+	p4dval = READ_ONCE(p4dp->p4ds[0]);
+	p4d = *p4dp;
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++) {
+		if (__page_val_to_pfn(p4dval) !=
+		    __page_val_to_pfn(p4d.p4ds[i]))
+			goto retry;
+		if ((__pte_pgprot(p4dval) | _PAGE_DIRTY | _PAGE_ACCESSED) !=
+		    (__pte_pgprot(p4d.p4ds[i]) | _PAGE_DIRTY | _PAGE_ACCESSED))
+			goto retry;
+
+		if (__p4d_leaf(p4dval))
+			p4dval += (1 << (P4D_SHIFT - PAGE_SHIFT)) <<
+					_PAGE_HWPFN_SHIFT;
+		else if (__p4d_present(p4dval))
+			p4dval += 1 << _PAGE_HWPFN_SHIFT;
+	}
+
+	return p4d;
+}
+#define p4dp_get_lockless	p4dp_get_lockless
+
+static inline pgd_t pgdp_get_lockless(pgd_t *pgdp)
+{
+	unsigned long pgdval;
+	pgd_t pgd;
+	int i;
+
+retry:
+	pgdval = READ_ONCE(pgdp->pgds[0]);
+	pgd = *pgdp;
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++) {
+		if (__page_val_to_pfn(pgdval) !=
+		    __page_val_to_pfn(pgd.pgds[i]))
+			goto retry;
+		if ((__pte_pgprot(pgdval) | _PAGE_DIRTY | _PAGE_ACCESSED) !=
+		    (__pte_pgprot(pgd.pgds[i]) | _PAGE_DIRTY | _PAGE_ACCESSED))
+			goto retry;
+
+		if (__pgd_leaf(pgdval))
+			pgdval += (1 << (PGDIR_SHIFT - PAGE_SHIFT)) <<
+					_PAGE_HWPFN_SHIFT;
+		else if (__pgd_present(pgdval))
+			pgdval += 1 << _PAGE_HWPFN_SHIFT;
+	}
+
+	return pgd;
+}
+#define pgdp_get_lockless	pgdp_get_lockless
+
+#endif /* CONFIG_RISCV_USE_SW_PAGE */
+
 void flush_icache_pte(struct mm_struct *mm, pte_t pte);
 
 static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e8b2ac6bd2ae..b629c48b980b 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -598,6 +598,27 @@ static inline void pmdp_get_lockless_sync(void)
 }
 #endif
 
+#ifndef pudp_get_lockless
+static inline pud_t pudp_get_lockless(pud_t *pudp)
+{
+	return pudp_get(pudp);
+}
+#endif
+
+#ifndef p4dp_get_lockless
+static inline p4d_t p4dp_get_lockless(p4d_t *p4dp)
+{
+	return p4dp_get(p4dp);
+}
+#endif
+
+#ifndef pgdp_get_lockless
+static inline pgd_t pgdp_get_lockless(pgd_t *pgdp)
+{
+	return pgdp_get(pgdp);
+}
+#endif
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #ifndef __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
