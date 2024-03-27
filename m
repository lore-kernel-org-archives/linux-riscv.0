Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA8FC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfhbttmgTnNPQNXrbqm4JXGtDLTolvJcRITkJmJfhEM=; b=u89/zK7IBUaR6x
	Q3QcK391N6DmhVidBSlfGhwXFP4yZGLw36tnUOpRbZorR/PGXeh7h2P+PJopDmLOAWSxuO+OeJLbf
	pVj5nywhy8ys/dn8J8yV4pEWtmzocmr9DrC0YESOcTE/SFKcGkurfunbErYYwWvGXtr/dBkyJCn/x
	d/vvyqhlvzbPuYHNuObvYw9m/KzTxkyAOMkyxA9VK1rlIB+84BHU3Rw73NdZUaV83urIeOdnm/ah0
	bI5uRMCkfJsVW5ST4jzyuHy5wAOI7HnhiavDzlyvhLB+aGNkqeV6D+y5+mBKXvFZpyNosqOt3TuHj
	IUNMQT4nwHgJXfFdywng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFp-00000007SQG-3pYm;
	Wed, 27 Mar 2024 04:51:13 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFa-00000007SBE-04z8
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:51:00 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5a58009fe88so511982eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515056; x=1712119856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OOp6ZEyIwMU5OnG6xTEWcirae/pY2nPqfU9WqSousc=;
        b=HkwhKZLzRbsy2sQOljdB8PmViYtNG3McbyPyc8S6h2x36ovWfIQZmclBh6AHbJ1vR7
         L1DLXtpSZczJ194DtUycNzGTtwy3NWf5gS9AQrjvDmmKz81HX8Pk0cDC8GcPMzsuYub3
         ZsJk6cvPg3VTohlYozx2cJCU2Q/kG7O0Go/uo04nSEhuHwv9hPEqGXclIFdRC412wMe1
         9JPmUNfeq0xwgHeRxzkyt3X35gxR16KZEK9lxWpGc9hQlIQKav3fM66cbLl11thpBAre
         JPIFtcTL8erFFUDdQ2Ow+p9K0p1wwp3zTL7SUVWoFHar+TMjh0u/VxVn7YCk1uQ+IKUu
         6BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515056; x=1712119856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OOp6ZEyIwMU5OnG6xTEWcirae/pY2nPqfU9WqSousc=;
        b=XdaUj009/rlQ93HjWDO/Ua3e5PSg4xj5crb1tHjlBJlyOZtJUJJycIOdA+PS6HxhlZ
         vYm1T+WemwfHLQiwJyNH1NZ4C/1UqHvcLdQ5QB0BABQ5FkvbNs+ru2dJXbyTyTEb+hNh
         J+KR2HLehcppjjpLU9fkC74kgnNyjBWLr3LlCwrFfq9Fzijz/BTq7OsiUqNx32oXIEKO
         lCD4QZZCpITAXHrQr6ihTJGi32wy+Ocwz4XxEWf9dTufr4el04DPtIrlOLhjjjoeWhL7
         SZJT7DYJ1KZx/qXOMpVtfRi5ikSZIWXgtFQIXpXgAaEIISgFu714yFE4DVFlgpKc6gdn
         aPmg==
X-Forwarded-Encrypted: i=1; AJvYcCW6EceSwc3N4j/NkvNFbdgYB57xnzWhVa3+Uc4o1ZL+bMcTj7GFPFZ58A/4O2p3wF3uP6AD2TiK2Gd4oVLpWZKUdYZBWyhvajt7cIpkZvwX
X-Gm-Message-State: AOJu0YyKWoSM9rI6484TQNfnzOZf2s4bsxpn4rjBRL9emIzWiEnhfMT6
	uOGIfOxtGrg5ENF2nLKWgycOpt8Xe6mbhY/YxOW4KMo2xzpYnsh6wnuhtPIUipY=
X-Google-Smtp-Source: AGHT+IH2eQoyDSJi6zqBjW5QAslrBjHf9N1FFSb9F+mmhA++Fk/xLCVtnw/qNQbwZOYB8ND1BkvynQ==
X-Received: by 2002:a05:6358:7584:b0:17c:1e6c:14c0 with SMTP id x4-20020a056358758400b0017c1e6c14c0mr311341rwf.16.1711515055737;
        Tue, 26 Mar 2024 21:50:55 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:54 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 09/13] riscv: mm: Introduce cntx2asid/cntx2version helper macros
Date: Tue, 26 Mar 2024 21:49:50 -0700
Message-ID: <20240327045035.368512-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215058_297581_F71C7450 
X-CRM114-Status: GOOD (  14.28  )
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/mmu.h |  3 +++
 arch/riscv/mm/context.c      | 12 ++++++------
 arch/riscv/mm/tlbflush.c     |  2 +-
 3 files changed, 10 insertions(+), 7 deletions(-)

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
index ba8eb3944687..b562b3c44487 100644
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
index 18af7b5053af..35266dd9a9a2 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -110,7 +110,7 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 static inline unsigned long get_mm_asid(struct mm_struct *mm)
 {
 	return static_branch_unlikely(&use_asid_allocator) ?
-			atomic_long_read(&mm->context.id) & asid_mask : FLUSH_TLB_NO_ASID;
+			cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
 }
 
 void flush_tlb_mm(struct mm_struct *mm)
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
