Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DDEC7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jggO5vLSOz/5cRaz3XpjkjjVkQjeBLj7OOpr943fTaA=; b=Xo/ZB0xl7hRa6x
	mGDajKntsGOJ2ypDJTid/UhRYsVV8TBHrQgLzmdon7WK7sOfuVYNDWprv5nQu2z4uzPZniw+TJU/j
	cwbnSWguGgQ77ZaKwZr2sDPJPp75ADIpCSR8rLLBXRbLdrI+AOTFSKAJnEYMkYopfbdRX23w0VXdG
	5Axu0MdNXuJ2b3jZsgg6elxN5O0CRFNLKhTvMbTIwdDmNi0PAO7Ls/e0NxkwRyL5o73l7pqzvzUA0
	mX02WctEIqu36W57JsSctQ2IboI8+sCBlfGSEDrz3Iah/X5LeJjpjhqMb8BTA1JzCX862uJGE1llS
	Fh8uOVhBI/E91+oPY0fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xDu-00DaDM-05;
	Tue, 30 May 2023 11:09:06 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xDq-00DaBM-1u
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 11:09:04 +0000
X-QQ-mid: bizesmtp80t1685444926t3zkui9c
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 19:08:45 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3gelAiWP5RoGbm4vjCvwZfJGtFNG1quZBYLTu71sj9RkgohxK606
	a+q+BffDHTGq7hGQggq49Yc7b00q60k9Z0+rpko1hv5Qylsrh5Ru5dO7bo9KIloRo5ONmwQ
	GxwAFUFc1x9e2wF81rgdmybkUrKQU2849rW+NYEvCIxyaTAiLxdNDZOpLSFnXpfxH1KVTqA
	kWZIjSdm5YfAh46ijTIDBYTyYWqbWGo7WiVpC7CQnofDv7czmI4JoOidGAbFsd3/zSmwz2M
	FtPx6NDMyIuosDDfYQm61GFTCo77Rlg8fJ/j2ZP4WDsV+0lFlJ8ptgtuyJp1957ue6tLVJi
	LhH20tTwUUWtfUWeW8whrClc1ayhenyHlIvd/B9P/KKnGSV0gae3vPZ63kNu3sDlcC/m0Qm
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1574217579638465516
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 4/4] selftests/nolibc: add user-space efault restore test case
Date: Tue, 30 May 2023 19:08:43 +0800
Message-Id: <69e9464e92fe8c60a421d6571a1139980103e8fd.1685443199.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685443199.git.falcon@tinylab.org>
References: <cover.1685443199.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_040902_926587_00A8732A 
X-CRM114-Status: GOOD (  10.20  )
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

while the libc supports sigaction/sigsetjmp/siglongjump, it is able to
restore next test after an invalid data pointer access, add such a test
case for these libcs, otherwise, skip it.

With glibc/musl:

    29 efault_handler ! 11 SIGSEGV                                   [OK]

With current nolibc:

    29 efault_handler                                               [SKIPPED]

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 9f9a09529a4f..6b4ebe4be4d6 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -248,6 +248,15 @@ static void register_trap_handler(void)
 	}
 }
 
+static int test_efault(void)
+{
+	char *addr = (void *)1;
+
+	*addr = 'a';
+
+	return -1;
+}
+
 #define has_user_space_efault() (1)
 #else
 #define record_test_context(idx, iteration, iterations) do { } while (0)
@@ -255,6 +264,7 @@ static void register_trap_handler(void)
 #define register_expect_trap(experr1, experr2) do { } while (0)
 #define register_trap_handler() do { } while (0)
 #define has_user_space_efault() (0)
+#define test_efault(addr) (-1)
 #endif
 
 static void putcharn(char c, size_t n)
@@ -690,6 +700,7 @@ int run_syscall(int min, int max)
 	struct stat stat_buf;
 	int euid0;
 	int proc;
+	int efault;
 	int test;
 	int tmp;
 	int ret = 0;
@@ -701,6 +712,9 @@ int run_syscall(int min, int max)
 	/* this will be used to skip certain tests that can't be run unprivileged */
 	euid0 = geteuid() == 0;
 
+	/* user-space efault handler support */
+	efault = has_user_space_efault();
+
 	for (test = min; test >= 0 && test <= max; test++) {
 		int llen = 0; /* line length */
 
@@ -737,6 +751,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(dup2_m1);           tmp = dup2(-1, 100); EXPECT_SYSER(1, tmp, -1, EBADF); if (tmp != -1) close(tmp); break;
 		CASE_TEST(dup3_0);            tmp = dup3(0, 100, 0);  EXPECT_SYSNE(1, tmp, -1); close(tmp); break;
 		CASE_TEST(dup3_m1);           tmp = dup3(-1, 100, 0); EXPECT_SYSER(1, tmp, -1, EBADF); if (tmp != -1) close(tmp); break;
+		CASE_TEST(efault_handler);    EXPECT_SYSER(efault, test_efault(), -1, EFAULT); break;
 		CASE_TEST(execve_root);       EXPECT_SYSER(1, execve("/", (char*[]){ [0] = "/", [1] = NULL }, NULL), -1, EACCES); break;
 		CASE_TEST(fork);              EXPECT_SYSZR(1, test_fork()); break;
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
