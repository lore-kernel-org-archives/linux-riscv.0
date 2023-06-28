Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B16C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SaMFJi9Q6xTLsVkdxeFcAp3TuxdCHHH7ncTTbMA2Tx8=; b=xDGhGZkBn1Wkjs
	wFzX/tsYCCtsgsoCsY3a8AHzNC4AEhDgksUS0pKjIF+zlj3msQndOVcy0A25R3Fp1ougUesC1vca5
	dH0N8ycXSAWRyxYC8+mWxHiaDH6PdjJO6MRPi3uIv5nzcS9PbAbmPikuge+OpnCZY90dI+DzKJvpA
	9sdJPvr87vKS77FJxBLXhZ6wxwhtNFF8MvnhPcCycbyToyLdl9pTg9wt6/dKSSOerP9nmo9ooTwDN
	DCWxLvma+65E6vQSheXjW7b8DtiosTwstaqbBsbDHvd41OUI6uCnx5H6FzXhjYL8WBWgBeGlv0lq5
	R5HokG98p85KmCXyoKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaPV-00GTnB-2U;
	Wed, 28 Jun 2023 19:01:01 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaPT-00GTmG-1o
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 19:01:01 +0000
X-QQ-mid: bizesmtp86t1687978810tf2ar9vw
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 03:00:08 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: +ynUkgUhZJneCqf/WiFIlQeErW4hE9O+nEPddl2PRkjGlBZEniPrcbaTTc7s2
	5f7+aA6vYP9PgLSC4T+j0tcUHwDVAnq8K7wx2MCiGSfUIbExALiKcxf1iKlDVqafqQCqd7u
	w6L2PnJbHsPLcw/lQuF2hvLgUlEij/5DAIfSAqE1oRd1Y5ZtWZoW+kxKtrEEg616wwLLjoF
	3yRqaVk1PLD1I42O+doEPlLna5UF0Ob/6v7p7L7gjJVYrJVWrIr8SAIrcz/RsiRD27lBnl5
	TElxw/lGgBlRGo6OFU0/aBHG2qDnPSoZHBD6UI8D2fq8Cje2g2Dm5BiBWqCmJr2l+N/eX6q
	xVeXxjtbPRXqoMegPcU9CcfyiG5e0xQGVdKth5kBBUlzsUSr6bbfGY2eD8fsg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10657381781421926358
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 07/11] tools/nolibc: x86_64: shrink _start with _start_c
Date: Thu, 29 Jun 2023 02:59:59 +0800
Message-Id: <e041d383165f05b964c9b1ce7e5aeb5d0a3a1e09.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687976753.git.falcon@tinylab.org>
References: <cover.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_120059_904771_ED5F5DC1 
X-CRM114-Status: UNSURE (   9.41  )
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

Let's move most of the _start operations to _start_c().

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/arch-x86_64.h | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/tools/include/nolibc/arch-x86_64.h b/tools/include/nolibc/arch-x86_64.h
index 4c0192815a59..116dcd8e1413 100644
--- a/tools/include/nolibc/arch-x86_64.h
+++ b/tools/include/nolibc/arch-x86_64.h
@@ -153,9 +153,6 @@
 	_ret;									\
 })
 
-char **environ __attribute__((weak));
-const unsigned long *_auxv __attribute__((weak));
-
 /* startup code */
 /*
  * x86-64 System V ABI mandates:
@@ -167,25 +164,13 @@ void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) __no_stack_pr
 {
 	__asm__ volatile (
 #ifdef _NOLIBC_STACKPROTECTOR
-		"call __stack_chk_init\n"   /* initialize stack protector                          */
+		"call __stack_chk_init\n"	/* initialize stack protector				*/
 #endif
-		"pop %rdi\n"                /* argc   (first arg, %rdi)                            */
-		"mov %rsp, %rsi\n"          /* argv[] (second arg, %rsi)                           */
-		"lea 8(%rsi,%rdi,8),%rdx\n" /* then a NULL then envp (third arg, %rdx)             */
-		"mov %rdx, environ\n"       /* save environ                                        */
-		"xor %ebp, %ebp\n"          /* zero the stack frame                                */
-		"mov %rdx, %rax\n"          /* search for auxv (follows NULL after last env)       */
-		"0:\n"
-		"add $8, %rax\n"            /* search for auxv using rax, it follows the           */
-		"cmp -8(%rax), %rbp\n"      /* ... NULL after last env (rbp is zero here)          */
-		"jnz 0b\n"
-		"mov %rax, _auxv\n"         /* save it into _auxv                                  */
-		"and $-16, %rsp\n"          /* x86 ABI : esp must be 16-byte aligned before call   */
-		"call main\n"               /* main() returns the status code, we'll exit with it. */
-		"mov %eax, %edi\n"          /* retrieve exit code (32 bit)                         */
-		"mov $60, %eax\n"           /* NR_exit == 60                                       */
-		"syscall\n"                 /* really exit                                         */
-		"hlt\n"                     /* ensure it does not return                           */
+		"xor  %ebp, %ebp\n"		/* zero the stack frame					*/
+		"mov  %rsp, %rdi\n"		/* save stack pointer to rdi, as arg1 of _start_c	*/
+		"and  $-16, %rsp\n"		/* rsp must be 16-byte aligned before call		*/
+		"call _start_c\n"		/* transfer to c runtime				*/
+		"hlt\n"				/* ensure it does not return				*/
 	);
 	__builtin_unreachable();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
