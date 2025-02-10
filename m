Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A41C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAf6MslLH1W1Qudsmw0JxdiT7ib3uJj4Ssg/wObdBvc=; b=uVP6XpFuk7pOyA
	wYGyu5mNE9NmIzt4IwpwyPKacYprcjDfwGaYNI/u4/RoO0xTzuyO9RGcNrBloz59IuCyTDLQHf+d8
	94os9T2nffuBixpThBgPbiryekfcEGEmB/MnDdXsOclJ8JyuggzlVObxQFUFmFai2eDBm/9IAkGhx
	iUxceq+UOYGVNoj2ropWRx4O1ltT5MZa+DQw6ux4eP9S8MDd2gVeqC9n0OxjcOwja5k6WHpNX7sb7
	Nm4sjuJQEGot5NkcnQTe7/n0Yhr8Ym8NsT+k34RnIsXXRlJ5hFXdAibCW1G7N9M9qhROrRmVjmstp
	Z08Cfy6pttXoWVsIVonw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNR-00000001KXn-32Er;
	Mon, 10 Feb 2025 20:27:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNQ-00000001KV9-1shC
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qihiC//CQppmEvCBgeNt37whYo0mSsmsLXBW9eHBYhI=; b=e/4w/q/MsD7KK8jCGduU2srSfV
	pIc7FYGfgig9gDyvw/l+RRkJR5/AJosaOht4qiTQvtejYjFD5HyXWsqYxJXsFXK5syipsXr+asWtC
	rdAHoJ63HOsH/HJ5J3JbDvJPkKxmb8jd0CCVOn5t3i1KIYp8rmj4HmfzAv2uzn5ffk8M1zOS4/3XI
	nRmO7T21vOLLh6DpaRz00xzPo1o0oUOQhheIfk04DW5NCDsRnJklWXShkfLTzz4LRFcHowcIVAxfw
	1KScR/TNd64pHz1Aw3Cwg0jtIK+3iDqPoC5zH/GBLC9/ofG1u94nWJsXbsYIHQMlkiX6YvwGbPd3X
	AcpSqcpA==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNN-00000000Dl7-2MN1
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:31 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21f49bd087cso63025545ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219247; x=1739824047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qihiC//CQppmEvCBgeNt37whYo0mSsmsLXBW9eHBYhI=;
        b=pJQtySPkzPbLwjxql4CpWV1LtdJyt/YGIWJnUYyhpiags/atgxPzunFr+dW1JBsqWo
         NmGWoQyGmNrWyctFRl7EjMK2tycID5n4hL/y7LihQD1xcYNV6vi7/4pNmhVf/M7yNEhH
         8pCISeWWcUUG6r7ax58VsHIPxRCN2sJzZOSf7GzjT5dCBJEF0KzovoIlgs0gYVXcgW2g
         FtoeJXe5OJMvHuhRvMvoD3HZgg4KjqdVDb+yfNC90v4h6H1tGJk5GjAqX+4HIRoPsOW0
         8h+LlRepTQGKFo80RwMs1hptVjZkmd4OFCdmmtSg//WS/SHDsNmZuhzCHSlh9LK/m3xd
         esIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219247; x=1739824047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qihiC//CQppmEvCBgeNt37whYo0mSsmsLXBW9eHBYhI=;
        b=B1fFgZBeohVJmA7IHrNGS9alR0embBDNqzy7YnSOWIGkdYCJJGehiKZdDSr0NmRQw7
         0/VSaK5xAIWu5IJMk9o73OhxgaRn8MZtcuyk9IMT6uicePo8xZgWAgQUmSNQbkjUMTvL
         rUqBCw9/t/aYADPZeZ0QiZMJFYaiaNX6DDdYfWvYRyQYLfkCyhz8oy10EMnYWsaIn8lz
         25ZjeFgTzjVidtFFBwmyvX0bK7CDZlgArtFceU3c6C3mClBZzRe+HPLGctXPlSSmr/E5
         YLkJiZQSq8RiG4obkjLEBQLDgZtPW/ugS+gigkosQgD7iciOq8fGewU+wlADQa2f0qT5
         oqKg==
X-Forwarded-Encrypted: i=1; AJvYcCX2V4yD0lQLAjJizxIXLl9wUxk/qroXmMyH3qD0o8+ARLml+/pG+VTEsLxcjG4gH4nUDCfBNvh/S3eFUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Mg4+h4qgGkUBDtInrJmqpeUcvxvkUlmMEAMFp1ES/ORj3yQr
	fhPweePkpahueksrlV0YCmR4X2FCNN1cVNLHlbv1Ew5r0Ltc/xMjtbujfGTIR0c=
X-Gm-Gg: ASbGncu0IYCGM5qYmSyARem3he2aMq2zVW6rd8Q+EuigELLwi4BbPAnVsL0okTeq1c8
	h89kilD0i52AGi2Habs6+B0oYC2k+87YdUfCDixN/3rBfFRYRO1bcXvCss7I2/C8or2FluIoQbV
	YAz+88aD02QzEK0BzDGyNE+EhF7XVC1ddiOBT7Q2tVW5ZD4fbt6oC7UtXBorvx8baTIQqM0K8FV
	576ezNfQ6VKk0yVOHowk8xScKg4IJmIQdZqgb8h9f3oA/svUVd46jdRu153w+wNo8y4AwHtULRq
	U0jWV5HWR+pYxRO7P9jjF/OulQ==
X-Google-Smtp-Source: AGHT+IF7EXANdfW+rLsLNvBS7WrISTRoOO6x3oQIFnuoI1GdkKkKLf31wWdGn3loj99yEU6jyJj2UA==
X-Received: by 2002:a17:902:e802:b0:21f:4c8b:c514 with SMTP id d9443c01a7336-21f4e76391amr226903755ad.45.1739219247115;
        Mon, 10 Feb 2025 12:27:27 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:26 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:51 -0800
Subject: [PATCH v10 18/27] riscv/ptrace: riscv cfi status and state via
 ptrace and in core files
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-18-163dcfa31c60@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250210_202729_751031_41332E85 
X-CRM114-Status: GOOD (  21.39  )
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

Expose a new register type NT_RISCV_USER_CFI for risc-v cfi status and
state. Intentionally both landing pad and shadow stack status and state
are rolled into cfi state. Creating two different NT_RISCV_USER_XXX would
not be useful and wastage of a note type. Enabling or disabling of feature
is not allowed via ptrace set interface. However setting `elp` state or
setting shadow stack pointer are allowed via ptrace set interface. It is
expected `gdb` might have use to fixup `elp` state or `shadow stack`
pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/ptrace.h | 18 ++++++++
 arch/riscv/kernel/ptrace.c           | 83 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h             |  1 +
 3 files changed, 102 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 659ea3af5680..e6571fba8a8a 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -131,6 +131,24 @@ struct __sc_riscv_cfi_state {
 	unsigned long ss_ptr;   /* shadow stack pointer */
 };
 
+struct __cfi_status {
+	/* indirect branch tracking state */
+	__u64 lp_en : 1;
+	__u64 lp_lock : 1;
+	__u64 elp_state : 1;
+
+	/* shadow stack status */
+	__u64 shstk_en : 1;
+	__u64 shstk_lock : 1;
+
+	__u64 rsvd : sizeof(__u64) - 5;
+};
+
+struct user_cfi_state {
+	struct __cfi_status	cfi_status;
+	__u64 shstk_ptr;
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index ea67e9fb7a58..df8b7c6ab671 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -19,6 +19,7 @@
 #include <linux/regset.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
+#include <asm/usercfi.h>
 
 enum riscv_regset {
 	REGSET_X,
@@ -31,6 +32,9 @@ enum riscv_regset {
 #ifdef CONFIG_RISCV_ISA_SUPM
 	REGSET_TAGGED_ADDR_CTRL,
 #endif
+#ifdef CONFIG_RISCV_USER_CFI
+	REGSET_CFI,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -184,6 +188,75 @@ static int tagged_addr_ctrl_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_RISCV_USER_CFI
+static int riscv_cfi_get(struct task_struct *target,
+			 const struct user_regset *regset,
+			 struct membuf to)
+{
+	struct user_cfi_state user_cfi;
+	struct pt_regs *regs;
+
+	regs = task_pt_regs(target);
+
+	user_cfi.cfi_status.lp_en = is_indir_lp_enabled(target);
+	user_cfi.cfi_status.lp_lock = is_indir_lp_locked(target);
+	user_cfi.cfi_status.elp_state = (regs->status & SR_ELP);
+
+	user_cfi.cfi_status.shstk_en = is_shstk_enabled(target);
+	user_cfi.cfi_status.shstk_lock = is_shstk_locked(target);
+	user_cfi.shstk_ptr = get_active_shstk(target);
+
+	return membuf_write(&to, &user_cfi, sizeof(user_cfi));
+}
+
+/*
+ * Does it make sense to allowing enable / disable of cfi via ptrace?
+ * Not allowing enable / disable / locking control via ptrace for now.
+ * Setting shadow stack pointer is allowed. GDB might use it to unwind or
+ * some other fixup. Similarly gdb might want to suppress elp and may want
+ * to reset elp state.
+ */
+static int riscv_cfi_set(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+	struct user_cfi_state user_cfi;
+	struct pt_regs *regs;
+
+	regs = task_pt_regs(target);
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_cfi, 0, -1);
+	if (ret)
+		return ret;
+
+	/*
+	 * Not allowing enabling or locking shadow stack or landing pad
+	 * There is no disabling of shadow stack or landing pad via ptrace
+	 * rsvd field should be set to zero so that if those fields are needed in future
+	 */
+	if (user_cfi.cfi_status.lp_en || user_cfi.cfi_status.lp_lock ||
+	    user_cfi.cfi_status.shstk_en || user_cfi.cfi_status.shstk_lock ||
+	    !user_cfi.cfi_status.rsvd)
+		return -EINVAL;
+
+	/* If lpad is enabled on target and ptrace requests to set / clear elp, do that */
+	if (is_indir_lp_enabled(target)) {
+		if (user_cfi.cfi_status.elp_state) /* set elp state */
+			regs->status |= SR_ELP;
+		else
+			regs->status &= ~SR_ELP; /* clear elp state */
+	}
+
+	/* If shadow stack enabled on target, set new shadow stack pointer */
+	if (is_shstk_enabled(target))
+		set_active_shstk(target, user_cfi.shstk_ptr);
+
+	return 0;
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -224,6 +297,16 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = tagged_addr_ctrl_set,
 	},
 #endif
+#ifdef CONFIG_RISCV_USER_CFI
+	[REGSET_CFI] = {
+		.core_note_type = NT_RISCV_USER_CFI,
+		.align = sizeof(__u64),
+		.n = sizeof(struct user_cfi_state) / sizeof(__u64),
+		.size = sizeof(__u64),
+		.regset_get = riscv_cfi_get,
+		.set = riscv_cfi_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index b44069d29cec..b9daed4ab780 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -452,6 +452,7 @@ typedef struct elf64_shdr {
 #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
 #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
+#define NT_RISCV_USER_CFI	0x903		/* RISC-V shadow stack state */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
