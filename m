Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9725CD6ACF7
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNGI6LV1h7hIo1JYa+ANlFNEl44e46ywhR/mUIhMsoo=; b=IIvRzNb5n3wYBo
	PtSwcwshaPBv6DkfQOlTEPJ5e7fViNbdaJWlbwUlZ3/k8/SuqOWzOIsw78jf4IluxwCqzJAQd7YGy
	0K7XEBKDg5K/WLuipQ8vaueDbLoBra9PgORvpkrW5TAEwWbM1g1t+K7u4Ki4xeHGwdhRGT7R0nb/t
	pw9pciPrBxaf/jeQXhYKzaMoISCpRW+0oMNxcEj/R8CwK5i8I26wloVtaxnkpwbK2Qj/iCh099tC7
	LjztGE2m5BNdXKpOnOmkRJDK+pFRO0OP9QfWRjxwq0iKwICFSWc62nDTI383LXje9LKS+J8OU6ATc
	6gwE5WnuF/Rr+U7/Sosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrb-0000000DkTf-0s4p;
	Wed, 27 Nov 2024 17:30:07 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrY-0000000DkSZ-3WFa
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 17:30:05 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-71d5eabaec6so1027171a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 09:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728603; x=1733333403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IR7fJnOIGqt6b1nWAQZJYrqcHCadpu+itzDI+rPODg=;
        b=MN+xatMcjx0YbB08WOm3XFldnQGu9YlJKazCoVt3v5aK5DUHjZuea/Tm8MxkMvPru8
         FYpI42qxygd+f7MdepK6JuRdom33qZl5ZtNnixUypmMh1YmcHkP6D8e0s9U9OyZkWFcw
         4Z8wcLcPYNdkA/WPs4FWWLqS/zuYkaH4tqjNk7sJqM0OGuBOs/R9MzR7kXmJHA1MJM6H
         QmGMKmgSIJ5WSwnJtMbkWp7+FFe3uTMARDGvN79P6q713SAcGiefWVSR1lkPMx0zwkxz
         K4fThntWBnNAE8MxJP/N8U3GW8YPq+5ctZVHtGVpePii/5U674NT99XyAH85HMJpZPcO
         LCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728603; x=1733333403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IR7fJnOIGqt6b1nWAQZJYrqcHCadpu+itzDI+rPODg=;
        b=uEiAA03Pv04Cj2HBSZxWy0ijNgC/ce2UBHyY+hpmlwhqR+w9tOi7c/JzTtYfkwRPG6
         rAqCsQ9hX0x2+xIJ07kYB5YmsTWbiVd8GT164rLQCcVZfvGLu1u+CTDhKYQqoYVPlmVu
         /yNgW4YQ5wNxAjVTqp5wb18eNr0Lb41p2ZSLK5ohgSCuNWX7leWFJ8pR7RV9LG7JHR1x
         EhGJ9c3g/1Q9VY/W+CpSIBh/pq4/pRBeu6l97oZXI/gmqD0fHWclSXiMeHf45Te9xluh
         J6tYD6hym3wiyWiz4aNMvdqy5v9NZaCkt1mNaXjuHP1yg2hUm0xsYfCd873cws5wTm/l
         a0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZd9CrUxI8ZYSx2iI5uMOBpioETLgyLIq9gCRrJmIEP6+MaQl7TnYZmNO/SftudqUf8kae4jOcyOa4MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0KV68+I0C1iBkhUqha601Oe//C1HrXj137SDksgkLVWmRRw97
	3v6/+ml8EMpFvQ4f4Mn9PCeXlvCm0D7RQ1OdningV8gYPOutgcTp
X-Gm-Gg: ASbGnct6FrxkqEu8iGWZriIM8Vr1gxnrhRUSRIB1oCFY5o7Rcv8SiuOFmVK7j+Yn65p
	V1hZvXpGd/roG5uWQc3fXWxVs45X0hKRB7oZ8aZedrHQP4J6QCVB33noxOonvu2kHDD/pLNiWiS
	kHzwO042aEDx5rGFXo+h3N2n3zrDMzUHgj+GxvBrt/MgryREYBkkPbcKY+F5rpzrtU3sq6WNM5s
	rva7Z+8Woa9nFneiDCvmAC+/wafghXts6wztyBjLOMTjZlAPluM//aen3iRVFJj4oQX6tPcLvBv
	xHIdp5TQwPjJXswX4Sqqt89syMAU
X-Google-Smtp-Source: AGHT+IHruXTFUTfiaojyTMlhAizY2Drw8OyNcxeu1vFbTUarM1m1Pec3RyTRvOVVRoAzScO0flWjxQ==
X-Received: by 2002:a05:6830:6e90:b0:71d:4bd9:8b98 with SMTP id 46e09a7af769-71d65d07e94mr4292715a34.25.1732728603299;
        Wed, 27 Nov 2024 09:30:03 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.29.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:30:02 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 3/7] riscv: ftrace: prepare ftrace for atomic code patching
Date: Thu, 28 Nov 2024 01:29:04 +0800
Message-Id: <20241127172908.17149-4-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_093004_880823_7A02B329 
X-CRM114-Status: GOOD (  21.93  )
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

From: Andy Chiu <andy.chiu@sifive.com>

We use an AUIPC+JALR pair to jump into a ftrace trampoline. Since
instruction fetch can break down to 4 byte at a time, it is impossible
to update two instructions without a race. In order to mitigate it, we
initialize the patchable entry to AUIPC + NOP4. Then, the run-time code
patching can change NOP4 to JALR to eable/disable ftrcae from a
function. This limits the reach of each ftrace entry to +-2KB displacing
from ftrace_caller.

Starting from the trampoline, we add a level of indirection for it to
reach ftrace caller target. Now, it loads the target address from a
memory location, then perform the jump. This enable the kernel to update
the target atomically.

The ordering of reading/updating the targert address should be guarded
by generic ftrace code, where it sends smp_rmb ipi.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/ftrace.h |  4 ++
 arch/riscv/kernel/ftrace.c      | 80 +++++++++++++++++++++------------
 arch/riscv/kernel/mcount-dyn.S  |  9 ++--
 3 files changed, 62 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 4ca7ce7f34d7..36734d285aad 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -80,6 +80,7 @@ struct dyn_arch_ftrace {
 #define JALR_T0			(0x000282e7)
 #define AUIPC_T0		(0x00000297)
 #define NOP4			(0x00000013)
+#define JALR_RANGE		(JALR_SIGN_MASK - 1)
 
 #define to_jalr_t0(offset)						\
 	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_T0)
@@ -117,6 +118,9 @@ do {									\
  * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
  */
 #define MCOUNT_INSN_SIZE 8
+#define MCOUNT_AUIPC_SIZE	4
+#define MCOUNT_JALR_SIZE	4
+#define MCOUNT_NOP4_SIZE	4
 
 #ifndef __ASSEMBLY__
 struct dyn_ftrace;
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4b95c574fd04..5ebe412280ef 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -64,42 +64,64 @@ static int ftrace_check_current_call(unsigned long hook_pos,
 	return 0;
 }
 
-static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
-				bool enable, bool ra)
+static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target, bool validate)
 {
 	unsigned int call[2];
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned int replaced[2];
+
+	make_call_t0(hook_pos, target, call);
 
-	if (ra)
-		make_call_ra(hook_pos, target, call);
-	else
-		make_call_t0(hook_pos, target, call);
+	if (validate) {
+		/*
+		 * Read the text we want to modify;
+		 * return must be -EFAULT on read error
+		 */
+		if (copy_from_kernel_nofault(replaced, (void *)hook_pos,
+					     MCOUNT_INSN_SIZE))
+			return -EFAULT;
+
+		if (replaced[0] != call[0]) {
+			pr_err("%p: expected (%08x) but got (%08x)\n",
+			       (void *)hook_pos, call[0], replaced[0]);
+			return -EINVAL;
+		}
+	}
 
-	/* Replace the auipc-jalr pair at once. Return -EPERM on write error. */
-	if (patch_insn_write((void *)hook_pos, enable ? call : nops, MCOUNT_INSN_SIZE))
+	/* Replace the jalr at once. Return -EPERM on write error. */
+	if (patch_insn_write((void *)(hook_pos + MCOUNT_AUIPC_SIZE), call + 1, MCOUNT_JALR_SIZE))
 		return -EPERM;
 
 	return 0;
 }
 
-int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
+static int __ftrace_modify_call_site(ftrace_func_t *hook_pos, ftrace_func_t target, bool enable)
 {
-	unsigned int call[2];
+	ftrace_func_t call = target;
+	ftrace_func_t nops = &ftrace_stub;
 
-	make_call_t0(rec->ip, addr, call);
-
-	if (patch_insn_write((void *)rec->ip, call, MCOUNT_INSN_SIZE))
-		return -EPERM;
+	WRITE_ONCE(*hook_pos, enable ? call : nops);
 
 	return 0;
 }
 
+int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
+{
+	unsigned long distance, orig_addr;
+
+	orig_addr = (unsigned long)&ftrace_caller;
+	distance = addr > orig_addr ? addr - orig_addr : orig_addr - addr;
+	if (distance > JALR_RANGE)
+		return -EINVAL;
+
+	return __ftrace_modify_call(rec->ip, addr, false);
+}
+
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 		    unsigned long addr)
 {
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned int nops[1] = {NOP4};
 
-	if (patch_insn_write((void *)rec->ip, nops, MCOUNT_INSN_SIZE))
+	if (patch_insn_write((void *)(rec->ip + MCOUNT_AUIPC_SIZE), nops, MCOUNT_NOP4_SIZE))
 		return -EPERM;
 
 	return 0;
@@ -114,21 +136,23 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
  */
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 {
+	unsigned int nops[2];
 	int out;
 
+	make_call_t0(rec->ip, &ftrace_caller, nops);
+	nops[1] = NOP4;
+
 	mutex_lock(&text_mutex);
-	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
+	out = patch_insn_write((void *)rec->ip, nops, MCOUNT_INSN_SIZE);
 	mutex_unlock(&text_mutex);
 
 	return out;
 }
 
+ftrace_func_t ftrace_call_dest = ftrace_stub;
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
-	int ret = __ftrace_modify_call((unsigned long)&ftrace_call,
-				       (unsigned long)func, true, true);
-
-	return ret;
+	return __ftrace_modify_call_site(&ftrace_call_dest, func, true);
 }
 
 struct ftrace_modify_param {
@@ -182,7 +206,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	if (ret)
 		return ret;
 
-	return __ftrace_modify_call(caller, addr, true, false);
+	return __ftrace_modify_call(caller, addr, true);
 }
 #endif
 
@@ -217,17 +241,17 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 	prepare_ftrace_return(&fregs->ra, ip, fregs->s0);
 }
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
-extern void ftrace_graph_call(void);
+ftrace_func_t ftrace_graph_call_dest = ftrace_stub;
 int ftrace_enable_ftrace_graph_caller(void)
 {
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, true, true);
+	return __ftrace_modify_call_site(&ftrace_graph_call_dest,
+					 &prepare_ftrace_return, true);
 }
 
 int ftrace_disable_ftrace_graph_caller(void)
 {
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, false, true);
+	return __ftrace_modify_call_site(&ftrace_graph_call_dest,
+					 &prepare_ftrace_return, false);
 }
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
 #endif /* CONFIG_DYNAMIC_FTRACE */
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index e988bd26b28b..bc06e8ab81cf 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -162,7 +162,8 @@ SYM_FUNC_START(ftrace_caller)
 	mv	a3, sp
 
 SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
-	call	ftrace_stub
+	REG_L	ra, ftrace_call_dest
+	jalr	0(ra)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	addi	a0, sp, ABI_RA
@@ -172,7 +173,8 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	mv	a2, s0
 #endif
 SYM_INNER_LABEL(ftrace_graph_call, SYM_L_GLOBAL)
-	call	ftrace_stub
+	REG_L	ra, ftrace_graph_call_dest
+	jalr	0(ra)
 #endif
 	RESTORE_ABI
 	jr	t0
@@ -185,7 +187,8 @@ SYM_FUNC_START(ftrace_caller)
 	PREPARE_ARGS
 
 SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
-	call	ftrace_stub
+	REG_L	ra, ftrace_call_dest
+	jalr	0(ra)
 
 	RESTORE_ABI_REGS
 	bnez	t1, .Ldirect
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
