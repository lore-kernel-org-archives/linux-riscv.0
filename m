Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEE5C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0g5vMuKfhbfISbKi5DLbIpe6vOhMi6Fy2ZUBs5zAoY=; b=1c1PbzBwmtN4wV
	22lZx9e5VW1TblsWB7LJNlDCi35Cn680jAKrSUC0+lswyuR1wyKylWg5isAsLu6Jwp59WfGOsAFvk
	vGFCLzcp/Aa3J3p8XppsnEOHcKbxCFjK5T1kvEokCsWYmA3uutYnJs4gtXQ7dcNOBNW58ze4dFn3h
	gxPBxBHN6NTC8VQ3fjP79ygM0cLqnymsMFweddAMYdG5XY947gg3xO9Cs+YNiwceZTujNH2K7JDEq
	hVTG2Or5m0mhmOXE7DX8FdI+LaGrmF50ebO3NzidCsZ/mFcDG8lr6MEQ/tQYNbLmqSXR7+4xglIQS
	ckya2kfiStKknOQIqRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzh1g-00DZUB-26;
	Thu, 18 May 2023 17:02:52 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzh1d-00DZSt-2g
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 17:02:51 +0000
X-QQ-mid: bizesmtp70t1684429359tgkq75s7
Received: from linux-lab-host.localdomain ( [119.123.131.162])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 May 2023 01:02:38 +0800 (CST)
X-QQ-SSF: 01200000000000C0V000000A0000000
X-QQ-FEAT: 83ShfzFP0oBUigIVReinYVVse+wZCQ1xyB9c0HLHomQcRIhIHH1Wbj3e7QJxl
	XRGA27Pmu0I1ZUz4S0zTfxBJxpCfVY2O9Br44TiESs6isz5Vtok9zA/tKqQIvvWrYlIROuQ
	VsD2bhbVu+YdqHdX2WGGQQw6BHsVl4Z09JVxFJM5MQcYeYxSk+6352EdRNFQ3hgEXSLPsK6
	QovuyY9gP1bqHyd5vMUnXOTo0nsszRnIY6GU2j5ZcqtHegYeeXIai6gsSucGfGBHzffKm4C
	jGFszYGPzvI101y+uvQLGL7xjE/aa444ATZrCbazXXe267+pOQOFXlumTidsRyO2v7gjq+7
	pcRoZsDZ0W0oy7EGPePzY2orOyZI5oF1gzrkbGSrZrveR9gzn4=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13521670369968386674
From: Zhangjin Wu <falcon@tinylab.org>
To: Willy Tarreau <w@1wt.eu>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [PATCH 1/2] tools/nolibc: riscv: Fix up load/store instructions for rv32
Date: Fri, 19 May 2023 01:02:12 +0800
Message-Id: <1425d092ef4c1242646ede2bbcbc3ac945c2b274.1684425792.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684425792.git.falcon@tinylab.org>
References: <cover.1684425792.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_100250_190038_16A5C485 
X-CRM114-Status: UNSURE (   7.56  )
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

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/arch-riscv.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/include/nolibc/arch-riscv.h b/tools/include/nolibc/arch-riscv.h
index e197fcb10ac0..7d7c4beabb8d 100644
--- a/tools/include/nolibc/arch-riscv.h
+++ b/tools/include/nolibc/arch-riscv.h
@@ -33,9 +33,13 @@ struct sys_stat_struct {
 #if   __riscv_xlen == 64
 #define PTRLOG "3"
 #define SZREG  "8"
+#define REG_L  "ld"
+#define REG_S  "sd"
 #elif __riscv_xlen == 32
 #define PTRLOG "2"
 #define SZREG  "4"
+#define REG_L  "lw"
+#define REG_S  "sw"
 #endif
 
 /* Syscalls for RISCV :
@@ -181,7 +185,7 @@ void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) _start(void)
 		".option norelax\n"
 		"lla   gp, __global_pointer$\n"
 		".option pop\n"
-		"lw    a0, 0(sp)\n"          // argc (a0) was in the stack
+		REG_L" a0, 0(sp)\n"          // argc (a0) was in the stack
 		"add   a1, sp, "SZREG"\n"    // argv (a1) = sp
 		"slli  a2, a0, "PTRLOG"\n"   // envp (a2) = SZREG*argc ...
 		"add   a2, a2, "SZREG"\n"    //             + SZREG (skip null)
@@ -189,14 +193,14 @@ void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) _start(void)
 
 		"add   a3, a2, zero\n"       // iterate a3 over envp to find auxv (after NULL)
 		"0:\n"                       // do {
-		"ld    a4, 0(a3)\n"          //   a4 = *a3;
+		REG_L" a4, 0(a3)\n"          //   a4 = *a3;
 		"add   a3, a3, "SZREG"\n"    //   a3 += sizeof(void*);
 		"bne   a4, zero, 0b\n"       // } while (a4);
 		"lui   a4, %hi(_auxv)\n"     // a4 = &_auxv (high bits)
-		"sd    a3, %lo(_auxv)(a4)\n" // store a3 into _auxv
+		REG_S" a3, %lo(_auxv)(a4)\n" // store a3 into _auxv
 
-		"lui a3, %hi(environ)\n"     // a3 = &environ (high bits)
-		"sd a2,%lo(environ)(a3)\n"   // store envp(a2) into environ
+		"lui   a3, %hi(environ)\n"   // a3 = &environ (high bits)
+		REG_S" a2,%lo(environ)(a3)\n"// store envp(a2) into environ
 		"andi  sp,a1,-16\n"          // sp must be 16-byte aligned
 		"call  main\n"               // main() returns the status code, we'll exit with it.
 		"li a7, 93\n"                // NR_exit == 93
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
