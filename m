Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DE5EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 18:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8FliYxEbUwXqVYbd7qJNHtW0leFZd+EB6/ogjCMnQU=; b=m/DgjHkEzvn/4m
	vDV0dowMz/1h2eKtcpDeaZXkMZ2Z0qkRRHwqTWOHhOJWBbC5iq41nMBNmnXf13ooZb+QoNbCFNVWN
	YQNx0OhGVoFo5wBN2R8+HoGvV2s073MWNEGO2npwrysr7lvIqRAFhQ4iEBmwDbnPAYuUoODjwoaUg
	JyxmWAz+56It/oKKT1A1HV3ClA0O4cNF2uEbqFFOLfYxyBJ4GQ0MOlxUG7UpMk/4vTqp225r3uyPI
	SVZYwTTncvgWd8ro/Ob3o4JzfS222ZMDHTQyvDZXJplRkbRaR1sZxfc/ZSuVvc47IjM+94riGPHux
	xMJqZxsWyRd4/qG/z5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaJc-00GSat-0K;
	Wed, 28 Jun 2023 18:54:56 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaJY-00GSZY-1g
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 18:54:54 +0000
X-QQ-mid: bizesmtp68t1687978411t0a7h12q
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 02:53:30 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: mhgCCnGOC3zHQx6jmcB1kz2NwHDP18v38JyGZQAiWr5o2Az3hiwOxWqJkj3sr
	al8QuuOwy8FjxN1au85JUw6DW1Wb/vHX+2GC8XTjfP+O1t3S8qORnqLdPM4Cf3pGlaNlChX
	IHySjIMY6PzNPzCMg+XhHGFJZdwOJjXNsPKyYq9th7KpBU9mTcFUUeq4Sd4P+9ywNxuj/kp
	QXH2k7KkcaMDqTnkd4C35V2UHyfP7DbRQBaqLYhMy0H3EM5JlWAOt5xoIudinQAR0jwiSBJ
	40AtcWRh83++0lXsOvsW4Jkmh6pGtR+4nBRcL1IOSR0yfiq5l+cw6ZOed+Sl5CuENCqT1a2
	z8R4BsBETw1oB5lmDLIPriksbujqTB7Rf8E6RzmmPTuI8MlY10=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10897143188466502564
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 02/11] tools/nolibc: add new crt.h with _start_c
Date: Thu, 29 Jun 2023 02:53:18 +0800
Message-Id: <0976471a36cd4facf712bc02e733f669f1697083.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687976753.git.falcon@tinylab.org>
References: <cover.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_115452_859983_15BCD8D9 
X-CRM114-Status: GOOD (  12.81  )
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

As the environ and _auxv support added for nolibc, the assembly _start
function becomes more and more complex and therefore makes the porting
of nolibc to new architectures harder and harder.

To simplify portability, this crt.h is added to do most of the assembly
start operations in C function: _start_c(), which reduces the complexity
a lot and will eventually simplify the porting of nolibc to the new
architectures.

The new _start_c() only requires a stack pointer argument, it will find
argv, envp and _auxv for us, and then call main(), finally, it exit()
with main's return status. With this new _start_c(), the future new
architectures only require to add very few assembly instructions.

It may also easier the future init/fini support.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/crt.h | 57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 tools/include/nolibc/crt.h

diff --git a/tools/include/nolibc/crt.h b/tools/include/nolibc/crt.h
new file mode 100644
index 000000000000..698fe1084d26
--- /dev/null
+++ b/tools/include/nolibc/crt.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * C Run Time support for NOLIBC
+ * Copyright (C) 2023 Zhangjin Wu <falcon@tinylab.org>
+ */
+
+#ifndef _NOLIBC_CRT_H
+#define _NOLIBC_CRT_H
+
+char **environ __attribute__((weak));
+const unsigned long *_auxv __attribute__((weak));
+
+int main(int argc, char *argv[], char **envp);
+static void exit(int);
+
+void _start_c(long *sp)
+{
+	int argc, i;
+	char **argv;
+	char **envp;
+
+	/*
+	 * sp  :  argc          <-- argument count, required by main()
+	 * argv:  argv[0]       <-- argument vector, required by main()
+	 *        argv[1]
+	 *        ...
+	 *        argv[argc-1]
+	 *        null
+	 * envp:  envp[0]       <-- environment variables, required by main() and getenv()
+	 *        envp[1]
+	 *        ...
+	 *        null
+	 * _auxv: auxv[0]       <-- auxiliary vector, required by getauxval()
+	 *        auxv[1]
+	 *        ...
+	 *        null
+	 */
+
+	/* assign argc and argv */
+	argc = sp[0];
+	argv = (void *)(sp + 1);
+
+	/* find envp */
+	envp = argv + argc + 1;
+	environ = envp;
+
+	/* find auxv */
+	i = 0;
+	while (envp[i])
+		i++;
+	_auxv = (void *)(envp + i + 1);
+
+	/* go to application */
+	exit(main(argc, argv, envp));
+}
+
+#endif /* _NOLIBC_CRT_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
