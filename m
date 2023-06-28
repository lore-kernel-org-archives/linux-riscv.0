Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E92EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 18:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TXwv8oBrKYfizt94yYOkdqLWBoOb0CK00C1euhhT7Q=; b=jm/h77zp11CdEC
	Aim+BRj716jQ1leR1OmnPwczyEgx4OFwriR/9M3znkW4Kz0/4bFMzHDcNZVB1SghCidDYeqZCp2qb
	i+Bb4/LADTyw/gojHINMw8wAHMTfjd0AEiT32eFEN2hL3K8gJ9e6kwW891zAyb0thtGtjRApYqXwW
	e4EHKP/XdLeMMrduaQHm0gS96jLK0FKt3GzGB8INkuNe6wBlrnHij1YCvQIgslgF7geivSAZiJQMC
	U550riNYGYPrZTUb747wOf7/tgpj1JSfUYTOQXQib/UoyCFwNhHJvAIWOP78VheJo6FANoXdaHB4b
	BPpbMOcYKS+oByxXprCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaMp-00GT4m-2K;
	Wed, 28 Jun 2023 18:58:15 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaMm-00GT3y-29
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 18:58:14 +0000
X-QQ-mid: bizesmtp90t1687978484tji35iud
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 02:54:42 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: Lc4bMlOoZUGkpC/7Ifsyooy6DUcO5i0KRvgdG3YbtX646PzLWnBy6Qxr2/y+U
	ozNqeIN24oj33/Fotsv6FXjKjhpcf5dts1f4iXPVGjLEOyao8iLruCcBq410/Itbx/yQ82D
	4a/DbSH5mlYrgjNVPOh+05Z7F8YWqIAq1qjLT4KMXlyNwrpo7QCsU1QCoKz7cIBCFcrr/Ty
	IDCMxPgLOJFrecb2pQfzxgO73wk3O0vG3Jcs9W5Sk1Bx2FAaefhT0X35wITWlcT1vqd/uvw
	bUFlzoPMtnjOpFjHio6NpWI5h0Xj5DFbj2dO5JQCyMdvzC+NNyc+s2q5cad0Yuidf0no2SX
	kpAAdeYqkgMSQGSZPfd5ki6h4+yttF3ULm1K+4MDPrKxb1Fr2gGOQLmqydKkQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5556601059308245209
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 03/11] tools/nolibc: include crt.h before arch.h
Date: Thu, 29 Jun 2023 02:54:35 +0800
Message-Id: <c61b5bc53895e8c6b2f30d59f86067973e6bbce0.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687976753.git.falcon@tinylab.org>
References: <cover.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_115813_003104_CA0FA153 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

The crt.h provides a new _start_c() function, which is required by the
new assembly _start entry of arch-<ARCH>.h (included by arch.h), let's
include crt.h before arch.h.

This '#include "crt.h"' doesn't let the new _start_c() work immediately,
but it is a base of the coming patches to move most of the assembly
_start operations to the _start_c() function for every supported
architecture.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/Makefile | 1 +
 tools/include/nolibc/nolibc.h | 1 +
 tools/include/nolibc/signal.h | 1 +
 tools/include/nolibc/stdio.h  | 1 +
 tools/include/nolibc/stdlib.h | 1 +
 tools/include/nolibc/sys.h    | 1 +
 tools/include/nolibc/time.h   | 1 +
 tools/include/nolibc/unistd.h | 1 +
 8 files changed, 8 insertions(+)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 875e13e3c851..00471e59b11e 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -37,6 +37,7 @@ NARCH            = $(or $(NARCH_$(ARCH)),$(ARCH))
 arch_file := arch-$(NARCH).h
 all_files := \
 		compiler.h \
+		crt.h \
 		ctype.h \
 		errno.h \
 		nolibc.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index 1f8d821000ac..2cc9ccd90d56 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -93,6 +93,7 @@
 #define _NOLIBC_H
 
 #include "std.h"
+#include "crt.h"
 #include "arch.h"
 #include "types.h"
 #include "sys.h"
diff --git a/tools/include/nolibc/signal.h b/tools/include/nolibc/signal.h
index 137552216e46..f0a1418c1cb2 100644
--- a/tools/include/nolibc/signal.h
+++ b/tools/include/nolibc/signal.h
@@ -8,6 +8,7 @@
 #define _NOLIBC_SIGNAL_H
 
 #include "std.h"
+#include "crt.h"
 #include "arch.h"
 #include "types.h"
 #include "sys.h"
diff --git a/tools/include/nolibc/stdio.h b/tools/include/nolibc/stdio.h
index 0eef91daf289..89d3749b3620 100644
--- a/tools/include/nolibc/stdio.h
+++ b/tools/include/nolibc/stdio.h
@@ -10,6 +10,7 @@
 #include <stdarg.h>
 
 #include "std.h"
+#include "crt.h"
 #include "arch.h"
 #include "errno.h"
 #include "types.h"
diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 902162f80337..0ff7fac40bd4 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -8,6 +8,7 @@
 #define _NOLIBC_STDLIB_H
 
 #include "std.h"
+#include "crt.h"
 #include "arch.h"
 #include "types.h"
 #include "sys.h"
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 2c302f3feb71..b6c33c40c037 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -24,6 +24,7 @@
 #include <linux/reboot.h> /* for LINUX_REBOOT_* */
 #include <linux/prctl.h>
 
+#include "crt.h"
 #include "arch.h"
 #include "errno.h"
 #include "types.h"
diff --git a/tools/include/nolibc/time.h b/tools/include/nolibc/time.h
index 84655361b9ad..bbe8f9aa3e9b 100644
--- a/tools/include/nolibc/time.h
+++ b/tools/include/nolibc/time.h
@@ -8,6 +8,7 @@
 #define _NOLIBC_TIME_H
 
 #include "std.h"
+#include "crt.h"
 #include "arch.h"
 #include "types.h"
 #include "sys.h"
diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index e38f3660c051..f1677224bb5a 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -8,6 +8,7 @@
 #define _NOLIBC_UNISTD_H
 
 #include "std.h"
+#include "crt.h"
 #include "arch.h"
 #include "types.h"
 #include "sys.h"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
