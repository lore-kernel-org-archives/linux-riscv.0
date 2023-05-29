Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF826C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMjoJW4bE8T0dEQ5xsZk1yKL54ObdTcJCsCUW5A+x3I=; b=ssg4vuBpnfjGJN
	9XPyD7uEM24MJSe56LUvJQfEKtfVlz28KU1ceegZwbZsTyI6CFIZN4OuLN1mdRoHWN1smQuYB8eaY
	DCdq4egSRax1LaspQbU8E2PNJvdmzKDecRJrW2ehekPHClNCifabiPK34v1VAi6DfacyVsWkQ5Q/k
	xXLN6fvoeGd7tTFVZ64CXJtoxEWGdJQYv/XvdeXPSDerq3Nk6/f2h6aTuZTr6xttItxPdB42IYW/F
	dLSKzlFXfXsmpv+GnOJMia7GtTcjabNG1ibl+U1eiJPp4VsRgahYHulwrMXZRfOEypq2j3JbAmfgA
	AuV/L72UWgwskIVoCwwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iuY-00BYeE-06;
	Mon, 29 May 2023 19:52:10 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iuV-00BYc0-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:52:08 +0000
X-QQ-mid: bizesmtp87t1685389912tusgo9mr
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:51:51 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: LE7C6P2vL8R5XJtM7F/ylhDdnSf4EUI8w+v082wCayEwS8rdu+e8MzUqlG3Sb
	QuE4mqAnTVj6AADlLJu/mYN813+YPw+wXBoUtUM/fgbT6eqZhO8mdM4qSyoVp4k8dOh/beL
	/l7yxz9x8w9r+TSZWZLLMsMD9u3qECqZpmPkRw0+tQOYBeXpiaRhRFDEEoxVspoDs9zmbAg
	977LlI4WFKBMXCoTk3CBGjDpFdvDeGrbH0Fsj2GfLw+U4NeVeHbXa3Ycefev6zt9mzP01Qo
	LJnk0Twv4xlHA/20ARRy2Qt8n9dEKicVztokHy1O+8hrgKAQQHYbo5SNcKjO3ajFS8Vnkwl
	KO6HYcWeOwM/XfiLougrpGNauB5hUSmFxblr/kzjnLpPEhiZhWuZnbWOyY86IFQeBWRJY38
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14959843268558275111
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 05/13] tools/nolibc: add more wait status related types
Date: Tue, 30 May 2023 03:51:48 +0800
Message-Id: <e578baa7116bb09f406a2beaea8298f7bbb22d6c.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_125207_511167_D65B288B 
X-CRM114-Status: UNSURE (   9.54  )
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

More wait status related types are added for the coming waitid syscall
based wait4() support.

Resue the ones from <linux/wait.h>, add the missing ones from sys/wait.h
and bits/waitstatus.h of glibc.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/types.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index f96e28bff4ba..698d859fc6e2 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -10,6 +10,7 @@
 #include "std.h"
 #include <linux/time.h>
 #include <linux/stat.h>
+#include <linux/wait.h>
 
 
 /* Only the generic macros and types may be defined here. The arch-specific
@@ -91,9 +92,13 @@
 #define WIFEXITED(status)   (((status) & 0x7f) == 0)
 #define WTERMSIG(status)    ((status) & 0x7f)
 #define WIFSIGNALED(status) ((status) - 1 < 0xff)
+#define WIFSTOPPED(status)  (((status) & 0xff) == 0x7f)
 
-/* waitpid() flags */
-#define WNOHANG      1
+/* Macros for constructing status values.  */
+#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
+#define W_STOPCODE(sig)      ((sig) << 8 | 0x7f)
+#define W_CONTINUED          0xffff
+#define WCOREFLAG            0x80
 
 /* standard exit() codes */
 #define EXIT_SUCCESS 0
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
