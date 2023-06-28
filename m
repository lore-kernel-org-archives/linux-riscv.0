Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7BDEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 19:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nxm1dtPuvHCTMG6vPxXJLxBNEGd1AUkFe5ep7TCbkI=; b=0nWaRvtrTlkliH
	fyBt3KjCrDMJW7g8+4Mx3lQvjz1U9uyTmahBNT1b+POBE5HgoHIGFbvoAGO/YatA/9z1Ky+pgqBOG
	7LsLkix9evjTnDb8pX1kpqG1BX2Kj7gn/SU/qGcHHPpSV9Jjj7WRYiIGZi/2GrDlmWjQMq9KAA5dA
	6JviSwGxZ2oBUmIhVm/Nn35Yltl691kEMhnyh2+Rz6CdQmuBqQIR9eRPiyo0eZt2oezoW98cG3jWI
	9HTxvycn0ScO1/jzTpVum7gQ5idFMYfrqnyoJkEqFdHjhZfej2I54DFPoYSYU9rCjMRSiRq5eW9qa
	AJ3s75wX9faaHKj8FT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaQj-00GU7r-0K;
	Wed, 28 Jun 2023 19:02:17 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaQf-00GU5y-0B
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 19:02:15 +0000
X-QQ-mid: bizesmtp89t1687978884tr421dbg
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 03:01:22 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: ILHsT53NKPjPXjqsNEc9WBpKx63aH6ekhXt41at7lejx0jr9AWFyR18ehAl08
	bHwqwkh7ymPLXY51CXtEBbfJ81cFMb2N0GSZHiCmbuOThu+5KQkwU0LEAvuiO8wiXR40au+
	4X2xjRXPLeh32yf38Zo9qZZfNIKaLF8phJjBU3yxPar+YY8Q/0663gzWqLw6pqlfMnXWEA7
	gTgLLrDNjI9hGBUWpUIFGbyjQcfZ0/DBlfkyKdyU4lJdu2IgREZqdq3GexHqZ7UxX9ULcnk
	8Nwu5hA13KXbNIxvJoE4xEcbre+ivYBN/aw3H4A6wPt2RirdsH9F4qQv0RfGlMvp6PDRNlU
	Iev1qO3zLEoA/9++tmAJvh8F3qMV8zXatpRjX/HatGjBbl0UxI=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4007669029372385518
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 08/11] tools/nolibc: mips: shrink _start with _start_c
Date: Thu, 29 Jun 2023 03:01:14 +0800
Message-Id: <0d650309e0cf79fee1a87995d3fcae083b96b150.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687976753.git.falcon@tinylab.org>
References: <cover.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_120213_396138_80ACE139 
X-CRM114-Status: UNSURE (   9.53  )
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

Also clean up the instructions in delay slots.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/arch-mips.h | 45 +++++++-------------------------
 1 file changed, 9 insertions(+), 36 deletions(-)

diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
index ecf912a1938f..d0f73f03bfa1 100644
--- a/tools/include/nolibc/arch-mips.h
+++ b/tools/include/nolibc/arch-mips.h
@@ -173,50 +173,23 @@
 	_arg4 ? -_num : _num;							\
 })
 
-char **environ __attribute__((weak));
-const unsigned long *_auxv __attribute__((weak));
-
 /* startup code, note that it's called __start on MIPS */
 void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) __no_stack_protector __start(void)
 {
 	__asm__ volatile (
-		/*".set nomips16\n"*/
 		".set push\n"
-		".set    noreorder\n"
+		".set noreorder\n"
 		".option pic0\n"
 #ifdef _NOLIBC_STACKPROTECTOR
-		"jal __stack_chk_init\n" /* initialize stack protector                         */
-		"nop\n"                  /* delayed slot                                       */
+		"jal __stack_chk_init\n"	/* initialize stack protector			*/
+		" nop\n"			/* delayed slot					*/
 #endif
-		/*".ent __start\n"*/
-		/*"__start:\n"*/
-		"lw $a0,($sp)\n"        /* argc was in the stack                               */
-		"addiu  $a1, $sp, 4\n"  /* argv = sp + 4                                       */
-		"sll $a2, $a0, 2\n"     /* a2 = argc * 4                                       */
-		"add   $a2, $a2, $a1\n" /* envp = argv + 4*argc ...                            */
-		"addiu $a2, $a2, 4\n"   /*        ... + 4                                      */
-		"lui $a3, %hi(environ)\n"     /* load environ into a3 (hi)                     */
-		"addiu $a3, %lo(environ)\n"   /* load environ into a3 (lo)                     */
-		"sw $a2,($a3)\n"              /* store envp(a2) into environ                   */
-
-		"move $t0, $a2\n"             /* iterate t0 over envp, look for NULL           */
-		"0:"                          /* do {                                          */
-		"lw $a3, ($t0)\n"             /*   a3=*(t0);                                   */
-		"bne $a3, $0, 0b\n"           /* } while (a3);                                 */
-		"addiu $t0, $t0, 4\n"         /* delayed slot: t0+=4;                          */
-		"lui $a3, %hi(_auxv)\n"       /* load _auxv into a3 (hi)                       */
-		"addiu $a3, %lo(_auxv)\n"     /* load _auxv into a3 (lo)                       */
-		"sw $t0, ($a3)\n"             /* store t0 into _auxv                           */
-
-		"li $t0, -8\n"
-		"and $sp, $sp, $t0\n"   /* sp must be 8-byte aligned                           */
-		"addiu $sp,$sp,-16\n"   /* the callee expects to save a0..a3 there!            */
-		"jal main\n"            /* main() returns the status code, we'll exit with it. */
-		"nop\n"                 /* delayed slot                                        */
-		"move $a0, $v0\n"       /* retrieve 32-bit exit code from v0                   */
-		"li $v0, 4001\n"        /* NR_exit == 4001                                     */
-		"syscall\n"
-		/*".end __start\n"*/
+		"move  $a0, $sp\n"		/* save stack pointer to a0, as arg1 of _start_c*/
+		"li    $t0, -8\n"
+		"and   $sp, $sp, $t0\n"		/* sp must be 8-byte aligned			*/
+		"addiu $sp, $sp, -16\n"		/* the callee expects to save a0..a3 there	*/
+		"jal   _start_c\n"		/* transfer to c runtime			*/
+		" nop\n"			/* delayed slot					*/
 		".set pop\n"
 	);
 	__builtin_unreachable();
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
