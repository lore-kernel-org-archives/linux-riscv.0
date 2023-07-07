Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9243EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRTTlm8J0ZiZH2Yytwjrd7vbdwzrwSkXxhLmMMMCBkM=; b=GqCcXvYdNy47nf
	7AjbRLSES5a4w4r7BUHhlnr+NkFgYgrflTucN4/5af2Hnt/JXieaPaDvXNyBoJWfuuDreH+U0D5NW
	R01ru+tpJqLHAeyWBC8L98RpfVkuOknK/Fx76+Wwn0jib8CH3EFWeWbtoPVju+zd00CHdd5A7OXmt
	0zZuN++taJyW3T4rQR62RZ65oLNAOsSvz0JWL0XnNeXfwbtXTw95nr27/zjRGbpG7prrFuzSr7H+m
	8h7+BMwoQmxotJI9+iNUD0s100hj/xMnSOiXnL6VR1Uiy6MHQbVT2vuKRUaCb3hojjay+5+lLsKLU
	ioanVZbLUEmVpdMaHcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmq8-004vuq-0t;
	Fri, 07 Jul 2023 14:53:44 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmq5-004vt5-0b
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 14:53:42 +0000
X-QQ-mid: bizesmtp62t1688741604t1m5yidp
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 22:53:23 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: RumxddD8MdDoCupDu61PsFdnODRCtUmvZyeNJY1kEp4RpqJHc+ft0WnnMTIMl
	8E1IBp9KiQV/4Avrm24T6ReRHju3wRp/EAlp6VfplODJn88CSPwt5Hj27c/7mENQXkqeWP/
	P5icrX8GIU+X80kAmC05Iwm1qu+Z6czaDJClR1LN5Ie8oFBwT7Lens4Ftz0+Ytp+9vzlVAQ
	KIwE+Ifb3ea0bF5boi2yusAJRFWWF6WnNd9OyIiRggyyGkCuHWs7NtJ+SMwndFp0d3S331T
	7v1LN26Z7mqjG+HQNvcfKOACHySIeoz8hoDN3eQm0XRw0/P/i0CL7LszpTsjEAUjpCve+DQ
	QHwzRV0Z0bXvNPGlE/id2smOyitCsXV1ACIAjTHRO9mlbvGaRh0YqDNpH7gTg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13151235364426953370
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 03/15] tools/nolibc: arch-loongarch.h: shrink with _NOLIBC_SYSCALL_CLOBBERLIST
Date: Fri,  7 Jul 2023 22:53:20 +0800
Message-Id: <83b89f7e2935c0708d92dc473c8434d0d304c74b.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_075341_558146_295D3177 
X-CRM114-Status: UNSURE (   7.46  )
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

my_syscall<N> share the same long clobber list, define a macro for them.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/arch-loongarch.h | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/tools/include/nolibc/arch-loongarch.h b/tools/include/nolibc/arch-loongarch.h
index 8df42268e578..8aa7724fe38e 100644
--- a/tools/include/nolibc/arch-loongarch.h
+++ b/tools/include/nolibc/arch-loongarch.h
@@ -22,6 +22,8 @@
  * On LoongArch, select() is not implemented so we have to use pselect6().
  */
 #define __ARCH_WANT_SYS_PSELECT6
+#define _NOLIBC_SYSCALL_CLOBBERLIST \
+	"memory", "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", "$t8"
 
 #define my_syscall0(num)                                                      \
 ({                                                                            \
@@ -32,8 +34,7 @@
 		"syscall 0\n"                                                 \
 		: "=r"(_arg1)                                                 \
 		: "r"(_num)                                                   \
-		: "memory", "$t0", "$t1", "$t2", "$t3",                       \
-		  "$t4", "$t5", "$t6", "$t7", "$t8"                           \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg1;                                                                \
 })
@@ -47,8 +48,7 @@
 		"syscall 0\n"                                                 \
 		: "+r"(_arg1)                                                 \
 		: "r"(_num)                                                   \
-		: "memory", "$t0", "$t1", "$t2", "$t3",                       \
-		  "$t4", "$t5", "$t6", "$t7", "$t8"                           \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg1;                                                                \
 })
@@ -64,8 +64,7 @@
 		: "+r"(_arg1)                                                 \
 		: "r"(_arg2),                                                 \
 		  "r"(_num)                                                   \
-		: "memory", "$t0", "$t1", "$t2", "$t3",                       \
-		  "$t4", "$t5", "$t6", "$t7", "$t8"                           \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg1;                                                                \
 })
@@ -82,8 +81,7 @@
 		: "+r"(_arg1)                                                 \
 		: "r"(_arg2), "r"(_arg3),                                     \
 		  "r"(_num)                                                   \
-		: "memory", "$t0", "$t1", "$t2", "$t3",                       \
-		  "$t4", "$t5", "$t6", "$t7", "$t8"                           \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg1;                                                                \
 })
@@ -101,8 +99,7 @@
 		: "+r"(_arg1)                                                 \
 		: "r"(_arg2), "r"(_arg3), "r"(_arg4),                         \
 		  "r"(_num)                                                   \
-		: "memory", "$t0", "$t1", "$t2", "$t3",                       \
-		  "$t4", "$t5", "$t6", "$t7", "$t8"                           \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg1;                                                                \
 })
@@ -121,8 +118,7 @@
 		: "+r"(_arg1)                                                 \
 		: "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5),             \
 		  "r"(_num)                                                   \
-		: "memory", "$t0", "$t1", "$t2", "$t3",                       \
-		  "$t4", "$t5", "$t6", "$t7", "$t8"                           \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg1;                                                                \
 })
@@ -142,8 +138,7 @@
 		: "+r"(_arg1)                                                 \
 		: "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), "r"(_arg6), \
 		  "r"(_num)                                                   \
-		: "memory", "$t0", "$t1", "$t2", "$t3",                       \
-		  "$t4", "$t5", "$t6", "$t7", "$t8"                           \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg1;                                                                \
 })
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
