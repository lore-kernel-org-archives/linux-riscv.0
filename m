Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC7DC7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDEB7ZxfNkENoO9QeoIIIXbmeslfzU4I8Bj5ekMLs78=; b=QT5qvZIfQJdAit
	3K2JThzNiJlOCty6NiwmFMuxHEsrhhEVFZcYzthvzqQJ/zn4al3CQg5rbpUh6J6JU9GDhURX+ijSc
	iG82sp+chGGfkfGaTnsfEIUoMoW+ZPdpp4vEb8WCQg0cNS8jjLVszpU0ast3iEB0zLLuhV1QuAA7G
	ZZPKcJaNpYk+avQkVyz0G2WVEnaND30l6F7Tgwg/Awm2pHpPIXKHEe2o7l6R0QEGkQd0z7ljJ/9br
	+NRqGRSaZxqzA2lsraxzsL5TEa2A/VZbJxii5UQI5s14I85Zeg2ae0n/4y7PIW2ZZTudGOwCKyKu4
	Ae25Yzb9wjX7PUUsmvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rOY-005em1-1e;
	Wed, 07 Jun 2023 11:32:06 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rOV-005ekq-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 11:32:04 +0000
X-QQ-mid: bizesmtp90t1686137506t0akcs63
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 19:31:45 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: dKvkn8qoLrHe6LOHMBCWXivAD3jSJX56tkAHTePVV6se5edU/yVWT48Z+BxDO
	d4DGxeqgrsnPJ4fbTy+ZEMF8RMEdgl8zXU7OdTTO9L9RqxLBdwC87y/40SdiVhpCEdHHvtX
	xIIgsl9eCnWP1PIRp4Pkhnm4QdwRpuCW+0IT88p2iV00eJwNRnyxsoG58G0v4enZ2XhUkMa
	SpXG6UsK/2KquLDDbzmmbT2ZRqCRoLMecnsZz1Twz3kR4YlzLU6xwq9EOTUo0vnEsKXtKHl
	Z2O+l+T6Tx+eQ6bKu7zRTy2NonNIfDFNuxuvoSa6f9yDloKT/lZEoUTIXaI0XtPMAdFZPO5
	LqkqOKBaTEkhkwzHDco4hD4piuu1r7UIs/LdG6JBGsyVyjJXV5773+B4SgSVEsT2smFnQ+O
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3202086989928057354
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/3] tools/nolibc: unistd.h: apply __sysret() helper
Date: Wed,  7 Jun 2023 19:31:39 +0800
Message-Id: <af5635d5e7a10429fe30b79e090e67bbec707195.1686135913.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1686135913.git.falcon@tinylab.org>
References: <cover.1686135913.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_043203_796229_CF9F56EB 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
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

Use __sysret() to shrink the whole _syscall() to oneline code.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/unistd.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index c20b2fbf065e..7e3c005d28ba 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -56,16 +56,7 @@ int tcsetpgrp(int fd, pid_t pid)
 	return ioctl(fd, TIOCSPGRP, &pid);
 }
 
-#define _syscall(N, ...)                                                      \
-({                                                                            \
-	long _ret = my_syscall##N(__VA_ARGS__);                               \
-	if (_ret < 0) {                                                       \
-		SET_ERRNO(-_ret);                                             \
-		_ret = -1;                                                    \
-	}                                                                     \
-	_ret;                                                                 \
-})
-
+#define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
 #define _sycall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
 #define __syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
 #define _syscall_n(N, ...) _syscall(N, __VA_ARGS__)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
