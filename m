Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9217DC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWAGpDHSl+W7ZiaY5o9mcWtyMkusxQznl5Tz2jx/5Z0=; b=NTMlGsz9E4ceBX
	XNmePiRHw/FKfpFfczWcpt9t7fwd+mtN/qp6r3+E6iq7F5/5SJTxT6pziMjraWPdAPHsluSR47xma
	1rukwGmU1KFlbt8jo3ysPjrpZSCShV23rg6YF1EOpwBrw+ePsp0yxEYKr8Wg15nx7GAEjQX9YLgmk
	1UgeLsiQxPSvPNwIuN45Cw8tNCZtGXQFloFZrWVrbvOTwtE2ZWIyIeSedHc1wExbEMhjtx6qgdjUl
	fKeRFHdRU3nAraQHDGkQBZxY7a2PYM9uXBHkii1Qse01KQwIBpJ+uYHK5U7DZ2seHZdi9qc060dHI
	+eNW5rFzf4B4ddeL1FYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j4Q-00BaXi-0w;
	Mon, 29 May 2023 20:02:22 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j4N-00BaW6-13
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 20:02:20 +0000
X-QQ-mid: bizesmtp82t1685390525tz5qfwin
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 04:02:04 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: znfcQSa1hKbqS/wmQkhqLdwrSmiDHvyr6TKGy5erBP95lAX2a5SNTQj/PK8Ly
	8Q83734ok7p3uV3bvpoEUwgs/ETtKRKuQB1PRX5jqAcr3G2iCef+kteIP98SFtKkceBncv+
	MU25NzwaU1R+nbXctsMuEFHS4GBXB9qUQ0DCeQXoztp3RNnsWwxo8HnSRzot7jR2VfW2qdn
	29yKvC/LFYAoenIfSYWVRR4hZ8lMsHjfDJ9j4zsH/TH/t6nPtK+9vP1YoxnWxDgYLfCbZ4c
	mg5+yl3HmrTNLLQb+iT5TFdh2GXi5osb3dyKJfwwtXfTWtDSt5YeDV3rGF3HkCOdyhQFJ6J
	6+l86v9uzLe/q46AZmM1/ZbROiYVJMj7zfWr2h1gTU8UOyK/JX+o2QuEH055w==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4662585006422710528
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 12/13] tools/nolibc: sys_wait4: add waitid syscall support
Date: Tue, 30 May 2023 04:01:13 +0800
Message-Id: <ad9654c0d65a978b5757d8c5697edbc89d4937e3.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_130219_671392_6FC1D91C 
X-CRM114-Status: GOOD (  10.98  )
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

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 533233094733..a32b90b1fd3b 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -12,6 +12,7 @@
 
 /* system includes */
 #include <asm/unistd.h>
+#include <asm/siginfo.h> /* for siginfo_t */
 #include <asm/signal.h>  /* for SIGCHLD */
 #include <asm/ioctls.h>
 #include <asm/mman.h>
@@ -1373,7 +1374,56 @@ int unlink(const char *path)
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
+			*status = WCOREFLAG | infop.si_status;
+			break;
+		case CLD_KILLED:
+			*status = infop.si_status;
+			break;
+		case CLD_TRAPPED:
+		case CLD_STOPPED:
+			*status = W_STOPCODE(infop.si_status);
+			break;
+		case CLD_CONTINUED:
+			*status = W_CONTINUED;
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
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
