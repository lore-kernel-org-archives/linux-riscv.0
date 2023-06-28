Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7BEEB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C20UGYpteu8KqQv1TqbI9fi77QCUtDK3wQ4Cv2VlANQ=; b=LDppPWgg3HyVOQ
	0VgNIdamirm0afT/mM/6TFb81wESgzaDp8KkKGs6ehx918Icv07LmwwL6fSkkwkwUd3QqR7/+qXLS
	3mGiqZ35bOmBI3/W/4znyYwHXttN714RaxijsUbwLKj6jX+KuYSa5MHxNcxgN78Z4y7DfIJYIBMGV
	YgW46pCu7rbsmL89biD1kdyZfS9WKVkO7cFDVO4nEU82g7jcGMJ3tT0qNa2EpGGrxGFvkBHjoVdqV
	hgKNFT9LfnSlqUtoGH/+OjB3obR2N3Lgi7c7fIOnZWd9+atK0/dWvi8mXs6WB+Oj8Ov7ZGhhLd6eK
	HmEf4bhgMyvGTf384aow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVPL-00FnDQ-08;
	Wed, 28 Jun 2023 13:40:31 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVPI-00FnCM-0w
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:40:30 +0000
X-QQ-mid: bizesmtp63t1687959609tym1h2ar
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:40:07 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: RrZlkntZBfm7xfyOGEmRqtWFTO3iq7nrzLtjOv4A2klW688L8fqcGLaJOxs8X
	3F31Ai7GCBo2e9HJyJILIB42zbeQx1PuK7MYOfzgKgeaSRyYEmvI3hI2uTHhybYCBrsA3cp
	lS9RSbXqWjPh8ae0mL2HdWhgRJCIj6hHiwuiw5vmOpYUuMmi5hG9xLwpb+2pSbkKiMMXT7H
	zh8H3WHw1AhFVzB0XpFpehS+BHfnlTIdh6yP8pcReyx66HBcS99g/oRIzWaDjHA8RbxP/zQ
	PaskCzmAYuEA1rRID6wETmtTzTqReplG8ThnqMB1q3tpCd7su10qnwcpvXYWaRnHzPvYojP
	+KN8Bp67CChP70petq2j5GKX9rlALGG3tAh+/jWXJy/KNyr37geEaTCIZOvaA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14474260632320986348
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	David Laight <David.Laight@ACULAB.COM>
Subject: [PATCH v5 10/14] tools/nolibc: __sysret: support syscalls who return a pointer
Date: Wed, 28 Jun 2023 21:39:56 +0800
Message-Id: <72d948095d22c3ba4e69d98877addcea49a326c6.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_064028_629466_16E389CB 
X-CRM114-Status: GOOD (  11.87  )
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
index 53bc3ad6593e..b6125e600dc2 100644
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
