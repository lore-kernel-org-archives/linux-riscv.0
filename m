Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705A4EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyPiuzjFJmaSMO8tMDhKMaIfBZeGo8fSkrbkoF59gwQ=; b=1HIfA4tbCGICQn
	Wvn3wWguCBYOq69gIZiBnhvpAuN+YaX2+YK9R13lzN2c6oZRandyZ1EaFjHY7oo6ukysl3RDZ5KpY
	rIVnNWO234ZnS1nVpXrvpt49EWsSTmnKAhWFKNsgHaQZm/MrZcMYJl8edLdKnLhW1WzlPzuGAsk8h
	SjB2Wrm5Xd2nuOaN1HXuMvI44zCITJD2M7pPSv73n//K/IoxHKa//uVdrC/K4gSLacdb+2IDQjqh6
	U7oREguKSQ7YuTzMEH3Tej0SPw/Z6/XvFUKjlXCMXdB6v3PLuxU0Yv7ufReNvwPhRWyu/QF1Zoyxr
	kHZ79sTzVFBL6gTH+8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEV2K-00FkDA-0o;
	Wed, 28 Jun 2023 13:16:44 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEV2H-00FkBk-11
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:16:43 +0000
X-QQ-mid: bizesmtp76t1687958175ts14rjnr
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:16:14 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 7YFKcddXagi2DVqxpVhCFo/vBHtMVaf8YdumO5sFURZlqB7s7a6X/9zpcHepq
	iPnG3ViG8HcSLGdZpQrvhSkyOrwOy0h6Y8KUmaU/t7wp1oMA/OcOL4wClUH0CNXRBqMxrMj
	GIC2HanU6i16pKbLA4pUUdIh34XWQG1o6j3DuERi6steSM2QS/B9rNh6xMOJTVS+A7AWUD1
	UfXJVTCTX2iF3kWRfOX254z5xX+/tuKpG6mzKcDKXigvnH0AxzW/a/wbLIkM3T/CMMvsx7C
	wZoPlQgV61dxlMnc65CO5dJ4akf+jSCmbBJTA7K3GFSZ4fsRIRleXmsVgXTncgucLNpMf/b
	89PJ8cHlmQ7V6djTC3psejkdfzrHomVv6U+zM5Q9fR039DUYyUvMNNy+nzUNQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3330608914897829044
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 04/14] tools/nolibc: unistd.h: reorder the syscall macros
Date: Wed, 28 Jun 2023 21:14:53 +0800
Message-Id: <0e97fc7e36290e729d07e35db27caacb95354d87.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_061641_656184_0AED3B93 
X-CRM114-Status: UNSURE (   8.17  )
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

Tune the macros in the using order and align most of them.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/unistd.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index fabc846f797b..e38f3660c051 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -56,9 +56,9 @@ int tcsetpgrp(int fd, pid_t pid)
 	return ioctl(fd, TIOCSPGRP, &pid);
 }
 
-#define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
-#define _syscall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
 #define __syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
+#define _syscall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
+#define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
 #define _syscall_n(N, ...) _syscall(N, __VA_ARGS__)
 #define syscall(...) _syscall_n(_syscall_narg(__VA_ARGS__), ##__VA_ARGS__)
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
