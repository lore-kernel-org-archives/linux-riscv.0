Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05DAC30658
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fIg6fVGe80hTAuvlu3gCHaQqyC/WCzJ+ApXCHU7bro=; b=jvk60xRP/gh06H
	D9SnWIhU47rqpoSxeJNFa+vcknltM7KwxxguJ4DlO3WTXA9FXyJXHux0i6ghG7PRyLDu7YfPIKhKr
	sgWwpuPar5ybnJ9/5yFCg+WR1CMi3FbVRiIIHqtJOxtd40VlDGZnmXrz1N/e+sjUgKmapnB4JMmfi
	OibIkocvimJlXpGPaLvRuZuutGQZVq1LPMDRjuiSVYVRmqnCx/GkJ3v7uSNiPiO+5oqJ5IN9H5K8E
	j4xZ2HUNqpcYsYsaul8DdKuPUg6Az4LtUQb0eeopelS/Kd1/8bthpYnVEwiZx8VWSPFNkpSDn4ENw
	7LBXU9zk807iO8Epjzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5V-0000000DZuL-1QAv;
	Fri, 28 Jun 2024 11:48:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5S-0000000DZtM-1pcH
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 11:48:20 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7066c9741b7so378784b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575298; x=1720180098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBxLbBg2C0mDR/P/oLexeudRwTh8PG2S5E6XUY0XYj8=;
        b=Ww2qO3ek/J6zzZhlUt2wdP0h9qrlwE7CAXzBJWhsAgYwS3aZeFFnqdtqpQBcdOPiF9
         4fjjpc+nnJ+s2aH0Hnse1ZoKZ76pN3n8F++jvAz7iqovYs6hkuE9WuPFjXz/0xfbWwVl
         +y6V3knj1oKe9e9fMJ8h/ciUVaVisab3s/iTgkhtgohLjBDEx0cPQZHpVamRDX50gIjN
         4dHZm7Uh5lcyYGP7kSvbGu7H8DNH21wVJKocfX1xCefd3eS/DS442dTckQDHbEwDABqT
         C7Tnk8LKwa1EhekhfLljDP8G0jWRhU84fy36BOyvhmjK1/v12i3zs0y8IfCHMd5lAD/D
         fJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575298; x=1720180098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBxLbBg2C0mDR/P/oLexeudRwTh8PG2S5E6XUY0XYj8=;
        b=SQbD5Q7MNQ2jWvDCyEpc2KM3aXFRQ00Qh0wGzfJuDhdBbMtVuAwejr3qv4IqmR1oO8
         toHttX9ona/vHtom9spS6qizTAr04xyyEwPeOxZeRR81hba6RCgVivgaSczrgMNaJpLO
         evUJq94ATOuE4U0Vc4eAi0bZYRAXWaLYYZj1ZiELgX6H3HY/ijnuRSmEUDIYagSkaK6f
         1zDotC0s4t8IxPXOFstHWdNqilCmYKfGuYB305ePlFxu6rRtbEcLztqRMcmLbzPs8A2S
         McgZ3SGcotIPy/iq7NOz/pw0Hq4wjMTo/25jA8jo6wbqFOAPRNygq4rdxp+2WfbaHEnM
         65hw==
X-Forwarded-Encrypted: i=1; AJvYcCWt47jmwTLfv8DFJX+ZjRrWlfsuSYjwT6E85fWBrY4ygOxd7kjZcxL4SRbsPNFFVE4mlAlCcOAR5dDoEYGUnI2ZuoRIBBdd9khqr4x19nZE
X-Gm-Message-State: AOJu0Yza2UvHygJNLhTzl6cQ/Z+zIYpAt9HDIbwrlWayRZ+WUIHRSUVA
	qoco68bMf8uVw2mCWg5Ow+XQyTr3OXxtjou2Bzuyjh0TVIx1YHTzNZByrX7xEWs=
X-Google-Smtp-Source: AGHT+IECg5NMB5OG9EYHIh91F3Lk8CJ30f0YqfGF81UIYveQZi0LXlob9MKuuQ4bFTTbGJMqs4SwPA==
X-Received: by 2002:a05:6a00:1796:b0:705:c0a1:61c5 with SMTP id d2e1a72fcca58-706745ab97cmr20272333b3a.20.1719575297284;
        Fri, 28 Jun 2024 04:48:17 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:17 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:47:44 +0800
Subject: [PATCH v2 1/6] riscv: ftrace: support fastcc in Clang for
 WITH_ARGS
MIME-Version: 1.0
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-1-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
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
X-CRM114-CacheID: sfid-20240628_044818_521179_6F9F1346 
X-CRM114-Status: GOOD (  10.70  )
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
Acked-by: Nathan Chancellor <nathan@kernel.org>
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
