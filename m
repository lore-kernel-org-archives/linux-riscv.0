Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C8DECDE47
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 19:03:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C5C320825
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 19:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CagT1aWx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDo/l2h4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C5C320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qte2x0UgfgNhSo25Q7Q780uwZ645B90cLBjokr6Fgf4=; b=CagT1aWxjusH6f
	di/yLHQ9hJjQ+CcXzQGRzFQpkS69SRlwQ9Qh/fpcEtf+07v7nENRCmUlRrEmVVqGFfXPHMrrRYGuG
	3bPhYxGXzFeEgiG3V64rTEcYsURWvftOdwFU1eLhzM0oAMqx0HAynlF3doTNodAFSwPqDNw/sxFjw
	jhuBk/xxqgVLbpkLppe8cZ4jQ7JeoGeN00wqLV+2K6wuAmmcinYk9leopucKmtD4m7xnPUUVI8Vsx
	iTqRfOiamuO1JAx/IxymgPYut+1IeYKzmBucfYZWE2Q47ZkNxCtG+T5DI+t30M9Qg+YeyxOWv3yT7
	EewVfAdwl6a0Uif6NRZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKpa6-0002kS-BZ; Thu, 08 Nov 2018 19:03:06 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKpa3-0002jU-92
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 19:03:05 +0000
Received: by mail-wm1-x342.google.com with SMTP id f19-v6so2199542wmb.0
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 11:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJVLUDV11EDb2vbd+GFA7UxacxtSc2FBZExCPPIxd7g=;
 b=aDo/l2h4KNNUXOkCOFBackchxvkURX5rxDhACDcsSXBcMwLv+QkoAsyyASuNybud4P
 M8WPfiN5W2OqHvSGLqPnEF1P3Boct4Wmhy3STo3IVPQRwnb5boyPY+7Zik947jJURi2q
 46LM8x8pIbnl4AKDojzaeHdCya76FnWn2g/ikl77l7KboGJIzndqhBcsEvXnmCF10otA
 IdMlCs6JMx7WkMei4ZVIBRuaQ5tO+aKdWUrsvKVKs7ZrP1mulAlie2V+Qa8hMbIuvynF
 BDcqnCpGL6MSKVaerxnPz3QscSmT4hEsN6W/t44TtOQ2VIVjy0g4wpI3tRFKOMS0uBdG
 wBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJVLUDV11EDb2vbd+GFA7UxacxtSc2FBZExCPPIxd7g=;
 b=Y4pWUJ8Hc0l+zcWrGDmBwet47W2UPVD5uJ8T/Q0N/+HtvbTBxevpamW97BRJBxeHpg
 awh1UHJa4HKxI8iDoWPpGUBP2xjEQCyjdjXHCyo4epTk/mN848MX+5xJzzStsEO8QcNb
 xyExtzUmXGXWMUqRMi5k5sII4LRUG3HHijTdWJrAYqpdRSnOph4ibw+WKFUt0asQSVnq
 kTUIsU+lkvyn3z9hK+Cm3OCDMfDqwzvZ5KUpmpsAulxJjs2t4+8Zk7Sabnuhy28xylVH
 k44AFFg+rpBn++So8T6pc3eVAGPYgaktDkpsfQlpVVG/7DStTPUeE8DW4WItLXtDWCN/
 sfZw==
X-Gm-Message-State: AGRZ1gIrVxlqoZfX/EqQVC+0omp1+NCv/FDgNbTZ+ubr8ERdRsClfqNV
 vLWxCL70zoB/n++1JKJE1wc=
X-Google-Smtp-Source: AJdET5diiZYe+nhWcj23oM+8Kjg3trjmO56SY0MXK0Ty7W3cZrLJNZzT+9rHb0EXPInB+mS0kqWaRQ==
X-Received: by 2002:a1c:8a11:: with SMTP id
 m17-v6mr2147499wmd.15.1541703770065; 
 Thu, 08 Nov 2018 11:02:50 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id q20-v6sm5110625wmc.33.2018.11.08.11.02.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Nov 2018 11:02:49 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: add asm/unistd.h UAPI header
Date: Thu,  8 Nov 2018 20:02:39 +0100
Message-Id: <20181108190239.29633-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_110303_318779_BD2E3ABD 
X-CRM114-Status: GOOD (  19.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108190239.4bUHJB0EWuGrDEfY8-tL1NAO-fZ9Y3mw3DRVC31StPA@z>

Marcin Juszkiewicz reported issues while generating syscall table for riscv
using 4.20-rc1. The patch refactors our unistd.h files to match some other
architectures.

- Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT only for 64-bit
- Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
- Adjust kernel asm/unistd.h

So now asm/unistd.h UAPI header should show all syscalls for riscv.

Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
generated asm/unistd.h UAPI header thus user didn't see:

- __NR_riscv_flush_icache
- __NR_newfstatat
- __NR_fstat

which are supported by riscv kernel.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Fixes: 67314ec7b025 ("RISC-V: Request newstat syscalls")
Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/include/asm/unistd.h        |  5 ++--
 arch/riscv/include/uapi/asm/syscalls.h | 29 ------------------
 arch/riscv/include/uapi/asm/unistd.h   | 41 ++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 32 deletions(-)
 delete mode 100644 arch/riscv/include/uapi/asm/syscalls.h
 create mode 100644 arch/riscv/include/uapi/asm/unistd.h

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index eff7aa9aa163..fef96f117b4d 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -13,10 +13,9 @@
 
 /*
  * There is explicitly no include guard here because this file is expected to
- * be included multiple times.  See uapi/asm/syscalls.h for more info.
+ * be included multiple times.
  */
 
-#define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SYS_CLONE
+
 #include <uapi/asm/unistd.h>
-#include <uapi/asm/syscalls.h>
diff --git a/arch/riscv/include/uapi/asm/syscalls.h b/arch/riscv/include/uapi/asm/syscalls.h
deleted file mode 100644
index 206dc4b0f6ea..000000000000
--- a/arch/riscv/include/uapi/asm/syscalls.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2017-2018 SiFive
- */
-
-/*
- * There is explicitly no include guard here because this file is expected to
- * be included multiple times in order to define the syscall macros via
- * __SYSCALL.
- */
-
-/*
- * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
- * having a direct 'fence.i' instruction available to userspace (which we
- * can't trap!), that's not actually viable when running on Linux because the
- * kernel might schedule a process on another hart.  There is no way for
- * userspace to handle this without invoking the kernel (as it doesn't know the
- * thread->hart mappings), so we've defined a RISC-V specific system call to
- * flush the instruction cache.
- *
- * __NR_riscv_flush_icache is defined to flush the instruction cache over an
- * address range, with the flush applying to either all threads or just the
- * caller.  We don't currently do anything with the address range, that's just
- * in there for forwards compatibility.
- */
-#ifndef __NR_riscv_flush_icache
-#define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
-#endif
-__SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
new file mode 100644
index 000000000000..1f3bd3ebbb0d
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2018 David Abdurachmanov <david.abdurachmanov@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifdef __LP64__
+#define __ARCH_WANT_NEW_STAT
+#endif /* __LP64__ */
+
+#include <asm-generic/unistd.h>
+
+/*
+ * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
+ * having a direct 'fence.i' instruction available to userspace (which we
+ * can't trap!), that's not actually viable when running on Linux because the
+ * kernel might schedule a process on another hart.  There is no way for
+ * userspace to handle this without invoking the kernel (as it doesn't know the
+ * thread->hart mappings), so we've defined a RISC-V specific system call to
+ * flush the instruction cache.
+ *
+ * __NR_riscv_flush_icache is defined to flush the instruction cache over an
+ * address range, with the flush applying to either all threads or just the
+ * caller.  We don't currently do anything with the address range, that's just
+ * in there for forwards compatibility.
+ */
+#ifndef __NR_riscv_flush_icache
+#define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
+#endif
+__SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
