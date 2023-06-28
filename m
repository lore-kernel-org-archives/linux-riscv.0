Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20304EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CzkTgufphlC2D5CSEFcqMS2M19ZV5rguyuA4uJ3dqk=; b=j1Nquifzbnmhm0
	kZ1Jc+WqIu3B6kwRibICVBxJBW8nR882M+u9otokXgN/gMabCZ5UI2CtTM+AoezIOl09HybBYMV0B
	DXONkuo07CZ4hEkXL2zXB+bRFaf/y7fzKBJJrJa92TUfrlYj+6Rp5QSBuurRvnuL9peSrrwvyqj/c
	8Z77Syu30dVeH088mCEW1UfAuHcwbTbyBuNi01nnknNwTAKBs/d1WiGpdv/RBP/+9uBu3e613YT3p
	F0+3GMxW9u9dCyjVooAZxb1uGRXTqfClqa2HCpOMPehFNj6df1QtcYbl5wPKvfRJ1dIUjY2+Pqikc
	8Q0pxD9jW1sp5ETBvHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaVT-00GUyb-2k;
	Wed, 28 Jun 2023 19:07:11 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaVQ-00GUxY-2z
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 19:07:10 +0000
X-QQ-mid: bizesmtp79t1687979217ti593xid
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 03:06:55 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: D2GZf6M6C/jblY5+ez24uRSJrc6onlFKbVGlqPu9gz4C5VaEsHfPYV/+NbYNT
	M1xzvZvpUGVdU4m30V11Y032mXFLtuUBz/mtlNUDT78V8fQ/lc5cTGseyv0F/f0q/eI4FDb
	B2FbUnR/M5UMRVoi8g9xzAxpolnLJoudK9vMmMuJQ7xcbx68I+AHVvjOFo7ArkDBmY72K17
	WpFiuGChYRn7DpN7ps7SrQCzwKzxAB0mOSMBUknzBEI0mP+u/OoB2NsfF4nMJXSIwPhcSgK
	uX/3Z74F0cX7AiF4lVQeTGYbg+K8doDPqbNQ/9SiL4iEP7soaPyeIgLaT2FvFSs8jnE9qSo
	Xd1YNJ9b6NQ4Od4okJQhNXhT4z0+qHgCdh0Nj/WbL1NR+KM2wI=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18249731880678126887
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 11/11] tools/nolibc: s390: shrink _start with _start_c
Date: Thu, 29 Jun 2023 03:06:44 +0800
Message-Id: <2a63942b938ce0f016f3411f7c0d4b0c0d512e74.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687976753.git.falcon@tinylab.org>
References: <cover.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_120709_261536_6C023463 
X-CRM114-Status: UNSURE (   8.01  )
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
 tools/include/nolibc/arch-s390.h | 35 ++++----------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/tools/include/nolibc/arch-s390.h b/tools/include/nolibc/arch-s390.h
index 5139e0e37e56..a28f94aa28ca 100644
--- a/tools/include/nolibc/arch-s390.h
+++ b/tools/include/nolibc/arch-s390.h
@@ -137,41 +137,14 @@
 	_arg1;									\
 })
 
-char **environ __attribute__((weak));
-const unsigned long *_auxv __attribute__((weak));
-
 /* startup code */
 void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) __no_stack_protector _start(void)
 {
 	__asm__ volatile (
-		"lg	%r2,0(%r15)\n"		/* argument count */
-		"la	%r3,8(%r15)\n"		/* argument pointers */
-
-		"xgr	%r0,%r0\n"		/* r0 will be our NULL value */
-		/* search for envp */
-		"lgr	%r4,%r3\n"		/* start at argv */
-		"0:\n"
-		"clg	%r0,0(%r4)\n"		/* entry zero? */
-		"la	%r4,8(%r4)\n"		/* advance pointer */
-		"jnz	0b\n"			/* no -> test next pointer */
-						/* yes -> r4 now contains start of envp */
-		"larl	%r1,environ\n"
-		"stg	%r4,0(%r1)\n"
-
-		/* search for auxv */
-		"lgr	%r5,%r4\n"		/* start at envp */
-		"1:\n"
-		"clg	%r0,0(%r5)\n"		/* entry zero? */
-		"la	%r5,8(%r5)\n"		/* advance pointer */
-		"jnz	1b\n"			/* no -> test next pointer */
-		"larl	%r1,_auxv\n"		/* yes -> store value in _auxv */
-		"stg	%r5,0(%r1)\n"
-
-		"aghi	%r15,-160\n"		/* allocate new stackframe */
-		"xc	0(8,%r15),0(%r15)\n"	/* clear backchain */
-		"brasl	%r14,main\n"		/* ret value of main is arg to exit */
-		"lghi	%r1,1\n"		/* __NR_exit */
-		"svc	0\n"
+		"lgr	%r2, %r15\n"		/* initialize stack protector	*/
+		"aghi	%r15, -160\n"		/* allocate new stackframe	*/
+		"xc	0(8,%r15), 0(%r15)\n"	/* clear backchain		*/
+		"brasl	%r14, _start_c\n"	/* transfer to c runtime	*/
 	);
 	__builtin_unreachable();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
