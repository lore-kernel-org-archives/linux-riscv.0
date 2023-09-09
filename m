Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BC7EEB581
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 20:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UowThSLSp9fPB84OB1bAjlqo7CW6Bawy1Nc9UN64oNE=; b=RBZo6ky9mC5rsJ
	WudPCDda04YKReirB9HqIoVsa+utQkUQCkxtZRwgP6GIiSSlwKHfqt3ANowvqrpnbQyPmrGokc60b
	1hOHO6B0NlAsGenqUoCfOyx0mumT2AZWovKtwtRfS0djUp8H9Ud9dt4SgTj6nwdfI5c1418R32ftm
	H5G0LeU2T5bngd6hSBF0/a0XzTH0FSXJ8jKLS36900Ut7EuJSckSrLTYL3igSBs3OSHm41NSrRwIw
	OyWMYch1uvf/zi5sMD2aIFryifDKCAAxX8ddknBJgT4ooT8wtBmYbAuDoWDu7uifqE4YZK5HMtJN0
	p8BT0DjNVrpWTngMh0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4Oh-00Fkqt-2R;
	Sat, 09 Sep 2023 20:17:39 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4Oe-00Fkow-2n
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 20:17:38 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id DBC32320090E;
	Sat,  9 Sep 2023 16:17:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 09 Sep 2023 16:17:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1694290655; x=
	1694377055; bh=u+R27fQSLabNs20twvWYROSpY1egJDSSJ6jgm8OSGJ4=; b=r
	E1qegEdZ8OH3AdJXRXbJ/3z8lj+sZPmBGODILRCdn0bGZqET9HOPF/BLhEBOPWJE
	UB3KaCLKmFAO7lp8BrUybwd5JEtyvovEXTUm/VmGk42tvImQ/h1auBQeBtI4ZrhT
	aDxPkcjwdxS/Vx/1vXS24IxBeW3VY7w+Pir/r9JlSvgmzjjel8UR77T7I/WxZ5Qy
	WrsZdAs+ZtD9Fx0mBj+WYsGrqz2QPzxb4fBSdpKTbxGaX3m+avHeZx/UaSJ8ifMk
	VNKZKqZ4blwejANEGo7AjjYSBsVnQrjxPdzkX67JnSHX3Bmx4vGTU9gt/tIia9MH
	rdbMvtWfLFRnhZcL2DsnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1694290655; x=
	1694377055; bh=u+R27fQSLabNs20twvWYROSpY1egJDSSJ6jgm8OSGJ4=; b=t
	3ES3w7Sl5IIg4IQUHFQ3gL5Ri8nvST3n+1Ut3ygOL3N7iqih9+T6xLJwRv5Wjyjs
	wOqv7gl99t7WiQf7lzZ5RWiiA5iUoIK5P6RX2tIHpx/nyo4TMG+QSDWnJeJEABei
	JGombEGeOD8hwPZglBCGnCYNSGzA+F0isXNVK+jhUOz/VZLGQpBIpp7Dr5Dz6/A3
	gz5mpQIc2RCL634Iz+BnysxVcZmKDJyr3B8pNnuP5JA65ewDofu+t8isLrYema1z
	HMbTfqUFykfl/O7GcJVhKD53ou+LN47Z5/r9H3gRi5/sutIF1k/lOm3kTXKS7tRB
	b0j2F6Y/wxhM0WBRYj0Kg==
X-ME-Sender: <xms:39L8ZI9pcJZmdGzqshYKE6i-T8r-QlGL39ou0XMTon4uYHFZQgzrUw>
    <xme:39L8ZAuIfaYTEiiJuJUy_0M0wkTlRBWxrXi7iqpl2G2WX0VYNp60FUsn3SHCEFzv7
    Am9yoSPrdNYO7tBdQ>
X-ME-Received: <xmr:39L8ZOAmMZddsp0r0ls7eiB0bZYFDuODP39s-ohv__b1CK7eJan6DkrJ-VOS0u78XGCcid1oKHdoIf1PCVxHcNkn_xpULONlVrJPAWPA7veDzh8l0UJbYmFvzG_Oi6OvBzz6TA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:39L8ZIc5PuTe2FD0uIFV55PscRf91ILHQNwAb1DcVHRbCTdx2fr-VA>
    <xmx:39L8ZNOM5WwBC-9gy7RMylHNppMTLKRzSkKmhYd9Ni_v9ACOQnfe5Q>
    <xmx:39L8ZCkkrednBI7LLwdL98AUonvfaeMPyBHU9zYMPrKhAe--kerlHg>
    <xmx:39L8ZCrgADnRmVS4jxExQyZwu8KkAi2YR7u7H859x6oixTYxwz-FbQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 16:17:34 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 3/7] riscv: mm: Use a fixed layout for the MM context ID
Date: Sat,  9 Sep 2023 15:16:31 -0500
Message-ID: <20230909201727.10909-4-samuel@sholland.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909201727.10909-1-samuel@sholland.org>
References: <20230909201727.10909-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_131736_929888_04AF9115 
X-CRM114-Status: GOOD (  11.19  )
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

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

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
index e2960c9c16e8..e55831edfc19 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -12,8 +12,6 @@
 #include <asm/errata_list.h>
 
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
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
