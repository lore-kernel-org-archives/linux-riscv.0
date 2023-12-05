Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D56C10DC3
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WIJCiuEADXEn+J3z19cGi6EqVGy2Sv5QDluFfYmqIgo=; b=dwNkpLdnor+3yt
	OeB6yrvQvuQimgkWFbqarjcQ+0OAie5Z3oxunFxRyuEAT+yrwQLIBqt76Kj8dX0cIGfwvrvwVgmLr
	opxG4C1bI4eZvc5gmPxrwbl4KMRaLqs2HsTgQqf5rueOaRgNcIvFDYhjmfaj352ewrA8lbin/4HEj
	450WM9t5iV/3kU6zq6AKzSZ80fzVu5rjYEuJCmhR0/yrv/nxWVZemu+Z4FyrIJhZ42ZfPafHWs2Xr
	GunIpz4q1PNShF8D6XmDRCpqpR1n9S3kaiBI6DWi8F56+8NsICM+8DCAWM21G3oEM3gMREwgsCRA3
	F2Wd+LIrDeeiH+wC/uaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rARHl-006ioL-1G;
	Tue, 05 Dec 2023 09:00:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rARHi-006imk-18
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 09:00:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d075392ff6so21037155ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701766804; x=1702371604; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wi6K2Brpiu9Fka3m9z0bXgXfpslNvz1u3mb0b6dJW6o=;
        b=F57jO+kYtGmtNrdZCZ3+/jJ0CsTzzsUw9WlbV2KHPpfmJdxown7eLfW13IZkipYfiu
         /4oEzsDSGIVugedfzo08lkcrrl/qFb+ri9CNXF9Q4VSIKiZ1InJhYB+qxB4y/R5dCt1O
         H5tDtf5Ajnq6XyrcH6KghUXeEFqE228oFl+d1CylV+SolUGx8rteKMhhP7qO3MLXBSG/
         msX1KvssP88fpXmiyFQBJCz7PdRGVCItaYTnaE2aPGbFYQELzqs674fPxYXERdWUHY+W
         xJaW5/yBCYT9IekdTaRwlK8FpaTj4DeV//n/EXXEulxBR3dyQkXEz2oKSBJ32jkNazQt
         SDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701766804; x=1702371604;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wi6K2Brpiu9Fka3m9z0bXgXfpslNvz1u3mb0b6dJW6o=;
        b=Ohqo5WHXrV2M7pKCs0aYQvGfjtqu1kc2KbURLxyzrr80kdqYnWGTeV3+IuRCZEiVzN
         T96m6ZXkMKEXXHkuMqrRq/Bqr16A1wYsHMmyDfeGj0mTqNzyIXVIydzs+EjtBvy1DKj4
         xhAe2k1Yf0IB5zoSsVms+ADFIOr03xLVcBdelaS3py9THkwykVdowlS7HHltHF6fTn5w
         sii/PgXQOM7UqhdTa7+sststmenySLieYIa87j4l4XT1f6Vnf0nvfcT68DekSIS0e+ss
         nZTYh7daJvSv3/qWpL8fxK/zZZuvZxK7xjCzafClsWg58nQb275hLWw08AqQ1v3lyLvR
         /2eg==
X-Gm-Message-State: AOJu0YwaDzOsZ5rNZm8y80pAofnb9+dXzYkREFSxLyhKscJa2KalcruB
	qBCxo1oons02mPusv7zbD6WzcA==
X-Google-Smtp-Source: AGHT+IGyFPsKcbZnXk366DYq/es2JWb3tJA7eqKSX6IfX54Hcco/J4PuKhtkOuzGVLlbAyicuyZl5Q==
X-Received: by 2002:a17:902:ecca:b0:1cf:f868:5b8c with SMTP id a10-20020a170902ecca00b001cff8685b8cmr1228712plh.8.1701766804259;
        Tue, 05 Dec 2023 01:00:04 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090311c100b001cfc9c926b7sm6134629plh.75.2023.12.05.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 01:00:04 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] riscv: add CALLER_ADDRx support
Date: Tue,  5 Dec 2023 08:59:59 +0000
Message-Id: <20231205085959.32177-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_010006_451966_2ADD60CD 
X-CRM114-Status: GOOD (  14.70  )
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

CALLER_ADDRx returns caller's address at specified level, they are used
for several tracers. These macros eventually use
__builtin_return_address(n) to get the caller's address if arch doesn't
define their own implementation.

In RISC-V, __builtin_return_address(n) only works when n == 0, we need
to walk the stack frame to get the caller's address at specified level.

data.level started from 'level + 3' due to the call flow of getting
caller's address in RISC-V implementation. If we don't have additional
three iteration, the level is corresponding to follows:

callsite -> return_address -> arch_stack_walk -> walk_stackframe
|           |                 |                  |
level 3     level 2           level 1            level 0

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/include/asm/ftrace.h    |  5 ++++
 arch/riscv/kernel/Makefile         |  2 ++
 arch/riscv/kernel/return_address.c | 48 ++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 arch/riscv/kernel/return_address.c

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 2b2f5df7ef2c..42777f91a9c5 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -25,6 +25,11 @@
 
 #define ARCH_SUPPORTS_FTRACE_OPS 1
 #ifndef __ASSEMBLY__
+
+extern void *return_address(unsigned int level);
+
+#define ftrace_return_address(n) return_address(n)
+
 void MCOUNT_NAME(void);
 static inline unsigned long ftrace_call_adjust(unsigned long addr)
 {
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fee22a3d1b53..40d054939ae2 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -7,6 +7,7 @@ ifdef CONFIG_FTRACE
 CFLAGS_REMOVE_ftrace.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_return_address.o	= $(CC_FLAGS_FTRACE)
 endif
 CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
 CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
@@ -46,6 +47,7 @@ obj-y	+= irq.o
 obj-y	+= process.o
 obj-y	+= ptrace.o
 obj-y	+= reset.o
+obj-y	+= return_address.o
 obj-y	+= setup.o
 obj-y	+= signal.o
 obj-y	+= syscall_table.o
diff --git a/arch/riscv/kernel/return_address.c b/arch/riscv/kernel/return_address.c
new file mode 100644
index 000000000000..c2008d4aa6e5
--- /dev/null
+++ b/arch/riscv/kernel/return_address.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This code come from arch/arm64/kernel/return_address.c
+ *
+ * Copyright (C) 2023 SiFive.
+ */
+
+#include <linux/export.h>
+#include <linux/kprobes.h>
+#include <linux/stacktrace.h>
+
+struct return_address_data {
+	unsigned int level;
+	void *addr;
+};
+
+static bool save_return_addr(void *d, unsigned long pc)
+{
+	struct return_address_data *data = d;
+
+	if (!data->level) {
+		data->addr = (void *)pc;
+		return false;
+	}
+
+	--data->level;
+
+	return true;
+}
+NOKPROBE_SYMBOL(save_return_addr);
+
+void *return_address(unsigned int level)
+{
+	struct return_address_data data;
+
+	data.level = level + 3;
+	data.addr = NULL;
+
+	arch_stack_walk(save_return_addr, &data, current, NULL);
+
+	if (!data.level)
+		return data.addr;
+	else
+		return NULL;
+
+}
+EXPORT_SYMBOL_GPL(return_address);
+NOKPROBE_SYMBOL(return_address);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
