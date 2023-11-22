Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB862C61D99
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EryK/siS6cp26WR4PINEBb7uP5yP/3IYm3UElUq/3bo=; b=h1Cp4own9vN8ki
	c2K0M4WxuxUGG/gW4PdZvCCrpnFKBKJzbeNqIE9Du9dgfilbiLKo/0CQo5Pwpko0JghHjxswjZx/k
	bVQoZHFt6YADkaGJQG4WDJkOeMBhOt6/UMMvYrW1zpEYEk8VsT6TOPFhXdXV5CnSltDaBhMOPRHDv
	lcI8HatUfS4BnsUGE9eoHcRD5UMMH03Ur6MXucYez/zjYct6Wzv+ShA2WxwMoCaZBgMUQtuMEhhab
	/9JRwaeEQT3rdkk7aXOQNw+f4TISpSeL0BNf1VcfYuUs3/E+d3BtDshKDHEzpLuAOid7VLfAMLOgY
	DW0l+rcuOySZEs6yOqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bjD-000NFB-0M;
	Wed, 22 Nov 2023 01:08:31 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj7-000NAL-1P
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:08:26 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-357ccaf982eso19996625ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700615304; x=1701220104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b39ZSDVnn3/TpDDYcLNRgBYhWVyekPNc8OuxKxdgheo=;
        b=gZ9oWzmwIs1krlSbt8wD13G2DgXdoqDVl02guB65Dt0/GgbBZw60/jZeaU2dShF4gG
         RZbVHEs/c+NcmRigyjfu6y/7axnmR0BYlu+tWuTvLWXU+aSK2uU7/VANI88FQQnswfiO
         PI81UYOW4ItgtbgtgM4oGj9ln5+IBq6tA1ppOdwkjsKq3ZL990VU3yuuBkitMKZS8HoX
         1VWKPAQ63LOoDopv3huhkr9RJTqXkBWvzRRjfXjVMeWXsAcXnzNsb6m6CHTLhRkK5joA
         X6bNKS+VFbGgkB3X1GQWVm4jVsyvO8aKSbNvMoLsAiWClND5RyGk+TB6w01ws7f9W5KS
         gw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615304; x=1701220104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b39ZSDVnn3/TpDDYcLNRgBYhWVyekPNc8OuxKxdgheo=;
        b=ImrdNOh1tiiGbJtzE/c0m2sAoPq3nrZram59ej/qrekQuwW52tsC5OBRqPO0jOGwhX
         WFczNoYLhGlU+0D8uRANIkrViWgEuZwDZLDCuJhUxVa8Fw9hia/eSSLPgV6yY0PqdTwS
         1D94QYLI2HQdb8EEm97aWOAeaYegTOq5c2UGo8NxMXA9p5VJzuhLVkl4q23Q0HvSSXGJ
         L2vSLcMt1t4/uohGRq5DRP6eK2+NvM+gxLyxbw/NQIk421tVU2qUnTZXbgoOVMV8qLJO
         tXp0uzmEaWWW+BStWoJUsOgiPaBwOWDBi9DfafXFv8q6UVATKb/ToAuBkJje13sMD/if
         ov3g==
X-Gm-Message-State: AOJu0YxlsbWc3dv9b2bbNSgdmcA9R05ZgCGrGPqzXbZw4xNEZskgs02I
	P2xJqzX97EkvTGIXmKTQtgEJ2A==
X-Google-Smtp-Source: AGHT+IGi2JpVuCgk8T+HgcOfCC/VHmmgf8iSnDwMNXS0Bc2add3cL906GsPfWT4iX9QyNn2xttBJig==
X-Received: by 2002:a05:6e02:b48:b0:35b:2b49:d816 with SMTP id f8-20020a056e020b4800b0035b2b49d816mr721861ilu.13.1700615303918;
        Tue, 21 Nov 2023 17:08:23 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bn5-20020a056a00324500b006be047268d5sm8713961pfb.174.2023.11.21.17.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:08:23 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 5/8] riscv: mm: Use a fixed layout for the MM context ID
Date: Tue, 21 Nov 2023 17:07:16 -0800
Message-ID: <20231122010815.3545294-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122010815.3545294-1-samuel.holland@sifive.com>
References: <20231122010815.3545294-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_170825_474865_AFDD524F 
X-CRM114-Status: GOOD (  12.19  )
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
index 3b393f765805..4448d907f2c9 100644
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
