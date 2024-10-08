Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2D7CF042A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYUsZPLh+GeJHgNHl1ZT27IdesijCX53tQv1Z1WdfiM=; b=cK4NMNdh5zrWzM
	ohus+x4EVsnVF87xdXEiJAcW0yQRiWwq2Eq9zkCNnRNr37U8rX/auRy9ff03HZez7EyW41Ur041Fl
	wC5duIhUoC/iU5tJI2kqyFHRc8PBFCHUAb6HmqBEy/Zzw+ChTY6/4tmOalq2amXYdqSR1dpf9v+e4
	fOKIt3Xm0ql/SyWEbSgn80k+KawqOMOLP4T5BtxgQFFFaTMV/ljGrmaTsHcvmf0ytBR3idMnJrnT3
	RFLncOwmHBBfnUdSJV4V5wqgNqzmu8lfIxOe4ZQ6Iw7JKPGsVm5Mg4xLkKh+NWmt0KVygKzvl4n7d
	+dBeUFxH8qIYmQNEQ6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIql-00000007Iqo-3AUs;
	Tue, 08 Oct 2024 22:38:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqf-00000007IlS-3C28
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HqH/AhXY0hzM1+WX3zWeccxGSysMowKCTsAPVGtoEZU=; b=p6a+lqzHrqtu69bUgqyZWUiCBA
	6gK9B/OHTFGEsWST2cuBnNCarmPGX1aEI7aC4SjVt0AR6uzuh7dXVpTTApxBv46lYYSnmS5yWl75W
	waVzIKZ88kAYmnAlJ4rnVBmiZ0edZ8ys/ImfUupFtuAKOxVGngD4UJB8lZMYO/ioqgobYuhZyGSO1
	PiaCfM6imgJgOh8qTaOF3QyKtkG0spdYxVuWWvx6ISoIBMfi+7Dk078zhNE2D5f5IW67OYmUMAFHs
	8yVprqY1j6Zzm8agIaT94/cDgnRpG+TbGgbVr9TGS6kBbyHXBcgDryuqSztyJZKP3N3frgRmGYhV2
	Lzv9ZmLg==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqR-00000004hSO-2fCr
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:38:31 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71df04d3cd1so3613357b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427095; x=1729031895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqH/AhXY0hzM1+WX3zWeccxGSysMowKCTsAPVGtoEZU=;
        b=IVTTAemdyfvvt4q3g6Ae8PLdUUI1v3tw7nU+j1PJBveKV9tpwfp0wz4ArIoFFuXhmX
         kG8dOXxDGZgkg/FPnpI7XjbiYzAo+9RyltdXbMyrn7N29ZX0u/wsFiNreRJc0OmLufGI
         5fH5XOnToGMCJC1P79UM/s8hstR4LSw/rb9bTZY26nJEIHyy0pnhuQOXmTEmFeSRBClI
         YC1+gFLiP520GpHV4F0IKGavVX6ulAUukEAV4N9LzWMlQZbIhbk6ntxJwOTzKTY5SQyN
         qyWxtfydYWPK8JD3pTr6HZILdvdZhy4MD5icvyWmmLVmb4JYPfFWrb9vc++yBr2clOSf
         vH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427095; x=1729031895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqH/AhXY0hzM1+WX3zWeccxGSysMowKCTsAPVGtoEZU=;
        b=mnIBssEDCcawDd2xKLIHm/esIDYTqXm7FRMNKl4XgbVDKXOKuc1CggZDvUSSZn3vCU
         8W76uMRqn9BBczx0y3XQbDhmH+150RSIdZfeepe5mo69ZZ2p4oKMmhOvVYTmlCMZQh2e
         BLDqbGm8i2taIBwQeYcpzQ98rOsc9uODlcKBi4iwedO+AGdTjmyodKe8QflJ6Rk0LHy5
         0aTL8Q/kHs3k6OU4pYrkzpG0G/WtAKqZTnGwYSfHlU3qSIptLR5d2uFzivZQpbCVS8qB
         nvVMKREVe9RhfBLtCjMrBOGe+q+vqJXW2uuz/CUPc+qDWWm4BEGzIwvnRpHg3ANzS1v+
         jQ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyUGaecxbCqsQ4xp1B6KAd0wnNWTA9/Mo+yGjfLSC9CKW4KScwww63/X9DUPXXMPPhzKJblbUMN3YCYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn6BCQgdOYw1VPn/UjJjPumX/jm4868qw8OfK9332De+pw/0kz
	K/Q6ZTpOwbBlyNcTx7Nf3/RMaKdxYz/sFMZbqEHvvA23HCuUh+qtiTT3jk4sa7w=
X-Google-Smtp-Source: AGHT+IGmH0pAT3k+B512WMEtl+jnoszZMXZJopQwCiYj/5o19BiNvFPol3OfLSxKWlmI805IJexCZA==
X-Received: by 2002:a05:6a21:78d:b0:1d7:7ea:2f2d with SMTP id adf61e73a8af0-1d8a3be37d1mr856278637.6.1728427095593;
        Tue, 08 Oct 2024 15:38:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:52 -0700
Subject: [PATCH v6 10/33] riscv: usercfi state for task and save/restore of
 CSR_SSP on trap entry/exit
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-10-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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
X-CRM114-CacheID: sfid-20241008_233821_946912_99882CB0 
X-CRM114-Status: GOOD (  22.28  )
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
index aec3466a389c..5a8031384021 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,6 +14,7 @@
 
 #include <asm/ptrace.h>
 #include <asm/hwcap.h>
+#include <asm/usercfi.h>
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index ebe52f96da34..12263cef7518 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -57,6 +57,9 @@ struct thread_info {
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
index 000000000000..4fa201b4fc4e
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
+	unsigned long rsvd : ((sizeof(unsigned long)*8) - 1);
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
index e94180ba432f..766bd33f10cb 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -52,6 +52,10 @@ void asm_offsets(void)
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
index c200d329d4bd..8f7f477517e3 100644
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
