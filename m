Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC08CC2BC11
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 064EE2137B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wANeoLWY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BweuExr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 064EE2137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sJOBmAZOoaGZrRPcjzDmG3rFXNP/Y5u9/Jl5QcWW93E=; b=wANeoLWYeWfh97Sa7ThdqWKz0
	xI8/4WcQ2bR9hvSHG4x6U8HApfkinN0QQal5zhG8HpIM5aE4afj8Zvi8prtyiTCSJR3mS5NawUYRM
	LUFUtjcOiqgBbQp/KHKoFKt5qyO4pT+ce1kB9rSFvPCIcrf4ooElOBb/SDFXNR31p0UBuPExEoCjv
	76e6ry6uwtrkpWcnhdqA/maiplWISu8NGWpN2VqHLf0D1faA8aMXYODxyjordvaks6ttqhU+mXP7o
	lfJcX43qKU9vzrShn75pBVr5RQI1Tw20mxkSW+F1hcCiTI8SRxryYWbPExed7mg61AOnSo7MWfYhF
	hr0vyIF3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAAh-0003y3-Rh; Mon, 07 Sep 2020 05:58:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAg-0003xX-CY
 for linux-riscv@merlin.infradead.org; Mon, 07 Sep 2020 05:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jVjIwAEyeRXAFqYL1XhTmsgyUXaAG2pDm/oDzB7l/mc=; b=BweuExr6Mn6Bjt0U+etjmSfSDo
 MBPlq+Qj6ZDf9ugPVq7/ek+ceu+bAhJi9DSIRZ4gueYWIuekuyCmTUZ00gUdgV7qhvITSX1Ej7/At
 YN0g1P9Lo7EI9o4Y+eZPV9SMPZmYvTuXlgYVwiSkX/MsWy4JudvDKsZEVgCYdi+qczDrkvOR2RYur
 robgMEv4cdglow0f5basy6vPaZUbGIew8DAtBGx1RAPi6eaNtMNG8RXZhF7vvFdXHzt8R3/ZlD4PW
 ZoERGf/jPmRIEvzE4qHCpirNYQuedVSUv58VYv7O+mr/QN3/q08UXaiM9yraR8Uoyrlxwunu8kHE1
 A0jfHVnA==;
Received: from [2001:4bb8:184:af1:e178:97b2:ac6b:4e16] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAf-000354-B2; Mon, 07 Sep 2020 05:58:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/8] asm-generic: improve the nommu {get,put}_user handling
Date: Mon,  7 Sep 2020 07:58:19 +0200
Message-Id: <20200907055825.1917151-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907055825.1917151-1-hch@lst.de>
References: <20200907055825.1917151-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Instead of reusing raw_{copy,to}_from_user implement separate handlers
using {get,put}_unaligned.  This ensures unaligned access is handled
correctly, and avoid the need for the small constant size optimization
in raw_{copy,to}_from_user.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/uaccess.h | 91 ++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 40 deletions(-)

diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index ba68ee4dabfaa7..6de5f524e9e631 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -10,28 +10,60 @@
 #include <linux/string.h>
 
 #ifdef CONFIG_UACCESS_MEMCPY
-static inline __must_check unsigned long
-raw_copy_from_user(void *to, const void __user * from, unsigned long n)
+#include <asm/unaligned.h>
+
+static inline int __get_user_fn(size_t size, const void __user *from, void *to)
 {
-	if (__builtin_constant_p(n)) {
-		switch(n) {
-		case 1:
-			*(u8 *)to = *(u8 __force *)from;
-			return 0;
-		case 2:
-			*(u16 *)to = *(u16 __force *)from;
-			return 0;
-		case 4:
-			*(u32 *)to = *(u32 __force *)from;
-			return 0;
-#ifdef CONFIG_64BIT
-		case 8:
-			*(u64 *)to = *(u64 __force *)from;
-			return 0;
-#endif
-		}
+	BUILD_BUG_ON(!__builtin_constant_p(size));
+
+	switch (size) {
+	case 1:
+		*(u8 *)to = get_unaligned((u8 __force *)from);
+		return 0;
+	case 2:
+		*(u16 *)to = get_unaligned((u16 __force *)from);
+		return 0;
+	case 4:
+		*(u32 *)to = get_unaligned((u32 __force *)from);
+		return 0;
+	case 8:
+		*(u64 *)to = get_unaligned((u64 __force *)from);
+		return 0;
+	default:
+		BUILD_BUG();
+		return 0;
+	}
+
+}
+#define __get_user_fn(sz, u, k)	__get_user_fn(sz, u, k)
+
+static inline int __put_user_fn(size_t size, void __user *to, void *from)
+{
+	BUILD_BUG_ON(!__builtin_constant_p(size));
+
+	switch (size) {
+	case 1:
+		put_unaligned(*(u8 *)from, (u8 __force *)to);
+		return 0;
+	case 2:
+		put_unaligned(*(u16 *)from, (u16 __force *)to);
+		return 0;
+	case 4:
+		put_unaligned(*(u32 *)from, (u32 __force *)to);
+		return 0;
+	case 8:
+		put_unaligned(*(u64 *)from, (u64 __force *)to);
+		return 0;
+	default:
+		BUILD_BUG();
+		return 0;
 	}
+}
+#define __put_user_fn(sz, u, k)	__put_user_fn(sz, u, k)
 
+static inline __must_check unsigned long
+raw_copy_from_user(void *to, const void __user * from, unsigned long n)
+{
 	memcpy(to, (const void __force *)from, n);
 	return 0;
 }
@@ -39,27 +71,6 @@ raw_copy_from_user(void *to, const void __user * from, unsigned long n)
 static inline __must_check unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	if (__builtin_constant_p(n)) {
-		switch(n) {
-		case 1:
-			*(u8 __force *)to = *(u8 *)from;
-			return 0;
-		case 2:
-			*(u16 __force *)to = *(u16 *)from;
-			return 0;
-		case 4:
-			*(u32 __force *)to = *(u32 *)from;
-			return 0;
-#ifdef CONFIG_64BIT
-		case 8:
-			*(u64 __force *)to = *(u64 *)from;
-			return 0;
-#endif
-		default:
-			break;
-		}
-	}
-
 	memcpy((void __force *)to, from, n);
 	return 0;
 }
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
