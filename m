Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8752F8FA72
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMz3B55wyMhYzAjHBPMXrlg7TJ804Gjd5+UpMY4JYsU=; b=yndHPErHUi9XuJ
	mdC8yO8Q9HpFySAE0Uev4JAFqMF5+MmSG/TNv7ICgpBqz691Hd7DvX7jrQPAILcS+k0GGHs+YIY8T
	WbJNAoTVbUTKfoe4e6WHLnG9lwPIHzz7YkMfQ8pHg9P6GQpzOpsRPzx9J4sos6MHE8RwOX2UQEcN4
	rT3q2SohYffe5SgaD6PN4Bsw6DHEGbQMMgJYZHLyzXYl490p/Dsz/nqKLWeBSPAwEomA2XKipXdV8
	xsbqxZ1qjH3sTH9wQ43TpjifvX2zrbrBIY9n53tXxBeLkSQNZHjZ2inqAqv7West2TFFia7B3Kc7k
	A9ovOEX4QOHIpxqrttCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAm2-00000008d5j-1Vf3;
	Tue, 21 Apr 2026 13:04:18 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAly-00000008d3L-32pi
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 13:04:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Og64l9mq/6QYoXZ5oj3+y+6KjT13Ec3Oh9cGPi7dA2E=;
	b=TVuwBa/PyuGmFd8O96VXi5OJ5B6jwR6sQuoE6Nlnw0hqzh/R/cnWX+CVtNLDx3JpaPWOPssRf
	c7YvnOZWTu/JDlZhsTSAbOyHH7ewUCbDwEDhjPVaMuU/3ZOShVnoeu5UTs0l0/hojvKEUnYgj/q
	bIjOKd/I+ApqoGdjqPkOtTs=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4g0Mnw4v8ZzcZyv;
	Tue, 21 Apr 2026 20:57:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 06BF840537;
	Tue, 21 Apr 2026 21:04:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Apr
 2026 21:04:04 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>, <ruanjinjie@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <david.laight.linux@gmail.com>,
	<nathan@kernel.org>, <cp0613@linux.alibaba.com>
Subject: [PATCH v5 1/3] lib/bitrev: Introduce GENERIC_BITREVERSE and cleanup Kconfig
Date: Tue, 21 Apr 2026 21:07:50 +0800
Message-ID: <20260421130752.607500-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421130752.607500-1-ruanjinjie@huawei.com>
References: <20260421130752.607500-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_060415_656498_6E030064 
X-CRM114-Status: GOOD (  14.01  )
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

Currently, the bit reversal lookup table is controlled by
!HAVE_ARCH_BITREVERSE. This makes it difficult for architectures to
provide a hardware-accelerated implementation while still falling
back to the generic table for specific configurations.

Introduce CONFIG_GENERIC_BITREVERSE to explicitly manage the generic
lookup table implementation. By using 'def_bool !HAVE_ARCH_BITREVERSE'
with a dependency on 'BITREVERSE', we ensure that:

1. The table is only compiled when needed.
2. The .config is not polluted with useless options when BITREVERSE
   is disabled.
3. Avoids bloating the .data section for architectures that have
   full hardware bit-reverse support and don't need the table.

Update lib/bitrev.c to use CONFIG_GENERIC_BITREVERSE instead of
checking the absence of HAVE_ARCH_BITREVERSE. This provides a
cleaner interface for architectures like RISC-V that may want to
selectively use the generic implementation as a fallback.

Suggested-by: David Laight <David.Laight@ACULAB.COM>
Suggested-by: Yury Norov <ynorov@nvidia.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 lib/Kconfig  | 18 ++++++++++++++++++
 lib/bitrev.c |  4 ++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index 0f2fb9610647..e3f9719a4d6f 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -62,6 +62,24 @@ config HAVE_ARCH_BITREVERSE
 	  This option enables the use of hardware bit-reversal instructions on
 	  architectures which support such operations.
 
+config GENERIC_BITREVERSE
+	def_bool !HAVE_ARCH_BITREVERSE
+	depends on BITREVERSE
+	help
+	  This option provides the standard software-based bit reversal
+	  implementation using a lookup table.
+
+	  Architecture-specific implementations (HAVE_ARCH_BITREVERSE)
+	  and this generic version are not necessarily mutually exclusive
+	  at the configuration level, but selecting this ensures that
+	  the generic `bitrev8/16/32` functions are available when the
+	  CPU does not provide native instructions (like RISC-V's ZBKB
+	  extension).
+
+	  If you are an architecture maintainer and your CPU has native
+	  bit-reversal instructions, you should select HAVE_ARCH_BITREVERSE
+	  to skip this table-based implementation.
+
 config ARCH_HAS_STRNCPY_FROM_USER
 	bool
 
diff --git a/lib/bitrev.c b/lib/bitrev.c
index 81b56e0a7f32..3a53ff67aeba 100644
--- a/lib/bitrev.c
+++ b/lib/bitrev.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#ifndef CONFIG_HAVE_ARCH_BITREVERSE
+#ifdef CONFIG_GENERIC_BITREVERSE
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/bitrev.h>
@@ -44,4 +44,4 @@ const u8 byte_rev_table[256] = {
 };
 EXPORT_SYMBOL_GPL(byte_rev_table);
 
-#endif /* CONFIG_HAVE_ARCH_BITREVERSE */
+#endif /* CONFIG_GENERIC_BITREVERSE */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
