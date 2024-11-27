Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915A8D6ACF7
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 17:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pBlPr9mSkHsFxaFCwJIQIRJCYJtvVHzW8bosl9CNOA=; b=K6q29V7mlgdREN
	SBW9tlTmZNOheNgowqSuWqUapdJk/HooNAsxceVPSItiUjABCcf6Y2UsqvjQ42n8FMOloWgPKNoTz
	TKEzMjWX5j16ZEM471QOGIymhYTRg1edwimM1QvLzojG1CMa1ME0Ppk1wUEtEnZ43Y3qHqjr9aASA
	UmyqDZnN97qI+7gg+wQCmITcAqYcg3MwZGlpyCtuh5VPaN5S7pI2lBxEd2/dz6AF99dWA4RtNaOtf
	YxlbQ6OLvzdancSMQ/0h++zhLFddBB/hTQ5SjF9KQrgiJ09g9ebBYZFeZupnFZraS+s/XcB0lwShp
	ttK7WClKAG1V4Hvcz64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrR-0000000DkOy-4ASV;
	Wed, 27 Nov 2024 17:29:57 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrP-0000000DkNY-1wcT
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 17:29:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-724f74d6457so47989b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 09:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728594; x=1733333394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhqF3E4/w+YtOL58NNfG2rcUNmjyen3grJ9NA1x6juQ=;
        b=QvdIM6p6p+C2AeQSxowNyDTDj7fZvSmaXYNciXcB21LCHpDT4Zb4e2IwD5EaoH1a4e
         zvRkqWSyJSdGCd7vWSQ5Hduj1W4RcM9AfD/KAmgpZFayjboHQSQjPWj6V0woWhNwFMYk
         0Iyc/gJdayGjKU8dQGIwfmMXvDYHaGx7A3PoFyLFfR4QqOUf0ZeQlkkRILak4Jbab0tk
         BdikAUEjHyh2Htm6YPONaNKqm9IOhkuA77mfj8HcNtLjN8QWwKkC8rGGiSyLAEFUUh7Q
         MhFaoxajpbHXm3Ug+wtvDkM5A/L4iY3Cj9mFHDZoAV/42JvLEZ4HUlJnTdp6U+lCPCUd
         m5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728594; x=1733333394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhqF3E4/w+YtOL58NNfG2rcUNmjyen3grJ9NA1x6juQ=;
        b=eIx3m4YSsvkLGJ166VBygo4s/10XqTMmnAfXreCOJkfuRUzTlHX8z4MDIcKm8Ajmez
         Mmy2A4su9xqOntfjG5/KV8F/W83nT2KRldDpqRve6KF4PK10AwVvvcBLCpxSTf/6dZ+/
         VIOGBsOQwSAZI0iTpuXA9rDFyWdmq/uSIcVwBMM/bR8flseLgm4EJj+EGQBzzFJhA/ve
         lvwKPCWw8tjCzTQWn5B3JuePydSgYQDk99QgW1SdTXUOyDER1pRYlwjde1l3vD6/qCyg
         hCz3SY/remI6LvN4F/MURLA2lC3UpFl176vbqA3GVtyEYwQrHHye67z53VD8nxv209TP
         yajQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR4p5icj8Vd08WnFzaZDxHM2Ovp/5jFrvAGVxdQbzTdc0dxPvC8zdiO0/DMNuGj4tRlecuQQWSgieDMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXCiE2XFsMBolwpdQ5+Hzqrz7pCrwvqehh21SJ7hRPvhRt8pLY
	jeJyNs2Vgcns8enj7FI2CmAxy0kRzK7lagjbgw5J936ax6kRtLQv
X-Gm-Gg: ASbGncvRhfyawT4yJow6ynSi24cZbR9IRGIOYPo7EfT/ZzkK3fOOn6o7Fyrc8YJE8k9
	J1OXw8GXtshCSyb7FhemnTV21iTKG7x2ZiZOqC99BAfIjI67xOSxB/397MiU+Zn+SWvnIpQ38kL
	5Qe2UR9i9ga2pNC21+TG5/2zUzpd5ofZmbOFCyh6jUVeJe2WhV2ioxZmrKl9MlS/uhZ/QhTo+f+
	z7zaQJ3rmlj1XxhlIJdrjhH6cN1PwsnhsmNn6x970JO5Ddtw9yb6U1pDabaxwpL7UzrmyE/HpOG
	U7S1074caUcpxwnEQ0hCXs7C+eAK
X-Google-Smtp-Source: AGHT+IHe4vfUFn689BzH733Y3azaB4OQQfGNQ2U5d2DUk6y3aLJvqA63KG7l5W6jxcEPLUbmlo8oFg==
X-Received: by 2002:a05:6a00:3c89:b0:724:eac3:576a with SMTP id d2e1a72fcca58-725301a5b92mr5270747b3a.25.1732728594123;
        Wed, 27 Nov 2024 09:29:54 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.29.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:29:53 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 1/7] riscv: ftrace: support fastcc in Clang for WITH_ARGS
Date: Thu, 28 Nov 2024 01:29:02 +0800
Message-Id: <20241127172908.17149-2-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_092955_505112_CC487D29 
X-CRM114-Status: GOOD (  10.82  )
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

From: Andy Chiu <andy.chiu@sifive.com>

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
index 2cddd79ff21b..4ca7ce7f34d7 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -143,6 +143,13 @@ struct ftrace_regs {
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
index e94180ba432f..59789dfb2d5d 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -504,6 +504,13 @@ void asm_offsets(void)
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
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
