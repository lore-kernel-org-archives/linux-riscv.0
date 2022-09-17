Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E082EECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLLo4HFbidSCuWbPpG1yN/2sveV2mbk6SBx7wdFZexQ=; b=DveACb0heKIdTf
	QaDWru7m8P1tfOKcUxi7UIy7XkPrsvDjJx82UgSnO1LDAWbzATGAIjV9wttXJzoCXapfs9auENrSK
	+H7EcvKFDPGIquuTt43kBWpKjI0C8/X+8uOTj6Abmd63RuDiAj+VFkXQ1zt5GCO7cfxGIr9ufyOak
	X8HklISXIYhulBbEDXt+Fl6XpZ9YwgvOIjQlyZZOurKIoN2wtmHnlMkzx8D2AVZwp96pgeVqp9EJz
	itePt+S646dEf7ga2Z05feOgu5p9AERlaH30N/69M7sQIyIbLOaVvSsCA4C/6HqiWyK7IqlDxG7e0
	PSZ7RZlEHWdQHln4UqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZciV-0086P2-J8; Sat, 17 Sep 2022 18:39:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZciS-0086M2-Sq
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 18:39:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5799F61163;
	Sat, 17 Sep 2022 18:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF98C433D6;
	Sat, 17 Sep 2022 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663439939;
	bh=BFhTJIaY5iL/O+vCW81qnWIxQzhVpNEShFGJEkjT6p4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bJlzlaVpShpV7imargwlxIv5YMxDWXGajpzCuYUEip2iumf/cHyWZC0OnJEmB87KN
	 nKAiMKpw3WGraPoMNDOu3xxbifHWZhmTlc/OJdbwzeRcjJF11V/wlqy9c7RXwMUK3W
	 OhQQ6Uk/9AJYd9WiJxHF/Db3l3n67ztj3KvlxrC+6Hes4jWZXAVrmiO+GOcc5sHhdx
	 PnQ8eEwiLq4ns/JqA/0z3F/ETqkJxX60I/1eCQW0NNm7SCu6U39mej7Xv0LyH+1wdW
	 OCzyBRsorCgl6EeZe/nKD6o/BR/xLd2GW1I7C2apOns+/m2756g1z15y7U2deHjK3a
	 Zra7H12o7ptlw==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: andy.chiu@sifive.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	greentime.hu@sifive.com,
	jbaron@akamai.com,
	jpoimboe@kernel.org,
	kernel@esmil.dk,
	linux-riscv@lists.infradead.org,
	mingo@redhat.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	zong.li@sifive.com,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch function
Date: Sat, 17 Sep 2022 14:38:49 -0400
Message-Id: <20220917183849.589593-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
References: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_113901_014255_D5FF603D 
X-CRM114-Status: GOOD (  12.16  )
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

Reduce size of static branch.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/jump_label.h | 17 ++++++++++-----
 arch/riscv/kernel/jump_label.c      | 32 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 38af2ec7b9bf..78f747dfa8a2 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -12,17 +12,21 @@
 #include <linux/types.h>
 #include <asm/asm.h>
 
+#ifdef CONFIG_RISCV_ISA_C
+#define JUMP_LABEL_NOP_SIZE 2
+#else
 #define JUMP_LABEL_NOP_SIZE 4
+#endif
 
 static __always_inline bool arch_static_branch(struct static_key *key,
 					       bool branch)
 {
 	asm_volatile_goto(
-		"	.option push				\n\t"
-		"	.option norelax				\n\t"
-		"	.option norvc				\n\t"
+#ifdef CONFIG_RISCV_ISA_C
+		"1:	c.nop					\n\t"
+#else
 		"1:	nop					\n\t"
-		"	.option pop				\n\t"
+#endif
 		"	.pushsection	__jump_table, \"aw\"	\n\t"
 		"	.align		" RISCV_LGPTR "		\n\t"
 		"	.long		1b - ., %l[label] - .	\n\t"
@@ -39,11 +43,14 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
 						    bool branch)
 {
 	asm_volatile_goto(
+#ifdef CONFIG_RISCV_ISA_C
+		"1:	c.j		%l[label]		\n\t"
+#else
 		"	.option push				\n\t"
 		"	.option norelax				\n\t"
-		"	.option norvc				\n\t"
 		"1:	jal		zero, %l[label]		\n\t"
 		"	.option pop				\n\t"
+#endif
 		"	.pushsection	__jump_table, \"aw\"	\n\t"
 		"	.align		" RISCV_LGPTR "		\n\t"
 		"	.long		1b - ., %l[label] - .	\n\t"
diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index e6694759dbd0..64a4e5df093d 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -11,21 +11,52 @@
 #include <asm/bug.h>
 #include <asm/patch.h>
 
+#ifdef CONFIG_RISCV_ISA_C
+#define RISCV_INSN_C_NOP 0x0001U
+#define RISCV_INSN_C_JAL 0xa001U
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
+#ifdef CONFIG_RISCV_ISA_C
+		if (WARN_ON(offset & 1 || offset < -2048 || offset >= 2048))
+			return;
 
+		/*
+		 * 001 | imm[11|4|9:8|10|6|7|3:1|5] 01 - C.JAL
+		 */
+		insn = RISCV_INSN_C_JAL |
+			(((u16)offset & GENMASK(5, 5)) >> (5 - 2)) |
+			(((u16)offset & GENMASK(3, 1)) << (3 - 1)) |
+			(((u16)offset & GENMASK(7, 7)) >> (7 - 6)) |
+			(((u16)offset & GENMASK(6, 6)) << (7 - 6)) |
+			(((u16)offset & GENMASK(10, 10)) >> (10 - 8)) |
+			(((u16)offset & GENMASK(9, 8)) << (9 - 8)) |
+			(((u16)offset & GENMASK(4, 4)) << (11 - 4)) |
+			(((u16)offset & GENMASK(11, 11)) << (12 - 11));
+	} else {
+		insn = RISCV_INSN_C_NOP;
+	}
+#else
 		if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
 			return;
 
+		/*
+		 * imm[20|10:1|11|19:12] | rd | 1101111 - JAL
+		 */
 		insn = RISCV_INSN_JAL |
 			(((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
 			(((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
@@ -34,6 +65,7 @@ void arch_jump_label_transform(struct jump_entry *entry,
 	} else {
 		insn = RISCV_INSN_NOP;
 	}
+#endif
 
 	mutex_lock(&text_mutex);
 	patch_text_nosync(addr, &insn, sizeof(insn));
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
