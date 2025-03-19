Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B85AC35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyxtHN6ATGfhykDzhR2yOTYUAWunx3WDfeKceAUBNhs=; b=A3h5nq3ACoF4Sg
	+Xgtfz4FfiNt/5xaNjcZqQnWMarwmEWESX0P+CWx2BTsKYNWXok0dlwKRicxCOJzkvoV24fhNl4bt
	pVAUJtpKBCpHuqOssevZHfbrZsLjjsReUfTHAv3dN6TzFCuxUYp4ebbR1BwYpu7lOJE7E16d0XTX0
	S+hRiG8IWZ/mSt9W6NU7ulNPxrZJ5+Ug+PYyA13nlqo7ieNbHN28NDARw+dks2d/4O2kCyNwJQVPc
	h6QOHHOATriebDT+k1ju879cnbvS1J+yDTeb+NyjqVT30RGI3vOukotB0NHbb6m6NaF4SZjq7O5eE
	VtTHQ80n6tyOqsI6w9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyGN-00000009qhS-0Xs7;
	Wed, 19 Mar 2025 18:35:35 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyGK-00000009qfp-1Q0e
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 18:35:33 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22580c9ee0aso129418095ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742409332; x=1743014132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uR51xah4xxVpBSnTg/IV2alN19Fnn1YAZeJAKTDPRYQ=;
        b=tfkJXiB2TW7C2LadrNimiTqmM1WfqhWenPr1C7yCNG2HVWNMJnuMKCEjdjloiRRF71
         Qn+Vrl5RCAgCkjGr473JFEQBugS24jDX964el2FG6lj8l8xdUtR1CIeOyoRQ4INnTS94
         9MyPqlPMMQoVRv2tlABHb+1GzaYfhMjnC5P1u8v/e660KPYl8ZS52Xn3XhItPXQY5hHj
         hLhH6PYnKPPOhnpFsTeZXyRSf6oo88YiZeJFJmP6n5fz9xZQCqhP44Kmwyw37UHXg1Po
         BicaM+cJTONev2fRIPVL/ciZMxNytdHfyViFzGIeCwRl9P0SI+Poozq0GTjn5be4m527
         Nf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409332; x=1743014132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uR51xah4xxVpBSnTg/IV2alN19Fnn1YAZeJAKTDPRYQ=;
        b=ppaGTEzZApxN3/v1AgOUdxqO6m2mJAxHeC409q9+3+2c0wbeAqM50hRx6fbYnyhmxK
         kmCBqxWx/PLj3v1QCIfdUOCrWhlsEdWZBFscacj8BG5RNQtlQlEca3DeHBh6QGxtF4vY
         aEODMDeKtMUUlPq0w0G1n2aY7ivHVZiX3+hCMFuEOm7b8/J72W9V6tMPj4gK5e9mmnfV
         NoS9aYFT9Wtf/KEGhf2/eHGjpFLcyHsBPXCZV61AawVNcztaVuJj9uh8GcAQeueMNTu8
         /r2+fq6N08mYGaU2w3pjoOsy7oxkUNuYBQUSjq9i8Ilq2xS4B/w6LL6AJ7fi8pd1GSOT
         jrPQ==
X-Gm-Message-State: AOJu0YwMbtWfpIFPCLNeYFnIHIjySKTEnX7gkiApRg54iG6QARdyydYu
	PBU7mCUhsZTGmlZRzDbQX4RmqUxfBubdLQ0M1bcS/LFpxnEmdtFLY1R8R/zI/gE=
X-Gm-Gg: ASbGncvYxNq767OBhRlE8zA2LTuJnz2G6Y1MnTqySVkco5IQvE2yNQvPea65shNVPiP
	aDXpSFa99svJq+5xva68QBpFv23AaNthQkJdyEv9t8ptZxRoic+0mMzUJWoJwCFH+e1kbxuinkp
	1btcR1l+oskXb4Gk4Hk4W7Be77/k02OMjDfpAq2tNr3Yv5detIGOuJn6jNCezTK/OfIJ3mtLC5l
	FyRjq7emh369Y9WW2nHwYnISzxURs/UXkTZ3Jm7PqxDxIwbAbv8LPGauhKQ8jT3TP739YxgtqCT
	WaP7tQ4+ogt24nVprDey2nLn7aMkcJIhLb18HOjeN1A7G+SzldAU5xZgSdg/
X-Google-Smtp-Source: AGHT+IGVWjR9gQffmmSDn2uRl9PI4o0YcgivPHUzO9gwlKWf+ydGj9+4bhZ79+++dyKX8S+kHEzYqQ==
X-Received: by 2002:a05:6a00:1486:b0:736:3979:369e with SMTP id d2e1a72fcca58-7377a83e678mr333529b3a.9.1742409331719;
        Wed, 19 Mar 2025 11:35:31 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167e109sm11993844b3a.115.2025.03.19.11.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:35:30 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Mar 2025 11:35:19 -0700
Subject: [PATCH v10 1/2] riscv: Move nop definition to insn-def.h
MIME-Version: 1.0
Message-Id: <20250319-runtime_const_riscv-v10-1-745b31a11d65@rivosinc.com>
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
In-Reply-To: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, 
 Pasha Bouzarjomehri <pasha@rivosinc.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3767; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=jcUMUpSTP0w83s8S9BETds7fzlXnkTNKzrbHYn+Xbas=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/ptvvxq/RDmibtNz5uscts8ac62l2u5nj+7yXlDs8vcN
 ps55eeBjlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACZy5zzD/3pjQ+OmwJJV33kz
 FGoiNDfuCTmU2Fq+7kRMp678tu+vohj+2RW06e8ocriTLtd+/Ud0QlCJo3+K71TJ0yvj5u59eU+
 KCQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_113532_389211_9E7F2338 
X-CRM114-Status: GOOD (  14.98  )
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

We have duplicated the definition of the nop instruction in ftrace.h and
in jump_label.c. Move this definition into the generic file insn-def.h
so that they can share the definition with each other and with future
files.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/ftrace.h   | 1 -
 arch/riscv/include/asm/insn-def.h | 3 +++
 arch/riscv/kernel/ftrace.c        | 6 +++---
 arch/riscv/kernel/jump_label.c    | 4 ++--
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index c4721ce44ca474654b37b3d51bc0a63d46bc1eff..b7f361a50f6445d02a0d88eef5547ee27c1fb52e 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -79,7 +79,6 @@ struct dyn_arch_ftrace {
 #define AUIPC_RA		(0x00000097)
 #define JALR_T0			(0x000282e7)
 #define AUIPC_T0		(0x00000297)
-#define NOP4			(0x00000013)
 
 #define to_jalr_t0(offset)						\
 	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_T0)
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 9a913010cdd93cdfdd93f467e7880e20cce0dd2b..71060a2f838e24200e3eb4ad8dfb32ef6bd2f57a 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -199,5 +199,8 @@
 #define RISCV_PAUSE	".4byte 0x100000f"
 #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
 #define ZAWRS_WRS_STO	".4byte 0x01d00073"
+#define RISCV_NOP4	".4byte 0x00000013"
+
+#define RISCV_INSN_NOP4	_AC(0x00000013, U)
 
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 3524db5e4fa014a4594465f849d898a030bfb7b8..674dcdfae7a149c339f1e791adb450535f22991b 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -36,7 +36,7 @@ static int ftrace_check_current_call(unsigned long hook_pos,
 				     unsigned int *expected)
 {
 	unsigned int replaced[2];
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned int nops[2] = {RISCV_INSN_NOP4, RISCV_INSN_NOP4};
 
 	/* we expect nops at the hook position */
 	if (!expected)
@@ -68,7 +68,7 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
 				bool enable, bool ra)
 {
 	unsigned int call[2];
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned int nops[2] = {RISCV_INSN_NOP4, RISCV_INSN_NOP4};
 
 	if (ra)
 		make_call_ra(hook_pos, target, call);
@@ -97,7 +97,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 		    unsigned long addr)
 {
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned int nops[2] = {RISCV_INSN_NOP4, RISCV_INSN_NOP4};
 
 	if (patch_insn_write((void *)rec->ip, nops, MCOUNT_INSN_SIZE))
 		return -EPERM;
diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index 654ed159c830b3d5e34ac58bf367107066eb73a1..b4c1a6a3fbd28533552036194f27ed206bea305d 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -11,8 +11,8 @@
 #include <asm/bug.h>
 #include <asm/cacheflush.h>
 #include <asm/text-patching.h>
+#include <asm/insn-def.h>
 
-#define RISCV_INSN_NOP 0x00000013U
 #define RISCV_INSN_JAL 0x0000006fU
 
 bool arch_jump_label_transform_queue(struct jump_entry *entry,
@@ -33,7 +33,7 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 			(((u32)offset & GENMASK(10,  1)) << (21 -  1)) |
 			(((u32)offset & GENMASK(20, 20)) << (31 - 20));
 	} else {
-		insn = RISCV_INSN_NOP;
+		insn = RISCV_INSN_NOP4;
 	}
 
 	if (early_boot_irqs_disabled) {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
