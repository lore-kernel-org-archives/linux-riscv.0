Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627F7C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 09:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBROyh0Ots0S7tevd40r24E3kWO/txNXWQmYDKi7qII=; b=xs0p5tXy/WsZzS
	bVDVyXhDDZvSzY+wtwmuhvmb1+QNMNNWUdV43HQEBjh8SJ85zaHEtZ6USfwKhWmeh70/nCeG/yoih
	LNjnx5ssJe68eUu6QauzHph569wUgJLruVjSKWdBKNk77WTm+q1kPy7lOgnxXBTzTotVw9/bAVlmT
	/ll1mMjN/kv7FpThlcC3+oi/Ycdw3hT9scB0pIyDXAmfHnhjkSIC//RausPzGoiq8QQwkWxsvdeqi
	uBFNeU5ua+v2gE9C8FJioyLJ2IP2hWyBboXhgMZRnzq2Bmxrfni9SQb3PvfiMff+eJheNQ7ySYawE
	smQA5pZWyfaT8CXvbgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Sp-005Q6G-QM; Tue, 13 Sep 2022 09:44:19 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Sk-005Pvo-7N
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 09:44:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id o23so9443909pji.4
        for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kInlOshONpf3koG/2bcKuK/FoafHu6xBcU//p177H0I=;
        b=aSkc9FQF4FhdQHQXNJ1AiZc9GflxRzso0OnI+vpRnm5bOmT0q9dM+ga1rmW/gAIEM3
         RBKfkqDafpbkIz9Wk/BJ94o0ajRsdn08GJqkcdRH9mA1Biso5JQWCsAQPiXn+0OuOhm1
         xbmJa36qrGYMj/dGUzEgSnC4gf5W9KGoJkRckqk+0NgeFGNtj3lwhcOFCe4t8J3TqBI0
         cllXp96oWp+KUZVPwsQ5IYJVqJK8VFAHz+FDtjBrISRSEwJLZiyx6hHWvJoNCLgtGED+
         9R8zF23J0eg9Wu19SqczhqiZkfgsS+SVdsnEeLnaVzvINMKlGjqFTDaVQo6J8o2XUotA
         yyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kInlOshONpf3koG/2bcKuK/FoafHu6xBcU//p177H0I=;
        b=sLE5CpprPvS46yWHoexiL66xseCFEr2vGhw2YOjvdQEQ+Gg19sKyegmDugMYRdtDdX
         syOZSJeoxVnQCa/gt0DoDxdrT4WeNzv6ICNSnWe4P6edf+Shd6RaXcuEzroK8YVRoBQg
         NJZO4yJzMgtVsByyo2PBEuWBdP/Yx4Fp+NycaDwrtS5FMdZ9x0qthcdJCyjfaL9FfVhq
         6w3LNNDazW+71/DTynFufW1JlkAYDzuL4IL7YDX2ZQvZNJgl75r82wSKLt64YWCAC5fW
         A5oiFQwisogCgCx6bO2J9HZxvWwz11Jy14FuVqAFQznJVTEJ86ltStpRA69/XuOHof5D
         VFWQ==
X-Gm-Message-State: ACgBeo0E+X5SxEr7v4MVredSt7jpYEG5oXjza7d4ehDZaXKlAAaD+8KF
	GCRCbEiTyXovlXytN6lzEMtblg==
X-Google-Smtp-Source: AA6agR7xydjI8X2xpSteXLH2tK6g6xPBUDCQb6F/d3qSKrhDyKjded4/KQXFtsskBSwmbqL8zTHi6w==
X-Received: by 2002:a17:90b:384b:b0:200:3215:878b with SMTP id nl11-20020a17090b384b00b002003215878bmr3015217pjb.176.1663062250104;
        Tue, 13 Sep 2022 02:44:10 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79e1c000000b00543236e83e6sm4904428pfq.22.2022.09.13.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:44:09 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	ardb@kernel.org
Cc: greentime.hu@sifive.com,
	zong.li@sifive.com,
	andy.chiu@sifive.com,
	guoren@kernel.org,
	kernel@esmil.dk,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC v2 riscv/for-next 3/5] riscv: ftrace: use indirect jump to work with kernel preemption
Date: Tue, 13 Sep 2022 17:42:50 +0800
Message-Id: <20220913094252.3555240-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220913094252.3555240-1-andy.chiu@sifive.com>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_024414_284334_B8A63B8A 
X-CRM114-Status: GOOD (  24.49  )
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
addresses atomically. We store a 8 bytes aligned full-width absolute
address into each ftrace prologue and use a jump at front to decide
whether we should take ftrace detour. To reduce footprint of ftrace
prologues, we clobber t0, and we move ra (re-)storing into
ftrace_{regs_}caller. This is similar to ARM64, which also clobbers x9 at
each prologue.

Also, we initialize the target at startup to take care of a case where
REG_L happened before the update of the ftrace target.

.align 2  # if it happen to be 8B-aligned
ftrace_prologue:
p|	{j	func} | {auipc	t0}
	j	ftrace_cont
p|	.dword	0x? <=== storing the address to a 8B aligned space can be
			 considered atomic to read sides using REG_L
ftrace_cont:
	REG_L	t0, 8(t0) <=== read side
	jalr	t0, t0
func:
	xxx
	ret

.align 2  # if it is 4B but not 8B-aligned
ftrace_prologue:
p|	{j	func} | {auipc	t0}
	REG_L	t0, 0xc(t0) <=== read side
	j	ftrace_cont
p|	.dword	0x? <=== the target address
ftrace_cont:
	jalr	t0, t0
func:
	xxx
	ret

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/ftrace.h |  24 -----
 arch/riscv/kernel/ftrace.c      | 173 ++++++++++++++++++++++----------
 arch/riscv/kernel/mcount-dyn.S  |  69 ++++++++++---
 3 files changed, 176 insertions(+), 90 deletions(-)

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
index 2086f6585773..84b9e280dd1f 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -23,31 +23,29 @@ void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
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
 
@@ -57,55 +55,96 @@ static int ftrace_check_current_call(unsigned long hook_pos,
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
+ * Place 4 instructions and a destination address in the patchable function
+ * entry.
  *
  * So the opcodes is:
- * 0: 0xfe113c23 (sd)/0xfe112e23 (sw)
- * 1: 0x???????? -> auipc
- * 2: 0x???????? -> jalr
- * 3: 0xff813083 (ld)/0xffc12083 (lw)
+ * INSN_SKIPALL  : J     PC + 0x18 (when disabled, jump to the function)
+ * INSN_AUIPC    : AUIPC T0, 0 (when enabled, load address of trampoline)
+ * INSN_LOAD(off): REG_L T0, off(T0) (load address stored in the tramp)
+ * INSN_SKIPTRAMP: J     PC + 0x10 (skip tramp since they are not instructions)
+ * INSN_JALR     : JALR  T0, T0 (jump to the destination)
+ *
+ * At runtime, we want to patch the jump target atomically in order to work with
+ * kernel preemption. If we patched with a pair of AUIPC + JALR and a task was
+ * preempted after loading upper bits with AUIPC. Then things would mess up if
+ * we updated the jump target before the task were switched back.
+ *
+ * We also want to align all patchable function entries to 4-byte boundaries and,
+ * the jump target to a 8 Bytes aligned address so that each of them could be
+ * natually updated and observed by patching and running cores.
+ *
+ * To make sure target addresses are 8-byte aligned, we have to consider
+ * following scenarios:
+ *
+ * First if the starting address of the patchable entry is aligned to an 8-byte
+ * boundary:
+ * | ADDR   | COMPILED | DISABLED         | ENABLED                |
+ * +--------+----------+------------------+------------------------+
+ * | 0x00   | NOP      | J     FUNC       | AUIPC T0, 0            |
+ * | 0x04   | NOP      | J     0x10                                |
+ * | 0x08   | NOP      | 8-byte aligned target address (low)       |
+ * | 0x0C   | NOP      |                               (high)      |
+ * | 0x10   | NOP      | REG_L T0, 8(T0)                           |
+ * | 0x14   | NOP      | JALR  T0, T0                              |
+ * | FUNC   | X                                                    |
+ *
+ * If not, then it starts at a 4- but not 8-byte aligned address. In such cases,
+ * We re-arrange code and the trampoline in order to natually align it.
+ * | ADDR   | COMPILED | DISABLED         | ENABLED                |
+ * +--------+----------+------------------+------------------------+
+ * | 0x04   | NOP      | J     FUNC       | AUIPC T0, 0            |
+ * | 0x08   | NOP      | REG_L T0, 0xC(T0)                         |
+ * | 0x0C   | NOP      | J     0x18                                |
+ * | 0x10   | NOP      | 8-byte aligned target address (low)       |
+ * | 0x14   | NOP      |                               (high)      |
+ * | 0x18   | NOP      | JALR  T0, T0                              |
+ * | FUNC   | X                                                    |
  */
+
 #if __riscv_xlen == 64
-#define INSN0	0xfe113c23
-#define INSN3	0xff813083
-#elif __riscv_xlen == 32
-#define INSN0	0xfe112e23
-#define INSN3	0xffc12083
+#define INSN_LD_T0_OFF(off) ((0x2b283) | ((off) << 20))
+# elif __riscv_xlen == 32
+#define INSN_LD_T0_OFF(off) ((0x2a283) | ((off) << 20))
 #endif
 
-#define FUNC_ENTRY_SIZE	16
-#define FUNC_ENTRY_JMP	4
+#define INSN_SKIPALL	0x0180006f
+#define INSN_AUIPC	0x00000297
+#define INSN_LOAD(off)	INSN_LD_T0_OFF(off)
+#define INSN_SKIPTRAMP	0x00c0006f
+#define INSN_JALR	0x000282e7
+#define INSN_SIZE	4
 
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned int call[4] = {INSN0, 0, 0, INSN3};
-	unsigned long target = addr;
-	unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
-
-	call[1] = to_auipc_insn((unsigned int)(target - caller));
-	call[2] = to_jalr_insn((unsigned int)(target - caller));
+	unsigned int call[1] = {INSN_AUIPC};
+	void *tramp;
+	unsigned long patch_addr = rec->ip;
+
+	if (IS_ALIGNED(patch_addr, 8)) {
+		tramp = (void *) (patch_addr + 0x8);
+	} else if (IS_ALIGNED(patch_addr, 4)) {
+		tramp = (void *) (patch_addr + 0xc);
+	} else {
+		pr_warn("cannot patch: function must be 4-Byte or 8-Byte aligned\n");
+		return -EINVAL;
+	}
+	WARN_ON(!IS_ALIGNED((unsigned long)tramp, 8));
+	patch_insn_write(tramp, &addr, sizeof(unsigned long));
 
-	if (patch_text_nosync((void *)rec->ip, call, FUNC_ENTRY_SIZE))
+	if (patch_text_nosync((void *)patch_addr, &call, INSN_SIZE))
 		return -EPERM;
 
 	return 0;
@@ -114,14 +153,49 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 		    unsigned long addr)
 {
-	unsigned int nops[4] = {NOP4, NOP4, NOP4, NOP4};
+	unsigned int nops[1] = {INSN_SKIPALL};
+	unsigned long patch_addr = rec->ip;
 
-	if (patch_text_nosync((void *)rec->ip, nops, FUNC_ENTRY_SIZE))
+	if (patch_text_nosync((void *)patch_addr, nops, INSN_SIZE))
 		return -EPERM;
 
 	return 0;
 }
 
+extern void ftrace_no_caller(void);
+static void ftrace_make_default_tramp(unsigned int *tramp)
+{
+	*((unsigned long *)tramp) = (unsigned long) &ftrace_no_caller;
+}
+
+int __ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec,
+		    unsigned long addr)
+{
+	unsigned int nops[6];
+	unsigned int *tramp;
+	unsigned long patch_addr = rec->ip;
+
+	nops[0] = INSN_SKIPALL;
+	if (IS_ALIGNED(patch_addr, 8)) {
+		nops[1] = INSN_SKIPTRAMP;
+		nops[4] = INSN_LOAD(0x8);
+		tramp = &nops[2];
+	} else if (IS_ALIGNED(patch_addr, 4)) {
+		nops[1] = INSN_LOAD(0xc);
+		nops[2] = INSN_SKIPTRAMP;
+		tramp = &nops[3];
+	} else {
+		pr_warn("start address must be 4-Byte aligned\n");
+		return -EINVAL;
+	}
+	ftrace_make_default_tramp(tramp);
+	nops[5] = INSN_JALR;
+
+	if (patch_text_nosync((void *)patch_addr, nops, sizeof(nops)))
+		return -EPERM;
+
+	return 0;
+}
 
 /*
  * This is called early on, and isn't wrapped by
@@ -135,7 +209,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	int out;
 
 	ftrace_arch_code_modify_prepare();
-	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
+	out = __ftrace_init_nop(mod, rec, MCOUNT_ADDR);
 	ftrace_arch_code_modify_post_process();
 
 	return out;
@@ -158,17 +232,14 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
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
index d171eca623b6..f8ee63e4314b 100644
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
 
@@ -138,9 +147,18 @@
 
 	addi	sp, sp, PT_SIZE_ON_STACK
 	addi	sp, sp, SZREG
+	mv	t0, ra # t0 is equal to ra here
+	REG_L	ra, -SZREG(sp)
 	.endm
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
+# perform a full fence before re-running the ftrae entry if we run into this
+ENTRY(ftrace_no_caller)
+	fence	rw, rw
+	fence.i
+	jr	-FENTRY_RA_OFFSET(t0)
+ENDPROC(ftrace_no_caller)
+
 ENTRY(ftrace_caller)
 	SAVE_ABI
 
@@ -150,9 +168,9 @@ ENTRY(ftrace_caller)
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
@@ -161,12 +179,12 @@ ftrace_call:
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
@@ -179,9 +197,9 @@ ENTRY(ftrace_regs_caller)
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
@@ -190,12 +208,33 @@ ftrace_regs_call:
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
+.align RISCV_LGPTR
+ftrace_call:
+	.global ftrace_call
+	RISCV_PTR ftrace_stub
+
+.align RISCV_LGPTR
+ftrace_graph_call:
+	.global ftrace_graph_call
+	RISCV_PTR ftrace_stub
+
+.align RISCV_LGPTR
+ftrace_regs_call:
+	.global ftrace_regs_call
+	RISCV_PTR ftrace_stub
+
+.align RISCV_LGPTR
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
