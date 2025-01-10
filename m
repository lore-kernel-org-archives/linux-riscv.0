Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76DAE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Gf7K2WQQWMJhAnF5xmkCLZfurnmgI2ogL1aacxgit8=; b=KK0PE7EPPFWYs5
	m2vBab6qhkepOvqSvXLqWfjrolfSRBV5qgAan5wMs8qoreEI+7TCRY5H5pFHv/A6VQvuksjsb9X92
	ZGhy4TXmJiCoMiXV7D5wWGU7IWuILS3o8oQsebK9RN5GT+oGkvNMzqz51Rbh6kBYWnt+tyafsWoW2
	5l13Oiw6lKqNcnrZPF0WiT9Z9KWLDNAMvcJT09b/7dk50ipTW/qqmtDTVwH+0f+EQTwfdebdKVi3/
	zzfEW29Kiw2CGQbpUGkU6k4Dy2rZn65sbKmDSk5bA81SXgwO3E+xRRtUK+d9DbYuOkDQQDs+oaobQ
	yVmeMHt99YAyZD2PYGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCIQ-0000000Exog-1AKU;
	Fri, 10 Jan 2025 10:31:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCAY-0000000EvkG-2iPm
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 10:23:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361f664af5so21911505e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 02:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736504589; x=1737109389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6mWPNiKwExHnTuZnNtU1VWzWZG0am7gL84eXSeAyTw=;
        b=LcDw/Hx3FREb1kPuX8oy+3fALuMLazmEWbb3aJCWqiWcKPpyjgTm01yk45conU0ulh
         Ob+s0F4s4ktxkbV7/tqaV+7xwTgn0FXiSP189I5VDRrU6SUd7Wnni/NwrMxE9YE6P1Oc
         xv6P05eQlNxb0/O9drp+ZvqMHFGcIsuN13Z+wnP1qDVuwROWF5kqouxtw+TwyYbIu2x2
         tgBI5xfT0SwSrP+lgQKZPFBoqGHuVToDLJrGOr9ufKPTqCufRASDorFNWn/YXBzlNEdB
         hpoGq2LxvrIigob94e6HbHMNUfXBSrcJdLewZ5OK9+3GGIUKwhq7xqnpAlc0qa/4ORqg
         xrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504589; x=1737109389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6mWPNiKwExHnTuZnNtU1VWzWZG0am7gL84eXSeAyTw=;
        b=I8Z7cs5OikkPmbkPDpaWPRTDuDE2UD0YU2LpWLc2EgpY5ELxLByptTEVNUjPa1dNyl
         5o3cPDh3p7GwbVqliJ1ZWaF0y8mqLb7iD8FvrK/cTvMgrCPhhC/pIou3Ds11bb9LQYYz
         fCuF4oRKhCeBF5moXx8sjA2xQNRK7A6yQvRtn1JqU77xM3iIeM5g2yhKB9/4MKn+E0Cd
         V2y5uNHbrltyO0lONYQsEs8zTZR6d186AYpTmYtCBC/5L0DXMOyAQK4vmhxNTc0kOPMn
         v6XSct9M6942YEEXX5957RT55e4NLj7BuXjrc3sZQvMteNQ6AvoAtzxQE839n95sRiqC
         Vs5w==
X-Forwarded-Encrypted: i=1; AJvYcCWLt/nFoATSJ57UVAb1Lnp25u/IbOFZwSm+xA6x6QymbbFZhRhjiSZNpI756DNz8xfXoDfaDrsxJ6a5/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVtBiUTOkt8lYba8Ksi89Ao0UO1aREgiIIUFmNNx4qY6+NRqiQ
	GrmZWQ55tI5OANcBuBGH//3DA2AN7wFUIWgodqsXX/lGXNtHNjrt
X-Gm-Gg: ASbGncul1VDTgzlr5UAC1UYdDAVuxb1gWLb2esWEviCi8zTI38ER3rVY/nLfdOqPWLd
	bbBcLhYu7mwhfYB7LHEjy2t88xOPEo1ndRQ5hI5JNDkpnbxRqeyvnauRAPq/5IR06AESD0ffoP6
	VzxDlW0cWl9JjJ0PdRPZ/HVBUjGq2SmHcwTJcz5Ro4rMAJJL1eDQk4APF+Wle9bQA1alzNUHv9g
	336+Fd94R9pR2m3kTA+z1kXB9vPZxQq7gUJm0HFdm9OZGlqPBDNbGYX0SMfi/zWyroYuyaVGJVb
	06QRf0oI3hJaPOuhkDfM
X-Google-Smtp-Source: AGHT+IF8WuJ26kRNb1exsK3w6UlDdYN54HAB1Ij48aG9rvFFp/Got3W63c6Bxww+P+IxKRzDvqnDFA==
X-Received: by 2002:a05:600c:4f09:b0:434:a5d1:9905 with SMTP id 5b1f17b1804b1-436e27070bcmr84328935e9.26.1736504588617;
        Fri, 10 Jan 2025 02:23:08 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6401sm83187615e9.2.2025.01.10.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:23:07 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Michael Jeanson <mjeanson@efficios.com>,
	Stafford Horne <shorne@gmail.com>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] openrisc: Add HAVE_REGS_AND_STACK_ACCESS_API support
Date: Fri, 10 Jan 2025 10:22:43 +0000
Message-ID: <20250110102248.3295944-2-shorne@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250110102248.3295944-1-shorne@gmail.com>
References: <20250110102248.3295944-1-shorne@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_022310_689901_680506E6 
X-CRM114-Status: GOOD (  24.29  )
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

From: Michael Jeanson <mjeanson@efficios.com>

Support for HAVE_REGS_AND_STACK_ACCESS_API needed for restartable
sequences.

The implementation has been copied from riscv and tested with the
restartable sequences self tests.

Note, pt-regs members are 'long' on openrisc which require casts for the
api, someday we should try to update these to be 'unsigned long' as
that's what they really are.

Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
[stafford: Updated commit message]
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 arch/openrisc/Kconfig              |  1 +
 arch/openrisc/include/asm/ptrace.h | 73 ++++++++++++++++++++++-
 arch/openrisc/kernel/ptrace.c      | 96 ++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+), 1 deletion(-)

diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 3279ef457c57..f2be2a88c286 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -26,6 +26,7 @@ config OPENRISC
 	select HAVE_PCI
 	select HAVE_UID16
 	select HAVE_PAGE_SIZE_8KB
+	select HAVE_REGS_AND_STACK_ACCESS_API
 	select GENERIC_ATOMIC64
 	select GENERIC_CLOCKEVENTS_BROADCAST
 	select GENERIC_SMP_IDLE_THREAD
diff --git a/arch/openrisc/include/asm/ptrace.h b/arch/openrisc/include/asm/ptrace.h
index 1da3e66292e2..e5a282b67075 100644
--- a/arch/openrisc/include/asm/ptrace.h
+++ b/arch/openrisc/include/asm/ptrace.h
@@ -17,6 +17,7 @@
 
 #include <asm/spr_defs.h>
 #include <uapi/asm/ptrace.h>
+#include <linux/compiler.h>
 
 /*
  * Make kernel PTrace/register structures opaque to userspace... userspace can
@@ -42,6 +43,36 @@ struct pt_regs {
 			/* Named registers */
 			long  sr;	/* Stored in place of r0 */
 			long  sp;	/* r1 */
+			long  gpr2;
+			long  gpr3;
+			long  gpr4;
+			long  gpr5;
+			long  gpr6;
+			long  gpr7;
+			long  gpr8;
+			long  gpr9;
+			long  gpr10;
+			long  gpr11;
+			long  gpr12;
+			long  gpr13;
+			long  gpr14;
+			long  gpr15;
+			long  gpr16;
+			long  gpr17;
+			long  gpr18;
+			long  gpr19;
+			long  gpr20;
+			long  gpr21;
+			long  gpr22;
+			long  gpr23;
+			long  gpr24;
+			long  gpr25;
+			long  gpr26;
+			long  gpr27;
+			long  gpr28;
+			long  gpr29;
+			long  gpr30;
+			long  gpr31;
 		};
 		struct {
 			/* Old style */
@@ -66,16 +97,56 @@ struct pt_regs {
 /* TODO: Rename this to REDZONE because that's what it is */
 #define STACK_FRAME_OVERHEAD  128  /* size of minimum stack frame */
 
-#define instruction_pointer(regs)	((regs)->pc)
+#define MAX_REG_OFFSET offsetof(struct pt_regs, orig_gpr11)
+
+/* Helpers for working with the instruction pointer */
+static inline unsigned long instruction_pointer(struct pt_regs *regs)
+{
+	return (unsigned long)regs->pc;
+}
+static inline void instruction_pointer_set(struct pt_regs *regs,
+					   unsigned long val)
+{
+	regs->pc = val;
+}
+
 #define user_mode(regs)			(((regs)->sr & SPR_SR_SM) == 0)
 #define user_stack_pointer(regs)	((unsigned long)(regs)->sp)
 #define profile_pc(regs)		instruction_pointer(regs)
 
+/* Valid only for Kernel mode traps. */
+static inline unsigned long kernel_stack_pointer(struct pt_regs *regs)
+{
+	return (unsigned long)regs->sp;
+}
+
 static inline long regs_return_value(struct pt_regs *regs)
 {
 	return regs->gpr[11];
 }
 
+extern int regs_query_register_offset(const char *name);
+extern unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
+					       unsigned int n);
+
+/**
+ * regs_get_register() - get register value from its offset
+ * @regs:	pt_regs from which register value is gotten
+ * @offset:	offset of the register.
+ *
+ * regs_get_register returns the value of a register whose offset from @regs.
+ * The @offset is the offset of the register in struct pt_regs.
+ * If @offset is bigger than MAX_REG_OFFSET, this returns 0.
+ */
+static inline unsigned long regs_get_register(struct pt_regs *regs,
+					      unsigned int offset)
+{
+	if (unlikely(offset > MAX_REG_OFFSET))
+		return 0;
+
+	return *(unsigned long *)((unsigned long)regs + offset);
+}
+
 #endif /* __ASSEMBLY__ */
 
 /*
diff --git a/arch/openrisc/kernel/ptrace.c b/arch/openrisc/kernel/ptrace.c
index 5091b18eab4c..8430570d0620 100644
--- a/arch/openrisc/kernel/ptrace.c
+++ b/arch/openrisc/kernel/ptrace.c
@@ -160,6 +160,102 @@ const struct user_regset_view *task_user_regset_view(struct task_struct *task)
  * in exit.c or in signal.c.
  */
 
+struct pt_regs_offset {
+	const char *name;
+	int offset;
+};
+
+#define REG_OFFSET_NAME(r) {.name = #r, .offset = offsetof(struct pt_regs, r)}
+#define REG_OFFSET_END {.name = NULL, .offset = 0}
+
+static const struct pt_regs_offset regoffset_table[] = {
+	REG_OFFSET_NAME(sr),
+	REG_OFFSET_NAME(sp),
+	REG_OFFSET_NAME(gpr2),
+	REG_OFFSET_NAME(gpr3),
+	REG_OFFSET_NAME(gpr4),
+	REG_OFFSET_NAME(gpr5),
+	REG_OFFSET_NAME(gpr6),
+	REG_OFFSET_NAME(gpr7),
+	REG_OFFSET_NAME(gpr8),
+	REG_OFFSET_NAME(gpr9),
+	REG_OFFSET_NAME(gpr10),
+	REG_OFFSET_NAME(gpr11),
+	REG_OFFSET_NAME(gpr12),
+	REG_OFFSET_NAME(gpr13),
+	REG_OFFSET_NAME(gpr14),
+	REG_OFFSET_NAME(gpr15),
+	REG_OFFSET_NAME(gpr16),
+	REG_OFFSET_NAME(gpr17),
+	REG_OFFSET_NAME(gpr18),
+	REG_OFFSET_NAME(gpr19),
+	REG_OFFSET_NAME(gpr20),
+	REG_OFFSET_NAME(gpr21),
+	REG_OFFSET_NAME(gpr22),
+	REG_OFFSET_NAME(gpr23),
+	REG_OFFSET_NAME(gpr24),
+	REG_OFFSET_NAME(gpr25),
+	REG_OFFSET_NAME(gpr26),
+	REG_OFFSET_NAME(gpr27),
+	REG_OFFSET_NAME(gpr28),
+	REG_OFFSET_NAME(gpr29),
+	REG_OFFSET_NAME(gpr30),
+	REG_OFFSET_NAME(gpr31),
+	REG_OFFSET_NAME(pc),
+	REG_OFFSET_NAME(orig_gpr11),
+	REG_OFFSET_END,
+};
+
+/**
+ * regs_query_register_offset() - query register offset from its name
+ * @name:	the name of a register
+ *
+ * regs_query_register_offset() returns the offset of a register in struct
+ * pt_regs from its name. If the name is invalid, this returns -EINVAL;
+ */
+int regs_query_register_offset(const char *name)
+{
+	const struct pt_regs_offset *roff;
+
+	for (roff = regoffset_table; roff->name != NULL; roff++)
+		if (!strcmp(roff->name, name))
+			return roff->offset;
+	return -EINVAL;
+}
+
+/**
+ * regs_within_kernel_stack() - check the address in the stack
+ * @regs:      pt_regs which contains kernel stack pointer.
+ * @addr:      address which is checked.
+ *
+ * regs_within_kernel_stack() checks @addr is within the kernel stack page(s).
+ * If @addr is within the kernel stack, it returns true. If not, returns false.
+ */
+static bool regs_within_kernel_stack(struct pt_regs *regs, unsigned long addr)
+{
+	return (addr & ~(THREAD_SIZE - 1))  ==
+		(kernel_stack_pointer(regs) & ~(THREAD_SIZE - 1));
+}
+
+/**
+ * regs_get_kernel_stack_nth() - get Nth entry of the stack
+ * @regs:	pt_regs which contains kernel stack pointer.
+ * @n:		stack entry number.
+ *
+ * regs_get_kernel_stack_nth() returns @n th entry of the kernel stack which
+ * is specified by @regs. If the @n th entry is NOT in the kernel stack,
+ * this returns 0.
+ */
+unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
+{
+	unsigned long *addr = (unsigned long *)kernel_stack_pointer(regs);
+
+	addr += n;
+	if (regs_within_kernel_stack(regs, (unsigned long)addr))
+		return *addr;
+	else
+		return 0;
+}
 
 /*
  * Called by kernel/ptrace.c when detaching..
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
