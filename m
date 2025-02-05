Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F88C02194
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 01:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvf5U8P1ZUcySyE1vXvRk52WWtxnDT+sqWXeLjvDYqg=; b=sz125QnVVacraM
	Vd+bz2dmBYEm2Fi6XYy33HrSQ7qoqBVaIxsLrTEG1RSiVQu9hSNrTarHJLu1YPziCeaBXxueyqDHI
	yh0Dcd3nyEHUgk/ePYZO/bLAfXED564/47v5fsPT7g3A2AV60hiNrihqRTaCYMqDDRM04lGHgkzwp
	EKr9puYPD02Y4lCKva0LckjWzYukETq4nmXf8rNO64qithQKrrxhOORQUuVRuLo62vk2zurtOdyEU
	ajshVnAp/khYG+121mgVxHn5/73X0fN1UqT+Xq53vb9IhLACNDwYG+2U7pAGmNSueflj+Ef+DJ0fB
	H7VX9D5kJFm/I5ZCNBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7Z-000000021bN-3zhy;
	Wed, 05 Feb 2025 01:22:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7X-000000021YH-2lz7
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=M49HWf8gzr6wWBf1Qtr4VOivQAEEQjfyuWgORGOVTSw=; b=I5fgoDt7tQXaJZDZclth0zdOpY
	af+6W08kllhe7hUvJxIcyO2wa/EajwjvNRjtIlhYcqIa2u1AwPVICJomu3FvZx7go5j1qI5BjxI7y
	SLdK7u4wpVfJ6t1alCWTypqHFQenBismq0ZeZHw+O4enMbI/MNtOsLeid5lhE8/lncJEcGXfUfw/b
	2Ts9Aa4B7M7q/KSeUGkV8KTqO3oAqiC3q4D8tA0ip7asDeUlXCk01b7RnexvevLAbiJtdy8ozwClu
	1XhP+AW9SuOM6p1bKQsIULLHNC/tmE0GGA+f5laQfR28DM5X0XMjsaQgQB1H6COU09rlE4iOw+ajX
	mlKaClWQ==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7U-00000003c6A-0WkI
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:26 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f9da2a7004so883215a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718541; x=1739323341; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M49HWf8gzr6wWBf1Qtr4VOivQAEEQjfyuWgORGOVTSw=;
        b=jC8FkK43F+LPdU/9WAEB8glvSDemMhLcC6UlsRZPWrox1MTiP6DtSjR49k4yHnnxSP
         Pd0H/BB8rQ0UyngkEyeV5NuqCwkJtjRd+WV68UCSAa8cfrOQmwgBkKWQpYmemAOsPTmw
         ttxJCY+bHokYmGaS2gQMSAub62qFqGWjWg6+CABS3g9kWCIzKoKb+TEvRxKbElCZ/UU/
         uYq03i+GoigYAC5Xfg3w1Yi0uH6lGOA6VSq9bgwbrZ8URpetuIZbNQugSAYo4tVMWgzK
         BFMaBM2XeYEVAl1FGxAuDSdVAORCBQz0Hq7u6rRpxdyvshknrIctV5Jc5R4lKc4FIyvp
         6SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718541; x=1739323341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M49HWf8gzr6wWBf1Qtr4VOivQAEEQjfyuWgORGOVTSw=;
        b=kFrB24em9I3mLU3vcZ1oNqMMfB8Z0WmYwaOzn3qMY8+4tCW0Nc+U7vYJfoXzBaHLRG
         VbwKV7LZsTG4da1HvegQx6XduEATfmaoJesZnw5IwncYjI8L1agHmUW8xBRy6PVDgDG7
         VSgBzvz58X3WYyyYiS+0bq1XZgSDwSKUGtGr3WbZeTjbsPvjTB3/ZU1CFnh44wz39x0U
         r5jXREI2cadjdF2BmOiC6yjqxMLzCWhlpYSgYsUV/vQLD3EFwTeoGAId5muWdXxeu+Xz
         5lzBGdiwjUUJFl2P959ad8/0OhkBKREcR3v1fXGjlFyekgsbw4ThQ0q/GUJf3kyLt7UH
         RBlA==
X-Forwarded-Encrypted: i=1; AJvYcCW91GBgHo0OeyfO4fd7sevWUoMV7jBEGzVkNJH5jtkzeXXewrG5fEHp+mqVgauuCghKNvlSv+2sd62BnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YydgqGGipzgHUJaRZcgNuZpXAP/oO19o7B6yJ8GIgptf5PfzIzr
	HKdsvPiIsav2DXrmRcXfw7Bd4IiQ8iH1kW6GVF2JjrVyw3D4kPdyrLYI3LdGeybKgmlaZGfj65n
	7
X-Gm-Gg: ASbGncv8LlE5wG0lRRbFM/qrbf89PanR0SMLtnmW49a/q4dGGWb4FK9m4XqeAFWIV8j
	toItq4CZnsTj281QQ/+acysPVcpAVaKsy4qI/v8SsJQvFpOWNcDaR7XkmLadmLZi7Bwabfih3JN
	V8l7FY9/HwWZS8fGwiuZGoDOD94gZPiBZr5VyMdQMA6EeWlWRCSt18kXgdgCJqs/DyuvKJ1tXb/
	Zpun3c2eNgV0u5onYsdgjUAaY+9Rt1JGzt2WDfygmX3ea3Flik7ldIOL4XdOzgpdM5HGrYHhY+6
	4ADcpSGkIDMaznZ3MB3eIJuw1Q==
X-Google-Smtp-Source: AGHT+IFplfoY4kwYRUYkUapPyLUTmtCYI1kOBemc2Fu2DroKYmpICeBEsM6C9QAH02Mf3MaRp7pG+A==
X-Received: by 2002:a05:6a00:3cc1:b0:72d:4d77:ccc with SMTP id d2e1a72fcca58-7303511ae5cmr1489432b3a.6.1738718540683;
        Tue, 04 Feb 2025 17:22:20 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:20 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:01 -0800
Subject: [PATCH v9 14/26] riscv/traps: Introduce software check exception
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-14-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_012224_211271_1525004D 
X-CRM114-Status: GOOD (  19.45  )
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

zicfiss / zicfilp introduces a new exception to priv isa `software check
exception` with cause code = 18. This patch implements software check
exception.

Additionally it implements a cfi violation handler which checks for code
in xtval. If xtval=2, it means that sw check exception happened because of
an indirect branch not landing on 4 byte aligned PC or not landing on
`lpad` instruction or label value embedded in `lpad` not matching label
value setup in `x7`. If xtval=3, it means that sw check exception happened
because of mismatch between link register (x1 or x5) and top of shadow
stack (on execution of `sspopchk`).

In case of cfi violation, SIGSEGV is raised with code=SEGV_CPERR.
SEGV_CPERR was introduced by x86 shadow stack patches.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/include/asm/entry-common.h   |  2 ++
 arch/riscv/kernel/entry.S               |  3 +++
 arch/riscv/kernel/traps.c               | 43 +++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f1..5a27cefd7805 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -51,6 +51,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
+DECLARE_DO_ERROR_INFO(do_trap_software_check);
 
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index b28ccc6cdeea..34ed149af5d1 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -40,4 +40,6 @@ static inline int handle_misaligned_store(struct pt_regs *regs)
 }
 #endif
 
+bool handle_user_cfi_violation(struct pt_regs *regs);
+
 #endif /* _ASM_RISCV_ENTRY_COMMON_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 00494b54ff4a..9c00cac3f6f2 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -472,6 +472,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8ff8e8b36524..3f7709f4595a 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -354,6 +354,49 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+#define CFI_TVAL_FCFI_CODE	2
+#define CFI_TVAL_BCFI_CODE	3
+/* handle cfi violations */
+bool handle_user_cfi_violation(struct pt_regs *regs)
+{
+	bool ret = false;
+	unsigned long tval = csr_read(CSR_TVAL);
+
+	if ((tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr()) ||
+	    (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack())) {
+		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
+			      "Oops - control flow violation");
+		ret = true;
+	}
+
+	return ret;
+}
+
+/*
+ * software check exception is defined with risc-v cfi spec. Software check
+ * exception is raised when:-
+ * a) An indirect branch doesn't land on 4 byte aligned PC or `lpad`
+ *    instruction or `label` value programmed in `lpad` instr doesn't
+ *    match with value setup in `x7`. reported code in `xtval` is 2.
+ * b) `sspopchk` instruction finds a mismatch between top of shadow stack (ssp)
+ *    and x1/x5. reported code in `xtval` is 3.
+ */
+asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		irqentry_enter_from_user_mode(regs);
+
+		/* not a cfi violation, then merge into flow of unknown trap handler */
+		if (!handle_user_cfi_violation(regs))
+			do_trap_unknown(regs);
+
+		irqentry_exit_to_user_mode(regs);
+	} else {
+		/* sw check exception coming from kernel is a bug in kernel */
+		die(regs, "Kernel BUG");
+	}
+}
+
 #ifdef CONFIG_MMU
 asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
