Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19F2C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 06:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0ffc+h58r/epXT315dch4QSh2SoVrh5FBk11X8KKMU=; b=0x5biF0qCaNjz8
	2JJErdy8uW8LdPYmNR57Y1HRc5RQ65ILO6HSQthXo+iSm6JjG5hBx2vAizcmvnKPREmHpdySQ9CNv
	mFvDeMoVLjo1c3OJkwO7yyPV9JaTVA0xu4YB5NMMjW/z/+d5KKdbmj/Bw5COoF+uPkxJesLmw9QaJ
	9mJpS017zi1IGpHab4IAeZeV/XfeGWBq/zkebo6L+wHtKdpfEVXxWgsX4S3IvPN7lqWGmshHEdOds
	FtnDianRi+PLizW80dTVgCNOw//xEZwx03CpcsP4n2PmSOOknUszgumPvyupW/yIEPNWcss3oftv/
	iUtKuS1sw/B6MB3biKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3szk-00Caij-0d;
	Tue, 30 May 2023 06:38:12 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3szh-00CahW-0s
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 06:38:10 +0000
X-QQ-mid: bizesmtp79t1685428676txj83914
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 14:37:55 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: jXjag1m6xl6889Jpgjswy33PSiv3wgSWqoIFui+aUZWHp4mxjk63aUjgGRhFQ
	LMNAUVD9PsUqGVCwHm0hlN5+3sRmrdAVW2PozVMKCw9Db26XQE0Rh65aO20dBDmZGj3g4xj
	i0rY9p/BqHACni0/Ku/45kqRCIc8paxw41FdN7fY/4035HCnWNSJbxMVMhFOplBnbmzw8Uj
	7H8k4Zi9eFlRPn45MvIkFwKtCXWWYCjKOBYpCJo6sBYqsqhYKgEE3ZMUhvXrDB4qltlfFcI
	eEYwBS++g4usHpxxiA4zwoqVlVzpjQpulO0AMmg4eRMb0Xyg9adG8t6O6FU1yxpRCC7RwvM
	WdoOxhFh2t5cqot1k+y9uv06H+ORfS64hQ0rQdFKcCI0nsoYxqCit5lHLyUIzyiFRTz6La0
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15317070203822882915
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 1/2] selftests/nolibc: add new gettimeofday test cases
Date: Tue, 30 May 2023 14:37:49 +0800
Message-Id: <bfc3dba52300dcce03ae1c7c41f2bb8984cf459b.1685428087.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685428087.git.falcon@tinylab.org>
References: <cover.1685428087.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_233809_616143_297C1DC1 
X-CRM114-Status: UNSURE (   8.74  )
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

These 3 test cases are added to cover the normal using scenes of
gettimeofday().

They have been used to trigger and fix up such issue:

    nolibc-test.c:(.text.gettimeofday+0x54): undefined reference to `__aeabi_ldivmod'

This issue happens while there is no "unsigned int" conversion in the
new clock_gettime / clock_gettime64 syscall path of gettimeofday():

    tv->tv_usec = ts.tv_nsec / 1000;

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 8ba8c2fc71a0..20d184da9a2b 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -533,6 +533,8 @@ static int test_stat_timestamps(void)
  */
 int run_syscall(int min, int max)
 {
+	struct timeval tv;
+	struct timezone tz;
 	struct stat stat_buf;
 	int euid0;
 	int proc;
@@ -588,6 +590,9 @@ int run_syscall(int min, int max)
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
 		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
 		CASE_TEST(gettimeofday_null); EXPECT_SYSZR(1, gettimeofday(NULL, NULL)); break;
+		CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
+		CASE_TEST(gettimeofday_tz);   EXPECT_SYSZR(1, gettimeofday(NULL, &tz)); break;
+		CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;
 		CASE_TEST(getpagesize);       EXPECT_SYSZR(1, test_getpagesize()); break;
 		CASE_TEST(ioctl_tiocinq);     EXPECT_SYSZR(1, ioctl(0, TIOCINQ, &tmp)); break;
 		CASE_TEST(ioctl_tiocinq);     EXPECT_SYSZR(1, ioctl(0, TIOCINQ, &tmp)); break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
