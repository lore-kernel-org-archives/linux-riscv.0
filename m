Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA4DC369D1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9E+SuD/zgwdKBqdyprUCClOadUgm4BhxaSVyexvrhM=; b=PPCytqInzElQOWs37PMM5HvXGC
	XMqC4bKivSJ+OEXa1zo8TUZqxl99pOfOgIijlDqy3CRYCaD+oGIzOEaP10h/63r9+BEeYQQB7xxMB
	l+TYRLIVwGS5GrdbgOISCOHYw5Cm0o2vNiiBDK7yDDY8b/CLz2v2SO7avQeQ+ZQdq1RaSHgnyiqA2
	DweNvoDRANBTNya5nyIbrGWZnUxBrHtVv0X6TcB5labLZgEheKwXAlSmtnTEDbL+Q6TA4+7JNe+lL
	MBhR9/NcLig3VJlC57Vlb9eMWMEBxifygQZPtl8yc7VfbAgbU51524ATHyc8TY2jfkOnh9sC/E3Ae
	wRV9CoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s5H-0000000DLj8-1hHS;
	Thu, 24 Apr 2025 08:37:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qxt-0000000DAlV-3NxV
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 07:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZraI9Ovv6gpYhi0G8W3Cw0oZRXxTTj3IaFkdasgPTa8=; b=fBty861bOTg0ve7wAxOqpnJiij
	fhioFO60CyVQPqgUB/eqvNSoubJ1CwufrQY9cv2Cnhcj/+6MCypwF1HpdLTikrTbB8Tdfumpb2Mmk
	BVtkQvNXhwSHbC/lDvXejaortO/r1kvIGc7BGDWqridL0Y4LT7TSqh6PFY7IM5wQCUpfrvlIA5s1q
	Pn30is/JDaeKNLOnfOTjW+nPsnzv1ts4XhQyrLCeUTyP2uoQHA23OJh1UUS8aeN9SAdnrR6Ok3jhg
	Jtx9ijEXPZVLkaO7Qim4d1B3DJBUmbJcjBO7SkRS8zu4lvXgcDKOFfK5fauaO8mLFSCmDU+mPIyxX
	O0tUABxQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7qxq-0000000BXwb-2GQc
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:25:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22da3b26532so6609745ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479539; x=1746084339; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZraI9Ovv6gpYhi0G8W3Cw0oZRXxTTj3IaFkdasgPTa8=;
        b=C5LhAOtZFPpEQs1rYl3XbwlO1JBal3w4EnnKVCv2kKUrVa244YfrWfP8Pg9XdRst/l
         Iae86AKahQ98j2MHpByL0vAc6jzfa6c8tt0DSOPDFRAUndOXfkBwlF6G3xzv61OmFyiZ
         JJGeAHYiyHGOxUzecsphvi9U+rt25IxfMSzkylgOKuTQvGfmJndB1fARAg8V07d1IHcm
         MlmAj0mb9LhW6wJjqi7vf18I8P1X94r8iSwfpaX39X0ZpC0c1BeqiTEAV3odQ8FYo890
         0+tLqpDcaOPz4/RM1uFTdrwfIKLeWojuAOmXj6cnFqOw3TMBTbfJrWsr43sEd2ug+p+3
         kMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479539; x=1746084339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZraI9Ovv6gpYhi0G8W3Cw0oZRXxTTj3IaFkdasgPTa8=;
        b=cQ0O8HA/8C3V5BwanigzHUeafNYu/vIZrep4xUVwsjZT7qVphrbNA1rxDP4YEvsBQg
         ugM3/p0EguVMttdZEX3b4ciEdGXFS13mxsn7bh/VzAtE1buHLaj29NVYDnjZGN2M0f5i
         EJy9kcIELUaZvlPVQIFvpQA/m/pI9HuRAJvKn42bdAGcRcCV/rVQDJCl/xV3PEZgGnX0
         hSzykCjWxYqD6juyufU4HbNHuwZNc+59nhYX9sQhwwgSmm+GbHzOmTq4WS1TcYdNPKQU
         epW4nK3PoGkgz3cKftzTyGj4xk+B04hspxqd7bQmTWOjM/T0UVXZmjGSqgOdEVSTXHgk
         Bksw==
X-Forwarded-Encrypted: i=1; AJvYcCUOPPvtBSWXhDlDoi00HyidD1wqwrwdo+aTrECRh6IGtTD4lpuQ9KJqKjH4Y0eHWbwAxDBi5IWaAsDxhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV/lEnka0IyHy9oPkaxy3c8cM/Zurfi2uM6GLZZcrYsEtctRy1
	TiIijzuJJ54sAO2JL55l7lHrpcbfv1TTMf0yRJldZpdR2W4x+Xm495ocVMkspfM=
X-Gm-Gg: ASbGncssVPMtTqmZAOkf5J3scolsqvLLlpe0TghrqR6pbo9H97QsEtRBUerbsfbLQZe
	iON9MOolSA9hUmysGWtFG9AlNMSCZVendl0pAFKwiyHfN0fGJPyatxOx/qSiLs6waKY71t9Tamd
	y8v5X8LCe6loj6/HXWnGDTu0gBG+EEShCBvKhybeu6mCBobDg65x0cC8VyBU5li6mkWqf0i53JR
	8OwiR1cT2gT27DBIZd18+Y3NddxSskqb9erkUjeV3GJkqcS/LTCmdSamlEheuOr3jcCH9QXtPR2
	CH2aoo7MIctYdZkZKH7Wdz2u+YsDBEUYu4aveyHewaOgkkSzBv0apMDNIf3f1Q==
X-Google-Smtp-Source: AGHT+IH7Pn7YrwNkVIPl7Y7iC7lJ60MGgO6KIgekfFqy8hhbQAHwjVQ+88ZLIatTihzxRFG2BgkJcw==
X-Received: by 2002:a17:902:e5c8:b0:220:c813:dfd1 with SMTP id d9443c01a7336-22db3d777c4mr23449115ad.36.1745479538561;
        Thu, 24 Apr 2025 00:25:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50ea91fsm6333385ad.126.2025.04.24.00.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:25:38 -0700 (PDT)
Date: Thu, 24 Apr 2025 00:25:34 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v13 05/28] riscv: usercfi state for task and save/restore
 of CSR_SSP on trap entry/exit
Message-ID: <aAnnbtABLTL81uEY@debug.ba.rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
 <20250424-v5_user_cfi_series-v13-5-971437de586a@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424-v5_user_cfi_series-v13-5-971437de586a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_082542_765579_5695E833 
X-CRM114-Status: GOOD (  22.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 24, 2025 at 12:20:20AM -0700, Deepak Gupta wrote:
>Carves out space in arch specific thread struct for cfi status and shadow
>stack in usermode on riscv.
>
>This patch does following
>- defines a new structure cfi_status with status bit for cfi feature
>- defines shadow stack pointer, base and size in cfi_status structure
>- defines offsets to new member fields in thread in asm-offsets.c
>- Saves and restore shadow stack pointer on trap entry (U --> S) and exit
>  (S --> U)
>
>Shadow stack save/restore is gated on feature availiblity and implemented
>using alternative. CSR can be context switched in `switch_to` as well but
>soon as kernel shadow stack support gets rolled in, shadow stack pointer
>will need to be switched at trap entry/exit point (much like `sp`). It can
>be argued that kernel using shadow stack deployment scenario may not be as
>prevalant as user mode using this feature. But even if there is some
>minimal deployment of kernel shadow stack, that means that it needs to be
>supported. And thus save/restore of shadow stack pointer in entry.S instead
>of in `switch_to.h`.
>
>Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>Reviewed-by: Zong Li <zong.li@sifive.com>
>Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>---
> arch/riscv/include/asm/processor.h   |  1 +
> arch/riscv/include/asm/thread_info.h |  3 +++
> arch/riscv/include/asm/usercfi.h     | 24 ++++++++++++++++++++++++
> arch/riscv/kernel/asm-offsets.c      |  4 ++++
> arch/riscv/kernel/entry.S            | 23 +++++++++++++++++++++++
> 5 files changed, 55 insertions(+)
>
>diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>index e3aba3336e63..d851bb5c6da0 100644
>--- a/arch/riscv/include/asm/processor.h
>+++ b/arch/riscv/include/asm/processor.h
>@@ -14,6 +14,7 @@
>
> #include <asm/ptrace.h>
> #include <asm/hwcap.h>
>+#include <asm/usercfi.h>
>
> #define arch_get_mmap_end(addr, len, flags)			\
> ({								\
>diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>index f5916a70879a..a0cfe00c2ca6 100644
>--- a/arch/riscv/include/asm/thread_info.h
>+++ b/arch/riscv/include/asm/thread_info.h
>@@ -62,6 +62,9 @@ struct thread_info {
> 	long			user_sp;	/* User stack pointer */
> 	int			cpu;
> 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
>+#ifdef CONFIG_RISCV_USER_CFI
>+	struct cfi_status	user_cfi_state;
>+#endif
> #ifdef CONFIG_SHADOW_CALL_STACK
> 	void			*scs_base;
> 	void			*scs_sp;
>diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
>new file mode 100644
>index 000000000000..5f2027c51917
>--- /dev/null
>+++ b/arch/riscv/include/asm/usercfi.h
>@@ -0,0 +1,24 @@
>+/* SPDX-License-Identifier: GPL-2.0
>+ * Copyright (C) 2024 Rivos, Inc.
>+ * Deepak Gupta <debug@rivosinc.com>
>+ */
>+#ifndef _ASM_RISCV_USERCFI_H
>+#define _ASM_RISCV_USERCFI_H
>+
>+#ifndef __ASSEMBLY__
>+#include <linux/types.h>
>+
>+#ifdef CONFIG_RISCV_USER_CFI
>+struct cfi_status {
>+	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
>+	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 1);
>+	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
>+	unsigned long shdw_stk_base; /* Base address of shadow stack */
>+	unsigned long shdw_stk_size; /* size of shadow stack */
>+};

I didn't change this part yet. There are two comments from Radim here

1) Separate state of enabling/lock status from shadow stack pointer.
    Same goes for landing pad in later patches. I am arguing that since
    thread_info is already occupies two cachelines and there isn't any
    effort to manage it within single cacheline, I am not sure if it's worth
    the effort. Most likely comment is stale or doesn't have backed up data
    behind it. Furthermore whenever state of enabling is accessed, most likely
    shadow stack pointer, base pointer or size of shaodw stack will likely to
    be accessed as well. Thus having all that in colocated cacheline would
    actually be useful.

2) Convert enabling/lock status from bitfield to bool or accessed via bitmasks.
    I am agreeing to feedback here and will do that once we converge on point 1.


>+
>+#endif /* CONFIG_RISCV_USER_CFI */
>+
>+#endif /* __ASSEMBLY__ */
>+
>+#endif /* _ASM_RISCV_USERCFI_H */
>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>index e89455a6a0e5..0c188aaf3925 100644
>--- a/arch/riscv/kernel/asm-offsets.c
>+++ b/arch/riscv/kernel/asm-offsets.c
>@@ -50,6 +50,10 @@ void asm_offsets(void)
> #endif
>
> 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
>+#ifdef CONFIG_RISCV_USER_CFI
>+	OFFSET(TASK_TI_CFI_STATUS, task_struct, thread_info.user_cfi_state);
>+	OFFSET(TASK_TI_USER_SSP, task_struct, thread_info.user_cfi_state.user_shdw_stk);
>+#endif
> 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
> 	OFFSET(TASK_THREAD_F2,  task_struct, thread.fstate.f[2]);
>diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>index 33a5a9f2a0d4..f5531d82f7e7 100644
>--- a/arch/riscv/kernel/entry.S
>+++ b/arch/riscv/kernel/entry.S
>@@ -147,6 +147,20 @@ SYM_CODE_START(handle_exception)
>
> 	REG_L s0, TASK_TI_USER_SP(tp)
> 	csrrc s1, CSR_STATUS, t0
>+	/*
>+	 * If previous mode was U, capture shadow stack pointer and save it away
>+	 * Zero CSR_SSP at the same time for sanitization.
>+	 */
>+	ALTERNATIVE("nops(4)",
>+				__stringify(			\
>+				andi s2, s1, SR_SPP;		\
>+				bnez s2, skip_ssp_save;		\
>+				csrrw s2, CSR_SSP, x0;		\
>+				REG_S s2, TASK_TI_USER_SSP(tp); \
>+				skip_ssp_save:),
>+				0,
>+				RISCV_ISA_EXT_ZICFISS,
>+				CONFIG_RISCV_USER_CFI)
> 	csrr s2, CSR_EPC
> 	csrr s3, CSR_TVAL
> 	csrr s4, CSR_CAUSE
>@@ -236,6 +250,15 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
> 	 * structures again.
> 	 */
> 	csrw CSR_SCRATCH, tp
>+
>+	ALTERNATIVE("nops(2)",
>+				__stringify(			\
>+				REG_L s3, TASK_TI_USER_SSP(tp); \
>+				csrw CSR_SSP, s3),
>+				0,
>+				RISCV_ISA_EXT_ZICFISS,
>+				CONFIG_RISCV_USER_CFI)
>+
> 1:
> #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
> 	move a0, sp
>
>-- 
>2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
