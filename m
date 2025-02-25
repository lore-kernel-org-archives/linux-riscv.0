Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD87C021B2
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 03:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne203QC5xgse46zRwjxBj10Gtb5A1/ASQhF8i3AkDCw=; b=zxZRi07LPPQIOV
	5/AGE41ryMX1iEaCNhasEjUTinW9iy4DtQ6BXS4H+n+bstW4+t+mhOuiBZ1+aufAdcUmzJAQVR8dF
	rIQNSCvUxljGbIJAyo4+OMP/zuSh++mcOEjlK/789Mb0SEGCJPsns82eIbJI40z4l3gQoVzUPqNnX
	rDOj3I0AMM7hGn5KZ9Aaj7Emprqclnj9BOQcas10NmPyTAqAbo5HyvIE6GpTSDSNDkTU3qKZS9KBp
	AbMhK9uSC2GKMGBYO41nOpNruHRu03VBnxCcp4ayIs4st4l1ZHflrX5LrJW78lFtfGgbiN+EwV6zD
	puJQm+vyhOhFXkv9ujhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmluH-0000000Ftex-0Bu6;
	Tue, 25 Feb 2025 03:46:53 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmluD-0000000Ftbw-3Q6R
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 03:46:51 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so8263344a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 19:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455209; x=1741060009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WhvhnqTOqnsJRoRSYGkE7Nvf8aJcMBRIuvNZLKTVVg=;
        b=KoSINeAiNBPI4GMu5ZabGdCwt8U3/CYgyLW7yU2AdDyrZ4HJri2HOxGNbX2jejzcsh
         b1G9hLvUxX3emEtG/0T5zPhHhR97MJ3O0wcyKfSQe9f6gBwM8W+BC78M7IJAEcQFcT6w
         vkoo6RFG/dhv944BQ0SQuRf04+TbdFN8nj3nMvUVMoPhWJJ7NM9yoQmKfWBR77CWRP8B
         ppPSaAIhU/yPCGckpraNIXBjuQPTf7oTjoL+OErHWe1xStlED54+YSVxBMmQFLDlbDGw
         GGE3h/brpjUmtw6kklR3Pc48IOzR8Ev96EwzD2/4kqRJHDTT+5uBgEyeWXVo474Q25RE
         Pndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455209; x=1741060009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WhvhnqTOqnsJRoRSYGkE7Nvf8aJcMBRIuvNZLKTVVg=;
        b=EoZnwI66xSKyacbYd7BfNIzSMsKZFYl/VRb/oAx3FjdnkPcLnQsCg9xqe5u2z7gqdz
         hBKTuy9A5HR0S+4JFePcyxC7RGEwacnAh1CAGiEMPQeVvYYz/C08PuLP2rqfZYGT7x9D
         LzH5gACPbUZhIXbsf/LDa/f8PVkZg00Xm0vnHhdMSAfDPLuEh60+ScBe3ePBFRmjMk5m
         CWPIk478EtnPrLVc1e0+Qp0YQjM+g/5eL/SVx6jjcKt8Wjaweqrer+fc8xaRRZmsHcTj
         LkwGfC1DWBH0lw8DjQAnkZkiMnK7KUP6HDBLV+yZm9fSCVjN3HQKj4xLp+sIEwlY/wGZ
         Uwrw==
X-Forwarded-Encrypted: i=1; AJvYcCUj8EVGuDuQu2KqZwm3OBEuvqlJ24/Ru0B9YtWAE5qRmPudx+2mzSrqol5OnhONyiB+Ak/wpoL9brXh2w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4nq0cpylA+UiQVfxOGxmCkwb4fYbX2sJq/ygiOH1I/SDN2rZF
	u51B5HtoJK82ICqkxgEmgC7K04Or0Kw9rfP0UqE8oieqDQCzwX24BfpK2aEw5kQ=
X-Gm-Gg: ASbGncv3t62zj0/6UkV34XF4dFHvFRGGMUhWEhej7VbJ+vsbUjRZGyxUK0Rzn2QEGyD
	UjDOj/qAMgWVQ7P2DMa9J0AcBwTlZ/nRp9tWlw4JYzrb9N4v+GuXXdU44CoQHsYQKc97CEqnrm7
	LEl+b013qGakI/MUI8wuBpMX0q2tU74RTxf1tPzl8NsXmAXQnljsE4P+zdIy9RwTq1nuHXf1YUb
	bXTsFPkVFPvNnUHgcVKihF9uhSJrZ+z2yv1vKXQfDcOLe5SWvMqPQLtusZF5N1EUSzDS2ON2KiE
	8Pd/8zAU98Bp+/7FX1+r2lRAj9OmwEvoQjOAo2K3vO1RJfMj2KWdEw7k71ljKuNJlQ==
X-Google-Smtp-Source: AGHT+IFoZm5A7KJfLiXXGkFybdFv8MW6FGVkhPNKsRMzkFsrmZE9FMc5jXLgIOhcL2vDMu87N5uJKQ==
X-Received: by 2002:a05:6a20:7347:b0:1ee:e16a:cfa4 with SMTP id adf61e73a8af0-1f0fc78fb8fmr2712731637.33.1740455208891;
        Mon, 24 Feb 2025 19:46:48 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:48 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 3/6] mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
Date: Tue, 25 Feb 2025 11:45:53 +0800
Message-Id: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_194649_850996_5F4055B3 
X-CRM114-Status: GOOD (  10.71  )
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

Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
tlb_remove_page()). This is the same as the implementation of
tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
convert these architectures to use tlb_remove_ptdesc().

The ultimate goal is to make the architecture only use tlb_remove_ptdesc()
or tlb_remove_table() for page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/csky/include/asm/pgalloc.h      | 3 +--
 arch/hexagon/include/asm/pgalloc.h   | 3 +--
 arch/loongarch/include/asm/pgalloc.h | 3 +--
 arch/m68k/include/asm/sun3_pgalloc.h | 3 +--
 arch/mips/include/asm/pgalloc.h      | 3 +--
 arch/nios2/include/asm/pgalloc.h     | 9 ++++-----
 arch/openrisc/include/asm/pgalloc.h  | 3 +--
 arch/sh/include/asm/pgalloc.h        | 3 +--
 arch/um/include/asm/pgalloc.h        | 9 +++------
 9 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index bf8400c28b5a3..9d2b50265a8d8 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pagetable_dtor(page_ptdesc(pte));		\
-	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index 1ee5f5f157ca7..3d35d2bc42534 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -89,8 +89,7 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor((page_ptdesc(pte)));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 7211dff8c969e..ac026146e7e95 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -57,8 +57,7 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index 80afc3a187249..ddc24812f1832 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -19,8 +19,7 @@ extern const char bad_pmd_string[];
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 26c7a6ede983c..7e73d2f913dd4 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -50,8 +50,7 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index 12a536b7bfbd4..4b4a1766e2cc7 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,9 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)					\
-	do {								\
-		pagetable_dtor(page_ptdesc(pte));			\
-		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-	} while (0)
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
+} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index 3372f4e6ab4b5..2964e26980a18 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,8 +66,7 @@ extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #endif
diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index 96d938fdf2244..c376d4b708fda 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -34,8 +34,7 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index f0af23c3aeb2b..a70151cfd11c9 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -27,24 +27,21 @@ extern pgd_t *pgd_alloc(struct mm_struct *);
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #if CONFIG_PGTABLE_LEVELS > 2
 
 #define __pmd_free_tlb(tlb, pmd, address)			\
 do {								\
-	pagetable_dtor(virt_to_ptdesc(pmd));			\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd));		\
 } while (0)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
 #define __pud_free_tlb(tlb, pud, address)			\
 do {								\
-	pagetable_dtor(virt_to_ptdesc(pud));		\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pud));		\
 } while (0)
 
 #endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
