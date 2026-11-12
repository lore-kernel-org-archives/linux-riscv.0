Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D44606A33A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ybCghUMu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XiYTODCK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xlD0siwDgpntB4qPjJpVN/M3h77PR9JI05I2+L4oJV4=; b=ybCghUMuk5OdxltnsBnTzvR0ID
	Gtlk8OVNSVnJHkq0rr7bAW8m11BwbQazQgxF+apKcwapwUf51dLzkPbeKkQoJMab291FZ4zAacjj8
	K9IFOJRP3FvE1rJ9hRn7sGTAmmOJAgXjKr3fqxrVjncwXFg+FzarnC5MwKQPjW+igAy/L7XnqOefc
	nTfLx8DBDvpHWDaSc0D1zyQqqN3RYHCoLVOLIMOZ+g5Z0fEfAll83qyrXzXm+0PlP5OKK5ER9kDoe
	TaYVgNpTsnkMfbYkHg9Be+Anqa/ZwFGoeT3Q2JXKT226tVGevg5uvcKtdzPHbzcYV9dAbV8jfXMEe
	W8jKoo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSGu-00000009Z01-1VN9;
	Thu, 12 Nov 2026 10:43:12 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSGq-00000009YzN-2Eoy
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 10:43:11 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36e795af1d4so619647eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 02:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480188; x=1795084988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FW2hvTJ6oKMdB56KMNh0AgfhMqiRWnu0NMMSe8aH5CM=;
        b=XiYTODCKnEB/y1v8OubsjpAkvFqislwpmifP62RNQDvKGUn2GKSknrO9I2ZPr6UUWw
         6iTKHCP4geOwaH4vcTZDOaXInEIvGMEdCwjgOUUZZymK06clTSr0Qg1wWv51T09ddkiF
         jc+8t42nbJJxgR/wm+GZ5X/SeimPD2dNFeVuKJIXqtR22kFn93U63Xq4Q2bmkjOlm4HG
         ZZ6z4aNGI1UDiZDbTKv2t9iPwyqm+66A0GDlaXrV8sCCuZaJpsr7D0n4rD8fIxl5Yzs3
         UVSZ83CE2r0JroJqxrp8OhBE0cN/blSdpW3ZeguHOdrOuCahGP/5GSADQJYoDndg3+gr
         Bhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480188; x=1795084988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FW2hvTJ6oKMdB56KMNh0AgfhMqiRWnu0NMMSe8aH5CM=;
        b=LGq4vFi1JM/ahVp8oJtRabX5ndS5vFjOr956oHOio463lRRIvwQFz1LRNbOlBtFxZ0
         Jl6laeXGfyG6mOdhoMs96+6yQ/2ESXa9VHmYy7JlyxUCVm9ZqdRBsaWtE7RThHv9RPTh
         3Unj/pS2xZiOgQvol3VmlSzSmCZZNSaLj/ewAsPhFslmC3CqAEssPtcNN29t1dmD7Qoa
         nlA9n5XFt3vKJ67XxNzFC43D3rx1ApJ/Lk1Kp+kQSuRcqBvFQQI6Y9BsDazMFyeVF7Ul
         7joRZy0ibJdD2wNLnAz3fzpbK4C1rQld1qayPo8vqG6O2wHIRUJde/NaeH/5tbKfUioZ
         n0Hg==
X-Forwarded-Encrypted: i=1; AL+hErFlEkzLSGCuEYtkuqTYZKPb0mqKPZLyvz1fqTM8XM9Zevcqj0V0bc8S7x9UKN7YhC4hYx6eNpMVxwxj/w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8igMdjR8T0GiRdZXP7EVEzWHII1K+HhgvqeQgnIwkgM3GzqkXk
	bSSqdINZ/bxN0P+1UCCiEA6xwAu2OfJU/I9zCe+q++JSxULonBo0aVAxjaGkdi8O50A=
X-Gm-Gg: AYBFou1OHH8cY24NhaV+t/t4XUD6H+Yz21lNwOUO8iU+aqjXYihZpe/ePpuH1CjQ5kU
	Rvx9WOtfc+EpfDYDIZeAe79YXAtxbC6EpBkYgJpCToQafuy+Q7jrvdMuTejrRtf7YhjZyN0ptOE
	jYPqPaNDFcza24pemD7SqVYw1zDavULk4qN+IgOfzIHA53dhHrwOmBzi4Pi148I+WlSaiDPSKRC
	A9fDQqeoF6IXxjUWLSvFlloQbTY+mnCAjPLVAc5nT4dHADQoJ/laT7f+QsDtLUoIFq/3qWrXrXC
	+1MQrvNVCiqxwPfhh1aQ/hEoRISk9PaHfsAjyDMpTyQe+cv3/Yp0S5vcu6abx03wNnR1vl+CZIu
	xFi1emor7iwNFGdJXkCZx3uXEjkZywkBsuak/arX0iEw4wsrXHs/yGDbHxSDcfXJsHI2KCz2umH
	Pk7pKvhrH9zjZxCHzaUZzdfgAtUEXELo2kwqTbMc1iG7ZYNrdbDypoUOJE8ri1b6NMWV+sByfNd
	L3TpqDvKC6YTdKY3JKD2NI53bq+ReuUBCPmZL1mS93xKfCMP0FZfdJ1r97yldDJI8PX6y1xSIaf
	lkc+BNLoEJQFEo8sV3h6gdfGeg7JJCTmXGGluE3+OTgTdNSbqEDGgqpQuRCLcenBD7U=
X-Received: by 2002:a05:693c:639a:20b0:358:c5c9:2661 with SMTP id 5a478bee46e88-377dfd840aamr1856019eec.10.1794480187470;
        Thu, 12 Nov 2026 02:43:07 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.42.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:43:07 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 2/9] riscv: add infrastructure for preemptible this_cpu operations
Date: Thu, 12 Nov 2026 18:41:42 +0800
Message-Id: <20261112104149.38589-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_024308_606919_95501254 
X-CRM114-Status: GOOD (  19.59  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RISC-V does not provide architecture-specific this_cpu operations, so
read-modify-write operations use generic fallbacks that disable local
interrupts. Disabling preemption around each architecture-specific
operation would avoid the interrupt-off region, but would still add
preemption-count bookkeeping and a reschedule check to the common path.

Use the recoverable-GPR scheme employed by arm64 so the operations can
remain preemptible. Record the registers used for per-CPU address
generation and repair them on exception return if the task migrated.

Exception entry saves and clears the active state so handlers can use
per-CPU operations independently. Keep this protocol in common assembly
macros so NMI-like entry paths which bypass handle_exception, such as SBI
Supervisor Software Events, can preserve an interrupted operation.

The existing exception return path clears LR/SC reservations, so an
interrupted LR/SC sequence retries after its saved address is repaired.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Link: https://lore.kernel.org/r/20261108213254.67805ef0@pumpkin
Suggested-by: Jisheng Zhang <jszhang@kernel.org>
Link: https://lore.kernel.org/r/avG07pmpcLGkq5i-@xhacker
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/asm.h         | 19 ++++++++++++
 arch/riscv/include/asm/percpu.h      | 43 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/ptrace.h      | 15 ++++++++++
 arch/riscv/include/asm/thread_info.h |  1 +
 arch/riscv/kernel/Makefile           |  1 +
 arch/riscv/kernel/asm-offsets.c      |  2 ++
 arch/riscv/kernel/entry-common.c     | 32 +++++++++++++++++++++
 arch/riscv/kernel/entry.S            | 10 +++++++
 8 files changed, 123 insertions(+)
 create mode 100644 arch/riscv/kernel/entry-common.c

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 06ac38f733b0a..57af10a936d9b 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -81,6 +81,25 @@
 
 /* Common assembly source macros */
 
+/*
+ * Save and clear the active per-CPU GPR state on exception entry. Entry
+ * paths which bypass handle_exception, such as SBI Supervisor Software
+ * Events (SSE), must pair this with pcpu_gprs_exit around their handlers.
+ */
+.macro pcpu_gprs_entry tsk regs tmp
+	lhu \tmp, TASK_TI_PCPU_GPRS(\tsk)
+	REG_S \tmp, PT_PCPU_GPRS(\regs)
+	sh zero, TASK_TI_PCPU_GPRS(\tsk)
+.endm
+
+/*
+ * Restore the saved state before resuming the interrupted context. tmp must
+ * contain PT_PCPU_GPRS from the interrupted frame.
+ */
+.macro pcpu_gprs_exit tsk tmp
+	sh \tmp, TASK_TI_PCPU_GPRS(\tsk)
+.endm
+
 /*
  * NOP sequence
  */
diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index faf9a75ec66d7..59f7d44f7d3fe 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -3,12 +3,55 @@
 #ifndef __ASM_PERCPU_H
 #define __ASM_PERCPU_H
 
+#include <linux/bits.h>
+#include <linux/stringify.h>
 #include <linux/thread_info.h>
 
+#include <asm/asm.h>
 #include <asm/current.h>
+#include <asm/gpr-num.h>
 
 #define __my_cpu_offset (((struct thread_info *)current)->pcpu_offset)
 
+#define PCPU_GPR_PCP_SHIFT	0
+#define PCPU_GPR_PCP		GENMASK(4, 0)
+#define PCPU_GPR_OFF_SHIFT	5
+#define PCPU_GPR_OFF		GENMASK(9, 5)
+#define PCPU_GPR_ADDR_SHIFT	10
+#define PCPU_GPR_ADDR		GENMASK(14, 10)
+
+#define __PCPU_GPR_NUM(gpr)	".L__gpr_num_" gpr
+
+#define __PCPU_GPRS_VALUE						\
+	"("								\
+		"(" __PCPU_GPR_NUM("%[pcp]")  " << " __stringify(PCPU_GPR_PCP_SHIFT) ") | "	\
+		"(" __PCPU_GPR_NUM("%[off]")  " << " __stringify(PCPU_GPR_OFF_SHIFT) ") | "	\
+		"(" __PCPU_GPR_NUM("%[addr]") " << " __stringify(PCPU_GPR_ADDR_SHIFT) ")"	\
+	")"
+
+#define __PCPU_GPRS_ASSERT_DISTINCT					\
+	".if ((" __PCPU_GPR_NUM("%[pcp]") " == " __PCPU_GPR_NUM("%[off]") ") || "	\
+	      "(" __PCPU_GPR_NUM("%[pcp]") " == " __PCPU_GPR_NUM("%[addr]") ") || "	\
+	      "(" __PCPU_GPR_NUM("%[off]") " == " __PCPU_GPR_NUM("%[addr]") "))\n"	\
+	".error \"PCPU GPRs overlap\"\n"				\
+	".endif\n"
+
+/*
+ * Mark a region where the per-CPU offset and address registers may need to
+ * be rewritten by exception return after migration.  The three registers
+ * must remain distinct for the whole region.
+ */
+#define __PCPU_GPRS_BEGIN						\
+	__DEFINE_ASM_GPR_NUMS						\
+	__PCPU_GPRS_ASSERT_DISTINCT					\
+	"li %[off], " __PCPU_GPRS_VALUE "\n"				\
+	"sh %[off], %[gprs]\n"						\
+	REG_L " %[off], %[pcpu_offset]\n"				\
+	"add %[addr], %[pcp], %[off]\n"
+
+#define __PCPU_GPRS_END							\
+	"sh zero, %[gprs]\n"
+
 #include <asm-generic/percpu.h>
 
 #endif /* __ASM_PERCPU_H */
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index addc8188152f7..ceff8f63bc866 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -53,6 +53,8 @@ struct pt_regs {
 	unsigned long cause;
 	/* a0 value before the syscall */
 	unsigned long orig_a0;
+	/* Active preemptible per-CPU operation, if any. */
+	unsigned long pcpu_gprs;
 };
 
 #define PTRACE_SYSEMU			0x1f
@@ -145,6 +147,19 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
 	return *(unsigned long *)((unsigned long)regs + offset);
 }
 
+static inline void regs_set_register(struct pt_regs *regs,
+				     unsigned int offset, unsigned long val)
+{
+	if (unlikely(offset > MAX_REG_OFFSET))
+		return;
+
+	/* Register x0 is represented by the first, read-only slot. */
+	if (offset)
+		*(unsigned long *)((unsigned long)regs + offset) = val;
+}
+
+void noinstr riscv_pcpu_regs_fixup(struct pt_regs *regs);
+
 /**
  * regs_get_kernel_argument() - get Nth function argument in kernel
  * @regs:       pt_regs of that context
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index f10ba62b61016..51c4076763c1b 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -63,6 +63,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
 	unsigned long		pcpu_offset;
+	unsigned short		pcpu_gprs;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f54c336bf547c..bf786d5dd4de3 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -52,6 +52,7 @@ obj-y	+= alternative.o
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
+obj-y	+= entry-common.o
 obj-y	+= irq.o
 obj-y	+= process.o
 obj-y	+= ptrace.o
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index f4f7ee976cd94..38f246a691c60 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -39,6 +39,7 @@ void asm_offsets(void)
 
 	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_PCPU_OFFSET, task_struct, thread_info.pcpu_offset);
+	OFFSET(TASK_TI_PCPU_GPRS, task_struct, thread_info.pcpu_gprs);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
@@ -130,6 +131,7 @@ void asm_offsets(void)
 	OFFSET(PT_STATUS, pt_regs, status);
 	OFFSET(PT_BADADDR, pt_regs, badaddr);
 	OFFSET(PT_CAUSE, pt_regs, cause);
+	OFFSET(PT_PCPU_GPRS, pt_regs, pcpu_gprs);
 
 	OFFSET(SUSPEND_CONTEXT_REGS, suspend_context, regs);
 
diff --git a/arch/riscv/kernel/entry-common.c b/arch/riscv/kernel/entry-common.c
new file mode 100644
index 0000000000000..023d856b1679b
--- /dev/null
+++ b/arch/riscv/kernel/entry-common.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitfield.h>
+#include <linux/compiler.h>
+#include <linux/percpu.h>
+
+#include <asm/current.h>
+#include <asm/ptrace.h>
+
+/*
+ * If the interrupted context had an active per-CPU operation, rewrite its
+ * saved offset and address registers for the CPU on which it will resume.
+ */
+void noinstr riscv_pcpu_regs_fixup(struct pt_regs *regs)
+{
+	unsigned long pcpu_offset = __my_cpu_offset;
+	unsigned long gprs = regs->pcpu_gprs;
+	unsigned long pcp;
+	unsigned int reg_pcp;
+	unsigned int reg_off;
+	unsigned int reg_addr;
+
+	reg_pcp = FIELD_GET(PCPU_GPR_PCP, gprs);
+	reg_off = FIELD_GET(PCPU_GPR_OFF, gprs);
+	reg_addr = FIELD_GET(PCPU_GPR_ADDR, gprs);
+
+	/* pt_regs offset zero represents x0, followed by x1 through x31. */
+	pcp = regs_get_register(regs, reg_pcp * sizeof(unsigned long));
+	regs_set_register(regs, reg_off * sizeof(unsigned long), pcpu_offset);
+	regs_set_register(regs, reg_addr * sizeof(unsigned long),
+			  pcp + pcpu_offset);
+}
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 628b85e3915a7..65298ac828959 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -198,6 +198,8 @@ SYM_CODE_START(handle_exception)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 
+	pcpu_gprs_entry tp sp s0
+
 	/*
 	 * Set the scratch register to 0, so that if a recursive exception
 	 * occurs, the exception vector knows it came from the kernel
@@ -281,6 +283,14 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	move a0, sp
 	call riscv_v_context_nesting_end
 #endif
+	REG_L t0, PT_PCPU_GPRS(sp)
+	beqz t0, .Lpcpu_regs_restored
+	move a0, sp
+	call riscv_pcpu_regs_fixup
+	REG_L t0, PT_PCPU_GPRS(sp)
+.Lpcpu_regs_restored:
+	pcpu_gprs_exit tp t0
+
 	REG_L a0, PT_STATUS(sp)
 	restore_userssp s3, a0
 	/*
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
