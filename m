Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A895C48BF6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 00:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0IbOwokXgmxVZaz4iN34hpmtQ2UZ3zQv4QXGOfEgjY=; b=u6Z2atLrF8BLxE
	MRxFHgYY2JyvQzYDczBOO3cThEBwVHaG8YJ1CvNmrK1LF8LjDZmU9PmYrifWq9OpMf1uqEBtZgRYR
	M81t4tdWTxrWzExmtCl+ceCPtfTyvi4r4OIpNSR0tzLgBEflS6RznjMlfcbARwqhvtOzEgwjYFisK
	UfEl8nMcYBb0BNXhYwcA0toF8R17wCW51OaaPyzPW5UhANUHxK1Q4vqUyMMpJqwKPghZxfCL0H+zx
	tx+8XF4KE+IiRHXtLhneUyrpXghEs91GrXUzSuDRcqqhcW35NMNZPIzJdQpFp/4N+FGJfyl5WOlkk
	q0iyj3cfQBQt8rzGhQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfqov-0000000Fkud-20Gp;
	Fri, 01 Mar 2024 00:32:13 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjL-0000000FZxh-3tcW
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e58a984ea1so1084434b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248943; x=1709853743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lukLV3IzObY+fmX3TTuFURPx1t0s+LwQl+LTSkieoBQ=;
        b=ncD/diID9xPBjoJxhi1UzumSLcXd7YhsqbEYTZpX/2hn7GpIoiH7TYsHub1CH38NiW
         aNEIosgMDyiMycFTVAIws9bXWPY7JWwbjbll4+nCx8ooZBuGu3dl2y0SptfjDR2AvBCF
         l2fyaMJX2Ip85y1ICON9XoY/aUQsQGyeyAd+iBUBbvbCLdG4Gh02Z8feR0Jk6YHmkW46
         oqVtx53Bf1QAheSgph6Q+BVZsvolsP0nnv3Ri8jp3HqA4004WlXbe2McsUJXeUdfG7DH
         wIy4p5u5w2ucVtSeJPGJBWLxRHFoBICWZBOXEeoE6mwj/mG61q/ECk0Ni4ZaSJymv4S3
         FxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248943; x=1709853743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lukLV3IzObY+fmX3TTuFURPx1t0s+LwQl+LTSkieoBQ=;
        b=oHL8xjqiVAPa1sKOjYZFcerX6OasGawxLeq3H4QTTOQfdOsXxfQKWJE+ySOy9h4pIi
         fmSdW0Q4REHBNqLsprZpaSIhskmEKgnZr4cdalcUZiQED3qY2bLAa9g4Q1dw2f3FPc9a
         FlTRP2QaAMpy9e3Eu1ekq3kD8sOt8G4qx7UBNj9O+xPLoYjqPUirPEzCwdrU30vpmF1B
         I+GoNG+NDcEOLdPbSXQTuylnvNI4RFxTCtCJPu5jLbAiynDGGdEWeGotVRzETAg877UC
         zZ766s7skHnOdLdR/7RqemVVUDMsKSSfGV6Lg4KYetUGLrCSyCl3xUHK5lg+HAroIy0L
         5GLw==
X-Forwarded-Encrypted: i=1; AJvYcCUSwO8J4mwidA5vtFKpntjGutioswlo/dsWa5VkatNb9i4iOv/M0A2LBukigjYqaKnRb1qVa6ksByr/lYhLpVg0LdtpkDwBNDwkgrSr2L4Z
X-Gm-Message-State: AOJu0YxKRYNOS4g5SyTsUXXd3DbEPNK2GL0dfgP1GRPXwWlsYx25y2XD
	4WM6Z+re7flJP3pzrGjCYU/koTxc98MCJ1CnUH8lkZ9F0f0Xi4RNwlI0MIGAvUEyFABaz4/Jmpl
	r
X-Google-Smtp-Source: AGHT+IFn2rYTQCqOuHVpuGhcF7BC7asS4ROedWcgIAd4N2h6ux4X4gjzLV3woCw85UyqGNmjtKX//g==
X-Received: by 2002:a05:6a00:1955:b0:6e5:5116:2cb5 with SMTP id s21-20020a056a00195500b006e551162cb5mr172054pfk.15.1709248942678;
        Thu, 29 Feb 2024 15:22:22 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:22 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 09/13] riscv: mm: Introduce cntx2asid/cntx2version helper macros
Date: Thu, 29 Feb 2024 15:21:50 -0800
Message-ID: <20240229232211.161961-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152224_244260_FD3424E9 
X-CRM114-Status: GOOD (  13.78  )
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
index 22870f213188..e194e14e5b2b 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -109,7 +109,7 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
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
