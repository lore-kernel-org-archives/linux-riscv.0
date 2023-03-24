Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B434C76195
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 03:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huJsE4YWmVJByZPwK94s7bSqXoMzsL0zRYjSp1DT9pI=; b=XcXY5H7IOd7ob2
	9CbbOljz359RRZD3JPAd0L0IxE3R1bAWm3YREkouOxcGE6ucQMKOuJd3r7AiRpqaMo9AhaJbRBKY+
	IKRzou6BzWDrDvgQqy8r1orOnvOVLvfA9+uNv9GbcD4guxFEFJth3yGfLG38LFfkvTqZGVkkC8IuR
	3Te7ZFF0wFmOW6FQfJaggOoTRUF1pTBXWB1N7El2wuN3SwZHLQzXE5T4PUk3p9AvOFHURDZQRUxAA
	IZcGADHwmcpRKXxFoA94kEJ1o7XAyeRQzfsadL5Hv5TYnhp0YVhwe1Er0oiIhexIYh69CeWy3lGZQ
	Df7+Ivpo2FMdV7tNanBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfYBs-003SxX-0b;
	Fri, 24 Mar 2023 03:34:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfYBp-003Sw0-16
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 03:34:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id o11so729495ple.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 20:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679628843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=785nkvLXLOqwUJFTFY6fK6X9RV3Nhiya91FR689lrSE=;
        b=fpPJUBJY/38xpcsJF34FALF9CVjEQAMWhBPDDm/na6hhnWg/3rU4gJPBftAmERc6cY
         0Mc54qaTDoaMYfDgbpR3aWOWcCikvj42q4NnB8xCfh+Q58V41V4GfnrTN8qSx5PWkb89
         S5J4GLKqKzOnFxrFU4+xc5gCSzo1mpyKzv9e50p3EQr6byhqi1ELedYgKOuUwV70zPjz
         6kyyVG2gHna35IxbLEEvsiuQlCa+3CYoj7sckdLDhqf9H4iHgcE9yUhCEo+874sznLGZ
         i6o2IAjGcli9kNiHH1arXWxGiN3D/+z20cMolYqVg6dVJYF81/W15SZWUFXFOPAYmcov
         ceVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679628843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=785nkvLXLOqwUJFTFY6fK6X9RV3Nhiya91FR689lrSE=;
        b=HIAyU8g5p8Z5BEmH3wtOX515k1PBc/a65P1T1Y99sGbzcMI3cC7IJ9zB+AgHHFTprO
         4hGIlil9PJR+riX3kOc7oKvokx+f4ATmDKM0SKjl6mFodRzjPyXkSzOgRcfTypr6xgD9
         0WgCoYtVFXMAkSwPEcXU27OP1+3ZCuFjnjyquM51cLTj+A/cw36uPXHOaml4WPVaUjKq
         OjxsPOktULlGlzGH+xT5xP34u4ExELbybEKAlY+lDG+d/Aw/AF1AR+BkFDR5aEBxlsfS
         s4xzYXYS5wWyfTCCW6WMqXYe+THBh71DlWYvkUcCk4JhHex1cNp934bVigwqLAvH5m9e
         b1aA==
X-Gm-Message-State: AAQBX9d5wzmS99sdGLxtIEGOG96Rv50oKssEuSq3c1KNOZbvwECNe5xs
	+TVcVbWYemFf32i6xq1e7nU=
X-Google-Smtp-Source: AKy350bgucBSfvpj3dOPdElhT92C0wbEvfTy1RgvG4nTZod13oI+HvcD0n1Mo1cpihpzAhGmvM/eqQ==
X-Received: by 2002:a17:902:e886:b0:1a0:67b1:a777 with SMTP id w6-20020a170902e88600b001a067b1a777mr1265996plg.61.1679628843698;
        Thu, 23 Mar 2023 20:34:03 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f7cd00b0019d1f42b00csm13014101plw.17.2023.03.23.20.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 20:34:03 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH V8 3/4] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
Date: Fri, 24 Mar 2023 11:33:41 +0800
Message-Id: <20230324033342.3177979-4-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230324033342.3177979-1-suagrfillet@gmail.com>
References: <20230324033342.3177979-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_203405_393965_5142BF51 
X-CRM114-Status: GOOD (  11.89  )
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
 arch/riscv/Kconfig              | 1 +
 arch/riscv/include/asm/ftrace.h | 8 ++++++++
 arch/riscv/kernel/mcount-dyn.S  | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 93d4817c9d73..17052b2dc83c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -137,6 +137,7 @@ config RISCV
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
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
index f26e9f6e2fed..7801c1c8bb5a 100644
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
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
