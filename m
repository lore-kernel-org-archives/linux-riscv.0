Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A57BC4167D
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OwxLUYoWHOG6o4ORBLQ7Van7+HV5bWY8vqup0uDUg4=; b=yaFjD1q+Qk2/F0
	DP+lG8uN/TY8Iyt+Qw8LUv7aPz3+fvpufrcpy3WVSdHB55D6NWoTOPpukd1zVg877gvKtKbyF5Wbe
	jkS1JezBVlib9jUwmXgGdH6HF2oMKVyVpUv10M+0HONACe+iBwn+RKUXQ9kHy9pCob7DHj/FyFj/l
	n4AU2LPKOzXLcPxtP7YI/9YfuLMpuvU1W5iVg6g4CWtfHu/LLbdTmZ9oo3EdXRo9pY5NwQSEhxpCx
	6PQaFcAyblIYIRRUuY0DbU88tgs1fTGhwpx6Een3KpolYd/m3NMF/CABgXh+UPhMC92K72w9OoMJO
	cPztfXiW1s8HdFOGLTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLZ-0011Ve-8a; Mon, 28 Nov 2022 10:26:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLX-0011T5-Ak
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 10:26:44 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozbLT-0004Xi-MS; Mon, 28 Nov 2022 11:26:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 05/13] RISC-V: rename parse_asm.h to insn.h
Date: Mon, 28 Nov 2022 11:26:24 +0100
Message-Id: <20221128102632.435174-6-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128102632.435174-1-heiko@sntech.de>
References: <20221128102632.435174-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_022643_423662_EA61D355 
X-CRM114-Status: GOOD (  10.89  )
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

The current parse_asm header should become a more centralized place
for everything concerning parsing and constructing instructions.

We already have a header insn-def.h similar to aarch64, so rename
parse_asm.h to insn.h (again similar to aarch64) to show that it's
meant for more than simple instruction parsing.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/{parse_asm.h => insn.h} | 0
 arch/riscv/kernel/kgdb.c                       | 2 +-
 arch/riscv/kernel/probes/simulate-insn.h       | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/riscv/include/asm/{parse_asm.h => insn.h} (100%)

diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/insn.h
similarity index 100%
rename from arch/riscv/include/asm/parse_asm.h
rename to arch/riscv/include/asm/insn.h
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 61237aeb493c..2e0266ae6bd7 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -11,7 +11,7 @@
 #include <linux/string.h>
 #include <asm/cacheflush.h>
 #include <asm/gdb_xml.h>
-#include <asm/parse_asm.h>
+#include <asm/insn.h>
 
 enum {
 	NOT_KGDB_BREAK = 0,
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index 29fb16cd335c..a19aaa0feb44 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -3,7 +3,7 @@
 #ifndef _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
 #define _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
 
-#include <asm/parse_asm.h>
+#include <asm/insn.h>
 
 #define RISCV_INSN_REJECTED(name, code)					\
 	do {								\
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
