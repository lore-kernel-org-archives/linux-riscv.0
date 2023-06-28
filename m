Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1971EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsiM3Of96+B9jjGTCXwDbVkbB45OwvoNZKgxGH2Vadw=; b=VHWsZw4Dh5QI27
	58jVelziITLOzGoRGRxo/kYZhWBC1y/eSNG3r5AmCdrHJYrjgk7NBQT1xqqQOh68gcfjLNxJG+kGD
	IoT4x1jqWa0HpUWWzLjNnw7aWNUfsGXt8GGJAEy+seWScmyyxsfHDJlkhX7SdZ7MYtWZuhW5ZgiSu
	SFP/khzgykWaiK4DhLQ8JeDoOUTqOUM7iJV1T+XWR6NDIJ0v1N/GQYg3LGROzGMfsc/EOp7/VxEPM
	jyiT9tASlbD8nw2Fv7d0aXKDm2TSWXA7qXSZK1qtfdkPPJa6qkTJ5mBa6INSaEBd5ZtD19T79eyZd
	oh4Wtcwq2jAcDEw5K/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaOR-00GTOK-2u;
	Wed, 28 Jun 2023 18:59:55 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaOP-00GTNG-0P
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 18:59:54 +0000
X-QQ-mid: bizesmtp78t1687978735t1k8oxv4
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 02:58:53 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: znfcQSa1hKbNtlJaExe6GfPAoc0Ow5+wEWHtPLG7/Q1ge+0ox0JyU9wMZjrJB
	FtypQUSuK8tr3GynT9yFI2sUEDe1ixy87NqzzYo8mCDDjD4dEQp9RNDNmknFPKNEDwCqTTl
	rBh23PghpE0BeEpgR9KmVOl+x6kRiFqrD1NrVUE2gl94i2AKJsaWbJp3ZeZGKvRlk+DQ4Ua
	uOO9ts/jzsDuTn2eozBWxv4Ec183BmS/Dt8SsvwS8U3L/XhRTcoe1D9KbI2yDgvp4zNzmoO
	wqXMiCqMx94azMgzMWL/tOLzm3ucmctRTOQ1QXkNIK3OZP5rMZuFMNFnotyiTvh7b8t7Bx6
	uFwXiRjLkfGw04uw1vIX0ZKUEPWkOUAKqz01NmfaznPq3tpd5uMtTO+IyQZMw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10494488464373133128
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 06/11] tools/nolibc: i386: shrink _start with _start_c
Date: Thu, 29 Jun 2023 02:58:43 +0800
Message-Id: <27783ab1bed69fd99319aa52e03e204ef1160d74.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687976753.git.falcon@tinylab.org>
References: <cover.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_115953_459483_3460E030 
X-CRM114-Status: UNSURE (   9.92  )
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
 tools/include/nolibc/arch-i386.h | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/tools/include/nolibc/arch-i386.h b/tools/include/nolibc/arch-i386.h
index 418554435545..b56046f1d0c0 100644
--- a/tools/include/nolibc/arch-i386.h
+++ b/tools/include/nolibc/arch-i386.h
@@ -154,9 +154,6 @@
 	_eax;								\
 })
 
-char **environ __attribute__((weak));
-const unsigned long *_auxv __attribute__((weak));
-
 /* startup code */
 /*
  * i386 System V ABI mandates:
@@ -168,29 +165,14 @@ void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) __no_stack_pr
 {
 	__asm__ volatile (
 #ifdef _NOLIBC_STACKPROTECTOR
-		"call __stack_chk_init\n"   /* initialize stack protector                    */
+		"call __stack_chk_init\n"	/* initialize stack protector				*/
 #endif
-		"pop %eax\n"                /* argc   (first arg, %eax)                      */
-		"mov %esp, %ebx\n"          /* argv[] (second arg, %ebx)                     */
-		"lea 4(%ebx,%eax,4),%ecx\n" /* then a NULL then envp (third arg, %ecx)       */
-		"mov %ecx, environ\n"       /* save environ                                  */
-		"xor %ebp, %ebp\n"          /* zero the stack frame                          */
-		"mov %ecx, %edx\n"          /* search for auxv (follows NULL after last env) */
-		"0:\n"
-		"add $4, %edx\n"            /* search for auxv using edx, it follows the     */
-		"cmp -4(%edx), %ebp\n"      /* ... NULL after last env (ebp is zero here)    */
-		"jnz 0b\n"
-		"mov %edx, _auxv\n"         /* save it into _auxv                            */
-		"and $-16, %esp\n"          /* x86 ABI : esp must be 16-byte aligned before  */
-		"sub $4, %esp\n"            /* the call instruction (args are aligned)       */
-		"push %ecx\n"               /* push all registers on the stack so that we    */
-		"push %ebx\n"               /* support both regparm and plain stack modes    */
-		"push %eax\n"
-		"call main\n"               /* main() returns the status code in %eax        */
-		"mov %eax, %ebx\n"          /* retrieve exit code (32-bit int)               */
-		"movl $1, %eax\n"           /* NR_exit == 1                                  */
-		"int $0x80\n"               /* exit now                                      */
-		"hlt\n"                     /* ensure it does not                            */
+		"xor  %ebp, %ebp\n"		/* zero the stack frame					*/
+		"mov  %esp, %eax\n"		/* save stack pointer to eax, as arg1 of _start_c	*/
+		"and  $-16, %esp\n"		/* last pushed argument must be 16-byte aligned		*/
+		"push %eax\n"			/* push arg1 on stack to support plain stack modes too	*/
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
