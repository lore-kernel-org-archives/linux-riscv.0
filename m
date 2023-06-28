Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2AFEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 19:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMSGwQeynWbqRdMPOIZS3GgPVsEUWM8ahq/Bo/CMKvw=; b=AUggNJJhFCPOkn
	I7WaBYVBxjT0kM3Mb+5Bl7u0XzC9Slg3WHMjyZj0NNptOag/SskVmBrTqjIAydcC/IPi3R5YtUsBN
	VLSwl7i8ZWcXWA32GKa69XKreH7NFOvBcR1TZ3ETTRsI+tU56Ncy2cYOZyjTURspBXFmIFZ9YHgFQ
	jfa60WwWkpeqEsCgU8Ukoq0ubFl7jQrPJ7/7LBS0qV+ZmPTZr+8sW4OxpgSUKrpz9UcB6xtRfSWq4
	SD4Pawk6AZffTEqLozRwZxEWyG8VjzUIuCtLfveXNC7b0y7eNy72swvsngRlfr2CfIQMMz4Lv3pJi
	fQZP+YaKCVs83XcfegFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaUE-00GUnm-0y;
	Wed, 28 Jun 2023 19:05:54 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaUB-00GUnA-2F
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 19:05:53 +0000
X-QQ-mid: bizesmtp81t1687979140twy3oz5l
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 03:05:38 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: QityeSR92A0ivM8Oe5i1P8PgBPy/0WKQrP/bau1yZUyBIMxZ5v5/nq5XSmhEo
	YaCWksBQ8b9i4Oiy0QKM2HQhJUQxhtH6I0PmpEJH68qNQ2/UUaq1iQcgOX+RFZ7zBKo7g2i
	8fglSXNIJqe1lroojRhULNzSXIilkUv2ECoShgSwtnYMb8eO2nqScTXKGmhyfnDiF9jnlDx
	EoLxIAA7wqjl9DMajcD+s3Rmv+4Agv5M+PyV3e1dbGHOM6kMSvcfKligJTkTbcrf1Q4vzhI
	RHzPS9ot3goSP+6inAJpovN0PDWV+1j5DgDpGx20+T9RNlw8H3wOshH2sdaJnutu92MSj60
	JpBup9/hmlDjscis/Y5N6ZqzwwRTzi7UX5BHcqVDB3wJsLZSWcsAmohQngzAg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17283120326487235982
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 10/11] tools/nolibc: riscv: shrink _start with _start_c
Date: Thu, 29 Jun 2023 03:04:12 +0800
Message-Id: <4a6e7245c3aa07eb20fd6c6aa43bc663e480e0c5.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687976753.git.falcon@tinylab.org>
References: <cover.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_120552_036744_36CB2FFB 
X-CRM114-Status: UNSURE (   9.21  )
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
 tools/include/nolibc/arch-riscv.h | 42 ++++---------------------------
 1 file changed, 5 insertions(+), 37 deletions(-)

diff --git a/tools/include/nolibc/arch-riscv.h b/tools/include/nolibc/arch-riscv.h
index 7f4abcc15206..ec0f9c597d0b 100644
--- a/tools/include/nolibc/arch-riscv.h
+++ b/tools/include/nolibc/arch-riscv.h
@@ -9,18 +9,6 @@
 
 #include "compiler.h"
 
-#if   __riscv_xlen == 64
-#define PTRLOG "3"
-#define SZREG  "8"
-#define REG_L  "ld"
-#define REG_S  "sd"
-#elif __riscv_xlen == 32
-#define PTRLOG "2"
-#define SZREG  "4"
-#define REG_L  "lw"
-#define REG_S  "sw"
-#endif
-
 /* Syscalls for RISCV :
  *   - stack is 16-byte aligned
  *   - syscall number is passed in a7
@@ -153,40 +141,20 @@
 	_arg1;									\
 })
 
-char **environ __attribute__((weak));
-const unsigned long *_auxv __attribute__((weak));
-
 /* startup code */
 void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) __no_stack_protector _start(void)
 {
 	__asm__ volatile (
 		".option push\n"
 		".option norelax\n"
-		"lla   gp, __global_pointer$\n"
+		"lla  gp, __global_pointer$\n"
 		".option pop\n"
 #ifdef _NOLIBC_STACKPROTECTOR
-		"call __stack_chk_init\n"    /* initialize stack protector                          */
+		"call __stack_chk_init\n"	/* initialize stack protector			*/
 #endif
-		REG_L" a0, 0(sp)\n"          /* argc (a0) was in the stack                          */
-		"add   a1, sp, "SZREG"\n"    /* argv (a1) = sp                                      */
-		"slli  a2, a0, "PTRLOG"\n"   /* envp (a2) = SZREG*argc ...                          */
-		"add   a2, a2, "SZREG"\n"    /*             + SZREG (skip null)                     */
-		"add   a2,a2,a1\n"           /*             + argv                                  */
-
-		"add   a3, a2, zero\n"       /* iterate a3 over envp to find auxv (after NULL)      */
-		"0:\n"                       /* do {                                                */
-		REG_L" a4, 0(a3)\n"          /*   a4 = *a3;                                         */
-		"add   a3, a3, "SZREG"\n"    /*   a3 += sizeof(void*);                              */
-		"bne   a4, zero, 0b\n"       /* } while (a4);                                       */
-		"lui   a4, %hi(_auxv)\n"     /* a4 = &_auxv (high bits)                             */
-		REG_S" a3, %lo(_auxv)(a4)\n" /* store a3 into _auxv                                 */
-
-		"lui   a3, %hi(environ)\n"   /* a3 = &environ (high bits)                           */
-		REG_S" a2,%lo(environ)(a3)\n"/* store envp(a2) into environ                         */
-		"andi  sp,a1,-16\n"          /* sp must be 16-byte aligned                          */
-		"call  main\n"               /* main() returns the status code, we'll exit with it. */
-		"li a7, 93\n"                /* NR_exit == 93                                       */
-		"ecall\n"
+		"mv   a0, sp\n"			/* save stack pointer to a0, as arg1 of _start_c*/
+		"andi sp, a0, -16\n"		/* sp must be 16-byte aligned			*/
+		"call _start_c\n"		/* transfer to c runtime			*/
 	);
 	__builtin_unreachable();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
