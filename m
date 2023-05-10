Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BCEC77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHAN7BASMBLKR4UKaRF0jsnaoyaXe4V+8P+QPCWYBwM=; b=WqVLyBzYK7OHLC
	IYdzFSamstibn92YMRXPI4JtCbjoPyVM0D1N1iBWHG9k+dSn1MvcSxJz6mbww5+jEA8MyR/7+LeUB
	d5lV81RstiObGN7PFx0SVYQrUy4K9/Pc9qlfN/W93DjJ1AmtgTQ5Xj0OFCvTKb6LPUN7n0rDFfvjm
	rdIgnKnB2MdsUcwmAy+ZI0IBocaybaxP5IN7mnrivpsW5iloSGT3rJWX1p8ndCPBAptRlpWstw1rL
	aBfcNL7BW2KKd35G+XPzLL9WsKglHUzAoR82zgZY84VfrcnwYBsucr5FQ23mbfhaEz2fyowWWzYlg
	7oMudnZ2SSwPL5XR7egA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgv2-005kKJ-04;
	Wed, 10 May 2023 10:19:36 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwguz-005kHx-2N
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 10:19:35 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-517c840f181so3608836a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683713969; x=1686305969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5vFEEjmnopDHc0xjFlK98v5d+a6ehUkb1OxTzirFXs=;
        b=MycZHAKqtatZ4GlFbUi6sg2PZR12Yb/VQzOokoxdbGJHe+MlTAHBhFPtZ5BKPygoBK
         B2MeyhOrY0UaP/fmkmLdjUOaHYR6A1E/TdGzjOaXlYa0H2ewEKI2FavlI9UYveb9lbb3
         SJJNR5WOBTnan1uhg8+i/AidIcRCJ6WKOryfBJEmkUNiX0Yd70C827SLJFmVRCxlRFUi
         DKCGIkPzqO5LDRRV9kBNFpQWKxYWqMWV3ZVEV1D6ygubMSAWe1GBwksgIkU2yw038UKb
         YCuYCnFd2GxkCM4Egf38kWeZV3K/GO7MCzXIRDTa7c0m5ZRgxISdHfOqrN0odure0JmN
         h0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683713969; x=1686305969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5vFEEjmnopDHc0xjFlK98v5d+a6ehUkb1OxTzirFXs=;
        b=SiBEdclUkAEw0POsquz97RPQv3RYSw4N3tKj/UDsMLbS7mYG5Is6npMm2mHZhRJrZ5
         HFCmqZCpxGBgF9jyj9e4BHYD7J+hJOQNBrmgUEseqhBn2kh1CdjLmCvURTaRGBUDsfcr
         pgbxkyjagAtH+5RB1zuVQQnS8E9n2JLoNghEdgMv4N169412mJwUSXqXDdh6/86HQBut
         jpmYIj5gVMpi0aR2zHiT8SBAnMLbiqki4sIb5zHmpkv30/2zfzjQALEhtYp+Ocw4M4Qa
         YSTB7Vn9j+Ga7Vqu/N8ysZtKsHuvOtGkrnIPslEtUrM2Ww9NVL8KtpXUNPfHDPJ67ogN
         mYNg==
X-Gm-Message-State: AC+VfDwC3W0UOEfB2/K2QGya7mt2eqlyVcFTjyekp7KmtLQ4TuzjIEyA
	6ZLhUEAGA62C0m4mKTpRIAQ=
X-Google-Smtp-Source: ACHHUZ7aCsulcH4KBH9sfNqATruLNWf325mTetT0mL5FTQwIuCSfyScEkxyogQ3R0zacyTIYXRqmxw==
X-Received: by 2002:a17:902:cece:b0:1a8:626:6d9d with SMTP id d14-20020a170902cece00b001a806266d9dmr22665000plg.62.1683713969110;
        Wed, 10 May 2023 03:19:29 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b001aadd0d7364sm3393419plf.83.2023.05.10.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 03:19:28 -0700 (PDT)
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
	e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH V9 3/4] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
Date: Wed, 10 May 2023 18:18:56 +0800
Message-Id: <20230510101857.2953955-4-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230510101857.2953955-1-suagrfillet@gmail.com>
References: <20230510101857.2953955-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_031933_774717_0723140D 
X-CRM114-Status: GOOD (  12.97  )
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
index f26e9f6e2fed..9d405baedb52 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -231,6 +231,7 @@ ENDPROC(ftrace_caller)
 
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 ENTRY(ftrace_regs_caller)
+	move	t1, zero
 	SAVE_ABI_REGS 1
 	PREPARE_ARGS
 
@@ -239,7 +240,10 @@ ftrace_regs_call:
 	call	ftrace_stub
 
 	RESTORE_ABI_REGS 1
+	bnez	t1,.Ldirect
 	jr t0
+.Ldirect:
+	jr t1
 ENDPROC(ftrace_regs_caller)
 
 ENTRY(ftrace_caller)
@@ -254,3 +258,9 @@ ftrace_call:
 	jr t0
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
