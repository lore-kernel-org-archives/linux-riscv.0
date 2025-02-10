Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DA8C021A3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPj283BtWr1YV5XtqtJNdszkwiQNQWOiuO8/7l5CUdY=; b=Nr+YyLGnqmJNAo
	2ZFdwXr6KcM7WQi1k9BpsvaRovwsaUXfxvRrf7e9/VXEXbWvViQLMWSHBlNxkQVZbusfwHTNKTLjj
	BV7be6NE0XCU4jBb+sPTeWA5zsMg9ML3r2CFcvP+eo4rtcDTG2iSsHepPfS8w6gBpPHf34eSisTep
	6MbQHWwHP2bmioAj5QRx63aZHG5J+M3PcwPWTsIuBYIsXTwF1yma+bB0RZC4awgRQbKc6QAOZqz5r
	HGt6DAupHJP9W2xOYc9XwHfYbucO6w972QtvgR6R6MN/vBhjPxISm288P49Akeoi22wA2tOCUaks2
	A0MKII7CTYzfKqiWPLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMr-00000001Ji6-0yXh;
	Mon, 10 Feb 2025 20:26:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMo-00000001Je5-41gR
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:26:56 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f55fbb72bso56897745ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219214; x=1739824014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFoiG9nO9GzRbM78aaWwJK+Q/U0QRSToN08KNluZphY=;
        b=JcAb7yJ6wkzU4OE+95EqjcoAyZ84/jQafYbZans6HYJV2DqC4HTR5veP+Nrq20tHJb
         3tCMi7k9G+EFzdc4hUXp02vb/FGb+X41CFh3ZP5KvpZB5jC1Aqns65+InbUuWvhCoV6l
         bT0dEVX8HOBO00gvYKUv+Y905S5T+5vidRbCyKg/rwFwKAAqaK7i7X6kVxtELNttNlkR
         kalW3asnifoKiw7amRW9+4yZeH99jMCFpTDz++1SFUWVm1m7bkaX4QD2QBF/MZQjXyAC
         McusF9BfPeytcxARSOoieOsrFq8xLOg9u5rNs5HiHZ+zuCn4UQCJTbX5dKGUx4ySyFiE
         69eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219214; x=1739824014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFoiG9nO9GzRbM78aaWwJK+Q/U0QRSToN08KNluZphY=;
        b=j5RrW+10k8tKWF8KpnpkP0AeMdn/hToeyGiGNNRPcrqodC2Vq93uvaMO8hgus2nQvY
         sbsCbVRyCv9BAymFE/ZT/YwSsjqh1ygIoM6/NAh/ZnB4L9+7AfzT22LkemMGaXYCT7u/
         9aEGYzvXUhuhj+L3QAIR8iNQES0+0CONe5tKQTO10Q0u8sV5lY5j7Ej7v4DalfXZOfr+
         N0plEYGdpsGvqVH0XHeN4cDkMrfCNMhk6YTcwCQXFV574EZ+Ya7F4rs+rNrm0n74bD0C
         pUOYSZ0KiHIc8wBqgQ3ZIH3ozaZRXb2Pim3wkkbEwBgQreTiE9nlWSf5hE7mS2neQEHE
         jLkg==
X-Forwarded-Encrypted: i=1; AJvYcCVPNVotJePCxksG6cRU6Rv1bZJykjTKUO8RLk+tL/QgjBEXBeq8AFT41siY5LUH46smPzEAyPEgnb2vsA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/bToiXHn2yvaBAvTuzVhbwNFoH0vqia476HPDmQ51DQnrNk+Y
	XGrGgIDWW69sugdemB5yI1I1MBUJRDoJcy+iW1gWNtws0nsiTo+kVaUQdBNRL0g=
X-Gm-Gg: ASbGncuiLBWuVAhSmEujKjdXGwM+1gV8w+IcOEgqWYtmrnekfvpViOXvsgWf5CjZKqs
	ZQDGYhkJtelB5h2ufXtNVFWsWUaGs9SlU21oNGSmyvMvGUoQUyv08DYU+VssoVp0ftvp++81XYS
	V/0zfim7XYxZVWcOHd8TDWDjVjyxFhYXp54kz3tCbprncdcWnpgq7pGagNULy7YV/mOOuSK18et
	vs5oGeFQ0Kwrjf3HBH0VT3+r6AwHXfJbZoAhE4vcV0HeP+V5BtspqSQ76Z7AWzB9Ff8g/6vxGYE
	0UfJDeaws8PPl1DUZ1Cj4F7VFw==
X-Google-Smtp-Source: AGHT+IEPSlWV/roU0SyRsD9mZQNHSbQmDLwPbxxPcGI6KoZ78tihK1b8Yp4dYVskjWY846JzmqLryA==
X-Received: by 2002:a17:902:d543:b0:21f:f02:4176 with SMTP id d9443c01a7336-21f4e73bcc3mr228449315ad.33.1739219214484;
        Mon, 10 Feb 2025 12:26:54 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:26:54 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:38 -0800
Subject: [PATCH v10 05/27] riscv: usercfi state for task and save/restore
 of CSR_SSP on trap entry/exit
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-5-163dcfa31c60@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250210_122655_022882_40CDF5C2 
X-CRM114-Status: GOOD (  21.95  )
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

Carves out space in arch specific thread struct for cfi status and shadow
stack in usermode on riscv.

This patch does following
- defines a new structure cfi_status with status bit for cfi feature
- defines shadow stack pointer, base and size in cfi_status structure
- defines offsets to new member fields in thread in asm-offsets.c
- Saves and restore shadow stack pointer on trap entry (U --> S) and exit
  (S --> U)

Shadow stack save/restore is gated on feature availiblity and implemented
using alternative. CSR can be context switched in `switch_to` as well but
soon as kernel shadow stack support gets rolled in, shadow stack pointer
will need to be switched at trap entry/exit point (much like `sp`). It can
be argued that kernel using shadow stack deployment scenario may not be as
prevalant as user mode using this feature. But even if there is some
minimal deployment of kernel shadow stack, that means that it needs to be
supported. And thus save/restore of shadow stack pointer in entry.S instead
of in `switch_to.h`.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/processor.h   |  1 +
 arch/riscv/include/asm/thread_info.h |  3 +++
 arch/riscv/include/asm/usercfi.h     | 24 ++++++++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c      |  4 ++++
 arch/riscv/kernel/entry.S            | 26 ++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index e3aba3336e63..d851bb5c6da0 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,6 +14,7 @@
 
 #include <asm/ptrace.h>
 #include <asm/hwcap.h>
+#include <asm/usercfi.h>
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index f5916a70879a..a0cfe00c2ca6 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -62,6 +62,9 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+#ifdef CONFIG_RISCV_USER_CFI
+	struct cfi_status	user_cfi_state;
+#endif
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
new file mode 100644
index 000000000000..5f2027c51917
--- /dev/null
+++ b/arch/riscv/include/asm/usercfi.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0
+ * Copyright (C) 2024 Rivos, Inc.
+ * Deepak Gupta <debug@rivosinc.com>
+ */
+#ifndef _ASM_RISCV_USERCFI_H
+#define _ASM_RISCV_USERCFI_H
+
+#ifndef __ASSEMBLY__
+#include <linux/types.h>
+
+#ifdef CONFIG_RISCV_USER_CFI
+struct cfi_status {
+	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
+	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 1);
+	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
+	unsigned long shdw_stk_base; /* Base address of shadow stack */
+	unsigned long shdw_stk_size; /* size of shadow stack */
+};
+
+#endif /* CONFIG_RISCV_USER_CFI */
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_USERCFI_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index e89455a6a0e5..0c188aaf3925 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -50,6 +50,10 @@ void asm_offsets(void)
 #endif
 
 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
+#ifdef CONFIG_RISCV_USER_CFI
+	OFFSET(TASK_TI_CFI_STATUS, task_struct, thread_info.user_cfi_state);
+	OFFSET(TASK_TI_USER_SSP, task_struct, thread_info.user_cfi_state.user_shdw_stk);
+#endif
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
 	OFFSET(TASK_THREAD_F2,  task_struct, thread.fstate.f[2]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 33a5a9f2a0d4..68c99124ea55 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -147,6 +147,20 @@ SYM_CODE_START(handle_exception)
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
+	/*
+	 * If previous mode was U, capture shadow stack pointer and save it away
+	 * Zero CSR_SSP at the same time for sanitization.
+	 */
+	ALTERNATIVE("nop; nop; nop; nop",
+				__stringify(			\
+				andi s2, s1, SR_SPP;	\
+				bnez s2, skip_ssp_save;	\
+				csrrw s2, CSR_SSP, x0;	\
+				REG_S s2, TASK_TI_USER_SSP(tp); \
+				skip_ssp_save:),
+				0,
+				RISCV_ISA_EXT_ZICFISS,
+				CONFIG_RISCV_USER_CFI)
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
 	csrr s4, CSR_CAUSE
@@ -236,6 +250,18 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 * structures again.
 	 */
 	csrw CSR_SCRATCH, tp
+
+	/*
+	 * Going back to U mode, restore shadow stack pointer
+	 */
+	ALTERNATIVE("nop; nop",
+				__stringify(					\
+				REG_L s3, TASK_TI_USER_SSP(tp); \
+				csrw CSR_SSP, s3),
+				0,
+				RISCV_ISA_EXT_ZICFISS,
+				CONFIG_RISCV_USER_CFI)
+
 1:
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
