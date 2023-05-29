Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C389EC77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gq74zXhRDcMdHP8RmObVz9H6O+LNRKM1+UFyXVpzT8I=; b=Tf6VEjNJcYX5e+
	RZfF24R75lRSpbwaa+tnDr0kodjwXYZDlWIZjlS6HgUH/RgQXQwbVu13ZhzWpo64RjojUHshxejYa
	n+G/7CrqPCMzA+tkI/SvivG4+Bd8MG9yBvm04zbopXHtzvdnf395dCE9UI4qLcdW6XHqOVsVRJNl8
	WHAvX5GVPQRhumm21WiSDmfsMFypxlUBBKT1LD9Zm7bDccD3y/ktQviCNVkwQmNNUrXzZMGl/NOCS
	B7Im/xibUUqI4R8S32k9OjUsA84MT5PZHLp6m7pi9zS0TpvMzMfKpDzRJl8uIwtUqUwDgZLkV+6fh
	liXbypStUWBC9GrGk8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cbT-00AXcC-2T;
	Mon, 29 May 2023 13:08:03 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cbP-00AXaX-01
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:08:01 +0000
X-QQ-mid: bizesmtp85t1685365665tgzca5zc
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 21:07:44 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: hvKw+PyJ8U6+uRVu/0AXG0i6+eBsNcwRbz2CZsT5niaVOLEjABKXMEbu2AisN
	uImWTWIWpl/bgpjuSuZqGv9sxOil3B8sj88KJEHleCbTRcmkdCIZoLB6KuLdqDUTW/bfNHC
	qcNmAe1dPOSnMPzWdJrTK1Ms82OBZOdRa1pz17Cotzmwgaz+8DZqQVeH3+/EUj/1QaNFLGz
	b2cbQLpbMgX9/StyBR2UmwLCa8hQ3pd50wYkdVem43lLqUAUknVygFLGVgwnoRvuXt9XlD+
	WyFHJ5lc3V/61Lo3BiaP/0HyPHI9bUnvaaUqXjUNVMv/vv4BLH2GeBCvf6tk9glgdi9gP0O
	rWlZSsaWPXG4mlGnUKp0F+MP099LijaKfcqzPbPVlQN2SixFKEGVRTrwrpVqUAPa09QjuW9
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13225124570130202105
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 6/7] tools/nolibc: arm: add missing my_syscall6
Date: Mon, 29 May 2023 21:07:42 +0800
Message-Id: <ba91771d72f9a9dc869513155240deab196e4fd7.1685362482.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685362482.git.falcon@tinylab.org>
References: <cover.1685362482.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_060759_337930_6953716A 
X-CRM114-Status: UNSURE (   7.27  )
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
Link: https://lore.kernel.org/linux-riscv/20230524182431.268908-1-falcon@tinylab.org/T/#t
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
