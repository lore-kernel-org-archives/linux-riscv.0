Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE47C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4OxfQryofC1f7fqCB0IR62x/E8xX696/gw9zuedlG8=; b=BvevAQtRVhJWK4
	Oucqpzf7NajNmkcF04C7PLh5u5hNOlDUlBaHIbn/oAGdkP/wTMxLRer8Uyyy/kNAgLhI5lg6l/MVo
	3TLlXsO2DdlOP2eMnoEWGxYN1p2LeguLNrBgQQWBZ3JRAfOvLXFDeoJRK20QuLwzXzfZq3jQ85S7m
	3wEuSO7vphJEDzAu6Qwg2j+2CXQjidk36KXw0k9D1flSrl07ZnfogNk3bsGLhjtBKNkaFACwlKgB/
	Ds7nUKSrcvqvbM++zuYuiAM91OKMU9O17V6kQ5ghsOZqVgEYMU3/UxtQq8RjjEmLRCq3yernORKms
	twLmJfMRwIOtYWGBsiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2fU-008MKQ-1T;
	Thu, 11 May 2023 09:33:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2fP-008MIf-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 09:32:58 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64388cf3263so5948491b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 02:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683797574; x=1686389574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNfO2sYqLGwvbXj7b+RBDP96xK5wbSnAMcdu5du1sJ8=;
        b=eoMulosYXlZJab5DJ69Z7eSwNjOXQGja17mHz30M633x9kOzrdRevDa7ABGzmw7SDZ
         WJ7Dn+AnRqSj4SDHUmxIey0NyfZ2maR18lo93vDroKlJTTNy/NVP+6DVApP0URcFiLeM
         hW9yllx9OXV9nUBrCVl8purextKsoxykUtXedYHSE50X1LrYe/85Zvwj9MT2BLFkWzhG
         pN9wzYBuSe70XKzqkzDcMM0VcE9LEjwVJwha4px900CbJ2hQXXgCUZgK00MYiF1KxUp0
         mqpzj+Ys5QXW8oFfW9Z3kVo+NZoAJ3lMfQkKC74MfTXJFZ4aBgDuLq2Acp2ODRqYfaXS
         zasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683797574; x=1686389574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNfO2sYqLGwvbXj7b+RBDP96xK5wbSnAMcdu5du1sJ8=;
        b=FV/iJCLdcqWlaIi9Zj6a6ZCqPvQ7CyhSxvEz1VYQXnyq7ZIMZs9nqqCEsbZT715Awk
         kBBo4DzFMd8pejolG1MJSR6ISV/G185fzjXmrnTFR4Ai3LY9/GXSN0aKzaolNlBVi6Et
         TXjg9r6r5JLBiBROWthIEDTaJZARcPaThqWV/tqyP6CZpiTl/tyxzvKAJp6CyizyuYMl
         OWlLEDMJ571MsC1x/fVDSfZMZTz+QtxjxIYXPiUm1ZYu1lXu4zxG2e3jjM2MCsIYCdrO
         DP977fI+BOkRD52hFRni+uEFZKMpukJaW7SAKNAyOIhazCPJpgEhdVsECy6YjtlO2zNs
         H1HQ==
X-Gm-Message-State: AC+VfDyRjSg1J8bilx2hSHYTuq76YrDtSzqfjLJLjC8x71AImQdTEC15
	W2NbrhsslTUdwoko7P20p3o=
X-Google-Smtp-Source: ACHHUZ5tqFUzRUER4uYbdBP0mJZhbBdjxE25Tip8/gF5MrL7qlT/u9FSLspRUNnm8mXPQ+UM4wzM5g==
X-Received: by 2002:a05:6a20:8e07:b0:101:8f00:595f with SMTP id y7-20020a056a208e0700b001018f00595fmr8918036pzj.44.1683797573963;
        Thu, 11 May 2023 02:32:53 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id v16-20020aa78510000000b00627e87f51a5sm4875400pfn.161.2023.05.11.02.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 02:32:53 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	suagrfillet@gmail.com,
	jszhang@kernel.org,
	e.shatokhin@yadro.com,
	bjorn@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH V10 3/4] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
Date: Thu, 11 May 2023 17:32:33 +0800
Message-Id: <20230511093234.3123181-4-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230511093234.3123181-1-suagrfillet@gmail.com>
References: <20230511093234.3123181-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_023255_480380_B5730EA2 
X-CRM114-Status: GOOD (  12.61  )
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
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/ftrace.h |  8 ++++++++
 arch/riscv/kernel/mcount-dyn.S  | 10 ++++++++++
 3 files changed, 19 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e0632493482f..fdf0b219a02c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -144,6 +144,7 @@ config RISCV
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
+	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 84f856a3286e..84904c1e4369 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -114,6 +114,14 @@ struct ftrace_regs;
 void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 		       struct ftrace_ops *op, struct ftrace_regs *fregs);
 #define ftrace_graph_func ftrace_graph_func
+
+static inline void
+__arch_ftrace_set_direct_caller(struct pt_regs *regs, unsigned long addr)
+{
+		regs->t1 = addr;
+}
+#define arch_ftrace_set_direct_caller(fregs, addr) \
+	__arch_ftrace_set_direct_caller(&(fregs)->regs, addr)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index fb8286b80cfc..b6f4e1847d61 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -231,6 +231,7 @@ ENDPROC(ftrace_caller)
 
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 ENTRY(ftrace_regs_caller)
+	mv	t1, zero
 	SAVE_ABI_REGS 1
 	PREPARE_ARGS
 
@@ -239,7 +240,10 @@ ftrace_regs_call:
 	call	ftrace_stub
 
 	RESTORE_ABI_REGS 1
+	bnez	t1,.Ldirect
 	jr	t0
+.Ldirect:
+	jr	t1
 ENDPROC(ftrace_regs_caller)
 
 ENTRY(ftrace_caller)
@@ -254,3 +258,9 @@ ftrace_call:
 	jr	t0
 ENDPROC(ftrace_caller)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+SYM_CODE_START(ftrace_stub_direct_tramp)
+	jr	t0
+SYM_CODE_END(ftrace_stub_direct_tramp)
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
