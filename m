Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516B1C47074
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZkkL+Zghn7On6IzhM5WXFXYnjQ0LbDJtaLr3nlOYdk=; b=qoDObPA4vexAZX
	oWA0x/+Rsfw8a471wkJTbhpMQHgQ//624iaNqThsHgnzNzRgSc0Sg/SrAyiZAG+A02oqHAtF6rIwZ
	5tBL3gVAT3nJTh4saoFQRK6njyN7xarmv9AUm3i9odre6xEaluL3S0AH06fNZIXw20DPOgNOe3oSp
	Ygm8Kn8XbCUN0I1PKt1/Mp2rxu/kxmx+zhnjy+t9A/xzRPMKJu5Wlsu6DySFDuPRV3cMdUqgbuO5V
	D9PwUAk+HQf51auAciK/uYnaiHpwnu8/VLdPEtVZlbs8wB82TRAw0v4WItPhbbr2xfOzpVQYPW7Mu
	w+M6ktrAxmD8qVsWeHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpc-0098XI-1N;
	Tue, 02 Jan 2024 22:01:52 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpX-0098Se-2b
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:49 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28cd3f9cd40so717868a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232906; x=1704837706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2cmoIK/tf9yPohv/YvO5QQvGunkgXtONjIGDQZEX58=;
        b=W038j35yetw21ID6bC6RAus+bjNuPFEntfeyKJlGYYBD6r7atS5ke/JHjzIcdJ5JeJ
         ez6azwAsFJVwArAexSMIKpBp6WPdIXnLPui7WbSXn2Juo5CqMI7/i3O5TYMRfASiuhep
         YMJaLuCUbMb7huXSqEoVDkjOEvY7QETziJODmpaXHew4I7a1ZiO97zkQH0jZTWfeXpVl
         RcklVOqSjBN7APnQHCILS3tvtWwL+fucVZ9OhZ9A5khqD+sRl7uDkZvkA6MQ8T5DwcvJ
         pROXOSQ2mYJ2jCSrpv7LNyVPhir9cHvamw4AqKKADOz5Nrf6OW4VVLUBb7nRUg08I0aG
         tvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232906; x=1704837706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2cmoIK/tf9yPohv/YvO5QQvGunkgXtONjIGDQZEX58=;
        b=QFKzQAUasatOF9+E0k8cTgCKwnldQrig00rqygRlz3sVLsDif+iK6Bqsc2661i1HAC
         Sjum742Ybkuzqy/RIPRvVhH1TsQVy55sLpPJH4OqKP4RXgu11R24ihkBUQ9bMlyeZpMk
         p6d8IhhoZEzI8ENic4oXIB0VfNNot4h3dmOCdRirstgsigYE8sdRoLEl2hKCw8nEkXQ3
         LAd+Dxggb+jDsYgnmxbXPXdI7ZuY9TKtaZtWxNRNFJG/fq4AV07cflzYQWomhlyAJcBT
         56Hed5PaufkGDAf5VgiRrzFoVwTAHFOZb7MTlsBeT2JAP2bRKU6WobZdN/KzoGbRNOtG
         y8xg==
X-Gm-Message-State: AOJu0YxOhmHxT3Ng/kVYFNLw1K2jIfs/20gu1B32xr58214JPXMT/TK8
	v+czR6vKjXGNOW8X0YZvZ9+VLgc0PN8QKg==
X-Google-Smtp-Source: AGHT+IG8w/0THQ/uqOPivBsiw22hWysSlz1giatwLj9QOMmwVtysp2KaHolkndd/R0ziY6DtdT9KEQ==
X-Received: by 2002:a17:90a:134f:b0:28c:b1bd:3c42 with SMTP id y15-20020a17090a134f00b0028cb1bd3c42mr2130687pjf.55.1704232906433;
        Tue, 02 Jan 2024 14:01:46 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:46 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 09/12] riscv: mm: Use a fixed layout for the MM context ID
Date: Tue,  2 Jan 2024 14:00:46 -0800
Message-ID: <20240102220134.3229156-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140147_872123_645B9069 
X-CRM114-Status: GOOD (  12.70  )
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
index d9913590f82e..5bfd37cfd8c3 100644
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
