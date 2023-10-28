Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13FEC00141
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJrjgH1YuiSR3F8HtSCWFvLnLkpd69H6BapeNyndp2Y=; b=iLTTP/RjYcBqD+
	4TaDE5+szWRXcwZGAbPkkbqLyY/6zsqXkAGNgc2eQfaOZM1qIuwdvi2rN6SQtRh6fBYXDgSbA55y4
	Y0sHqSBcVQZ47V4N9x8NjMA5awiceJqy2X92f+oVBP9AKNN/RrkjlXY/9WBjBE0jsHA9TJjC6pA96
	39oCCY4Jfd3IyYEtZai/dQLgPWjP7+ucBnF3Eg9MwrwQEbSJJs86fV70q0S6wartfxIwYUX1L/hm3
	Vyr+zM6gqI/Afxk5vYu4MzPDbe687Qaa15joc/jz7BtYgx0uEf3VS3RQTrLmwXaAV6Ovd1zFsx39P
	JSW7PQPo9IfI5blK9iyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVE-000vb6-33;
	Sat, 28 Oct 2023 23:14:00 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV8-000vWg-20
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:56 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso2247886a34.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534833; x=1699139633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfPkHia9ku1mIe8MIuwK1ts/4i7vxeqzbyNHZF4YvJg=;
        b=ADQhDClpmfmPY8rmsgvIxYRNZYK5xa6FgVkOd/Z4WdjS9DQOUd2K17VjS7Al3Py5zo
         q1TOuPzfxMXZmJtMVRSdMOkyTKBaH/24xgMAWIehYVma6pWUXiu+B+G6jj8YgtqGrDNp
         nUfVQZ6kPepSsb6b1+UqP1EuVnHJExVDbt90JqKT4WntsmPRtabPyr4CUpJA+aNBlbuo
         XTSC2lnahGI9HZomJ7H7rH4Rpv8pouq2xUQ+PzUBps/V5g3BrfpG126dr4iMD3EA5JJC
         e3L1j7CMfJAnP3Ccydp1xyNZYwzXkE66olxB/SlLChP/Mx3PKNApyBBlQ/C0c9YA2Z5E
         cSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534833; x=1699139633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfPkHia9ku1mIe8MIuwK1ts/4i7vxeqzbyNHZF4YvJg=;
        b=TSYwVT8LEbnBONvHc6TPhEwxiTGygTPPqpo01c0j7Yqz/VdcuXEUsO60/IEiJEOz7B
         8l/uqWY2evYYAXSV13AE2BcqR8cOUT+m6xa/+UHLLE9yI5CIKAt6i5ncJa6iII9huuvV
         mWY2knNnPxu3uQDcFKLYrrqI1+fU/gcBxNNkM2uRz3ZVnhQkW0rjir+dCZJoRkG5U0qY
         HFCaS6XTQF0VvX12St4hKXmQXNaPATNDh2xNsRDNRAoGa3UtThuvSos0zh03nsHB0mya
         faZSoBhOom9tV84cy4qmpCFBQ/tfdnUzI1KrtLyitc0NBiCyUvkFXQLACd3m4g8FPu1E
         IweQ==
X-Gm-Message-State: AOJu0YxVKVdqoiF56QiZmaOwWhDxuaN9cUdWIylnZWPTBGsfIGx/lFxR
	stmpIa658i4lgLYENS3CIxUIUQ==
X-Google-Smtp-Source: AGHT+IERITWcnpZawWSuuFpc/cjj/Gs86LMrNqv2CdnNpOWafKnnt4wsBVVnxZL60abLMgaX5a0ZCA==
X-Received: by 2002:a05:6830:1e30:b0:6bd:c7c3:aac2 with SMTP id t16-20020a0568301e3000b006bdc7c3aac2mr6567117otr.18.1698534832734;
        Sat, 28 Oct 2023 16:13:52 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:52 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 08/11] riscv: mm: Use a fixed layout for the MM context ID
Date: Sat, 28 Oct 2023 16:12:06 -0700
Message-ID: <20231028231339.3116618-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161354_672955_C2F779BA 
X-CRM114-Status: GOOD (  12.08  )
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

Currently, the size of the ASID field in the MM context ID dynamically
depends on the number of hardware-supported ASID bits. This requires
reading a global variable to extract either field from the context ID.
Instead, allocate the maximum possible number of bits to the ASID field,
so the layout of the context ID is known at compile-time.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/mmu.h      | 4 ++--
 arch/riscv/include/asm/tlbflush.h | 2 --
 arch/riscv/mm/context.c           | 6 ++----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index a550fbf770be..dc0273f7905f 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -26,8 +26,8 @@ typedef struct {
 #endif
 } mm_context_t;
 
-#define cntx2asid(cntx)		((cntx) & asid_mask)
-#define cntx2version(cntx)	((cntx) & ~asid_mask)
+#define cntx2asid(cntx)		((cntx) & SATP_ASID_MASK)
+#define cntx2version(cntx)	((cntx) & ~SATP_ASID_MASK)
 
 void __init create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa,
 			       phys_addr_t sz, pgprot_t prot);
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index e529a643be17..62d780037169 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -15,8 +15,6 @@
 #define FLUSH_TLB_NO_ASID       ((unsigned long)-1)
 
 #ifdef CONFIG_MMU
-extern unsigned long asid_mask;
-
 static inline void local_flush_tlb_all(void)
 {
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 43d005f63253..b5170ac1b742 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -22,7 +22,6 @@ DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
 static unsigned long asid_bits;
 static unsigned long num_asids;
-unsigned long asid_mask;
 
 static atomic_long_t current_version;
 
@@ -128,7 +127,7 @@ static unsigned long __new_context(struct mm_struct *mm)
 		goto set_asid;
 
 	/* We're out of ASIDs, so increment current_version */
-	ver = atomic_long_add_return_relaxed(num_asids, &current_version);
+	ver = atomic_long_add_return_relaxed(BIT(SATP_ASID_BITS), &current_version);
 
 	/* Flush everything  */
 	__flush_context();
@@ -247,7 +246,6 @@ static int __init asids_init(void)
 	/* Pre-compute ASID details */
 	if (asid_bits) {
 		num_asids = 1 << asid_bits;
-		asid_mask = num_asids - 1;
 	}
 
 	/*
@@ -255,7 +253,7 @@ static int __init asids_init(void)
 	 * at-least twice more than CPUs
 	 */
 	if (num_asids > (2 * num_possible_cpus())) {
-		atomic_long_set(&current_version, num_asids);
+		atomic_long_set(&current_version, BIT(SATP_ASID_BITS));
 
 		context_asid_map = bitmap_zalloc(num_asids, GFP_KERNEL);
 		if (!context_asid_map)
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
