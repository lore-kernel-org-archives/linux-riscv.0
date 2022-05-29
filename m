Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB72C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 29 May 2022 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQRDV7SuUCjZGdydSxSA1LgzKVCP2witix00oIC3wks=; b=uL1L3onKiH2b3s
	MH9Rdq4DFNe/kuErHkiPGZd4Ch68q/fVGj+cPoPZ/KePB0LX5/nf82Rj1Z+4rpWWbUOAI/W+cfOYY
	Ks8sbVKulpW0TtS7gFYrmUeswx5tNhXPe7o86KVDS6H96L16yFHkEUcXV8G8iH2iJDsuuzcatfBXX
	SbFPjOtHHJpxGTHIuzjDbSy7sgsw9UhMMTmWrYRg9YKODyp+8cKiZk9wCm1TyJyUvLA7ezwlSkT+C
	rWab+hb1gGqzS7kyJz9gZ6hDVUDOacpyRY5tPoWA5gVX3DC9vqxKXWZRGYPmFJXHDmH02xUANWPni
	pj8zI5XNM3h0Y8yCemCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1v-0043vX-Ml; Sun, 29 May 2022 14:36:31 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1r-0043tr-VG
	for linux-riscv@lists.infradead.org; Sun, 29 May 2022 14:36:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id q18so8155304pln.12
        for <linux-riscv@lists.infradead.org>; Sun, 29 May 2022 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cp8MkfQQGOtRxXxZ2O44zIQMkkzdvFinoegKkYz8NCo=;
        b=cP+XbVGxCB9u5ZD8BL5/V1w6vMzqKJOBGTCHzFrP2rNkXKHe0incyEyrqqXNlWGQ6y
         N5ZvEiJ0J4ndIptpY5VIWYmCa4d0K9hcyyA8NGwLmFiczkm9UBu8N2dCMCpidMIjv/Vf
         xizbtmy8qUPs7uzzNBQD5wWQzsasz9ELrPO7D9CzZR1S04hvjGkTRRfl1hQjAlLtsoRj
         JANAbvW7277YZ+lJTVM78Ri4NvixoDSAUt1H8r7xh7uSzftkg0XIsej5QzAuxRBTESGA
         3ciQsYMb6y09pUqUYriPBPHAoOA2MhHvmg7Bvpc58GwdMEgy9Bc8fJiq2rl9z55jJ0gh
         77UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cp8MkfQQGOtRxXxZ2O44zIQMkkzdvFinoegKkYz8NCo=;
        b=VSIzSpp3nWkyQAv+gK9Yl6G7hGUOyQdVw2k91QyXb/m7HnKEsZinlP/Cm0Bq39MzaN
         0n+sPHrnGs/qPYBf5jQ3uvFfXBEvAZkZYNZUqKVJP1Sp30BL4L6dC0OaVdYa9TsuvEko
         I6BkkGwxe975Ed7mbgcEUwmig7w3cGPHzGwsznOqzws/ENWROztlMQNLPhpkr5MzI0JF
         q+TryVYc+UkrynDGJZ0wBFuNHpkenXcTfaVrgpUwSXidk6p/zQ87eKapn3OWwYovidUW
         geTh2joCbct2AgBmzKXZlxJA4GX+k6FhfqyPbfFSEP72n0mSlR3tnYkmgj3ugjfmZHkS
         Pltw==
X-Gm-Message-State: AOAM53324oRMGtTfLfgfcreSqfcAj89Tn48WJMCYRhuJdrHfYbgXDVd/
	cM+A/QgqP/dYtcd8Bfm1t7zYv4krz33onFhh
X-Google-Smtp-Source: ABdhPJxL2fUJalTaWsinA7qhEveDyPM9P/4v0wnmChGuuU4DBVV84Gn5w/d/NxMZCCx7I3ZVShJxGg==
X-Received: by 2002:a17:90b:1d90:b0:1df:d0ae:1443 with SMTP id pf16-20020a17090b1d9000b001dfd0ae1443mr18404335pjb.122.1653834986045;
        Sun, 29 May 2022 07:36:26 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id h18-20020a056a00231200b005104c6d7941sm7066827pfh.31.2022.05.29.07.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 07:36:25 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	mingo@redhat.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org
Cc: guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: [RFC PATCH riscv/for-next 3/4] riscv: ftrace: use indirect jump to work with kernel preemption
Date: Sun, 29 May 2022 22:33:14 +0800
Message-Id: <20220529143315.3678563-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220529143315.3678563-1-andy.chiu@sifive.com>
References: <20220529143315.3678563-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_073628_059151_49404E4A 
X-CRM114-Status: GOOD (  25.17  )
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

In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
forming a jump that jumps to an address over 4K. This may cause errors
if we want to enable kernel preemption and remove dependency from
patching code with stop_machine(). For example, if a task was switched
out on auipc. And, if we changed the ftrace function before it was
switched back, then it would jump to an address that has updated 11:0
bits mixing with previous XLEN:12 part.

p: patched area performed by dynamic ftrace
ftrace_prologue:
p|	REG_S	ra, -SZREG(sp)
p|	auipc	ra, 0x? ------------> preempted
					...
				change ftrace function
					...
p|	jalr	-?(ra) <------------- switched back
p|	REG_L	ra, -SZREG(sp)
func:
	xxx
	ret

To prevent such condition, we proposed a way to load or store target
addresses atomically. We store a natually aligned 32-bit relative
address into each ftrace prologue and use a jump at front to decide
whether we should take ftrace detour. To reduce footprint of ftrace
prologues, we clobber t0 and t1 and move ra (re-)storing into
ftrace_{regs_}caller. This is similar to ARM64, which also clobbers x9 at
each prologue.

.align 4
ftrace_prologue:
p|	j	ftrace_cont <----> func
p|	.word	0x? <=== store word to a 4B aligned address can be
			 considered atomic to read sides using load word
ftrace_cont:
	auipc	t0, 0
	lw	t1, -4(t0) <=== read side
	add	t0, t0, t1
	jalr	t0, t0
func:
	xxx
	ret

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/include/asm/ftrace.h |  24 ------
 arch/riscv/kernel/ftrace.c      | 130 ++++++++++++++++++++------------
 arch/riscv/kernel/mcount-dyn.S  |  62 +++++++++++----
 3 files changed, 127 insertions(+), 89 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 04dad3380041..eaa611e491fc 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -47,30 +47,6 @@ struct dyn_arch_ftrace {
  */
 
 #define MCOUNT_ADDR		((unsigned long)MCOUNT_NAME)
-#define JALR_SIGN_MASK		(0x00000800)
-#define JALR_OFFSET_MASK	(0x00000fff)
-#define AUIPC_OFFSET_MASK	(0xfffff000)
-#define AUIPC_PAD		(0x00001000)
-#define JALR_SHIFT		20
-#define JALR_BASIC		(0x000080e7)
-#define AUIPC_BASIC		(0x00000097)
-#define NOP4			(0x00000013)
-
-#define make_call(caller, callee, call)					\
-do {									\
-	call[0] = to_auipc_insn((unsigned int)((unsigned long)callee -	\
-				(unsigned long)caller));		\
-	call[1] = to_jalr_insn((unsigned int)((unsigned long)callee -	\
-			       (unsigned long)caller));			\
-} while (0)
-
-#define to_jalr_insn(offset)						\
-	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_BASIC)
-
-#define to_auipc_insn(offset)						\
-	((offset & JALR_SIGN_MASK) ?					\
-	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_BASIC) :	\
-	((offset & AUIPC_OFFSET_MASK) | AUIPC_BASIC))
 
 /*
  * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4716f4cdc038..d4bf0e5255f6 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -25,31 +25,29 @@ int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
 }
 
 static int ftrace_check_current_call(unsigned long hook_pos,
-				     unsigned int *expected)
+				     unsigned long expected_addr)
 {
-	unsigned int replaced[2];
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned long replaced;
 
-	/* we expect nops at the hook position */
-	if (!expected)
-		expected = nops;
+	/* we expect ftrace_stub at the hook position */
+	if (!expected_addr)
+		expected_addr = (unsigned long) ftrace_stub;
 
 	/*
 	 * Read the text we want to modify;
 	 * return must be -EFAULT on read error
 	 */
-	if (copy_from_kernel_nofault(replaced, (void *)hook_pos,
-			MCOUNT_INSN_SIZE))
+	if (copy_from_kernel_nofault(&replaced, (void *)hook_pos,
+			(sizeof(unsigned long))))
 		return -EFAULT;
 
 	/*
 	 * Make sure it is what we expect it to be;
 	 * return must be -EINVAL on failed comparison
 	 */
-	if (memcmp(expected, replaced, sizeof(replaced))) {
-		pr_err("%p: expected (%08x %08x) but got (%08x %08x)\n",
-		       (void *)hook_pos, expected[0], expected[1], replaced[0],
-		       replaced[1]);
+	if (expected_addr != replaced) {
+		pr_err("%p: expected (%016lx) but got (%016lx)\n",
+		       (void *)hook_pos, expected_addr, replaced);
 		return -EINVAL;
 	}
 
@@ -59,55 +57,80 @@ static int ftrace_check_current_call(unsigned long hook_pos,
 static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
 				bool enable)
 {
-	unsigned int call[2];
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned long call = target;
+	unsigned long nops = (unsigned long)ftrace_stub;
 
-	make_call(hook_pos, target, call);
-
-	/* Replace the auipc-jalr pair at once. Return -EPERM on write error. */
+	/* Replace the target address at once. Return -EPERM on write error. */
 	if (patch_text_nosync
-	    ((void *)hook_pos, enable ? call : nops, MCOUNT_INSN_SIZE))
+	    ((void *)hook_pos, enable ? &call : &nops, sizeof(unsigned long)))
 		return -EPERM;
 
 	return 0;
 }
 
 /*
- * Put 5 instructions with 16 bytes at the front of function within
- * patchable function entry nops' area.
- *
- * 0: REG_S  ra, -SZREG(sp)
- * 1: auipc  ra, 0x?
- * 2: jalr   -?(ra)
- * 3: REG_L  ra, -SZREG(sp)
+ * Put 5 instructions and a 32-bit relative address to INSN1 with 24-byte at the
+ * front of function within patchable function entry nops' area.
  *
  * So the opcodes is:
- * 0: 0xfe113c23 (sd)/0xfe112e23 (sw)
- * 1: 0x???????? -> auipc
- * 2: 0x???????? -> jalr
- * 3: 0xff813083 (ld)/0xffc12083 (lw)
+ * INSN0_NOP: J     PC + 0x18 (jump to the real function entry)
+ * INSN0    : J     PC + 0x08 (jump to the fisrt insn)
+ * INSN1    : AUIPC T0, 0
+ * INSN2    : LW    T1, -4(T0)
+ * INSN3    : ADD   T0, T0, T1
+ * INSN4    : JALR  T0, T0
+ *
+ * At runtime, we want to patch the jump target atomically in order to work with
+ * kernel preemption. If we patched with a pair of AUIPC + JALR and a task was
+ * preempted after loading upper bits with AUIPC. Then things would mess up if
+ * we updated the jump target before the task were switched back.
+ *
+ * We also want to align all patchable function entries and, thus, the jump
+ * offset to a 4 Bytes aligned address so that each of them could be natually
+ * updated and observed by patching and running cores.
+ *
+ * | ADDR   | COMPILED | DISABLED         | ENABLED                |
+ * +--------+----------+------------------+------------------------+
+ * | 0x00   | NOP      | J     FUNC       | J  FTRACE              | <-
+ * | 0x04   | NOP      | XXXXXXXX         | 32-bit rel-jump offset | <- 4B aligned
+ * | FTRACE | NOP      | AUIPC T0, 0                               |
+ * | 0x0c   | NOP      | LW    T1, -4(T0)                          |
+ * | 0x10   | NOP      | ADD   T0, T0, T1                          |
+ * | 0x14   | NOP      | JALR  T0, T0                              |
+ * | FUNC   | X                                                    |
  */
-#if __riscv_xlen == 64
-#define INSN0	0xfe113c23
-#define INSN3	0xff813083
-#elif __riscv_xlen == 32
-#define INSN0	0xfe112e23
-#define INSN3	0xffc12083
-#endif
+#define INSN0_NOP	0x0180006f
+#define INSN0		0x0080006f
+#define INSN1		0x00000297
+#define INSN2		0xffc2a303
+#define INSN3		0x006282b3
+#define INSN4		0x000282e7
+#define INSN_SIZE	4
+
+#define FUNC_ENTRY_JMP	8
 
-#define FUNC_ENTRY_SIZE	16
-#define FUNC_ENTRY_JMP	4
+struct ftrace_prologue {
+	unsigned int insn0;
+	unsigned int jmp_target;
+};
 
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned int call[4] = {INSN0, 0, 0, INSN3};
+	struct ftrace_prologue call = { .insn0 = INSN0 };
 	unsigned long target = addr;
 	unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
 
-	call[1] = to_auipc_insn((unsigned int)(target - caller));
-	call[2] = to_jalr_insn((unsigned int)(target - caller));
+	call.jmp_target = (unsigned int)(target - caller);
+	patch_insn_write(&((struct ftrace_prologue *)rec->ip)->jmp_target,
+			 &call.jmp_target, sizeof(call.jmp_target));
+
+	/*
+	 * Make sure other cores do not get an out-dated jump target after it
+	 * jumps to INSN1.
+	 */
+	smp_wmb();
 
-	if (patch_text_nosync((void *)rec->ip, call, FUNC_ENTRY_SIZE))
+	if (patch_text_nosync((void *)rec->ip, &call, INSN_SIZE))
 		return -EPERM;
 
 	return 0;
@@ -116,14 +139,24 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 		    unsigned long addr)
 {
-	unsigned int nops[4] = {NOP4, NOP4, NOP4, NOP4};
+	unsigned int nops[1] = {INSN0_NOP};
 
-	if (patch_text_nosync((void *)rec->ip, nops, FUNC_ENTRY_SIZE))
+	if (patch_text_nosync((void *)rec->ip, nops, INSN_SIZE))
 		return -EPERM;
 
 	return 0;
 }
 
+int __ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec,
+		    unsigned long addr)
+{
+	unsigned int nops[6] = {INSN0_NOP, 0, INSN1, INSN2, INSN3, INSN4};
+
+	if (patch_text_nosync((void *)rec->ip, nops, sizeof(nops)))
+		return -EPERM;
+
+	return 0;
+}
 
 /*
  * This is called early on, and isn't wrapped by
@@ -137,7 +170,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	int out;
 
 	ftrace_arch_code_modify_prepare();
-	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
+	out = __ftrace_init_nop(mod, rec, MCOUNT_ADDR);
 	ftrace_arch_code_modify_post_process();
 
 	return out;
@@ -160,17 +193,14 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		       unsigned long addr)
 {
-	unsigned int call[2];
-	unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
 	int ret;
 
-	make_call(caller, old_addr, call);
-	ret = ftrace_check_current_call(caller, call);
+	ret = ftrace_check_current_call(rec->ip, old_addr);
 
 	if (ret)
 		return ret;
 
-	return __ftrace_modify_call(caller, addr, true);
+	return __ftrace_modify_call(rec->ip, addr, true);
 }
 #endif
 
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index d171eca623b6..6b7be23d02a0 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -13,7 +13,7 @@
 
 	.text
 
-#define FENTRY_RA_OFFSET	12
+#define FENTRY_RA_OFFSET	24
 #define ABI_SIZE_ON_STACK	72
 #define ABI_A0			0
 #define ABI_A1			8
@@ -25,7 +25,12 @@
 #define ABI_A7			56
 #define ABI_RA			64
 
+# t0 points to return of ftrace
+# ra points to the return address of traced function
+
 	.macro SAVE_ABI
+	REG_S	ra, -SZREG(sp)
+	mv	ra, t0
 	addi	sp, sp, -SZREG
 	addi	sp, sp, -ABI_SIZE_ON_STACK
 
@@ -53,10 +58,14 @@
 
 	addi	sp, sp, ABI_SIZE_ON_STACK
 	addi	sp, sp, SZREG
+	mv	t0, ra
+	REG_L	ra, -SZREG(sp)
 	.endm
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	.macro SAVE_ALL
+	REG_S	ra, -SZREG(sp)
+	mv	ra, t0
 	addi	sp, sp, -SZREG
 	addi	sp, sp, -PT_SIZE_ON_STACK
 
@@ -138,6 +147,8 @@
 
 	addi	sp, sp, PT_SIZE_ON_STACK
 	addi	sp, sp, SZREG
+	mv	t0, ra # t0 is equal to ra here
+	REG_L	ra, -SZREG(sp)
 	.endm
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
@@ -150,9 +161,9 @@ ENTRY(ftrace_caller)
 	REG_L	a1, ABI_SIZE_ON_STACK(sp)
 	mv	a3, sp
 
-ftrace_call:
-	.global ftrace_call
-	call	ftrace_stub
+ftrace_call_site:
+	REG_L	ra, ftrace_call
+	jalr	0(ra)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	addi	a0, sp, ABI_SIZE_ON_STACK
@@ -161,12 +172,12 @@ ftrace_call:
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	mv	a2, s0
 #endif
-ftrace_graph_call:
-	.global ftrace_graph_call
-	call	ftrace_stub
+ftrace_graph_call_site:
+	REG_L	ra, ftrace_graph_call
+	jalr	0(ra)
 #endif
 	RESTORE_ABI
-	ret
+	jr	t0
 ENDPROC(ftrace_caller)
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
@@ -179,9 +190,9 @@ ENTRY(ftrace_regs_caller)
 	REG_L	a1, PT_SIZE_ON_STACK(sp)
 	mv	a3, sp
 
-ftrace_regs_call:
-	.global ftrace_regs_call
-	call	ftrace_stub
+ftrace_regs_call_site:
+	REG_L	ra, ftrace_regs_call
+	jalr	0(ra)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	addi	a0, sp, PT_RA
@@ -190,12 +201,33 @@ ftrace_regs_call:
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	mv	a2, s0
 #endif
-ftrace_graph_regs_call:
-	.global ftrace_graph_regs_call
-	call	ftrace_stub
+ftrace_graph_regs_call_site:
+	REG_L	ra, ftrace_graph_regs_call
+	jalr	0(ra)
 #endif
 
 	RESTORE_ALL
-	ret
+	jr	t0
 ENDPROC(ftrace_regs_caller)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
+
+.align RISCV_SZPTR
+ftrace_call:
+	.global ftrace_call
+	RISCV_PTR ftrace_stub
+
+.align RISCV_SZPTR
+ftrace_graph_call:
+	.global ftrace_graph_call
+	RISCV_PTR ftrace_stub
+
+.align RISCV_SZPTR
+ftrace_regs_call:
+	.global ftrace_regs_call
+	RISCV_PTR ftrace_stub
+
+.align RISCV_SZPTR
+ftrace_graph_regs_call:
+	.global ftrace_graph_regs_call
+	RISCV_PTR ftrace_stub
+
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
