Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4AAC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 03:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/izqIljjgrmA1OKdugz3k2bd5DFCrwu8CLAASlkQ/vw=; b=EPA47IkXn0EsUv
	COYci8VIR280IORwB4kuvD2tEcVvT357pTjco6hSOlwGAX0f/sA4BnF2KgxCxbb+464MM0Y3vZJ2/
	Tgkcd2y0XC1s7SdMOMZWmBgFXB9FRjUrWU4ZugXOm6fF10BVV121piUdfF/Then3nmPI9p3ivTpJ6
	5ycYOLdv1rlOFYAUfUPgWgn+pBiAVTbvxzSf516sds1I2XM3V+c/KPVllKCgftaB1FtPC22cZbVQT
	JvM+fd9ebnl+0FGV3KVxcaCTZArLUr6nzT7Ke2dJU2UldV54RrOdxdCbYXpBUhB+fbFX3uUgAC6NL
	g19kKxYDb0LlEVCl4Etw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrN0-005k7Q-Vz; Tue, 29 Nov 2022 03:33:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrMx-005k4L-Jc
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 03:33:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E666E6156E;
	Tue, 29 Nov 2022 03:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08F8C43470;
	Tue, 29 Nov 2022 03:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669692794;
	bh=Q4r5Cr1455+nAmA0pA6cVNtfAYv0E4o4IA4S7gjyv7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iL+6eAPGZAdrp5bd4YJJm4y/qkoeRodnB9xt479lkQ9l5rRVTs+xJ/SMenOxueE8i
	 U8cx+93fq8faXpWOD6/nMNLwmXjSutYbo8CJtAAR4wGVbLxrPXXo2y40VaHiCzjEp+
	 341BnVCNgTd878T06xmIww96gy2FkWHQzHToshXdAncB9ItEMAPs8uKHvbqpY60agX
	 wt410YT2vr0jjgzPl76UtUno7o7F5BHNafyDB0mZLqM0L2hq4CiAfdkrAyRpx2gg/a
	 YneExp1WylyIotnOApax1/DVh/InyAvPt3BQEOMPUNoeJko0I+uB6pzvghRzEZdXGS
	 mG4tk6vZ/zKdw==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org,
	suagrfillet@gmail.com,
	andy.chiu@sifive.com,
	mark.rutland@arm.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V4 6/7] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
Date: Mon, 28 Nov 2022 22:32:29 -0500
Message-Id: <20221129033230.255947-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221129033230.255947-1-guoren@kernel.org>
References: <20221129033230.255947-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_193315_771004_32314091 
X-CRM114-Status: GOOD (  12.79  )
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

From: Song Shuai <suagrfillet@gmail.com>

This patch adds DYNAMIC_FTRACE_WITH_DIRECT_CALLS support for RISC-V.

select the DYNAMIC_FTRACE_WITH_DIRECT_CALLS to provide the
register_ftrace_direct[_multi] interfaces allowing users to register
the customed trampoline (direct_caller) as the mcount for one or
more target functions. And modify_ftrace_direct[_multi] are also
provided for modifying direct_caller.

To make the direct_caller and the other ftrace hooks (eg. function/fgraph
tracer, k[ret]probes) co-exist, a temporary register is nominated to
store the address of direct_caller in ftrace_regs_caller. After the
setting of the address direct_caller by direct_ops->func and the
RESTORE_REGS in ftrace_regs_caller, direct_caller will be jumped to
by the `jr` inst.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Tested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig              | 1 +
 arch/riscv/include/asm/ftrace.h | 6 ++++++
 arch/riscv/kernel/mcount-dyn.S  | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1d0e5838b11b..2828537abfcd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -278,6 +278,7 @@ config ARCH_RV64I
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
+	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 84f856a3286e..4539f10fea56 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -114,6 +114,12 @@ struct ftrace_regs;
 void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 		       struct ftrace_ops *op, struct ftrace_regs *fregs);
 #define ftrace_graph_func ftrace_graph_func
+
+static inline void arch_ftrace_set_direct_caller(struct pt_regs *regs, unsigned long addr)
+{
+		regs->t1 = addr;
+}
+
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 466c6ef217b1..fef7c460f991 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -232,6 +232,7 @@ ENDPROC(ftrace_caller)
 
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 ENTRY(ftrace_regs_caller)
+	move	t1, zero
 	SAVE_ABI_REGS 1
 	PREPARE_ARGS
 
@@ -241,7 +242,10 @@ ftrace_regs_call:
 
 
 	RESTORE_ABI_REGS 1
+	bnez	t1,.Ldirect
 	jr t0
+.Ldirect:
+	jr t1
 ENDPROC(ftrace_regs_caller)
 
 ENTRY(ftrace_caller)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
