Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B9E6F095
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RnnErcCvFfaL7Il2q0YaNvO3NK/3jjPgIk70WQUfFE=; b=oW+dGP7QApYsyg
	MEW4+dcJTOCqZOoamuhDXCInIaAacrfEJqd+yTVGIkNyK8HBex5AzppJWGZNEQmhqJRlfIWRN0m14
	kQPIw62WLjUNuNHwE7AMa4b8epC8Zv5T5e/JFCpsq/19RrE8AoiatMbBpLgQFogDAoL+Z9ouRuIY3
	lgNZD2Tv57GMUjk/Y7KKZdFgKnmfvi8BfIFPy35fZ4f9YMVSDtrvxGSd+4RjsjBsVMwRlRRMx2bFe
	AGM5+1l9o+hzQIsSRyVIugc2ffXdLIlmZnUpDcr7hWVd/PfHJceeU4T72jYrJP4lKYRq8qXBXQGz4
	SPD5LaUU9ywN+3vko4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hH-00000008a0E-1BH4;
	Sat, 02 Nov 2024 00:08:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hB-00000008Zx9-40Q0
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:08:51 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e2b9480617so1934929a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730506129; x=1731110929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lekxDnwARtrYdlJ1Ne7TEw2fH4iE05/E7poMDP757sA=;
        b=NmQ0Az5SDWx8xtrodxvud8+HKjbDIf1KbXZoaIAqanZushIZKvAOHdm9XV2aBWTgNq
         Jlaep2xM7vi5VOL7GJLng43Sb7b1EfvuFwXgsHpvi1o9KcsnPH8J+CKxbkK7YJBP1Zgq
         uCRGnt5+Cb2nh3zZp4TlAkDJDsCP5D93v+HEnNTv0Ty8FhwuWBuUt7yqaJEXNoOj8cT7
         2OFox/k4FTmyIwezTgzdsOJl1FTV1WJriuBH/iWc9BylnCVdsi2eVjL39YX9CGbEe80/
         KdrOF3AE7yrCrU2ra0zWNqzwGH7Tbzonlr72dG+R8vaoqDRtNF7yhhcqsUcdOAJrky0c
         C4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506129; x=1731110929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lekxDnwARtrYdlJ1Ne7TEw2fH4iE05/E7poMDP757sA=;
        b=bXKWC9eNhFlTelOO6nUJJALL8PoXX13JK1UYzKjwHaEVnMA13KGKkGy/ZI6euWMia4
         MT/vRvk5DNh882BrQWg/Z1Tb4pBUyRbPpWKhGy6nh0xUXanWGd2atYC+Hj6gbLbZrSZv
         0lK7AzO4oul3HAlOQ9HDKQ83RYWPticGhwEa5OVWBovjy1GKP5dNxTEmFFHc2Yj9YyPR
         /qhnUqBXTpNssIg8FzM25Y95wMrp8VLWhnCibgy98GHSZcHeVEkOCXkoGACJ9X9OFk5D
         yXbvk6RjyNqGa1sj2QNiYaiE3rEXKizLF1Drj2KoPcgA3E28e6WQ0plNGWVz1zBHUPmP
         sQow==
X-Forwarded-Encrypted: i=1; AJvYcCWnWzFKp+Y5u22CoyKdQSX8uSsFoYgQz513oMbcj4sKOuMetFSexKQiWozgnl6mZT74wP0U2Na4o9z2qA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJx05ubFmVmAUrVcx7juju5t1wrBxEzKyWOAlMcr0Bv1wj2iAA
	66MGlPmPmccO4Z58OW1bq38lSawk8w6RdGWHxgzWV6ggkwGQNviloheff1t3vK4=
X-Google-Smtp-Source: AGHT+IFIFmJ6HbS9Ca94WbQx+pPA5itCw4zhwiKe4XcgzfhIEgH9OEfG0R25JvEsk6agnHfgYMkYmA==
X-Received: by 2002:a17:90b:53c3:b0:2e2:d859:1603 with SMTP id 98e67ed59e1d1-2e93c1d39b0mr11018955a91.25.1730506128809;
        Fri, 01 Nov 2024 17:08:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc00856sm5505749a91.54.2024.11.01.17.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:08:48 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 02/11] riscv: mm: Increment PFN in place when splitting mappings
Date: Fri,  1 Nov 2024 17:07:56 -0700
Message-ID: <20241102000843.1301099-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241102000843.1301099-1-samuel.holland@sifive.com>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_170850_018858_1A225098 
X-CRM114-Status: GOOD (  12.22  )
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

The current code separates page table entry values into a PFN and a
pgprot_t before incrementing the PFN and combining the two parts using
pfn_pXX(). On some hardware with custom page table formats or memory
aliases, the pfn_pXX() functions need to transform the PTE value, so
these functions would need to apply the opposite transformation when
breaking apart the PTE value.

However, both transformations can be avoided by incrementing the PFN in
place, as done by pte_advance_pfn() and set_ptes().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/mm/pageattr.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 271d01a5ba4d..335060adc1a6 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -109,9 +109,8 @@ static int __split_linear_mapping_pmd(pud_t *pudp,
 			continue;
 
 		if (pmd_leaf(pmdp_get(pmdp))) {
+			pte_t pte = pmd_pte(pmdp_get(pmdp));
 			struct page *pte_page;
-			unsigned long pfn = _pmd_pfn(pmdp_get(pmdp));
-			pgprot_t prot = __pgprot(pmd_val(pmdp_get(pmdp)) & ~_PAGE_PFN_MASK);
 			pte_t *ptep_new;
 			int i;
 
@@ -121,7 +120,7 @@ static int __split_linear_mapping_pmd(pud_t *pudp,
 
 			ptep_new = (pte_t *)page_address(pte_page);
 			for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep_new)
-				set_pte(ptep_new, pfn_pte(pfn + i, prot));
+				set_pte(ptep_new, pte_advance_pfn(pte, i));
 
 			smp_wmb();
 
@@ -149,9 +148,8 @@ static int __split_linear_mapping_pud(p4d_t *p4dp,
 			continue;
 
 		if (pud_leaf(pudp_get(pudp))) {
+			pmd_t pmd = __pmd(pud_val(pudp_get(pudp)));
 			struct page *pmd_page;
-			unsigned long pfn = _pud_pfn(pudp_get(pudp));
-			pgprot_t prot = __pgprot(pud_val(pudp_get(pudp)) & ~_PAGE_PFN_MASK);
 			pmd_t *pmdp_new;
 			int i;
 
@@ -162,7 +160,8 @@ static int __split_linear_mapping_pud(p4d_t *p4dp,
 			pmdp_new = (pmd_t *)page_address(pmd_page);
 			for (i = 0; i < PTRS_PER_PMD; ++i, ++pmdp_new)
 				set_pmd(pmdp_new,
-					pfn_pmd(pfn + ((i * PMD_SIZE) >> PAGE_SHIFT), prot));
+					__pmd(pmd_val(pmd) +
+					      (i << (PMD_SHIFT - PAGE_SHIFT + PFN_PTE_SHIFT))));
 
 			smp_wmb();
 
@@ -198,9 +197,8 @@ static int __split_linear_mapping_p4d(pgd_t *pgdp,
 			continue;
 
 		if (p4d_leaf(p4dp_get(p4dp))) {
+			pud_t pud = __pud(p4d_val(p4dp_get(p4dp)));
 			struct page *pud_page;
-			unsigned long pfn = _p4d_pfn(p4dp_get(p4dp));
-			pgprot_t prot = __pgprot(p4d_val(p4dp_get(p4dp)) & ~_PAGE_PFN_MASK);
 			pud_t *pudp_new;
 			int i;
 
@@ -215,7 +213,8 @@ static int __split_linear_mapping_p4d(pgd_t *pgdp,
 			pudp_new = (pud_t *)page_address(pud_page);
 			for (i = 0; i < PTRS_PER_PUD; ++i, ++pudp_new)
 				set_pud(pudp_new,
-					pfn_pud(pfn + ((i * PUD_SIZE) >> PAGE_SHIFT), prot));
+					__pud(pud_val(pud) +
+					      (i << (PUD_SHIFT - PAGE_SHIFT + PFN_PTE_SHIFT))));
 
 			/*
 			 * Make sure the pud filling is not reordered with the
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
