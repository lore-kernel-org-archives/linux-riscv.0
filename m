Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A284C001B3
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0Aa1DYHToq28IDylCunRbp+LHeUI0+VBzEi98jnl4k=; b=UjZt0FA/x0lF78
	wem1FeYhyXIqBuN+SvbbBoJ2PdKRT/n4Iu3JPFpRRgC0sOK8doiigq65Vo9NXOSjGJiW2t6tWiOzX
	QG5rjvQukn03sgSZ0Azi/FNAj1jd3C2CQkMAl2nFsYDixtL2TbVmUX43a4Nske07TIM25jhHWO6MD
	Yew/lEZ6z5L52O0LUdo9DxqNdKVdR3LhHKAC9lyLNGVI5/6kI84B6p1637PVbizL00IOqB2fbz/xn
	FTUhf6KPX96wu0d6zF0V+EJ7WLsj359blJwotGOMl4jZO96/m9j8xDDM0KqJOEnPZ55KY3B4BKZsi
	iFrmvWhv9RbPY2JLmrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCL4q-000vmL-2m;
	Thu, 22 Jun 2023 14:14:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCL4W-000vYn-1D;
	Thu, 22 Jun 2023 14:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I/OihLzyhlm6zM768yrOivTNTMK/tlvpo/OiXcw1tIQ=; b=jCd7uSYCKfjmuX5SemKMmqgR7A
	UzKlx4IG3KksZFqN45sqag1gagtgNRyHjVTKGWQcMdAnijR8NGsY/MlTVfyxf/scUOwGaLDMlpPCu
	q+qV5i+AgXKLXlJlbnVFI9doc3rKHs/lY96NwW+rTJk8+3PjamneYSyAju0I/XdkSjTWPyoT8nUA0
	fiFjAtRTaeYMcnp1pJUpoq3tjcArgScNqDnpJj5c2D01x2FmGtGl2aAbdN7wDwPd1Q3pNwo+jLNSh
	ClrGqGGpo6/LH5pc1OyWi3apOkaXunJRHxs8m/IjjgPBoX7ITgj6BY19xO6mIda/7B5HlCjIymbB1
	8RndU2Xw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qCL4R-00FfFi-4M; Thu, 22 Jun 2023 14:14:02 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx38cXV5Rk8nMAAA--.818S3;
	Thu, 22 Jun 2023 22:13:43 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ80TV5RkZSsCAA--.10045S3;
	Thu, 22 Jun 2023 22:13:41 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 1/2] asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch
Date: Thu, 22 Jun 2023 22:13:38 +0800
Message-Id: <1687443219-11946-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
References: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf8DxJ80TV5RkZSsCAA--.10045S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3tF4kCr4xJFW7AFyUJrWrJFc_yoWDtr4DpF
	95Crn7WF40krW3C3yrJF1Igry5Aws3GF4UtFW2gry0vrWfJF18Gr4v9FsxCa4xJayvqryr
	uF9Ig345Gan8t3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcsjjDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_151359_785519_3C30B4C9 
X-CRM114-Status: GOOD (  15.32  )
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

Now we specify the minimal version of GCC as 5.1 and Clang/LLVM as 11.0.0
in Documentation/process/changes.rst, __CHAR_BIT__ and __SIZEOF_LONG__ are
usable, it is probably fine to unify the definition of __BITS_PER_LONG as
(__CHAR_BIT__ * __SIZEOF_LONG__) in asm-generic uapi bitsperlong.h.

In order to keep safe and avoid regression, only unify uapi bitsperlong.h
for some archs such as arm64, riscv and loongarch which are using newer
toolchains that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.

Suggested-by: Xi Ruoyao <xry111@xry111.site>
Link: https://lore.kernel.org/all/d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arch/a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com/
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/arm64/include/uapi/asm/bitsperlong.h          | 24 ----------------------
 arch/loongarch/include/uapi/asm/bitsperlong.h      |  9 --------
 arch/riscv/include/uapi/asm/bitsperlong.h          | 14 -------------
 include/uapi/asm-generic/bitsperlong.h             | 13 +++++++++++-
 tools/arch/arm64/include/uapi/asm/bitsperlong.h    | 24 ----------------------
 .../arch/loongarch/include/uapi/asm/bitsperlong.h  |  9 --------
 tools/arch/riscv/include/uapi/asm/bitsperlong.h    | 14 -------------
 tools/include/uapi/asm-generic/bitsperlong.h       | 14 ++++++++++++-
 tools/include/uapi/asm/bitsperlong.h               |  6 ------
 9 files changed, 25 insertions(+), 102 deletions(-)
 delete mode 100644 arch/arm64/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/loongarch/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/riscv/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/arm64/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/loongarch/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h

diff --git a/arch/arm64/include/uapi/asm/bitsperlong.h b/arch/arm64/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 485d60be..0000000
--- a/arch/arm64/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2012 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef __ASM_BITSPERLONG_H
-#define __ASM_BITSPERLONG_H
-
-#define __BITS_PER_LONG 64
-
-#include <asm-generic/bitsperlong.h>
-
-#endif	/* __ASM_BITSPERLONG_H */
diff --git a/arch/loongarch/include/uapi/asm/bitsperlong.h b/arch/loongarch/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 00b4ba1..0000000
--- a/arch/loongarch/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ASM_LOONGARCH_BITSPERLONG_H
-#define __ASM_LOONGARCH_BITSPERLONG_H
-
-#define __BITS_PER_LONG (__SIZEOF_LONG__ * 8)
-
-#include <asm-generic/bitsperlong.h>
-
-#endif /* __ASM_LOONGARCH_BITSPERLONG_H */
diff --git a/arch/riscv/include/uapi/asm/bitsperlong.h b/arch/riscv/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 7d0b32e..0000000
--- a/arch/riscv/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
-/*
- * Copyright (C) 2012 ARM Ltd.
- * Copyright (C) 2015 Regents of the University of California
- */
-
-#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
-#define _UAPI_ASM_RISCV_BITSPERLONG_H
-
-#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
-
-#include <asm-generic/bitsperlong.h>
-
-#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
diff --git a/include/uapi/asm-generic/bitsperlong.h b/include/uapi/asm-generic/bitsperlong.h
index 693d9a4..352cb81 100644
--- a/include/uapi/asm-generic/bitsperlong.h
+++ b/include/uapi/asm-generic/bitsperlong.h
@@ -2,6 +2,17 @@
 #ifndef _UAPI__ASM_GENERIC_BITS_PER_LONG
 #define _UAPI__ASM_GENERIC_BITS_PER_LONG
 
+#ifndef __BITS_PER_LONG
+/*
+ * In order to keep safe and avoid regression, only unify uapi
+ * bitsperlong.h for some archs which are using newer toolchains
+ * that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
+ * See the following link for more info:
+ * https://lore.kernel.org/linux-arch/b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com/
+ */
+#if defined(__CHAR_BIT__) && defined(__SIZEOF_LONG__)
+#define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
+#else
 /*
  * There seems to be no way of detecting this automatically from user
  * space, so 64 bit architectures should override this in their
@@ -9,8 +20,8 @@
  * both 32 and 64 bit user space must not rely on CONFIG_64BIT
  * to decide it, but rather check a compiler provided macro.
  */
-#ifndef __BITS_PER_LONG
 #define __BITS_PER_LONG 32
 #endif
+#endif
 
 #endif /* _UAPI__ASM_GENERIC_BITS_PER_LONG */
diff --git a/tools/arch/arm64/include/uapi/asm/bitsperlong.h b/tools/arch/arm64/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 485d60be..0000000
--- a/tools/arch/arm64/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2012 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef __ASM_BITSPERLONG_H
-#define __ASM_BITSPERLONG_H
-
-#define __BITS_PER_LONG 64
-
-#include <asm-generic/bitsperlong.h>
-
-#endif	/* __ASM_BITSPERLONG_H */
diff --git a/tools/arch/loongarch/include/uapi/asm/bitsperlong.h b/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 00b4ba1..0000000
--- a/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ASM_LOONGARCH_BITSPERLONG_H
-#define __ASM_LOONGARCH_BITSPERLONG_H
-
-#define __BITS_PER_LONG (__SIZEOF_LONG__ * 8)
-
-#include <asm-generic/bitsperlong.h>
-
-#endif /* __ASM_LOONGARCH_BITSPERLONG_H */
diff --git a/tools/arch/riscv/include/uapi/asm/bitsperlong.h b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 0b9b58b..0000000
--- a/tools/arch/riscv/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2012 ARM Ltd.
- * Copyright (C) 2015 Regents of the University of California
- */
-
-#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
-#define _UAPI_ASM_RISCV_BITSPERLONG_H
-
-#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
-
-#include <asm-generic/bitsperlong.h>
-
-#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
diff --git a/tools/include/uapi/asm-generic/bitsperlong.h b/tools/include/uapi/asm-generic/bitsperlong.h
index 23e6c41..352cb81 100644
--- a/tools/include/uapi/asm-generic/bitsperlong.h
+++ b/tools/include/uapi/asm-generic/bitsperlong.h
@@ -1,6 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _UAPI__ASM_GENERIC_BITS_PER_LONG
 #define _UAPI__ASM_GENERIC_BITS_PER_LONG
 
+#ifndef __BITS_PER_LONG
+/*
+ * In order to keep safe and avoid regression, only unify uapi
+ * bitsperlong.h for some archs which are using newer toolchains
+ * that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
+ * See the following link for more info:
+ * https://lore.kernel.org/linux-arch/b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com/
+ */
+#if defined(__CHAR_BIT__) && defined(__SIZEOF_LONG__)
+#define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
+#else
 /*
  * There seems to be no way of detecting this automatically from user
  * space, so 64 bit architectures should override this in their
@@ -8,8 +20,8 @@
  * both 32 and 64 bit user space must not rely on CONFIG_64BIT
  * to decide it, but rather check a compiler provided macro.
  */
-#ifndef __BITS_PER_LONG
 #define __BITS_PER_LONG 32
 #endif
+#endif
 
 #endif /* _UAPI__ASM_GENERIC_BITS_PER_LONG */
diff --git a/tools/include/uapi/asm/bitsperlong.h b/tools/include/uapi/asm/bitsperlong.h
index da52065..c65267a 100644
--- a/tools/include/uapi/asm/bitsperlong.h
+++ b/tools/include/uapi/asm/bitsperlong.h
@@ -1,8 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #if defined(__i386__) || defined(__x86_64__)
 #include "../../../arch/x86/include/uapi/asm/bitsperlong.h"
-#elif defined(__aarch64__)
-#include "../../../arch/arm64/include/uapi/asm/bitsperlong.h"
 #elif defined(__powerpc__)
 #include "../../../arch/powerpc/include/uapi/asm/bitsperlong.h"
 #elif defined(__s390__)
@@ -13,12 +11,8 @@
 #include "../../../arch/mips/include/uapi/asm/bitsperlong.h"
 #elif defined(__ia64__)
 #include "../../../arch/ia64/include/uapi/asm/bitsperlong.h"
-#elif defined(__riscv)
-#include "../../../arch/riscv/include/uapi/asm/bitsperlong.h"
 #elif defined(__alpha__)
 #include "../../../arch/alpha/include/uapi/asm/bitsperlong.h"
-#elif defined(__loongarch__)
-#include "../../../arch/loongarch/include/uapi/asm/bitsperlong.h"
 #else
 #include <asm-generic/bitsperlong.h>
 #endif
-- 
2.1.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
