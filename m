Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19F1CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqmE+dXNaQfHCkGMvbSdZkOT9kKvhFpWYxsZJD3MIZo=; b=BqV4hHSP9Gwzv/
	5YEXqbnl5Lik2bLhKfKLkP18G8MNOWVsYzbXBhqaJrEBnM63jHFVYWS402N2DKUX167ZEg84aCHpI
	4ZWj9YKJ4LuBhfajxk1kXBS5DJnZmR5SVDXwt3wWjcR8FOuJQ1v1yQWupBkbGuCdwmURmraw1Fqk9
	XwaeZZpzC4KOtvCtxzYRDcUw2W+98wUy+gsYCMj9oRmAI0V+/4BbutYwjUTyhpNjea3EJy+QLsiCy
	HgqBlzJeSxHjfRFRdwNw8dpRuoi2c5x1alRsE94nctb9DixmWO1uYsNgHPTW6blbuvLnMH0/jKYVO
	bccOSQY+I2VUW7kkBAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRYe-00000005Pof-11Oh;
	Wed, 10 Apr 2024 06:35:44 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRYX-00000005PhG-2Wvv
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 06:35:43 +0000
X-QQ-mid: bizesmtp86t1712730886thpdkm0m
X-QQ-Originating-IP: qpU6BkNfrlioxOZjNw8VTqRLhm3mvtT81kiLaWcj8Pg=
Received: from HX01040082.powercore.com.cn ( [14.19.197.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Apr 2024 14:34:40 +0800 (CST)
X-QQ-SSF: 01400000000000B09000000A0000000
X-QQ-FEAT: D5krnlQGVfJp7iXspNT0lTkPO8Udu5eTrn+UALAwa/e8Lqb/4MhOd1lEyMSHy
	N2wPq8W5p30FX8llAgW8imG47we+3g3Fo1yo5HgyW8M96H3F3ssWJkxTcy0OXRdB/vr9gmr
	mS0DLqFxtycu0CCFDmzd5ebDVl8a7Q/j4+H7qkanPQtPljkyYqK7Rfoe0tc0PQ4i3poBSLX
	d6ZPK9kUkqa4lwD0ThclcQOYw3TLid8PukXqye3Q9I2G4NPG6w3PCTcmc/QDw5Nx4hWAZPz
	gwxcP4Ww3uFikpG15UjY+P1A/xSBCNBueYSVr3c05t7kWDIYAu/nbf/M7azDrA6nDB0Y3Xx
	0vSeCMGyTj0JTmqcRfzfp4NgTMcr2A/b/wNEmF8kB3hf8jcbfOdK5dz0eZcQ6Uy6dm7eTj4
	pdGl7diJ0kTw42z4sOHctFwwmw/MCakR
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 17986055640822494182
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	atishp@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: [PATCH 1/3] riscv: Support for early console.
Date: Wed, 10 Apr 2024 14:34:30 +0800
Message-Id: <20240410063432.23058-2-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410063432.23058-1-jinglin.wen@shingroup.cn>
References: <20240410063432.23058-1-jinglin.wen@shingroup.cn>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_233538_192484_C23968E9 
X-CRM114-Status: GOOD (  19.70  )
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

This feature is mainly used for debugging during the early startup
process. Currently, the implementation of this function is based
on the sbi interface.

By setting the CONFIG_RISCV_EARLY_CONSOLE option, this
function can be enabled, which subsequently sets the log level
to CONSOLE_LOGLEVEL_MOTORMOUT.

Signed-off-by: Jinglin Wen <jinglin.wen@shingroup.cn>
---
 arch/riscv/include/asm/early_console.h |  23 ++++++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/early_console.c      | 108 +++++++++++++++++++++++++
 arch/riscv/kernel/setup.c              |   2 +
 4 files changed, 134 insertions(+)
 create mode 100644 arch/riscv/include/asm/early_console.h
 create mode 100644 arch/riscv/kernel/early_console.c

diff --git a/arch/riscv/include/asm/early_console.h b/arch/riscv/include/asm/early_console.h
new file mode 100644
index 000000000000..0683a42e9207
--- /dev/null
+++ b/arch/riscv/include/asm/early_console.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _ASM_EARLY_CONSOLE_H
+#define _ASM_EARLY_CONSOLE_H
+#ifdef __KERNEL__
+
+#include <linux/compiler.h>
+#include <linux/init.h>
+
+void __init early_console_init(void);
+
+/* early_console libs */
+void early_console_puts(const char *s);
+int early_console_write(const char *s, int n);
+void early_console_printf(const char *fmt, ...);
+void early_console_progress(char *s, unsigned short hex);
+
+#ifdef CONFIG_RISCV_EARLY_CONSOLE_SBI
+void __init hvc_sbi_early_init(void (**putc)(char c));
+#endif /* CONFIG_HVC_RISCV_SBI */
+
+#endif /* __KERNEL__ */
+#endif /* _ASM_EARLY_CONSOLE_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 81d94a8ee10f..ef037e3762f1 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -48,6 +48,7 @@ obj-y	+= ptrace.o
 obj-y	+= reset.o
 obj-y	+= return_address.o
 obj-y	+= setup.o
+obj-y	+= early_console.o
 obj-y	+= signal.o
 obj-y	+= syscall_table.o
 obj-y	+= sys_riscv.o
diff --git a/arch/riscv/kernel/early_console.c b/arch/riscv/kernel/early_console.c
new file mode 100644
index 000000000000..64f3a5705413
--- /dev/null
+++ b/arch/riscv/kernel/early_console.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Early console support for RISCV
+ */
+
+#include <linux/stdarg.h>
+#include <linux/types.h>
+#include <linux/console.h>
+#include <asm/sbi.h>
+#include <asm/early_console.h>
+
+/* interface for early console output characters */
+void (*riscv_early_console_putc)(char c);
+
+void early_console_puts(const char *s)
+{
+	if (riscv_early_console_putc) {
+		char c;
+
+		if (s && *s != '\0') {
+			while ((c = *s++) != '\0')
+				riscv_early_console_putc(c);
+		}
+	}
+}
+
+int early_console_write(const char *s, int n)
+{
+	int remain = n;
+	char c;
+
+	if (!riscv_early_console_putc)
+		return 0;
+
+	if (s && *s != '\0') {
+		while (((c = *s++) != '\0') && (remain-- > 0))
+			riscv_early_console_putc(c);
+	}
+
+	return n - remain;
+}
+
+#define EARLY_CONSOLE_BUFSIZE 256
+void early_console_printf(const char *fmt, ...)
+{
+	if (riscv_early_console_putc) {
+		char buf[EARLY_CONSOLE_BUFSIZE];
+		va_list args;
+
+		va_start(args, fmt);
+		vsnprintf(buf, EARLY_CONSOLE_BUFSIZE, fmt, args);
+		early_console_puts(buf);
+		va_end(args);
+	}
+}
+
+void __init early_console_progress(char *s, unsigned short hex)
+{
+	early_console_puts(s);
+	early_console_puts("\n");
+}
+
+/*
+ * Console based on early console
+ */
+static void riscv_early_console_write(struct console *con, const char *s,
+		unsigned int n)
+{
+	early_console_write(s, n);
+}
+
+static struct console riscv_early_console = {
+	.name	= "riscv_early_con",
+	.write	= riscv_early_console_write,
+	.flags	= CON_PRINTBUFFER | CON_ENABLED | CON_BOOT | CON_ANYTIME,
+	.index	= 0,
+};
+
+static void __init register_early_console(void)
+{
+	if (!riscv_early_console_putc)
+		return;
+
+	add_preferred_console("riscv_early_con", 0, NULL);
+	register_console(&riscv_early_console);
+}
+
+/*
+ * This is called after sbi_init.
+ */
+void __init early_console_init(void)
+{
+	/*
+	 * Set riscv_early_console_putc.
+	 * If there are other output interfaces, you can add corresponding code
+	 * to initialize riscv_early_console_putc.
+	 */
+#if defined(CONFIG_RISCV_EARLY_CONSOLE_SBI)
+	/* using the sbi */
+	hvc_sbi_early_init(&riscv_early_console_putc);
+#else
+	/* using other */
+#endif
+
+	console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
+	register_early_console();
+}
+
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 4f73c0ae44b2..1b48630f0861 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -36,6 +36,7 @@
 #include <asm/thread_info.h>
 #include <asm/kasan.h>
 #include <asm/efi.h>
+#include <asm/early_console.h>
 
 #include "head.h"
 
@@ -255,6 +256,7 @@ void __init setup_arch(char **cmdline_p)
 
 	early_ioremap_setup();
 	sbi_init();
+	early_console_init();
 	jump_label_init();
 	parse_early_param();
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
