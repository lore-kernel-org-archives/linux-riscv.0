Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32059C47258
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUutasPFwWnVEO4GtxO4unoTMRmmUpK1GEK3sK0f4fA=; b=P3yvX+PYA2IgYs
	VbVLTWMqrinmE3socZ7TtrtKDOlDwb/vBuxVsIyg4rmvD60jLq5UT11PfHxckcBUVjClpvQKTVbWh
	djahBbCGw+g8VxZgnXc0eCWpcYO6fNWQEznrI0WXqJeICtMbesS+y2O/XS6oGDxVef4SypQ9BfqO6
	e6VWsQIXaJ/1maPdJQ5+QSmtuDk6ru7F0xt1FOKixsn1uixqDEce8k7SPd0QhBTvtB15biNxPQw2h
	5I1ZwSGqRLJKZb+8bsWyd9e/Bt63ZBaJphSk16IVdzgrf0wmjbjIDmmYGJtN6fD4jtEHqwVMvglxX
	uIkiO54YLvhkAnDepe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpb-0098Wu-2D;
	Tue, 02 Jan 2024 22:01:51 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpW-0098S8-2T
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:48 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5ce942efda5so1210830a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232905; x=1704837705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7sRColwM16ZDpkHsKhbx/H1UjX1V2ZP/gk6hKZVk/k=;
        b=EOtzAXUVdwmViT4+Zy3az9nK3rYPrvCNv7Rp20/1SF7P+QiLvApnUyFMpDuwaWweMV
         ngdc6IS5sfOhYWURLZZOPtl/MBlxVXIYiH6UqyVVkpnCB1Ld6k8oEBmJNNu/zNUgIutx
         izCGslPh/83XnOEHz3v1uTotwadkQZHODIOG/17JV9W3bqAX/25ftk9jOJGLbkrWzya3
         OzD+jsf3KfZkK+eKJnV/h3iLXfsyOtbbSjZEkGxBncWtST0SumW/8h/4aVaXywXuPbSG
         I+NCVISxSbIGcAGi1CSly0kP5yr+LQsb3HoCe8lXK53zjVygTAqNb7pMNY7iS2BQXx7F
         gucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232905; x=1704837705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7sRColwM16ZDpkHsKhbx/H1UjX1V2ZP/gk6hKZVk/k=;
        b=ZJ8B4me/X1asOfSXpyS3ekVKAK1lS4sAoq1+3vfxVQ5LEtn6UDkb6WW2yBIhVER9eb
         Ea4oJcFQ8A9WZ6C7IZ/+lc+cywAS9nvCL65rwzTAKSmBLaTmcCrelPXRrDUL0z3F5ToS
         IpjKiIkcA/pfBps/k6tYLEkP0A03gR4y4SmWwf+ldyrabdLqmoeSz+odk8Gga4oSSLPy
         2N4QbAu7rpeOffHc7mmo9xRDYGQPwG+IWBT9Ymy8zTAPOHJTyP20xRNiFw2Mw7jqCmTG
         CtxaWXBUefdqa5GG2oFnDm1SPahsjPXvUxkKmOJtQKUqcHP8yMuDt+t4y74e9wWw8tz2
         rnoA==
X-Gm-Message-State: AOJu0YzxknBNez2LXU2SMrzNcpqa1uG1aijd331RzTn1Vv0wvS3fTsqH
	EhRdePGtCbG0m2s+tvTk+aFp3Nwwc03/0Q==
X-Google-Smtp-Source: AGHT+IEo3bZM2aLuSMOGwMaVus9GR4XwWujHLJvE5N9ecURPZ+yptZqxQ7nXUllBGYAXlfndapu+WA==
X-Received: by 2002:a05:6a20:a107:b0:197:2fc0:7e25 with SMTP id q7-20020a056a20a10700b001972fc07e25mr2866566pzk.3.1704232905452;
        Tue, 02 Jan 2024 14:01:45 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:45 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 08/12] riscv: mm: Introduce cntx2asid/cntx2version helper macros
Date: Tue,  2 Jan 2024 14:00:45 -0800
Message-ID: <20240102220134.3229156-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140146_817892_19FF4871 
X-CRM114-Status: GOOD (  15.23  )
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
index 76b24d4ed4ab..5ec621545c69 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -85,7 +85,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 			return;
 
 		if (static_branch_unlikely(&use_asid_allocator))
-			asid = atomic_long_read(&mm->context.id) & asid_mask;
+			asid = cntx2asid(atomic_long_read(&mm->context.id));
 	} else {
 		cmask = cpu_online_mask;
 	}
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
