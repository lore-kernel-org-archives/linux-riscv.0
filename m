Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60632C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fVRDRvx3oO9AyFwphxDEuKCGRGb+Euf2iQ4LS7q3Ms=; b=bsKdi5rBIA+uE3
	3b3XyGZ4ORhWrU3g8FeQTNmRazmrvNIgeB1nZRxKytOZg0ue3pgo93b24M+5z3SXDoPwH7Yp8p0H6
	slBWskAf8N0unRMpKh9/v2vzePPSgQGgX3KiujxKgAV9za4rOKdHMox1EG5093FFadZzFh60jHfWn
	RLqBhrv3E8sjkucmR+fzWM2CG9pKVabmilf/8Az3ckDD0WbWeKQwY9xqLLYEa70AMMku8xDepezgA
	fgR1GhO7TNsGTToXkprJ79COkl5oq1NGxZh1qgA6THUpRYL2ZzULbSuZb8kHRH7mNR9GrCnAPutnP
	Zr7yYWJ3aSRNw79JR8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNG04-001IA7-Jf; Thu, 24 Feb 2022 15:25:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFzd-001Huy-0Z
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 15:25:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id p14so5069126ejf.11
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 07:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F5OyyqcGBOYroe/L/tNkoUrlGSaTDcsxizXKN09y7yE=;
 b=Kaew0SH/TCeAiPwYdosspcB1TVRMXC5YKrH07NT6MH1F9SHJMvC24ODuaK0LJk/93z
 D/SLzfgn9VdYpwV34WRYr62vhZCvqz4jdXFSGzvRyj+ZEMvNiRxS8USUXUp3FF9ByLzz
 qjNQ3f6uPY5rMezNzpKZMfbgrN8bBmwSyLEmyC7O05AiWfznUZl05TThgSt+xEEdQhrv
 DuJQm35TJH1TJlir31NOJZ1yNI6C3F2O2TR9tCKkp0dcV9FMyr+fnowbWjF/8VftngSF
 LaaY7VsxpTJsZ7mUevzKqpX2SpVSWH4kJ1lj3RvJpQkVU+EnlF5mIrmFI/povniM0Urj
 KiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F5OyyqcGBOYroe/L/tNkoUrlGSaTDcsxizXKN09y7yE=;
 b=qyWbNBsB64INVNo4fpfkjhxULTJgo/iY9IhKG83TcdAVFjWHQuDSqbuBtprx+pH11D
 +PWRQT+5aVZ7OareFp8OyWtFJ6VpU+/f3eqoOYdm5MUIHWm4EHuKAFtUocRFqtr+ij2F
 BG+UXRvGa/U+CpUmEnHlkcNIwTmmp5GDZZdMXoAOQiNAVqzyghMRvxjlMRuXY2lxUT6z
 ypnfEZr4lMC349Knw4VwSVh9ik6vXzjx2nZLILeIurgshkrlB6UDakLsFG0TY4MB0cmc
 G/iLaCKByRdJX+MqC/HCin3vyOdI7zCr16f5MNlucn5bJn+ZZtqVpqP34KB3J/kv4i8b
 cxSQ==
X-Gm-Message-State: AOAM533NxMKfIoxMjirOk1ZieD7FkDkgLc64Mz5/ifo8amzzLmj0acmH
 KjjJMTgt+dC3i9VfILALJ1LWU1fwmtyryISk
X-Google-Smtp-Source: ABdhPJxjOawtmnv3q4ky6UnhfDKTXZ8H/SdiRNzzbQmUMaqQUFmexWJyIZun3SuAUQl6+eDK150nTg==
X-Received: by 2002:a17:906:66cb:b0:6cf:e4f7:9504 with SMTP id
 k11-20020a17090666cb00b006cfe4f79504mr2735299ejp.142.1645716319481; 
 Thu, 24 Feb 2022 07:25:19 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id s11sm1509693edt.10.2022.02.24.07.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:25:19 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] riscv: Remove unneeded definitions from asm/ftrace.h
Date: Thu, 24 Feb 2022 16:24:51 +0100
Message-Id: <20220224152456.493365-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224152456.493365-1-kernel@esmil.dk>
References: <20220224152456.493365-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072521_129052_0CE2C3DA 
X-CRM114-Status: GOOD (  12.62  )
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

The macros for generating the auipc + jalr instruction pair is only ever
used in kernel/ftrace.c, so move the definitions there.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/include/asm/ftrace.h | 35 +--------------------------------
 arch/riscv/kernel/ftrace.c      | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 04dad3380041..585714993749 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -36,41 +36,8 @@ struct dyn_arch_ftrace {
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-/*
- * A general call in RISC-V is a pair of insts:
- * 1) auipc: setting high-20 pc-related bits to ra register
- * 2) jalr: setting low-12 offset to ra, jump to ra, and set ra to
- *          return address (original pc + 4)
- *
- * Dynamic ftrace generates probes to call sites, so we must deal with
- * both auipc and jalr at the same time.
- */
-
-#define MCOUNT_ADDR		((unsigned long)MCOUNT_NAME)
-#define JALR_SIGN_MASK		(0x00000800)
-#define JALR_OFFSET_MASK	(0x00000fff)
-#define AUIPC_OFFSET_MASK	(0xfffff000)
-#define AUIPC_PAD		(0x00001000)
-#define JALR_SHIFT		20
-#define JALR_BASIC		(0x000080e7)
-#define AUIPC_BASIC		(0x00000097)
-#define NOP4			(0x00000013)
-
-#define make_call(caller, callee, call)					\
-do {									\
-	call[0] = to_auipc_insn((unsigned int)((unsigned long)callee -	\
-				(unsigned long)caller));		\
-	call[1] = to_jalr_insn((unsigned int)((unsigned long)callee -	\
-			       (unsigned long)caller));			\
-} while (0)
-
-#define to_jalr_insn(offset)						\
-	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_BASIC)
 
-#define to_auipc_insn(offset)						\
-	((offset & JALR_SIGN_MASK) ?					\
-	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_BASIC) :	\
-	((offset & AUIPC_OFFSET_MASK) | AUIPC_BASIC))
+#define MCOUNT_ADDR	((unsigned long)MCOUNT_NAME)
 
 /*
  * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4716f4cdc038..2cc15dc45ce0 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -12,6 +12,41 @@
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+/*
+ * A general call in RISC-V is a pair of insts:
+ * 1) auipc: setting high-20 pc-related bits to ra register
+ * 2) jalr: setting low-12 offset to ra, jump to ra, and set ra to
+ *          return address (original pc + 4)
+ *
+ * Dynamic ftrace generates probes to call sites, so we must deal with
+ * both auipc and jalr at the same time.
+ */
+
+#define JALR_SIGN_MASK		(0x00000800)
+#define JALR_OFFSET_MASK	(0x00000fff)
+#define AUIPC_OFFSET_MASK	(0xfffff000)
+#define AUIPC_PAD		(0x00001000)
+#define JALR_SHIFT		20
+#define JALR_BASIC		(0x000080e7)
+#define AUIPC_BASIC		(0x00000097)
+#define NOP4			(0x00000013)
+
+#define make_call(caller, callee, call)					\
+do {									\
+	call[0] = to_auipc_insn((unsigned int)((unsigned long)callee -	\
+				(unsigned long)caller));		\
+	call[1] = to_jalr_insn((unsigned int)((unsigned long)callee -	\
+			       (unsigned long)caller));			\
+} while (0)
+
+#define to_jalr_insn(offset)						\
+	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_BASIC)
+
+#define to_auipc_insn(offset)						\
+	((offset & JALR_SIGN_MASK) ?					\
+	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_BASIC) :	\
+	((offset & AUIPC_OFFSET_MASK) | AUIPC_BASIC))
+
 int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
 	mutex_lock(&text_mutex);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
