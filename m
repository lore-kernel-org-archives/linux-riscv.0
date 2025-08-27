Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D4ACA0EFF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 15:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQ0H259cakSkgnOEfh3wfLf09gL6ihyttiwwDb1JgzQ=; b=ucCm97n3EP8k9C
	WeOGCl2hNQIEJufMUTC5nEJjXv70maAYL/f4i261ihCxWxNfLtNkb8fUwORAU9hVTP7gifCUjLyq0
	6ETmo7Af/HCOLExPi4pgDitgxMgHh1/9V+Pg2UsxqIXbjL/brtqC5WFLeSRh2ZjPnsU9OKUJYelfb
	8LW4fgzYPdf6uNODnwEI1M/3P5a9KWbE3Dd5VEi3qt0dacQzNFa++rUvVm6C+zCosVlYzh5wxuxOg
	rN6KI9E4RtCCITwj/FzZkQZoD1NxsoAdBUKod4aY66VMNPTpYWYqkQWUOWzI8nUf3kfDdXiGWz3u9
	z84+gv4z6S4GyFTdA9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urITZ-0000000G3s5-1kmx;
	Wed, 27 Aug 2025 15:54:17 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFzN-0000000FXcs-11yJ
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 13:14:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-771f3f89952so773238b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756300496; x=1756905296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLolE06gtjbWk3ZkrQiU7O1WYGsW8aCemQeBBGyQyek=;
        b=EMzJAMnQDbAx+Oll530ROitkHuk+bwJnXnxkunxPpR+9VH4UsfMwwNc5FzkDQ8Ntpc
         vRxtPdXNvPfs18+u1833nN7cdDz/+u5865RTwkYyopdQDKwTxGDv0r+23DDQGI0m8Ww3
         PbSywUVnvqEuZrmppSTStbqV6H377qrvS6Mr62Sybc2zf0Ep/m1qFur9XQBcsEj4Zxxp
         Y61EHyJmGSUlomfTeGsR/xKw8SWVadb5h8HpfBTIBQGZ2y3/yNqPLIsLjWajryP/FSDt
         I0B4idyqyjYTwFHUvDs1SoNRX8lP7qgE44hEmr7uB+qac/skl7+WuJp9UMwycbUpMTXl
         3bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756300496; x=1756905296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLolE06gtjbWk3ZkrQiU7O1WYGsW8aCemQeBBGyQyek=;
        b=MTp/5PKFEegfHKatlGsTbU7otuGhnPSHzAuehMzVXWQO2SPs7DnBqzlVZkuNwfstUy
         vfG2GlgnTYyFI54ztNS3hwr8OEBNJwwpgm7BeZRfEn1fiEcKHJVVsXUZQDzPNa1QhRze
         6iBiASZFJ2SCDqiR73+oBG8Sqjscv3oxFRn7OKP6UbZc5zA2YGsK9BRAuO9ibz8cNolI
         bZcvpHUmszmCSucq1YwnNJo119+u9EVtM360A6i7IXpRi2xM3jRH4B0O9Vk3abnqFFSh
         lGk5G1pN/Zx3U7Jc41BOmN14i/ve4HXGPDfecYrgQ750YDIh5F68VTk19wcJWVOrjlph
         9WtA==
X-Gm-Message-State: AOJu0YyHBNe58LY63HQnoOZcXTqaoX7DKFvEC3AY5U0gsgwuMHd7rfoM
	U2if0F9kw0uB5zrigljzUi1pwyz9wjW1CYuNe8cJUrbZxHFcq9TH4z6pidUV8/kg82E=
X-Gm-Gg: ASbGnct3lKXjsAlBrdJ0ekJ9NgtOpnlbAA+lADc0yjog5qQJMkyPFLzM4ycUixGUZil
	x06g9KFRU223zyqY14sGQ5GASprR+lEoP4W2HZQWbLxYVwlQkXfFF8m+kRoapxDZdxelmBetQ9o
	s5pTbT9YSZ2befzzTkmial/QGARUowJ4Naq3Cborak7ypEA3owyibxhHMdU6RyxMMG8UZNwovpQ
	bShH2j8/LSrMMM29WpLVSYAutwtLhEMyJv6YQO6Sck12LiAY8PbUcN7n7gRgONPOgQ9NKzr5RdR
	IXKMd4TMsQYA82sRcWY5B6WM/Ep1ApsHAwRsuB/18hDUdjpthAv2s/Sw+qbqSadvQAX4VpcsNy6
	ATeYaXamlnbet96j8GCUfTg3DaIWAIGpy0c1+uWauEJUipzq8EeEywSIRF20rxByh4yNuaWZ+yZ
	MDNaUl9bbbioty4AVAjfCalZ4unEsaT8guVbbf1csEe8E=
X-Google-Smtp-Source: AGHT+IGftdTOYF6nz2F5q8dhfpn+4AbM7RtvMhIPeiys1+oPjBs4p7djASEQc/d8Vhh5vx91SCurfQ==
X-Received: by 2002:a05:6a20:12cc:b0:243:78a:82d0 with SMTP id adf61e73a8af0-2438facc6aemr7067488637.29.1756300496326;
        Wed, 27 Aug 2025 06:14:56 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772017f538esm3172443b3a.21.2025.08.27.06.14.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Aug 2025 06:14:56 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 1/2] riscv: mm: Apply svinval in update_mmu_cache()
Date: Wed, 27 Aug 2025 21:14:43 +0800
Message-Id: <20250827131444.23893-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250827131444.23893-1-luxu.kernel@bytedance.com>
References: <20250827131444.23893-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_061457_287195_1BB800C3 
X-CRM114-Status: GOOD (  11.48  )
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
