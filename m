Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042DCC43470
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:18:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9128F61056
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9128F61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iVhn+V9kLqlhVCav9yhWSeQhQMBghk7ADNceMqfiEo=; b=WS6uUDoKWFUA4Mxu7BlSX4Rx19
	0CQEK/FPKbeVhWDFJh6qRlHvnHu7G9z5AL7XdC/gJ2KD4Q740HjA+T4sHMQt4tmdjQJ2d2DSEgh/Q
	UmGQ15JMtHdBx9YnhM4sD6yKcirfzikfFtuQMsLBN7kgJ6gXK0VHBcpp/wwZ8mXdoySVv4vabLC5p
	4bMd69VYzoAb/Pp721oWkm3bHwKu0ezRoDC9CC+ZmUglR01wzjpxV89SoF/Bde4gPEP9p83Bm1o+i
	XtRe8AB1x5OkrzDmQ+kO4R2Uh85IyBEp9ldu4+7QzBJzqY1mnchhgdZ6Hvvte0GnXRQuLgYOrfy2s
	Ncj61mdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLZS-00DCbU-3d; Fri, 02 Apr 2021 15:18:51 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLYl-00DCMM-Rb; Fri, 02 Apr 2021 15:18:10 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFj2vNPz9v2lt;
 Fri,  2 Apr 2021 17:18:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NJ34BehnDmHj; Fri,  2 Apr 2021 17:18:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFj1ndyz9v2ls;
 Fri,  2 Apr 2021 17:18:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2774B8BB7C;
 Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wc8EW3tptikR; Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 99C3C8BB7B;
 Fri,  2 Apr 2021 17:18:02 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 701DA67989; Fri,  2 Apr 2021 15:18:02 +0000 (UTC)
Message-Id: <68db4e57bb88c523f76dcae12feafbb0cae1a85d.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 01/20] cmdline: Add generic function to build command line.
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org
Date: Fri,  2 Apr 2021 15:18:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_161808_036211_ECE23D71 
X-CRM114-Status: GOOD (  16.82  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This code provides architectures with a way to build command line
based on what is built in the kernel and what is handed over by the
bootloader, based on selected compile-time options.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3:
- Addressed comments from Will
- Added capability to have src == dst
v4:
- Add cmdline_strlcpy()
- Removed cmdline_build() macro, __cmdline_build() becomes cmdline_build()
- Fixed the destination length to COMMAND_LINE_SIZE
- Truncate at a space not in a quote when too long
- Added a message when forcing the command line
---
 include/linux/cmdline.h | 79 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 include/linux/cmdline.h

diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
new file mode 100644
index 000000000000..a0773dc365c7
--- /dev/null
+++ b/include/linux/cmdline.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_CMDLINE_H
+#define _LINUX_CMDLINE_H
+
+#include <linux/string.h>
+#include <linux/printk.h>
+#include <asm/setup.h>
+
+/* Allow users to override strlcat/strlcpy, powerpc can't use strings so early*/
+#ifndef cmdline_strlcat
+#define cmdline_strlcat strlcat
+#define cmdline_strlcpy strlcpy
+#endif
+
+/*
+ * This function will append or prepend a builtin command line to the command
+ * line provided by the bootloader. Kconfig options can be used to alter
+ * the behavior of this builtin command line.
+ * @dst: The destination of the final command line (Min. size COMMAND_LINE_SIZE)
+ * @src: The starting string or NULL if there isn't one. Must not equal dst.
+ * Returns: false if the string was truncated, true otherwise
+ */
+static __always_inline bool __cmdline_build(char *dst, const char *src)
+{
+	int len;
+	char *ptr, *last_space;
+	bool in_quote = false;
+
+	if (IS_ENABLED(CONFIG_CMDLINE_FORCE))
+		src = NULL;
+
+	dst[0] = 0;
+
+	if (IS_ENABLED(CONFIG_CMDLINE_PREPEND))
+		len = cmdline_strlcat(dst, CONFIG_CMDLINE " ", COMMAND_LINE_SIZE);
+
+	len = cmdline_strlcat(dst, src, COMMAND_LINE_SIZE);
+
+	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND))
+		len = cmdline_strlcat(dst, " " CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+
+	if (len < COMMAND_LINE_SIZE - 1)
+		return true;
+
+	for (ptr = dst; *ptr; ptr++) {
+		if (*ptr == '"')
+			in_quote = !in_quote;
+		if (*ptr == ' ' && !in_quote)
+			last_space = ptr;
+	}
+	if (last_space)
+		*last_space = 0;
+
+	return false;
+}
+
+/*
+ * This function will append or prepend a builtin command line to the command
+ * line provided by the bootloader. Kconfig options can be used to alter
+ * the behavior of this builtin command line.
+ * @dst: The destination of the final command line (Min. size COMMAND_LINE_SIZE)
+ * @src: The starting string or NULL if there isn't one.
+ */
+static __always_inline void cmdline_build(char *dst, const char *src)
+{
+	static char tmp[COMMAND_LINE_SIZE] __initdata;
+
+	if (src == dst) {
+		cmdline_strlcpy(tmp, src, COMMAND_LINE_SIZE);
+		src = tmp;
+	}
+	if (!__cmdline_build(dst, src))
+		pr_warn("Command line is too long, it has been truncated\n");
+
+	if (IS_ENABLED(CONFIG_CMDLINE_FORCE))
+		pr_info("Forcing kernel command line to: %s\n", dst);
+}
+
+#endif /* _LINUX_CMDLINE_H */
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
