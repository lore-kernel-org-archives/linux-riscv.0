Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D24BEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 18:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Flqk6Hgix1whk3rk1oRMPnk/u9kmxzxKY289ur58sk=; b=vYqbSwAnXpJQ7k
	PVRJJRrTsDDXql5w0ZnpFQglendEx5mvdknsua+MbuG7pae9NmJvhQHmQ2Ux9lQkVYhw08hzYZfe7
	w9SgiXCTxZQFUWBAh95bh2e9Mhx8kHjtPqgxB1uTIoNZQ3mh067MFudFkeeH/brEmnIH5aa0pJUuC
	+G7A1wHrvpn0GXGyIPbmsKDatRTuQinfr+E7P8n+k48pRDiem+TKiV1Jzu2IGWl6R2koMHSdS/b1F
	BkO7OPeaRd+IHcKPlyWNy8bcpLQBZ1Uv0y+3VP7rlpW3lwoTgYXu8JFFpBgonh8HCaA+o/n83Qe/+
	yTTzWTvOnVJ02Ab1oYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaNf-00GTFP-1z;
	Wed, 28 Jun 2023 18:59:07 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaNc-00GTEP-22
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 18:59:06 +0000
X-QQ-mid: bizesmtp72t1687978659t3keb3dh
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 02:57:38 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: KvvwR/hcPA35iAr8TQYDvxZOkDcgAM3TIY87E/9m40p4dKpVt+fphBTPFnApg
	cm8CqegYIrMMP7buadH2bcEjPZgnbPX4xzvowbn6G1s+64nmmgJaOe9ns+CWK3tXfrlH+cs
	/MjQq3sTuUJ5KDFemeGMQPH4c5BE3EkCn7au7Ro17HXjdLJ3FIkMo5p4R+YpMp4wCF7EGMv
	JaxQCrRYQnno7PmRxBlxC1Q9VJSKY8nwTHVpXkzkHibixC4A2T4aqs6tAIJZ1BNHC91ec0f
	hmkHi0Te9PGaNE4g7qedn3c3t0lD1E0O0BLd5mr1MnbtknEIdnVRCjLsHVEzxmEUSR67QiS
	20y+PWFkCrx46YGTbC6zNW4jIwi1YGYyTROXXfQi5Nvnw3mKqQ=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2412116737021503385
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 05/11] tools/nolibc: aarch64: shrink _start with _start_c
Date: Thu, 29 Jun 2023 02:57:23 +0800
Message-Id: <1adc51e395e76ad05e15b5d41b6460a191d10997.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687976753.git.falcon@tinylab.org>
References: <cover.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_115904_969825_8C2992D3 
X-CRM114-Status: UNSURE (   8.24  )
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
 tools/include/nolibc/arch-aarch64.h | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/tools/include/nolibc/arch-aarch64.h b/tools/include/nolibc/arch-aarch64.h
index 4a8a6f386865..ef98a751783f 100644
--- a/tools/include/nolibc/arch-aarch64.h
+++ b/tools/include/nolibc/arch-aarch64.h
@@ -143,33 +143,16 @@
 	_arg1;									\
 })
 
-char **environ __attribute__((weak));
-const unsigned long *_auxv __attribute__((weak));
-
 /* startup code */
 void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) __no_stack_protector _start(void)
 {
 	__asm__ volatile (
 #ifdef _NOLIBC_STACKPROTECTOR
-		"bl __stack_chk_init\n"   /* initialize stack protector                     */
+		"bl __stack_chk_init\n"	/* initialize stack protector			*/
 #endif
-		"ldr x0, [sp]\n"     /* argc (x0) was in the stack                          */
-		"add x1, sp, 8\n"    /* argv (x1) = sp                                      */
-		"lsl x2, x0, 3\n"    /* envp (x2) = 8*argc ...                              */
-		"add x2, x2, 8\n"    /*           + 8 (skip null)                           */
-		"add x2, x2, x1\n"   /*           + argv                                    */
-		"adrp x3, environ\n"          /* x3 = &environ (high bits)                  */
-		"str x2, [x3, #:lo12:environ]\n" /* store envp into environ                 */
-		"mov x4, x2\n"       /* search for auxv (follows NULL after last env)       */
-		"0:\n"
-		"ldr x5, [x4], 8\n"  /* x5 = *x4; x4 += 8                                   */
-		"cbnz x5, 0b\n"      /* and stop at NULL after last env                     */
-		"adrp x3, _auxv\n"   /* x3 = &_auxv (high bits)                             */
-		"str x4, [x3, #:lo12:_auxv]\n" /* store x4 into _auxv                       */
-		"and sp, x1, -16\n"  /* sp must be 16-byte aligned in the callee            */
-		"bl main\n"          /* main() returns the status code, we'll exit with it. */
-		"mov x8, 93\n"       /* NR_exit == 93                                       */
-		"svc #0\n"
+		"mov x0, sp\n"		/* save stack pointer to x0, as arg1 of _start_c*/
+		"and sp, x0, -16\n"	/* sp must be 16-byte aligned in the callee	*/
+		"bl  _start_c\n"	/* transfer to c runtime			*/
 	);
 	__builtin_unreachable();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
