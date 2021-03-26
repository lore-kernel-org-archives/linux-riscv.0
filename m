Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A267BC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 13:46:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E4861949
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 13:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28E4861949
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+r5WXQBeq/PDSQqSd2ZjRIBC1M1uKBjBaJPKusm0vw=; b=ZMJ7Q4HHO2XfKYBdH8g5f46EBg
	pYf3rxMyXskeAAI1sgnbyAfXf7IZiGGpmkm5iuoNM4E3TdW0sSwaYTXMlFec6H/v6K8N8B9wx+vzR
	xt1sGUfU4YgYCSdxWppuWflGjyvDwR7sTkA0vSreXzLQKHHVaC6wCfWGE445Rq0stiZpxTSrhh1Eh
	ky1dl0UTMiM6FqbX3QhY+LGGQtL2gYyxrTZkUOCE3jgjza+DyY2UUi7Fxpj9M8lgrrK70i5bPOpBg
	+UAFSpTGqkFChkA/i1jBI/PvXK9Ms3o7Teey8OhMJxvycSvkIfYpuWqOrRwmpGrR9fNtB5ek/uA3B
	IMX65o/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPmmb-003dPg-HS; Fri, 26 Mar 2021 13:45:49 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPmlf-003d5I-Nl; Fri, 26 Mar 2021 13:44:55 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWM2kR9z9tyyX;
 Fri, 26 Mar 2021 14:44:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WniDc8Yabw7u; Fri, 26 Mar 2021 14:44:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWM1m9wz9tyyV;
 Fri, 26 Mar 2021 14:44:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 18F9E8B8C9;
 Fri, 26 Mar 2021 14:44:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BZpKcB1zy9W0; Fri, 26 Mar 2021 14:44:48 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C3A018B8C7;
 Fri, 26 Mar 2021 14:44:47 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4859067611; Fri, 26 Mar 2021 13:44:48 +0000 (UTC)
Message-Id: <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 01/17] cmdline: Add generic function to build command line.
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org
Date: Fri, 26 Mar 2021 13:44:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_134451_935274_4C13F2BB 
X-CRM114-Status: GOOD (  13.92  )
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
---
 include/linux/cmdline.h | 57 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 include/linux/cmdline.h

diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
new file mode 100644
index 000000000000..dea87edd41be
--- /dev/null
+++ b/include/linux/cmdline.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_CMDLINE_H
+#define _LINUX_CMDLINE_H
+
+#include <linux/string.h>
+
+/* Allow architectures to override strlcat, powerpc can't use strings so early */
+#ifndef cmdline_strlcat
+#define cmdline_strlcat strlcat
+#endif
+
+/*
+ * This function will append or prepend a builtin command line to the command
+ * line provided by the bootloader. Kconfig options can be used to alter
+ * the behavior of this builtin command line.
+ * @dst: The destination of the final appended/prepended string.
+ * @src: The starting string or NULL if there isn't one.
+ * @len: the length of dest buffer.
+ */
+static __always_inline void __cmdline_build(char *dst, const char *src, size_t len)
+{
+	if (!len || src == dst)
+		return;
+
+	if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !src) {
+		dst[0] = 0;
+		cmdline_strlcat(dst, CONFIG_CMDLINE, len);
+		return;
+	}
+
+	if (dst != src)
+		dst[0] = 0;
+
+	if (IS_ENABLED(CONFIG_CMDLINE_PREPEND))
+		cmdline_strlcat(dst, CONFIG_CMDLINE " ", len);
+
+	cmdline_strlcat(dst, src, len);
+
+	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND))
+		cmdline_strlcat(dst, " " CONFIG_CMDLINE, len);
+}
+
+#define cmdline_build(dst, src, len) do {				\
+	char *__c_dst = (dst);						\
+	const char *__c_src = (src);					\
+									\
+	if (__c_src == __c_dst) {					\
+		static char __c_tmp[COMMAND_LINE_SIZE] __initdata = "";	\
+									\
+		cmdline_strlcat(__c_tmp, __c_src, COMMAND_LINE_SIZE);	\
+		__cmdline_build(__c_dst, __c_tmp, (len));		\
+	} else {							\
+		__cmdline_build(__c_dst, __c_src, (len));		\
+	}								\
+} while (0)
+
+#endif /* _LINUX_CMDLINE_H */
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
