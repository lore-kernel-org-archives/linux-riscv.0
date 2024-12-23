Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D94E7718D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 11:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuerR80fM9OR46P7HQ4om1xY9e6+fwG/rfzRhMKd8CI=; b=n+HEgX5Tn5DJRA
	VPUw3dCRm40ZnwMLPu4cdl39A/HiMiKMu7EmrfirqP67vy0GBDjOjSjfFmAL16nmwC/T7GvrTeJYL
	G4lHlySKR5Gs85nIkFWSvYudLMPHogvtMsqRFWwcBhwtEnA8Yfsh37nASsITV9KMJZWgv4+vbv7qc
	FtB2BahmhohQZVGVfm5OL0lwfq2OUDFfbq0HLvpiVWUVwZaJ96zDd1OiencIep14fDLjob+OtZpn8
	fr+/7e8Gv3VUxZt3oCZR4jes38qhQ6g4LGsRKscmLmTNPXEm9ebVoVHHpbcMctDrqbh5yj1zbZAwP
	540a8Ik3ANg1GFvE4J2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgGJ-00000009qK3-05f0;
	Mon, 23 Dec 2024 11:06:11 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPezi-00000009gwv-2K6H
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 09:45:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-728eccf836bso3361976b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947098; x=1735551898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=S3at9zfz3yUNjlkjUPKzJaN+AAsKK1Vjgg9/OZxOi6o6ncGXF71uYtR1xjjE4iIlRM
         jCyJY4/7RZftYZlSP+Pu+NLnygsyt5CnpCsauB7PeSR42NaK+x3Ug6U32tjyLztSjgOP
         IjPHyvUv/dndwIhRKLqP/H+dypNNYwJVxSw6+YFpgfZKrzxuUPLEQz1CQJUjnusysbqd
         CsHV2BqsPnYri9kZQRgJyocOawSVNiVIxXvA8l/UumDNxo5dj6SbiuNVFO3WsEYbeW0y
         p9HHclfdzzShjjOQ6EB/FeaCn0ZxvCWL5jLZsFs8vD6TO48Sf14PVWSCnzoQ/OYdfOP8
         3hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947098; x=1735551898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=JAfg99tN9Voes59ce37dIMUYLv9XXMzZF9FA2AppPHgjYdDwNRaJEuNcWfqTHAMH+B
         9eKrQ5BEjknqfHjiD2LXnFyS9zk5UROnuao3q61uu4goW6BVjCWkm3wppTtE/Umb9yHP
         a97UmrmDefOD1W+WznJzpRnNUjOAldeAiCtCw5FN/bNm/Kb4RP/DwCllBmOlO8/VRk4K
         G9tqRBB16bT21uh7WIU7+Uvt5kFxK/MteYiFWapB5ayNnjwKGjuPM2lzdXf36UGPNYk6
         jwKleCT3xX1zou/+Ahj9dUWnDXeuRF3jAz/k1tJaXWhNXNSDn8KTEukVqnASe6YSBRZB
         w6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6QMngNmnWJqIWLXoTD20ffltDaoalSGYWJCxFhY73braqd20b7iqOvpjYi7Jgf2Me7oNYaB0O38N3Ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSLAfJ770bc7gudjqmYTLnwnOamnLO1AM9zb8Tbd2M4U1OyDjP
	X5PeXCgeMZ9Q/DgqYbYO0F06+IvKaOJt4o1wHDNljv1v4AkiXJLhm2Ys5Ogdzo53zWc4Bo0QEoy
	t
X-Gm-Gg: ASbGncsTsnn2BXtFzB0aaJwJNDvsmrXC9nDjxgmfeTBASAc4Lmbd0Dqx05l4zdKSgUb
	zhqaeLRczhIVwnOvcxFzf4cYcCShKRBF2OSHSeprDB+q8/FTWL1668EiYlXqqxu8bjiXEBlSB/V
	m9C1rSvuAmwITMb5aIFmen5+mUiR2hRrTnKh+n5x2ROwZBMR/IXZoaqhuts+nTeiYKCofpydSz1
	lyIvTON5/iQfJRcQ+argHGNM1RO5jWRH6QGhZWX7bGb3fJb3Rf3UURERMrQwTe14CkNTIgia2MU
	YzhRY0RgX82HuEW4wG7sWQ==
X-Google-Smtp-Source: AGHT+IH27a1l8kT42WYYi2KTFhW6smXjjCcrkYYj/EF7HLDGUXcMfllZ3ayHCCSFU+IsHMUxZvkRwQ==
X-Received: by 2002:a05:6a21:6f87:b0:1db:c20f:2c4d with SMTP id adf61e73a8af0-1e5e044b1c1mr19165305637.2.1734947098042;
        Mon, 23 Dec 2024 01:44:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:57 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 09/17] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:55 +0800
Message-Id: <df71d1bd87ace445383b8ae62087ae14e35eac3b.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014458_600414_9D5BA21D 
X-CRM114-Status: UNSURE (   9.52  )
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
