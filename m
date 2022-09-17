Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57F1ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLLo4HFbidSCuWbPpG1yN/2sveV2mbk6SBx7wdFZexQ=; b=wd1moEZ80pCJqa
	1j4vi0dxuZpkGIvfvBKvsoXkXrXJdsBO1pvadXdb+bxPBomM0qzB2RsCau0U6Rte9QocvXbsCkxdW
	R0LXuhQwY8flbHF0LS0h3DiqL97vSESAk+cfOn1tmjzrEG9kdtgnEw7BEIN73O7Sm8z8czGJyct1U
	eMYVyfFC/HT//6vkYPa9/Q9NkByh8zSdcx0ThoUDq5U2uHlXCBWyIevp5M7WMgvacftB/dWjT9k3I
	8aoT+hMXoWdDKX8fhxpDYQKxkN0Lq+1nurVpBQcZhdytZEFIJiLeaNZBb1Ym+strHZK6J57qtY5G0
	M5dxNvSj/8S1AI7zUDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZcO7-007w4a-Rx; Sat, 17 Sep 2022 18:17:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZcO4-007w1f-3z
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 18:17:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D33DB80DE0;
	Sat, 17 Sep 2022 18:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B72CC433D6;
	Sat, 17 Sep 2022 18:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663438673;
	bh=BFhTJIaY5iL/O+vCW81qnWIxQzhVpNEShFGJEkjT6p4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CrkNL9ktieI1Nu3Xy97E9SeHT3ygNmFYKsGZ9TiweDTPcsoFg9ZLgeFU8z9YiyzbN
	 pVVHHXUfReeB/0aHNPr/+Fl+Ne/LiuYGod8EpYe+d7hYLK3S8eyrcB21vktgNkYOYb
	 t6j/UqtMlJZ889F6iP8vYd/IV0HEhjIbZmHcxzOpKoJr4aUaqacQ55JHdc3W2UNQgS
	 q201EZjrrxn5WCmQMMbU81AnwoaRVyL3caZJrDLrhe/5ttJFZu++1ZyyZoHOUuwkun
	 qng979BDAThDrGPuKrntB1iJOvYahWBiOeD5/LW8agFyhXmIIzmk4D3HXxSCMcMcgH
	 UrlBGAaV9RUuw==
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
Subject: [PATCH] riscv: jump_label: Optimize size with RISCV_ISA_C
Date: Sat, 17 Sep 2022 14:17:42 -0400
Message-Id: <20220917181743.585512-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
References: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_111756_494180_CB23B34D 
X-CRM114-Status: GOOD (  11.67  )
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
