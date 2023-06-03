Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B2EC77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhQ3BI1HsybhzQFwSLc4lcSFFrsRpk0PfYPzegC5X2U=; b=PCHy6RWQL9smKW
	Bsl9sAMka++KXE0GwKJ2v55tpDS8XwILtHGZpqG+GeXm8FQq+/zfzRBUnUbp8HIO/C8u3YzNveNTj
	VKx8pbx8Oy3qUIWmY0K7p3xllhtu6xPPOUdaVA1VHu2oX1gpE5UAczZpmJ1LwXeTQoi3nfcOZWVQk
	UgjFOaWVAFHQS1sickOSsc7Cmgzz0ecXXkA0WzbO8aqvasRlLEFLCjsKzNF1X5ejWzOxsSdmpY8b3
	zxLozjEkHXqcez+AjzHY0jQgEeq6ZcCJ16se68l+y5336bpJcMk8rcJob5u3GlTdGcxcB2z/0PGhG
	ZDNmQm1GV+Nz5uFoHwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MLs-00945Y-1e;
	Sat, 03 Jun 2023 08:11:08 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MLn-00943i-2r
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:11:07 +0000
X-QQ-mid: bizesmtp84t1685779850t070pfh4
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:10:48 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: OFQdrTmJ2CRHOIPOvPtA3e3sNPsSHx/EuKOIZ/4rlJjrEdoz8zKYkHvsc0a0g
	uVElhx17GeBytasxWjr74uHrLAFmp+cvg7v6zEQSDxFWP6HpzXc7UFvixkc50irMnOQ1Me1
	lbNXYNdCQLzyQig1+Cd5VecTpxTacvtTO+UqOwAYJad0x7TPJCcbgpSvABLqWjhYXCljV4m
	TClILQ1MrAGVoIvZrkY1gANg57tvM20wBNI/U6b/7ga+0lEl1pQmQEB+/+Db4McoyZ+Iyy9
	gEwwBqdKP7S3mJAY8hy6BQKUEB/NZX9drKaKSNugSWr/jD0pRZ/glA5QiZfYdWBrDLRaaBm
	KkCuQ+A1QhNTfHOjLdVXMFG36sDOzck8GP7x3X17LS7yCrUaXus5m0UCVqCs/gNPr/+t88C
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4932993796128682688
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 07/12] tools/nolibc: arm: add missing my_syscall6
Date: Sat,  3 Jun 2023 16:09:41 +0800
Message-Id: <75c37f86eb9ae5173d136676432d5ace3a8c54df.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_011104_225315_C9832123 
X-CRM114-Status: UNSURE (   6.79  )
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

This is required by the coming removal of the oldselect and newselect
support.

pselect6/pselect6_time64 will be used unconditionally, they have 6
arguments.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-riscv/bf3e07c1-75f5-425b-9124-f3f2b230e63a@app.fastmail.com/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/arch-arm.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/include/nolibc/arch-arm.h b/tools/include/nolibc/arch-arm.h
index 45b89ffe8247..ca4c66987497 100644
--- a/tools/include/nolibc/arch-arm.h
+++ b/tools/include/nolibc/arch-arm.h
@@ -198,6 +198,29 @@ struct sys_stat_struct {
 	_arg1;                                                                \
 })
 
+#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)                  \
+({                                                                            \
+	register long _num  __asm__(_NOLIBC_SYSCALL_REG) = (num);             \
+	register long _arg1 __asm__ ("r0") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("r1") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("r2") = (long)(arg3);                    \
+	register long _arg4 __asm__ ("r3") = (long)(arg4);                    \
+	register long _arg5 __asm__ ("r4") = (long)(arg5);                    \
+	register long _arg6 __asm__ ("r5") = (long)(arg6);                    \
+	                                                                      \
+	__asm__  volatile (                                                   \
+		_NOLIBC_THUMB_SET_R7                                          \
+		"svc #0\n"                                                    \
+		_NOLIBC_THUMB_RESTORE_R7                                      \
+		: "=r"(_arg1), "=r" (_num)                                    \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
+		  "r"(_arg6), "r"(_num)                                       \
+		: "memory", "cc", "lr"                                        \
+	);                                                                    \
+	_arg1;                                                                \
+})
+
+
 char **environ __attribute__((weak));
 const unsigned long *_auxv __attribute__((weak));
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
