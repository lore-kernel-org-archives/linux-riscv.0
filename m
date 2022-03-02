Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD37C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 02:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9/ofLRgjGSETkzNB0g/89LyBWT7G+11cLHYoU5w1oE=; b=rVh3TV9w3SZlbP
	aRO2gAzTBuBkCDBcrMgTzaFUmFrWvvEkar9p1zTL160TDZKBruTJT5GUAfNkBpIMhUsxEUzPRvnxv
	tVZ5Gj7Ed7lXkhAB8Vyzu8osxPdqqff7gjYAQlFbNRA4hxXAti5XM7oL1p+reHSTMR6RwUIHKCcs4
	T2CrgTg/N+z50jvHNXqEcLZVU6eRibjHr4QyGOvslKWpv8Ld8gV1vl2oXnIPaLYoJbiIgXLHOXhXA
	Z0NuNRL2b6BM4VLA8QPEhaan+wkqLGJ4RtYAqUb+VMkattWdEhi7i6MrmdDt4liuhVJnfCUCmfX0M
	lGfA5W7LehHbRGne6Fzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPElj-0016XD-QI; Wed, 02 Mar 2022 02:31:11 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPEld-0016Va-Lk
 for linux-riscv@lists.infradead.org; Wed, 02 Mar 2022 02:31:09 +0000
Received: by mail-pj1-x1036.google.com with SMTP id bx5so520670pjb.3
 for <linux-riscv@lists.infradead.org>; Tue, 01 Mar 2022 18:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0HwkhO/okIetLnKgTA6nFHQSulHxjhbv6nRHMU34938=;
 b=AmF+VFZQUObOwrxNwZzL6TzD5Ka9NQ0m+FPUymz720tr3QwPU1+fC2CSuEvEYZbkiL
 wdMgUDYk7db+FijLOTKpTlERnk8jW+XTn4RxmV341Ch9FvI6aqA0XwV4e7sax2smzgzE
 BzZHqWMYZiD/QE8z1ZjAaW+4LjDKOf4pr7ENPyNtWLp8YZ1Rn4XyCrduI1I8RVxPo7uO
 W3tIf71u41pEBqaugpeKAqTvfyt8i3NgWGww+kgquQKQzah2kNIWoQl+yuXIdEXPq/Ic
 Xek4Aa/eB82aNNNEZ/Qh9nzuw/G6Nf174WBdZq0vNjfzqChkarD5KDI/smZw/DQ69x2J
 7cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0HwkhO/okIetLnKgTA6nFHQSulHxjhbv6nRHMU34938=;
 b=sELBZKpIzj6XeCn17jZWP9JiqADCr0DEhKMlc8dABMGYZ35Kt7Kk/Io7RHXNoyN3j/
 rdSl+7oyF08qkmm78gg0nd7oB9hukzCCAfIQ/Wopzvnh+IberTsjIvzjqBLAJTNar/7g
 M4QivD1n+BURBj6eSmmAq4zX7kyFAS/LS75zgQsfx/r3E0dUiJUku48MKDw34RKNTLlG
 IWGVcAc4TDWJMUhJt8FRk2ZTeOQQCkFo0fxn4t7zdGw+e1I7N8vDLeoh89s9JvU7Q9wW
 E4+P2Bk04JtSeXUnlLElO9nyEiHJPwAKNP+eOnogWYazW/wmXmPfU6yBsBaEi3aQPCLq
 uCqA==
X-Gm-Message-State: AOAM531iG7S50r6hLW9zBf9McoIoInN9ocYbFAwDCDzMRDerygxCR8cb
 Heo3AALPBUpYL3KXoSa2sDMR3g==
X-Google-Smtp-Source: ABdhPJxRKukW01gF44wopO2FEiimWVulRvc8z407s74ukELyuMI6csM2yjzNMNgQjJA5dyhky5amwQ==
X-Received: by 2002:a17:902:cf05:b0:14d:5249:3b1f with SMTP id
 i5-20020a170902cf0500b0014d52493b1fmr28440647plg.135.1646188264813; 
 Tue, 01 Mar 2022 18:31:04 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (36-227-186-14.dynamic-ip.hinet.net. [36.227.186.14])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a056a0022c700b004e11d3d0459sm19376809pfj.65.2022.03.01.18.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 18:31:04 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: palmer@dabbelt.com,
	mathieu.desnoyers@efficios.com
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 1/2] RISC-V: Add support for restartable sequence
Date: Wed,  2 Mar 2022 10:30:47 +0800
Message-Id: <20220302023048.6140-2-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302023048.6140-1-vincent.chen@sifive.com>
References: <20220302023048.6140-1-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_183105_730419_B29D37E7 
X-CRM114-Status: GOOD (  13.29  )
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
