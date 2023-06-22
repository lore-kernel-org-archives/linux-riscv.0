Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623ECEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1guLFsnsz1780FTb2TzQ/pCrEoHYZ35IiDXOaVTsnJc=; b=gZQuVrUHzEEBJg
	4HSwARMDgb2pCoLhh47wBH7hpwzefxfTGlZ7PUccy8LDaCYPKqSAyFnZWQjRHjiosLJRYjlwjhoU1
	c4dnZ+MUuhgyroKu/HnFY1HNNMME+5zmrdrhqYSwK734X7v7DZVSqi2OUpiSLWe1HZ7KdIFzNHAW4
	/tAU9qAm9FfSk+j6SFaeU45lXN3iQ9Zw0muMLMLOp8x1ScfG067A49+5+MHXqUuZmSNDN4sORypKk
	GJqSrnmNaJtP2HpVU2V7ZzlIbr3+8d9LSNHt6CkF8FFHf1H2lxNF1Lo30ncyiK7XAFJbKJP10DPPw
	eVvxdQwxe2lSJbXoi0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCTUZ-0021cr-14;
	Thu, 22 Jun 2023 23:13:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCTUT-0021Zg-0V
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 23:13:27 +0000
Received: from i53875bdf.versanet.de ([83.135.91.223] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qCTUP-0002nK-9C; Fri, 23 Jun 2023 01:13:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	samuel@sholland.org,
	guoren@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 2/3] RISC-V: move vector-available status into a dedicated variable
Date: Fri, 23 Jun 2023 01:13:04 +0200
Message-Id: <20230622231305.631331-3-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622231305.631331-1-heiko@sntech.de>
References: <20230622231305.631331-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_161325_198355_49FE4AA0 
X-CRM114-Status: GOOD (  14.48  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

There is at least one core implementing the wrong vector specification,
which cannot claim to implement the v extension but still is able to
do vectors similar to v.

To not hack around this by claiming to do v, move the has_vector() return
to act similar to riscv_noncoherent_supported() and move to a separate
variable that can be set for example from errata code.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/vector.h | 5 ++++-
 arch/riscv/kernel/setup.c       | 6 ++++++
 arch/riscv/kernel/vector.c      | 8 ++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 04c0b07bf6cd..315c96d2b4d0 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -19,13 +19,16 @@
 #include <asm/csr.h>
 #include <asm/asm.h>
 
+extern bool riscv_v_supported;
+void riscv_vector_supported(void);
+
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool riscv_v_first_use_handler(struct pt_regs *regs);
 
 static __always_inline bool has_vector(void)
 {
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
+	return riscv_v_supported;
 }
 
 static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 971fe776e2f8..952dfb90525e 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -36,6 +36,7 @@
 #include <asm/thread_info.h>
 #include <asm/kasan.h>
 #include <asm/efi.h>
+#include <asm/vector.h>
 
 #include "head.h"
 
@@ -308,6 +309,11 @@ void __init setup_arch(char **cmdline_p)
 	riscv_fill_hwcap();
 	init_rt_signal_env();
 	apply_boot_alternatives();
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_V) &&
+	    riscv_isa_extension_available(NULL, v))
+		riscv_vector_supported();
+
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
 		riscv_noncoherent_supported();
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index f9c8e19ab301..74178fb71805 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -22,6 +22,9 @@
 
 static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
 
+bool riscv_v_supported;
+EXPORT_SYMBOL_GPL(riscv_v_supported);
+
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
 
@@ -274,3 +277,8 @@ static int riscv_v_init(void)
 	return riscv_v_sysctl_init();
 }
 core_initcall(riscv_v_init);
+
+void riscv_vector_supported(void)
+{
+	riscv_v_supported = true;
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
