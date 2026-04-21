Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44936F327C2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/6YzA9S4Z0vj7kuatGHednIWcWQ+otquHpJK261Yxk=; b=f+0DYE/gKy8zwR
	U5BDll6hFKTorbDaJFBsEyu9td8K7UE69Dp3zeUiGWKVN+c0wgpQp6DtghVRhOhPcEH2Mg6cZ4/9v
	baq2486zhJqICATI1yfLmACCQ0kYLsDwM8AneK6aOsxTy+sERlxKDdGOuKF6Ygf8FrKngWLA/mic9
	fj34LX1LYsKJf0srBoU2wux3zE+2wCbOsRQCGjTXObekvE31HxwD2s6UtpU771ws+lZCDCnEdRrrV
	4oUCYpQbw3Jgd5bvr2a1agKrjJmMKLSG5xXPBelnIZCzLEVo9ZIO0hwESEQUSuk/DTidB5FF+nG7n
	F2AAgeTzD84CUHZUnUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7Md-00000008KWW-48U9;
	Tue, 21 Apr 2026 09:25:51 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7Ma-00000008KU0-3VkB
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 09:25:51 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso2493773a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1776763548; x=1777368348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTjwhKG7KzQh08aYS/X3NKGI2n2kHnjJW0npzktt0MY=;
        b=MBg1fQvKvpb3IlqdHiOji3Xw96sTmKfyrjjCIbrRW4iKnjZZ113RHVJEkHvXLO7hqW
         uHlzjNeRDNUogdk8Ge0R6RcF5xrpH6a1MlEzn/Cv1p6S/EgtCFItBEIK9tyfaMaMFj2h
         5G1POur+FW0NalX8/LcX/ETNZb+5t0GOrgV7xI7/cA0PlletTSo5uV7fNwiRAs0MLw9O
         8NMev2kEAAoeSRaLwbbdaPxyx69eTUFMTUhIOarmMQJOC2/076KB4yYGqypjcQEWtk6M
         SjUr5br6jNoYO1YGaOmAqb1KIY/olOXNV3aYBNK+iZMnpe79/GcsUxOIx6/mL5y4J/VK
         /PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763548; x=1777368348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pTjwhKG7KzQh08aYS/X3NKGI2n2kHnjJW0npzktt0MY=;
        b=O++qxnmbebGc97jAmKXHxH/SXZar3Q8o8x0SPLUHR6hOaOyki7eaBW2tWwjC8UxP91
         l/a8us8ciPQmBfJ503f3hkthL8lbNr5I+LBJ9HizbnbN5skk/BQ69Q7d3LJwht5VOPLf
         LcOwLyS5uY2BRMdHdD456NbgIK+fdim32IoOIZBwqPKpN65UTvq9QclKoR4MCfi+623w
         8Ep16erA5sqHouBaug5PoBTLm4E7RB8nowXEO474791VLfXT7pBA1+hLW/lVxbjjwlcD
         m80gRoiMJaYvETslgBrTKwhNzAIguLVTamy97XCMZP1cCsLcn6PKKw0yWKONXT4/syzo
         B25g==
X-Forwarded-Encrypted: i=1; AFNElJ/XU+WxGaU0AYj2j1f+SWk9x0QRcNU1wZoV/foFci5o97Q0mr2Zltg1ZUlO95iXMDiorxiUu3ual/3SOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEYTJ7X+19r5eDPThoBZts9QxPHf++3gnXgTHtTDaaWxAqnlCc
	gJ6N9UVZL4gUU0Z/2haCE8jFZRIzwmZlbYYna1w4CYAd2kzRyXI+zqR0dYw66+A+muU=
X-Gm-Gg: AeBDietz5WloxO/ljqLyIi0ikb3y2lfAVYbfMAux64Re1aMMd+y9muip7y7kJuaB+TP
	L4nV7bHfz5yMCoL3io07mfJ+O3Q2Qdys3+8U/7mbjKV5BVjvrBi7ECUBQ+BM7q4IP3XweQWMtox
	u9ilgUgpe6wn8m4n8Rcpu+/i16j1+gZSehIHQs4dBppZnbL2iFu3mswDQUGvQCkeE2ks8d3DmAl
	iP0XIS3HGO788ICE/iB2iuvBnA803xVsOYPsP2ip8Oo+N3ckAMJeMqDXcLJBfx8XBA8RWBr1llg
	N/fDjM2hWaXeHJwfhV8FUia70UlkZPuKHfS2iaLwEkN4u53TvSVPHaz9PgRQ8lGkFfdq02x/nvl
	GQO6SieL0o8lbCmasvn9wMSu3sXPnntDawHIGrZVvCwbku8pEtoxkcE+xjyErsfATFLw4s62Guf
	PxBbDbma2JYxMXLUSay/i//PpjkuiIwyDwObhZB/HR9K4uxqwd4qcwuJLlyrnl7H6MMMLJ
X-Received: by 2002:a17:90b:2dc1:b0:35e:30bc:96e2 with SMTP id 98e67ed59e1d1-361403f1901mr17724201a91.10.1776763547742;
        Tue, 21 Apr 2026 02:25:47 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff39csm131965105ad.4.2026.04.21.02.25.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Apr 2026 02:25:47 -0700 (PDT)
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
Subject: [PATCH 4/7] riscv: hugetlb: switch NAPOT mappings to raw PTE helpers
Date: Tue, 21 Apr 2026 17:24:54 +0800
Message-Id: <20260421092457.37649-5-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260421092457.37649-1-cuiyunhui@bytedance.com>
References: <20260421092457.37649-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_022548_885524_B337D277 
X-CRM114-Status: GOOD (  10.30  )
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

Use raw PTE helpers in hugetlb code to operate directly on the
underlying PTE entries. This lets hugetlb manage NAPOT
folding/unfolding explicitly instead of going through Svnapot-aware
public wrappers.

Add explicit NAPOT unfolding in set_huge_pte_at() before replacing an
existing NAPOT mapping with non-NAPOT entries.

No functional change intended.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/hugetlbpage.c | 55 +++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index a6d217112cf46..65a89b4fdad8b 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -7,7 +7,7 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	unsigned long pte_num;
 	int i;
-	pte_t orig_pte = ptep_get(ptep);
+	pte_t orig_pte = __ptep_get(ptep);
 
 	if (!pte_present(orig_pte) || !pte_napot(orig_pte))
 		return orig_pte;
@@ -15,7 +15,7 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 	pte_num = napot_pte_num(napot_cont_order(orig_pte));
 
 	for (i = 0; i < pte_num; i++, ptep++) {
-		pte_t pte = ptep_get(ptep);
+		pte_t pte = __ptep_get(ptep);
 
 		if (pte_dirty(pte))
 			orig_pte = pte_mkdirty(orig_pte);
@@ -74,7 +74,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
 
 out:
 	if (pte) {
-		pte_t pteval = ptep_get_lockless(pte);
+		pte_t pteval = __ptep_get_lockless(pte);
 
 		WARN_ON_ONCE(pte_present(pteval) && !pte_huge(pteval));
 	}
@@ -153,12 +153,12 @@ static pte_t get_clear_contig(struct mm_struct *mm,
 	pte_t pte, tmp_pte;
 	bool present;
 
-	pte = ptep_get_and_clear(mm, addr, ptep);
+	pte = __ptep_get_and_clear(mm, addr, ptep);
 	present = pte_present(pte);
 	while (--ncontig) {
 		ptep++;
 		addr += PAGE_SIZE;
-		tmp_pte = ptep_get_and_clear(mm, addr, ptep);
+		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
 		if (present) {
 			if (pte_dirty(tmp_pte))
 				pte = pte_mkdirty(pte);
@@ -210,7 +210,7 @@ static void clear_flush(struct mm_struct *mm,
 	unsigned long i, saddr = addr;
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		ptep_get_and_clear(mm, addr, ptep);
+		__ptep_get_and_clear(mm, addr, ptep);
 
 	flush_tlb_range(&vma, saddr, addr);
 }
@@ -250,25 +250,40 @@ void set_huge_pte_at(struct mm_struct *mm,
 		     unsigned long sz)
 {
 	size_t pgsize;
+	pte_t orig_pte;
+	pte_t pteval;
 	int i, pte_num;
 
 	pte_num = num_contig_ptes_from_size(sz, &pgsize);
 
 	if (!pte_present(pte)) {
-		for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
-			set_ptes(mm, addr, ptep, pte, 1);
+		for (i = 0; i < pte_num; i++, ptep++, addr += pgsize) {
+			pteval = pte_mknonnapot(pte, addr);
+			orig_pte = __ptep_get(ptep);
+
+			if (pte_present_napot(orig_pte))
+				__napotpte_try_unfold(mm, addr, ptep, orig_pte);
+
+			__set_ptes(mm, addr, ptep, pteval, 1);
+		}
 		return;
 	}
 
 	if (!pte_napot(pte)) {
-		set_ptes(mm, addr, ptep, pte, 1);
+		pteval = pte_mknonnapot(pte, addr);
+		orig_pte = __ptep_get(ptep);
+
+		if (pte_present_napot(orig_pte))
+			__napotpte_try_unfold(mm, addr, ptep, orig_pte);
+
+		__set_ptes(mm, addr, ptep, pteval, 1);
 		return;
 	}
 
 	clear_flush(mm, addr, ptep, pgsize, pte_num);
 
 	for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
-		set_pte_at(mm, addr, ptep, pte);
+		__set_ptes(mm, addr, ptep, pte, 1);
 }
 
 int huge_ptep_set_access_flags(struct vm_area_struct *vma,
@@ -283,7 +298,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	int i, pte_num;
 
 	if (!pte_napot(pte))
-		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
+		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
@@ -307,11 +322,11 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      pte_t *ptep, unsigned long sz)
 {
 	size_t pgsize;
-	pte_t orig_pte = ptep_get(ptep);
+	pte_t orig_pte = __ptep_get(ptep);
 	int pte_num;
 
 	if (!pte_napot(orig_pte))
-		return ptep_get_and_clear(mm, addr, ptep);
+		return __ptep_get_and_clear(mm, addr, ptep);
 
 	pte_num = num_contig_ptes_from_size(sz, &pgsize);
 
@@ -322,13 +337,13 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr,
 			     pte_t *ptep)
 {
-	pte_t pte = ptep_get(ptep);
+	pte_t pte = __ptep_get(ptep);
 	unsigned long order;
 	pte_t orig_pte;
 	int i, pte_num;
 
 	if (!pte_napot(pte)) {
-		ptep_set_wrprotect(mm, addr, ptep);
+		__ptep_set_wrprotect(mm, addr, ptep);
 		return;
 	}
 
@@ -347,11 +362,11 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr,
 			    pte_t *ptep)
 {
-	pte_t pte = ptep_get(ptep);
+	pte_t pte = __ptep_get(ptep);
 	int pte_num;
 
 	if (!pte_napot(pte))
-		return ptep_clear_flush(vma, addr, ptep);
+		return __ptep_clear_flush(vma, addr, ptep);
 
 	pte_num = napot_pte_num(napot_cont_order(pte));
 
@@ -364,18 +379,18 @@ void huge_pte_clear(struct mm_struct *mm,
 		    unsigned long sz)
 {
 	size_t pgsize;
-	pte_t pte = ptep_get(ptep);
+	pte_t pte = __ptep_get(ptep);
 	int i, pte_num;
 
 	if (!pte_napot(pte)) {
-		pte_clear(mm, addr, ptep);
+		__pte_clear(mm, addr, ptep);
 		return;
 	}
 
 	pte_num = num_contig_ptes_from_size(sz, &pgsize);
 
 	for (i = 0; i < pte_num; i++, addr += pgsize, ptep++)
-		pte_clear(mm, addr, ptep);
+		__pte_clear(mm, addr, ptep);
 }
 
 static bool is_napot_size(unsigned long size)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
