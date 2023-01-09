Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9EFC61DB3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BnciTdIAlyax4635b8KlMnwm1gze/XlEZFLaqXQcdm8=; b=AqR3RUG5j0PelJ
	ew0znZz2KPr78wmOlnsZN2qrTXsPZueigRZlCNw2fn4IFzoCaBKV2XDi9D0Gcfaj8W4q6o87vRSRq
	K53rvEZy5vDzTW8njtotVWN811PwA2KVLSsSqw7Zg0sA0xiwvko58CWtr+TH0mcoTLKV3J+cg0QUN
	6ruDAmr0ljXQLE90TuVLj0itnDPOE+oukvMi++tlr8jS2xtqlzZV+NqtHeW6815pC9ezD41dIZxD7
	blWXGXiRem9vmq4M9V4BfhnAA1/CM/FR++NawFw48F13wHgrHU/CvLt8L71KL7VbohQL3CzZCYjRy
	NwEJ86XINIyTy9t+zDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwqg-003GsP-M0; Mon, 09 Jan 2023 18:26:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwig-003DQw-D6
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 18:18:06 +0000
Received: from wf0783.dip.tu-dresden.de ([141.76.183.15] helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pEwic-0005hU-FF; Mon, 09 Jan 2023 19:17:58 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 4/5] RISC-V: add infrastructure to allow different str* implementations
Date: Mon,  9 Jan 2023 19:17:54 +0100
Message-Id: <20230109181755.2383085-5-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109181755.2383085-1-heiko@sntech.de>
References: <20230109181755.2383085-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_101802_577129_F79C7DAE 
X-CRM114-Status: GOOD (  17.20  )
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

Depending on supported extensions on specific RISC-V cores,
optimized str* functions might make sense.

This adds basic infrastructure to allow patching the function calls
via alternatives later on.

The Linux kernel provides standard implementations for string functions
but when architectures want to extend them, they need to provide their
own.

The added generic string functions are done in assembler (taken from
disassembling the main-kernel functions for now) to allow us to control
the used registers and extend them with optimized variants.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/string.h | 10 +++++++++
 arch/riscv/kernel/riscv_ksyms.c |  3 +++
 arch/riscv/lib/Makefile         |  3 +++
 arch/riscv/lib/strcmp.S         | 37 ++++++++++++++++++++++++++++++
 arch/riscv/lib/strlen.S         | 28 +++++++++++++++++++++++
 arch/riscv/lib/strncmp.S        | 40 +++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   | 13 +++++++++++
 7 files changed, 134 insertions(+)
 create mode 100644 arch/riscv/lib/strcmp.S
 create mode 100644 arch/riscv/lib/strlen.S
 create mode 100644 arch/riscv/lib/strncmp.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 909049366555..a96b1fea24fe 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -18,6 +18,16 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
+
+#define __HAVE_ARCH_STRCMP
+extern asmlinkage int strcmp(const char *cs, const char *ct);
+
+#define __HAVE_ARCH_STRLEN
+extern asmlinkage __kernel_size_t strlen(const char *);
+
+#define __HAVE_ARCH_STRNCMP
+extern asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
+
 /* For those files which don't want to check by kasan. */
 #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
 #define memcpy(dst, src, len) __memcpy(dst, src, len)
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
index 5ab1c7e1a6ed..a72879b4249a 100644
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ b/arch/riscv/kernel/riscv_ksyms.c
@@ -12,6 +12,9 @@
 EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memmove);
+EXPORT_SYMBOL(strcmp);
+EXPORT_SYMBOL(strlen);
+EXPORT_SYMBOL(strncmp);
 EXPORT_SYMBOL(__memset);
 EXPORT_SYMBOL(__memcpy);
 EXPORT_SYMBOL(__memmove);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..6c74b0bedd60 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,9 @@ lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
+lib-y			+= strcmp.o
+lib-y			+= strlen.o
+lib-y			+= strncmp.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
new file mode 100644
index 000000000000..94440fb8390c
--- /dev/null
+++ b/arch/riscv/lib/strcmp.S
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+/* int strcmp(const char *cs, const char *ct) */
+SYM_FUNC_START(strcmp)
+	/*
+	 * Returns
+	 *   a0 - comparison result, value like strcmp
+	 *
+	 * Parameters
+	 *   a0 - string1
+	 *   a1 - string2
+	 *
+	 * Clobbers
+	 *   t0, t1, t2
+	 */
+	mv	t2, a1
+1:
+	lbu	t1, 0(a0)
+	lbu	t0, 0(a1)
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	beq	t1, t0, 3f
+	li	a0, 1
+	bgeu	t1, t0, 2f
+	li	a0, -1
+2:
+	mv	a1, t2
+	ret
+3:
+	bnez	t1, 1b
+	li	a0, 0
+	j	2b
+SYM_FUNC_END(strcmp)
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
new file mode 100644
index 000000000000..09a7aaff26c8
--- /dev/null
+++ b/arch/riscv/lib/strlen.S
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+/* int strlen(const char *s) */
+SYM_FUNC_START(strlen)
+	/*
+	 * Returns
+	 *   a0 - string length
+	 *
+	 * Parameters
+	 *   a0 - String to measure
+	 *
+	 * Clobbers:
+	 *   t0, t1
+	 */
+	mv	t1, a0
+1:
+	lbu	t0, 0(t1)
+	bnez	t0, 2f
+	sub	a0, t1, a0
+	ret
+2:
+	addi	t1, t1, 1
+	j	1b
+SYM_FUNC_END(strlen)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
new file mode 100644
index 000000000000..493ab6febcb2
--- /dev/null
+++ b/arch/riscv/lib/strncmp.S
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+/* int strncmp(const char *cs, const char *ct, size_t count) */
+SYM_FUNC_START(strncmp)
+	/*
+	 * Returns
+	 *   a0 - comparison result, value like strncmp
+	 *
+	 * Parameters
+	 *   a0 - string1
+	 *   a1 - string2
+	 *   a2 - number of characters to compare
+	 *
+	 * Clobbers
+	 *   t0, t1, t2
+	 */
+	li	t0, 0
+1:
+	beq	a2, t0, 4f
+	add	t1, a0, t0
+	add	t2, a1, t0
+	lbu	t1, 0(t1)
+	lbu	t2, 0(t2)
+	beq	t1, t2, 3f
+	li	a0, 1
+	bgeu	t1, t2, 2f
+	li	a0, -1
+2:
+	ret
+3:
+	addi	t0, t0, 1
+	bnez	t1, 1b
+4:
+	li	a0, 0
+	j	2b
+SYM_FUNC_END(strncmp)
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index dd58e1d99397..d16bf715a586 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -2,6 +2,7 @@
 OBJECT_FILES_NON_STANDARD := y
 
 purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
+purgatory-y += strcmp.o strlen.o strncmp.o
 
 targets += $(purgatory-y)
 PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
@@ -18,6 +19,15 @@ $(obj)/memcpy.o: $(srctree)/arch/riscv/lib/memcpy.S FORCE
 $(obj)/memset.o: $(srctree)/arch/riscv/lib/memset.S FORCE
 	$(call if_changed_rule,as_o_S)
 
+$(obj)/strcmp.o: $(srctree)/arch/riscv/lib/strcmp.S FORCE
+	$(call if_changed_rule,as_o_S)
+
+$(obj)/strlen.o: $(srctree)/arch/riscv/lib/strlen.S FORCE
+	$(call if_changed_rule,as_o_S)
+
+$(obj)/strncmp.o: $(srctree)/arch/riscv/lib/strncmp.S FORCE
+	$(call if_changed_rule,as_o_S)
+
 $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
@@ -77,6 +87,9 @@ CFLAGS_ctype.o			+= $(PURGATORY_CFLAGS)
 AFLAGS_REMOVE_entry.o		+= -Wa,-gdwarf-2
 AFLAGS_REMOVE_memcpy.o		+= -Wa,-gdwarf-2
 AFLAGS_REMOVE_memset.o		+= -Wa,-gdwarf-2
+AFLAGS_REMOVE_strcmp.o		+= -Wa,-gdwarf-2
+AFLAGS_REMOVE_strlen.o		+= -Wa,-gdwarf-2
+AFLAGS_REMOVE_strncmp.o		+= -Wa,-gdwarf-2
 
 $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
 		$(call if_changed,ld)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
