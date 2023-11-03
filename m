Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1503FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCSjY9YkWb/Je9sP3MLhvtl0AX6y+4H94z8FmsR4U5o=; b=G5ts7zJC6nYNSY
	KU9V6Q2qIRPp2hP7drOKD0DxFOuVcAED7MBVdi2mMnf6Cza0kqHovD5I3TDMVMT5FJnFxkrb4D8S7
	6IfYFUrYgEH1mKmTR5qAR53wdufO4L+q0FL+phq1Z7EFx6xBf5kKvJocN9isCQij0TSBdQOYMtEU5
	cbA82J0AENPmUZbIW6g3M9M6855j2+05/B+ehAca4fNKZA1twkTvFrfmb8Hg+bDvD7c/nVOyFPfSN
	hoYmVOtRTRw76siV/fSD9KKt/GYuKZ78Wae1wrawvqXbeINqlovtGSo6BxW2mCiq1LMJUcZksCVhT
	EvmnNnaPA7l+JzOaqLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywdC-00BkT3-00;
	Fri, 03 Nov 2023 16:02:46 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywd8-00BkRB-24
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:02:44 +0000
X-QQ-mid: bizesmtp91t1699027345tuzi88hk
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Nov 2023 00:02:22 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: YlW+rreuxxXoxvlIlb1sqNHnSOT+l5Yn7jheMGM0MN7wg16F1FQezu3ESPCIn
	SG4dX7pl9FbKYtPlw5xFGKF9hdEiY4GXCO8Dcbx8/cg7Og+QCU3+CXMPCfzr3ILF+7b8OJC
	We3CArNs3/RzbQomd2+K7yNXkmGAdxxgFstmrUQolP47JcSLPCcnWVH+pzG+WBKc95SRuk6
	GRNeVQS005EaooagskyJFuMF58jFp792MV4/nMVDor5tdI0R+v9ntYb8OLdlo+bjQBPaFjZ
	3tXMXILkQNqiZOfSFuWlhMCs5t5EvoYMyXZptegM68V3A/gfjehT5qri7Me9UwyV2uMy7Yw
	qI4nF3fFj9RVpkTbEo40dXUlw5DXyqiA0exePUzOcNNH73+MM0=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1289692222090341736
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luc.vanoostenryck@gmail.com,
	linux-sparse@vger.kernel.org
Cc: linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	tanyuan@tinylab.org,
	i@maskray.me
Subject: [PATCH v1 10/14] DCE/DSE: riscv: make every ex_table's name unique
Date: Sat,  4 Nov 2023 00:02:18 +0800
Message-Id: <f0ee9abfd8d7b27489a4efe3196813225ce5680f.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090242_987811_847520E9 
X-CRM114-Status: UNSURE (   6.09  )
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

gc-sections require section names to be unique.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/include/asm/asm-extable.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index 00a96e7a9664..d0be5a838242 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -9,10 +9,12 @@
 
 #ifdef CONFIG_MMU
 
+#include <linux/compiler.h>
+
 #ifdef __ASSEMBLY__
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
-	.pushsection	__ex_table, "a";		\
+	.pushsection	__SECTION_NAME(__ex_table), "a";		\
 	.balign		4;				\
 	.long		((insn) - .);			\
 	.long		((fixup) - .);			\
@@ -31,7 +33,7 @@
 #include <asm/gpr-num.h>
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
-	".pushsection	__ex_table, \"a\"\n"		\
+	".pushsection "	__SECTION_NAME(__ex_table) ", \"a\"\n"		\
 	".balign	4\n"				\
 	".long		((" insn ") - .)\n"		\
 	".long		((" fixup ") - .)\n"		\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
