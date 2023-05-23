Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AA7C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7I+xffHZN8SUDyp9NdcB6cdpGUJtaeYYlgj62VcSCKA=; b=X4YhsYXnicIo2h
	6B+6Mblj0wa9qcrtKUc92mqTyEzJpGw8W6ZzoTCjVUaC/esdAE0XQiEMiFHUHs3mm3A1Eh2Qpggqo
	PwQssYkefgIQfYI+jhdpob0w5RsS9dV3qqAB42vDL8dnlhIx3Mb92wjFKbz0J16pZntNyY+eovQz4
	cJRcrbKnYmwMqqi0cUX/436lS4ejTw3+kjsVVhMn04GF5r36yr2STxmAlKUclkKmleWgoUQ6B8N0s
	NNifAtjvdwogcmU5ZaNBk2eno3bEp2xayOXu9E3NXy2z10Mpgcv9AucLWz6I595E2ePXX7K7j/J3o
	SSWlzREe+huJQjzm9ufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSm-00Atre-24;
	Tue, 23 May 2023 17:06:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSj-00Atpz-1c
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 17:06:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99102634DA;
	Tue, 23 May 2023 17:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD21C433EF;
	Tue, 23 May 2023 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861576;
	bh=SFEBsgS/NuRbYn+gTRqLbgprOTjrzQzmKyN1/QnzNYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XenmqGcNT+t9qREdaU2ysYcIrUHpRMEc/ixHRS0pmUd7QY0KabDK/R6NircioTAuJ
	 C7x3Ylv1KgugarEwJ9GU+bPjhCS1Q8UUOZTWKb/IRnmSFQ0vx3TnAKOGE5gGFxeUH/
	 vuWaDnQabyFUby68WbawVbE8Y5nty4ufPSLiMoFvszoD5j5aMGQ9/8nhVE3TyfkvFS
	 lT6/qHnfvJ04hCUxy2jjo+k1GMEMfplP3blZT10wvxktFFVxpu3/1obmI737YIeLx1
	 fTecEVciQvmOw8zTVMuK7C1wUprgRIeJWue9u3DsoEPzJwqaNovFNNa/mz45MRTXna
	 ujbRbtZMYMyWQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 1/4] riscv: move options to keep entries sorted
Date: Wed, 24 May 2023 00:54:59 +0800
Message-Id: <20230523165502.2592-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230523165502.2592-1-jszhang@kernel.org>
References: <20230523165502.2592-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_100617_574527_E9504E1E 
X-CRM114-Status: GOOD (  10.98  )
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

Recently, some commits break the entries order. Properly move their
locations to keep entries sorted.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 348c0fa1fc8c..8f55aa4aae34 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -101,6 +101,11 @@ config RISCV
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
+	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
+	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
+	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
+	select HAVE_FUNCTION_GRAPH_TRACER
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
@@ -110,7 +115,6 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
-	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
@@ -119,6 +123,7 @@ config RISCV
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
+	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
@@ -142,11 +147,6 @@ config RISCV
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
-	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
-	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
-	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
-	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
