Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C06C63797
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCAymeDg0Io3pw3l/9gvejy/zMDYybhUrz47+JTlPZI=; b=G/OsYDGv7t8e4y
	3Tpbzao/Cn2GTcdLldp6Husqgh8pInOaiyVQKZLyKbjM8uVk7aQ2Ndke8Cjo/Cx7Po8T5oGTWHaOC
	t+eXbPB4V7scMxQ4Gq13QA1vPjYzk0czlwMrkw9U1BxYJKld7QyCJ+X0kGouF39uy5/mbjOfR3HBY
	L9MJ27gsttsm7MiklbK/6J18/xPl7E6oX4JGW5ViVuIf4E7f6Y21EZrEzjTidzY7Ag2vr5urj8whf
	GN8oVz89kUNiahChAirEYdXTBrwFcqXvvQHHCnkEuf3i38xlx0KkqSCtXKiOCPRQuGpFsPHlRR6rK
	UrIylHAz+dtCXo1D8yKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5R2-007bum-1x; Sun, 15 Jan 2023 16:00:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5Qr-007bmd-3m; Sun, 15 Jan 2023 16:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B85860D57;
	Sun, 15 Jan 2023 16:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D2FC4339B;
	Sun, 15 Jan 2023 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673798427;
	bh=EUOTCCvK3BHS1pXfvH2BWP1K07d19xWmUCZHwihqXEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IyaKhZ/O6P3f7A84a7Mw65DbbtwySU8FHZUpDYH5rMVUn5TACJ0lE35OOY2tMrSCt
	 lJp6+2oW4CX+R33fdtERPdljP4YWsgHv19MdNMi5SiHbKNVMQ3wyE+5X2/pHjVE0l+
	 hoV6VU4BGHlE+mYgCtrkDmAL+LkeXLtTIjQbYDyi4356m1BDtAvaU208rp/pC9QD9n
	 1Jr1e01kNzsfv+t92drf0Sc6Pw0MrtdEkw2AYvGVpQQ95eVR23t3GLmM8n/diSvSAK
	 4XtxUhihzUefRaNaGGnDWnr2vX6GvQkVmgGIEn/83x6uni6DB47U0FJK6U2nSLQFr4
	 vCqqiPbQzaVCg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v4 05/13] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
Date: Sun, 15 Jan 2023 23:49:45 +0800
Message-Id: <20230115154953.831-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_080033_323652_804F146E 
X-CRM114-Status: GOOD (  15.49  )
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

riscv_cpufeature_patch_func() currently only scans a limited set of
cpufeatures, explicitly defined with macros. Extend it to probe for all
ISA extensions.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/errata_list.h |  9 ++--
 arch/riscv/kernel/cpufeature.c       | 63 ++++------------------------
 2 files changed, 11 insertions(+), 61 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 4180312d2a70..274c6f889602 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -7,6 +7,7 @@
 
 #include <asm/alternative.h>
 #include <asm/csr.h>
+#include <asm/hwcap.h>
 #include <asm/vendorid_list.h>
 
 #ifdef CONFIG_ERRATA_SIFIVE
@@ -22,10 +23,6 @@
 #define	ERRATA_THEAD_NUMBER 3
 #endif
 
-#define	CPUFEATURE_SVPBMT 0
-#define	CPUFEATURE_ZICBOM 1
-#define	CPUFEATURE_NUMBER 2
-
 #ifdef __ASSEMBLY__
 
 #define ALT_INSN_FAULT(x)						\
@@ -55,7 +52,7 @@ asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
 #define ALT_SVPBMT(_val, prot)						\
 asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
 		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
-			CPUFEATURE_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
+			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
 		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
 			ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)	\
 		: "=r"(_val)						\
@@ -129,7 +126,7 @@ asm volatile(ALTERNATIVE_2(						\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
 	"bltu a0, %2, 3b\n\t"						\
-	"nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,		\
+	"nop", 0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
 	"mv a0, %1\n\t"							\
 	"j 2f\n\t"							\
 	"3:\n\t"							\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 37e8c5e69754..6db8b31d9149 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -275,58 +275,11 @@ void __init riscv_fill_hwcap(void)
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
@@ -334,18 +287,18 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
-			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
-			riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
-						      alt->old_ptr - alt->alt_ptr);
-		}
+		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
+			continue;
+
+		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+		riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
+					      alt->old_ptr - alt->alt_ptr);
 	}
 }
 #endif
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
