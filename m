Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A79BC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 22:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOrEslinngaKTEI0YiLpwhk9UXm5vtVZvdxBtiygCAM=; b=eXTixK65buEoTN
	Mc7k7ClTHVeWkd24nAgH+9JyPWLyezeT0joLRr0O19HJJgD1HxpiVLPhNaJeY2Th2UxZdOBGIpqEH
	K0xG64aRIBNT6cYshjrX2xUKAYS3q5N7mQrTI11P26DKm4j2R8MDu+uV8x1ESUt0Yyrs+XHoHKr8j
	Y4dwVTClEovkZYQo9QGzrSFYq2UlTGvF++LVJT5JhYDEjqEYEZx3rMN0hA3jBBZF5jbKveQDPfMPY
	StyBXqHpAOqd/JmF4+F2ZdsnmiEISneioF81nk/YAXDwjzEWpdPM4UhkJKXD4hbYLM3gp0vFEIxxi
	UyxAw71+PORs0miNl4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xy-005QI3-Tw; Fri, 04 Nov 2022 22:52:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xr-005QEM-Mb
	for linux-riscv@bombadil.infradead.org; Fri, 04 Nov 2022 22:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MbV2ZBrqdW8F7cBHbvVRMGLlpFD6j6urM4eV74Sn5qo=; b=BzKV480puwv3I5RF/+GGzh2fwL
	sN5QrOPAdIOEzHwQb4bNpjSafQCbQr5Rm5F46ROctv7CjZSyX0auhlyw0PA9cO9V0wtvWWu+UzY4M
	BCN/I6aGpgzAhXPAh7IVJRHyc7ItqMAk94UdBwQFzwbDcgzhe5zDlkkRXWBVyHAzUa6ysQTEY443v
	xMqfKKvjTlatrVAkZsnYJfo0so9FUCWQ+Ml+lgEW4QKp1jKhS7ULbWypq5GRohwYRm7eWADG+Ld7E
	6r+rJbPEQGSnBE1bPLXahxngUzMWHAWreFbsOfyXwBTPXG1v6tn9hRQW/eIdY5WACwgspq2nYAOjf
	PP8ykgsw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xn-0095Ui-TS
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 22:52:14 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1or5Xh-0001sc-TT; Fri, 04 Nov 2022 23:52:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH RFC 7/9] RISC-V: add infrastructure to allow different str* implementations
Date: Fri,  4 Nov 2022 23:51:51 +0100
Message-Id: <20221104225153.2710873-8-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104225153.2710873-1-heiko@sntech.de>
References: <20221104225153.2710873-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_225212_262449_FA221590 
X-CRM114-Status: GOOD (  19.65  )
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

Depending on supported extensions on specific RISC-V cores,
optimized str* functions might make sense.

This adds basic infrastructure to allow patching the function calls
via alternatives later on.

The main idea is to have the core str* functions be inline functions
which then call the most optimized variant and this call then be
replaced via alternatives.

The big advantage is that we don't need additional calls.
Though we need to duplicate the generic functions as the main code
expects either itself or the architecture to provide the str* functions.

The added *_generic functions are done in assembler (taken from
disassembling the main-kernel functions for now) to allow us to control
the used registers.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/string.h | 77 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/image-vars.h  |  6 +--
 arch/riscv/lib/Makefile         |  4 ++
 arch/riscv/lib/strcmp.S         | 25 +++++++++++
 arch/riscv/lib/string.c         | 20 +++++++++
 arch/riscv/lib/strlen.S         | 17 ++++++++
 arch/riscv/lib/strncmp.S        | 27 ++++++++++++
 7 files changed, 173 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/lib/strcmp.S
 create mode 100644 arch/riscv/lib/string.c
 create mode 100644 arch/riscv/lib/strlen.S
 create mode 100644 arch/riscv/lib/strncmp.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 909049366555..41eef000d18f 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -18,6 +18,83 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
+
+#define __HAVE_ARCH_STRCMP
+extern asmlinkage int __strcmp_generic(const char *cs, const char *ct);
+
+static __always_inline int strcmp(const char *cs, const char *ct)
+{
+#ifdef RISCV_EFISTUB
+	return __strcmp_generic(cs, ct);
+#else
+	register const char* a0 asm("a0") = cs;
+	register const char* a1 asm("a1") = ct;
+	register int a0_out asm("a0");
+
+	asm volatile("call __strcmp_generic\n\t"
+		: "=r"(a0_out)
+		: "r"(a0), "r"(a1)
+		: "ra", "t0", "t1", "t2");
+
+	return a0_out;
+#endif
+}
+
+#define __HAVE_ARCH_STRNCMP
+extern asmlinkage int __strncmp_generic(const char *cs,
+					const char *ct, size_t count);
+extern asmlinkage int __strncmp_zbb(const char *cs,
+				    const char *ct, size_t count);
+
+static __always_inline int strncmp(const char *cs, const char *ct, size_t count)
+{
+#ifdef RISCV_EFISTUB
+	return __strncmp_generic(cs, ct, count);
+#else
+	register const char* a0 asm("a0") = cs;
+	register const char* a1 asm("a1") = ct;
+	register size_t a2 asm("a2") = count;
+	register int a0_out asm("a0");
+
+	asm volatile("call __strncmp_generic\n\t"
+		: "=r"(a0_out)
+		: "r"(a0), "r"(a1), "r"(a2)
+		: "ra", "t0", "t1", "t2");
+
+	return a0_out;
+#endif
+}
+
+#define __HAVE_ARCH_STRLEN
+extern asmlinkage __kernel_size_t __strlen_generic(const char *);
+
+static __always_inline __kernel_size_t strlen(const char *s)
+{
+	register const char* a0 asm("a0") = s;
+	register int a0_out asm("a0");
+
+	asm volatile(
+		"call __strlen_generic\n\t"
+		: "=r"(a0_out)
+		: "r"(a0)
+		: "ra", "t0", "t1");
+
+	return a0_out;
+}
+
+#define __HAVE_ARCH_STRSTARTS
+static inline bool strstarts(const char *str, const char *prefix)
+{
+#ifdef RISCV_EFISTUB
+	return __strncmp_generic(str, prefix, __strlen_generic(prefix)) == 0;
+#else
+	return strncmp(str, prefix, strlen(prefix)) == 0;
+#endif
+}
+
+#define __HAVE_ARCH_STRCHR
+char *strchr(const char *s, int c);
+
 /* For those files which don't want to check by kasan. */
 #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
 #define memcpy(dst, src, len) __memcpy(dst, src, len)
diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index d6e5f739905e..2f270b9fde63 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -25,10 +25,10 @@
  */
 __efistub_memcmp		= memcmp;
 __efistub_memchr		= memchr;
-__efistub_strlen		= strlen;
+__efistub___strlen_generic	= __strlen_generic;
 __efistub_strnlen		= strnlen;
-__efistub_strcmp		= strcmp;
-__efistub_strncmp		= strncmp;
+__efistub___strcmp_generic	= __strcmp_generic;
+__efistub___strncmp_generic	= __strncmp_generic;
 __efistub_strrchr		= strrchr;
 
 __efistub__start		= _start;
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..38a18ce9acef 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,10 @@ lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
+lib-y			+= string.o
+lib-y			+= strcmp.o
+lib-y			+= strlen.o
+lib-y			+= strncmp.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
new file mode 100644
index 000000000000..c74742699cd5
--- /dev/null
+++ b/arch/riscv/lib/strcmp.S
@@ -0,0 +1,25 @@
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+/* int __strcmp_generic(const char *cs, const char *ct) */
+ENTRY(__strcmp_generic)
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
+END(__strcmp_generic)
+EXPORT_SYMBOL(__strcmp_generic)
diff --git a/arch/riscv/lib/string.c b/arch/riscv/lib/string.c
new file mode 100644
index 000000000000..b595c95d0f23
--- /dev/null
+++ b/arch/riscv/lib/string.c
@@ -0,0 +1,20 @@
+#include <linux/export.h>
+#include <linux/types.h>
+#include <linux/printk.h>
+
+/**
+ * strchr - Find the first occurrence of a character in a string
+ * @s: The string to be searched
+ * @c: The character to search for
+ *
+ * Note that the %NUL-terminator is considered part of the string, and can
+ * be searched for.
+ */
+char *strchr(const char *s, int c)
+{
+	for (; *s != (char)c; ++s)
+		if (*s == '\0')
+			return NULL;
+	return (char *)s;
+}
+EXPORT_SYMBOL(strchr);
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
new file mode 100644
index 000000000000..ed27b933ddcb
--- /dev/null
+++ b/arch/riscv/lib/strlen.S
@@ -0,0 +1,17 @@
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+/* int __strlen_generic(const char *s) */
+ENTRY(__strlen_generic)
+	mv	t1, a0
+1:
+	lbu	t0, 0(t1)
+	bnez	t0, 2f
+	sub	a0, t1, a0
+	ret
+2:
+	addi	t1, t1, 1
+	j	1b
+END(__strlen_generic)
+EXPORT_SYMBOL(__strlen_generic)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
new file mode 100644
index 000000000000..9dbb85490127
--- /dev/null
+++ b/arch/riscv/lib/strncmp.S
@@ -0,0 +1,27 @@
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+/* int __strncmp_generic(const char *cs, const char *ct, size_t count) */
+ENTRY(__strncmp_generic)
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
+END(__strncmp_generic)
+EXPORT_SYMBOL(__strncmp_generic)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
