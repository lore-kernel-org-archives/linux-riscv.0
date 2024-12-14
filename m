Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD07E7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yfzlg8n2UuQONUBe9yZC8y0JfNwO+EAKMfBLQy0Qmc=; b=k+1YEbkpXKlSvX
	txa7mIBlUl/IQ+StDdd/fu/yy/H4mGy59ujUZnkXp4VT3hs7x0KXLaCrSRJvxrBcqWO5SiNejK1z1
	M+b2wJbdbkKJT9W7FXM5wO23Oy2WTsvd+KZuOVNKrcE7m+yu3ZQ7zX+WwMue6BpQnrWglKPzsd9KU
	ARkNeAlHDmps2JU1SJ0sym+m+4mK3OALnukhYn5jJVmTsSelHBrK1Hr2k6HkGiEg0p/nMU0vWWEuc
	7gmeSNozGuKuqWj7Qgb9LYvUhget+mVzaRLSkh7y/CzLVXjNj0WrIHVDbIElDgssIYC3VhGBvB/IQ
	EwIjssEy0inkw6njo67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMO7Q-000000065FH-12S3;
	Sat, 14 Dec 2024 09:07:24 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMO4x-000000064bX-1sF2
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 09:04:52 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7fd45005a09so1627480a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Dec 2024 01:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734167090; x=1734771890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxcjg+YJiLOjdKwLGOoVz8JWl+VadyRpr3tadtBHjWA=;
        b=ceIwlt3JG9YqqGz2zwQuWnujRHPdcGk7CC/OGjcoTuCbZHbsnExiXpfPnmEP1QU0cb
         MEXl/014e4pb/2/LxT9GF6ks1VCd2OfpaJizDId2fu80ojw1+NDXeYUSQqKzSMR0sWU7
         IS2KaAG6E7OskyoLt/paMQa+1uqLVaE7onUeh/6s2Eu8kBtSi734/PgGcjpvCe1tLdjw
         BvV/g9IuKGKOUM4kMzJTUKXBbT5vYmPHINjmW4AZysD+exDaKlr2wPN8PrzFDK5paSl1
         t8wwzrrimHjyxT0kEzNtACROzULsEawkJUeMKN76WE4zAsCldQLme+T6IBY5bVoGBsqp
         P0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734167090; x=1734771890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxcjg+YJiLOjdKwLGOoVz8JWl+VadyRpr3tadtBHjWA=;
        b=Pr4Aqf70DVvBJF6SYMGsgs8Jheb2JWSyeOwf6P+7WnF3ewjMazqL1B1z7o/voqzsCS
         KELeCIutpdU9CumGA5SNeszk8uZnpOpl/RG8hj4Hfk2hLqf4SClIrgjdLd3hnnartqES
         hqASE29d1OhkiZGPn5o8aAw8Zt7r0Ls0ne/DaV39EBJ246cZIJGHxC/7nBS11zIEB5mE
         jq4cARF/3e3ZFP0pYRSio3gRN57Eym14hn3wDmcJme1z2S+IlL+9o51w20FCCh57ywC8
         o9RaS3hPkzM6Y2AQxgpUVey8abQIrx4vw/yNLtNON326WXOOd8pH0JR6etY29x5rSE6k
         P26Q==
X-Forwarded-Encrypted: i=1; AJvYcCULEfaqAHJXYu1pCzWceIfNUVeoKKHSDpkvVHi1ypofjLB8FqU4yFLM021b6ZBg6LE2G7YYA7AxvA6NVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+kzuGUWebA3fq/b2jkv4Aunov5dh0V7rVgAtfjo06t4sKu952
	7/dlPJPg83KJ072KqF7n9x2ZKWtrJU59rfSmcW7L/9Nw9ubgMYNbxNsFWD+f2LA=
X-Gm-Gg: ASbGnctGmgfSKJpj+FgXvFcnB4SnMiWvUz8g6rlepj6pmzBVEPiDK+Eul5NtIosLR8k
	gpvLG5EJgnTa5+h/4LYOGW3pfQ3AeKVwf4HwQd2OH5D6s+qHfwDOmoLF8D+EvNEdpChp8lwiW/r
	syhlALspB8Q9wXHWIwO/Quk9HO58UQ8ux+oCAk6Z5MrnbkMqzudQGa17XNLRf5jGlZNzmS+pwtQ
	iyqPZI4gcfTrER8l2XWMAD2xXkhay85c98QRfbdCMhXe2doSgxtxnMNcZgVPsiRATM95mAlLLwB
	3uXdotEyEzAOJUQ8DJDhFkSzQUvqNQ==
X-Google-Smtp-Source: AGHT+IGmWNhert5ebnmEBEANehnSTDBWCLVNkF+841k1TH0tjB/D3zS21KwZ8s5YJg+vyRMQfoaR6w==
X-Received: by 2002:a17:90b:3b52:b0:2ef:2d9f:8e55 with SMTP id 98e67ed59e1d1-2f28fd66b3dmr9591223a91.17.1734167090585;
        Sat, 14 Dec 2024 01:04:50 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([2409:8a28:f4f:a9a4:5d46:4ef0:daa9:1db8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5a90ba0sm905731a12.16.2024.12.14.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 01:04:50 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 08/12] riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Sat, 14 Dec 2024 17:02:54 +0800
Message-Id: <1e73cf87193d838c64e402896b4252875c212986.1734164094.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734164094.git.zhengqi.arch@bytedance.com>
References: <cover.1734164094.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_010451_492325_D944049C 
X-CRM114-Status: GOOD (  12.85  )
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

By the way, move the comment above __tlb_remove_table() to
riscv_tlb_remove_ptdesc(), it will be more appropriate.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/include/asm/pgalloc.h | 38 ++++++++++++++------------------
 arch/riscv/include/asm/tlb.h     | 14 ++++--------
 2 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 09c2eff571a49..fc50d14010246 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -18,12 +18,22 @@
 #define __HAVE_ARCH_P4D_FREE
 #include <asm-generic/pgalloc.h>
 
+/*
+ * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
+ * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
+ * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
+ * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
+ * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
+ * for more details.
+ */
 static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
 {
-	if (riscv_use_sbi_for_rfence())
+	if (riscv_use_sbi_for_rfence()) {
 		tlb_remove_ptdesc(tlb, pt);
-	else
+	} else {
+		pagetable_dtor(pt);
 		tlb_remove_page_ptdesc(tlb, pt);
+	}
 }
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -109,12 +119,8 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long addr)
 {
-	if (pgtable_l4_enabled) {
-		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
-
-		pagetable_dtor(ptdesc);
-		riscv_tlb_remove_ptdesc(tlb, ptdesc);
-	}
+	if (pgtable_l4_enabled)
+		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 #define p4d_alloc_one p4d_alloc_one
@@ -136,12 +142,8 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
-
-		pagetable_dtor(ptdesc);
+	if (pgtable_l5_enabled)
 		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
-	}
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -170,10 +172,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
-
-	pagetable_dtor(ptdesc);
-	riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -181,10 +180,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte);
-
-	pagetable_dtor(ptdesc);
-	riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index 1f6c38420d8e0..ded8724b3c4f7 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -11,19 +11,13 @@ struct mmu_gather;
 static void tlb_flush(struct mmu_gather *tlb);
 
 #ifdef CONFIG_MMU
-#include <linux/swap.h>
 
-/*
- * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
- * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
- * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
- * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
- * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
- * for more details.
- */
 static inline void __tlb_remove_table(void *table)
 {
-	free_page_and_swap_cache(table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #endif /* CONFIG_MMU */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
