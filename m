Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFE0CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lyu/Nt8bi32VtX6dOiLsS6CzB+f8JoL62bm93emLzYw=; b=RyLOl0Z/r1IKbN
	sbakCFpb7Pmti4O3tARiU3JWN35xStrcNumaU/5VP7xYznx6SBXUMExkJw/tQSceRJ8Q5pmWcm1F9
	F3re+O+ge12bSkJ83QC6uedLk6WZsuLxEO+FAH8jSLeGBWuGZcZtQIWC/tgdyGGBIzQVzbtObE0aT
	BiHTA8k+G8OPDrWRFq4xxioXjfM6lpnifTe5g2jaW31Qva81XmtvscDSPyKQ4vTApDmy5SKvQyDKH
	cEA7MxipgL5xPKAvKcACPRO2my07pLcyMSEvYiDUva21rpFroeu71r2lbuhTauOT1qeoC42c0dnZF
	Alr1AAeUnfONAiRi4Piw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fve-00000004zA2-1m7Y;
	Thu, 09 Oct 2025 01:58:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvc-00000004z89-03AR
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-27d3540a43fso4217035ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975127; x=1760579927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lp2v9w2qTrkESoVDLPmv+GpD3nzqMphlK45S5OJoAnI=;
        b=maYGxEoz66tc5V1yvjYCauOrgFfQlUnIFj7UdN5RQGL4ZAiWNHbqtr9WsHoXuE38M5
         XHVCAuDCGXj9XE4DC+i5IGdmJZdCFZGWyAh9kaCdw+UyEM3y7BQMSIMhXD1h7dHA1qnK
         BHzmgmhfsfXQCQnHfSg868VYU7wV2O6s1Ctod5emQTOU/p2pL4W8yrBKolu7B0HE2c5J
         7ROv21BePq0WUE8kq2mUhtLfTJtdeuK30XVF3z8EbQZeMS45cFf2PAdFLTWsoPTsCSU1
         9HCtKSn/ZCwwx3E0dRu9PaDrOYl8m2oKIaOgf9sQuRbhLju6Xf1NIpfy0+T2eic6r9YB
         79Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975127; x=1760579927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lp2v9w2qTrkESoVDLPmv+GpD3nzqMphlK45S5OJoAnI=;
        b=l5x0TKupOu3B+f7418y4AnurOeFPRAhgHqC+7+LlYRSWqLs5lN5lrEqwAMuaOGWssW
         TQxT8b/n+qw7CoibGkroi9HqNn/PJbq12IAppqZ78LpzMl+b19V5b3sk2zBTCNTN56y2
         HdRGbRXL/h3czpM8PDDUyHPRlaOzfpD6xVWyvdPBESqVekeJJkH/KbWFIR3dAXCnXmbW
         6A8QmmUQ1IeaQICT/j6OqN0n4k0NRoZ8R5wmtMykSQMldooKopXZbYTTaZT7QYatO0+S
         Kng0GYRvrqb3VWum0ciI7RVhar09izYue/WKTeCtV42mYWdF0TBeVK9Yewi1Ls/Brxez
         V7gA==
X-Forwarded-Encrypted: i=1; AJvYcCWRyzAQIKTtVZG/EWTgesnwLuw7VxaaKxOHE2nQFk0njq8vcSX9mMgbZEprV05e14/nF9YYr9auI6Bfjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YydtsF1GndpvHi0JG0tAM7ZdZO3AxXWKOpCc+w3NMkswZGpIHBY
	+tZiaXYqOWC7NC3TL+VpSJINcDCXSOz/H7nnvqQ6RM8uoedhXTQzfpFkPJParhTNbFM=
X-Gm-Gg: ASbGncu9Qz1Dgsdte9fBkvoeJnSATkvDxiU9HI3nKNesm2adrU3MV/YUh9jvFNVSDJF
	5XkTIW62f0/oMzKN6J66RWFVMNuF2PcRDGEYIi42VU7HCsinRK3fTkwNUMpmI3oefKswLp41cBx
	J9UJ7vSSDKDn1+1nIGBANPU4yZ3rtfIwBWnfdvFIYigf2d/PrmRyX+IJWOyG/GkLHNSyS4w3EkL
	vMR76KPIfReVzBr9lHYtrcnQ9Is0IZZ7b1v8hFl/lVbRDC+O9oO8SBZ+wsyHqIALb7RhGlQsdmp
	84mFefE2ylHDpfrb1UxTYI4x+VVyPI0+0yLCos1bDuA4/I05o9wCTZeNW2zUT0Y29+6xdsLcEYP
	3HOaHJN7Z0hF6/yZCoN7lVmGxShllEi04XcrbwTMCJCYhZ96rIpUFsVu6v7T4CwYzSvHNZ3S3Wl
	MdsLs=
X-Google-Smtp-Source: AGHT+IE+agqXEhLEONLyA5d2qyFrvAw1S+1pygAwMmWTwUwpcKU01+ZnN2Cp743AX1wJ7euQQmxe/A==
X-Received: by 2002:a17:903:2292:b0:24c:bc02:788b with SMTP id d9443c01a7336-290272e3debmr85255285ad.44.1759975127215;
        Wed, 08 Oct 2025 18:58:47 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:46 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 05/18] mm: Allow page table accessors to be non-idempotent
Date: Wed,  8 Oct 2025 18:57:41 -0700
Message-ID: <20251009015839.3460231-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185848_058696_AD7C8184 
X-CRM114-Status: GOOD (  17.53  )
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

Currently, some functions such as pte_offset_map() are passed both
pointers to hardware page tables, and pointers to previously-read PMD
entries on the stack. To ensure correctness in the first case, these
functions must use the page table accessor function (pmdp_get()) to
dereference the supplied pointer. However, this means pmdp_get() is
called twice in the second case. This double call must be avoided if
pmdp_get() applies some non-idempotent transformation to the value.

Avoid the double transformation by calling set_pmd() on the stack
variables where necessary to keep set_pmd()/pmdp_get() calls balanced.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 kernel/events/core.c  | 2 ++
 mm/gup.c              | 3 +++
 mm/khugepaged.c       | 6 ++++--
 mm/page_table_check.c | 3 +++
 mm/pgtable-generic.c  | 2 ++
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 952ba4e3d8815..d75be3d9e0405 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8142,6 +8142,8 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 	if (pmd_leaf(pmd))
 		return pmd_leaf_size(pmd);
 
+	/* transform pmd as if &pmd pointed to a hardware page table */
+	set_pmd(&pmd, pmd);
 	ptep = pte_offset_map(&pmd, addr);
 	if (!ptep)
 		goto again;
diff --git a/mm/gup.c b/mm/gup.c
index f5676a3aa525d..34d1b59bd59c1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2865,7 +2865,10 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 	int ret = 0;
 	pte_t *ptep, *ptem;
 
+	/* transform pmd as if &pmd pointed to a hardware page table */
+	set_pmd(&pmd, pmd);
 	ptem = ptep = pte_offset_map(&pmd, addr);
+	pmd = pmdp_get(&pmd);
 	if (!ptep)
 		return 0;
 	do {
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index acc620158696e..d8c22ef8406bd 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1731,7 +1731,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 		struct mmu_notifier_range range;
 		struct mm_struct *mm;
 		unsigned long addr;
-		pmd_t *pmd, pgt_pmd;
+		pmd_t *pmd, pgt_pmd, pmdval;
 		spinlock_t *pml;
 		spinlock_t *ptl;
 		bool success = false;
@@ -1784,7 +1784,9 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 		 */
 		if (check_pmd_state(pmd) != SCAN_SUCCEED)
 			goto drop_pml;
-		ptl = pte_lockptr(mm, pmd);
+		/* pte_lockptr() needs a value, not a pointer to a page table */
+		pmdval = pmdp_get(pmd);
+		ptl = pte_lockptr(mm, &pmdval);
 		if (ptl != pml)
 			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 31f4c39d20ef9..77d6688db0de9 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -260,7 +260,10 @@ void __page_table_check_pte_clear_range(struct mm_struct *mm,
 		return;
 
 	if (!pmd_bad(pmd) && !pmd_leaf(pmd)) {
+		/* transform pmd as if &pmd pointed to a hardware page table */
+		set_pmd(&pmd, pmd);
 		pte_t *ptep = pte_offset_map(&pmd, addr);
+		pmd = pmdp_get(&pmd);
 		unsigned long i;
 
 		if (WARN_ON(!ptep))
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 63a573306bfa2..6602deb002f10 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -299,6 +299,8 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 		pmd_clear_bad(pmd);
 		goto nomap;
 	}
+	/* transform pmdval as if &pmdval pointed to a hardware page table */
+	set_pmd(&pmdval, pmdval);
 	return __pte_map(&pmdval, addr);
 nomap:
 	rcu_read_unlock();
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
