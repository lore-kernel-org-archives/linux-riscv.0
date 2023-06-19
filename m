Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876B1EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7OI99EJtdkc2d8l9l2QvOzPDwT8wKobslDNbjAt9Uo=; b=VYMzeGQCvsjg9m
	I7VkV9LdfK35tfQdCDJNFWXYdilyYIwT2SnWYVrJ2mCVnds3PnHJMfbmEk/0cQA95eBw99Xx05UnV
	mpPE41Q5OJGF3XroMoq4No+xxVC/jn7V1eci1oooVLWgpJslmjGKz1pOBxpJ6p+egicMCVCRenJJK
	0pO3ID/HBtgcdaD3nUbVDNaT5t+ybu+QpuDNeJqu5FRVcccMDep23/P1W816As33mD1QAHlrg977k
	Wx+fhMz2u+bWHvmPL9iSPYgeVlFSDvxOPlrFKkso1Ql0XwWIxuguyDHTS9QOUDuGelcJtTyJS1xTM
	NOVqM+ZcUf/PVYndPjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH9K-008ptW-0W;
	Mon, 19 Jun 2023 15:50:38 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH9G-008ps4-2j
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 15:50:36 +0000
X-QQ-mid: bizesmtp65t1687189816tdj31vkq
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 23:50:14 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: lJ9dImo9Gpeyz8IOKq+GcNXt5bf5lKsHx4krldfzto/2klwvpwlW5zu4HsFMO
	T3D5l8mDvV8FkGonqQzuWoU43QdE6GRR6PIVIB0HxaHgFBH0BglfRFDghFmMPBZM8DI5II7
	1VmJ6Lw8HBn/7eZ94UtUuKdSkNOVFWWoatTOu/yoQdknRrDgAMarKa+RO+x/sJPTWthw60d
	FOPdQ9jEm8q4jTAlrRtzy/dOgsqWUQkAXSGHiUxYPOh0i7mnXppFlh6qDQrVDFpSYG70mbs
	HCEsMn0XqQDYpLsRzogrLqNBsOjF9Vx78SpiIXCEViHeVbcUwPuoB20V4Mq9sMAQiVDcul0
	3A3z92ODahZBnR/e1BhsIBg5cub/ZAWqKvEcrF71WY0VAO9OHRUliKtrQKgw8FfmlatbISe
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1071758241014777112
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: david.laight@aculab.com,
	arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	David Laight <David.Laight@ACULAB.COM>
Subject: [PATCH v4 06/10] tools/nolibc: __sysret: support syscalls who return a pointer
Date: Mon, 19 Jun 2023 23:48:21 +0800
Message-Id: <aae854b2de881f9bc1c82ab9dda53b51d7330c9a.1687187451.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687187451.git.falcon@tinylab.org>
References: <cover.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_085035_188728_37F0923A 
X-CRM114-Status: GOOD (  12.10  )
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

To support syscalls (e.g. mmap()) who return a pointer and to allow the
pointer as big as possible, we should convert the negated errno value to
unsigned long (uintptr_t), otherwise, in signed long, a potential big
pointer (whose highest bit is 1) will be treated as a failure.

tools/include/nolibc/errno.h defines the MAX_ERRNO, let's use it
directly. after converting to unsigned long, the negative errno value
from -1 to -MAX_ERRNO becomes something like '~1 + 1' (every bit is 1)
to '~MAX_ERRNO + 1', '~1 + 1' is the biggest, '~MAX_ERRNO + 1' is the
smallest, so, the check becomes:

    if (ret <= (unsigned long)-1 && ret >= (unsigned long)-MAX_ERRNO) {
        ...
    }

Since (unsigned long)-1 is the biggest unsigned long value, it is always
true if bigger than (unsigned long)-MAX_ERRNO, so, just reserve the
following check is enough:

    if (ret >= (unsigned long)-MAX_ERRNO) {
        ...
    }

Suggested-by: David Laight <David.Laight@ACULAB.COM>
Link: https://lore.kernel.org/linux-riscv/94dd5170929f454fbc0a10a2eb3b108d@AcuMS.aculab.com/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 4fbefe5adf93..8a6e16472d54 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -28,13 +28,16 @@
 #include "errno.h"
 #include "types.h"
 
-/* Syscall return helper, set errno as -ret when ret < 0 */
+
+/* Syscall return helper for library routines
+ * set errno as -ret when ret in [-MAX_ERRNO, -1]
+ */
 static __inline__ __attribute__((unused, always_inline))
-long __sysret(long ret)
+long __sysret(unsigned long ret)
 {
-	if (ret < 0) {
-		SET_ERRNO(-ret);
-		ret = -1;
+	if (ret >= (unsigned long)-MAX_ERRNO) {
+		SET_ERRNO(-(long)ret);
+		return -1;
 	}
 	return ret;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
