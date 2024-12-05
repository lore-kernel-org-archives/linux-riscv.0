Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49FFE7716C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPvVXxzJ02U8a1QtqzvgM4QgY3RbcFbxUHJZ4dlb5MY=; b=DC7fHwpvuI7D8C
	/X4601UxPULito2SA0cdoJUQG+VPc8mq0bgTnV641ftNOg6xFdS+7HWJkpbuuq0BlflmKgnQ+EObl
	my65Nluth5SsKfMtBmWZW0Nzd23i0vstU3zT0GIlco5F6FkL1qOrfGbTyadZZaw+NkpVkKdPAHIuc
	wfTy2jXY9VlMwGjE/GYTcBFquK4okOcV3jYO1hLV21FLGPaNdSOfELNoWIl8APN34f/0yhA8sjTLc
	XzXzm59nX83fSsQQIkrQrcSaQVvbKH5F0gt/uuepSXrua2G3zoIvFN5KPkQRwE4gjddSYJNZkJnmg
	eRDoUzT+BqAgvX1bkWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lt-0000000FaT8-19CT;
	Thu, 05 Dec 2024 10:44:57 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9FY-0000000FYDw-4615
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:26 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so498904fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395104; x=1733999904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIMWQ57ZznUQuD/aiNRYDz3W26VtFUEaOqg8e4FokQk=;
        b=AFC9mAvx5lIoz+wY+OmDiKtjk1urLrrKShrVjpMq0G+e4z4tiK6LgYHIT3DwV6UrVs
         QWr1QYk3R7xsRBMbOWCKMHV/uZiMghf9E/x6kruh3aobs3x0l9uXmXeamsNVZYOtv5wt
         QjB38Zf34f2YQGcfFB8oWAlS+qDzB04Whcz5+Y+rAjgRclyZ2shwPnxhnd1fe8mbwY/L
         GLfevdBkz19ilRKSjMpIb7A70uc+5fS9tuUgqn6i8AJlHAV0TzN1HOhl8zl8qqFZbBFr
         e1t6inSP/kjVtDTFnE0NLok03F6ANlj+6z02x+xiQvjJ8m2prKFIfXsM+uOQaNsamYGI
         cyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395104; x=1733999904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIMWQ57ZznUQuD/aiNRYDz3W26VtFUEaOqg8e4FokQk=;
        b=T0FBfiVA66ovXm0qp5K/5uPaPHyy+ySL5sl1ia7rj/HTM6hzp0ClaFnAlJ+v0zPRmu
         VVBxPgk7did9QkEmruQGyaJS9xCOVu2+ABRqTFruFSdmcsYHgxBdLIZSvU6JI8mlX3vh
         HHGM5Jka/KDr+M2M05AQukEUCqXtlNuC9L+w61S/2rB81ErWCER+X9RJb2k4cN23/Exq
         MvT/+dqZQYxma+w6T1VDdb1Fz5AT8WpeIzPNyAiqwx6aAIGeZSnllACj4jtMx0gDOmYb
         RITgYrWvjGgT0FDPSlflJZgwLr9PqGi55+RQB0rO/a1utUonpgKrjNSLuaXGrbMBt9lO
         7TsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbXr24bBuF/wyY0nAfqwzzpq0Mx6mR2ov+pN+q22gEjgZgpxdZVcnoM+n7NZU7j00cTqIu1iSD8bWv2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpsDnYpC3/xAICLmJFoW0+SkSMoaboCSSy55WcLc97tWb3T1f+
	mj3m+x0lUkmGyAjj8E+ki+6dzRm3gYBLcDfjFdGXoLgzBkBxtRRCodtJYmZ39G4=
X-Gm-Gg: ASbGncugDUNhj2QijCAcBH6+0vVrzL66ZRPVr2TBzrIp8cSnmTfK105L2hToqh7P8mW
	FBAxsJGHAIND/fpmwF/xD1/v4pC3dF+suolHSO8n7kPaDTPpYOyBMyLYhMTknfH3T5B5+RMKni1
	PgPOo4vkqz+3GwWrK4AAAL2mVrYgvA3pe3bCHCz3S/41jT5FVgXGv90NQFDVBBFb8C/nAfYPMBb
	boZxsffBQsq/IXY6i0aTd3Uh9L2nJmZHfFurFKL9cPlRo/MVO3F1Zy+zcxqj52fMVdPv7IJZzIR
	PVWr/2LSzeKiA8l8urhguxp0zKuNdMR3
X-Google-Smtp-Source: AGHT+IFGD682lN2KXS9mZyYiAgPgUddfTIrz2tftbpWLW1OwVDgKSjli0UbK/dW/c1XvobnxdhptFQ==
X-Received: by 2002:a05:6870:4944:b0:29d:c5e8:e41f with SMTP id 586e51a60fabf-29e88576409mr11051212fac.5.1733395103681;
        Thu, 05 Dec 2024 02:38:23 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:23 -0800 (PST)
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
Subject: [RFC PATCH v2 11/21] riscv: mm: Reimplement mk_huge_pte function
Date: Thu,  5 Dec 2024 18:37:19 +0800
Message-Id: <20241205103729.14798-12-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023825_018591_993025C2 
X-CRM114-Status: GOOD (  13.93  )
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

Huge pte can be pud, pmd, or svnapot pte. Huge ptes from different page
table levels have different pte constructors. This commit reimplements
mk_huge_pte function. We take vma struct as argument to check the target
huge pte level and applying corresponding constructor.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/hugetlb.h |  5 +++++
 arch/riscv/mm/hugetlbpage.c      | 23 ++++++++++++++++++++++-
 arch/s390/include/asm/hugetlb.h  |  2 +-
 include/asm-generic/hugetlb.h    |  5 ++++-
 mm/debug_vm_pgtable.c            |  2 +-
 mm/hugetlb.c                     |  4 ++--
 6 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index faf3624d8057..eafd00f4b74f 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -51,6 +51,11 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 
 #endif /*CONFIG_RISCV_ISA_SVNAPOT*/
 
+#ifdef CONFIG_RISCV_USE_SW_PAGE
+#define __HAVE_ARCH_MK_HUGE_PTE
+pte_t mk_huge_pte(struct vm_area_struct *vma, struct page *page, pgprot_t pgprot);
+#endif
+
 #include <asm-generic/hugetlb.h>
 
 #endif /* _ASM_RISCV_HUGETLB_H */
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 42314f093922..8896c28ec881 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -2,6 +2,27 @@
 #include <linux/hugetlb.h>
 #include <linux/err.h>
 
+#ifdef CONFIG_RISCV_USE_SW_PAGE
+pte_t mk_huge_pte(struct vm_area_struct *vma, struct page *page, pgprot_t pgprot)
+{
+	pte_t pte;
+	unsigned int shift = huge_page_shift(hstate_vma(vma));
+
+	if (shift == PGDIR_SHIFT)
+		pte = pgd_pte(pfn_pgd(page_to_pfn(page), pgprot));
+	else if (shift == P4D_SHIFT)
+		pte = p4d_pte(pfn_p4d(page_to_pfn(page), pgprot));
+	else if (shift == PUD_SHIFT)
+		pte = pud_pte(pfn_pud(page_to_pfn(page), pgprot));
+	else if (shift == PMD_SHIFT)
+		pte = pmd_pte(pfn_pmd(page_to_pfn(page), pgprot));
+	else
+		pte = pfn_pte(page_to_pfn(page), pgprot);
+
+	return pte;
+}
+#endif /* CONFIG_RISCV_USE_SW_PAGE */
+
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
@@ -74,7 +95,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
 
 out:
 	if (pte) {
-		pte_t pteval = ptep_get_lockless(pte);
+		pte_t pteval = ptep_get(pte);
 
 		WARN_ON_ONCE(pte_present(pteval) && !pte_huge(pteval));
 	}
diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
index cf1b5d6fb1a6..cea9118d4bba 100644
--- a/arch/s390/include/asm/hugetlb.h
+++ b/arch/s390/include/asm/hugetlb.h
@@ -79,7 +79,7 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(pte));
 }
 
-static inline pte_t mk_huge_pte(struct page *page, pgprot_t pgprot)
+static inline pte_t mk_huge_pte(struct vm_area_struct *vma, struct page *page, pgprot_t pgprot)
 {
 	return mk_pte(page, pgprot);
 }
diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 594d5905f615..90765bc03bba 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -5,10 +5,13 @@
 #include <linux/swap.h>
 #include <linux/swapops.h>
 
-static inline pte_t mk_huge_pte(struct page *page, pgprot_t pgprot)
+#ifndef __HAVE_ARCH_MK_HUGE_PTE
+static inline pte_t mk_huge_pte(struct vm_area_struct *vma, struct page *page,
+				pgprot_t pgprot)
 {
 	return mk_pte(page, pgprot);
 }
+#endif
 
 static inline unsigned long huge_pte_write(pte_t pte)
 {
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 1cec548cc6c7..24839883d513 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -919,7 +919,7 @@ static void __init hugetlb_basic_tests(struct pgtable_debug_args *args)
 	 * as it was previously derived from a real kernel symbol.
 	 */
 	page = pfn_to_page(args->fixed_pmd_pfn);
-	pte = mk_huge_pte(page, args->page_prot);
+	pte = mk_huge_pte(args->vma, page, args->page_prot);
 
 	WARN_ON(!huge_pte_dirty(huge_pte_mkdirty(pte)));
 	WARN_ON(!huge_pte_write(huge_pte_mkwrite(huge_pte_wrprotect(pte))));
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 190fa05635f4..2b33eb46408f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5140,10 +5140,10 @@ static pte_t make_huge_pte(struct vm_area_struct *vma, struct page *page,
 	unsigned int shift = huge_page_shift(hstate_vma(vma));
 
 	if (writable) {
-		entry = huge_pte_mkwrite(huge_pte_mkdirty(mk_huge_pte(page,
+		entry = huge_pte_mkwrite(huge_pte_mkdirty(mk_huge_pte(vma, page,
 					 vma->vm_page_prot)));
 	} else {
-		entry = huge_pte_wrprotect(mk_huge_pte(page,
+		entry = huge_pte_wrprotect(mk_huge_pte(vma, page,
 					   vma->vm_page_prot));
 	}
 	entry = pte_mkyoung(entry);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
