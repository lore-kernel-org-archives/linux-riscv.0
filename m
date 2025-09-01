Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0E8CA0FF0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQ0H259cakSkgnOEfh3wfLf09gL6ihyttiwwDb1JgzQ=; b=cjU92/58m4/uTk
	HzLXqu8yxi+iALn3DFZKNlaskNvv5R3qB7MYr1wktPW7KuZ+sqXXp6dEzmEHJt0uOsCJ+ZNu94POO
	P7k9PAV+9+yfjWXKFZzs/dP0FpaqjSI/QvTwH1rqpt5Usnk9y96HNW3su5VfGNQV2Fot6ZwC3vlZX
	2Bn4s6YkTe5ckRxBsRNkpAnuptAh5+97EISmKib9J5btfz6GCz8XfWmmSe9C0LOzlIdQ8iShTrN/k
	MqxvFovnmDZsASbJqIegufLH26oerwXik2b0cl5hxPGJ3Gdgo4bKpWUPN7P4UopB1ViiFwiSfB32j
	l7Ex3je8KClg3ZiU8+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uc-0000000CkKB-0k4U;
	Mon, 01 Sep 2025 13:49:34 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2v4-0000000C5gw-2rT0
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:41:55 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24884d9e54bso42119235ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 04:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756726914; x=1757331714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLolE06gtjbWk3ZkrQiU7O1WYGsW8aCemQeBBGyQyek=;
        b=GoUPhxAG9uLUty4fB/VwtXfjvr63J0A7FhTgl6GgdDCX8QtebWZEFIRUXJJCS8nynb
         rWKhalnnsQiZ0FQBvMwmLUBdob3cr+vFOX5iH3t9hfjDplbqkqCkh0DjVZIOSmTP+2KW
         Cxb5SxW9cI0blTuO9T+kHVY47sBVJWKxagGVOxDw4x7/igk+7hpdfI9jmuI44MvFMNTg
         HZolvBHMT1IY9FDGu/Y7PB2ko677fFv86gKtog3Z5O+C3UN9be85OQWPKqx5PV0moBcu
         1VVAKvPZKb+dTjjCMWv8VuIz+M3nlaoimpRS4bzqgka+GFPq9nkun2ZhPJilKYk4fMdD
         A1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726914; x=1757331714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLolE06gtjbWk3ZkrQiU7O1WYGsW8aCemQeBBGyQyek=;
        b=gk2aKWq+HIhtIM058ZZDRlrrQh5kMW0G8tWdRMu+PKnHuQgzO6LVAH6BBHUYKeLnCG
         OKVqe/zk5Mm2njecB5g5kJ1UfRQ4XrcmHCBRU9QuXjoWGdMRj5w5RTLuN91+Ff4Vfkjc
         sxcu+qR7PIuVTUlp8FZuxQATa/ztSrw5Q61HdgC67gxwlsSkFoBCFYK98wXIgld401MZ
         8e12mGIxJiCkvnEDEx5Ql7ODnJg65Xxjv615my5xsjYHzEoEZMmGQqqVIh4RIomfW5D9
         ivdWctiiOxWQwsyy4R/sYCll+GotmTpEPdRlWuO84FotNqad/dtwHkgXr9w23GhLh27y
         /+fA==
X-Gm-Message-State: AOJu0YyBbPg97LBllGxKhDDE6innoQQi6lY/PEeJsrymGhBA1JbWO7mK
	P1+6dtZpAN5ahUaoER/4blpqULK0R+fWP9neJ1ehG6SJTkixxGN6osqX+hUn4m4FWhc=
X-Gm-Gg: ASbGncsp4IW18gkbUa9Q1zMAN0FBys4Cwccp9BgMUpDted8dMt//lOd2dVij8VAXCmO
	p/r1QxZfjYY0Gqodud6ExDdrFLCI4Kro9oR6aG4OxV0xcRaMfe3yxc1n8C7QhIlPhxy994wYM76
	31Cf93A/k8sjpm3pSzplaiLTa9DAOrNhU8bCqdhVqC5AeGksImplI4pX7KPrvo2U9cDSr7bgYbn
	7/loI3z2KYf8r27msq1F7781MIxnaaIz/Jhlz9KfJaKvef8FYoqpwdO+NgMZvk+sI9vu/9+pSVk
	i0oAN8T1WxdS1Tytk6ZUJnB4kssbizUDZQrxpqRn36p9wvZf2qGS7NEfhlJKcDvL+vc7SbJtQ3S
	Bx5fRLj1eOth+hizYwr1kteRhZQT20t83/sPLC3OdgIH8EiY+pv6nCBCoC/8kE9BSJP2tJ1xlhj
	FbzweBhXXa+uEU2X+d4oe2jK2ZbUeHJXsWMnE8QNEonY7QgPL9icSydw==
X-Google-Smtp-Source: AGHT+IE0gpMY+RbD+bbQtAxSuQoUme95REJGQ1QUPydfC5VbbDQitYO6UEhOO5n3dpTz10zYDTEtww==
X-Received: by 2002:a17:902:e74a:b0:249:1bd6:8a2f with SMTP id d9443c01a7336-2494486ee08mr115512295ad.3.1756726913831;
        Mon, 01 Sep 2025 04:41:53 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249066e042asm103147055ad.146.2025.09.01.04.41.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 04:41:53 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND 1/2] riscv: mm: Apply svinval in update_mmu_cache()
Date: Mon,  1 Sep 2025 19:41:40 +0800
Message-Id: <20250901114141.5438-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250901114141.5438-1-luxu.kernel@bytedance.com>
References: <20250901114141.5438-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_044154_721370_3892F200 
X-CRM114-Status: GOOD (  11.54  )
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

Only flush tlb of the specified mm, and apply svinval if available.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h  | 16 +++++++++++++++-
 arch/riscv/include/asm/tlbflush.h | 23 +++++++++++++++++++++++
 arch/riscv/mm/tlbflush.c          | 23 -----------------------
 3 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 91697fbf1f901..165cd02d51629 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -495,9 +495,15 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 		struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
+	int i;
+	unsigned long asid = get_mm_asid(vma->vm_mm);
+
 	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
 		 : : : : svvptc);
 
+	asm goto(ALTERNATIVE("nop", "j %l[svinval]", 0, RISCV_ISA_EXT_SVINVAL, 1)
+		 : : : : svinval);
+
 	/*
 	 * The kernel assumes that TLBs don't cache invalid entries, but
 	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
@@ -506,7 +512,15 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
 	 */
 	while (nr--)
-		local_flush_tlb_page(address + nr * PAGE_SIZE);
+		local_flush_tlb_page_asid(address + nr * PAGE_SIZE, asid);
+	return;
+
+svinval:
+	local_sfence_w_inval();
+	for (i = 0; i < nr; i++)
+		local_sinval_vma(address + nr * PAGE_SIZE, asid);
+	local_sfence_inval_ir();
+	return;
 
 svvptc:;
 	/*
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index eed0abc405143..9636d07fe9eed 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -15,6 +15,29 @@
 #define FLUSH_TLB_NO_ASID       ((unsigned long)-1)
 
 #ifdef CONFIG_MMU
+static inline unsigned long get_mm_asid(struct mm_struct *mm)
+{
+	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
+}
+
+static inline void local_sfence_inval_ir(void)
+{
+	asm volatile(SFENCE_INVAL_IR() ::: "memory");
+}
+
+static inline void local_sfence_w_inval(void)
+{
+	asm volatile(SFENCE_W_INVAL() ::: "memory");
+}
+
+static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
+	else
+		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
+}
+
 static inline void local_flush_tlb_all(void)
 {
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8404530ec00f9..962db300a1665 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -11,24 +11,6 @@
 
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
-static inline void local_sfence_inval_ir(void)
-{
-	asm volatile(SFENCE_INVAL_IR() ::: "memory");
-}
-
-static inline void local_sfence_w_inval(void)
-{
-	asm volatile(SFENCE_W_INVAL() ::: "memory");
-}
-
-static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
-{
-	if (asid != FLUSH_TLB_NO_ASID)
-		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
-	else
-		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
-}
-
 /*
  * Flush entire TLB if number of entries to be flushed is greater
  * than the threshold below.
@@ -110,11 +92,6 @@ static void __ipi_flush_tlb_range_asid(void *info)
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
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
