Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA5DC47088
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anE+J6Q0Ah2KzpOdIsyR2eykz3Ur+CZgm1/8mwMBYS8=; b=Kav6C2v7jCv0B/
	TGJe6GO5jGAiPRVMeh/+xWT5t29dm0bMZ68uzpjLMJZKdkttWIck4ZunowpMu/q05pcbYYoydUfk2
	5JA6rdNnWf8USa8YscwVPbGScoAzL2tByyjZOcW1Qh89VpmHxOkjX4An+1LqkWHG7n65nwu56loqO
	3Vc4NpE/KNruzvYOwEwWbBYh+KPdLEDlmLZP5A+vAGPaLiQ8Uvu/8waHd4m/wO8rgkq3jqG1rqnkY
	qsEtRP2o4nV9vNrBeJS9LSmYyW1yZDei1382sEbADAK1f4j+5oLl1EM4pw5P9/WIw/TuVzWBkBk2l
	vGz9XeGQ9hyzspOReoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqcI-00HZsX-Rq; Wed, 23 Nov 2022 14:20:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqcD-00HZoD-PB
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 14:20:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id x66so8842619pfx.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 06:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxhkKuZvqbaLoVEzfi+iXfk1DD9YbSKqrCN+Rkf9lGA=;
        b=mBP5+fAXxuAxdCSP7zz4tcSWzEJr0hKfXx05l9u3poc8f2lajrRDJ4om5XYRcd98cX
         NLSa3uq9HOym2r1qyYi9iYHEmbhSlyJKl/FNE5lZxwm0dzVo81wicYiH1ou3HUtugTqI
         rP4v9oD7NDJQfw2siOAoyIh7gfzl0Dgj2wrGWTbppytIC4j0Fn4EiXlXR82cRpZWKLHQ
         kujHqPeRV95YUrZxHUOXGG0YPe58U6En1STNS1KBld/YP6FHULqFQuAqRyTc8gkPuM+Q
         IlUhPgEsBIvmc5Uvd+rlFDrV3xE4ZTN2k34MiRwlB+AP0XFGtCEjv5+QbMRAUb4GpeyD
         gjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxhkKuZvqbaLoVEzfi+iXfk1DD9YbSKqrCN+Rkf9lGA=;
        b=AMmzx/E9WxwoPw/1OoIpIdp8c2w44GfLAG8P9H1dOyIWIJS0LKiLfNNkRzRH+FeH+v
         wAYOUsI8WvH9MzFnHPvpy/Oi664SYtoVsmGpUMeqd1qvFu7fub3cZYdhKKGA/nySwA8V
         lYGH8S9Nz9ccTG2ynfWdG9ImEPKvrvt8NkQD2/FZMNNt5aL3dHcfl6Y2LKlLNk1LGNYR
         3kKCEc/MG+WJ0yYiL6i+4rubMTwP5Hx2Zzh4NF1DOf7+P1vgeeV6adQSRA0thdGk55Oy
         q7cflSekPyX+La7i4j5lPSuQEFxHkMpQQo4Pz2+VmGQcTZZKSy2KElF85I79vtw5MYbV
         WNFg==
X-Gm-Message-State: ANoB5pkLdecITjEpPeVtEs7THqZWSYZhQa5XdBycpbGmTkgkXGT0Hz3G
	2bWbzl/Hnjns1vU7AJMitLs=
X-Google-Smtp-Source: AA0mqf7RhWSNHw9CyAtO67HOD5j0yS9Nu9HyQl1/3A0ZHyi4rX2EzsGLfDFDlpbeW9YxJh5zKL+jtw==
X-Received: by 2002:a63:4909:0:b0:462:8605:7fe7 with SMTP id w9-20020a634909000000b0046286057fe7mr8277358pga.445.1669213238663;
        Wed, 23 Nov 2022 06:20:38 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b0016c5306917fsm14516732plh.53.2022.11.23.06.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:20:38 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
Date: Wed, 23 Nov 2022 22:20:24 +0800
Message-Id: <20221123142025.1504030-2-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221123142025.1504030-1-suagrfillet@gmail.com>
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_062041_901882_78854C1F 
X-CRM114-Status: GOOD (  11.60  )
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
---
 arch/riscv/Kconfig              | 1 +
 arch/riscv/include/asm/ftrace.h | 6 ++++++
 arch/riscv/kernel/mcount-dyn.S  | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 39ec8d628cf6..d083ec08d0b6 100644
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
index 01bebb28eabe..be4d57566139 100644
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
index 466c6ef217b1..b89c85a58569 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -233,6 +233,7 @@ ENDPROC(ftrace_caller)
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 ENTRY(ftrace_regs_caller)
 	SAVE_ABI_REGS 1
+	REG_S	x0, PT_T1(sp)
 	PREPARE_ARGS
 
 ftrace_regs_call:
@@ -241,7 +242,10 @@ ftrace_regs_call:
 
 
 	RESTORE_ABI_REGS 1
+	bnez	t1,.Ldirect
 	jr t0
+.Ldirect:
+	jr t1
 ENDPROC(ftrace_regs_caller)
 
 ENTRY(ftrace_caller)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
