Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A147CC54798
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 00:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcvpCEED0It/EbtQ04L50Y4KCybYxBmXEmNm2oR6zQM=; b=oNykJ1qgdfbBPp
	MNMJglUOGrLsO0wLaIoiCg5YbbuduMefUauFvY7E8GsCQuQKTDwms5YwEbEBcvyVa7Hs3lIWUCYhz
	QSMe+MWonkPj2KPh1Lsy+ccIa5hxGKXG6jg9GFyVj9hw9snTBebefCT+K1AnbT67ey6m/gDoJFS0U
	bsN0qv8igGNpdd6SCS12H5ng4/U10Yp6fm7WZ3sb+9Bg8r0lXhf2sDyG7f74HY7V0OZyIUtsfCviY
	90mln7EVoxONcfvi55opOAJVlIhSWalOW6+U/qTJ7swZBtbhaS64FwdOamW2sRlppJGHvzZP9YARO
	8+pQuBWNxHLUXYmYl8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfqow-0000000Fkur-0Ofh;
	Fri, 01 Mar 2024 00:32:14 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjN-0000000FZyG-17Uu
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:27 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3c1c44a9554so655685b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248943; x=1709853743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+Ju3+5NsQ7zqLi78mVdBh82QtKzTZZzrfFOA+rFDFs=;
        b=XeNX/u4z+54uPAGf0rmPCwpkq82gp6g8aPBrz7ONE/WtxjOuvUeCi47LfMmg3+8kCz
         SpHBaCT93I8IA/9rDEqME4cYd3ofh/m5hEsNlST/QtKOKs/5esEuaX+itbt8HiMGGXS8
         uTNobT4U0bzzyprwuYKTXwGIimFsSkPB6Mv0eHSQTePS5jiOgirGuByxFerattp87rE+
         5LVzIoWnf5zfUZvr8Ji65F8a8LRoxUXsN9DLkqKyo1RyfcuAw8etIf8Bukx7GR9knC6r
         QZUpWQ23kg8XFNYqdT8mpXyjRpEhZhyM82nBuCdz3tUILBl1bMfiJ6+dcey6ehN/AFpS
         vMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248943; x=1709853743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+Ju3+5NsQ7zqLi78mVdBh82QtKzTZZzrfFOA+rFDFs=;
        b=iCMJDCOxosFYWc+6sJNDRx1ad+Mhc+97CUevDNzh784rRcJgN840pWkEuPEk6X590X
         9iG/ru8wIEjCqrA5M39P4l4Iik36EpNjXrUGDWAQaCOd0qQlV1iyCGlGz/RvL3JAqDFh
         BsJRhgej41jar5DEVrvrBTUCvCdqLvP2Dh2NaoG+kFN5R9MLRJaLVBg7GjDChdr4DBIU
         JTdyL6ntz+RSZFZMduxvHb8Zi7JOhRiARmA/IqqVPZ41D4EnHes5Y3Z57qIa4S1tKEXT
         r66/r2VkJ+sgkbaBdVIhfO4A+LW2xIHmP2LkozrklCTJN6K7pYFWh6H1R/eK1zPhRoy9
         4GXA==
X-Forwarded-Encrypted: i=1; AJvYcCVviZPstAvPmYFo4um8MA/meJWtw0fhjxY0c1gHAf55ldKndtweJC/k1QjPXKnRGnm2PgEiqcrQrROWOrTsiGDB/9t41riZKt9dEBIYHJ4o
X-Gm-Message-State: AOJu0Yygyl41H4K90x+6isim3irAuLymPrLGIfP0P0bH6XOYH5x6RTPR
	1pKGVGb7sbhPv9JJBseQEelxIOI5E5bXtrrI2Zahd7X3P8EgXGzGyYoOz9qg9es=
X-Google-Smtp-Source: AGHT+IHzbXWkwDmlfZ/eL4jDsB3ccQ2hOxgMwKxCvl8MiEGc4S4tbeeGWY8zmXhmQ74ouvbz4gXZvw==
X-Received: by 2002:a05:6808:1447:b0:3c1:b28b:76f0 with SMTP id x7-20020a056808144700b003c1b28b76f0mr91074oiv.9.1709248943714;
        Thu, 29 Feb 2024 15:22:23 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:23 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 10/13] riscv: mm: Use a fixed layout for the MM context ID
Date: Thu, 29 Feb 2024 15:21:51 -0800
Message-ID: <20240229232211.161961-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152225_464679_02F3913B 
X-CRM114-Status: GOOD (  11.91  )
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
index 8e329721375b..72e559934952 100644
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
index b562b3c44487..5315af06cd4d 100644
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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
