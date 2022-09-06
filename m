Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884A8ECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4cm8Zi/0OxfLJe3vnek77OWBLU1oCc7iJnpZN843thk=; b=Jblt6GYytsZvEx
	ZhYaYePnnSnk9Rz/YqBWa+iFpk6qW4LTLFnU0nFLpprHmpJNyce6TsVtv6ZF6QqztTfz6lsoRkIVg
	DYJXm9zWXi9fuWjKYsLerrjDPGNy27XwmfkaumVw/VW5NqCzkDr817S6TyV549wfShS2eFAg54b9e
	CaV6+2LoiCR+F04/g2a1AZxCtK4hV2oftKJLrFueKtRyKxJselWugozhdKDmEajZpAKRqJEEOa+bN
	9EwzCRBm9PlzOEsOtxwx6zifARETOKc49/4kFRzlXN/f81u4vO6RpKCiYEyaSIeHApZl8RMlwjF56
	/pwOloOrEvx7wr8BQ50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXCy-00D4u2-PM; Tue, 06 Sep 2022 11:57:36 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXCu-00D4qh-RE
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 11:57:35 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MMP0B4L42zZcJN;
	Tue,  6 Sep 2022 19:52:58 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 6 Sep 2022 19:57:27 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 6 Sep
 2022 19:57:27 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <Conor.Dooley@microchip.com>,
	<ajones@ventanamicro.com>
CC: <zouyipeng@huawei.com>
Subject: [PATCH v3] riscv: lib: optimize memcmp with ld insn
Date: Tue, 6 Sep 2022 19:53:59 +0800
Message-ID: <20220906115359.173660-1-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_045733_247400_96F13375 
X-CRM114-Status: GOOD (  11.11  )
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

Currently memcmp was implemented in c code(lib/string.c), which compare
memory per byte.

This patch use ld insn compare memory per word to improve. From the test
Results, this will take several times optimized.

Alloc 8,4,1KB buffer to compare, each loop 10k times:

Size(B) Min(ns) AVG(ns) //before

8k      40800   46316
4k      26500   32302
1k      15600   17965

Size(B) Min(ns) AVG(ns) //after

8k      16100   21281
4k      14200   16446
1k      12400   14316

Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
V2: Patch test data into the commit message,and collect Reviewed-by
Tags.
V3: Fix some spelling mistakes. Improve register naming and coding style.

 arch/riscv/include/asm/string.h |  3 ++
 arch/riscv/lib/Makefile         |  1 +
 arch/riscv/lib/memcmp.S         | 58 +++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 arch/riscv/lib/memcmp.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 909049366555..3337b43d3803 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -18,6 +18,9 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
+#define __HAVE_ARCH_MEMCMP
+extern int memcmp(const void *, const void *, size_t);
+
 /* For those files which don't want to check by kasan. */
 #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
 #define memcpy(dst, src, len) __memcpy(dst, src, len)
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..70773bf0c471 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,7 @@ lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
+lib-y			+= memcmp.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 
diff --git a/arch/riscv/lib/memcmp.S b/arch/riscv/lib/memcmp.S
new file mode 100644
index 000000000000..eea5cc40e081
--- /dev/null
+++ b/arch/riscv/lib/memcmp.S
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022 zouyipeng@huawei.com
+ */
+#include <linux/linkage.h>
+#include <asm-generic/export.h>
+#include <asm/asm.h>
+
+/*
+ Input Arguments:
+ a0: addr0
+ a1: addr1
+ a2: buffer size
+
+ Output:
+ a0: return value
+*/
+#define data0	a3
+#define data1	a4
+#define tmp	t3
+#define tail	t4
+
+/* load and compare */
+.macro LD_CMP op d0 d1 a0 a1 t1 offset
+	\op	\d0, 0(\a0)
+	\op	\d1, 0(\a1)
+	addi	\a0, \a0, \offset
+	addi	\a1, \a1, \offset
+	sub	\t1, \d0, \d1
+.endm
+
+ENTRY(memcmp)
+	/* test size aligned with SZREG */
+	andi	tmp, a2, SZREG - 1
+	/* load tail */
+	add	tail, a0, a2
+	sub	tail, tail, tmp
+	add	a2, a0, a2
+
+.LloopWord:
+	sltu	tmp, a0, tail
+	beqz	tmp, .LloopByte
+
+	LD_CMP	REG_L data0 data1 a0 a1 tmp SZREG
+	beqz	tmp, .LloopWord
+	j	.Lreturn
+
+.LloopByte:
+	sltu	tmp, a0, a2
+	beqz	tmp, .Lreturn
+
+	LD_CMP	lbu data0 data1 a0 a1 tmp 1
+	beqz	tmp, .LloopByte
+.Lreturn:
+	mv	a0, tmp
+	ret
+END(memcmp)
+EXPORT_SYMBOL(memcmp);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
