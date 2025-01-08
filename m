Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17567E77199
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 07:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jsKFp6BlYlEb3H86XmQ2zsK2ee4lKc7URjgLYScLf4=; b=N1uYKJ7Lvpg9+b
	sdIs7q3/bSoMI5obgqD5WIx7hBPjg5Obz7OfhSDS2wuDRy/jJAp3LRaWTtFOdCAD1eGnH36AKdZTc
	go1IK88BjaSRW+RG/RXM5OWh+QIBJEF1IINc58P9bGfmXiWe3rkTwu9RwWX7o05wz1rx536Wqkig/
	GrG7kdSO2ygLH7UUHRKVaN3vovo3wr55revFWWJK+z9NqmgsrdG6ih37HMt+iUjn3Lt3BWGuHAjuM
	PlSbRVhvjzWmSceDmgSPsmtSDN9FT6/JRKURpf0myqaHo582WeFXq1VpQNrru93mDX5EkegPDoO1T
	PXukuz4FUoFURVdS8GoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ9S-00000007NLY-2xOu;
	Wed, 08 Jan 2025 07:06:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ3e-00000007KjX-151G
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 07:00:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21619108a6bso226852175ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 23:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319650; x=1736924450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evJHXxUH8wpRsLAfhvt7S2AIimf3Ggw2vmlVHfN1TNM=;
        b=gDGu2YL+b6ST5hY7X/TaZlgwkmhC1l2NAWKDtNDO9YmsJek6FqFunfT6nQhRqqYf4y
         Odd31HyJMIinedZrCP1EoVMZNpNIMMfu3MiPnj0b4dCLCH4kmpMx+C+A1ugpLoT0Xh2h
         frKXw5nJZuutDbYfoXwLS9z5T4vlFzV0HZ1c6DblaOwnZ+4U+d/exIiTRG1xG+QxcVav
         F6RYI5MmHd6KOyiAjQB+VZZAoqJTpP+0FATMBxIjJXqWPs1W46c8ZdQFKtu+y0v8Lv7r
         o5CZnkuzw8SclVXeZ8wFTTmwhwXAzSZrcZsjxhEDzBStzW7L6LkyNCLSpkvzoCLJKril
         rTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319650; x=1736924450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evJHXxUH8wpRsLAfhvt7S2AIimf3Ggw2vmlVHfN1TNM=;
        b=b9YEyzXua0vfR2USVojN7jTnG38TH2O42aJ/mBO2pG7FuefKi45UqqjjlxeUSCqQR2
         nWzyAzhx1EqbdPlay0Llepv8ziqV4Z/gNRUsU2CGh311Z83PusTUxKpRbz8mvVPbS07a
         Q8JaKPDTWn7PYu6m58nDxFmZny1EQaa16SNowv4IXwhB+rit70czxQB7wE7iFgFopEkh
         SDR7jv57uFZFcPb8tAXXl77+Mqi76JCQv6F6Esso91DsUHTmLPLM6qI2pLFc1eXnkwhD
         QNBuIHFHSzoF8kbUFzL3Gvt9rgvBYM/lfvGR+sFTxDndMF/RL9Mf0PCOyGK3i3tFCTFF
         C9ag==
X-Forwarded-Encrypted: i=1; AJvYcCXDaxMLZJ6axGkyzYM+txs810jecDDPaDSzYirX0qBDa2gCpVspvU4J7lbQHs84Rj39PdTQCV+AsThLbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxag0Z59GCP0tUcrJfaWAAyn7mXZ+CncFxEcXBcOR9eqrNECdVZ
	1tHgGqpcfrNb+cnLp7fltjYjvGD98hO8S5WROA8+oPKjp7u1nBqPJR7oe6Ewb+k=
X-Gm-Gg: ASbGncskQ1yx9e/WeN/QtAnMleQSRnEQMvMwBI02l4eoNTwoSkjdlBYfA8r/tu95OdA
	lu6vwY6RZP3Vf7YsGn6cTlFdLV1NtIpDfojsjqMn5lJ6T4cx4cV3mGghrr0f1JtZ/PKIlAyN/Dw
	R1qS5jAuGs9htTNjk+hhMRszREiUCzUx2ibNtuShbTYNrNTbmkT6JRG1PLBsh+kiSACrc2LjNe+
	PI67PR7LVu9l5BpsyRTFvPt5pp3eMnCUdL2Jgdao3Jy7/kZ2AchAjsiGDkcmtWKXJj3xXbd4G+M
	agMspS4KqhuR6Zsf65B+daXRoFA=
X-Google-Smtp-Source: AGHT+IF9X6lXCsguwyHO5KdCHubvdTIDd4Y888fAuDMWr6lGszjnzuDzetJYvdD8sXl2Z0Y5NvXbNg==
X-Received: by 2002:a17:902:cec3:b0:216:7ee9:220b with SMTP id d9443c01a7336-21a83f4f43amr30110425ad.22.1736319649715;
        Tue, 07 Jan 2025 23:00:49 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:00:49 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
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
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 06/17] s390: pgtable: add statistics for PUD and P4D level page table
Date: Wed,  8 Jan 2025 14:57:22 +0800
Message-Id: <4707dffce228ccec5c6662810566dd12b5741c4b.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_230050_298345_515664F8 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Like PMD and PTE level page table, also add statistics for PUD and P4D
page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/pgalloc.h | 29 +++++++++++++++++++++--------
 arch/s390/include/asm/tlb.h     |  2 ++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 7b84ef6dc4b6d..a0c1ca5d8423c 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -53,29 +53,42 @@ static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	unsigned long *table = crst_table_alloc(mm);
 
-	if (table)
-		crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	if (!table)
+		return NULL;
+	crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	pagetable_p4d_ctor(virt_to_ptdesc(table));
+
 	return (p4d_t *) table;
 }
 
 static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 {
-	if (!mm_p4d_folded(mm))
-		crst_table_free(mm, (unsigned long *) p4d);
+	if (mm_p4d_folded(mm))
+		return;
+
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
+	crst_table_free(mm, (unsigned long *) p4d);
 }
 
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	unsigned long *table = crst_table_alloc(mm);
-	if (table)
-		crst_table_init(table, _REGION3_ENTRY_EMPTY);
+
+	if (!table)
+		return NULL;
+	crst_table_init(table, _REGION3_ENTRY_EMPTY);
+	pagetable_pud_ctor(virt_to_ptdesc(table));
+
 	return (pud_t *) table;
 }
 
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	if (!mm_pud_folded(mm))
-		crst_table_free(mm, (unsigned long *) pud);
+	if (mm_pud_folded(mm))
+		return;
+
+	pagetable_pud_dtor(virt_to_ptdesc(pud));
+	crst_table_free(mm, (unsigned long *) pud);
 }
 
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index e95b2c8081eb8..907d57a68145c 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -122,6 +122,7 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -140,6 +141,7 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
+	pagetable_pud_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
