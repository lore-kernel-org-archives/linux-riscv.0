Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B832EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tp+/hYJEDMEF87TtUAvJap6KxpQkLoCOqVAv7fUB9gY=; b=GiZen1vZr00oiW
	VmQlbLqqO7GV3pkoNzQ+7wcj/BrEgHfv13j4tim2EDnIdHJI2j4C6/jDi/kx453Pzoxa7K3k8H65t
	DYQc/u1Ol4p4hV68zvnWLlQH6KbXZO17X/cqAXnfhhbIV+CZpqO+hXLQBxpOTGNdH/sf+SI/wYqqu
	2IMNAnRNmdr1xtiOKuIbO9LGc+iN2IaMglW0rk/+46QEXMYgnVbdgA25UGY6rEh9KMdp2+YEyXbHm
	sNA/P54QSkxBThFitRM2d/01krfqROG9Mzoi9zBgym3RfAc/2+2MTcAFZb5PEPM4h08BPiUPX2vGU
	dUU1bZf8Bo+MvVxLsZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmsi-004wVf-1p;
	Fri, 07 Jul 2023 14:56:24 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmsf-004wUF-11
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 14:56:23 +0000
X-QQ-mid: bizesmtp90t1688741756t4957kso
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 22:55:54 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: ILHsT53NKPgT3vYb7mSqef6qq6ijJFi5yZN+5IyXvKcCNY/FIjIcEWS0O5O+d
	2NGhVscVoSruYGQXUG1TyM4Xedj+I/qg+7nL+jSkOz5tn0vd+07XiMUqFJslNu8QBkHhpUT
	0MtEI2n1qoAZP64wEYuleIEOyFT9uh9c1HTh0aSVkydPB8MzgzUkyVLD2FoKPyNMJTecK1R
	y8/UG3/PQNvw4I5GSsIMvazUH7UcFyNyWD0VmHh9aKiUcZ9t5PFVjbGpo/bLKCzqHxq2NMY
	u8rgA6n/NSDFQIjFKpQAFBV4nNGLkxZd3pehjtNaIJ27EX2lHZEqBpdXgouPeQOc2OYwhVe
	2zZjcdcsqh/BgXe/5Va1Z/B03oHnY72gBId+uoUZIAuyabDfddtVo0xRQgnKg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8772950966564420236
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 05/15] tools/nolibc: add missing my_syscall6() for mips
Date: Fri,  7 Jul 2023 22:55:35 +0800
Message-Id: <c847dd087b65c1eb3edaca31ed47d31d43759518.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_075621_678206_5A065972 
X-CRM114-Status: GOOD (  12.00  )
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

It is able to pass the 6th argument like the 5th argument via the stack
for mips, let's add a new my_syscall6() now, see [1] for details:

  The mips/o32 system call convention passes arguments 5 through 8 on
  the user stack.

Both mmap() and pselect6() require my_syscall6().

[1]: https://man7.org/linux/man-pages/man2/syscall.2.html

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/arch-mips.h | 27 ++++++++++++++++++++++++++-
 tools/include/nolibc/nolibc.h    |  9 ++++-----
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
index 1848f57777c4..a2bfdf57b957 100644
--- a/tools/include/nolibc/arch-mips.h
+++ b/tools/include/nolibc/arch-mips.h
@@ -166,7 +166,7 @@ struct sys_stat_struct {
 	__asm__ volatile (                                                    \
 		"addiu $sp, $sp, -32\n"                                       \
 		"sw %7, 16($sp)\n"                                            \
-		"syscall\n  "                                                 \
+		"syscall\n"                                                   \
 		"addiu $sp, $sp, 32\n"                                        \
 		: "=r" (_num), "=r"(_arg4)                                    \
 		: "0"(_num),                                                  \
@@ -176,6 +176,31 @@ struct sys_stat_struct {
 	_arg4 ? -_num : _num;                                                 \
 })
 
+#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)                  \
+({                                                                            \
+	register long _num __asm__ ("v0")  = (num);                           \
+	register long _arg1 __asm__ ("a0") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("a1") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("a2") = (long)(arg3);                    \
+	register long _arg4 __asm__ ("a3") = (long)(arg4);                    \
+	register long _arg5 = (long)(arg5);                                   \
+	register long _arg6 = (long)(arg6);                                   \
+									      \
+	__asm__ volatile (                                                    \
+		"addiu $sp, $sp, -32\n"                                       \
+		"sw %7, 16($sp)\n"                                            \
+		"sw %8, 20($sp)\n"                                            \
+		"syscall\n"                                                   \
+		"addiu $sp, $sp, 32\n"                                        \
+		: "=r" (_num), "=r"(_arg4)                                    \
+		: "0"(_num),                                                  \
+		  "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
+		  "r"(_arg6)                                                  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_arg4 ? -_num : _num;                                                 \
+})
+
 char **environ __attribute__((weak));
 const unsigned long *_auxv __attribute__((weak));
 
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index 05a228a6ee78..1f8d821000ac 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -13,11 +13,10 @@
  * Syscalls are split into 3 levels:
  *   - The lower level is the arch-specific syscall() definition, consisting in
  *     assembly code in compound expressions. These are called my_syscall0() to
- *     my_syscall6() depending on the number of arguments. The MIPS
- *     implementation is limited to 5 arguments. All input arguments are cast
- *     to a long stored in a register. These expressions always return the
- *     syscall's return value as a signed long value which is often either a
- *     pointer or the negated errno value.
+ *     my_syscall6() depending on the number of arguments. All input arguments
+ *     are castto a long stored in a register. These expressions always return
+ *     the syscall's return value as a signed long value which is often either
+ *     a pointer or the negated errno value.
  *
  *   - The second level is mostly architecture-independent. It is made of
  *     static functions called sys_<name>() which rely on my_syscallN()
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
