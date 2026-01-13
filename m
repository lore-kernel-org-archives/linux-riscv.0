Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1057D29DE2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwaP7vVADiouqf/1h9Tz6zENGKTUvaMDtUrzqQkIimk=; b=PxnUlXmFvGeEtO
	9XCp1lDGjTlLmHKixeS3c9PZLIwxA2O0VJTWcr2yMduxD5nyhruy3yG5wb4XUDBgw1yhK5jptSr3W
	G4xN2h8xsSGSpPQhW8zjs4wwSrjL/aMzhRj/kUkt2fc25S4JgjsiyPwD765xTC9C+2SisgYiVrXLh
	GiJMYryCV6coGJyLE5LVBf160YejHfojYje08iiix2rGnFjf5cJ1bwEqMldjmm1Yo18XOd2HlmcxU
	oZvN7fBawhqQikPiMroWAM+ONSKQ6RAn0lnidkTZGhOhRohuG3hA6xXTrDGp2Ke16RDYLL0Ah2/QA
	vuMT0jT4ZFsAFKUGUP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlY-00000006jqn-1KcB;
	Tue, 13 Jan 2026 08:28:40 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlV-00000006jj4-18SQ
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:28:38 +0000
X-UUID: d89a2cecf05911f0a38c85956e01ac42-20260113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e19622ed-3017-495c-ac1e-4f6fae6d5620,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:c6c1247977cc40706e05238dd5d60eee,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d89a2cecf05911f0a38c85956e01ac42-20260113
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 627804380; Tue, 13 Jan 2026 16:28:32 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	andy@kernel.org,
	akpm@linux-foundation.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	linus.walleij@linaro.org,
	nathan@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 13/14] riscv: lib: add strchr implementation
Date: Tue, 13 Jan 2026 16:27:47 +0800
Message-Id: <20260113082748.250916-14-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_002837_627525_665A1713 
X-CRM114-Status: GOOD (  13.45  )
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

Add a basic assembly implementation of strchr() for RISC-V.
This provides a functional byte-by-byte version as a foundation
for future optimizations.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 arch/riscv/include/asm/string.h |  3 +++
 arch/riscv/lib/Makefile         |  1 +
 arch/riscv/lib/strchr.S         | 35 +++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |  5 ++++-
 4 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/strchr.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 16634d67c217..ca3ade82b124 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -31,6 +31,9 @@ extern asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
 
 #define __HAVE_ARCH_STRNLEN
 extern asmlinkage __kernel_size_t strnlen(const char *, size_t);
+
+#define __HAVE_ARCH_STRCHR
+extern asmlinkage char *strchr(const char *, int);
 #endif
 
 /* For those files which don't want to check by kasan. */
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 0969d8136df0..b7f804dce1c3 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -8,6 +8,7 @@ lib-y			+= strcmp.o
 lib-y			+= strlen.o
 lib-y			+= strncmp.o
 lib-y			+= strnlen.o
+lib-y			+= strchr.o
 endif
 lib-y			+= csum.o
 ifeq ($(CONFIG_MMU), y)
diff --git a/arch/riscv/lib/strchr.S b/arch/riscv/lib/strchr.S
new file mode 100644
index 000000000000..48c3a9da53e3
--- /dev/null
+++ b/arch/riscv/lib/strchr.S
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Copyright (C) 2025 Feng Jiang <jiangfeng@kylinos.cn>
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+/* char *strchr(const char *s, int c) */
+SYM_FUNC_START(strchr)
+	/*
+	 * Parameters
+	 *   a0 - The string to be searched
+	 *   a1 - The character to search for
+	 *
+	 * Returns
+	 *   a0 - Address of first occurrence of 'c' or 0
+	 *
+	 * Clobbers
+	 *   t0
+	 */
+	andi	a1, a1, 0xff
+1:
+	lbu	t0, 0(a0)
+	beq	t0, a1, 2f
+	addi	a0, a0, 1
+	bnez	t0, 1b
+	li	a0, 0
+2:
+	ret
+SYM_FUNC_END(strchr)
+
+SYM_FUNC_ALIAS_WEAK(__pi_strchr, strchr)
+EXPORT_SYMBOL(strchr)
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index d7c0533108be..e7b3d748c913 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -2,7 +2,7 @@
 
 purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
-purgatory-y += strcmp.o strlen.o strncmp.o strnlen.o
+purgatory-y += strcmp.o strlen.o strncmp.o strnlen.o strchr.o
 endif
 
 targets += $(purgatory-y)
@@ -35,6 +35,9 @@ $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
 $(obj)/strnlen.o: $(srctree)/arch/riscv/lib/strnlen.S FORCE
 	$(call if_changed_rule,as_o_S)
 
+$(obj)/strchr.o: $(srctree)/arch/riscv/lib/strchr.S FORCE
+	$(call if_changed_rule,as_o_S)
+
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
 CFLAGS_string.o := -D__DISABLE_EXPORTS
 CFLAGS_ctype.o := -D__DISABLE_EXPORTS
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
