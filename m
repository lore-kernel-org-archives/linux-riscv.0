Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC0BF43689
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JR9jrDRlRpD0t+s8c1zKeWCvpWPlMJktQgMUmz0u4ic=; b=m3sLYmN415LoDr
	ecuq1CDWYBBZPEGpv+jTsCD1zZT+7BLh78zgRcBNbjl7I6Na8z0v2OwYPQopyyBcyDzDc6sitlxwi
	wDzHUzQofpbAlKbvUjyrix9cJK+HdgQdPte03uSzxI1rXV5PjztERiyua4y33OuDZtCBX5qe2P5Yg
	2poHSHIOH0SU645cA+lhPFSvc1DhphJ7+jr03q/Xo0o/O2CahrhwgBE0kXS7Z25B5JUuYdG2Q2Lxm
	kUnAe4GClu3RYRLMEkXVnC/N0BJI6aAiFKtDcyt/ywk9AhwZ9brqu89Fj7BkFcYIvwS9Uz1O2TCQs
	Vkj0LDRs8u2SpduBCiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfV8-00000003oqE-1339;
	Fri, 17 Apr 2026 09:28:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfU4-00000003nIY-3uye
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Apr 2026 09:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=28exkkb846fkQzFD/3OS2zyXjXJpiFk6w+RdpP5t20c=; b=Qkp+K1y4WxhdFr9avCpdJp3GXH
	uJEpjfbFiT81GJwYv6g00km5J1wVbmCKeQ2kd10xgN4SG7Dg29PNm5zKcl5xP83Cc5E+fKvVO567N
	iyR6dUfLigaKtxXUnbB8tiA6gGmqjP7D4YyKzP3+ECWBuHeh1IX/EcwOLn5qlVM74XpL10vlQJqB+
	IaN5chvKmme+ufUfMVzDOhweruKuVEs1Tn6u3QpxJj2tL3K0t4MRj2M4rutOHS0FWhWkBdyogaBR8
	a9Rzt0dM/rtRb6Yl+rF9ndWixayNFDNkCZmJ+PF9UHApl/r0Km0Qdr9iKrCZGQh3o+1D49roLPxf7
	iCg+MMTQ==;
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfU0-000000054hy-2m4D
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 09:27:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=28exkkb846fkQzFD/3OS2zyXjXJpiFk6w+RdpP5t20c=;
	b=MGK0+RWIqAIyPdyNOKU2y4nRUQxfXBJ3rjaH8tIsb3ZAMeVrcdklkSAxYesft8/iPYF2eakRg
	Xr7xOXaQvHJXpLVhTMasd1+1AEC7YWncvD0F5jmTPDvex/C/ZhSlaGz19IlGmFq+NyRIU8jr+Tm
	JY4AD7ypPr4np2qy51wFeBM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fxqB41GjYz1K9D4;
	Fri, 17 Apr 2026 17:21:00 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7AF0A4061D;
	Fri, 17 Apr 2026 17:27:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 17 Apr
 2026 17:27:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>, <ruanjinjie@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <david.laight.linux@gmail.com>,
	<nathan@kernel.org>
Subject: [PATCH v3 1/2] bitops: Define generic __bitrev8/16/32 for reuse
Date: Fri, 17 Apr 2026 17:31:01 +0800
Message-ID: <20260417093102.3812978-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417093102.3812978-1-ruanjinjie@huawei.com>
References: <20260417093102.3812978-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102729_667325_F78D162D 
X-CRM114-Status: GOOD (  11.59  )
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

Define generic __bitrev8/16/32 using the implementation
in <linux/bitrev.h>, so they can be reused in <asm/bitrev.h>,
such as RISCV.

Reviewed-by: Yury Norov <ynorov@nvidia.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/asm-generic/bitops/__bitrev.h | 22 ++++++++++++++++++++++
 include/linux/bitrev.h                | 20 ++++----------------
 lib/bitrev.c                          |  3 ---
 3 files changed, 26 insertions(+), 19 deletions(-)
 create mode 100644 include/asm-generic/bitops/__bitrev.h

diff --git a/include/asm-generic/bitops/__bitrev.h b/include/asm-generic/bitops/__bitrev.h
new file mode 100644
index 000000000000..1b8c0f464d26
--- /dev/null
+++ b/include/asm-generic/bitops/__bitrev.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS___BITREV_H_
+#define _ASM_GENERIC_BITOPS___BITREV_H_
+
+#include <asm/types.h>
+
+extern u8 const byte_rev_table[256];
+static __always_inline __attribute_const__ u8 generic___bitrev8(u8 byte)
+{
+	return byte_rev_table[byte];
+}
+
+static __always_inline __attribute_const__ u16 generic___bitrev16(u16 x)
+{
+	return (generic___bitrev8(x & 0xff) << 8) | generic___bitrev8(x >> 8);
+}
+
+static __always_inline __attribute_const__ u32 generic___bitrev32(u32 x)
+{
+	return (generic___bitrev16(x & 0xffff) << 16) | generic___bitrev16(x >> 16);
+}
+#endif /* _ASM_GENERIC_BITOPS___BITREV_H_ */
diff --git a/include/linux/bitrev.h b/include/linux/bitrev.h
index d35b8ec1c485..11620a70e776 100644
--- a/include/linux/bitrev.h
+++ b/include/linux/bitrev.h
@@ -12,22 +12,10 @@
 #define __bitrev8 __arch_bitrev8
 
 #else
-extern u8 const byte_rev_table[256];
-static inline u8 __bitrev8(u8 byte)
-{
-	return byte_rev_table[byte];
-}
-
-static inline u16 __bitrev16(u16 x)
-{
-	return (__bitrev8(x & 0xff) << 8) | __bitrev8(x >> 8);
-}
-
-static inline u32 __bitrev32(u32 x)
-{
-	return (__bitrev16(x & 0xffff) << 16) | __bitrev16(x >> 16);
-}
-
+#include <asm-generic/bitops/__bitrev.h>
+#define __bitrev32 generic___bitrev32
+#define __bitrev16 generic___bitrev16
+#define __bitrev8 generic___bitrev8
 #endif /* CONFIG_HAVE_ARCH_BITREVERSE */
 
 #define __bitrev8x4(x)	(__bitrev32(swab32(x)))
diff --git a/lib/bitrev.c b/lib/bitrev.c
index 81b56e0a7f32..05088231f31f 100644
--- a/lib/bitrev.c
+++ b/lib/bitrev.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#ifndef CONFIG_HAVE_ARCH_BITREVERSE
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/bitrev.h>
@@ -43,5 +42,3 @@ const u8 byte_rev_table[256] = {
 	0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff,
 };
 EXPORT_SYMBOL_GPL(byte_rev_table);
-
-#endif /* CONFIG_HAVE_ARCH_BITREVERSE */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
