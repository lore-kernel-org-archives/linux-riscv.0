Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4463606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 09:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pRl6+G3w;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FoSORRnx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6HJTHnb4bE5tol6G6As2GV3ueHpE+ZMjXeTXcbP68s8=; b=pRl6+G3wcWNkWNIAKmNL4IDvcr
	fzgMIbVh1Uf2NP+MCU+ry5axfj7lvXjwiskf33XYXBAehLqmin8psc3z9OweHtXmJVMXLFYJeX1zy
	zBTHIhkWNxQtdk5atz6Y/vkht3cEyAkoVRLYhfStR7wkqCrexUfOoeasANa+ztaNlMT2jH4gz232F
	SjN3Tg3yrKY1cmBeW/MNmvqkVv1KU71vb2YxiD4weZJykWW90zXmvYOaf5TNmo9aKS2UP6iz1adeN
	vpwcTyvoa514oV6CCvT4u5PR48GMGVEyVtuajvoagq9nSsTbdJgGG8NNSm1hstoq7u6qGwn0RNdeL
	DWEJRMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzvo-00000006fDc-3qe1;
	Wed, 28 Oct 2026 09:26:52 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzvl-00000006fD1-3oA2
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 09:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uK
	XsUrFEY/XQ4vBtFLHNxUDClY4V1cw+HkUMZdP4ofE=; b=FoSORRnxHVl+EMxCQc
	+cGIFRjH6YpMJ4t9fZbEbJpr0by0QYrsgfpOxwNn6E/cmjFcXxfBIDMhgg19X1ov
	o913euIATEjhIODm2wj8dbJC4Esqsjrec876u5IUwx91dyMGPZmxu3PDawAhIpef
	imr3LUrtHO/SadNej14MGrmVo=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnz8mVv+Fqj7mdDQ--.50177S2;
	Wed, 28 Oct 2026 17:25:42 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: shuah@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] selftests: riscv: fix flag parsing and argv termination in vector tests
Date: Wed, 28 Oct 2026 17:25:08 +0800
Message-Id: <20261028092508.50223-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnz8mVv+Fqj7mdDQ--.50177S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4rGF4rZw4rXw47Xr15twb_yoWrKFyDpa
	yfKa4j9ryrKFWIqw47AF4UJF4Fka4fJrWDAr1fA34UZr48GrykWF97Ka17XFnrur4Fq3Zx
	Aw1qgry8u3W5JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjLvtUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0hYo02rhv5bftwAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_022650_387189_BBD954ED 
X-CRM114-Status: GOOD (  15.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

The xtheadvector support broke both the sending and the parsing side
of the vector-test argv flag protocol, in two independent ways.

First, on the sending side, launch_test() passes a NULL pointer in
argv[1] or argv[2] when the corresponding flag is unset.  A NULL argv
entry terminates the argument list, so when test_inherit is unset, the
xtheadvector flag in argv[2] never reaches the child and the child
always runs the standard V code path.  v_initval always launches its
child with test_inherit unset, so v_exec_initval_nolibc never
received the flag at all.

Second, on the parsing side, the nolibc receivers test the flags with
strcmp(argv[i], "x"), which is true when the argument is *not* "x",
so the branches were never taken even when both flags were passed.
The xtheadvector code path of v_exec_initval_nolibc was therefore
dead code, and in vstate_exec_nolibc test_inherit could never be set
(a plain "if (argc > 1)" did the job before the xtheadvector support
was added), so the inherit re-exec checks launched by vstate_prctl
were never exercised either.

Always pass both flag slots as non-NULL strings ("-" for false), test
the flags with !strcmp(..., "x"), and, when re-exec'ing for the
inherit check, clear the inherit request while preserving the
xtheadvector flag so the exec'd child still exercises the intended
instruction variant.  exec_argv in vstate_exec_nolibc is enlarged to
hold the terminating NULL.

Fixes: c384c5d4a2ae ("selftests: riscv: Support xtheadvector in vector tests")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 .../riscv/vector/v_exec_initval_nolibc.c         |  2 +-
 tools/testing/selftests/riscv/vector/v_helpers.c | 10 ++++++++--
 .../selftests/riscv/vector/vstate_exec_nolibc.c  | 16 ++++++++++++----
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
index 4dde05e45a04..91e31f185b85 100644
--- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
@@ -17,7 +17,7 @@ int main(int argc, char **argv)
 	char value = 0;
 	unsigned long vl;
 
-	if (argc > 2 && strcmp(argv[2], "x"))
+	if (argc > 2 && !strcmp(argv[2], "x"))
 		asm volatile (
 			// 0 | zimm[10:0] | rs1 | 1 1 1 | rd |1010111| vsetvli
 			// vsetvli	t4, x0, e8, m1, d1
diff --git a/tools/testing/selftests/riscv/vector/v_helpers.c b/tools/testing/selftests/riscv/vector/v_helpers.c
index de6da7c8d2f1..7eb157d4fc4b 100644
--- a/tools/testing/selftests/riscv/vector/v_helpers.c
+++ b/tools/testing/selftests/riscv/vector/v_helpers.c
@@ -61,9 +61,15 @@ int launch_test(char *next_program, int test_inherit, int xtheadvector)
 	}
 
 	if (!pid) {
+		/*
+		 * Always pass both flag slots as non-NULL strings ("-" for
+		 * false), otherwise a NULL argv[] entry terminates the
+		 * argument list and the following slots never reach the
+		 * child.
+		 */
 		exec_argv[0] = next_program;
-		exec_argv[1] = test_inherit != 0 ? "x" : NULL;
-		exec_argv[2] = xtheadvector != 0 ? "x" : NULL;
+		exec_argv[1] = test_inherit != 0 ? "x" : "-";
+		exec_argv[2] = xtheadvector != 0 ? "x" : "-";
 		exec_argv[3] = NULL;
 		exec_envp[0] = NULL;
 		/* launch the program again to check inherit */
diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
index 12f1b1b1c7aa..01ba5e5415b4 100644
--- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
@@ -8,12 +8,12 @@ int main(int argc, char **argv)
 {
 	int rc, pid, status, test_inherit = 0, xtheadvector = 0;
 	long ctrl, ctrl_c;
-	char *exec_argv[2], *exec_envp[2];
+	char *exec_argv[4], *exec_envp[2];
 
-	if (argc > 1 && strcmp(argv[1], "x"))
+	if (argc > 1 && !strcmp(argv[1], "x"))
 		test_inherit = 1;
 
-	if (argc > 2 && strcmp(argv[2], "x"))
+	if (argc > 2 && !strcmp(argv[2], "x"))
 		xtheadvector = 1;
 
 	ctrl = prctl(PR_RISCV_V_GET_CONTROL, 0, 0, 0, 0);
@@ -31,8 +31,16 @@ int main(int argc, char **argv)
 
 		/* child  */
 		if (!pid) {
+			/*
+			 * Re-exec without the inherit request (this stage
+			 * is done) while preserving the xtheadvector flag,
+			 * so the exec'd child still exercises the intended
+			 * instruction variant.
+			 */
 			exec_argv[0] = THIS_PROGRAM;
-			exec_argv[1] = NULL;
+			exec_argv[1] = "-";
+			exec_argv[2] = xtheadvector ? "x" : "-";
+			exec_argv[3] = NULL;
 			exec_envp[0] = NULL;
 			exec_envp[1] = NULL;
 			/* launch the program again to check inherit */
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
