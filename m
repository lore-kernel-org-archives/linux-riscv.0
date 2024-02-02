Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8408EC48286
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 01:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ORknk9os4mPMoX7NOPCsuh4M4gbj0b1mAXC77Mr5xxM=; b=wNSBzd2Ufuw3mg
	yr2HAq2aBVe5o98vqNyrHNC8trDEHlokA52oPaQPKB8HQVWMiwV3OowPM0Ps6Tuaa5dpVlEoFxp4M
	lcXuJmhK+mwNL4QUNFelVOJTWGySdcYR7/kBaGe3SYXvIQ6rBv+m0m8nlfLf3kBH3lLQS1DeQwECl
	L4wydCN0/kn9/iw91ImGoUthR+XxVUhzQ30fRgUSvZQGgW8dJcT9NtKFovbgKslP5Jf5ueutRwAqS
	PNiYM40vkmdWqG8F1XbZCZ96LfVyu7TQ1bnGxtYjpM/xNTlAgRj9hCTqd3MkUvxiH6ZBYaponcv6K
	o0kU2/HetvhFncsqI4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVii0-00000009qZA-1LZz;
	Fri, 02 Feb 2024 01:51:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVihw-00000009qYm-0cZg
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 01:51:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d934c8f8f7so14655865ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 17:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706838667; x=1707443467; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqnBWephPOcgF/3nIZPD08BTGD/kLDACiy8VJStmDfE=;
        b=jPATc2P3rAO/uipeSNKYAe1DEw6XLO7EK30ZXU22AUjlZGCeQqRfKW1Jv8CHhpo2XT
         pnipm3/HoucaB30Fkh4cbc9tQ3x6/QGw/6FeRLioZjYTcx9oWwnrppP7gw9oi0NojEHp
         CoJTfuYBjIxnuUMye0/oPAmAc73zfNxv0cfd5ZKdsd3wh5uBGLOyPM7DpKYNryHkADuY
         ZdxGjGs0bYd1zL6XaR6RDZpcrS48iKeTNsBeuo7hdWiDswQcbeG82bwUlw1/EOgmwNEA
         XEUwT/GN0YnY+bYHIKtU4novXJNC6FAMKrabHVGs5A6mNRniWBplTQbi5Em9wjlXD8aL
         X2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706838667; x=1707443467;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqnBWephPOcgF/3nIZPD08BTGD/kLDACiy8VJStmDfE=;
        b=Yoi2ZG4kWtv86F422VpipBGjO0qYVSbAiYPmVd+bNCu+hDlyjFQ2imS59HUdl1MBTP
         0BRJuQ5Zgm/BFnFuLAQ8by+6QmOTTfIeyOBhh8E1awSZkEJ+UHNhqjakZGeEKqqKnz5T
         nIYjZra+Hg8GT5ktaz3YSrZERVVO6xRVCXWXKtmxK6yE6y9L+7YPcnXfzZheKTsSiaJz
         +oC/ZZWhEZdnDJ3GAqOeONB3a8gqQG0STSTfvqgbjTThSWALBdjWhNBYRcT7SwDCp9Va
         fak6BKQv2Ml47k7MRQoC1uaENf68AMsTpEtWQGL1c0rcxGxVEbq6cmbEqzzuRvZNHHLD
         sI8g==
X-Gm-Message-State: AOJu0YzWpVZ8vXviY2Hi/UAHTdCBNEtFXWU36BPmhlgHBanzdjyWMw9B
	nshjTgmJ9aNFkTnkKajg4hNARpoJk718eV7FbdtyOwDoUaAmAStV2jmxY+tPtj0=
X-Google-Smtp-Source: AGHT+IF0hgUIiqQv3IMQGxaY4gG9YCv70qDehVMvnAPPjJhJIshAJENzxmEZrv2yMnFGnznuXnUHpQ==
X-Received: by 2002:a17:902:f7c7:b0:1d9:462f:99cf with SMTP id h7-20020a170902f7c700b001d9462f99cfmr4197681plw.5.1706838666756;
        Thu, 01 Feb 2024 17:51:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW2tLiKX2SsmbgjyRMapiCWW7+97h8aLu+T1/miad738PGaLCuwhtm3/M6PXCOA097w6DlUV6uwoqZc7Vj/xnu2tbji5GnRXX+6PwNznw+JFiZorxWm9nmkVO/4Cc4fsbCJ2tmrdQtubSNfWr7c0kwibhUWTak8SCtkGvma4ZvmoxXc2rhmuI9NvGyJpm/ODMfA0BuSE9CTm8v1S1bIVziQjI/i5YDlpeP1lTBGfR5hAjYBNK2Tn60YGOwxfWSwD1mU8nvPI1wclWc=
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902ef0500b001d8ee46170dsm475070plx.84.2024.02.01.17.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 17:51:06 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2] riscv: add CALLER_ADDRx support
Date: Fri,  2 Feb 2024 01:51:02 +0000
Message-Id: <20240202015102.26251-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_175108_233166_36731D0F 
X-CRM114-Status: GOOD (  16.04  )
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

Fixes: 10626c32e382 ("riscv/ftrace: Add basic support")

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---

Changed in v2:
- Rebase to v6.8-rc2
- Add noinline attribute for return_address()
- Add a fixes tag

 arch/riscv/include/asm/ftrace.h    |  5 ++++
 arch/riscv/kernel/Makefile         |  2 ++
 arch/riscv/kernel/return_address.c | 48 ++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 arch/riscv/kernel/return_address.c

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 329172122952..15055f9df4da 100644
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
index f71910718053..604d6bf7e476 100644
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
index 000000000000..c8115ec8fb30
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
+noinline void *return_address(unsigned int level)
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
