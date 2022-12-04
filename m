Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600B0C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SM9rgFrwZ8zlJ88kUPut40aEv/O2os08wP+kuUWxcHQ=; b=cL+gGrw+QLTBr7
	xcpn3thgPqN/zOl7r/2pNTP28EoUnl3Tu9xSPhSKmZZkt2GIdmCS9CWbBg1Cne39WGEUjvFZ11Z0N
	G6Fi02QujTGny9eSlV1mu7WyU0NSSpWZANjP7wKjEWglMmm6wOKpn/s/keE4hmt/UWls79F8XmkOz
	8VKlNjP9loaimkdiVe1vOHvAaRPvQSbqUB6MGBk4U5mYhwp53gfeFOXPb2ji8iCN7izxkNbarTeKg
	58VY0pdz5DXf1ZQBUwP/SKGRN793iWu4EkEOYpEyr4tv4i9hEZGopdpExoGb0ewwrHksLKslMGeaC
	f0GOectw4Xnk6t50eESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tHe-00A7VJ-S0; Sun, 04 Dec 2022 18:00:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tEJ-00A6cU-J3; Sun, 04 Dec 2022 17:56:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3690A60EDD;
	Sun,  4 Dec 2022 17:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51608C43470;
	Sun,  4 Dec 2022 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176602;
	bh=maHohDx6EZuCxhRSJ3qwh0l5iMVm5jT8tvy5XMgFCe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6lzW/QoSG0kNMZQA1TUDNYrdDDuG3JEA2I3JsFYeUyq3hNNw06nCWkrCc+Kiji6p
	 8Lo79JJOe7y9C38fbMr4HZglAobK70kM1c7nkjeBXASwMuHpFvPZibCMuGVQgqll6S
	 wpTxpn14/xKZR5gYj44Vkq3XPuzBICGECfMDzU7MAzOE+rqR9fx3ICUNFlxyg+iF3x
	 bCNor5YtaBl9cf0Wztdb5eC2N1ySdrdPS1F7rKG4lwUJH+tJNYeYgzu4tLNdzJJG/Q
	 lISEtjyTZCITpzzFwpR1xWmRCEMyXvQXunG//Uo9Pf9Q9KzBaokYJ6Uycp1db4UEL3
	 52bEhiuci3/Tg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 05/13] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
Date: Mon,  5 Dec 2022 01:46:24 +0800
Message-Id: <20221204174632.3677-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095643_718626_421360B2 
X-CRM114-Status: GOOD (  14.98  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/errata_list.h |  9 ++--
 arch/riscv/kernel/cpufeature.c       | 73 +++++-----------------------
 2 files changed, 15 insertions(+), 67 deletions(-)

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
index a4d2af67e05c..6244be5cd94a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -252,58 +252,11 @@ void __init riscv_fill_hwcap(void)
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
-{
-	if (!IS_ENABLED(CONFIG_RISCV_ISA_SVPBMT))
-		return false;
-
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
-		return false;
-
-	return riscv_isa_extension_available(NULL, SVPBMT);
-}
-
-static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
-{
-	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
-		return false;
-
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
-		return false;
-
-	if (!riscv_isa_extension_available(NULL, ZICBOM))
-		return false;
-
-	return true;
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
-		cpu_req_feature |= BIT(CPUFEATURE_SVPBMT);
-
-	if (cpufeature_probe_zicbom(stage))
-		cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
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
@@ -311,25 +264,23 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-		if (alt->errata_id >= CPUFEATURE_NUMBER) {
-			WARN(1, "This feature id:%d is not in kernel cpufeature list",
+		if (alt->errata_id >= RISCV_ISA_EXT_MAX) {
+			WARN(1, "This extension id:%d is not in ISA extension list",
 				alt->errata_id);
 			continue;
 		}
 
-		tmp = (1U << alt->errata_id);
-		if (cpu_req_feature & tmp) {
-			/* do the basic patching */
-			patch_text_nosync(alt->old_ptr, alt->alt_ptr,
-					  alt->alt_len);
+		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
+			continue;
 
-			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
-							 alt->alt_len,
-							 alt->old_ptr - alt->alt_ptr);
-			riscv_alternative_fix_jal(alt->old_ptr,
-						  alt->alt_len,
-						  alt->old_ptr - alt->alt_ptr);
-		}
+		/* do the basic patching */
+		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+		riscv_alternative_fix_auipc_jalr(alt->old_ptr,
+						 alt->alt_len,
+						 alt->old_ptr - alt->alt_ptr);
+		riscv_alternative_fix_jal(alt->old_ptr,
+					  alt->alt_len,
+					  alt->old_ptr - alt->alt_ptr);
 	}
 }
 #endif
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
