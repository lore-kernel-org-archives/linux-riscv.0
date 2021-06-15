Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0107C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 18:30:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E75060FF0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 18:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E75060FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FiE9oksvHtKGoHew++ojqgegGUKBmi3qswWshpCBc7g=; b=0BbJ/nFA+SWI6N
	2HfdCJpj3/SiSV6ny/O6YmgWeNrzGuoJ4kP3Ef7lJ2gHXGk9WjJf6lD7MZT9ytxdBJMaS7mD7Zqsv
	iNy1hgMtoXLiClKJvZGvC8Rn3JvhRcPbBXGo9J7yiaWojIaY33JtPv1wIaolEX76GHDOb+lVwLvyL
	XcUs+u/Ggwd2JJjeKqKxXGOeBaAmUJ/U25cmHtudzTPlMPW+kXxlkvEZwziVok+0hVVhwQhI2LUF1
	FWH80YLYeVJNROe0C/wU0i7RqXCBkJVZe6Ptl1621vW9JIcns5KqTWn3DhSgJ9Wt5s0cTxLd4eGZO
	Me1PfNa37NlCSTSEsV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltDp5-0027ec-0T; Tue, 15 Jun 2021 18:30:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Pm-000DDm-6L
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=OThMiBWqm2X7NaT3Fk/xKklrPu8milZY09O+f8YgZh0=; b=JT9MBJNeNQPFiRmG3IgpoUHA7v
 zjxc9SdrinaP5JGeeWLpVWBsGEZ+tRK2U2adqJJ9ZrsVBaEWRYd8CZY7hwyoE9UQJ09kUAZKVbZ2v
 zIGvOfi1tC3WGyi+OaebNrLeLspuYbzxjL0Iglv7iqqQLO2o/rS+WBcyrhH8VqxPJKOY+OKvjpbbR
 zpELp6tKBPzQp5/SQBVRToIsTBnIc1yM3jSV9ymrHzcgQfhdrLIbjuPF6S6A8LofHaU2MJm3gGytg
 CDc7UjcHFQa4xJwoq581SUA6biHkDs2NIMQRhQoEC0jb4bNgURawMkWV48TQERFpc+yrJVcNWfPqr
 dM8D8Uog==;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsyzw-007GxD-NO
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 02:40:26 +0000
Received: by mail-ej1-f49.google.com with SMTP id k7so19834306ejv.12
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 19:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OThMiBWqm2X7NaT3Fk/xKklrPu8milZY09O+f8YgZh0=;
 b=X6684+L9LdIwn4EX0T7Bjt1dypz7fd/aFNkN15RFoBimXYCpEw0KlMnJd7eN75ayXm
 z9Icfjy97HJ+70JAzrBjH8TzXadi2qelvj+/fUn+XpepqhRUg+nwy413gU+5pbefofek
 IyrBcd51Eyt0Xh5BxhHueR76Wi+cWC3yp9xo3k6tfjASbeasOjpXYIzehkLy2gcMkEA6
 RNJ9CJ8enRjx9BX84vdLiw7LIpW0TX1ecqDjbS4a4jUf+W8j2YzR7l/OUp7Rk/OcNIjr
 OZZYGN3LfwJl6VTvFT1NM7UPcmTjp85/BLU9ZN2a0J6I9TRz0zxomvuPKR6+tH9aEW2x
 7G6Q==
X-Gm-Message-State: AOAM53200JiZ+XpmADtSJM2m69Cr6CfNzxHOXrDYuH9vwszPr32TOkgV
 lP+CqK7kk9fGhiindLLj+BVZsTbTTAIVtg==
X-Google-Smtp-Source: ABdhPJzzUePkA5GTrHcS9fewGvf6Z628SeyPzKTgjrUu8tj8JkSjLwWjra5xnyQZWv9gOkPoN+xOhw==
X-Received: by 2002:a17:907:270b:: with SMTP id
 w11mr16382855ejk.7.1623724822768; 
 Mon, 14 Jun 2021 19:40:22 -0700 (PDT)
Received: from msft-t490s.teknoraver.net
 (net-37-119-128-179.cust.vodafonedsl.it. [37.119.128.179])
 by smtp.gmail.com with ESMTPSA id cn25sm834966edb.69.2021.06.14.19.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 19:40:22 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 1/3] riscv: optimized memcpy
Date: Tue, 15 Jun 2021 04:38:10 +0200
Message-Id: <20210615023812.50885-2-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615023812.50885-1-mcroce@linux.microsoft.com>
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_034024_592006_5BC27A51 
X-CRM114-Status: GOOD (  27.84  )
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

From: Matteo Croce <mcroce@microsoft.com>

Write a C version of memcpy() which uses the biggest data size allowed,
without generating unaligned accesses.

The procedure is made of three steps:
First copy data one byte at time until the destination buffer is aligned
to a long boundary.
Then copy the data one long at time shifting the current and the next u8
to compose a long at every cycle.
Finally, copy the remainder one byte at time.

On a BeagleV, the TCP RX throughput increased by 45%:

before:

$ iperf3 -c beaglev
Connecting to host beaglev, port 5201
[  5] local 192.168.85.6 port 44840 connected to 192.168.85.48 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  76.4 MBytes   641 Mbits/sec   27    624 KBytes
[  5]   1.00-2.00   sec  72.5 MBytes   608 Mbits/sec    0    708 KBytes
[  5]   2.00-3.00   sec  73.8 MBytes   619 Mbits/sec   10    451 KBytes
[  5]   3.00-4.00   sec  72.5 MBytes   608 Mbits/sec    0    564 KBytes
[  5]   4.00-5.00   sec  73.8 MBytes   619 Mbits/sec    0    658 KBytes
[  5]   5.00-6.00   sec  73.8 MBytes   619 Mbits/sec   14    522 KBytes
[  5]   6.00-7.00   sec  73.8 MBytes   619 Mbits/sec    0    621 KBytes
[  5]   7.00-8.00   sec  72.5 MBytes   608 Mbits/sec    0    706 KBytes
[  5]   8.00-9.00   sec  73.8 MBytes   619 Mbits/sec   20    580 KBytes
[  5]   9.00-10.00  sec  73.8 MBytes   619 Mbits/sec    0    672 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   736 MBytes   618 Mbits/sec   71             sender
[  5]   0.00-10.01  sec   733 MBytes   615 Mbits/sec                  receiver

after:

$ iperf3 -c beaglev
Connecting to host beaglev, port 5201
[  5] local 192.168.85.6 port 44864 connected to 192.168.85.48 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   109 MBytes   912 Mbits/sec   48    559 KBytes
[  5]   1.00-2.00   sec   108 MBytes   902 Mbits/sec    0    690 KBytes
[  5]   2.00-3.00   sec   106 MBytes   891 Mbits/sec   36    396 KBytes
[  5]   3.00-4.00   sec   108 MBytes   902 Mbits/sec    0    567 KBytes
[  5]   4.00-5.00   sec   106 MBytes   891 Mbits/sec    0    699 KBytes
[  5]   5.00-6.00   sec   106 MBytes   891 Mbits/sec   32    414 KBytes
[  5]   6.00-7.00   sec   106 MBytes   891 Mbits/sec    0    583 KBytes
[  5]   7.00-8.00   sec   106 MBytes   891 Mbits/sec    0    708 KBytes
[  5]   8.00-9.00   sec   106 MBytes   891 Mbits/sec   28    433 KBytes
[  5]   9.00-10.00  sec   108 MBytes   902 Mbits/sec    0    591 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.04 GBytes   897 Mbits/sec  144             sender
[  5]   0.00-10.01  sec  1.04 GBytes   894 Mbits/sec                  receiver

And the decreased CPU time of the memcpy() is observable with perf top.
This is the `perf top -Ue task-clock` output when doing the test:

before:

Overhead  Shared O  Symbol
  42.22%  [kernel]  [k] memcpy
  35.00%  [kernel]  [k] __asm_copy_to_user
   3.50%  [kernel]  [k] sifive_l2_flush64_range
   2.30%  [kernel]  [k] stmmac_napi_poll_rx
   1.11%  [kernel]  [k] memset

after:

Overhead  Shared O  Symbol
  45.69%  [kernel]  [k] __asm_copy_to_user
  29.06%  [kernel]  [k] memcpy
   4.09%  [kernel]  [k] sifive_l2_flush64_range
   2.77%  [kernel]  [k] stmmac_napi_poll_rx
   1.24%  [kernel]  [k] memset

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 arch/riscv/include/asm/string.h |   8 ++-
 arch/riscv/kernel/riscv_ksyms.c |   2 -
 arch/riscv/lib/Makefile         |   2 +-
 arch/riscv/lib/memcpy.S         | 108 --------------------------------
 arch/riscv/lib/string.c         |  94 +++++++++++++++++++++++++++
 5 files changed, 101 insertions(+), 113 deletions(-)
 delete mode 100644 arch/riscv/lib/memcpy.S
 create mode 100644 arch/riscv/lib/string.c

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 909049366555..6b5d6fc3eab4 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -12,9 +12,13 @@
 #define __HAVE_ARCH_MEMSET
 extern asmlinkage void *memset(void *, int, size_t);
 extern asmlinkage void *__memset(void *, int, size_t);
+
+#ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
 #define __HAVE_ARCH_MEMCPY
-extern asmlinkage void *memcpy(void *, const void *, size_t);
-extern asmlinkage void *__memcpy(void *, const void *, size_t);
+extern void *memcpy(void *dest, const void *src, size_t count);
+extern void *__memcpy(void *dest, const void *src, size_t count);
+#endif
+
 #define __HAVE_ARCH_MEMMOVE
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
index 5ab1c7e1a6ed..3f6d512a5b97 100644
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ b/arch/riscv/kernel/riscv_ksyms.c
@@ -10,8 +10,6 @@
  * Assembly functions that may be used (directly or indirectly) by modules
  */
 EXPORT_SYMBOL(memset);
-EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memmove);
 EXPORT_SYMBOL(__memset);
-EXPORT_SYMBOL(__memcpy);
 EXPORT_SYMBOL(__memmove);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..2ffe85d4baee 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 lib-y			+= delay.o
-lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
+lib-$(CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE) += string.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/memcpy.S b/arch/riscv/lib/memcpy.S
deleted file mode 100644
index 51ab716253fa..000000000000
--- a/arch/riscv/lib/memcpy.S
+++ /dev/null
@@ -1,108 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2013 Regents of the University of California
- */
-
-#include <linux/linkage.h>
-#include <asm/asm.h>
-
-/* void *memcpy(void *, const void *, size_t) */
-ENTRY(__memcpy)
-WEAK(memcpy)
-	move t6, a0  /* Preserve return value */
-
-	/* Defer to byte-oriented copy for small sizes */
-	sltiu a3, a2, 128
-	bnez a3, 4f
-	/* Use word-oriented copy only if low-order bits match */
-	andi a3, t6, SZREG-1
-	andi a4, a1, SZREG-1
-	bne a3, a4, 4f
-
-	beqz a3, 2f  /* Skip if already aligned */
-	/*
-	 * Round to nearest double word-aligned address
-	 * greater than or equal to start address
-	 */
-	andi a3, a1, ~(SZREG-1)
-	addi a3, a3, SZREG
-	/* Handle initial misalignment */
-	sub a4, a3, a1
-1:
-	lb a5, 0(a1)
-	addi a1, a1, 1
-	sb a5, 0(t6)
-	addi t6, t6, 1
-	bltu a1, a3, 1b
-	sub a2, a2, a4  /* Update count */
-
-2:
-	andi a4, a2, ~((16*SZREG)-1)
-	beqz a4, 4f
-	add a3, a1, a4
-3:
-	REG_L a4,       0(a1)
-	REG_L a5,   SZREG(a1)
-	REG_L a6, 2*SZREG(a1)
-	REG_L a7, 3*SZREG(a1)
-	REG_L t0, 4*SZREG(a1)
-	REG_L t1, 5*SZREG(a1)
-	REG_L t2, 6*SZREG(a1)
-	REG_L t3, 7*SZREG(a1)
-	REG_L t4, 8*SZREG(a1)
-	REG_L t5, 9*SZREG(a1)
-	REG_S a4,       0(t6)
-	REG_S a5,   SZREG(t6)
-	REG_S a6, 2*SZREG(t6)
-	REG_S a7, 3*SZREG(t6)
-	REG_S t0, 4*SZREG(t6)
-	REG_S t1, 5*SZREG(t6)
-	REG_S t2, 6*SZREG(t6)
-	REG_S t3, 7*SZREG(t6)
-	REG_S t4, 8*SZREG(t6)
-	REG_S t5, 9*SZREG(t6)
-	REG_L a4, 10*SZREG(a1)
-	REG_L a5, 11*SZREG(a1)
-	REG_L a6, 12*SZREG(a1)
-	REG_L a7, 13*SZREG(a1)
-	REG_L t0, 14*SZREG(a1)
-	REG_L t1, 15*SZREG(a1)
-	addi a1, a1, 16*SZREG
-	REG_S a4, 10*SZREG(t6)
-	REG_S a5, 11*SZREG(t6)
-	REG_S a6, 12*SZREG(t6)
-	REG_S a7, 13*SZREG(t6)
-	REG_S t0, 14*SZREG(t6)
-	REG_S t1, 15*SZREG(t6)
-	addi t6, t6, 16*SZREG
-	bltu a1, a3, 3b
-	andi a2, a2, (16*SZREG)-1  /* Update count */
-
-4:
-	/* Handle trailing misalignment */
-	beqz a2, 6f
-	add a3, a1, a2
-
-	/* Use word-oriented copy if co-aligned to word boundary */
-	or a5, a1, t6
-	or a5, a5, a3
-	andi a5, a5, 3
-	bnez a5, 5f
-7:
-	lw a4, 0(a1)
-	addi a1, a1, 4
-	sw a4, 0(t6)
-	addi t6, t6, 4
-	bltu a1, a3, 7b
-
-	ret
-
-5:
-	lb a4, 0(a1)
-	addi a1, a1, 1
-	sb a4, 0(t6)
-	addi t6, t6, 1
-	bltu a1, a3, 5b
-6:
-	ret
-END(__memcpy)
diff --git a/arch/riscv/lib/string.c b/arch/riscv/lib/string.c
new file mode 100644
index 000000000000..525f9ee25a74
--- /dev/null
+++ b/arch/riscv/lib/string.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * String functions optimized for hardware which doesn't
+ * handle unaligned memory accesses efficiently.
+ *
+ * Copyright (C) 2021 Matteo Croce
+ */
+
+#include <linux/types.h>
+#include <linux/module.h>
+
+/* size below a classic byte at time copy is done */
+#define MIN_THRESHOLD 64
+
+/* convenience types to avoid cast between different pointer types */
+union types {
+	u8 *u8;
+	unsigned long *ulong;
+	uintptr_t uptr;
+};
+
+union const_types {
+	const u8 *u8;
+	unsigned long *ulong;
+};
+
+void *memcpy(void *dest, const void *src, size_t count)
+{
+	const int bytes_long = BITS_PER_LONG / 8;
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+	const int mask = bytes_long - 1;
+	const int distance = (src - dest) & mask;
+#endif
+	union const_types s = { .u8 = src };
+	union types d = { .u8 = dest };
+
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+	if (count <= MIN_THRESHOLD)
+		goto copy_remainder;
+
+	/* copy a byte at time until destination is aligned */
+	for (; count && d.uptr & mask; count--)
+		*d.u8++ = *s.u8++;
+
+	if (distance) {
+		unsigned long last, next;
+
+		/* move s backward to the previous alignment boundary */
+		s.u8 -= distance;
+
+		/* 32/64 bit wide copy from s to d.
+		 * d is aligned now but s is not, so read s alignment wise,
+		 * and do proper shift to get the right value.
+		 * Works only on Little Endian machines.
+		 */
+		for (next = s.ulong[0]; count >= bytes_long + mask; count -= bytes_long) {
+			last = next;
+			next = s.ulong[1];
+
+			d.ulong[0] = last >> (distance * 8) |
+				     next << ((bytes_long - distance) * 8);
+
+			d.ulong++;
+			s.ulong++;
+		}
+
+		/* restore s with the original offset */
+		s.u8 += distance;
+	} else
+#endif
+	{
+		/* if the source and dest lower bits are the same, do a simple
+		 * 32/64 bit wide copy.
+		 */
+		for (; count >= bytes_long; count -= bytes_long)
+			*d.ulong++ = *s.ulong++;
+	}
+
+	/* suppress warning when CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y */
+	goto copy_remainder;
+
+copy_remainder:
+	while (count--)
+		*d.u8++ = *s.u8++;
+
+	return dest;
+}
+EXPORT_SYMBOL(memcpy);
+
+void *__memcpy(void *dest, const void *src, size_t count)
+{
+	return memcpy(dest, src, count);
+}
+EXPORT_SYMBOL(__memcpy);
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
