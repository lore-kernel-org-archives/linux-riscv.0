Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B5AC3ABAA
	for <linux-riscv@archiver.kernel.org>; Sat,  3 May 2025 00:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NtDNntru45lMn+AZd+WvyEKoLOSx0ZE6KsI46SAT0o=; b=xqZcQ3XU/J5YeV
	ca/ZQN/Ym9gqAaNzI2BTLSEvuJgLc3NnPlUIDDJxL3fWQ763FgWQftQHUn5tiv89dEwyFpHx0g5xn
	JcN7sMJLMQDlyxwRAvNmnBOgaWmm5B8of+txvJYsl4VuDnbbU3gKNdDXCkopvo5ekxb4DmxjM+tYr
	QH6BkSY3Knq7/Egyfgfxk1+clDMmwmyuai0RMGx1SdgYAU04CJB6hZYhua3AsEqu2MA2vk0jw9DeL
	Z+gkRrN2Y5lqm3S8SI/TNKUKlcZChTmWx5Qk2+Lpl6xDREHJ3IPe4qnWMVg0dPcqbvdHjfplE//rU
	skD+40BkcQOef27fKxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB11g-00000003LE2-3Nnu;
	Sat, 03 May 2025 00:46:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzrQ-00000003Fla-20qz
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 May 2025 23:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=aI596RAmm7Lv4XL+SxRun/ZHSsQZoWKcT7qQq9RSlTc=; b=Im/IoLu0hOvJoBCnAUM+iG8U/w
	bKscCXjclEYTOWwSo+yAOpPOINLh4zkPr/7NFTUMAJGCCxcmBKUGsU7T3g3n1LD3OUCN9Nq9abDUG
	aFdPt8mHW6N0tzbZPykCMoixLMqYIDPRLrQsq7qjnDs7OEs4wlBV1LhWFv7Rvi94J2D8fr4aZJQf2
	6DFr3rojNOvobAvymcECaaHEEO3fruqdqYwXLjq4zCgLVRqtE2JapB+ooabcIsQqGfbX+2MwDkvDw
	6hq92e6+FgSzmo/FtnGd2E5rBrUlKKppce66LYJE2nCfcN6rKM0CVv5m6xaRnL1mHN4MXHpItjgMJ
	rAyVZA/w==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzrL-0000000EwXa-3N2i
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:32:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-224341bbc1dso34882055ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228704; x=1746833504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aI596RAmm7Lv4XL+SxRun/ZHSsQZoWKcT7qQq9RSlTc=;
        b=int1YHJ3uX9YmfYt+ce8xS03sbLsWbg8ByWzT43WagKNIEn0kQZjIFSsgqskO+Togu
         OSIQNqHdKqGNSZ7kNRwg9Y7BoF+bG3KQlYwQEO98Bx4S9YcFLzOCCnqa4/3tHP4em8c4
         oycDoc63OwJdSb7ppKTH4M9rbw+L5llbJsLh1dNWtj35M09IljHTP/GGuAho+wR5s3uy
         +LJETfDfJj7SqV3vvNrm1SigQtVemZUykbmhvn3hMwbJfT6rVqxUTsD3jeV/OBug2D9Y
         6tnbAf/ONqQ6LijN+dtEYu37ykHu6coq6x6HtxxD1od9d/9hA8ER+LPaM4rP0Ujuz1nj
         4eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228704; x=1746833504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI596RAmm7Lv4XL+SxRun/ZHSsQZoWKcT7qQq9RSlTc=;
        b=MhuXu+UoLrAW8hifET/9+rCAlZQ1hpLGoMWInAvig8f6sYIMJOjWSR9hGjFOHUPRfQ
         R5Q7ffmyq2mf+BhSTpgp8VLp4Uf/xZFNvWoaDcZJ0vz3vCFcru/7W7mNWZIy95XVbGAp
         W48FO+q3PFcB4SBOAcF8L6rheLJFT+qO4tXbExV7zKU2TCDwUwFk2oBMChhSLULt3tIK
         QUwO094MIQsE0FzJuyxakbN9mRV2Bh8aYsivYkW2u+B6PBUnV/5fc+QqZTpHg1WgHxDC
         FmwDutbrGEfzEj5kfFaDc6JbrioUHlC859ugOL7qDtzQ6736hvwIqBXaE3X91CzEhw4e
         AeEg==
X-Forwarded-Encrypted: i=1; AJvYcCWESr15RI42e+WNXnXONOTt8jmj7+YUE3QFsvrLfGfjJpdwwEXbCBzngqe3oTp3g1Mt2iONeqHpNe4New==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOQM+Jpcw/ppIFvZMdl10tKzz4xz/KDUTmstUMWhYXlcasUMDJ
	qb41t01FWeK2IvW89T/U9UuhpqV9iErLcN8vg+pyejWTpHm55J8ljCx4U1kZ+zM=
X-Gm-Gg: ASbGncuD4bxxbBEvpXIBWFQCf3/KbBaUOR7ob/cl0AlpO2YDdkyqua5pmf9TUO4kUGD
	Jy4+fUkMQAnkP9qIhgp9B6vk08t4D7SR8U3w/AiTAVQILRpKuxJkNQpove9v/ZYCU6Y53l2fszC
	omHel48svErogVZXd42nFWJPK10YGwU6Z+opjBIQWFRD6vaiVGuqz2VbsImaRS0mEHqtJ0vYyKU
	vpC5KR3f1Czzuch/C0imONmFT7UHnvPoKU9Hhsl8f/oSGMNRDIA6tWhLtFKuBl+jyUah8KMHgqF
	u9yOuDVFZmP+z+iyHCjtSZH/zPqtU+LYbb60HibG9IDky/vNoLA=
X-Google-Smtp-Source: AGHT+IFCLLP2fLjT0vHXqmRyWHMTly9md9Bf67Uo3a23LMgjIRUdCqmrvg+qq0RnqNg++3aQXf2wLA==
X-Received: by 2002:a17:903:2f82:b0:22e:1791:2e5a with SMTP id d9443c01a7336-22e18c38f1fmr14911515ad.35.1746228703944;
        Fri, 02 May 2025 16:31:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:52 -0700
Subject: [PATCH v15 21/27] riscv: kernel command line option to opt out of
 user cfi
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-21-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_003200_128709_E0DFB5F5 
X-CRM114-Status: GOOD (  20.79  )
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

This commit adds a kernel command line option using which user cfi can be
disabled. User backward cfi and forward cfi can be enabled independently.
Kernel command line parameter "riscv_nousercfi" can take below values:
 - "all" : Disable forward and backward cfi both.
 - "bcfi" : Disable backward cfi.
 - "fcfi" : Disable forward cfi

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++
 arch/riscv/include/asm/usercfi.h                |  7 +++
 arch/riscv/kernel/usercfi.c                     | 59 ++++++++++++++++++++-----
 3 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 76e538c77e31..f75d50420a56 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6237,6 +6237,14 @@
 			replacement properties are not found. See the Kconfig
 			entry for RISCV_ISA_FALLBACK.
 
+	riscv_nousercfi=
+		all	Disable user cfi ABI to userspace even if cpu extension
+			are available.
+		bcfi	Disable user backward cfi ABI to userspace even if
+			shadow stack extension is available.
+		fcfi	Disable user forward cfi ABI to userspace even if landing
+			pad extension is available.
+
 	ro		[KNL] Mount root device read-only on boot
 
 	rodata=		[KNL,EARLY]
diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 68da5b7b79fd..6867ba6bd5a5 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -5,6 +5,10 @@
 #ifndef _ASM_RISCV_USERCFI_H
 #define _ASM_RISCV_USERCFI_H
 
+#define CMDLINE_DISABLE_RISCV_USERCFI_FCFI	1
+#define CMDLINE_DISABLE_RISCV_USERCFI_BCFI	2
+#define CMDLINE_DISABLE_RISCV_USERCFI		3
+
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <linux/prctl.h>
@@ -83,6 +87,9 @@ void set_indir_lp_lock(struct task_struct *task);
 
 #endif /* CONFIG_RISCV_USER_CFI */
 
+bool is_user_shstk_enabled(void);
+bool is_user_lpad_enabled(void);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_USERCFI_H */
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 8bc3e1e3f712..5ef357f43ad7 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+unsigned int riscv_nousercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -59,7 +61,7 @@ unsigned long get_active_shstk(struct task_struct *task)
 
 void set_shstk_status(struct task_struct *task, bool enable)
 {
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return;
 
 	task->thread_info.user_cfi_state.ubcfi_en = enable ? 1 : 0;
@@ -89,7 +91,7 @@ bool is_indir_lp_locked(struct task_struct *task)
 
 void set_indir_lp_status(struct task_struct *task, bool enable)
 {
-	if (!cpu_supports_indirect_br_lp_instr())
+	if (!is_user_lpad_enabled())
 		return;
 
 	task->thread_info.user_cfi_state.ufcfi_en = enable ? 1 : 0;
@@ -259,7 +261,7 @@ SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsi
 	bool set_tok = flags & SHADOW_STACK_SET_TOKEN;
 	unsigned long aligned_size = 0;
 
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return -EOPNOTSUPP;
 
 	/* Anything other than set token should result in invalid param */
@@ -306,7 +308,7 @@ unsigned long shstk_alloc_thread_stack(struct task_struct *tsk,
 	unsigned long addr, size;
 
 	/* If shadow stack is not supported, return 0 */
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return 0;
 
 	/*
@@ -352,7 +354,7 @@ void shstk_release(struct task_struct *tsk)
 {
 	unsigned long base = 0, size = 0;
 	/* If shadow stack is not supported or not enabled, nothing to release */
-	if (!cpu_supports_shadow_stack() || !is_shstk_enabled(tsk))
+	if (!is_user_shstk_enabled() || !is_shstk_enabled(tsk))
 		return;
 
 	/*
@@ -381,7 +383,7 @@ int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *st
 {
 	unsigned long bcfi_status = 0;
 
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return -EINVAL;
 
 	/* this means shadow stack is enabled on the task */
@@ -395,7 +397,7 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return -EINVAL;
 
 	/* Reject unknown flags */
@@ -448,7 +450,7 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 				  unsigned long arg)
 {
 	/* If shtstk not supported or not enabled on task, nothing to lock here */
-	if (!cpu_supports_shadow_stack() ||
+	if (!is_user_shstk_enabled() ||
 	    !is_shstk_enabled(task) || arg != 0)
 		return -EINVAL;
 
@@ -461,7 +463,7 @@ int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *sta
 {
 	unsigned long fcfi_status = 0;
 
-	if (!cpu_supports_indirect_br_lp_instr())
+	if (!is_user_lpad_enabled())
 		return -EINVAL;
 
 	/* indirect branch tracking is enabled on the task or not */
@@ -474,7 +476,7 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
-	if (!cpu_supports_indirect_br_lp_instr())
+	if (!is_user_lpad_enabled())
 		return -EINVAL;
 
 	/* indirect branch tracking is locked and further can't be modified by user */
@@ -498,7 +500,7 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 	 * If indirect branch tracking is not supported or not enabled on task,
 	 * nothing to lock here
 	 */
-	if (!cpu_supports_indirect_br_lp_instr() ||
+	if (!is_user_lpad_enabled() ||
 	    !is_indir_lp_enabled(task) || arg != 0)
 		return -EINVAL;
 
@@ -506,3 +508,38 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
 	return 0;
 }
+
+bool is_user_shstk_enabled(void)
+{
+	return (cpu_supports_shadow_stack() &&
+		!(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI));
+}
+
+bool is_user_lpad_enabled(void)
+{
+	return (cpu_supports_indirect_br_lp_instr() &&
+		!(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI));
+}
+
+static int __init setup_global_riscv_enable(char *str)
+{
+	if (strcmp(str, "all") == 0)
+		riscv_nousercfi = CMDLINE_DISABLE_RISCV_USERCFI;
+
+	if (strcmp(str, "fcfi") == 0)
+		riscv_nousercfi |= CMDLINE_DISABLE_RISCV_USERCFI_FCFI;
+
+	if (strcmp(str, "bcfi") == 0)
+		riscv_nousercfi |= CMDLINE_DISABLE_RISCV_USERCFI_BCFI;
+
+	if (riscv_nousercfi)
+		pr_info("riscv user cfi disabled via cmdline"
+			"shadow stack status : %s, landing pad status : %s\n",
+			(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI) ? "disabled" :
+			"enabled", (riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI) ?
+			"disabled" : "enabled");
+
+	return 1;
+}
+
+__setup("riscv_nousercfi=", setup_global_riscv_enable);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
