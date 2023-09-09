Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA76EE14AA
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 20:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blfOTHTIA7+Hxm5wKYQ5cq1zyuDsj07Xs7OMLTST+eY=; b=sqCvgAgtLDkNjz
	aaUyXJ6fqffOPIeK64gWYdtcSOv2IVqDrwmKRq9NSuqW+kzqTj9GVTK7XhI5WuhsK/9hmDhcseT6c
	YI4NrWnC5W3lfP1A1XPFg9xZmeeWp/arO1sfZZoco0OuuaKClE9e8buVlCTGNAQraB3D+CenoXaZz
	yN5vMPydu6FMhpmh2Qjs5y2mZIDPxf6hdtb8nHzHUZ5HIRnXpxCZsRN+Nhqu/C29Xn7VxzcVjTNK9
	JlUXT5CFZZLp6b6j45okUSmilCTyyxbOD2w29D4AHU39ejzhbvKrgT4DUMQY4SCHL896AhnuxDAvx
	Xz8cpCzvn4vUTWbx0bug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4Oc-00FknI-1A;
	Sat, 09 Sep 2023 20:17:34 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4Oa-00Fkmm-0z
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 20:17:33 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 53337320090E;
	Sat,  9 Sep 2023 16:17:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 09 Sep 2023 16:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1694290650; x=
	1694377050; bh=7NXnmFYFmr6Y8hhtV6LxTtgTAxVz99Y/He8EwBOMTPo=; b=v
	MGC/yqEpNIdjgRMas1jOpQX+RGuER3w1a9LX7DRtbX3YU/zuvaZQ6lNCqgC5uN3u
	+WX7QnEdXIsb6GU2zk0Fq6WqIhS9vF4GMjrvaQthRv21wcMpyMuogSqMZpRH65A4
	ikNYD/4Ya6H3nKwcWxOFq2m2+CIOhkHPIOMUEMAaQaEQzmBDjk3eYR2Cm9lxdwAM
	Bf0Y4WrP+rxWWli4eqa0N2OMzHBwgJIIb06Z4fHo0Wjt0pjAhXAclM5363cBvuIJ
	dVIyEreE8ynOQTiWVp73D9Vlp/vxjklgg+hjVQKJNpBN1zOzdmXUfuj28u3zFde6
	0ARU84BJ1h6BjreTvI7hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1694290650; x=
	1694377050; bh=7NXnmFYFmr6Y8hhtV6LxTtgTAxVz99Y/He8EwBOMTPo=; b=V
	/6PtmbbrFsuIPtof2CD8rYJbN8SW8zFJs5B3F1yVaeB/EqxlRcGpakegQduTcXFf
	wSIkvVrmCEmsjz84lWiez9t8xrXMOpE+l7K5d3o8XLvRcEmDlcZKlRmF+IfGUFtT
	QDFb0L7Pm0baBvnwqSvUn5jhoeJjGS6ifeXG1Am8mpFsnshwMkgfruTNH/7INHdC
	hSgmCO+CZdE0Mvud4b5FpStlebpmjkVmy4FMOZtL0k2pgsXO1EjAXQDSHEtgAzNv
	P5xxWSFJfWyEDjXDo+0/euINs2raDRN16uSY1G907a004+eyFYLMVowcmZMDaK7m
	sUNogkSv3rR3eNzMLMXRw==
X-ME-Sender: <xms:2tL8ZOS0S8gzUZb1nSVGgXTA_wYBwUsqPha8JE1s_nhed-yNjMQ_Vg>
    <xme:2tL8ZDz55g6kmJoGy47HPnlT-VWKWlF795VVI9MDzXQd50XPCyjR2O1aVhB_peWUn
    pys4dCSDKsujHd-tQ>
X-ME-Received: <xmr:2tL8ZL1e9J7u1L7789PJ94sAY2VDn_hq9ZM62IAA_1NPlG8EBVVILVaVTslgllnivEmfLvRlq-N1lCyAFhKefPHFIqib2Y4Eedh2cE_rynkuuXQWfHvt8qz2UKnuRNcmguUzEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:2tL8ZKCQSbx8PdzECm48aNv_5_p9_2Y8AeoPd86rRUmyb33aZP0lpA>
    <xmx:2tL8ZHgYBpN8fhzGMggYtPrbTjQokxXHbROdxck-vedtLIG9FCUygQ>
    <xmx:2tL8ZGrXGjMTl9x85VcF394-J5EFRbM4-T2n1ByYUx89FD9RuGPvCQ>
    <xmx:2tL8ZHchGuMCebprQzFSxf9plUY72WwThGvKPF6yuar978JNMXwJwA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 16:17:30 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/7] riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
Date: Sat,  9 Sep 2023 15:16:29 -0500
Message-ID: <20230909201727.10909-2-samuel@sholland.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909201727.10909-1-samuel@sholland.org>
References: <20230909201727.10909-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_131732_372726_DFA01693 
X-CRM114-Status: GOOD (  11.31  )
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

commit 3f1e782998cd ("riscv: add ASID-based tlbflushing methods") added
calls to the sfence.vma instruction with rs2 != x0. These single-ASID
instruction variants are also affected by SiFive errata CIP-1200.

Until now, the errata workaround was not needed for the single-ASID
sfence.vma variants, because they were only used when the ASID allocator
was enabled, and the affected SiFive platforms do not support multiple
ASIDs. However, we are going to start using those sfence.vma variants
regardless of ASID support, so now we need alternatives covering them.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/include/asm/errata_list.h | 12 +++++++++++-
 arch/riscv/include/asm/tlbflush.h    | 13 ++++++++++++-
 arch/riscv/mm/tlbflush.c             | 17 -----------------
 3 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index fb1a810f3d8c..6e416297847c 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -39,11 +39,21 @@ ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
 	    CONFIG_ERRATA_SIFIVE_CIP_453)
 #else /* !__ASSEMBLY__ */
 
-#define ALT_FLUSH_TLB_PAGE(x)						\
+#define ALT_SFENCE_VMA_ASID(asid)					\
+asm(ALTERNATIVE("sfence.vma x0, %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
+		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
+		: : "r" (asid) : "memory")
+
+#define ALT_SFENCE_VMA_ADDR(addr)					\
 asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
 		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
 		: : "r" (addr) : "memory")
 
+#define ALT_SFENCE_VMA_ADDR_ASID(addr, asid)				\
+asm(ALTERNATIVE("sfence.vma %0, %1", "sfence.vma", SIFIVE_VENDOR_ID,	\
+		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
+		: : "r" (addr), "r" (asid) : "memory")
+
 /*
  * _val is marked as "will be overwritten", so need to set it to 0
  * in the default case.
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index a09196f8de68..e2960c9c16e8 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -19,10 +19,21 @@ static inline void local_flush_tlb_all(void)
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
 }
 
+static inline void local_flush_tlb_all_asid(unsigned long asid)
+{
+	ALT_SFENCE_VMA_ASID(asid);
+}
+
 /* Flush one page from local TLB */
 static inline void local_flush_tlb_page(unsigned long addr)
 {
-	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
+	ALT_SFENCE_VMA_ADDR(addr);
+}
+
+static inline void local_flush_tlb_page_asid(unsigned long addr,
+					     unsigned long asid)
+{
+	ALT_SFENCE_VMA_ADDR_ASID(addr, asid);
 }
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 77be59aadc73..115d617d16c9 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -6,23 +6,6 @@
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
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
 static inline void local_flush_tlb_range(unsigned long start,
 		unsigned long size, unsigned long stride)
 {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
