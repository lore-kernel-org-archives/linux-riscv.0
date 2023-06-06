Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B900AC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDEB7ZxfNkENoO9QeoIIIXbmeslfzU4I8Bj5ekMLs78=; b=rIz296t2LFaPD3
	HrnBjRltjyY/LBni/FtQP1Knu3qYh8bwABZl2oGlSOSNycWqLluy0we2gG2UYMcQibZeh4Thp44S5
	QLLR6AaYXQASvoiVnwppBBRZRUl9NvqdCcahGqC1QyEfi14ATphEI/a4uWl+fN4UPDfcuIZ9HaOpl
	G6wosh7ZLOU/8qRznlQOLbC3/oKQX1NvVjH5cmeNdEcoUf9hLTN1/784BJ5QuHUg8dcEDNv+KevQZ
	1tsbRCYuLmjn6Tz9wulQ2fQn5+TIFUt/FWoyrrEbCaFXTuOSGMaV9OO0Uj02r7LsrgYl+GaGb4uQS
	jWqgut3K9uiMd61tUolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Rqe-000koy-2a;
	Tue, 06 Jun 2023 08:15:24 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Rqb-000knE-2h
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 08:15:23 +0000
X-QQ-mid: bizesmtp90t1686039304trwmue6s
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Jun 2023 16:15:03 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: Sx1DrRIRqMdZ/MlCKruD26v8RqVr1CqYgFN5TjLwES8X+31r0YtgE6IBd5cmf
	DKk1dhvd4kdbyYCcvDHYlgPvIIZUN8eIxVkKKiLqrQ4UUMsnftqUrk03X/oF/6ZFzFAwjhj
	77U0T4jL4pFsMjQBOVLSF3utZBeIScSOMCTU82gLNitvMSA7M6+yqVKIrOMBZcyYpTEkNUb
	VI5+pKYaFWHr2fNaC+pzOW98RgrorJ472+Q5MGW5Eor2qTEcQ3Y1Ib5/9I5EvC1EB41M1l1
	Norl38y/vfKux6oTJBLP1e3GtPQ194vOUr95Or/8HE/F4qLGhBmgAUrUYtf/7JA/nDZfWgs
	CLnnL18aYxDAf+ZnzXWb6h5xBNkYESID5pJspa3wChK48GopzMjXEGvre/m3A==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13882787233173972735
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/4] tools/nolibc: unistd.h: apply __sysret() helper
Date: Tue,  6 Jun 2023 16:11:03 +0800
Message-Id: <52084c2083472421b13d092357819b14f405e0ea.1686036862.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1686036862.git.falcon@tinylab.org>
References: <cover.1686036862.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_011522_190453_D8249626 
X-CRM114-Status: UNSURE (   6.87  )
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
