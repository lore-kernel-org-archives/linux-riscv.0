Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6710EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 15:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6A8KLbcykq1qXr3n2m6RG54S7NGDxlW/od3BESPi7k=; b=c/PPu56aHwBR1u
	b3rLe/UVRyRvqozE2hiqWDuC36HJ8FGD9VPxCAGJh7RVAm2hf0Fadl9K0v13KHtf4G0lJsWnqZBIB
	r57ZM6TFxo0vo7smVdZXrVKisnDZcRKZ79zxtaxTLEuxUkSR4ylRoqDCdQvR6AoFntjAUqEhZtSsp
	F+uZ8Q4iPwohiXYAeU/o5ytIRSHYookC2LEzQ5fCaFaeXE3qT+5uh2mRFLjTJ1tE7M4hxOh8R6Qxo
	4zX5w4of4YzKZVD9a3AfBGe3du3Ub3DLX4LEh3IwxWJD2pK+qyoeVmuvk7zjX255I1kM2g6maQwiu
	26TGCUnFkyWr+uB+7Ccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNG0h-001IYg-HQ; Thu, 24 Feb 2022 15:26:27 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFzk-001I0C-5w
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 15:25:32 +0000
Received: by mail-ed1-x532.google.com with SMTP id c6so3320350edk.12
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 07:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pg83usMw5uRQIx1/D/J156mChwwgfj7a6QBGSOjo5rI=;
 b=iFZIadtNxbwHIW9fHYTCppxMigghvTsOZRNML6dHUjyUjy4oLhptJgn8ccs4spGjgB
 yCvA9Ni3vnDhLaO43nFU3/ciGraWo4FFoZtgdpMDGsP9nA9wXHwEX3ufgDwMIxMkAYi9
 6/oIvtib8AZ6kzkzcIBXYYZ+FfMA2q/pL/++3WmCZP1OvCoJBHQaijDYqG3obTSdDtDo
 9cB1dqru6ytirRMj5YzyQFuP70K/yrnvOTTjnBdpinpGSoLFnx2WnQsPSkuR1h2vZfmM
 7GtIU1UAH6IjZQ0d7f+WWwh+l2mCKzRgRAD/TWskng/2TJcF1kLeCp+hyZ/zNGowles7
 FBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Pg83usMw5uRQIx1/D/J156mChwwgfj7a6QBGSOjo5rI=;
 b=AY3DiGu//df/vW03Qr9FV65hsQMjSuI/PTNoIpm3yrKjAGOMW2Su6FQf2FInr/QseW
 AkovAHYQlMK9lYuuox0isp66+8ThtEk/vErdoaPzEu01y/o0LyqRWA/FYdzbmDWtR8J6
 AZNnqSPUYbpOwmmeoSy3mff14aibjKBNfQjhiynDugcO9K9wz2rWsW6gV1dgJLMselos
 MHhesy34ukbwYSiGs3dPeEKBusGplMYihnwjWi3So9tvAmWQb8httnXGDounux8R0Cp/
 KwBo/hXHAnZtDAT1K2v3bx+n5wBiHqXVflDegqFIKf25EK7nBWlCOY5GaiUG69uVzX/k
 yLeg==
X-Gm-Message-State: AOAM532NxDP/uIUsGx39h1LWpYwP4FOlsNVLImq2ptHrkxcZnXDKW/WC
 92N2NgFLEnBtbofzeQY4vHuS8Wh6tZ5SdUxm
X-Google-Smtp-Source: ABdhPJyIgk54xHRmo7jfYS9ym3DA+LZ7j94fiqCQC3NeW5TeueHYzp8dNzSBavEaZQbEyL///blaiw==
X-Received: by 2002:a05:6402:144b:b0:410:b990:a68a with SMTP id
 d11-20020a056402144b00b00410b990a68amr2800791edx.25.1645716324506; 
 Thu, 24 Feb 2022 07:25:24 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id s11sm1509693edt.10.2022.02.24.07.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:25:24 -0800 (PST)
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
Subject: [PATCH v3 8/8] riscv: Use asm/insn.h for dynamic ftrace
Date: Thu, 24 Feb 2022 16:24:56 +0100
Message-Id: <20220224152456.493365-9-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224152456.493365-1-kernel@esmil.dk>
References: <20220224152456.493365-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072528_338761_943EA4DE 
X-CRM114-Status: GOOD (  14.17  )
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

This converts kernel/ftrace.c to use asm/insn.h to generate the
instructions for dynamic ftrace. This also converts the make_call macro
into a regular static function.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/ftrace.c | 69 ++++++++++++--------------------------
 1 file changed, 22 insertions(+), 47 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 2cc15dc45ce0..7dd3aafa17aa 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -9,6 +9,7 @@
 #include <linux/uaccess.h>
 #include <linux/memory.h>
 #include <asm/cacheflush.h>
+#include <asm/insn.h>
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
@@ -21,31 +22,13 @@
  * Dynamic ftrace generates probes to call sites, so we must deal with
  * both auipc and jalr at the same time.
  */
+static void make_call(unsigned long caller, unsigned long callee, unsigned int call[2])
+{
+	u32 offset = callee - caller;
 
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
-
-#define to_auipc_insn(offset)						\
-	((offset & JALR_SIGN_MASK) ?					\
-	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_BASIC) :	\
-	((offset & AUIPC_OFFSET_MASK) | AUIPC_BASIC))
+	call[0] = RISCV_INSN_AUIPC | RISCV_INSN_RD_RA | riscv_insn_u_imm(offset + 0x800);
+	call[1] = RISCV_INSN_JALR  | RISCV_INSN_RD_RA | RISCV_INSN_RS1_RA | riscv_insn_i_imm(offset);
+}
 
 int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
@@ -63,7 +46,7 @@ static int ftrace_check_current_call(unsigned long hook_pos,
 				     unsigned int *expected)
 {
 	unsigned int replaced[2];
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned int nops[2] = { RISCV_INSN_NOP, RISCV_INSN_NOP };
 
 	/* we expect nops at the hook position */
 	if (!expected)
@@ -95,7 +78,7 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
 				bool enable)
 {
 	unsigned int call[2];
-	unsigned int nops[2] = {NOP4, NOP4};
+	unsigned int nops[2] = { RISCV_INSN_NOP, RISCV_INSN_NOP };
 
 	make_call(hook_pos, target, call);
 
@@ -108,39 +91,31 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
 }
 
 /*
- * Put 5 instructions with 16 bytes at the front of function within
+ * Put 4 instructions with 16 bytes at the front of function within
  * patchable function entry nops' area.
  *
  * 0: REG_S  ra, -SZREG(sp)
- * 1: auipc  ra, 0x?
- * 2: jalr   -?(ra)
+ * 1: auipc  ra, ?
+ * 2: jalr   ra, ra, ?
  * 3: REG_L  ra, -SZREG(sp)
- *
- * So the opcodes is:
- * 0: 0xfe113c23 (sd)/0xfe112e23 (sw)
- * 1: 0x???????? -> auipc
- * 2: 0x???????? -> jalr
- * 3: 0xff813083 (ld)/0xffc12083 (lw)
  */
-#if __riscv_xlen == 64
-#define INSN0	0xfe113c23
-#define INSN3	0xff813083
-#elif __riscv_xlen == 32
-#define INSN0	0xfe112e23
-#define INSN3	0xffc12083
-#endif
-
 #define FUNC_ENTRY_SIZE	16
 #define FUNC_ENTRY_JMP	4
 
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned int call[4] = {INSN0, 0, 0, INSN3};
+	unsigned int call[4] = {
+		RISCV_INSN_REG_S | RISCV_INSN_RS2_RA | RISCV_INSN_RS1_SP |
+			riscv_insn_s_imm(-RISCV_INSN_SZREG),
+		0,
+		0,
+		RISCV_INSN_REG_L | RISCV_INSN_RD_RA  | RISCV_INSN_RS1_SP |
+			riscv_insn_i_imm(-RISCV_INSN_SZREG),
+	};
 	unsigned long target = addr;
 	unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
 
-	call[1] = to_auipc_insn((unsigned int)(target - caller));
-	call[2] = to_jalr_insn((unsigned int)(target - caller));
+	make_call(caller, target, &call[1]);
 
 	if (patch_text_nosync((void *)rec->ip, call, FUNC_ENTRY_SIZE))
 		return -EPERM;
@@ -151,7 +126,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 		    unsigned long addr)
 {
-	unsigned int nops[4] = {NOP4, NOP4, NOP4, NOP4};
+	unsigned int nops[4] = { RISCV_INSN_NOP, RISCV_INSN_NOP, RISCV_INSN_NOP, RISCV_INSN_NOP };
 
 	if (patch_text_nosync((void *)rec->ip, nops, FUNC_ENTRY_SIZE))
 		return -EPERM;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
