Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10086C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTJOpvtWEwRkzCQ/6ltEpcWwU2nj4Vd5O9G4uS72AdQ=; b=tL4lhO7+wSdo49
	nlaHlVhgHSO5UEYFm5MMFphd9tYwAq3XE5iUbN7bLkQ5jx8yt05STNXl0d5EEWL9lA9akewP2ZKLB
	Jh1J4C+cV9hbPdjZTz7qU477LBDqnFqqvGWHq8l1iDQQ7kmzI1qqJLsXf1yjXygjCdO3xQadGjP17
	fb2GqanFjY0S17ig6mcw0KN+85/ozLp9O8+xCfPMA7WnYtKf7cp5UmadbbthJZguHfJ0z/LTZ7dww
	Yx6FXMrCtHr5M0OU3VZ4dkOzKjxvIabX6UdgIVjiPGhevCEfQ7c3QBqFDDxtgfoMNYR2LeqpOd2Wh
	2uo5eVHcS2eAnJ/To2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVHH-003HSg-GK; Tue, 08 Mar 2022 08:33:07 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVHD-003HQv-Sh
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 08:33:05 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so1741402pju.2
 for <linux-riscv@lists.infradead.org>; Tue, 08 Mar 2022 00:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZmRu5iPq+rZc2Y1syAMSmiWiRvUjTYHIumBZ9hbpvfc=;
 b=Mq0Qp3cAMggf8iRYLnjwSqCWFAoSYHSQ3ynnUNU+rERy+oLzaIBHXpjecmjpPTx47A
 6rz38hwnvdHymFwIET7tM633nzzK+nalxCT0MlZLk6UTCAlNzuaqOdJlzxw9cDAFh8OS
 v4BrIarTMrOonlI5va7KQQCUbs1jrqkJd0SwEsBpShCGWz3Zm+KWqt2m+sFVEO+LKU4L
 53noV85zFxUTVdseJ/nxu4TOKoXRTcI7/ufwy+nulOwDWXb6AvnabAHWPWM/pxi0l0NL
 1G0FG7BeUGOjWHWfp79FKRRyctZM++t0DYUxPL9bCmqPP3NEpURfX8Ftkl96cga9j+vU
 +CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZmRu5iPq+rZc2Y1syAMSmiWiRvUjTYHIumBZ9hbpvfc=;
 b=JQm5QFCegdGcqn0aX+BtAEwQGv+H+ol9/cE7VcFI1JForzNyUKLRQ6H4e2P/7IU4El
 nfKXWwRxnR1FygXaI8WN4M2qxqVGe/lXTF9dAqSqctWHgf8goRQW7xZwHEVhU6t7cggV
 Hke3PpWcloj9CKKRg8ozIpt4CIjQBW9BRUWWhRz6+7yzOSxqbdIvI7waGK1bM7qT3dbx
 1m/S6C6HJ/J0rqCDtaD20BG20kaznESBIHoPoeYGpXNvNeMRIe862lh2CVbSruFrlUz4
 NFs686XofVQlItZRdhWmFQ0/i2eGVYnUELB09IjM8EpwxKYETp9dKsKLotrKyQZA2Uxe
 oSRA==
X-Gm-Message-State: AOAM533SvulTtLfcTaKtlcLMFT/s4u65caZUmuZdB8PRuvzpAkhvKvl/
 8Plhl/hyCo8y5j3NgR8DpfynkA==
X-Google-Smtp-Source: ABdhPJztuyOzxPl4MWq3ZnjfRBqY5P6E8m8U2QrlNtQZL9vpeXoJmT85kp+u2VTzrfkkzq5wxxGAMQ==
X-Received: by 2002:a17:902:e886:b0:151:ed65:fd87 with SMTP id
 w6-20020a170902e88600b00151ed65fd87mr8472408plg.161.1646728381885; 
 Tue, 08 Mar 2022 00:33:01 -0800 (PST)
Received: from localhost.localdomain (36-226-208-100.dynamic-ip.hinet.net.
 [36.226.208.100]) by smtp.gmail.com with ESMTPSA id
 x6-20020a17090aa38600b001bce781ce03sm1912854pjp.18.2022.03.08.00.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:33:01 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: palmer@dabbelt.com,
	mathieu.desnoyers@efficios.com
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [PATCH v4 1/2] RISC-V: Add support for restartable sequence
Date: Tue,  8 Mar 2022 16:32:52 +0800
Message-Id: <20220308083253.12285-2-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308083253.12285-1-vincent.chen@sifive.com>
References: <20220308083253.12285-1-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_003303_976312_8E904BA8 
X-CRM114-Status: GOOD (  13.24  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add calls to rseq_signal_deliver() and rseq_syscall() to introduce RSEQ
support.

1. Call the rseq_signal_deliver() function to fixup on the pre-signal
   frame when a signal is delivered on top of a restartable sequence
   critical section.

2. Check that system calls are not invoked from within rseq critical
   sections by invoking rseq_signal() from ret_from_syscall(). With
   CONFIG_DEBUG_RSEQ, such behavior results in termination of the
   process with SIGSEGV.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 arch/riscv/Kconfig         | 1 +
 arch/riscv/kernel/entry.S  | 4 ++++
 arch/riscv/kernel/signal.c | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..67a671b099b6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -101,6 +101,7 @@ config RISCV
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_RSEQ
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select MODULES_USE_ELF_RELA if MODULES
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ed29e9c8f660..56ada2a583fa 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -225,6 +225,10 @@ ret_from_syscall:
 	 * (If it was configured with SECCOMP_RET_ERRNO/TRACE)
 	 */
 ret_from_syscall_rejected:
+#ifdef CONFIG_DEBUG_RSEQ
+	move a0, sp
+	call rseq_syscall
+#endif
 	/* Trace syscalls, but only if requested by the user. */
 	REG_L t0, TASK_TI_FLAGS(tp)
 	andi t0, t0, _TIF_SYSCALL_WORK
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index c2d5ecbe5526..16da3c3b53a1 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -258,6 +258,8 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 		}
 	}
 
+	rseq_signal_deliver(ksig, regs);
+
 	/* Set up the stack frame */
 	ret = setup_rt_frame(ksig, oldset, regs);
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
