Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83768C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 07:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sVDgEINoT1B+0T6v2COOpRmRHsWG01LTPLUyYCl7pY=; b=iszsj2bp+oD3It
	E2CAq63sQ53mu1Vbn45w3TLZHJK37Tmz329JseDR9ksoNNYMku6DFEex/zA77Ket0pIy98WSlLYIH
	jBrJLzLqQLAwMLwaImzt5UbnDRQqP6421XeXpCAg2vkQB73paKGhT9EUWyWr1M15J4jCHc6JfOnX3
	pnlMoH+nQE+I87/ry8GKWR5udE0ba0TCpQiQ6+S00iGVpfCe70acmdV3Dc89ZgEPR0sat5dJxavAN
	5zwY/Aj8PGjcWrsAZteZh4fbiSBc7AxyUHQRddbI+3xjFhMkpesJ1yb30LDCqdzQ9kvUTInUOoIMX
	T4OGhrnrSAOLrACehWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHex5-0000000FURg-4C2Y;
	Thu, 13 Jun 2024 07:32:56 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHex3-0000000FUOy-1dor
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 07:32:55 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5bad66c6e27so294044eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263972; x=1718868772; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqGOcRG4MSO17L8Yoo0My/BpQLJGME/lNuiKW2jExFw=;
        b=jbC9gboO7QWY9qR8547jjh+ShUzll5vhObsBDrXaIbrHzIN46fg5fKGiFq7XG/SMjV
         RI6+uM/niyW6B2jX1f3+pAV7Z6z4wXa1CAtzCqJsLYE7sLllaj0JlVm4WKb84cDG7A44
         rKlffSsj+x2iPsfnNl/PgPLnpOlrfz3WcBjjXo31vI0H3cdJgffM3a8ERZAQYuIQ0h5I
         b1XNCvig2hTBzYp7Z+2XH9wDUC49jvZ+tIpFaw28lKJ5yI1PvT3tc26LkORfDfnt/Ed/
         P1WIj9lXTNdNiaIwYORcI2Th0762Jrftr3gnYp0ZsKU9UMDPP5izdzgYSle3LGiEUqcJ
         FQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263972; x=1718868772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqGOcRG4MSO17L8Yoo0My/BpQLJGME/lNuiKW2jExFw=;
        b=eENFcivFVAjTjU64a0i0AX2Ua+aqpcytpeHK9lCwHtx7kSUQxE8EQ/IIWLtAIGCKBI
         mmsgel9493VKx/YjrNh5HVHP+kQz43/YkkYsgv8lqzLbqJ/vFOxYmsLZW5NRK/9R4+TP
         gD/H/SSh6RpxQcqtmEwMwcjN+bkXjfIzJOVChZ4iDzMxRBw9qAbys+6cut2hwbJW0gNL
         XXgoWiP0Xgbtjqji0JYKYRfkRSQGE8MsoDylJWBK2WP6xal//CZJ4syhocjg8m4xk9aJ
         dRPtyCDlu2MO/A2aY/3EAV4agdToICndsxJIb7LXmnERVRrYoc971VWl85PT6NNVaCLh
         71wg==
X-Forwarded-Encrypted: i=1; AJvYcCUBZDDTSEka6iWQ/0YLZam9SDDf1n6uGWwoh8QyBXL5WpPqvWv+oeo7JoGVGc5K2xhTapT7oZr3YiuYLma2RuXr+da4/4+9QdrqeE6C+xZ9
X-Gm-Message-State: AOJu0Yyet3T2k5HQ2Wh7JEKo4JquUCzxw+y88/pR314QbXG0jSZF4l9I
	ZOyfng58EJ1vgTJG/EwqQUM9X4PI2JBzbVKVguv3m33tvsnTmGlnZkq1s7I6apHPWqCfqEEFhgr
	+
X-Google-Smtp-Source: AGHT+IH5DuWNaDmtQxAXDaBzm13SBjMPGjRqC4tR8s/HjfQ0ZY47iBUeJz4hi/y6Ws3uKj9ioyrEhA==
X-Received: by 2002:a05:6871:b29:b0:254:b3cc:a6da with SMTP id 586e51a60fabf-25514c664afmr4230304fac.29.1718263971977;
        Thu, 13 Jun 2024 00:32:51 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:32:51 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:08 +0800
Subject: [PATCH 3/8] riscv: ftrace: support fastcc in Clang for WITH_ARGS
MIME-Version: 1.0
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-3-1a538e12c01e@sifive.com>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_003253_504913_C61EB3BD 
X-CRM114-Status: GOOD (  10.15  )
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

Some caller-saved registers which are not defined as function arguments
in the ABI can still be passed as arguments when the kernel is compiled
with Clang. As a result, we must save and restore those registers to
prevent ftrace from clobbering them.

- [1]: https://reviews.llvm.org/D68559
Reported-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Closes: https://lore.kernel.org/linux-riscv/7e7c7914-445d-426d-89a0-59a9199c45b1@yadro.com/
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/ftrace.h |  7 +++++++
 arch/riscv/kernel/asm-offsets.c |  7 +++++++
 arch/riscv/kernel/mcount-dyn.S  | 16 ++++++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 9eb31a7ea0aa..5f81c53dbfd9 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -144,6 +144,13 @@ struct ftrace_regs {
 			unsigned long a5;
 			unsigned long a6;
 			unsigned long a7;
+#ifdef CONFIG_CC_IS_CLANG
+			unsigned long t2;
+			unsigned long t3;
+			unsigned long t4;
+			unsigned long t5;
+			unsigned long t6;
+#endif
 		};
 	};
 };
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index b09ca5f944f7..db5a26fcc9ae 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -497,6 +497,13 @@ void asm_offsets(void)
 	DEFINE(FREGS_SP,	    offsetof(struct ftrace_regs, sp));
 	DEFINE(FREGS_S0,	    offsetof(struct ftrace_regs, s0));
 	DEFINE(FREGS_T1,	    offsetof(struct ftrace_regs, t1));
+#ifdef CONFIG_CC_IS_CLANG
+	DEFINE(FREGS_T2,	    offsetof(struct ftrace_regs, t2));
+	DEFINE(FREGS_T3,	    offsetof(struct ftrace_regs, t3));
+	DEFINE(FREGS_T4,	    offsetof(struct ftrace_regs, t4));
+	DEFINE(FREGS_T5,	    offsetof(struct ftrace_regs, t5));
+	DEFINE(FREGS_T6,	    offsetof(struct ftrace_regs, t6));
+#endif
 	DEFINE(FREGS_A0,	    offsetof(struct ftrace_regs, a0));
 	DEFINE(FREGS_A1,	    offsetof(struct ftrace_regs, a1));
 	DEFINE(FREGS_A2,	    offsetof(struct ftrace_regs, a2));
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 745dd4c4a69c..e988bd26b28b 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -96,7 +96,13 @@
 	REG_S	x8,  FREGS_S0(sp)
 #endif
 	REG_S	x6,  FREGS_T1(sp)
-
+#ifdef CONFIG_CC_IS_CLANG
+	REG_S	x7,  FREGS_T2(sp)
+	REG_S	x28, FREGS_T3(sp)
+	REG_S	x29, FREGS_T4(sp)
+	REG_S	x30, FREGS_T5(sp)
+	REG_S	x31, FREGS_T6(sp)
+#endif
 	// save the arguments
 	REG_S	x10, FREGS_A0(sp)
 	REG_S	x11, FREGS_A1(sp)
@@ -115,7 +121,13 @@
 	REG_L	x8, FREGS_S0(sp)
 #endif
 	REG_L	x6,  FREGS_T1(sp)
-
+#ifdef CONFIG_CC_IS_CLANG
+	REG_L	x7,  FREGS_T2(sp)
+	REG_L	x28, FREGS_T3(sp)
+	REG_L	x29, FREGS_T4(sp)
+	REG_L	x30, FREGS_T5(sp)
+	REG_L	x31, FREGS_T6(sp)
+#endif
 	// restore the arguments
 	REG_L	x10, FREGS_A0(sp)
 	REG_L	x11, FREGS_A1(sp)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
