Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789E9C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWSqtRPdOag+fTkJORpzRZVgFrlbp+kKEmYm7q1de80=; b=RMbULiZw248GOI
	XwkTIXPZJp5sUKpju8zW57DtWNDpo1WT/+SDk3qkXpd2Jhxue6HXFIJhNp7KFqjG7gqC8R5v8Tjq1
	dLjlvLFFbHfP8Aq0SxURKIH3lJn9GZSHZX60MsJ24RXSRduCBellR7jUfwHoZwAbrMhKyVax0PKN5
	dBSXhl0dJ9kU4fem7iiSuQ1lM+JDaHKFi7pJIJpG+d1X7j9dxT6zlF4saN33YWQO4p9osiMrNUtkz
	EO0rQcCBHJ4Tx+1t0wn2FG1zLheP2B3BWiuiRStmsAL59Cna7NvqK7fpPQKS4EcIT824s4gcfj1AA
	ppdHMzhs+cxWi60D2rIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j1D-00BZoi-2Q;
	Mon, 29 May 2023 19:59:03 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j1B-00BZnJ-2q
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:59:03 +0000
X-QQ-mid: bizesmtp81t1685390329tl4a1sn8
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:58:48 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 9fp+MOMfZT2zNx5cI/90p1+iD3OFYm3s3YK5fd6MqPYblqw1OWNOqBS6mtmxO
	fMoOM+E+goEI3ecHYGOH/rDB2EhsgYIwM5UgrdO6NKUa0jQ0vC5le58Goq/yJpBxb+QpkiK
	f/vtUsnjRUKAVtIvhP3uG0qEaAOKEDu1l+HU9ziNNi/9Lfj7/wkOqNDUij2iR6gXCjDyZ4n
	9lTIoyirLK/p7BAhjuaT0ah2jVt+yKYWrTeA25q9PEpJK2mFtyrxEXUF6lqNnOmRL3N/K9i
	45+J3itzDAeYalzg1hO+DaTd+jvKUXN2yBI7B5sZqCUToA1X/NJbzbD662koEts8WroOj3X
	dtwBusqYja9KxUeXB3ViNXaNnE0ucLWqFCxKVsIIrih7kvbRw4=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5773408727969922355
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 10/13] tools/nolibc: sys_poll: add pure 64bit poll
Date: Tue, 30 May 2023 03:58:42 +0800
Message-Id: <f0956ce681eb8abc81c91e6b34174034d5b32c07.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_125902_216527_199E4596 
X-CRM114-Status: UNSURE (   7.91  )
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

It's time to provide 64bit time structs for all platforms, for y2038 is
near.

ppoll_time64 has been added from v4.20 and the last arch support is at
least from v5.0.0

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index db648b5b9a1c..ca802627e88f 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -940,14 +940,21 @@ int pivot_root(const char *new, const char *old)
 static __attribute__((unused))
 int sys_poll(struct pollfd *fds, int nfds, int timeout)
 {
-#if defined(__NR_ppoll)
+#if defined(__NR_ppoll) || defined(__NR_ppoll_time64)
+#ifdef __NR_ppoll_time64
+	const long nr_ppoll = __NR_ppoll_time64;
+#elif __SIZEOF_LONG__ == 8
+	const long nr_ppoll = __NR_ppoll;
+#else
+#error No __NR_ppoll_time64 defined, cannot implement time64 sys_poll()
+#endif
 	struct timespec t;
 
 	if (timeout >= 0) {
 		t.tv_sec  = timeout / 1000;
 		t.tv_nsec = (timeout % 1000) * 1000000;
 	}
-	return my_syscall5(__NR_ppoll, fds, nfds, (timeout >= 0) ? &t : NULL, NULL, 0);
+	return my_syscall5(nr_ppoll, fds, nfds, (timeout >= 0) ? &t : NULL, NULL, 0);
 #elif defined(__NR_poll)
 	return my_syscall3(__NR_poll, fds, nfds, timeout);
 #else
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
