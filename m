Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155C3C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFd0LGNlNMS9cIS+LhXK7yrVo4PvmKRwTSY350l/dEw=; b=hxHSHQlGNrvI7z
	F1V9yT9AK2G5/zs5/4kN+nGeVhJRonZIzOoUfjPfXqFYylE6AeF6Pg/o2TT7FDvDEm6OOZcgVA+SN
	AFyuc9hrCd6Ih69j3OgqIYFpWEzbkmH5Acv81uDIx8FytgXIKnQohE3rYLCqaK95sG6+XgJCeSZ9W
	Qm4QjmDjMqToAN3r43XYvyN04BfgiVopNRz+Zp1HjaDgi6NAKB/SWdLj6SRa9HWCXrgHDH0ZtEJZF
	SMhY8LZeKogvQeJfcwWzZs+Sf9DvYD39t2F9L5wv9zXfEJklYFSOjySvNr/kJe+91Xly8QU36POaf
	TK4iU4UmkKgXjTv//qSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ipf-00BXkZ-01;
	Mon, 29 May 2023 19:47:07 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ipc-00BXjD-1L
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:47:05 +0000
X-QQ-mid: bizesmtp79t1685389607t80smhoc
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:46:46 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: q+EIYT+FhZqztxguIVnnRhTx7mjT8KL3kpkNC9vlw/RJOJQunBpKKt3coh9nS
	b3hqugotci/+9LQaEWn5aWBw66TFgblIOoUHGzmoydkxp1VYBK3Jk0ftC+E+SfP8adRPKNC
	UOsplQSyz0Noa7ioorK0D4V2iSL+p0qOOTecBgsQGIF03PxcS8Wg384BzjdHIzbWaJY6A9P
	goVQyM/uk01ucMbDc8gymFRq/Br7+KWgXOlJbnQnNhcW26+kodAetsOUhrxkRr7H4ylwCrw
	UZsspZLj5FqA/WiT3kx2fAwpok1NcIOqmfOaxha6aU4OOvFLZ3nLptqkzd5wdCMDmGDCCMx
	o54rHau5cEQE7opKNJnlEEdyJKve++VllBqRR/ep/KB8//hCOyKMbqg+HwrLQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 274745737586768442
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 01/13] selftests/nolibc: remove gettimeofday_bad1/2 completely
Date: Tue, 30 May 2023 03:46:42 +0800
Message-Id: <485fe4e27c1fd1a84d11e9fc47178a48de39263b.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_124704_755524_4120FF53 
X-CRM114-Status: UNSURE (   8.44  )
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

In the clock_gettime / clock_gettime64 syscalls based gettimeofday(),
there is no way to let kernel space 'fixup' the invalid data pointer of
'struct timeval' and 'struct timezone' for us for we need to read
timespec from kernel space and then convert to timeval in user-space
ourselves and also we need to simply ignore and reset timezone in
user-space.

Without this removal, the invalid (void *)1 address will trigger a
sigsegv (signum = 11) signal and stop the whole test.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index a8fcad801cf2..7be2625f952d 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -582,10 +582,6 @@ int run_syscall(int min, int max)
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
 		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
 		CASE_TEST(gettimeofday_null); EXPECT_SYSZR(1, gettimeofday(NULL, NULL)); break;
-#ifdef NOLIBC
-		CASE_TEST(gettimeofday_bad1); EXPECT_SYSER(1, gettimeofday((void *)1, NULL), -1, EFAULT); break;
-		CASE_TEST(gettimeofday_bad2); EXPECT_SYSER(1, gettimeofday(NULL, (void *)1), -1, EFAULT); break;
-#endif
 		CASE_TEST(getpagesize);       EXPECT_SYSZR(1, test_getpagesize()); break;
 		CASE_TEST(ioctl_tiocinq);     EXPECT_SYSZR(1, ioctl(0, TIOCINQ, &tmp)); break;
 		CASE_TEST(ioctl_tiocinq);     EXPECT_SYSZR(1, ioctl(0, TIOCINQ, &tmp)); break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
