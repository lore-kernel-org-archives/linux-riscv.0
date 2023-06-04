Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150D7C77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 05:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgMfECI4LExzfFO9G03CYZ12rcavMGm7tzfdsGj/nMg=; b=CvVUw2obV3XVqH
	qadgr4nMMdaaiRuvJwcaDlo0uvj5RNAB1n9MX7CAb3QUlqxRP/Nzi3m9NEgpk7az+XX/gj9T/qh4m
	uJOWMIGHyYXOfV7ASWaujiReYEAxRRf72OM+eXwpjVdiHroKk4LPyX2S5KP/0AvPdAO5VfQJGVwGP
	zM+MJsk4d3dckjhIdV7xhusK5Ul1p67tgkHV7C3u0tFxUHcTkfqhIHcXfPMIlAKtCR7SHXkA2bGxg
	Roaqys/cpZENe7dHaPM64Fdm4GddROyq9Lum115FK367GaorupG7EMqjSv6GJSANHANPc0zlIJw/b
	bzv3auj7qfvQ2IGQkObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gRQ-00BNM1-08;
	Sun, 04 Jun 2023 05:38:12 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gRN-00BNKo-2D
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 05:38:11 +0000
X-QQ-mid: bizesmtp91t1685857075t2knx7k6
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 04 Jun 2023 13:37:54 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: qTKqCPEPPMCMusprEIJpvMeXnrP/Pg47ltBveugHl56AMUwpiPQN+dX7Bx1al
	hyQMy5WOb2iwGqbVG2Vee4E1CJKGTYaPVCKPKX8kD8/yo3tZ2rIeymiY72vSvRoMb27pNEG
	jbtc7RzZOGJhVxHVAMve+71tINCsEp/ZTion6ifg/TNLEPpYBd9LH/w5ADuQNFBURZosfvJ
	q84P945SwQwPVyJeqTGthznnJkaFBxh1lvZinTuthAASHZzYB5dxSii1VjZ0QNeeP5aptOE
	l4sRjOXi7m0tDtf6US/kKjuJkH4SfpZllHn8WRggB3P2ElsmPmnvGNtklXZjXmiFa11fK2N
	83pqciJQiKSs3As+YWzh+KbdwYUfVOkVV+ojkfRpGAYNrxHTeuIvSLLAg2zfw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1136455146398936182
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 2/4] tools/nolibc: unistd.h: apply __syscall_ret() helper
Date: Sun,  4 Jun 2023 13:36:20 +0800
Message-Id: <b3e791c9c2cd564e1b9b94d61104aa7d69b603c1.1685856497.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685856497.git.falcon@tinylab.org>
References: <cover.1685856497.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_223810_027704_7232C4CF 
X-CRM114-Status: UNSURE (   7.34  )
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

get the return type automatically and use __syscall_ret() to shrink 4
code lines.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/unistd.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index 6773e83c16a0..e4e2b4c09771 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -56,14 +56,10 @@ int tcsetpgrp(int fd, pid_t pid)
 	return ioctl(fd, TIOCSPGRP, &pid);
 }
 
-#define _syscall(N, ...)                                                      \
-({                                                                            \
-	int _ret = my_syscall##N(__VA_ARGS__);                                \
-	if (_ret < 0) {                                                       \
-		SET_ERRNO(-_ret);                                             \
-		_ret = -1;                                                    \
-	}                                                                     \
-	_ret;                                                                 \
+#define _syscall(N, ...)							\
+({										\
+	typeof(my_syscall##N(__VA_ARGS__)) _ret = my_syscall##N(__VA_ARGS__);	\
+	__syscall_ret(_ret);							\
 })
 
 #define _sycall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
