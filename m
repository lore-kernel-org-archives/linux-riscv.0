Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D389C61D98
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElsvYYAffHA994l7YOd/Ci8D03rLSidKN4QkGybUrLc=; b=SbMMxdB1/PUrz+
	K4ONqqdkXqGPYsWP4HGVJ62XAwaKpRmeluLBab27M6PKAsJii5TkFXISBUFBDI7TqB16chPplxaQG
	ENlVnrqPqXCUiMQjawqhvCWF9lMCVuTI8PgK1b2zDqPqsVytMjn8Mi5MOWNDuqjC0QTcTroGbL+/F
	9cZAdCVwUZP477lf1808FJ9kaO8kHTxdN2pwutE2PBwIyyEX38awJoQJd8FclpPeY5UIgfhVjUc7g
	9VUxJTFeU7HmX4NPq/1s5rXEVMm+uRDpuDzrwrCj2XS935/roldixuoGZFHZKI5QV+c6pIF89Dlpr
	09P0vmsEGl0hqJ3xnLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bjA-000NCv-0c;
	Wed, 22 Nov 2023 01:08:28 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj5-000N94-36
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:08:25 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so4763528a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700615302; x=1701220102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsEPuyPCg+yq6nUonOiNDjvoYO+XNuK3/GzQIQmVNGs=;
        b=fbvKluR0YmdoTHESPrEEhRNqzS6TNSi1yviu/GDlf6aQhDWtb6VP/g9pJHyh+w2dbO
         vmDF7dM+bJICjDE3ns3FGuHtWZdXiyjnm0U//8IfKJJkitpwHnOGNJ9vI5xZqEE29OTY
         JVGBcgFj3a6iPA6I5VMCQPrIubXccGUygdwgrJwRRzgvb7Dh871GitrxAT3RZcPO7p67
         nf6svjUy8Hg5+0gn6o2M9SCxsNGkfYQ+Zl8iY7Jidh3gtqARrRnG2zDHDUJAJ1s+Zq2x
         0KJX3uPttioz+Q2HwtotVbm+ghRcXFHu3OpQEvEo0GZ/W2hx+iZWnzlIJwl6m3ldSn6u
         EzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615302; x=1701220102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsEPuyPCg+yq6nUonOiNDjvoYO+XNuK3/GzQIQmVNGs=;
        b=EAlSVamO9XjU1YR+nVg7HPNcHKsn1GEbpM8nG4WdT/BGvdmFl1ljR/mwivn6Q35wkl
         kkSKVdPBqgIRe4XeNmADT23tIjzT1wi0VFo2Zj2WFSpkqA7tieUpI8XNM4APLyrKzApS
         rYp3QID2GKLSl0Ha+LMbalGmi425BFIy26+DzgGh/q2uiAnAEUUPBeLR0dQRUajWWBXg
         TPIm6xsJg/VxujVkEbTwPfhjoh++hpJgLsZfBrntFdLR6xdhwRmZ5hWQg/y6e3OmrV3j
         CIyeUnvbPX5rJoRKhoWog9xDvJKHK4OG2gpp1mDAZY7UlJDf2zgl7gmoOmsEqcFhJWi2
         91RA==
X-Gm-Message-State: AOJu0Ywu6LbDIyT3a1V/yKydPEdzN2OS2lpRVH6udEGAGPnle4Rdc9TQ
	innSje5C0WP6PoA5QZEihW44SA==
X-Google-Smtp-Source: AGHT+IF7ribPLGqSLRhKn+k/5RoFarRyyKm41YCW2vHm9TG9JHEkBRqiRle7Sp7LVXO54oVTBXbYlQ==
X-Received: by 2002:a05:6a20:c6cd:b0:188:75c:e69a with SMTP id gw13-20020a056a20c6cd00b00188075ce69amr779809pzb.4.1700615302563;
        Tue, 21 Nov 2023 17:08:22 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bn5-20020a056a00324500b006be047268d5sm8713961pfb.174.2023.11.21.17.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:08:22 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 4/8] riscv: mm: Introduce cntx2asid/cntx2version helper macros
Date: Tue, 21 Nov 2023 17:07:15 -0800
Message-ID: <20231122010815.3545294-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122010815.3545294-1-samuel.holland@sifive.com>
References: <20231122010815.3545294-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_170823_998514_C57CE672 
X-CRM114-Status: GOOD (  15.32  )
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

When using the ASID allocator, the MM context ID contains two values:
the ASID in the lower bits, and the allocator version number in the
remaining bits. Use macros to make this separation more obvious.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/mmu.h |  3 +++
 arch/riscv/mm/context.c      | 12 ++++++------
 arch/riscv/mm/tlbflush.c     |  4 ++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 355504b37f8e..a550fbf770be 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -26,6 +26,9 @@ typedef struct {
 #endif
 } mm_context_t;
 
+#define cntx2asid(cntx)		((cntx) & asid_mask)
+#define cntx2version(cntx)	((cntx) & ~asid_mask)
+
 void __init create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa,
 			       phys_addr_t sz, pgprot_t prot);
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 217fd4de6134..43d005f63253 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -81,7 +81,7 @@ static void __flush_context(void)
 		if (cntx == 0)
 			cntx = per_cpu(reserved_context, i);
 
-		__set_bit(cntx & asid_mask, context_asid_map);
+		__set_bit(cntx2asid(cntx), context_asid_map);
 		per_cpu(reserved_context, i) = cntx;
 	}
 
@@ -102,7 +102,7 @@ static unsigned long __new_context(struct mm_struct *mm)
 	lockdep_assert_held(&context_lock);
 
 	if (cntx != 0) {
-		unsigned long newcntx = ver | (cntx & asid_mask);
+		unsigned long newcntx = ver | cntx2asid(cntx);
 
 		/*
 		 * If our current CONTEXT was active during a rollover, we
@@ -115,7 +115,7 @@ static unsigned long __new_context(struct mm_struct *mm)
 		 * We had a valid CONTEXT in a previous life, so try to
 		 * re-use it if possible.
 		 */
-		if (!__test_and_set_bit(cntx & asid_mask, context_asid_map))
+		if (!__test_and_set_bit(cntx2asid(cntx), context_asid_map))
 			return newcntx;
 	}
 
@@ -168,7 +168,7 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 	 */
 	old_active_cntx = atomic_long_read(&per_cpu(active_context, cpu));
 	if (old_active_cntx &&
-	    ((cntx & ~asid_mask) == atomic_long_read(&current_version)) &&
+	    (cntx2version(cntx) == atomic_long_read(&current_version)) &&
 	    atomic_long_cmpxchg_relaxed(&per_cpu(active_context, cpu),
 					old_active_cntx, cntx))
 		goto switch_mm_fast;
@@ -177,7 +177,7 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 
 	/* Check that our ASID belongs to the current_version. */
 	cntx = atomic_long_read(&mm->context.id);
-	if ((cntx & ~asid_mask) != atomic_long_read(&current_version)) {
+	if (cntx2version(cntx) != atomic_long_read(&current_version)) {
 		cntx = __new_context(mm);
 		atomic_long_set(&mm->context.id, cntx);
 	}
@@ -191,7 +191,7 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 
 switch_mm_fast:
 	csr_write(CSR_SATP, virt_to_pfn(mm->pgd) |
-		  ((cntx & asid_mask) << SATP_ASID_SHIFT) |
+		  (cntx2asid(cntx) << SATP_ASID_SHIFT) |
 		  satp_mode);
 
 	if (need_flush_tlb)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 27b3744b5673..23409d70440f 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -91,7 +91,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
 
 		if (static_branch_unlikely(&use_asid_allocator))
-			asid = atomic_long_read(&mm->context.id) & asid_mask;
+			asid = cntx2asid(atomic_long_read(&mm->context.id));
 	} else {
 		cmask = cpu_online_mask;
 		broadcast = true;
@@ -123,7 +123,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 	unsigned long asid = FLUSH_TLB_NO_ASID;
 
 	if (mm && static_branch_unlikely(&use_asid_allocator))
-		asid = atomic_long_read(&mm->context.id) & asid_mask;
+		asid = cntx2asid(atomic_long_read(&mm->context.id));
 
 	local_flush_tlb_range_asid(start, size, stride, asid);
 }
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
