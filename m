Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2F7C25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 19:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilFLNX2TFml9qiDb2koLS0mOBxyI4pKOto1D07ErRx8=; b=N/meCC8OwbZJmp
	mKTmrElcTVV0+joY9Kdb6jRYaSfpMbiZOy86I1ZceRX/SUgZnjCsFGzmem39YWhGqBgS6kbXDgm4p
	WJPq9yMFRbBY1UvssdVRt5nIKlHVdBcmkhFqf8A9KR7XzftyvsBVPV1i/tYYgSwURTtip8NS3AgQR
	mjIR9PwWNrMYMFBMJys/9nypY5xbIgR2mB3DXNMPxA7vBid1TLFyXBiHUwcfhRslgaso0N5NT4Hxd
	j0ZJzdkuyMUTWpKzYFPvMOhB7MdQeB20Iia7ek5y5cgqKZwshJJe20znbfHJrZmmUzOn4e5LZbB5t
	sNNzlU0K/qLhr8vD6KwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mtI-0000000GiNj-2CVI;
	Wed, 08 May 2024 19:23:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mtC-0000000GiK4-3c9i
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:23:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ffso751075e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715196220; x=1715801020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99tlcIPBJBGOnw31Oe30kKMBjt8TwvO6BCavKhZeDaw=;
        b=ITdXruC5GguL6WoGtm/qK61hLx6XeqZXMfbp0mUEp6cxCSRTGWlJWcD5/EuWVhNNGc
         uhWECY47I/rK27q/Hb28q1u1rxJnYartBFTaJ2xgDf7dPT/6Q8aS7zTenkkZ1/QvhwDI
         +8rvR2O4mm5zVK0slgqHXrCQfWqDGWPRbhbvvtRnIsgNnuY0artGAFnEUI3e54eosuaf
         ubbcZDP179cjJPz/VG5BTib/TC0nL8MxR0lNXbMJUtRb9ZknxUvgQHhIbLeVg+KMpk4v
         /cf5h39f64vOnWnRRl9bRwWVwAoCz3AALyN5uk30AxlDwVfgPQdzBkC7UcUPrB+4dguy
         d1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715196220; x=1715801020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99tlcIPBJBGOnw31Oe30kKMBjt8TwvO6BCavKhZeDaw=;
        b=q4Rsp6N51aqCM6niN7tQ/PeHJw4MEaHqVi/UQ/pYen3y4QqabVr1seK+W9md12IwoJ
         qXau31nONKiGjyZ9hF3Wpw5bFZmtRUQPtdQCu2dkA0uu+9SHiXmZwh8PGEKTI5nnsFgZ
         PUdd1OInIoak4Tyxfe6T5RHY6lDmCl+iA9FeUcry9/N5dd0cdNiKu70ASnPlO2bCTXfm
         CTic1TFFrZYpWUxGbM8qqMIRgi6GUaV2A2S96dYG9oonrOlxwlonTx2L0024qC/YJe0V
         WV6tS/wYIE6usAsnkKy8b2NJDFxiSO5gEKOxAKZbdcSw0hMZhQ3Zkp4jgpN0/Nz4gj31
         B+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX3b/bFdSEuviEXAhYPuWE/Z+i6e3KbDwOu3OuUdX+gn2SPNFK9vyeZL7pYpdCHEIq2n1BaVfPIA+atEc2B3cVxMhiAHVh8XFuMk2r9uGO
X-Gm-Message-State: AOJu0YxxA2QZGlV126JtVSkia9M0HPUdLXa6LMvU4x0j38Mq3awSAk6V
	hv59T6R9bUZwn5ThTBDLG2TZt5XPmWYv+qn7Ma4H7kIKuZWhgdAItu3m3IkIOnk=
X-Google-Smtp-Source: AGHT+IFuqFkdx1GrRMX9VnSrFsQl595h33hB5u187da/mHSb1Bien42UkrHvFd9ITnGVH1r4SnsHfw==
X-Received: by 2002:a05:600c:3ca9:b0:41b:ed36:e055 with SMTP id 5b1f17b1804b1-41fbcb4b4fbmr4761445e9.7.1715196220131;
        Wed, 08 May 2024 12:23:40 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f42e74625sm47255965e9.0.2024.05.08.12.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:23:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 04/12] mm, riscv, arm64: Use common ptep_get_lockless() function
Date: Wed,  8 May 2024 21:19:23 +0200
Message-Id: <20240508191931.46060-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_122342_985914_CD32AEED 
X-CRM114-Status: GOOD (  20.64  )
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

Make riscv use the contpte aware ptep_get_lockless() function from arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 11 +----
 arch/arm64/mm/contpte.c          | 57 --------------------------
 arch/riscv/include/asm/pgtable.h |  2 +
 include/linux/contpte.h          |  1 +
 mm/contpte.c                     | 69 ++++++++++++++++++++++++++++++++
 5 files changed, 73 insertions(+), 67 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e85b3a052a02..8a0603257436 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1384,7 +1384,6 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
  * where it is possible and makes sense to do so. The PTE_CONT bit is considered
  * a private implementation detail of the public ptep API (see below).
  */
-extern pte_t contpte_ptep_get_lockless(pte_t *orig_ptep);
 extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr, int full);
 extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
@@ -1430,16 +1429,8 @@ static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
 extern pte_t ptep_get(pte_t *ptep);
 #define ptep_get ptep_get
 
+extern pte_t ptep_get_lockless(pte_t *ptep);
 #define ptep_get_lockless ptep_get_lockless
-static inline pte_t ptep_get_lockless(pte_t *ptep)
-{
-	pte_t pte = __ptep_get(ptep);
-
-	if (likely(!pte_valid_cont(pte)))
-		return pte;
-
-	return contpte_ptep_get_lockless(ptep);
-}
 
 static inline void set_pte(pte_t *ptep, pte_t pte)
 {
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index e225e458856e..5e9e40145085 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -28,63 +28,6 @@ static void contpte_try_unfold_partial(struct mm_struct *mm, unsigned long addr,
 	}
 }
 
-pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
-{
-	/*
-	 * The ptep_get_lockless() API requires us to read and return *orig_ptep
-	 * so that it is self-consistent, without the PTL held, so we may be
-	 * racing with other threads modifying the pte. Usually a READ_ONCE()
-	 * would suffice, but for the contpte case, we also need to gather the
-	 * access and dirty bits from across all ptes in the contiguous block,
-	 * and we can't read all of those neighbouring ptes atomically, so any
-	 * contiguous range may be unfolded/modified/refolded under our feet.
-	 * Therefore we ensure we read a _consistent_ contpte range by checking
-	 * that all ptes in the range are valid and have CONT_PTE set, that all
-	 * pfns are contiguous and that all pgprots are the same (ignoring
-	 * access/dirty). If we find a pte that is not consistent, then we must
-	 * be racing with an update so start again. If the target pte does not
-	 * have CONT_PTE set then that is considered consistent on its own
-	 * because it is not part of a contpte range.
-	 */
-
-	pgprot_t orig_prot;
-	unsigned long pfn;
-	pte_t orig_pte;
-	pgprot_t prot;
-	pte_t *ptep;
-	pte_t pte;
-	int i;
-
-retry:
-	orig_pte = __ptep_get(orig_ptep);
-
-	if (!pte_valid_cont(orig_pte))
-		return orig_pte;
-
-	orig_prot = pte_pgprot(pte_mkold(pte_mkclean(orig_pte)));
-	ptep = arch_contpte_align_down(orig_ptep);
-	pfn = pte_pfn(orig_pte) - (orig_ptep - ptep);
-
-	for (i = 0; i < CONT_PTES; i++, ptep++, pfn++) {
-		pte = __ptep_get(ptep);
-		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
-
-		if (!pte_valid_cont(pte) ||
-		   pte_pfn(pte) != pfn ||
-		   pgprot_val(prot) != pgprot_val(orig_prot))
-			goto retry;
-
-		if (pte_dirty(pte))
-			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
-			orig_pte = pte_mkyoung(orig_pte);
-	}
-
-	return orig_pte;
-}
-EXPORT_SYMBOL_GPL(contpte_ptep_get_lockless);
-
 void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr, int full)
 {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ebfe6b16529e..62cad1b974f1 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -785,6 +785,8 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 
 extern pte_t ptep_get(pte_t *ptep);
 #define ptep_get ptep_get
+extern pte_t ptep_get_lockless(pte_t *ptep);
+#define ptep_get_lockless ptep_get_lockless
 extern void set_ptes(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pteval, unsigned int nr);
 #define set_ptes set_ptes
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index 54d10204e9af..01da4bfc3af6 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -8,6 +8,7 @@
  * a private implementation detail of the public ptep API (see below).
  */
 pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
+pte_t contpte_ptep_get_lockless(pte_t *orig_ptep);
 void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
 			pte_t *ptep, pte_t pte);
 void contpte_try_fold(struct mm_struct *mm, unsigned long addr,
diff --git a/mm/contpte.c b/mm/contpte.c
index 566745d7842f..060e0bc1a2a3 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -42,6 +42,7 @@
  *   - huge_ptep_clear_flush()
  *   - ptep_get()
  *   - set_ptes()
+ *   - ptep_get_lockless()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -589,4 +590,72 @@ __always_inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		contpte_set_ptes(mm, addr, ptep, pte, nr);
 	}
 }
+
+pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
+{
+	/*
+	 * The ptep_get_lockless() API requires us to read and return *orig_ptep
+	 * so that it is self-consistent, without the PTL held, so we may be
+	 * racing with other threads modifying the pte. Usually a READ_ONCE()
+	 * would suffice, but for the contpte case, we also need to gather the
+	 * access and dirty bits from across all ptes in the contiguous block,
+	 * and we can't read all of those neighbouring ptes atomically, so any
+	 * contiguous range may be unfolded/modified/refolded under our feet.
+	 * Therefore we ensure we read a _consistent_ contpte range by checking
+	 * that all ptes in the range are valid and have CONT_PTE set, that all
+	 * pfns are contiguous and that all pgprots are the same (ignoring
+	 * access/dirty). If we find a pte that is not consistent, then we must
+	 * be racing with an update so start again. If the target pte does not
+	 * have CONT_PTE set then that is considered consistent on its own
+	 * because it is not part of a contpte range.
+	 */
+
+	pgprot_t orig_prot;
+	unsigned long pfn;
+	pte_t orig_pte;
+	pgprot_t prot;
+	pte_t *ptep;
+	pte_t pte;
+	int i, ncontig;
+
+retry:
+	orig_pte = __ptep_get(orig_ptep);
+
+	if (!pte_valid_cont(orig_pte))
+		return orig_pte;
+
+	orig_prot = pte_pgprot(pte_mkold(pte_mkclean(orig_pte)));
+	ptep = arch_contpte_align_down(orig_ptep);
+	ncontig = arch_contpte_get_num_contig(NULL, 0, ptep, 0, NULL);
+	pfn = pte_pfn(orig_pte) - (orig_ptep - ptep);
+
+	for (i = 0; i < ncontig; i++, ptep++, pfn++) {
+		pte = __ptep_get(ptep);
+		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+
+		if (!pte_valid_cont(pte) ||
+				pte_pfn(pte) != pfn ||
+				pgprot_val(prot) != pgprot_val(orig_prot))
+			goto retry;
+
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+
+	return orig_pte;
+}
+EXPORT_SYMBOL_GPL(contpte_ptep_get_lockless);
+
+__always_inline pte_t ptep_get_lockless(pte_t *ptep)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	if (likely(!pte_valid_cont(pte)))
+		return pte;
+
+	return contpte_ptep_get_lockless(ptep);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
