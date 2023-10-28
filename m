Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8F4C0018A
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XbaQwqFVbgzOHWqoTGF/RnM9IITJi/bPg/ei6CudIo=; b=iPSF5GGzq8Y/1v
	IzAjwdRlWpnN9UWFPxCyMr9oXpfhg1DjhXmRk1tgOoz0IZ8JzrF97xCtnR1CHC6ZmK7Rqs1qTSUiP
	reGQ0md1HTUWPiyfg2BCsmQw2KZdmi6gaRwwl+o+gu4MgMUMey+kUq8Kd9x9fbiexaLjQPcbFsgEF
	1KF5btxrDV7Y3PBw65Bx1VB/WL+mGEE4mAEqLsTj0vhkxvlbbtJ1zxyJ4fcLomIDcd2vkOSJXZmuB
	jhN3BruhMhxv2aaXWMaI1EFDmbRdkm4JoxpZ4TxPBqm/+/FP2CW1FWhFCaIQWtoX4EORdBZuDUPIg
	SriVwGK0nNgFaoGRAnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVE-000vaT-0T;
	Sat, 28 Oct 2023 23:14:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV6-000vVW-1Y
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:54 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so3256429b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534831; x=1699139631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq0QdLYJN1f+TxJhAAAn9k5Zt34COvQfV/ogec/O0wM=;
        b=kCMp54Ga45P0QNBclINqmUNESsqz8NIfWZRnvRcHy26WNkaF/E41KUXwqbjYiy+GJn
         +gfC2+Z4YfG5c9QyHEf3khsfeKojt1kos+chpR8pL54WWSeFGKdIKXrBYKorr9qm235K
         +B8qSv41FA7kxv0+iOazuqm4mALw2nxM2TFMIFRDAwHnHudzLPEdd0xfObu/R6mB25Jt
         JPHo3eQNZVHZiqudpsWeCba7TUv7xgCzp8UBWrvFLdNY2v3B0fChpfZISZkurWDIz8CX
         rn9tzjcK9FJRB5o/nneFSwVvYB3NRh3OhldFOrlAmXLtgF/xDngoBaKe/JxpzwHn7dBR
         Idfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534831; x=1699139631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq0QdLYJN1f+TxJhAAAn9k5Zt34COvQfV/ogec/O0wM=;
        b=a0bHgKX28+s4bf+eZg7bx/AeZDuX0tkkmva3aKm9HzFrq12oEu909N45pmw8xbApMT
         aEnArZY+uzCxyu1yR4SXB2glK9sYE/4p6yYsScVAwqjv52mdYa5IIP3Xf9rgdqrVdcv0
         xxykCn0LS3Z05ThVN1tQoKyyG6+eytxekuEdT58jaVRWzWUet+axjQQLlo4Nbx88lRz4
         7tp63bl4ndif5m/Bv4V9//sBEJoLh9JZKf8Uu4fcIrNjwnXb7nYLOclUv+HHQPgUDsXK
         wv2ThRq8KufQm1aaJfJtcJjYtDHAQ6tuDLeqGO8/irKxQNu3C5znijBgopb98NDrZ82p
         h10A==
X-Gm-Message-State: AOJu0YwoPhIeZBDfujpJpfF+eb/DEPfPi8/7vxMvOpkwDCiH/pKfLI7r
	jCNg7gFjhxndAFWLIFj/qlXmBg==
X-Google-Smtp-Source: AGHT+IGqJfNl+X6UXX6MsfY+UkH1b50Ad4rlkkQrptVRUTaYY/ZhDSmvjBpzXH88ANRSqVScovaqNA==
X-Received: by 2002:a17:902:6b8c:b0:1c9:bf14:4f94 with SMTP id p12-20020a1709026b8c00b001c9bf144f94mr6530418plk.44.1698534831309;
        Sat, 28 Oct 2023 16:13:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:50 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 07/11] riscv: mm: Introduce cntx2asid/cntx2version helper macros
Date: Sat, 28 Oct 2023 16:12:05 -0700
Message-ID: <20231028231339.3116618-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161352_551189_D6FDFB20 
X-CRM114-Status: GOOD (  15.36  )
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
index 0feccb8932d2..1cfac683bda4 100644
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
