Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9011C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvf5U8P1ZUcySyE1vXvRk52WWtxnDT+sqWXeLjvDYqg=; b=Bv6pTcourjK+vu
	Nz9YpYblo6//9KzBgJhpcsVTQ/xjhIlFQKGx6JCb33S88otWveMtGaj3s1uQkBmwWoog7z0JNZhHI
	w+qO4it0wnvz3T5v6KMvMKT7AaB6PefC6wWGpD45qoid0TrL2mYVLP9faonXOu0PR+1TJAy2/Qi7K
	L/Gwdt+yoFEGYPViPFf2EMUATUZPC5ecxyR2gi7V/Y6Yjmrx/x9qoPtvhqyj9+xjNp/y9RF7Inav2
	GufbqPp4UR560ptEtZKIijAIXCvGQF6qDulpe2030HGW88J5Mc7wCns438CGIT70ylUoqqFSJfPcI
	v71+QMDmf4PTRj4iR/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbWK-00000001WkK-2YlN;
	Mon, 10 Feb 2025 21:40:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNI-00000001KKq-0uCE
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=M49HWf8gzr6wWBf1Qtr4VOivQAEEQjfyuWgORGOVTSw=; b=U1odXWMQsnG8J2JPj0NabsWbfK
	oKZ0SIfJz3Kb8ccMSZ0jiJMeJTWchoDvCTcf6GPKSbiWL3CI/bJWq/mBWWO4m2VybEI+tzzlsNyzp
	/it1sDX/d6Wfr2JXT45CJr4A0KRxKI5YETuOOdbaE4m8tCazqph2KmBxzVMNpLC8qGuoBBXZL6LXk
	/09NBWdky/PZtvvExdd8wWRq+Z4n8cb2Ou5huNF/7S+++zRZA5GgcUDq9+YdmtYMJIJrOBt8enxSW
	FAFqTm9xKXwkynwqjZcumkRmbAHW2eQDuYKjCGu3X82XVJGJtrTj3TgsYvDsUFWESFmLrnDFeOEf7
	jxJ859iA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNE-0000000GihS-37Df
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:23 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21f48ebaadfso79066935ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219237; x=1739824037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M49HWf8gzr6wWBf1Qtr4VOivQAEEQjfyuWgORGOVTSw=;
        b=ZSB+xyG37nBfjq8xOykSwm6uwAPqPiV4eK8DXKMEGdWv7wdHPdOFrAHaAvE2FqgTyj
         oariIKAeC3xVzOQhWJpDfwAZTbWQ4UFRwG6k9p1U8v70Pzx8syw7iyMQvJfM7jFOAXkj
         ug7riVZEOICEIXeaN+ZMnYmYuY79VkWZCEpkuvyxsWJ8+DC+3d7ahDMbjAeUi6nq2aoe
         mW4r3J3jBV6bFIm9TESW529aM1TZfbfRkEvCNpXd+VqrPIA1x1yh2XHFAcIj07QcUaBZ
         pl8AMuedZzoluKc5B25V92N9+jKvmjR8p39m6xolA5YOadwRqAj/f69vONScMixRXPxe
         3PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219237; x=1739824037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M49HWf8gzr6wWBf1Qtr4VOivQAEEQjfyuWgORGOVTSw=;
        b=veBDQuBBvT3yufkOAG0A3z7wTvmCdGKjesUHbJ1x2BzmCe+zI4oq9Otl/xP5XLGEnN
         6uYZdxujlb9Ezyo8r5MOihtt4TyIJQ4k0CIlo8dq4BKCy1rIKHpihrq14yWjPEpNU96K
         4MadyWT0310bPSlbZO8es1AMktdFjKpip6PW8f4qQfflNdZal/oYyA1hK6z6pLQjSNvB
         pVvKQxlNDRV70DROfPZ07B6FV72Paq7ZYe+4VPlg8EpDcvHM8fyvcgdDhm2nMsXdb/tT
         zMfczxeQ9KOVtKr+UXUiJnNvlsbNr2sf6L0IqGiS3CxsIGbozHAY2P1EYpaV0Yc/m5gD
         YvFw==
X-Forwarded-Encrypted: i=1; AJvYcCWg96rSg/7Ie8t0tiQoYED77jz10sBkm1RNKsWmoV8PSoTCm8IO3yCZOEYXJm48brq6bLxxcAjJ4jI8kA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTksUHXlrhIVnVcco0h+A1+Nx4MtTPpoFtR2UMxLZsr6Ur8MYl
	PWeouegwQI4Hd1KZSKsWGarLU8w5niJd61FbNzrSxap7mWVev6B3Yf3X4q4mfYg=
X-Gm-Gg: ASbGncvIdIvT4g8yGDy3jDcUkYWZWe9tLfT5CKgxdE29+0DFZ3T6QTsnUe0FXZKR85g
	6RGk6I5++vHOFJubR2txSWiLcJUNwm903A7UpKN26CzKUnGsKsIoQeHqWpeueYRnJnoOB8DNh2L
	uag11GLvYJ2Yc5RaFPxg8mdlKLWMuHMMEyqUiS42SP246aewtb53C6fUYWyw6x8mXTv8lfCeL9Q
	RzL6k+Au8rnP1Y8S+NUbn6eRlXcbV52mTIZO4NdTer1howREqvdJjQRy4p88ST3IVkVmXud6V77
	puDWI4HvP+245MqfDAPkcjnBqQ==
X-Google-Smtp-Source: AGHT+IHdHEBMhep7yU/mVgZUfZFs7fvP4+JZwXsHPWxQJF2WCxVaTQUYKv93Rn4bqO7ShpSAaGLGsg==
X-Received: by 2002:a17:903:46c6:b0:216:393b:23d4 with SMTP id d9443c01a7336-21f4e1cb92fmr222614515ad.11.1739219237018;
        Mon, 10 Feb 2025 12:27:17 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:16 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:47 -0800
Subject: [PATCH v10 14/27] riscv/traps: Introduce software check exception
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-14-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250210_202720_791366_424B6F5B 
X-CRM114-Status: GOOD (  19.39  )
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
