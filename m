Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CED3C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 03:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BP1Zew1R2/xB20vKG4RHAotYlhlDD6RAyf9lKC/VS+I=; b=wAcOzp1KwJzzLT
	qGpACEXD+a774QNuANSkRU8JnOyQOgyBL5kE3DmHfTq48FODKkIzBjZud9RKD3tz4WVb9m1obBRtR
	rOKVWn5aqFbSU7Y4cXrDvsDoUqGwsieYjD0VE4uxBd744Ga/GHkvCBJHtSuUSyxR7rDF9X4j+Y3fE
	xFhJep1H/TW+nMzIry32YN0UbzcvbXgsfFuWVu6gC3JQWMs+Y4ju2/AF6teGDvfn7+LAMtkwmvUKt
	gzANpkmeZI/Ciz17xW659e/M90Kf24IprAfRc2uIQARlqYXJDG8wXeWtFNXjaFTBd0JivWQQ1ieMe
	Uegi7p26N8QsPluPPSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0E0z-00Cffg-Gn; Wed, 30 Nov 2022 03:44:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0E0r-00CfYj-Lt
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 03:44:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E0ECFB819FD;
	Wed, 30 Nov 2022 03:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AEAC433C1;
	Wed, 30 Nov 2022 03:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669779834;
	bh=/WZwLxNR9v9Ha8Sj5CelT2bjLZH+6wtJq3o/8HRr1Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QifbGw3o+9MeBaz8t02q8GEDYwu6q9Smxz5EgKWylxJ31M/dD7sfXlOLiJ3Wvf/hM
	 DmGvkizsubkN/BQ6erGANeDCJ3ig/BaENE8OC6EldYGURgy0wUpwQQIPC9ffd9GNNJ
	 Ni/7diYZYgycHzFu46NVtBiNjHr27gecLcTxC8Xel/YzHiDE76R8805kDaBnvb1/9r
	 N/lqF+EK7p12wnI2t8/E0To1igd3+DD+rXMnd0W6xWg0gc//XMJmFshHRb2TojAD3G
	 1zTM3fIurfrGw6w1aLsnUyK3d75GXaKR7D+P4VN4nhG3PC3WqOpeOvIeGTPlkXeTCq
	 jiyXfLSoPqhZw==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH -next V9 14/14] riscv: entry: consolidate general regs saving/restoring
Date: Tue, 29 Nov 2022 22:40:59 -0500
Message-Id: <20221130034059.826599-15-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221130034059.826599-1-guoren@kernel.org>
References: <20221130034059.826599-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_194358_164154_92BCF2EB 
X-CRM114-Status: GOOD (  10.82  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Consolidate the saving/restoring GPs(except zero, ra, sp, gp and
tp) into save_from_x5_to_x31/restore_from_x5_to_x31 macros.

No functional change intended.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Tested-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/asm.h   | 63 +++++++++++++++++++++++++
 arch/riscv/kernel/entry.S      | 84 ++--------------------------------
 arch/riscv/kernel/mcount-dyn.S | 56 +----------------------
 3 files changed, 68 insertions(+), 135 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 1b471ff73178..bf5247aa317d 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -68,6 +68,7 @@
 #endif
 
 #ifdef __ASSEMBLY__
+#include <asm/asm-offsets.h>
 
 /* Common assembly source macros */
 
@@ -80,6 +81,68 @@
 	.endr
 .endm
 
+	/* save all GPs except zero, ra, sp, gp and tp */
+	.macro save_from_x5_to_x31
+	REG_S x5,  PT_T0(sp)
+	REG_S x6,  PT_T1(sp)
+	REG_S x7,  PT_T2(sp)
+	REG_S x8,  PT_S0(sp)
+	REG_S x9,  PT_S1(sp)
+	REG_S x10, PT_A0(sp)
+	REG_S x11, PT_A1(sp)
+	REG_S x12, PT_A2(sp)
+	REG_S x13, PT_A3(sp)
+	REG_S x14, PT_A4(sp)
+	REG_S x15, PT_A5(sp)
+	REG_S x16, PT_A6(sp)
+	REG_S x17, PT_A7(sp)
+	REG_S x18, PT_S2(sp)
+	REG_S x19, PT_S3(sp)
+	REG_S x20, PT_S4(sp)
+	REG_S x21, PT_S5(sp)
+	REG_S x22, PT_S6(sp)
+	REG_S x23, PT_S7(sp)
+	REG_S x24, PT_S8(sp)
+	REG_S x25, PT_S9(sp)
+	REG_S x26, PT_S10(sp)
+	REG_S x27, PT_S11(sp)
+	REG_S x28, PT_T3(sp)
+	REG_S x29, PT_T4(sp)
+	REG_S x30, PT_T5(sp)
+	REG_S x31, PT_T6(sp)
+	.endm
+
+	/* restore all GPs except zero, ra, sp, gp and tp */
+	.macro restore_from_x5_to_x31
+	REG_L x5,  PT_T0(sp)
+	REG_L x6,  PT_T1(sp)
+	REG_L x7,  PT_T2(sp)
+	REG_L x8,  PT_S0(sp)
+	REG_L x9,  PT_S1(sp)
+	REG_L x10, PT_A0(sp)
+	REG_L x11, PT_A1(sp)
+	REG_L x12, PT_A2(sp)
+	REG_L x13, PT_A3(sp)
+	REG_L x14, PT_A4(sp)
+	REG_L x15, PT_A5(sp)
+	REG_L x16, PT_A6(sp)
+	REG_L x17, PT_A7(sp)
+	REG_L x18, PT_S2(sp)
+	REG_L x19, PT_S3(sp)
+	REG_L x20, PT_S4(sp)
+	REG_L x21, PT_S5(sp)
+	REG_L x22, PT_S6(sp)
+	REG_L x23, PT_S7(sp)
+	REG_L x24, PT_S8(sp)
+	REG_L x25, PT_S9(sp)
+	REG_L x26, PT_S10(sp)
+	REG_L x27, PT_S11(sp)
+	REG_L x28, PT_T3(sp)
+	REG_L x29, PT_T4(sp)
+	REG_L x30, PT_T5(sp)
+	REG_L x31, PT_T6(sp)
+	.endm
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_ASM_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d4c061f7fbfa..51eb1ef52e47 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -41,33 +41,7 @@ _save_context:
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	REG_S x1,  PT_RA(sp)
 	REG_S x3,  PT_GP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
-	REG_S x10, PT_A0(sp)
-	REG_S x11, PT_A1(sp)
-	REG_S x12, PT_A2(sp)
-	REG_S x13, PT_A3(sp)
-	REG_S x14, PT_A4(sp)
-	REG_S x15, PT_A5(sp)
-	REG_S x16, PT_A6(sp)
-	REG_S x17, PT_A7(sp)
-	REG_S x18, PT_S2(sp)
-	REG_S x19, PT_S3(sp)
-	REG_S x20, PT_S4(sp)
-	REG_S x21, PT_S5(sp)
-	REG_S x22, PT_S6(sp)
-	REG_S x23, PT_S7(sp)
-	REG_S x24, PT_S8(sp)
-	REG_S x25, PT_S9(sp)
-	REG_S x26, PT_S10(sp)
-	REG_S x27, PT_S11(sp)
-	REG_S x28, PT_T3(sp)
-	REG_S x29, PT_T4(sp)
-	REG_S x30, PT_T5(sp)
-	REG_S x31, PT_T6(sp)
+	save_from_x5_to_x31
 
 	/*
 	 * Disable user-mode memory access as it should only be set in the
@@ -186,33 +160,7 @@ ENTRY(ret_from_exception)
 	REG_L x1,  PT_RA(sp)
 	REG_L x3,  PT_GP(sp)
 	REG_L x4,  PT_TP(sp)
-	REG_L x5,  PT_T0(sp)
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x8,  PT_S0(sp)
-	REG_L x9,  PT_S1(sp)
-	REG_L x10, PT_A0(sp)
-	REG_L x11, PT_A1(sp)
-	REG_L x12, PT_A2(sp)
-	REG_L x13, PT_A3(sp)
-	REG_L x14, PT_A4(sp)
-	REG_L x15, PT_A5(sp)
-	REG_L x16, PT_A6(sp)
-	REG_L x17, PT_A7(sp)
-	REG_L x18, PT_S2(sp)
-	REG_L x19, PT_S3(sp)
-	REG_L x20, PT_S4(sp)
-	REG_L x21, PT_S5(sp)
-	REG_L x22, PT_S6(sp)
-	REG_L x23, PT_S7(sp)
-	REG_L x24, PT_S8(sp)
-	REG_L x25, PT_S9(sp)
-	REG_L x26, PT_S10(sp)
-	REG_L x27, PT_S11(sp)
-	REG_L x28, PT_T3(sp)
-	REG_L x29, PT_T4(sp)
-	REG_L x30, PT_T5(sp)
-	REG_L x31, PT_T6(sp)
+	restore_from_x5_to_x31
 
 	REG_L x2,  PT_SP(sp)
 
@@ -278,33 +226,7 @@ restore_caller_reg:
 	//save context to overflow stack
 	REG_S x1,  PT_RA(sp)
 	REG_S x3,  PT_GP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
-	REG_S x10, PT_A0(sp)
-	REG_S x11, PT_A1(sp)
-	REG_S x12, PT_A2(sp)
-	REG_S x13, PT_A3(sp)
-	REG_S x14, PT_A4(sp)
-	REG_S x15, PT_A5(sp)
-	REG_S x16, PT_A6(sp)
-	REG_S x17, PT_A7(sp)
-	REG_S x18, PT_S2(sp)
-	REG_S x19, PT_S3(sp)
-	REG_S x20, PT_S4(sp)
-	REG_S x21, PT_S5(sp)
-	REG_S x22, PT_S6(sp)
-	REG_S x23, PT_S7(sp)
-	REG_S x24, PT_S8(sp)
-	REG_S x25, PT_S9(sp)
-	REG_S x26, PT_S10(sp)
-	REG_S x27, PT_S11(sp)
-	REG_S x28, PT_T3(sp)
-	REG_S x29, PT_T4(sp)
-	REG_S x30, PT_T5(sp)
-	REG_S x31, PT_T6(sp)
+	save_from_x5_to_x31
 
 	REG_L s0, TASK_TI_KERNEL_SP(tp)
 	csrr s1, CSR_STATUS
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index d171eca623b6..040d098279a9 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -70,33 +70,7 @@
 	REG_S x2,  PT_SP(sp)
 	REG_S x3,  PT_GP(sp)
 	REG_S x4,  PT_TP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
-	REG_S x10, PT_A0(sp)
-	REG_S x11, PT_A1(sp)
-	REG_S x12, PT_A2(sp)
-	REG_S x13, PT_A3(sp)
-	REG_S x14, PT_A4(sp)
-	REG_S x15, PT_A5(sp)
-	REG_S x16, PT_A6(sp)
-	REG_S x17, PT_A7(sp)
-	REG_S x18, PT_S2(sp)
-	REG_S x19, PT_S3(sp)
-	REG_S x20, PT_S4(sp)
-	REG_S x21, PT_S5(sp)
-	REG_S x22, PT_S6(sp)
-	REG_S x23, PT_S7(sp)
-	REG_S x24, PT_S8(sp)
-	REG_S x25, PT_S9(sp)
-	REG_S x26, PT_S10(sp)
-	REG_S x27, PT_S11(sp)
-	REG_S x28, PT_T3(sp)
-	REG_S x29, PT_T4(sp)
-	REG_S x30, PT_T5(sp)
-	REG_S x31, PT_T6(sp)
+	save_from_x5_to_x31
 	.endm
 
 	.macro RESTORE_ALL
@@ -108,33 +82,7 @@
 	REG_L x2,  PT_SP(sp)
 	REG_L x3,  PT_GP(sp)
 	REG_L x4,  PT_TP(sp)
-	REG_L x5,  PT_T0(sp)
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x8,  PT_S0(sp)
-	REG_L x9,  PT_S1(sp)
-	REG_L x10, PT_A0(sp)
-	REG_L x11, PT_A1(sp)
-	REG_L x12, PT_A2(sp)
-	REG_L x13, PT_A3(sp)
-	REG_L x14, PT_A4(sp)
-	REG_L x15, PT_A5(sp)
-	REG_L x16, PT_A6(sp)
-	REG_L x17, PT_A7(sp)
-	REG_L x18, PT_S2(sp)
-	REG_L x19, PT_S3(sp)
-	REG_L x20, PT_S4(sp)
-	REG_L x21, PT_S5(sp)
-	REG_L x22, PT_S6(sp)
-	REG_L x23, PT_S7(sp)
-	REG_L x24, PT_S8(sp)
-	REG_L x25, PT_S9(sp)
-	REG_L x26, PT_S10(sp)
-	REG_L x27, PT_S11(sp)
-	REG_L x28, PT_T3(sp)
-	REG_L x29, PT_T4(sp)
-	REG_L x30, PT_T5(sp)
-	REG_L x31, PT_T6(sp)
+	restore_from_x5_to_x31
 
 	addi	sp, sp, PT_SIZE_ON_STACK
 	addi	sp, sp, SZREG
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
