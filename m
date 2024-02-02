Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F543C4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 12:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M5Qyhw/0Nt/Ly6s96B5373DfnL67xQpoHXblKmGRnkA=; b=sPwydrwX42N/J5
	zDO8bCHslP+Fg8K2HwxvftcGv9Nu4FkcobAHgYchpWQeDMlZ7EeygQqK0PXecCkSBA3vEcXYpNQYD
	jndpH5mUFDcN7sQtwyilGaUyPVLFIdMiTMzTY/L2KYzhNLRy9z1xiE6jj67SYI6vKkzYPKDx2PMgO
	aW/Kna89XB2m+BSBu0rpo56X325LmsFWDK5Bv5uB24hR8gJTXvE9swPNCCw+8rsJxPC9GaJFnVGqb
	9LRi654CTji/9nvPtqtxzUXCiv2bxlMHE1VXo9ezt8xW0njkvxcHGV2AfnbYowv8VAlD1yQLGF79G
	cls9GrnwBinemY2DQqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVswx-0000000BWHJ-0nRo;
	Fri, 02 Feb 2024 12:47:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVswt-0000000BWGo-30zI
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 12:47:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40ef6bbb61fso17216405e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 04:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706878032; x=1707482832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PfkivfnJ5u+aO1iLj8a/ny9nA+pVGD6k9UGnv2RP5H0=;
        b=mQ6GnRftnOWKg83Yo66l/XU4x8C0S5uNqbQTTbesWyT9dMRpC0blQ150ZaAkXnldjy
         o2tZwAaV1CJauG6JWBkwayjHvKxPHT+Pem4ZQz+V+DJbvwLuhhFseZkpMYLH4VhgplUh
         lOL46c/eviicI9HqYmdS1zynMEES3iOz+ASLDQ3ZjXjm/fLHDIZhqB/DO6sFCVEN2QqN
         75+6MeBwmsvbGJgmi836vcrgPIgevBtSpOOcLc/fORgBepSqj5gsH2/RoUGUFzNe2PY2
         9opYvr4tozFLHnkF3clKVV7vrOSpGfjJHic17p7kz+ZyASge52x52M83twplnqaxN1+L
         +TWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706878032; x=1707482832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfkivfnJ5u+aO1iLj8a/ny9nA+pVGD6k9UGnv2RP5H0=;
        b=IxXhH+gOqwWzTPh8pYCz9KWKiU1njNjHYzgf1QYY53gudEk3F/5h8a/aSHOXQhBzcl
         cp8smdeyVSBkAxrarHAxsnIhwmr6IHvvav6GkzIljhlotEGTKTwMLeHRz2NtXMr6SDFh
         CXMpQz8bG/9scpO+7JGt9T+zaJvELhWu4o85poXhe9pzsOpXNnrONBWiwU+2LpUF2ndE
         zjWD3qJXNO3je6DlhUyrHYz0Ufr6Yp6EFfmHjiGE3aabx8TCLYSaj1qUBmwGq73nqguf
         M2Ck/mlcqCm+a9UUxbVdKRx3saxsYJ4w19ry48lbTFLb1RxtDkD2S6vNKvYVBNPHJcH9
         OL9A==
X-Gm-Message-State: AOJu0YxAWlrm4cUnyp0bvFaXNjp2xbFZ5YUMCoHIrTPSKXaMdwy52Rk2
	MuTxEsigppTt+0mezhyDHO5EGPf0oXEXEyDZSZwqym8t7jI51hE3UY67MKiyyuc=
X-Google-Smtp-Source: AGHT+IGW7mLQd+I8OpKoYp3aw/Sq6pSMDtp0mSYKqVsXNS+hXaqH5gCV8Bfi6HvhJmWBkTXlW10rgQ==
X-Received: by 2002:a05:600c:4709:b0:40e:f9d4:2b03 with SMTP id v9-20020a05600c470900b0040ef9d42b03mr1507552wmo.12.1706878032498;
        Fri, 02 Feb 2024 04:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU6QBdzXJgulKyw/8w7uhhABXlGq1XlbpEYQ1YsvEknY9QlWOelrc3MMu7wxmrw5jQIdNgQYL7vvq00ZdPh9le5UmJb7Z6F67esOXsiUhwwScAWy5wDxmsyVBuNd3/mEutbhFb6oOObAjzHlfjiTJX4brze8D/acKS+ud7tC8z23okCerwSGDPgC6H9G+9Go14oHVrPatJBaw==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c228d00b0040fb0c90da6sm7215696wmf.14.2024.02.02.04.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 04:47:12 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Only flush the mm icache when setting an exec pte
Date: Fri,  2 Feb 2024 13:47:11 +0100
Message-Id: <20240202124711.256146-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_044716_022590_5358FE5C 
X-CRM114-Status: GOOD (  13.50  )
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

We used to emit a flush_icache_all() whenever a dirty executable
mapping is set in the page table but we can instead call
flush_icache_mm() which will only send IPIs to cores that currently run
this mm and add a deferred icache flush to the others.

The number of calls to sbi_remote_fence_i() (tested without IPI
support):

With a simple buildroot rootfs:
* Before: ~5k
* After :  4 (!)

Tested on HW, the boot to login is ~4.5% faster.

With an ubuntu rootfs:
* Before: ~24k
* After : ~13k

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 14 +++++++-------
 arch/riscv/mm/cacheflush.c       |  4 ++--
 arch/riscv/mm/pgtable.c          |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0c94260b5d0c..058cfa89dd29 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -513,12 +513,12 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
 	WRITE_ONCE(*ptep, pteval);
 }
 
-void flush_icache_pte(pte_t pte);
+void flush_icache_pte(struct mm_struct *mm, pte_t pte);
 
-static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
+static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 {
 	if (pte_present(pteval) && pte_exec(pteval))
-		flush_icache_pte(pteval);
+		flush_icache_pte(mm, pteval);
 
 	set_pte(ptep, pteval);
 }
@@ -529,7 +529,7 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 	page_table_check_ptes_set(mm, ptep, pteval, nr);
 
 	for (;;) {
-		__set_pte_at(ptep, pteval);
+		__set_pte_at(mm, ptep, pteval);
 		if (--nr == 0)
 			break;
 		ptep++;
@@ -541,7 +541,7 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 static inline void pte_clear(struct mm_struct *mm,
 	unsigned long addr, pte_t *ptep)
 {
-	__set_pte_at(ptep, __pte(0));
+	__set_pte_at(mm, ptep, __pte(0));
 }
 
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS	/* defined in mm/pgtable.c */
@@ -707,14 +707,14 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 				pmd_t *pmdp, pmd_t pmd)
 {
 	page_table_check_pmd_set(mm, pmdp, pmd);
-	return __set_pte_at((pte_t *)pmdp, pmd_pte(pmd));
+	return __set_pte_at(mm, (pte_t *)pmdp, pmd_pte(pmd));
 }
 
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 				pud_t *pudp, pud_t pud)
 {
 	page_table_check_pud_set(mm, pudp, pud);
-	return __set_pte_at((pte_t *)pudp, pud_pte(pud));
+	return __set_pte_at(mm, (pte_t *)pudp, pud_pte(pud));
 }
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index b0774993c0f3..3e234e95d952 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -85,12 +85,12 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_MMU
-void flush_icache_pte(pte_t pte)
+void flush_icache_pte(struct mm_struct *mm, pte_t pte)
 {
 	struct folio *folio = page_folio(pte_page(pte));
 
 	if (!test_bit(PG_dcache_clean, &folio->flags)) {
-		flush_icache_all();
+		flush_icache_mm(mm, false);
 		set_bit(PG_dcache_clean, &folio->flags);
 	}
 }
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index ef887efcb679..533ec9055fa0 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -10,7 +10,7 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 			  pte_t entry, int dirty)
 {
 	if (!pte_same(ptep_get(ptep), entry))
-		__set_pte_at(ptep, entry);
+		__set_pte_at(vma->vm_mm, ptep, entry);
 	/*
 	 * update_mmu_cache will unconditionally execute, handling both
 	 * the case that the PTE changed and the spurious fault case.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
