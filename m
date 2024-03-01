Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1C3C54E41
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jD+LE0xiMKSN+Qb5NXKvB8oZtS4R3pwJUCrOxuZTuNo=; b=GrKHPNSIk26djO
	bGyukkK3rc5Ut/mPM2FuSoGIj92ex1QKO4wUEd+DK1bTEcsKHqOBs/oCAkaLhrBZGgQH0A0jX+cYq
	UhS3Bgapo8T4WuT9gDC5PNaqr+o1od9GTuqvWp67Utu3FL2aveUFq82cmqa5NZ0B7TxM8XHaePzzD
	LC8Mmdub8hSmKrL/LJ0D0wXEsHM1zDcOJ6quCu99BJFoR0388+aBnzyjhJjzWL3JJ6xb6kQ037pqG
	zkCn5De6SBWopserfSy0nDteZKyHcRR0oDnghgRoSQiRBun1mbTILDdLUmmr6e3Rohchdhk63c7I6
	aKyZhJz/jmsczk+mP0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz70-0000000H8Qf-2OT8;
	Fri, 01 Mar 2024 09:23:26 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz6w-0000000H8NZ-0nLj
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:23:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d23d301452so19636881fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 01:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709285000; x=1709889800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Bwm42ASg+Pn4jchqsA5u8tprYh0PuExgujdSk24Zd8=;
        b=cXT22CyG/d8SqYLbha2zxQpDcO5gf7kppO4zPTcN5pfPB+lr0KUtXU5gOPPICVmdmz
         Kv1bHfhLhX7W1wW0FerSMd6H7QlZjAheMMbMmt3m5wdANMCYHhFm4SmwJ1Rp29hbWigG
         E6xSMrxzralVeI12KRBHH5Tn1Jf/mr5qod01N4d4Prlz7Z+Vq0D32U/6o/5xyQvAySCE
         fZ3Rhhj/c5jJ1VHdyCV0hRMsp87AAyeUe+CJNP/fI4C0SoctWRnHNe+8kTQ/hYyuVd60
         2tIypuEqUoNL/dU376DJ3C3uxh0ml/6eeEkK4xQqe65Z5zNkhaS4VLCxfhDZjKuZ1Z1w
         WavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709285000; x=1709889800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Bwm42ASg+Pn4jchqsA5u8tprYh0PuExgujdSk24Zd8=;
        b=JKmCyelmiZTheGuptb3vtqaORBf74Fp3dHSguk87MhqBTE2+w9eZvuOCTVLBUqwNNY
         myyJAQD133Vbp3sf0vKTb0gmbwp83j7QIoqH8TS9JdmQqXsSE/JrMZ8uYej/nz28pOx1
         tADammnTM+uHtTpb4TxMoQbpvNn17KPyLfplLUnE64J6e1Oh3gIHTwvdeTGEgjev9hZ4
         FkmBBSUGPFoqz+0haGhWtFYSMnK0C2kBGKJT5eQeLCzxlrMMmg3/LNxcKaDgX8q7niL3
         rRs7Q2VjE9knQvrMQAnJNqB/l9UYFPAylkum56cgQXkEEnd6HIxCt0O99vdLR6X4DGy3
         UUjw==
X-Forwarded-Encrypted: i=1; AJvYcCVys7JoMMyX67JJcfjtIAf3xrFbTP9iATjz+/165ks4aAfX9NNfSaJFV3KzHwLHORJtwcWWyyQzZ9/3bhwsBbX3S22C938WlOoEAKm2YHmf
X-Gm-Message-State: AOJu0YyE4X/wvj1CZE3HcMPiE67cxHK5oAQLjipsKZrMC7cFIXIbJhn2
	cVU+oJDteTCSO7o/+coYRzrEWm+EUj6GToCDzmIuiq1edMTCRGripkbqnCU9tkU=
X-Google-Smtp-Source: AGHT+IFkOrueHwu+dCituNGudpmJQSWFJOG3RRqM9+lTLTigiW3MgJH56JMq1RpUEmcE9Sa98B2xOQ==
X-Received: by 2002:a2e:a4cb:0:b0:2d3:365e:9d02 with SMTP id p11-20020a2ea4cb000000b002d3365e9d02mr635537ljm.28.1709285000535;
        Fri, 01 Mar 2024 01:23:20 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l33-20020a05600c1d2100b00412ca88537dsm374810wms.0.2024.03.01.01.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:23:20 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 8/9] mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
Date: Fri,  1 Mar 2024 10:14:54 +0100
Message-Id: <20240301091455.246686-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240301091455.246686-1-alexghiti@rivosinc.com>
References: <20240301091455.246686-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_012322_276242_6813F84E 
X-CRM114-Status: GOOD (  11.41  )
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

After some adjustments, both architectures have the same implementation
so move it to the generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/mm/hugetlbpage.c | 27 ---------------------------
 arch/riscv/mm/hugetlbpage.c | 22 ----------------------
 mm/contpte.c                | 21 +++++++++++++++++++++
 3 files changed, 21 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index b8abbd5ace4f..d6ddaf282a94 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -284,33 +284,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_ptep_set_wrprotect(struct mm_struct *mm,
-			     unsigned long addr, pte_t *ptep)
-{
-	unsigned long pfn, dpfn;
-	pgprot_t hugeprot;
-	int ncontig, i;
-	size_t pgsize;
-	pte_t pte;
-
-	if (!pte_cont(READ_ONCE(*ptep))) {
-		ptep_set_wrprotect(mm, addr, ptep);
-		return;
-	}
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	dpfn = pgsize >> PAGE_SHIFT;
-
-	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
-	pte = pte_wrprotect(pte);
-
-	hugeprot = pte_pgprot(pte);
-	pfn = pte_pfn(pte);
-
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		set_pte_at(mm, addr, ptep, pfn_pte(pfn, hugeprot));
-}
-
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index fdb633844d4b..e6cbb6fb2904 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -173,28 +173,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_ptep_set_wrprotect(struct mm_struct *mm,
-			     unsigned long addr,
-			     pte_t *ptep)
-{
-	pte_t pte = ptep_get(ptep);
-	size_t pgsize;
-	pte_t orig_pte;
-	int pte_num;
-
-	if (!pte_napot(pte)) {
-		ptep_set_wrprotect(mm, addr, ptep);
-		return;
-	}
-
-	pte_num = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
-
-	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
-	orig_pte = pte_wrprotect(orig_pte);
-
-	set_ptes(mm, addr, ptep, orig_pte, pte_num);
-}
-
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr,
 			    pte_t *ptep)
diff --git a/mm/contpte.c b/mm/contpte.c
index 3b65c49c6d4b..f7f26d2cfa23 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -22,6 +22,7 @@
  * huge_pte_clear()
  * huge_ptep_get_and_clear()
  * huge_ptep_set_access_flags()
+ * huge_ptep_set_wrprotect()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -230,3 +231,23 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
 	return 1;
 }
+
+void huge_ptep_set_wrprotect(struct mm_struct *mm,
+			     unsigned long addr, pte_t *ptep)
+{
+	int ncontig;
+	size_t pgsize;
+	pte_t pte;
+
+	if (!pte_cont(ptep_get(ptep))) {
+		ptep_set_wrprotect(mm, addr, ptep);
+		return;
+	}
+
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
+
+	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
+	pte = pte_wrprotect(pte);
+
+	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
