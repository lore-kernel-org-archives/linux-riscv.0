Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91316EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 19:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8nqKhD+N2/nNF3mZw1zRVOvwxa76wZc95JKbv/N9aQ=; b=lT8tpQ80ZlDG4v
	Y6oK8RgJNR4hZWk6VRFhBGlh8CCZRlLsHwl9Egz/PXdryrBVAS77S9H7T9kLZT4Rbqw1TS7dtDH+e
	L6pdGxE+/DvCgiahJQnVjsH5KFU7SR9bV/06kWJK/n6rjPFxsTgMVhwv96+RF5lJiGdpmg1PQ1yFf
	iL+TXCA7JjnrF3ZkiRJ6feg+qmcWT1IZ1oA5TNgtZlZyUEJObCoxClGDKaMODyYZ8+JU+BZfNWQmk
	fEWZ/SCDEhyZhJTzizaGz8yFAiPVXvFsbjtljcfJMDtWKiEgpi+o+2+09lvq51TwElJOrCpBZT+Sq
	LFHxZZtJPjrfAqPBEkYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaS9-00GUSk-1N;
	Wed, 28 Jun 2023 19:03:45 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaS6-00GURj-2X
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 19:03:44 +0000
X-QQ-mid: bizesmtp85t1687978987tlvjj2iy
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 03:03:06 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: 30t4+KEGo2kqMzIzajseusyLF7DGV3trcgVIZWDyeuDiPdn9oiQdoe9C6XJAD
	vRYykuFZb8aw+newmuj0ZpRZbq0olfDeXM0x7P3WWiHkTf+RxIC6e0va5PbFtdi31S7emfy
	BgWC8COyFGZmilAgD/mTUgkxKuUbRPK1ZBCcw4yTh1Um5vGJptGF1X/y/y+2bxUYydm8Hys
	1rxzCBDgc9rUTPxmLdlt6TDy2B+4s0BQEA8E5kMilhmEU4iFzpsThdNQUe5tOB8Uogv5JB5
	EOAMYtW4/Jp5C/kEwJY4Ll8PZad+UsXQW1qxIjYDjIZ3FxqazztHdJGRH78+TnxowJqO00q
	e7IYl+PYRC4K9WgitssfviOC/U+GsgbUhQD8FLxCWtM9SHztqs=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2025772407350311878
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 09/11] tools/nolibc: loongarch: shrink _start with _start_c
Date: Thu, 29 Jun 2023 03:02:29 +0800
Message-Id: <3304844b9d5c02416d08aaffd2f009941b38163c.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687976753.git.falcon@tinylab.org>
References: <cover.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_120343_128427_A3AC312A 
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
 tools/include/nolibc/arch-loongarch.h | 42 +++------------------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/tools/include/nolibc/arch-loongarch.h b/tools/include/nolibc/arch-loongarch.h
index fbb4844f7993..f5cac2e81a13 100644
--- a/tools/include/nolibc/arch-loongarch.h
+++ b/tools/include/nolibc/arch-loongarch.h
@@ -145,26 +145,9 @@
 	_arg1;									\
 })
 
-char **environ __attribute__((weak));
-const unsigned long *_auxv __attribute__((weak));
-
 #if __loongarch_grlen == 32
-#define LONGLOG      "2"
-#define SZREG        "4"
-#define REG_L        "ld.w"
-#define LONG_S       "st.w"
-#define LONG_ADD     "add.w"
-#define LONG_ADDI    "addi.w"
-#define LONG_SLL     "slli.w"
 #define LONG_BSTRINS "bstrins.w"
 #else /* __loongarch_grlen == 64 */
-#define LONGLOG      "3"
-#define SZREG        "8"
-#define REG_L        "ld.d"
-#define LONG_S       "st.d"
-#define LONG_ADD     "add.d"
-#define LONG_ADDI    "addi.d"
-#define LONG_SLL     "slli.d"
 #define LONG_BSTRINS "bstrins.d"
 #endif
 
@@ -173,28 +156,11 @@ void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) __no_stack_pr
 {
 	__asm__ volatile (
 #ifdef _NOLIBC_STACKPROTECTOR
-		"bl __stack_chk_init\n"               /* initialize stack protector                          */
+		"bl __stack_chk_init\n"			/* initialize stack protector			*/
 #endif
-		REG_L        " $a0, $sp, 0\n"         /* argc (a0) was in the stack                          */
-		LONG_ADDI    " $a1, $sp, "SZREG"\n"   /* argv (a1) = sp + SZREG                              */
-		LONG_SLL     " $a2, $a0, "LONGLOG"\n" /* envp (a2) = SZREG*argc ...                          */
-		LONG_ADDI    " $a2, $a2, "SZREG"\n"   /*             + SZREG (skip null)                     */
-		LONG_ADD     " $a2, $a2, $a1\n"       /*             + argv                                  */
-
-		"move          $a3, $a2\n"            /* iterate a3 over envp to find auxv (after NULL)      */
-		"0:\n"                                /* do {                                                */
-		REG_L        " $a4, $a3, 0\n"         /*   a4 = *a3;                                         */
-		LONG_ADDI    " $a3, $a3, "SZREG"\n"   /*   a3 += sizeof(void*);                              */
-		"bne           $a4, $zero, 0b\n"      /* } while (a4);                                       */
-		"la.pcrel      $a4, _auxv\n"          /* a4 = &_auxv                                         */
-		LONG_S       " $a3, $a4, 0\n"         /* store a3 into _auxv                                 */
-
-		"la.pcrel      $a3, environ\n"        /* a3 = &environ                                       */
-		LONG_S       " $a2, $a3, 0\n"         /* store envp(a2) into environ                         */
-		LONG_BSTRINS " $sp, $zero, 3, 0\n"    /* sp must be 16-byte aligned                          */
-		"bl            main\n"                /* main() returns the status code, we'll exit with it. */
-		"li.w          $a7, 93\n"             /* NR_exit == 93                                       */
-		"syscall       0\n"
+		"move          $a0, $sp\n"		/* save stack pointer to a0, as arg1 of _start_c*/
+		LONG_BSTRINS " $sp, $zero, 3, 0\n"	/* sp must be 16-byte aligned			*/
+		"bl            _start_c\n"		/* transfer to c runtime			*/
 	);
 	__builtin_unreachable();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
