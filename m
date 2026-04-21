Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A1F327C2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 09:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezmZ+4Sfo5Vc3/RUivuIgoXw27SPPgUknJNljHSpSzQ=; b=LrdxsHIkExUqeB
	SXbPoRB5DbcuaiYSb9YNlrkG6kNw7wABfdgQVQ0R/Zw48fg/J5F4qsWwTiABirvazgXuvMIoMglwO
	sNd+XmdGIkNnNEPFi8zaB9NAlSJNnlZtrrrdWvZPEf67QY+Z0RIRB3f2jwSUa4UjJwtC5/saO4Oqm
	Vn8sC40LCT8y5UbXpT1L4RUM/qye3SzMRReW7MH0a0hSWFbZi2BEB17nEe5t/50fNXVFW0Gqn0+l7
	ur3/HxcGmteNz/RrZNmIHEFrXiez3X3dUZMmTTEMOTPe91w9djmpiWrlhQQPEIGRGXCQgln+7zwwR
	sGJVjb7RGnTRHyFoYpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7Mm-00000008KbD-21WE;
	Tue, 21 Apr 2026 09:26:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7Mj-00000008KZB-3ldu
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 09:25:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2adff872068so18950285ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1776763557; x=1777368357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqGRaYikd48k8jEHjjdiykQw70hWXJqzRcIUQ0MV2mg=;
        b=iH4Ez+mmZb6AgH/crarxKBxh6EBAJATE83Iz/U1sDzGFDwS3ueQXVykBlL7NMa6cWA
         auhvo9Db+6oQtUYozDdKhUGSnQsiJ4gkPQfEl6H+LQR8ldEJUDNbMmXLT801I7vtrk+F
         frlz09a5No0W9ot2KUjc1L35LgUZknc3xoXFfsrGp2UkzxuTHXzkc0Zbmq2lNl7XjbuQ
         qvFDtFSFsqGSriuyZgxZtAkrqagrmkRho2LFbct+p+Nlbtccs5VbhhIjauw2XYojj292
         MnLKHG6gs3Gs6zYgWqt0XYw6QCWom+izI6TAuFJvXytolbGwWstnhlZcL6C3Z6EogwDO
         knTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763557; x=1777368357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CqGRaYikd48k8jEHjjdiykQw70hWXJqzRcIUQ0MV2mg=;
        b=rv7xWwgmfIejVvmAxCHxncrAcshLc0JySZLfdhAfT4nIjeoBAVlzBD6EXUlxxkatm1
         fGZqufaSJzpxLnwyi/T/LQPoPvGxux9A9fkA5nJ6Q+LliB+i+fVBIBDzjuFLehf6JAsD
         pEZgSpAAZhFltZneTkh1BOLesm5Q5wVCkNXrcbuRKrWY9GG1Hm8sJbg86G3qdmtdtoXo
         TI7W5I5MZMswdF9MJlEtTEl5LLxzGzvVMnd8twrSYhIphQy3FOBG9gHR7IGYiYJy6UhT
         MPR7gwaK+v25U3lui6SE0Be6RtRWxk3pZ24SNPIWB92127pGd4UeAA4gEuCM2/eMhMmn
         /BIw==
X-Forwarded-Encrypted: i=1; AFNElJ/5VMfPvcwZd2yDi+r+J7xa6ec7HW2OIGdIfhmUSZ/D9vRWUgV7wVSWPgJfunVpL8VjToTA5Z2hrgkdNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyGl1U6yFaawVZPbgzQKiZBqUeprEGuEAhQCNhyWWl2y8XCE9c
	5fbNI5qHq8D2XOANLU8fYpTrXblBlWPaGYeWh7dUpyHhlbc6IBVco1Id3si1/Hf0cVs=
X-Gm-Gg: AeBDievtamA/Rj5eSasp7+4SmgwSTQW939loKQF0CmP52cX9hR5WWK+OzboqC94VGn0
	F9GaVWVnTJwKbY/VaQAy+n3pnhzD0USog4w2/yFNFFeBoDzc+Ev3QiBEMRmd4ndArdip3x72eMi
	RKEjro2IwmYBkZ4Ue8s3D/fLpBQyS3xsdPnPc36WS0GgAkdXEER8C+h3rQ21VlkIsRrvH7PdPEN
	vxdtiMGNl6kCzBcoTiO7ebyVwThu/UwLVtwZjwrVTp9emnDHtgPyb16Tr0AQHZ45t/EYmPJw9dB
	sZc1EeqbCVNjWIC+w++eUpOr3GTIvxhnrlfZpQmv0jQtmCTYJaXdrFqgUc+fNqtoO1N/yvn30FY
	ifZKM8JWMvIZ8dzpDjt9fddR4OXInym4K+O9w8F0H4Vm0s8/0OUksaQabz1sAvKKtjwVNeHp5tC
	kgQAJudVRGRxJYIkFH9tM45wFO+NiYYqRqCaeD4UiyI2D40Fa46BiI7OtDnqmpKVf3RK7o
X-Received: by 2002:a17:903:1b30:b0:2b4:586d:2e5c with SMTP id d9443c01a7336-2b5f9ecbaa1mr174163805ad.2.1776763557022;
        Tue, 21 Apr 2026 02:25:57 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff39csm131965105ad.4.2026.04.21.02.25.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Apr 2026 02:25:56 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	andreyknvl@gmail.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	apopple@nvidia.com,
	ardb@kernel.org,
	atish.patra@linux.dev,
	baolin.wang@linux.alibaba.com,
	cuiyunhui@bytedance.com,
	david@kernel.org,
	debug@rivosinc.com,
	djordje.todorovic@htecgroup.com,
	dvyukov@google.com,
	elver@google.com,
	glider@google.com,
	ilias.apalodimas@linaro.org,
	junhui.liu@pigmoral.tech,
	kasan-dev@googlegroups.com,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	ljs@kernel.org,
	namcao@linutronix.de,
	osalvador@suse.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rmclure@linux.ibm.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryabinin.a.a@gmail.com,
	surenb@google.com,
	vincenzo.frascino@arm.com,
	vishal.moola@gmail.com,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: [PATCH 5/7] riscv: add contiguous PTE range clearing helpers
Date: Tue, 21 Apr 2026 17:24:55 +0800
Message-Id: <20260421092457.37649-6-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260421092457.37649-1-cuiyunhui@bytedance.com>
References: <20260421092457.37649-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_022557_948523_8609DF51 
X-CRM114-Status: GOOD (  14.11  )
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

Add Svnapot-aware implementations of clear_full_ptes() and
get_and_clear_full_ptes() so full PTE batches can be cleared without
losing the required unfold semantics for NAPOT mappings.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 75 ++++++++++++++++++++++++-
 arch/riscv/mm/contpte.c          | 96 ++++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 722483d4df37f..3e6516b5a4587 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -657,7 +657,6 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 }
 
 #define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
-
 static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep, pte_t pteval, unsigned int nr)
 {
@@ -764,6 +763,47 @@ __ptep_get_and_clear(struct mm_struct *mm, unsigned long address, pte_t *ptep)
 
 #define __ptep_get_and_clear __ptep_get_and_clear
 
+static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+				     pte_t *ptep, unsigned int nr, int full)
+{
+	(void)full;
+
+	for (;;) {
+		__ptep_get_and_clear(mm, addr, ptep);
+		if (--nr == 0)
+			break;
+		ptep++;
+		addr += PAGE_SIZE;
+	}
+}
+
+#define __clear_full_ptes __clear_full_ptes
+
+static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
+					      unsigned long addr,
+				      pte_t *ptep,
+				      unsigned int nr,
+				      int full)
+{
+	pte_t pte, tmp_pte;
+
+	(void)full;
+
+	pte = __ptep_get_and_clear(mm, addr, ptep);
+	while (--nr) {
+		ptep++;
+		addr += PAGE_SIZE;
+		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
+		if (pte_dirty(tmp_pte))
+			pte = pte_mkdirty(pte);
+		if (pte_young(tmp_pte))
+			pte = pte_mkyoung(pte);
+	}
+
+	return pte;
+}
+
+#define __get_and_clear_full_ptes __get_and_clear_full_ptes
 static inline void
 __ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
 {
@@ -831,6 +871,11 @@ pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte);
 pte_t napotpte_ptep_get_lockless(pte_t *ptep);
 void napotpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 		       pte_t *ptep, pte_t pte, unsigned int nr);
+void napotpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, unsigned int nr, int full);
+pte_t napotpte_get_and_clear_full_ptes(struct mm_struct *mm,
+				       unsigned long addr, pte_t *ptep,
+				       unsigned int nr, int full);
 void napotpte_clear_young_dirty_ptes(struct vm_area_struct *vma,
 				     unsigned long addr, pte_t *ptep,
 			     unsigned int nr, cydp_t flags);
@@ -933,6 +978,32 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 	napotpte_clear_young_dirty_ptes(vma, addr, ptep, nr, flags);
 }
 
+#define clear_full_ptes clear_full_ptes
+static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+				   pte_t *ptep, unsigned int nr, int full)
+{
+	if (likely(nr == 1)) {
+		napotpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+		__clear_full_ptes(mm, addr, ptep, nr, full);
+		return;
+	}
+
+	napotpte_clear_full_ptes(mm, addr, ptep, nr, full);
+}
+
+#define get_and_clear_full_ptes get_and_clear_full_ptes
+static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
+					    unsigned long addr, pte_t *ptep,
+				    unsigned int nr, int full)
+{
+	if (likely(nr == 1)) {
+		napotpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+		return __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
+	}
+
+	return napotpte_get_and_clear_full_ptes(mm, addr, ptep, nr, full);
+}
+
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
@@ -989,6 +1060,8 @@ napotpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 #define ptep_get_lockless			__ptep_get_lockless
 #define ptep_get_and_clear			__ptep_get_and_clear
 #define clear_young_dirty_ptes			__clear_young_dirty_ptes
+#define clear_full_ptes				__clear_full_ptes
+#define get_and_clear_full_ptes			__get_and_clear_full_ptes
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 #define ptep_set_wrprotect			__ptep_set_wrprotect
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index f73af7d9b099a..77c2a4dbd3dda 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -107,6 +107,38 @@ __napot_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep
 	return pte;
 }
 
+static void __napot_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+				    pte_t *ptep, unsigned int nr)
+{
+	for (;;) {
+		__napot_ptep_get_and_clear(mm, addr, ptep);
+		if (--nr == 0)
+			break;
+		ptep++;
+		addr += PAGE_SIZE;
+	}
+}
+
+static pte_t __napot_get_and_clear_full_ptes(struct mm_struct *mm,
+					     unsigned long addr, pte_t *ptep,
+					     unsigned int nr)
+{
+	pte_t pte, tmp_pte;
+
+	pte = __napot_ptep_get_and_clear(mm, addr, ptep);
+	while (--nr) {
+		ptep++;
+		addr += PAGE_SIZE;
+		tmp_pte = __napot_ptep_get_and_clear(mm, addr, ptep);
+		if (pte_dirty(tmp_pte))
+			pte = pte_mkdirty(pte);
+		if (pte_young(tmp_pte))
+			pte = pte_mkyoung(pte);
+	}
+
+	return pte;
+}
+
 static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 			     pte_t *ptep, pte_t target)
 {
@@ -202,6 +234,33 @@ void __napotpte_try_fold(struct mm_struct *mm, unsigned long addr,
 }
 EXPORT_SYMBOL(__napotpte_try_fold);
 
+static void napotpte_try_unfold_range(struct mm_struct *mm,
+				      unsigned long addr, pte_t *ptep,
+				      unsigned int nr)
+{
+	unsigned long next;
+	pte_t pte;
+	unsigned int chunk;
+
+	while (nr) {
+		pte = READ_ONCE(*ptep);
+		if (pte_present_napot(pte)) {
+			__napotpte_try_unfold(mm, addr, ptep, pte);
+			next = napot_align_addr(addr) + napotpte_size();
+			chunk = (next - addr) >> PAGE_SHIFT;
+		} else {
+			chunk = 1;
+		}
+
+		if (chunk > nr)
+			chunk = nr;
+
+		ptep += chunk;
+		addr += chunk * PAGE_SIZE;
+		nr -= chunk;
+	}
+}
+
 void __napotpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, pte_t pte)
 {
@@ -349,6 +408,43 @@ void napotpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 }
 EXPORT_SYMBOL(napotpte_set_ptes);
 
+void napotpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, unsigned int nr, int full)
+{
+	(void)full;
+
+	if (!napot_hw_supported() || !mm_is_user(mm)) {
+		__napot_clear_full_ptes(mm, addr, ptep, nr);
+		return;
+	}
+
+	/*
+	 * Unlike arm64 contpte, a Svnapot PTE block stores identical
+	 * napot-encoded entries across the whole block rather than per-page
+	 * PFNs. Batch zap paths must therefore unfold the whole covered range
+	 * so the core MM later sees ordinary per-page PTEs for rmap/rss/tlb
+	 * batching.
+	 */
+	napotpte_try_unfold_range(mm, addr, ptep, nr);
+	__napot_clear_full_ptes(mm, addr, ptep, nr);
+}
+EXPORT_SYMBOL(napotpte_clear_full_ptes);
+
+pte_t napotpte_get_and_clear_full_ptes(struct mm_struct *mm,
+				       unsigned long addr, pte_t *ptep,
+				       unsigned int nr, int full)
+{
+	(void)full;
+
+	if (!napot_hw_supported() || !mm_is_user(mm))
+		return __napot_get_and_clear_full_ptes(mm, addr, ptep, nr);
+
+	napotpte_try_unfold_range(mm, addr, ptep, nr);
+
+	return __napot_get_and_clear_full_ptes(mm, addr, ptep, nr);
+}
+EXPORT_SYMBOL(napotpte_get_and_clear_full_ptes);
+
 void napotpte_clear_young_dirty_ptes(struct vm_area_struct *vma,
 				     unsigned long addr, pte_t *ptep,
 				     unsigned int nr, cydp_t flags)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
