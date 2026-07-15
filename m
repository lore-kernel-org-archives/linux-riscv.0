Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4BBC44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRdXyxI0WNHlCrv+VCOnxcoFd0++bBtk+8zJnXR7p+s=; b=Znq8Vnnt32Qf+y
	/9VDVqxMWMauuM8XhAo2Q8qqE2A72UOQk50S6CIcluFIDVh5DkRV/Wxf67nN0yY8VJFcfySEg9vbQ
	dK3PSayiP9xsyCHkRGh+jU+ctSn+ASGoVHTOGivz7C/27tCu+LA7MKHXJ/UsFJJOdH7rnwuFX5hFD
	1z9lATW2AfpYMZlWhHjDjiCF0pZM0+881nl9pEOtPf6GlBv8xpiQqY7kqskB7mqK0S2ASu7WpjZ01
	wNUgGWriV7e+2uF1cRXwd54u1Ddoo+4vT6YYH/sripF1eMpbt19VNTde1tg3w9gSVXqyF6vIgPRMg
	QE5oT0uMj7goMb/ausiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzXJ-0000000EvBL-0VcO;
	Wed, 15 Jul 2026 13:20:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzXE-0000000Ev9A-3fSE
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 13:20:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cad8076b01so64603725ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 06:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784121624; x=1784726424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0419pZYviwlgi7RrpR+vOHIO7im/1AWoluL/ZKMJxE=;
        b=V9tvWsg+xP1IFRSWZLgQiG7IXNQ9aSdteR26Eowf1Dod/ozQWUL4Aga6Vy9ePA65F3
         qucYbWAqPJUBac1FQVXIuBNLYOdvwEsGdObrRNdZLx2uftnF8hNytyOqiSzuNXHmJhDx
         eRx/Sd1uLteIsGVXk4M2jDYkQCzyPO0GWYjJH9LcAc07eMb62Hz4WMbWFglPbhOFPwwT
         CsSmqWENX3BD499uL57h2UbHp3gTA69EmBq7e+B8wGP8WCUhf2X83XpQRlWEHlOvyyBk
         E9SzNL/iijmZvCp/Tb1ByWnli8YqTX+4GZuR4KFV6qPNUUyuwAc3RHQmWLhyxjmquiWV
         g0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121624; x=1784726424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0419pZYviwlgi7RrpR+vOHIO7im/1AWoluL/ZKMJxE=;
        b=eQDA7HE3Z3pOygmNVLkna5HGru+fui0kR9TcNnjkpBOMtTPqPnStKB8EI8wMudLPuF
         U2uCg5O30KDWJNKmP/sn9Ox0HT5LF1a3AhWwvOqt/m2bMi3lG2noCGavj1DfCcKOpGnq
         MhLmMLW7PmAha7t7e4GxINnbS9Ulxn7y+vgRQkCbAGDCwzJDZ+LB3muLCZIVcRO8h5qv
         Kl68cziZ30OBPC3R6gdguTM6A8oEqqUias8nQkE4nwl/DpWxHAaeuaktK9A4wv0YEdzO
         +snkvHa3SoRLXoXJJEjC4ImmUcoxJVqk071q01Z9cgiHwjsTGykrCTZmKAq8Fu7rPkfz
         4hJQ==
X-Gm-Message-State: AOJu0YwCnyCpIdSZ187IV3mrymVl3f3Wuyt3c/wDeg65R/L1zKX2k+bI
	NKHmi78OiqyMnqo7O9eOJocbFWoiZh2ziV6gk3sojZKndW1pd6PZXD1MOpipMPCm9BI=
X-Gm-Gg: AfdE7cmduCmrnE27hGK0B0cRVNqp0wqOTKkiRZExwprGgtfxDCMHweQF4viAoKwFFZD
	SbdHv/mWlH/vdNhmdaVnERsboXHURW+FZAGF/Nq4iK05lhntX+3tXeNeUQOVdAF3/BUCABnB4ga
	H2w8AZkbmnGjkEmMrz1CN9Wt0NYFhJ2ugoiiu5oRwAQ4/NkhPZspfIXSyUMmlhUDtpwPDzUwcmp
	czjX86Y1DeQEgXOxBn2GJdKRnIV2+Xp4lMZUdttxnQbEVZUy/lUp1DivwiS/SZNcCV6DJA3w6YU
	t7Tcln0/cZUM/q/S2gK2kA8mzmNUAbW2oPCRXifRKRBcAwBt8n+SgocLfJD9D3F6GZfsO6pab5D
	MVsLJvjQU6GQg0YDhZ+Eu5XoUpOFM+E1UXYXYQaTjG8I0oUrWGRriSLkGquo3c5OoEhtVbE3M+6
	51PhlKH6KTfS6fbOypMAruDyy5gJzXIan92Nb0A+JPGigvklk9TZfoiehu6Wh7D/xo8H0BMVXaT
	FZgaK0xwgTb2hh1MpyoGlSYDayOzjJxaY/SAUyH/6rs4w==
X-Received: by 2002:a17:903:1b25:b0:2cc:df15:91de with SMTP id d9443c01a7336-2cee9bb19b8mr80986835ad.42.1784121623726;
        Wed, 15 Jul 2026 06:20:23 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e42c6sm2465085ad.9.2026.07.15.06.20.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Jul 2026 06:20:22 -0700 (PDT)
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
Subject: [PATCH v2 2/3] riscv: mm: Apply Svinval in update_mmu_cache()
Date: Wed, 15 Jul 2026 21:20:08 +0800
Message-ID: <20260715132009.10634-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715132009.10634-1-luxu.kernel@bytedance.com>
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062024_921855_7D4C9DFB 
X-CRM114-Status: GOOD (  10.47  )
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

Use Svinval in update_mmu_cache_range() when the extension is available.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h  |  8 ++++++++
 arch/riscv/include/asm/tlbflush.h | 18 ++++++++++++++++++
 arch/riscv/mm/tlbflush.c          | 18 ------------------
 3 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9926556099ae..823805cc465a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -578,6 +578,14 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
 		return;
 
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
+		local_sfence_w_inval();
+		while (nr--)
+			local_sinval_vma(address + nr * PAGE_SIZE, asid);
+		local_sfence_inval_ir();
+		return;
+	}
+
 	/*
 	 * The kernel assumes that TLBs don't cache invalid entries, but
 	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 7c2cd5cc92d3..9636d07fe9ee 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -20,6 +20,24 @@ static inline unsigned long get_mm_asid(struct mm_struct *mm)
 	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
 }
 
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
index 73c226f719c7..962db300a166 100644
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
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
