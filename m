Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBEDC44501
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQyPIqnaek163gmO3hPWed/vXS88ngMNLIUXBbjMYM0=; b=YV5N3PVBIlL7VR
	uag+f5ywELbSwr0iKlJg7qokGQlJpDF/xF1IPpbaMwMLffzJ0XSPQpTGI9XmZdh0/1Uzfn6yUDybP
	H+wUTCMGRkusSEXELgpEo/czi/UJlY8BuPLoTrdyPCsr8iL8VsmJnN8VjzwYItRLwQgMVUgKGco9J
	lJyYh/fRoiyBKslWf6PNs9gDL+CIlKbYrWBdN5meRIxzbLOshNBH0FKHksmo8SQutHY+o0+aVhv//
	15HxQBKkLqamsEuFadB95CmSA03z9rOuh/eTtF4kO/d4742Ec8YbQM4fMBjJ9INh/cxZrGr2231C+
	52effBBQTO+dZAZrZOOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzXG-0000000EvAD-4BUx;
	Wed, 15 Jul 2026 13:20:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzXB-0000000Ev7o-2hvh
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 13:20:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cab973140bso63183155ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784121621; x=1784726421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5Al+sJZCP/A2YqMMRE5O11m7TbG/oT9KeekulTJ1Xs=;
        b=SSQiLj0EXm/KlQXU2XkW5R+jGp7vITcS0aufWgtYI4U/k3TNzWm8m4/iVA4udKlxhE
         39EwenAkYPK5M/tS0968MQCsfzjdNdyTof2hjD7m7L/Uf2QYN2Tzw62CEwBSpxsA5d90
         92sezS/NHlHuB3GcFo/NyoN+RiYOJVSXbhJxseZqcVAVHvPkiiLHF2p73kIa7YfLC/oh
         GXwQKaYFYlRDOHi9xtCeKydihbXj1X8KeynmBgPFwbW9b/INMc9cGo6MDE9yx/4OTpWD
         ehkdDry3xE8D4rBWmHc942aPl6CZj9W8Ocq7fHH8tZhl7wBGE/eZLyF7sgoLh3mbuo7T
         k7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121621; x=1784726421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5Al+sJZCP/A2YqMMRE5O11m7TbG/oT9KeekulTJ1Xs=;
        b=WeuI96q6hzPzqpRa1YQyYFqR5ShEraFp76+4skOhz1lJv1qpzRG7K6JCR/tTlAi5Do
         yNyFAriuCoLHtIvoDKQN1VIcVhe3/ZygS+hKgrQNDmHhbQ2P5dw17HO0+oehR+m4iItE
         fjPq/n3S0z0xoQrnOkD78k+pcwn9/g6zcCqtcMKu6OA+UmBpStMc0JXCs5KjOHgNCtxW
         tbBgomcSZMabKo9vEzEN9bOEiMu8ARtwZsr6EZ/o/XkAcvfLUBgufHxuj2G7aq8itS3n
         Hz1+FVTTFIvfIZ41d2J/SQL4vBRc2h3EDcAnHfgsZ2LZT2csvEsKnLQZSIx5Xz2yG7KT
         94KA==
X-Gm-Message-State: AOJu0YxIE6y/w8JAu/ziOYOxtutK9ioPSP5KsqmHWOdyNUeqECqh4Ps1
	xDwko6k0b+W5XZT+0+y37O1MDpvjErfWCZoFxRaoH++gVvB9EUztSkw1o4ztc+Q39UM=
X-Gm-Gg: AfdE7cnM2cL/qoF5em/C+fQRGpQpZ6mohPrHlzT4lm5Awvn6X9qlKDKmN69dBmyVHC/
	6/gg0zsAoMYdArVIaPxMf513lUux+JzWQmQAEU4hLfFBIOhSJWkC4cRjEiMUv20o9xZ1DD8cCT2
	jLheKVCK0mDjdiWTEHWwJcr2n/6YC0na8iWQASWG6qwxEzozGZGHKPpf9GfIh/q5FAkIn5oZQKh
	Yf7vHqCeeyniCCRfi+oDklQKWJVjavgQaqr+ls5i98hIv+6rLkUh3gFIRyfAHzwRrpTNp/HzPIj
	4CuecxSLfeX/jq1RK0K05pHAIhEd8x+vlcegSOtcA+d8bLJCxHbJqCWsUzMc8g5IT+FAFfr7QgD
	Hbb6VD3+pk8etU97VtP9l71NWNSdT27yboUa+PJFwO4JWwR9f6G82mA/Uhfn8M++Dieh51J5ZkN
	RfJ8zt7mh8KLztYd/pSLELy6Ac/PoaOs67HeRaJom4lHP767SOt74+JLrlgsfZ5eW72OCte038v
	WgVzfsuguOPEpfOUZuko4E1E4CgvxJ1u2I=
X-Received: by 2002:a17:903:41cd:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2cf03c40414mr25734955ad.21.1784121620466;
        Wed, 15 Jul 2026 06:20:20 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e42c6sm2465085ad.9.2026.07.15.06.20.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Jul 2026 06:20:20 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	klarasmodin@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2 1/3] riscv: mm: Use ASID in update_mmu_cache()
Date: Wed, 15 Jul 2026 21:20:07 +0800
Message-ID: <20260715132009.10634-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715132009.10634-1-luxu.kernel@bytedance.com>
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062021_694112_7417C822 
X-CRM114-Status: GOOD (  11.12  )
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

Only flush TLB entries for the specified mm in update_mmu_cache_range().

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h  | 4 +++-
 arch/riscv/include/asm/tlbflush.h | 5 +++++
 arch/riscv/mm/tlbflush.c          | 5 -----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5d5756bda82e..9926556099ae 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -568,6 +568,8 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 		struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
+	unsigned long asid = get_mm_asid(vma->vm_mm);
+
 	/*
 	 * Svvptc guarantees that the new valid pte will be visible within
 	 * a bounded timeframe, so when the uarch does not cache invalid
@@ -584,7 +586,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
 	 */
 	while (nr--)
-		local_flush_tlb_page(address + nr * PAGE_SIZE);
+		local_flush_tlb_page_asid(address + nr * PAGE_SIZE, asid);
 
 }
 #define update_mmu_cache(vma, addr, ptep) \
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index eed0abc40514..7c2cd5cc92d3 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -15,6 +15,11 @@
 #define FLUSH_TLB_NO_ASID       ((unsigned long)-1)
 
 #ifdef CONFIG_MMU
+static inline unsigned long get_mm_asid(struct mm_struct *mm)
+{
+	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
+}
+
 static inline void local_flush_tlb_all(void)
 {
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8404530ec00f..73c226f719c7 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -110,11 +110,6 @@ static void __ipi_flush_tlb_range_asid(void *info)
 	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
 }
 
-static inline unsigned long get_mm_asid(struct mm_struct *mm)
-{
-	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
-}
-
 static void __flush_tlb_range(struct mm_struct *mm,
 			      const struct cpumask *cmask,
 			      unsigned long start, unsigned long size,
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
