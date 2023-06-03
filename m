Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C010C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a45nj+WqX727X1hdNxtXNjbiPZ57ZdQgKivggS/ees0=; b=5D/QyYrIJlvzmr
	ZIfNHKfNpqu105l8Av4nXp272cddiRu9Pufq9PaqtmRLiRi0SJX4U2lv7AQEEqNUY2hDWsHQ9kqNB
	evsQUIBrDNzXtcUzdQYqiTvi3XyaX8qrk4UqZPPGx9SLO+GSvmEwjlJ3IqWcgouCkEYA9sCJXYhqB
	qXy19KMgZA6Hfdpf4K2ElAB+gVy73oWRxfviw0PmjQ3piigJEvM3G8RF4iW5WZ68alPhup9gou0rE
	f+K3SoF/W6klIa+JoZxFvHtMGWV/91Aa9UQB41CzjK0T+Mtu0TGp4UQ+VuAc1Ttpung7mIuFnWU2Z
	zgMqJdqzl3eN460nMgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MPr-0094g1-2F;
	Sat, 03 Jun 2023 08:15:16 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MPo-0094eO-1z
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:15:14 +0000
X-QQ-mid: bizesmtp86t1685780099tqgbsuv9
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:14:58 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: r/cTxDoDoiFSJcynUBZ645fSSLznEC5jgi3uRP7p6xwjwJ8yn76kBQYvv1+GG
	iSipIpMWgeICdSXmOhHNqLO/hOb9a5g5856OSS72uk43s6aREo8TPK0o30mBeug9pyUBLrA
	ZiLJ8k7sA6+0MXELj+RZn+XGSSA3Q/ntnx/vUhzeGoY2kBexAX2DklILwcrBfrSx9afdubX
	497b/Fry/Cf0DfK9l+fgBCU+RlJuaZonwfKrkQFZ1LqdSm2vkoorwENzGUUoJWn62agPV3l
	x6N4lgt6iYLXz2z/uvnNqE1SuEJs29gQz+108F2wiJv9flrYxecsaTZHFgzU5qNIgNKyV55
	67KtRV6ZoEdOMjWid/N6HLbKZ6RVvaA0n+W19QwOz6ykH3goDRIarP5h2O/snuiSaYfMmm+
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8443338395293632196
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 10/12] selftests/nolibc: remove gettimeofday_bad1/2 completely
Date: Sat,  3 Jun 2023 16:14:55 +0800
Message-Id: <a94f1adb851938da7693e8eed0927cbe01a74d56.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_011512_960439_50826968 
X-CRM114-Status: UNSURE (   7.93  )
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

Suggested-by: Willy Tarreau <w@1wt.eu>
Link: https://lore.kernel.org/linux-riscv/20230528113325.GJ1956@1wt.eu/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index a1c402ce32f4..bf63fc66e486 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -588,10 +588,6 @@ int run_syscall(int min, int max)
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
