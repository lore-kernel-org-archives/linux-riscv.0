Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F91AE77196
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuerR80fM9OR46P7HQ4om1xY9e6+fwG/rfzRhMKd8CI=; b=c5jR1r2ikCelTO
	aAGjqBZeUT6aOP0/X7hkXhFL6/DRntaEj2CeAN7xC7p51u9OZMjs/uFHfX2JTb4rdVwEqzCVi1OTM
	aJn6Qe68N6BgDdok+e8li0wr/D4AOb08/0+KAfRFAcAbzScrtnox3ExWXYXBFvqLdEB9OC34MitW/
	+VmXB5Y83nxoml5rhrGwAHuX6p/6OHTyoG8SgqY8qEGq8jI9XlAt8t1yqGjiz6pejfiEZeQfEkJIm
	Od3YWI3Qv0iXTNlAN8HQ8fTfXy3Vpz3KbfQiadjuAESayNxtY2wUM9+44Q6TG6AfXP58yA4TsoltZ
	n0dVFSH4RnUEujG/cC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCyI-0000000520Y-1DoX;
	Mon, 30 Dec 2024 10:26:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBnF-00000004sgQ-0nDh
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 09:10:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2165cb60719so116242005ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Dec 2024 01:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549832; x=1736154632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=YdllGC31vRjtgnoaB2Jw135SXEFZYNT7BZMGv3BIwCDJj9BxWSmTY5T3Lp8ADsR8XH
         xrNt3nNe85Qxb51M1RfSYHW3VtuqJ8JCfBia730YFpxvHXUXpqbIqmYSU6t0nw3mcHA2
         ovEJCybpk+yDQynZDacZDs29JA2srh1tx2ZpQAi5nIdLjUMSLQIxtOh4tazaUFxMv6Rt
         EpTpM+guM3GOc826iYuX0X3wvb9UPn3ufxif1p0H1qyGN9mIMQAzcRiTAH67x6a/OK52
         H+KkhVrekWx9+UZf7HH9H8hUNOFr7vc6GKPKSa4Jql4hmbl/aTTs4g839zmR/iZY+lJC
         rYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549832; x=1736154632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=dmBuIGKODbKwnIZkr0oYk29dn/mURV042L7U195F91sV1GfA7ZKJLwtqpgHCEkMBRr
         z4J48kOXGQS3MwAaPrE1peXh4xTqijYeHZ6AiTh5J/TAsq0dzJ7Hz4quoMZXj0iSplC/
         fcEJ8LmPZTgN1dpCo83+xWfoBu8vjyoqug6ySCTd+7KeBw954sfIX1TQdRor4JyaS1j7
         /oNTXs9zyUcGnAF6u07g3aD0ZdG6ciupqL5np3dR7aVFc4Ww7Fuj2Bn8MtINR1f7QcmQ
         gOSYzvP/t+F71xCkPXc0rYgpknLhbRzWPLmsW4fHy6eApRXCo3bUBBmxg7yRrFi1sII1
         wRFw==
X-Forwarded-Encrypted: i=1; AJvYcCXB8+zm8eqHR+LlZ+AsFlvEi3QENrSCYHcGWnUpksvuOspRIAuQbO71xBvTY2DNMHASv06A8QcxVhGHcA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0/rI8sZVscneUT2M8VzShm5txvyOs8LMW2sp1Xv5npcvHG78n
	B27uL9VjFdNPcXThpdyNIrQexeh3PCBebqrxl32g1uVOW9Q+ak2BhnIRBbhtP7M=
X-Gm-Gg: ASbGnctfOi4wHooacDWi21kVxNHJGng89mBJeZZXJv7HHlYuK8FZRZwI3W+jzep9zI0
	Ma0JzusQiBT1nZ3+xiN47fWFozz5+RvqlAQ3WdrCe6uEsVhE76rrQ8nuM1CyI4WGUfN2Y22K4pD
	d3W2LP6MY8lvu/7bYYrG7vsVmpRjLG1O+6WrdSBfv3lz6ez0hvOTssT74/qsqygR4zoFvh8K7Pn
	rs0b+fB9M5gUjzSQCI1wbeJUukCboJo5ChQyuLkCQayKUSXtDRX4b29SgvWpFpIlrKkvtAIj+xW
	59ivZUy7UypD2Y+DMkqBvA==
X-Google-Smtp-Source: AGHT+IGwnjGmNRtsc6wvIZAIM8FV7PRxiURIME1KaVRQ0EplG8wu3sXxm46oGULh37KJjV0x+YOVDQ==
X-Received: by 2002:a05:6a00:2181:b0:725:8c0f:6fa3 with SMTP id d2e1a72fcca58-72abdebb85dmr42631070b3a.22.1735549832564;
        Mon, 30 Dec 2024 01:10:32 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:10:32 -0800 (PST)
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
Subject: [PATCH v4 09/15] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:44 +0800
Message-Id: <df71d1bd87ace445383b8ae62087ae14e35eac3b.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_011033_288243_553D9E53 
X-CRM114-Status: UNSURE (   9.71  )
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/tlb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 408d0f36a8a8f..93591a80b5bfb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -9,11 +9,13 @@
 #define __ASM_TLB_H
 
 #include <linux/pagemap.h>
-#include <linux/swap.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #define tlb_flush tlb_flush
@@ -82,7 +84,6 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
@@ -92,7 +93,6 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -106,7 +106,6 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 	if (!pgtable_l4_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -120,7 +119,6 @@ static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
 	if (!pgtable_l5_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
