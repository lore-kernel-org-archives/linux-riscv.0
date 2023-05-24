Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123C1C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxJBpkh6AAdA9Pko4SUbtyvTAYeGQ24tnqPaI64pG3Q=; b=qh/WXdP+1ticlc
	1BnJW37J/VCyfAzKRdmeLk+X1H1hW1N+ZKyauevu7R3YONoEl+FaKg+R/57h0TdwwLdT5N59NPk5o
	la4H1Mxj1wgSnSPzzj8PLb4V3N02D4zlU1lemvewiVzwZFWXrXvdF92XsBHneh5qwjvw3wIflyeQj
	AudhLwG6Xub0ulT0Dj2JBAdnuo1VoPY7hyE/BFcBXnLAMrlYIavqhMq6DxqH8naIG+2HqR1xB9F20
	PGJ3DyBdpqLyDVSFer57psiVfIcjHWVxG7to9kteDRHWWfmYimwmMt4zanSu3RGmAXdpQQWF/6LfI
	+6pGXOvdZt70B0O9vv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1snZ-00EIyA-1P;
	Wed, 24 May 2023 18:01:21 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1snX-00EIwr-0A
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 18:01:20 +0000
X-QQ-mid: bizesmtp75t1684951269t67ndppu
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 02:01:08 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000B00A0000000
X-QQ-FEAT: hoArX50alxHX1mYOrihcB1iZGA+cMKRF18+VTtXY99N55mVqxxcNdy0jsu7Jz
	AcFGpT9by4v33/v8k6d71SGSNut3w5M1Y55V4QKFnuqDFz4e83jelIWCnwnh7ZZM/sT3E7F
	z6uTpi+OMP1Z7jyvBEXLGAs4F6CizZ4L8XY7TfsyP2p/AFUjdFPl7T1OArgl97XQgJkh/6Y
	UFvN8POwUkaWKQhBkorPnFG0okEi1/pIjfr9VCs/vFUjAG/lqDuM5K9BE9462Br2voypj0+
	KqU2y/d9dGgUBYc8VJyjXbBM9c6PjzUS1OidPVawQduEJIza/o8yXXFRHqHoIzmrt3APMEb
	gsgqua+2O/NyW4ZeCqKXTDW6FjzPqNY0tBIaYOff9EXpYK8gO+mip2Uh9tHJw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4020491424755662603
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 11/13] tools/nolibc: sys_select: riscv: use __NR_pselect6_time64 for rv32
Date: Thu, 25 May 2023 01:59:55 +0800
Message-Id: <9359ab11b52ef7c1799337f475e1e27c0cb00e3b.1684949268.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_110119_399125_4515D004 
X-CRM114-Status: UNSURE (   6.89  )
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

rv32 uses the generic include/uapi/asm-generic/unistd.h and it has no
__NR_pselect6 after kernel commit d4c08b9776b3 ("riscv: Use latest
system call ABI"), use __NR_pselect6_time64 instead.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index c0335a84f880..00c7197dcd50 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -1041,8 +1041,13 @@ int sys_select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeva
 		struct timeval *t;
 	} arg = { .n = nfds, .r = rfds, .w = wfds, .e = efds, .t = timeout };
 	return my_syscall1(__NR_select, &arg);
-#elif defined(__ARCH_WANT_SYS_PSELECT6) && defined(__NR_pselect6)
+#elif defined(__ARCH_WANT_SYS_PSELECT6) && (defined(__NR_pselect6) || defined(__NR_pselect6_time64))
+#ifdef __NR_pselect6
 	struct timespec t;
+#else
+	struct timespec64 t;
+#define __NR_pselect6 __NR_pselect6_time64
+#endif
 
 	if (timeout) {
 		t.tv_sec  = timeout->tv_sec;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
