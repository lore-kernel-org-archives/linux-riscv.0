Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065B9C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kbmuvu+6l8AmC8prYFjtybzr+1YAg2O5AuRDKqJ7X38=; b=rwSS1LNzlY8yZe
	EgKUCWLvt4wlmoOF/vUUsgrZSxUg7YO7P/yi3EKwdX9I+nWIYx9BsZaLF/fms75jntLhviDwFdhqo
	q0QOu1Ow3HwBBdYrsO2trVhzpwVeyPGHgqOXW7u1JaCYxOw+76+919871iy/BcIck1WvBfN8M8UCt
	VyucjeJLhUsdozAsUf2uAvpHuQQcM0lNNCestkAQ9DONKwt8mX9jHLE77LHc0bLUu5ITFtFPVDKhn
	qoVseU9yYZKsj/PqO1p1i2hHJEU4N6anS2J1K0/YH47UBp2HJBX5PS2bgmkAeHbomMUHQR//Lxii9
	hG8J4LnI3Jh1JSiDQZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3isC-00BYAZ-1c;
	Mon, 29 May 2023 19:49:44 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3isA-00BY9K-0A
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:49:43 +0000
X-QQ-mid: bizesmtp83t1685389766t53i55xa
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:49:25 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: XBN7tc9DADK11f2bR4vYw8XCXzz6JcjAHYV1K2y5nPxMJB79I1Jp2sCFv3dB8
	iWvFxzDt5ZBO3/bVujU2W+nt/UA864ldEDVdt2QSjJhlfLCFx8a+GtHntrNXKQIP1rHXDuc
	apqK12n9mJIs7Ij9lXeQ69kiq9c3lq2eE9vKtqcVqZll+r1w1FU/+MPq9h6w/YnYjl1dB6X
	KbnN+QNfllARfcvZLB5QUu3mmHuKconJm3cU4J7X+xK9SrGZu64fOOKkE+nelsfVLERS46t
	OnYVaL2SeEnHyq5nNSOCononupQNDSiDFCOk9LaAJZJ+McV6LQll49XPFN7EXqDrFPVxRLz
	l533bTcMwWSQq+ywKl8jP9ZmLqs2PGN6ArqxLYoPsl8Zfca2ltTFw5rTPTkcg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7469899247824790916
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 03/13] selftests/nolibc: waitpid_min: add waitid syscall support
Date: Tue, 30 May 2023 03:49:14 +0800
Message-Id: <cd9b9f1467f674f7d3f8a005ba54518aabf9481f.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_124942_391455_1127B6BF 
X-CRM114-Status: UNSURE (   8.64  )
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

waitpid() is based on sys_wait4().

When the first argument is INT_MIN, the wait4 syscall based sys_wait4()
return EFAULT by default, but the waitid syscall based sys_wait4()
return EINVAL in rv32 platform, let's support such case.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index bf63fc66e486..8ba8c2fc71a0 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -616,7 +616,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(unlink_root);       EXPECT_SYSER(1, unlink("/"), -1, EISDIR); break;
 		CASE_TEST(unlink_blah);       EXPECT_SYSER(1, unlink("/proc/self/blah"), -1, ENOENT); break;
 		CASE_TEST(wait_child);        EXPECT_SYSER(1, wait(&tmp), -1, ECHILD); break;
-		CASE_TEST(waitpid_min);       EXPECT_SYSER(1, waitpid(INT_MIN, &tmp, WNOHANG), -1, ESRCH); break;
+		CASE_TEST(waitpid_min);       EXPECT_SYSER2(1, waitpid(INT_MIN, &tmp, WNOHANG), -1, ESRCH, EINVAL); break;
 		CASE_TEST(waitpid_child);     EXPECT_SYSER(1, waitpid(getpid(), &tmp, WNOHANG), -1, ECHILD); break;
 		CASE_TEST(write_badf);        EXPECT_SYSER(1, write(-1, &tmp, 1), -1, EBADF); break;
 		CASE_TEST(write_zero);        EXPECT_SYSZR(1, write(1, &tmp, 0)); break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
