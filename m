Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF23EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9vLKT6/7VPlkmEqpCH3YWJfPzd9sjo4Z/4Cyvy+a6k=; b=UYThf9RWvUrV4s
	sbm6uL6pV2aKWApu8KBJZfxm2gRUi6WOnYqqIQUSfzvlP+1DmlcIHu2/BVL8b17PFhDbAA3HjhjgG
	LxOcFRauwSTPYs57aIJhXbD5aOj6eb6UdWMYVoGr2FhJIM/cMv7ismf+dcLJtGVUiPzTC6vLmz3ja
	glin5GkiKtTi7FPDuIpCjEKfza30wMtc7NoPWL0LjNW/4TD08sni9sSnakyPU+opBaA2kLtfzlmgY
	ZTvwYpVLJ4bw9u7YkCS2bPdx6E1eHpv6MhsKhOhmf5QTlOcgKWchWZkfhC8lqxNFLVry/Ha4/519z
	7S1l7+JC6BmAfK3njxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH6P-008pOU-2D;
	Mon, 19 Jun 2023 15:47:37 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH6M-008pNI-23
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 15:47:36 +0000
X-QQ-mid: bizesmtp71t1687189637tfw3qus3
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 23:47:15 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: FVl8EHhfVR5hTM2MdejT0GIbTUMQnvvUQOWCRxCGR49gRYux9d12G2vVb1lRF
	8nq44JbZnU0bAxj0jSCsfcBSnRc0JIxf/jv3bG/13gWzc3g2D0LkkHTvfJF2apjjfviXc7Z
	CzsdtFb6SMoG0Rg4aRXlRooX7fXnpjG/6m4wWa+KcgD8bp8m+4QaoymFemrnQ4SBC5aTwHe
	C5zEEEN2nDn46AjT8WhSfRULcj588bZGxRL3Nq6UQirUYAVy/3YPM7NnaEH63bX6VUzD6lt
	V0gXqP6ju6pyEStUUX71fZJeb/rH0LOdpd3lRFsptbPeM4NeKX51kaJi+AKMiikSpDE90/C
	P4rfTz822WFFf8KcwQRa8FJoB+Azztezxzl3qZrnw/JLJlyL3pXca5bRlaU81/rWwt1HFvf
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3012571999382365335
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: david.laight@aculab.com,
	arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v4 05/10] tools/nolibc: add missing my_syscall6() for mips
Date: Mon, 19 Jun 2023 23:47:12 +0800
Message-Id: <44abf14c4fa920eadb98833356e517d414b1d66d.1687187451.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687187451.git.falcon@tinylab.org>
References: <cover.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_084734_996098_01B98B8A 
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
 tools/include/nolibc/arch-mips.h | 26 ++++++++++++++++++++++++++
 tools/include/nolibc/nolibc.h    |  9 ++++-----
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
index db24e0837a39..48dd42b4abc3 100644
--- a/tools/include/nolibc/arch-mips.h
+++ b/tools/include/nolibc/arch-mips.h
@@ -178,6 +178,32 @@ struct sys_stat_struct {
 	_arg4 ? -_num : _num;                                                 \
 })
 
+#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)                  \
+({                                                                            \
+	register long _num __asm__ ("v0") = (num);                            \
+	register long _arg1 __asm__ ("a0") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("a1") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("a2") = (long)(arg3);                    \
+	register long _arg4 __asm__ ("a3") = (long)(arg4);                    \
+	register long _arg5 = (long)(arg5);                                   \
+	register long _arg6 = (long)(arg6);                                   \
+	                                                                      \
+	__asm__  volatile (                                                   \
+		"addiu $sp, $sp, -32\n"                                       \
+		"sw %7, 16($sp)\n"                                            \
+		"sw %8, 20($sp)\n"                                            \
+		"syscall\n  "                                                 \
+		"addiu $sp, $sp, 32\n"                                        \
+		: "=r" (_num), "=r"(_arg4)                                    \
+		: "0"(_num),                                                  \
+		  "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
+		  "r"(_arg6)                                                  \
+		: "memory", "cc", "at", "v1", "hi", "lo",                     \
+	          "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"  \
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
