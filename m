Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A08C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZ3cYWWcK+ZDOQb9EUFjBoxEMtueiRrVEYj3GrszpoU=; b=y9Wp9z8UsHEOOi
	z+0h+lzfCpFmjbd9m1M+zC6yntlzj4yqocdDPXfGQ2Pq2I1FkZumPSKDuZapjLWJNUP9l2MgGdoDp
	cHu8Daj1tRoZ32ipgknutvcD/TDtGaBXWodqks794W5jAKaqs/e+epoCeKXr1qWVBzJdefYWKn29Y
	kAd0emG1t5S6MORFRnVMV1KLQl2QfuvWxLLVn7IC9qx6JcBtmetTqLKMpYo4xEaZly9IKCVkE4PnT
	i264ad8rwzd+BL8Ioe623j6VujBRMrB4cLiQp6LsqSyNaum/R+7/tI0v+WVTJDujZr5blxQqFx6/p
	yxbSh09TfBFxZ66D0KFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjP-0000000Fa0d-30Zg;
	Thu, 29 Feb 2024 23:22:27 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjE-0000000FZtE-1DsT
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e581ba25e1so1204856b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248935; x=1709853735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEa0bZw6X2PF+fvXkyrnyWuZOURSNgi5dGIyeM9k7ic=;
        b=BSrV18e/vNO5QDLrMnxNoGanXr1m0hCtWjg8ATFwMN3fejYfIGEbzfoJQ67Vxqx2ny
         52A3a3sjxPoHrYQHEFs0ZilH+NFReTpY58qwKMLypdPyjGOnqAV42oqdlSGQ4/xTnn/8
         rGj8jMdwBk0zNOHJbaC8DaCsITLKGjVhEBzO8vPU1Gz7zzfRhviJRCCrI2AFyegH8pZG
         1z1/h8suNHUR+GAaijs2RA1TMClWmJFxTEO6wryqNrSa/oQM4Jpdbcu3mCit0F+UsT6d
         Y2ORbFj/RNvwkRSkl+1yKEMqYa00ogdLu+vjsJY4JAeHemVgMnxuqSYfDJ2agMoFRj4U
         1g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248935; x=1709853735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEa0bZw6X2PF+fvXkyrnyWuZOURSNgi5dGIyeM9k7ic=;
        b=MUfYOvo2+JGCGLCFiCYbdralS0NdlkGB0R3hukoxXT51G00JLri8Wc0+pN1pAE7Rj9
         S7WV2pbBO6MFXu0g+sb8P81BeTjL0DvGmHDsMwOkQkhsbUeMdfwhLwewfJrNjpcmlc+z
         OrUCnlFJ7gBfpth1u6i/75g7l6NgnV9w4Q+LCVKBeeVFCAs4uEm7F0hvo+7pixtrPuWO
         wzLj4mmkTVjWqIvpbN50JAWL0oYavVN7czhUnVt30O9XudUIioBF3jMNrKBRBsjcTvtc
         guJSjW5eatNp/GYJLhdxBPM7cJNWTHk9gY7SWwyLjto6yqmrdI0f0XCTOy/hWN5XNBKA
         xeRA==
X-Forwarded-Encrypted: i=1; AJvYcCV2nK3MZYV4FfS+5aT9koKnV68VWTmxmmP0TmT4xw4AfpBLYCH/HFuPXvdlbrlfZJ0xRAdgBJr8qSIPc+DGCCsr8SHuAcXLOXIrGIcIwirX
X-Gm-Message-State: AOJu0YwW9YMSAYRftUTpfQTqJnuSO+Xd01oCJiZGkH1BkxXdsGcRARD4
	VixzkrPSVCgYaO6muUIgpVaiNYuErkvCV9N2dgaaM4BwsrF+I9owkhy3FLxLU8g=
X-Google-Smtp-Source: AGHT+IFdgcTr06rQ4rVKFKQwHiCzNjuzvF9/zHzBzMpbTCozBAylfcba6wC7aAVCdn9otyCllPR9tg==
X-Received: by 2002:a05:6a00:2293:b0:6e5:599a:5252 with SMTP id f19-20020a056a00229300b006e5599a5252mr606918pfe.15.1709248935218;
        Thu, 29 Feb 2024 15:22:15 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:14 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 02/13] riscv: Factor out page table TLB synchronization
Date: Thu, 29 Feb 2024 15:21:43 -0800
Message-ID: <20240229232211.161961-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152216_351719_3DEC0632 
X-CRM114-Status: GOOD (  10.19  )
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

The logic is the same for all page table levels. See commit 69be3fb111e7
("riscv: enable MMU_GATHER_RCU_TABLE_FREE for SMP && MMU").

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v5:
 - New patch for v5

 arch/riscv/include/asm/pgalloc.h | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index deaf971253a2..87468f67951a 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -88,6 +88,14 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 	return NULL;
 }
 
+static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
+{
+	if (riscv_use_ipi_for_rfence())
+		tlb_remove_page_ptdesc(tlb, pt);
+	else
+		tlb_remove_ptdesc(tlb, pt);
+}
+
 #define pud_free pud_free
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
@@ -102,10 +110,7 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
 		pagetable_pud_dtor(ptdesc);
-		if (riscv_use_ipi_for_rfence())
-			tlb_remove_page_ptdesc(tlb, ptdesc);
-		else
-			tlb_remove_ptdesc(tlb, ptdesc);
+		riscv_tlb_remove_ptdesc(tlb, ptdesc);
 	}
 }
 
@@ -139,12 +144,8 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		if (riscv_use_ipi_for_rfence())
-			tlb_remove_page_ptdesc(tlb, virt_to_ptdesc(p4d));
-		else
-			tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
-	}
+	if (pgtable_l5_enabled)
+		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -176,10 +177,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
 	pagetable_pmd_dtor(ptdesc);
-	if (riscv_use_ipi_for_rfence())
-		tlb_remove_page_ptdesc(tlb, ptdesc);
-	else
-		tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, ptdesc);
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -190,10 +188,7 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
 	pagetable_pte_dtor(ptdesc);
-	if (riscv_use_ipi_for_rfence())
-		tlb_remove_page_ptdesc(tlb, ptdesc);
-	else
-		tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif /* CONFIG_MMU */
 
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
