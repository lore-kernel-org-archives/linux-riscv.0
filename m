Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B4BC44529
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 06:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h0jaPI0qhtIuo1ta5rin/ZabQKx1zIcVASWSHwdZQb8=; b=Q+hZggCBVbL4vf
	8/gq3UNdn7n8JslaZmcuht+hdGIQ7BShMKMtVWgcjXosoOB5MDPp+/+3+lInNG3f5QANOwcHyNjXO
	8oDQfZqlU1+nSA3GD2mwBq5rRVxjjHMtR7SHxpcRSZCdch2o522FI/+d1K+v1XUg46ywvFXd6W3ND
	zCdvZdeXYNUMmY5wI543y04FS+xhLiWIwKEfh9WeD5ImsFOvCwzEw5I/SGaEpCv7oJHVBrgNyPV/l
	9wOAO9DySCZ1uTwkk4M6F9tFB+L+dsZ2CjDJ72zsRZH7GdIqcxQGaN654WazCwkwk85rsxgd3M9MV
	ldKvMcXJpFv9QGD0bZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4MR-00000008Zn9-1uzu;
	Tue, 21 Jul 2026 06:53:51 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4MM-00000008ZlN-3ybt
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 06:53:50 +0000
X-QQ-mid: zesmtpsz3t1784616767tdb85f6bb
X-QQ-Originating-IP: FqT+hiZzrnvEJqbi649Nsx09lp6sgDi8KrH4xx+iZTc=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 14:52:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14538980576659529980
EX-QQ-RecipientCnt: 11
From: JinRui <jinrui@haiwei.tech>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jinrui <jinrui@haiwei.tech>
Subject: [PATCH] riscv: selftests: Fix pointer masking test failures on real hardware
Date: Tue, 21 Jul 2026 06:52:42 +0000
Message-ID: <04B199F7DC302BCA+20260721065242.233233-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MvTYY3mRrFJN89mwuae/b4NAkeTLUerpAMtM4x2ipcycJmZYuwFtBZN9
	xGhCFfBJSpfT9xgYSxRiBf/QcR2TjT/7g/Ls4Ptx0PB3ZZM979GkiNATB99FnjZ8t84OsZ8
	MlJuXmuL9Wsa7HbCspjQ99UYvqubkrzrNaCvQE6vMDirfsFGjBCFIFOMjbndYzi7HbpUvw1
	hRxN3pVZ58KRLIZVHwdzGjE9J6mxnN19wS1cPh8bsUIWeB7jtno8ZCsSvC25XGYCk1O7wbQ
	fs+1EWQ2L27JQmJbcm6sA+rAJ/m2KkrvzwwrSP+VIIl64maNedHgyKsaX4C1zXBpwYwiXn9
	CVUbyNY0jsQX2fovRn3mQTRXkzCMbBSLBiBWlU5UN3n27g+YSnKQ+eIhuPMMnxWmfMEz9nd
	CS3IHkMJrE2aca+j+/3Gv/d2GZoHsHJnWiQtemLS9p+gva69ZOSFIqikuuh+1AdLVM8cy9V
	iv37Yo9pfTr8XhmcUXISPFCNZo+SanH2yJ7MmBYYiwPqhT1YmoVMJzq5Ua7d0koLgWHqyhJ
	J4s6+osXoHGRMdien/ZT2V2D8xi4Kz2FYzXKQkQbtSD+82FRAfAsmpc9QxgA7CLwU0XwZen
	xvuVK7YALJNP+6NIF1ttO01aPQYF81eWum97Uq4jkdDtEZOui1Gtky57j3bdSFXCk5SGg6F
	CxCCKZv9RfznuGks+W7uBiNO+/eBSUc6W09hq4mDLW0+xtx2JxFT8xUl3KiUUSrNvT4C230
	MncRnUe6PNBR5sY+3wqDKTIMbhmHdSymx52tdMSVVKUfT0JCmPlQHLOIzJX47HWbUzzrTIk
	ro+uoBIrk/tFTG2QMM9GaQA2CXOjOP17nJ/fcrvi9m6QvrRARaMwzk5ctbWR567bi7HbeSM
	SOgiqwi0mMD/J4arJN63C3ffTBNiLD2jHv/D1edPyhiRMQxM5KXLhwaoqxfshmKHxXae2JZ
	vCvrAXEnEEVuK1yVjdFGGN0mTDIkHZ7tjSI5d8AZsU2v+ZSZzNgzurOPE7rWd16I9z8ubJP
	YY221Jj1nbNMcudVJZnpVd4uQSfi9wwwRcbbNPCw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235347_460660_D50A33C3 
X-CRM114-Status: GOOD (  16.77  )
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

From: jinrui <jinrui@haiwei.tech>

The pointer masking selftest contains several bugs that cause it to fail
on real RISC-V hardware:

1. test_pmlen() did not pass PR_TAGGED_ADDR_ENABLE when requesting a
   non-zero PMLEN. The kernel requires this flag; without it, PMLEN is
   forced to 0 regardless of the requested value (see process.c:352).

2. set_tagged_addr_ctrl() required the PR_GET return value to exactly
   match the PR_SET argument. However, the kernel may legitimately:
   - Force PMLEN to 0 when the ABI is disabled (tagged_addr_abi=false)
   - Round up PMLEN (e.g., request=1 -> PMLEN=7 or PMLEN=16)

3. test_dereference_pmlen() always passed tagged_addr_abi=false, even
   for non-zero PMLEN values. This meant PMLEN was never actually
   enabled, so the valid tag dereference test always triggered SIGSEGV.

4. test_fork_exec() passed tagged_addr_abi=false, causing the fork
   child's tagged pointer dereference to fail because the inherited
   PMLEN was 0.

Additionally, add an explicit #include <stdint.h> for uintptr_t, which
is required by the C standard and must be included explicitly on some
compiler/libc combinations.

Fixes: 7470b5afd150 ("riscv: selftests: Add a pointer masking test")
Signed-off-by: jinrui <jinrui@haiwei.tech>
---
 .../selftests/riscv/abi/pointer_masking.c     | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/riscv/abi/pointer_masking.c b/tools/testing/selftests/riscv/abi/pointer_masking.c
index 2d540af7b558..106f12f1ea44 100644
--- a/tools/testing/selftests/riscv/abi/pointer_masking.c
+++ b/tools/testing/selftests/riscv/abi/pointer_masking.c
@@ -5,6 +5,7 @@
 #include <setjmp.h>
 #include <signal.h>
 #include <stdbool.h>
+#include <stdint.h>
 #include <sys/prctl.h>
 #include <sys/wait.h>
 #include <unistd.h>
@@ -17,6 +18,9 @@
 #ifndef PR_PMLEN_MASK
 #define PR_PMLEN_MASK			(0x7fUL << PR_PMLEN_SHIFT)
 #endif
+#ifndef PR_TAGGED_ADDR_ENABLE
+#define PR_TAGGED_ADDR_ENABLE		1
+#endif
 
 static int dev_zero;
 
@@ -44,7 +48,10 @@ static void test_pmlen(void)
 	for (int request = 0; request <= 16; request++) {
 		int pmlen, ret;
 
-		ret = prctl(PR_SET_TAGGED_ADDR_CTRL, request << PR_PMLEN_SHIFT, 0, 0, 0);
+		ret = prctl(PR_SET_TAGGED_ADDR_CTRL,
+			    request << PR_PMLEN_SHIFT |
+			    (request ? PR_TAGGED_ADDR_ENABLE : 0),
+			    0, 0, 0);
 		if (ret)
 			goto pr_set_error;
 
@@ -85,6 +92,22 @@ static int set_tagged_addr_ctrl(int pmlen, bool tagged_addr_abi)
 		ret = prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0);
 		if (ret == arg)
 			return 0;
+
+		/*
+		 * When tagged_addr_abi is false, the kernel forces PMLEN
+		 * to 0 regardless of what was requested. Accept the result
+		 * as long as PR_TAGGED_ADDR_ENABLE is not set.
+		 */
+		if (!tagged_addr_abi && !(ret & PR_TAGGED_ADDR_ENABLE))
+			return 0;
+
+		/*
+		 * When tagged_addr_abi is true, the kernel may round up
+		 * the PMLEN (e.g. request=1 -> PMLEN=7 or PMLEN=16).
+		 * Accept the result if the enable bit is set.
+		 */
+		if (tagged_addr_abi && (ret & PR_TAGGED_ADDR_ENABLE))
+			return 0;
 	}
 
 	return ret < 0 ? -errno : -ENODATA;
@@ -96,7 +119,12 @@ static void test_dereference_pmlen(int pmlen)
 	volatile int *p;
 	int ret;
 
-	ret = set_tagged_addr_ctrl(pmlen, false);
+	/*
+	 * When pmlen is 0, the tagged address ABI cannot be enabled (the
+	 * kernel rejects PR_TAGGED_ADDR_ENABLE when PMLEN is 0). Disable
+	 * pointer masking and test the invalid tag path instead.
+	 */
+	ret = set_tagged_addr_ctrl(pmlen, pmlen ? true : false);
 	if (ret)
 		return ksft_test_result_error("PMLEN=%d setup (%d)\n", pmlen, ret);
 
@@ -157,7 +185,7 @@ static void test_fork_exec(void)
 
 	ksft_print_msg("Testing fork/exec behavior\n");
 
-	ret = set_tagged_addr_ctrl(min_pmlen, false);
+	ret = set_tagged_addr_ctrl(min_pmlen, true);
 	if (ret)
 		return ksft_test_result_error("setup (%d)\n", ret);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
