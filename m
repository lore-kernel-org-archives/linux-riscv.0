Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D82C7EE2D
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 05:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/I78CdP/UKpr6XztgdZpaxh9LF5V180w4YSOd2e8ic=; b=RAY8cIBS8Gpaeg
	1PeEPja5I29ay6C3se1Z8lA3kFr1Jbu09863IqjzfwRj8lQsy4OJdjMaruw0aIqhhfRTcA/K6hC0+
	iA49Jt56pvPpqibfifmFnZg9cV6Ck3+29UqaMkGQPBe02S/Ffg7G281WaSpIGGnAEUU2/VP2BUbt4
	kf3xUzV708TXI+TrF09hOm56WbG2MsqbqVV1ofjpBfCHKzWmdmi67wNq+qFcTTtIA80D4Q0+LQMpQ
	5zYmthuyr6wNzp+nAGxKaVXeJIOqvBwiRApHoBGZtwN88gtjgESyFKjTWQTRk46xk9Rs2nqeGi1WX
	Id07Rjbb9tvWWXnXRsAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gOn-00BMwj-2i;
	Sun, 04 Jun 2023 05:35:29 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gOk-00BMvd-2I
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 05:35:28 +0000
X-QQ-mid: bizesmtp83t1685856912tz2mpqb9
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 04 Jun 2023 13:35:11 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: rZJGTgY0+YN6Hgm0UEoWeI0raRxwz+OClFuVPySOxGuRMnsmCqEXyxefSu3x0
	2WU1GagREmkvIIMdLAcKZPPfzXOjtPC6QHE3ohpmFo0EwDu8CwIBqVcnio0loP9RgMSMEle
	vfF2rNJrqkaUHui8aQBWgK5qof0qpL61KoggBuPyvGXjWlRfC+JUz68VKJvriGEPu22kSbc
	RqLABcHytpqcY77XZL3DpY4doFeZYFXTqw9icVDCrprILlhn+oHUh/o89uCtTCHgHw1Z4/g
	qH5mWGlhL8RN+5kTi7TjkC8GBo1nfTwYXvNmegQ1933fDtiBVCTz03KNUfGCKHNsjcRg/aK
	RsT2h465n546UCWpcxgDIIFqF9rZUXUyBTxm19I3slRZRZGF2/hpk36ULoPt4VGRjQLLtme
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 350183426812210734
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 1/4] tools/nolibc: unistd.h: add __syscall() and __syscall_ret() helpers
Date: Sun,  4 Jun 2023 13:34:29 +0800
Message-Id: <f549b27981484b429b7c7f98e212bf3c5561724f.1685856497.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685856497.git.falcon@tinylab.org>
References: <cover.1685856497.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_223527_052632_7D5D4647 
X-CRM114-Status: GOOD (  10.41  )
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

most of the library routines share the same code model, let's add some
macros to simplify the coding and shrink the code lines too.

One added for syscall return, one added for syscall call, both of them
can get the typeof 'return value' automatically.

To get the return type of syscalls, __auto_type is better than typeof(),
but it is not supported by the old compilers (before 2013, see [1]), so,
use typeof() here.

[1]: https://gcc.gnu.org/legacy-ml/gcc-patches/2013-11/msg01378.html

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 1d6f33f58629..937a8578e3d4 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -28,6 +28,21 @@
 #include "errno.h"
 #include "types.h"
 
+/* Syscall call and return helpers */
+#define __syscall_ret(ret)						\
+({									\
+	if (ret < 0) {							\
+		SET_ERRNO(-ret);					\
+		ret = (typeof(ret))-1;					\
+	}								\
+	ret;								\
+})
+
+#define __syscall(name, ...)						\
+({									\
+	typeof(sys_##name(__VA_ARGS__)) ret = sys_##name(__VA_ARGS__);	\
+	__syscall_ret(ret);						\
+})
 
 /* Functions in this file only describe syscalls. They're declared static so
  * that the compiler usually decides to inline them while still being allowed
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
