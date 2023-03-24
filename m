Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B6AC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LpGJY08WJcexONQIqEYajD5xW4ngD+nZziz2tVuniys=; b=rgDpser3q8VoUQ
	A3pXVoDgnMPjcx9vbt9VttDKQxn86AvsuaSIOCV6uA9Av8UWerCD3lclBe5/QI8HiNYJ+uftvuvT0
	rs5tlcPtac/bPXFB580vuFRgP6tvVCAb3cD2nj4BO/CXmHzRFoImV01+js9EbgtqRs/WVyaquiT97
	6mJqd9kskpXMgr96SFFx4fG+ZitffT1Z+lp0ij9NUaIO/Pf8rX6F2CQOARqOs2G2UOtggAruPAwJ8
	3awKYfuvdHcqcDmAtlp+utJnn8nXcAIez4B8zYf49/u4aYtcUQeIpswjhmzqKfospcdeo5cU1uKDI
	JNdYk3tIgh2f/AUrYRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfciO-003rh7-0G;
	Fri, 24 Mar 2023 08:24:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfciK-003reN-1q
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 08:23:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 98DA1CE2437;
	Fri, 24 Mar 2023 08:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43031C433EF;
	Fri, 24 Mar 2023 08:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679646228;
	bh=WNmnBMlXQbbzSIzNbiTJv8PajglyS7jPcj9FFmg6NWU=;
	h=From:To:Cc:Subject:Date:From;
	b=dDeq+INQJQ8cdGwiqzVv1YUb+oIdwqPJJHuTj1Q0fbnl92ex0saerlTqYpdWYHewN
	 7CF1K1iztsPDj71V0OW3fxLF/4LCJVPqvt1gitdHYBWfUfRHssbptB7A0tdQN3VG6p
	 3xDGQe+GA3LdUHIFx+Yh5EihmAcO7RdA9gqiVoHQIjfB/MENJKU090orHMCrRU++Ks
	 thLUVJeZlY9O/HNWXo5LuNn22vCOzw1j7jatENm+YJDEV2xili6xuUmTDnbS8Ud/6J
	 USGAGp4AH+yBsBdNwBnvZlFvpNR/J5aEu53kvZ0Aijlxp8iO7UY0E2bSauakE6Xcow
	 H9Ady5C0BXUpQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V4] riscv: jump_label: Optimize the code size with compressed instruction
Date: Fri, 24 Mar 2023 04:23:20 -0400
Message-Id: <20230324082320.290410-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_012357_043455_01144C01 
X-CRM114-Status: GOOD (  12.65  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Reduce the size of the static branch instruction and prevent atomic
update problems when CONFIG_RISCV_ISA_C=y. It also reduces the jump
range from 1MB to 4KB, but 4KB is enough for the current riscv
requirement.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
Changelog
v4:
 - Rebase on palmer/for-next (20230324)
 - Separate from "riscv: jump_label: Fixup & Optimization"

v3:
https://lore.kernel.org/linux-riscv/20230126170607.1489141-3-guoren@kernel.org/

v2:
https://lore.kernel.org/linux-riscv/20221210100927.835145-3-guoren@kernel.org/

v1:
https://lore.kernel.org/linux-riscv/20220913094252.3555240-6-andy.chiu@sifive.com/
---
 arch/riscv/include/asm/jump_label.h | 16 +++++++++++----
 arch/riscv/kernel/jump_label.c      | 30 +++++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 14a5ea8d8ef0..afc58c31d02b 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -12,17 +12,23 @@
 #include <linux/types.h>
 #include <asm/asm.h>
 
+#ifdef CONFIG_RISCV_ISA_C
+#define JUMP_LABEL_NOP_SIZE 2
+#else
 #define JUMP_LABEL_NOP_SIZE 4
+#endif
 
 static __always_inline bool arch_static_branch(struct static_key * const key,
 					       const bool branch)
 {
 	asm_volatile_goto(
-		"	.align		2			\n\t"
 		"	.option push				\n\t"
 		"	.option norelax				\n\t"
-		"	.option norvc				\n\t"
+#ifdef CONFIG_RISCV_ISA_C
+		"1:	c.nop					\n\t"
+#else
 		"1:	nop					\n\t"
+#endif
 		"	.option pop				\n\t"
 		"	.pushsection	__jump_table, \"aw\"	\n\t"
 		"	.align		" RISCV_LGPTR "		\n\t"
@@ -40,11 +46,13 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 						    const bool branch)
 {
 	asm_volatile_goto(
-		"	.align		2			\n\t"
 		"	.option push				\n\t"
 		"	.option norelax				\n\t"
-		"	.option norvc				\n\t"
+#ifdef CONFIG_RISCV_ISA_C
+		"1:	c.j		%l[label]		\n\t"
+#else
 		"1:	jal		zero, %l[label]		\n\t"
+#endif
 		"	.option pop				\n\t"
 		"	.pushsection	__jump_table, \"aw\"	\n\t"
 		"	.align		" RISCV_LGPTR "		\n\t"
diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index e6694759dbd0..08f42c49e3a0 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -11,26 +11,52 @@
 #include <asm/bug.h>
 #include <asm/patch.h>
 
+#ifdef CONFIG_RISCV_ISA_C
+#define RISCV_INSN_NOP 0x0001U
+#define RISCV_INSN_C_J 0xa001U
+#else
 #define RISCV_INSN_NOP 0x00000013U
 #define RISCV_INSN_JAL 0x0000006fU
+#endif
 
 void arch_jump_label_transform(struct jump_entry *entry,
 			       enum jump_label_type type)
 {
 	void *addr = (void *)jump_entry_code(entry);
+#ifdef CONFIG_RISCV_ISA_C
+	u16 insn;
+#else
 	u32 insn;
+#endif
 
 	if (type == JUMP_LABEL_JMP) {
 		long offset = jump_entry_target(entry) - jump_entry_code(entry);
-
-		if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
+		if (WARN_ON(offset & 1 || offset < -2048 || offset >= 2048))
 			return;
 
+#ifdef CONFIG_RISCV_ISA_C
+		/*
+		 * 001 | imm[11|4|9:8|10|6|7|3:1|5] 01 - C.J
+		 */
+		insn = RISCV_INSN_C_J |
+			(((u16)offset & GENMASK(5, 5)) >> (5 - 2)) |
+			(((u16)offset & GENMASK(3, 1)) << (3 - 1)) |
+			(((u16)offset & GENMASK(7, 7)) >> (7 - 6)) |
+			(((u16)offset & GENMASK(6, 6)) << (7 - 6)) |
+			(((u16)offset & GENMASK(10, 10)) >> (10 - 8)) |
+			(((u16)offset & GENMASK(9, 8)) << (9 - 8)) |
+			(((u16)offset & GENMASK(4, 4)) << (11 - 4)) |
+			(((u16)offset & GENMASK(11, 11)) << (12 - 11));
+#else
+		/*
+		 * imm[20|10:1|11|19:12] | rd | 1101111 - JAL
+		 */
 		insn = RISCV_INSN_JAL |
 			(((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
 			(((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
 			(((u32)offset & GENMASK(10,  1)) << (21 -  1)) |
 			(((u32)offset & GENMASK(20, 20)) << (31 - 20));
+#endif
 	} else {
 		insn = RISCV_INSN_NOP;
 	}
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
