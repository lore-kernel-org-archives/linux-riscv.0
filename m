Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42E6C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAsfT53uksu328LAhgkwoLp92Zs92fiStbdO/3oAa3w=; b=iRnueYS8bHTmPw
	beXtEcdmBdH8FTxRhH6wGFpw8CqltR7HwHsF0GNme4Ku7CzXn2nafULF/RH/ap3hrMfhxbA9hnNu3
	syJ1RldR18jov+QIlyjRvFG3xuwk0oj49BNh+h/eiK9Yi7SV8+X5kdIASwQpY+nynS4OSbctEi5tK
	hn1h8lWVFOk0OtG6Xw93mxVyLz5m3IslcsheCf8mOvKUEaZ0cLkp1pBV+n/ZPsP2eH5H9GAAWQb/7
	DkzPMjuyzEKCPC4FZ9H2Lu596A0Kjize/mO4g7Fbe7wqwH0UkwyoEz5TUVU4Zhhx0o9XIczaiM5A4
	RQqVMACJ5gPbSsYnn/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1som-00EJG2-1s;
	Wed, 24 May 2023 18:02:36 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1soj-00EJES-1F
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 18:02:35 +0000
X-QQ-mid: bizesmtp77t1684951344tml8b7ly
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 02:02:21 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: Xz3VOcA7Mr0KaqdkQOpzZ+GPBYPXJApKLC+NLroSL35n8g1DvXnk4MI0nnhSq
	eCA8abIJEj5/MMX0E0nOiq1r3tRW1Dzuj8kKIhMISCxuR2R+vSH+y9iUTtbM2YLkEZQFbl4
	Gwj6XvvvAj46eYzyPG97x4/H3sFl0piFoY4Qhzz2TCtETlBg073vgdEKgIponO7WU5ihXTG
	7USD/hZHC2KRfmWeEOarJtk8QF/O+zSJAue55HVToyJnWjy0g89EeUu6x7BvEne9Q56B8z+
	H1qfJhUBHAXsIGNQEAnBLXLdMPINADkwqTscOIIy4rgBZdHW6p9iKZ9pgDu/AIDCanwCLue
	Hp87XNtP5SGMjLlCeXCoFJZ6Z7QZPlB5zQMCyidc1VKdP9xYKKKx3ND7Gh9AA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6618908142304380197
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 12/13] tools/nolibc: sys_wait4: riscv: use __NR_waitid for rv32
Date: Thu, 25 May 2023 02:02:17 +0800
Message-Id: <7a55e771c3cacf2e5b1a4750efac747289dbc54b.1684949268.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_110233_732987_F86979EB 
X-CRM114-Status: GOOD (  15.00  )
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
__NR_wait4 after kernel commit d4c08b9776b3 ("riscv: Use latest system
call ABI"), use __NR_waitid instead.

This code is based on sysdeps/unix/sysv/linux/wait4.c of glibc.

Notes: The kernel wait4 syscall has the 'pid == INT_MIN' path and
returns -ESRCH, but the kernel waitid syscall has no such path, to let
this __NR_waitid based sys_wait4 has the same return value and pass the
'waitpid_min' test, we emulate such path in our new nolibc __NR_waitid
branch.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h   | 54 ++++++++++++++++++++++++++++++++++++
 tools/include/nolibc/types.h | 15 +++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 00c7197dcd50..2642b380c6aa 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -12,6 +12,7 @@
 
 /* system includes */
 #include <asm/unistd.h>
+#include <asm/siginfo.h> /* for siginfo_t */
 #include <asm/signal.h>  /* for SIGCHLD */
 #include <asm/ioctls.h>
 #include <asm/mman.h>
@@ -1333,7 +1334,60 @@ int unlink(const char *path)
 static __attribute__((unused))
 pid_t sys_wait4(pid_t pid, int *status, int options, struct rusage *rusage)
 {
+#ifdef __NR_wait4
 	return my_syscall4(__NR_wait4, pid, status, options, rusage);
+#elif defined(__NR_waitid)
+	siginfo_t infop;
+	int idtype = P_PID;
+	int ret;
+
+	/* emulate the 'pid == INT_MIN' path of wait4 */
+	if (pid == INT_MIN)
+		return -ESRCH;
+
+	if (pid < -1) {
+		idtype = P_PGID;
+		pid *= -1;
+	} else if (pid == -1) {
+		idtype = P_ALL;
+	} else if (pid == 0) {
+		idtype = P_PGID;
+	}
+
+	options |= WEXITED;
+
+	ret = my_syscall5(__NR_waitid, idtype, pid, &infop, options, rusage);
+	if (ret < 0)
+		return ret;
+
+	if (status) {
+		switch (infop.si_code) {
+		case CLD_EXITED:
+			*status = W_EXITCODE(infop.si_status, 0);
+			break;
+		case CLD_DUMPED:
+			*status = __WCOREFLAG | infop.si_status;
+			break;
+		case CLD_KILLED:
+			*status = infop.si_status;
+			break;
+		case CLD_TRAPPED:
+		case CLD_STOPPED:
+			*status = W_STOPCODE(infop.si_status);
+			break;
+		case CLD_CONTINUED:
+			*status = __W_CONTINUED;
+			break;
+		default:
+			*status = 0;
+			break;
+		}
+	}
+
+	return infop.si_pid;
+#else
+#error Neither __NR_wait4 nor __NR_waitid defined, cannot implement sys_wait4()
+#endif
 }
 
 static __attribute__((unused))
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index ee914391439c..c4f95c267607 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -92,8 +92,21 @@
 #define WTERMSIG(status)    ((status) & 0x7f)
 #define WIFSIGNALED(status) ((status) - 1 < 0xff)
 
-/* waitpid() flags */
+/* waitpid() and waitid() flags */
 #define WNOHANG      1
+#define WEXITED      0x00000004
+
+/* first argument for waitid() */
+#define P_ALL        0
+#define P_PID        1
+#define P_PGID       2
+#define P_PIDFD      3
+
+/* Macros used on waitid's status setting */
+#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
+#define W_STOPCODE(sig)      ((sig) << 8 | 0x7f)
+#define __W_CONTINUED        0xffff
+#define __WCOREFLAG          0x80
 
 /* standard exit() codes */
 #define EXIT_SUCCESS 0
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
