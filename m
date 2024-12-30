Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1635AE7718F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvwMHI/S+/LK5dOZNPu8JgLIeteGJaRgCMSQfsKjOsk=; b=pbqQT+AZlfr4uR
	wn0YrpUj3SblJG+em0a0PvlKf2K/s+3Nwi5S9ma7DptgtpAgxMbrH0cSL2/R74+IEn9LCFD6IOQUh
	8bvy0laVakz5RfeDTLKTj9xVIefarjgRpk+yqpF7lNDsyL8e+vRR6H9xZGZlrMKpkiqqmBKKKsJGQ
	Ylw8zP7Ai/XbjAb9oour1KGxTIQMbbjBKc5tOEUGZyqh6RRNpxbbmEhSQ41uYxM972hKwWbdVM7ga
	mR/1oeJ0PyL+K7gsKj4O6TCIrxG5Hna6XZpQa9Ty2hQoGFgiRbRxjs1jXveMHIpgiTEkPxPz7IoPT
	KC8Wjl+xwahA+1xZygPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBsm-00000004uQ5-3rbf;
	Mon, 30 Dec 2024 09:16:17 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBmd-00000004sGL-47J1
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 09:09:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216728b1836so101117285ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Dec 2024 01:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549795; x=1736154595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xY41yoAggnrpKZDOvMIy0+FhpPRF9QFn+bDK7HKPzWw=;
        b=i/BMApJROoSsCguBL9CERYmB5+LG4GE35MExK36zL83eaNT2aPfPmzO6ygeSlZnfvK
         wa8PFBdrdFJjSt/5npRONKOjIyIRIEbZNN5MeFmbKVFQZpqgkVLpOx+9fg9Fk+9W3jQQ
         KvO+1F9bg/G//Cq8ksHY018zLvDPI3KD6PrwwbQrFDhIHFHB48Rf6TRdCbQ230S4EJPB
         +feC2ujxNjl7AkexeiNloERRKY0PqB5HvKB1LtVGsW3uMLXGr7/ymX9WHBWGmj7E49kh
         AlnfRwNxqgXMYf8+BN492awsotDRmEqLAiFOLF7HeCES+hN7S+C5T9PVeUANXINwx/oV
         4qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549795; x=1736154595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY41yoAggnrpKZDOvMIy0+FhpPRF9QFn+bDK7HKPzWw=;
        b=JeTI31n6ukpGYK4Hd+9bFrMPAyBE5tf3qlbC3bgM91crqDWCZv4JAm+puRlVw5zJfL
         YbyjTodzhoh8jhwkr4jI1oaXlTT3ZG0Kytfmc/0+apa/+M6xIk3Rwk94ZqmqZM55zOii
         +d4Efvs1wkjzuvuApDrwpB15K9DnfyQs2r/60wleWgpl/Eq3ZMbX6hqSM7ekCHWjxL1S
         xYp41CPq0pPU7ggwpLX6W++WcAP+VAauYF+Zw9N+EglinC+TPEB/ZN8tv0nI1EtD+6t5
         /m8xFxhnQusd/3vcBeL0JeoOTwa1bOo989zUaws2gcMI53ZHPKstguztIoJLPPX88euU
         S3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ0G5wZZ9XcmKhZQSBU8Skewuqs+c6T3gIHRgEuagG/0gDAcZj6F2/H61dwtWuGm8oYGT6Y2GMAPg6UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2wHbrc90wvB5HJklnFSkbFbwTKi9+GXi2mA8sNN9QNcJEu7lc
	UcEbwmA626mhF6GIS0/RgddsU8iMCbNfTI0TlUdMLhcAqiVVBIZhg+11M7Akb5g=
X-Gm-Gg: ASbGncvjKu63pcJLLijnd/NPn9je1P3nT4bibUcKCf6e82rGf77F6NvVv1w61Wz7EFf
	ibw1bNhwHM4C+QnYs/SxNTMBRIc+dtvoudYN8pjj473cFyts/tJzHZcbRAnbdA3MG8WslFvrQ+P
	L8nLuZ6zokDGngMFoom9CztCq/s6Yt+lZnIlDuQK4bOIiGFm40p6q2zLnW2B+G1+7dlImGPtIF+
	7esBxXaQJ/bqjSuNpxHggT2CpsRp+7GUq8VNmavgwtptHrChmlkKeBTbRfsScFo/bhTT0C+YudB
	40SLNEAhtPk9oQR4YYdJCw==
X-Google-Smtp-Source: AGHT+IGnRshrEAoIvJb/W9ouyd0xHkDgdKkbYKOXyUcaItniQPw/Z8/M3j6tdqefIia4rt8bUMG2kg==
X-Received: by 2002:a05:6a21:328d:b0:1db:f68a:d943 with SMTP id adf61e73a8af0-1e5e0461b11mr51051580637.17.1735549795427;
        Mon, 30 Dec 2024 01:09:55 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:54 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v4 06/15] s390: pgtable: add statistics for PUD and P4D level page table
Date: Mon, 30 Dec 2024 17:07:41 +0800
Message-Id: <35be22a2b1666df729a9fc108c2da5cce266e4be.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_010956_024003_14185837 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/pgalloc.h | 29 +++++++++++++++++++-------
 arch/s390/include/asm/tlb.h     | 37 +++++++++++++++++----------------
 2 files changed, 40 insertions(+), 26 deletions(-)

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
index e95b2c8081eb8..b946964afce8e 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -110,24 +110,6 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 	tlb_remove_ptdesc(tlb, pmd);
 }
 
-/*
- * p4d_free_tlb frees a pud table and clears the CRSTE for the
- * region second table entry from the tlb.
- * If the mm uses a four level page table the single p4d is freed
- * as the pgd. p4d_free_tlb checks the asce_limit against 8PB
- * to avoid the double free of the p4d in this case.
- */
-static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
-				unsigned long address)
-{
-	if (mm_p4d_folded(tlb->mm))
-		return;
-	__tlb_adjust_range(tlb, address, PAGE_SIZE);
-	tlb->mm->context.flush_mm = 1;
-	tlb->freed_tables = 1;
-	tlb_remove_ptdesc(tlb, p4d);
-}
-
 /*
  * pud_free_tlb frees a pud table and clears the CRSTE for the
  * region third table entry from the tlb.
@@ -140,11 +122,30 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
+	pagetable_pud_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
 	tlb_remove_ptdesc(tlb, pud);
 }
 
+/*
+ * p4d_free_tlb frees a p4d table and clears the CRSTE for the
+ * region second table entry from the tlb.
+ * If the mm uses a four level page table the single p4d is freed
+ * as the pgd. p4d_free_tlb checks the asce_limit against 8PB
+ * to avoid the double free of the p4d in this case.
+ */
+static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
+				unsigned long address)
+{
+	if (mm_p4d_folded(tlb->mm))
+		return;
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
+	__tlb_adjust_range(tlb, address, PAGE_SIZE);
+	tlb->mm->context.flush_mm = 1;
+	tlb->freed_tables = 1;
+	tlb_remove_ptdesc(tlb, p4d);
+}
 
 #endif /* _S390_TLB_H */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
