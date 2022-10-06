Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EACC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 07:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rueacu2smEm11QOAE21s63mdpi9WzjrSCk1g0iGKfCI=; b=0Lvrl4QUhGD9NB
	IL92ck36DDwQ8fJx+86v/FnqqR2M8Z7gj00/8dOlsj3MgU0lvaLlq+yGWJ5FKzd/ipBxHpBRg+5ex
	Y5/ZjAUslFNmg5MRYmqswHS4dJfjjQ7bu3hCa44IeuxA1sP44IJHmrJJAoc/rj4wKxMEGxbK2D+bA
	EiMHIzWlYnaGaDPRQ7873/LHu2FALJiqg+wUaoKpLM8SBeHI15WjDHIGEZm6+rt5p7Bu9Vwnu115y
	nzKbouHsmcunnRelBX6AzgoIq40DA+mdYY38zCQttkiwUwV766Fj0aBVs28FRr9IkyuD/GkQJgMYh
	OHBdY0BfmvLTBmN8BrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8t-000MYf-Dl; Thu, 06 Oct 2022 07:18:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8n-000MUn-NI
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 07:17:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C75D617FE;
	Thu,  6 Oct 2022 07:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852A2C433D6;
	Thu,  6 Oct 2022 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665040676;
	bh=gPmW8EclUiiWXqJPul8/K3RZNdAIO+8mmu462RCD6hY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UI28jwcZ1mTmqfPjRQxXCWoP0Y7AhxDRQTJgObHiu5kwUvMHB87OI7mg7CRkJsOid
	 5FsT04SQWYfDPjQE6hP2aCUt+BlJoc04booDabLIfHa1SoCoHBOKxTg2+tYxBNjY+2
	 I3YLoBvWkUoh4NpZRfK/fkF7f7tn+cfhjCegFxZR/X/vNeKOT5DJ9i7iaAK92Kpw0C
	 AIA4MH00rRu9E2OWRsoHCj/FymcrFi1gYKPsLcn9V67JJtTp8PjcpSucjwHr9iR3C/
	 YRIIktXxmxmbyz4XqXQjQqWHk8KfKBQR63EqPLPmVFC4Ipb4EwhHSrLamUGdIECpDV
	 nu/RCOyLqEWRQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
Date: Thu,  6 Oct 2022 15:08:14 +0800
Message-Id: <20221006070818.3616-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006070818.3616-1-jszhang@kernel.org>
References: <20221006070818.3616-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_001757_854904_8E69F22C 
X-CRM114-Status: GOOD (  14.24  )
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

make the riscv_cpufeature_patch_func() scan all ISA extensions rather
than limited feature macros.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/errata_list.h |  9 ++--
 arch/riscv/kernel/cpufeature.c       | 61 +++-------------------------
 2 files changed, 9 insertions(+), 61 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 19a771085781..722525f4fc96 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -6,6 +6,7 @@
 #define ASM_ERRATA_LIST_H
 
 #include <asm/alternative.h>
+#include <asm/hwcap.h>
 #include <asm/vendorid_list.h>
 
 #ifdef CONFIG_ERRATA_SIFIVE
@@ -20,10 +21,6 @@
 #define	ERRATA_THEAD_NUMBER 2
 #endif
 
-#define	CPUFEATURE_SVPBMT 0
-#define	CPUFEATURE_ZICBOM 1
-#define	CPUFEATURE_NUMBER 2
-
 #ifdef __ASSEMBLY__
 
 #define ALT_INSN_FAULT(x)						\
@@ -53,7 +50,7 @@ asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
 #define ALT_SVPBMT(_val, prot)						\
 asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
 		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
-			CPUFEATURE_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
+			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
 		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
 			ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)	\
 		: "=r"(_val)						\
@@ -127,7 +124,7 @@ asm volatile(ALTERNATIVE_2(						\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
 	"bltu a0, %2, 3b\n\t"						\
-	"nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,		\
+	"nop", 0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
 	"mv a0, %1\n\t"							\
 	"j 2f\n\t"							\
 	"3:\n\t"							\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index afa54635c180..2b1f18f97253 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -251,61 +251,11 @@ void __init riscv_fill_hwcap(void)
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
-{
-#ifdef CONFIG_RISCV_ISA_SVPBMT
-	switch (stage) {
-	case RISCV_ALTERNATIVES_EARLY_BOOT:
-		return false;
-	default:
-		return riscv_isa_extension_available(NULL, SVPBMT);
-	}
-#endif
-
-	return false;
-}
-
-static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
-{
-#ifdef CONFIG_RISCV_ISA_ZICBOM
-	switch (stage) {
-	case RISCV_ALTERNATIVES_EARLY_BOOT:
-		return false;
-	default:
-		return riscv_isa_extension_available(NULL, ZICBOM);
-	}
-#endif
-
-	return false;
-}
-
-/*
- * Probe presence of individual extensions.
- *
- * This code may also be executed before kernel relocation, so we cannot use
- * addresses generated by the address-of operator as they won't be valid in
- * this context.
- */
-static u32 __init_or_module cpufeature_probe(unsigned int stage)
-{
-	u32 cpu_req_feature = 0;
-
-	if (cpufeature_probe_svpbmt(stage))
-		cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
-
-	if (cpufeature_probe_zicbom(stage))
-		cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
-
-	return cpu_req_feature;
-}
-
 void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  struct alt_entry *end,
 						  unsigned int stage)
 {
-	u32 cpu_req_feature = cpufeature_probe(stage);
 	struct alt_entry *alt;
-	u32 tmp;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
@@ -313,15 +263,16 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-		if (alt->errata_id >= CPUFEATURE_NUMBER) {
-			WARN(1, "This feature id:%d is not in kernel cpufeature list",
+		if (alt->errata_id >= RISCV_ISA_EXT_ID_MAX) {
+			WARN(1, "This extension id:%d is not in ISA extension list",
 				alt->errata_id);
 			continue;
 		}
 
-		tmp = (1U << alt->errata_id);
-		if (cpu_req_feature & tmp)
-			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+		if (!test_bit(alt->errata_id, riscv_isa))
+			continue;
+
+		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
 	}
 }
 #endif
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
