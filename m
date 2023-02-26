Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3D3C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Feb 2023 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7l7mmCaBw1UBIa3XCByxdY907PbVmyjM31fQRM5co1I=; b=hs4uAVYB9lMiQH
	PuZjhDIqSqtTFhTXeatOUBZVZ9ImURnp3IS+Bgk+UsZUg8miXyyeRBeUqx/ROa4CQs5loCe5RBMGG
	bn0ld4KOp05cAdcwz8glLXxn6cJyPPCydezXv4i9raqyH8dwAKxoyrJd3ZvR31ee3sndN6xseT0W2
	/2FoT+uWM/LFgtDa7UCxxw5u7N0npMFpJ47veyH05xDeUYhBg/buf1CmvKTPCITb9a22i3JNAeCmn
	mT67Vdm1aRR8RZTMuckUkTlFx1eW3cbcbPIl21UVCp3b9FStiQXTsnIjPemb51ze1Cjm579LqGHwP
	a/Bs7LDsPfNTcui2SpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIXc-007UiN-6b; Sun, 26 Feb 2023 15:02:20 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIXU-007UfL-DQ
	for linux-riscv@lists.infradead.org; Sun, 26 Feb 2023 15:02:15 +0000
Received: by mail-lf1-x131.google.com with SMTP id bi9so5349986lfb.2
        for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 07:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AU8fbmkzw6fJ/9/3WpmqHnvxujK+M1whKxViRm0r9mg=;
        b=PtDR6RKJG4wxI5mHCRv7xDve6+yWo2w8RwXvuCokGANC3b1tvnenSHUCDlHR1Bx3D8
         m4dB+zV0p8VeYO5BjwWiJtUD+SYC/SSsLEFuNq5bZxnTrSTjwlnv7CZf6KWWZ0EMCrZi
         Db0vJmN20CHiHEZVFzprEzu04lPD2JHkNyJt78jmUvcEUinSm3kFfyJAZGNbbGtS5tPw
         F7nQm39KjQPs1PFasKzN/cL2IVIJvbTfZOhxV6QB3hRL/ihwhxP2p/Go8YD0CSiQVpx8
         9mN4BWqm8eL3l4dRoI4fmBT475LdtPSBsED3rkwxnX86cztoPiU1P6ZGqAJmBQgXzseS
         vyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AU8fbmkzw6fJ/9/3WpmqHnvxujK+M1whKxViRm0r9mg=;
        b=ZiMviVhLaee0NUpBZFAR6GQEDU8cp+Fig9nBG2kQ4ZGwGy/e/YIFOZV4+Sq+sVWFqe
         uWMYCCvCV7OXDk0gTgaS6SjW6FG4zniiQWAjRLPskpOoJq0FLrTFELdAhYZXt2b1+jtE
         dF0zFCvEdmoVAtJxEXLQ3tU4IHEcS6etUdbPXZQR1SPcnQbmWrU+58GAgkNHdySk3baa
         kddMmo+H//SGdad8JLTQjohp6ZR/+Y5ONGxzP8w3QU1GHm5nw7cgG7WsVLmKXpGlvs1v
         BrY6fzlGa+TkAiQAx1MnFojBxbazS3WRXsO+NH/tTe9MXuplM6ObjuMIYBqOT38ztLlt
         4RNw==
X-Gm-Message-State: AO0yUKViTguEKH2dDBlp6PwLFbmvwqgRMk/1ZRF33iy31Jgaf2OK3blg
	om/ZooUSEG7jCR2MeisX945qmjcH9lmcdcoDLUw=
X-Google-Smtp-Source: AK7set9hBGR0JAbPzigbHaqMspFiDSaFSBYwBSZSE/LcKnWZyxKjGuEPrk+fZeuuAlRKWFSLlwAz+Q==
X-Received: by 2002:ac2:59c4:0:b0:4dd:cef0:c27c with SMTP id x4-20020ac259c4000000b004ddcef0c27cmr1945798lfn.33.1677423721791;
        Sun, 26 Feb 2023 07:02:01 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id z7-20020ac25de7000000b004db44dfd888sm580715lfq.30.2023.02.26.07.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 07:02:01 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Zong Li <zong.li@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] Revert "riscv: mm: notify remote harts about mmu cache updates"
Date: Sun, 26 Feb 2023 18:01:36 +0300
Message-Id: <20230226150137.1919750-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230226150137.1919750-1-geomatsi@gmail.com>
References: <20230226150137.1919750-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_070212_477343_176EB8D7 
X-CRM114-Status: GOOD (  15.33  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

This reverts the remaining bits of commit 4bd1d80efb5a ("riscv: mm:
notify remote harts harts about mmu cache updates").

According to bug reports, suggested approach to fix stale TLB entries
is not sufficient. It needs to be replaced by a more robust solution.

Fixes: 4bd1d80efb5a ("riscv: mm: notify remote harts about mmu cache updates")
Reported-by: Zong Li <zong.li@sifive.com>
Reported-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Cc: stable@vger.kernel.org

---
 arch/riscv/include/asm/mmu.h      |  2 --
 arch/riscv/include/asm/tlbflush.h | 18 ------------------
 arch/riscv/mm/context.c           | 10 ----------
 arch/riscv/mm/tlbflush.c          | 28 +++++++++++++++++-----------
 4 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 5ff1f19fd45c..0099dc116168 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -19,8 +19,6 @@ typedef struct {
 #ifdef CONFIG_SMP
 	/* A local icache flush is needed before user execution can resume. */
 	cpumask_t icache_stale_mask;
-	/* A local tlb flush is needed before user execution can resume. */
-	cpumask_t tlb_stale_mask;
 #endif
 } mm_context_t;
 
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 907b9efd39a8..801019381dea 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -22,24 +22,6 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
-
-static inline void local_flush_tlb_all_asid(unsigned long asid)
-{
-	__asm__ __volatile__ ("sfence.vma x0, %0"
-			:
-			: "r" (asid)
-			: "memory");
-}
-
-static inline void local_flush_tlb_page_asid(unsigned long addr,
-		unsigned long asid)
-{
-	__asm__ __volatile__ ("sfence.vma %0, %1"
-			:
-			: "r" (addr), "r" (asid)
-			: "memory");
-}
-
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #define local_flush_tlb_page(addr)		do { } while (0)
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 80ce9caba8d2..7acbfbd14557 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -196,16 +196,6 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 
 	if (need_flush_tlb)
 		local_flush_tlb_all();
-#ifdef CONFIG_SMP
-	else {
-		cpumask_t *mask = &mm->context.tlb_stale_mask;
-
-		if (cpumask_test_cpu(cpu, mask)) {
-			cpumask_clear_cpu(cpu, mask);
-			local_flush_tlb_all_asid(cntx & asid_mask);
-		}
-	}
-#endif
 }
 
 static void set_mm_noasid(struct mm_struct *mm)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index ce7dfc81bb3f..37ed760d007c 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -5,7 +5,23 @@
 #include <linux/sched.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
-#include <asm/tlbflush.h>
+
+static inline void local_flush_tlb_all_asid(unsigned long asid)
+{
+	__asm__ __volatile__ ("sfence.vma x0, %0"
+			:
+			: "r" (asid)
+			: "memory");
+}
+
+static inline void local_flush_tlb_page_asid(unsigned long addr,
+		unsigned long asid)
+{
+	__asm__ __volatile__ ("sfence.vma %0, %1"
+			:
+			: "r" (addr), "r" (asid)
+			: "memory");
+}
 
 void flush_tlb_all(void)
 {
@@ -15,7 +31,6 @@ void flush_tlb_all(void)
 static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 				  unsigned long size, unsigned long stride)
 {
-	struct cpumask *pmask = &mm->context.tlb_stale_mask;
 	struct cpumask *cmask = mm_cpumask(mm);
 	unsigned int cpuid;
 	bool broadcast;
@@ -29,15 +44,6 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 	if (static_branch_unlikely(&use_asid_allocator)) {
 		unsigned long asid = atomic_long_read(&mm->context.id);
 
-		/*
-		 * TLB will be immediately flushed on harts concurrently
-		 * executing this MM context. TLB flush on other harts
-		 * is deferred until this MM context migrates there.
-		 */
-		cpumask_setall(pmask);
-		cpumask_clear_cpu(cpuid, pmask);
-		cpumask_andnot(pmask, pmask, cmask);
-
 		if (broadcast) {
 			sbi_remote_sfence_vma_asid(cmask, start, size, asid);
 		} else if (size <= stride) {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
