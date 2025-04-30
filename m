Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5F6C3ABAA
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 05:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/W1qzDUW5ap5pwAynpj0/pDkWCPjCFGuIbf8H9UlWeo=; b=dYc3aUCb6T59j1
	WudhVUcudIbeVpESR24bmPwsffcmchoe+ROUDR+osyuwLuxs8GydPP8B4S9ch9tBe68SQTux3Duct
	lZPVOryBFJieHoV2PXxeTBTfA4zc9PLqXbK9LNkEq4cK6UYwxpLsEvoEeP6eJheETMgk7P3rafd+6
	7rZKFJwqLXYD8mwW9obFXuleO5j+t0bYS+z2dEs4OVPNnYK3u5as2onspQQpjEh8sa5i5IY8eunZi
	/PKbgLCJYAZ4gYBy27ZogwfLjxuXxvtm6yDsvlNiDMI+x9UepYS99ocLrEc671nCnsaGx/SD3cMrr
	Lq3NrtK5KVyXxutRIGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zZR-0000000Bhs6-3vXa;
	Wed, 30 Apr 2025 05:01:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v9P-0000000BHgh-43e2
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=C5ZEZwH3aQrzLfVWdE9j1t2G3YTj0WprbxNkrWh/BaE=; b=kh8H8v9wIZrMQ15W5nzPaV/51w
	Fgghq8uI84m7XriJhW842VRCdIL0+9poPiqL3FV7BqVNtlpOIiuAYDMDKBSWLsieGtm8B7hLvw/LM
	Hjs5VlXmpRW4NC74mwbhd8URf1G9YfcY/C+ZsszeLfCa/3JGTfbM6rN/vRMvrk4DjF0p8MR7kd4bJ
	TfG0LM0r2lNy3m0gqy4xUQci08IUJz00R7Zc+rduGjYNzV7ojBpfk/l+Q7Q5157EIDefGEtN0gKAw
	y8fGmxNAtAB9hpgj6hsms3oj3HvUSBOzv+olnIAlocehuS4ufciV5B0zrCwPxlRTAtLWEsoC79g0f
	9/oJnfkw==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9v8w-0000000DY84-26Wa
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:17:58 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-af579e46b5dso4757725a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972259; x=1746577059; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5ZEZwH3aQrzLfVWdE9j1t2G3YTj0WprbxNkrWh/BaE=;
        b=efLByzrXqTYDcCf/dKxo8hn/+u7lKxAveHXifR8LN3ugL9Zm/WHPD4YXwGHTiPmlv+
         nA31woYR5DUhRacbSZssUdkwEDr3li9etUShPgvUzZkjGLOtv56fN/6evvDmvLXFJU2/
         A0n8tFctDeCmQDmzB8HFxW/cxsezVbL9jHsRuUyu16IoCjXGhKbrk+Fd/FF28jgqhQfu
         hlh/T+j7KQUwsnTE7AM7aFQ47D+kK7S/YpFGCNKp9tz911pLA+XtgZ9ydn+d3zQcGuxS
         mateKCd1KS38L1qH6oSiFuMocTVtKjaAwjTORnyLYPwBessZDJdB+GrgCln4xnu364wU
         xR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972259; x=1746577059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5ZEZwH3aQrzLfVWdE9j1t2G3YTj0WprbxNkrWh/BaE=;
        b=YNbveg7cobgAWpIsOvuORbJIIn+iTz5XG6jjs3W4lYemnzeGEMe/WXN2RWcXLyIP+8
         kOyiF6SGG4quYJgdchXTHqDROzSc6zWk7QONaGL+DmfZsaLKnleM8fwg8RWBbVe8RGIg
         RlJR/eZDa99USuTO+W3YmTdZGj/BU5rjhYYxAW6ZunTg2dcnRIL7BBzuTXj3LfmAtq7T
         M5rMogBOfl8XKZfwHEe9iMT0WPne0p8Xxch4+e+oimzexrvnXUSi3PRYS9wS72ilyJlC
         2hibNg5PIl1Wy5BHUh0hWpl2tHWjUKjJJWXYYlpj106GXctRG4nmhQjgYfJRfn4EOOdk
         xIRw==
X-Forwarded-Encrypted: i=1; AJvYcCVqawtx/tCDU955NNF1wx4uoDsWB2DxB4RGO+5WKSyjIQhgxT9VZeCpJJIMvOLNWLfkG3TptqezLNixSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7TWFT4YVglsRNX4Iv4WmOAulXn2BeQTXeApSP6Qxu0Xn072P2
	J7TRLQSAn1aAo6M0r6BbwhDJUTWJETOwJXS9yJ/lGF/RTp7fkyYPH/pn+voBjwA=
X-Gm-Gg: ASbGncspMNua66YzVwnoGqvCUQ0JdQ+GTUTjEdzY0I7gdK4W16Iq+uKHipaQjuOd5En
	BUVPYDSda8doBrjduC7e1jFfjsQIJ7J10DS/auHa4cq5aaptunIk5mRiFhTpuxGD+bkXORcaY7B
	j4i3ry6SHr3lF54DynSDzzp90bwSXJQ0/EqL7ZpJRj3UIWrhsOoC0YJBzC3hvpQq7ER56LN50R5
	FI19H55ONTZKsUHySNyLD4FXsTsu0OcDtuPSRUs7kazQCmn8gax7xmSrcy1W8n9lI6nA2EK+01J
	9VZV1LxOcMpGPciAbDtE/D0Yaaups7UVnvdrF5ypDNCuD3e/TKw=
X-Google-Smtp-Source: AGHT+IFAMLIyLPT3Vyub7NbksFuJzHx0Dg3VrKlspZ+PnLCueluan8OlRjrHsN8k6+RcRQ9h1pRZQA==
X-Received: by 2002:a17:90b:5824:b0:2ff:618c:a1e0 with SMTP id 98e67ed59e1d1-30a333608d8mr1421802a91.29.1745972259317;
        Tue, 29 Apr 2025 17:17:39 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:38 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:40 -0700
Subject: [PATCH v14 23/27] arch/riscv: compile vdso with landing pad
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-23-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_011757_315530_CD3F47D5 
X-CRM114-Status: GOOD (  16.29  )
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

From: Jim Shu <jim.shu@sifive.com>

user mode tasks compiled with zicfilp may call indirectly into vdso (like
hwprobe indirect calls). Add landing pad compile support in vdso. vdso
with landing pad in it will be nop for tasks which have not enabled
landing pad.
This patch allows to run user mode tasks with cfi eanbled and do no harm.

Future work can be done on this to do below
 - labeled landing pad on vdso functions (whenever labeling support shows
   up in gnu-toolchain)
 - emit shadow stack instructions only in vdso compiled objects as part of
   kernel compile.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Makefile                   |  5 +++-
 arch/riscv/include/asm/assembler.h    | 44 +++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vdso/Makefile       |  6 +++++
 arch/riscv/kernel/vdso/flush_icache.S |  4 ++++
 arch/riscv/kernel/vdso/getcpu.S       |  4 ++++
 arch/riscv/kernel/vdso/rt_sigreturn.S |  4 ++++
 arch/riscv/kernel/vdso/sys_hwprobe.S  |  4 ++++
 7 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 539d2aef5cab..c2dd09bb9db3 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -88,9 +88,12 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
 # Check if the toolchain supports Zabha
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
 
+KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
+export KBUILD_BASE_ISA
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
-KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
+KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
 
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/assembler.h
index 44b1457d3e95..a058ea5e9c58 100644
--- a/arch/riscv/include/asm/assembler.h
+++ b/arch/riscv/include/asm/assembler.h
@@ -80,3 +80,47 @@
 	.endm
 
 #endif	/* __ASM_ASSEMBLER_H */
+
+#if defined(CONFIG_RISCV_USER_CFI) && (__riscv_xlen == 64)
+.macro vdso_lpad
+lpad 0
+.endm
+#else
+.macro vdso_lpad
+.endm
+#endif
+
+/*
+ * This macro emits a program property note section identifying
+ * architecture features which require special handling, mainly for
+ * use in assembly files included in the VDSO.
+ */
+#define NT_GNU_PROPERTY_TYPE_0  5
+#define GNU_PROPERTY_RISCV_FEATURE_1_AND 0xc0000000
+
+#define GNU_PROPERTY_RISCV_FEATURE_1_ZICFILP      (1U << 0)
+#define GNU_PROPERTY_RISCV_FEATURE_1_ZICFISS      (1U << 1)
+
+#if defined(CONFIG_RISCV_USER_CFI) && (__riscv_xlen == 64)
+#define GNU_PROPERTY_RISCV_FEATURE_1_DEFAULT \
+	(GNU_PROPERTY_RISCV_FEATURE_1_ZICFILP)
+#endif
+
+#ifdef GNU_PROPERTY_RISCV_FEATURE_1_DEFAULT
+.macro emit_riscv_feature_1_and, feat = GNU_PROPERTY_RISCV_FEATURE_1_DEFAULT
+	.pushsection .note.gnu.property, "a"
+	.p2align        3
+	.word           4
+	.word           16
+	.word           NT_GNU_PROPERTY_TYPE_0
+	.asciz          "GNU"
+	.word           GNU_PROPERTY_RISCV_FEATURE_1_AND
+	.word           4
+	.word           \feat
+	.word           0
+	.popsection
+.endm
+#else
+.macro emit_riscv_feature_1_and, feat = 0
+.endm
+#endif
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index ad73607abc28..8e771d316938 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -13,12 +13,18 @@ vdso-syms += flush_icache
 vdso-syms += hwprobe
 vdso-syms += sys_hwprobe
 
+ifdef CONFIG_RISCV_USER_CFI
+LPAD_MARCH = _zicfilp
+endif
+
 # Files to link into the vdso
 obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
 ccflags-y += -fno-builtin
+ccflags-y += $(KBUILD_BASE_ISA)$(LPAD_MARCH)
+asflags-y += $(KBUILD_BASE_ISA)$(LPAD_MARCH)
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
diff --git a/arch/riscv/kernel/vdso/flush_icache.S b/arch/riscv/kernel/vdso/flush_icache.S
index 8f884227e8bc..e4c56970905e 100644
--- a/arch/riscv/kernel/vdso/flush_icache.S
+++ b/arch/riscv/kernel/vdso/flush_icache.S
@@ -5,11 +5,13 @@
 
 #include <linux/linkage.h>
 #include <asm/unistd.h>
+#include <asm/assembler.h>
 
 	.text
 /* int __vdso_flush_icache(void *start, void *end, unsigned long flags); */
 SYM_FUNC_START(__vdso_flush_icache)
 	.cfi_startproc
+	vdso_lpad
 #ifdef CONFIG_SMP
 	li a7, __NR_riscv_flush_icache
 	ecall
@@ -20,3 +22,5 @@ SYM_FUNC_START(__vdso_flush_icache)
 	ret
 	.cfi_endproc
 SYM_FUNC_END(__vdso_flush_icache)
+
+emit_riscv_feature_1_and
diff --git a/arch/riscv/kernel/vdso/getcpu.S b/arch/riscv/kernel/vdso/getcpu.S
index 9c1bd531907f..5c1ecc4e1465 100644
--- a/arch/riscv/kernel/vdso/getcpu.S
+++ b/arch/riscv/kernel/vdso/getcpu.S
@@ -5,14 +5,18 @@
 
 #include <linux/linkage.h>
 #include <asm/unistd.h>
+#include <asm/assembler.h>
 
 	.text
 /* int __vdso_getcpu(unsigned *cpu, unsigned *node, void *unused); */
 SYM_FUNC_START(__vdso_getcpu)
 	.cfi_startproc
+	vdso_lpad
 	/* For now, just do the syscall. */
 	li a7, __NR_getcpu
 	ecall
 	ret
 	.cfi_endproc
 SYM_FUNC_END(__vdso_getcpu)
+
+emit_riscv_feature_1_and
diff --git a/arch/riscv/kernel/vdso/rt_sigreturn.S b/arch/riscv/kernel/vdso/rt_sigreturn.S
index 3dc022aa8931..e82987dc3739 100644
--- a/arch/riscv/kernel/vdso/rt_sigreturn.S
+++ b/arch/riscv/kernel/vdso/rt_sigreturn.S
@@ -5,12 +5,16 @@
 
 #include <linux/linkage.h>
 #include <asm/unistd.h>
+#include <asm/assembler.h>
 
 	.text
 SYM_FUNC_START(__vdso_rt_sigreturn)
 	.cfi_startproc
 	.cfi_signal_frame
+	vdso_lpad
 	li a7, __NR_rt_sigreturn
 	ecall
 	.cfi_endproc
 SYM_FUNC_END(__vdso_rt_sigreturn)
+
+emit_riscv_feature_1_and
diff --git a/arch/riscv/kernel/vdso/sys_hwprobe.S b/arch/riscv/kernel/vdso/sys_hwprobe.S
index 77e57f830521..f1694451a60c 100644
--- a/arch/riscv/kernel/vdso/sys_hwprobe.S
+++ b/arch/riscv/kernel/vdso/sys_hwprobe.S
@@ -3,13 +3,17 @@
 
 #include <linux/linkage.h>
 #include <asm/unistd.h>
+#include <asm/assembler.h>
 
 .text
 SYM_FUNC_START(riscv_hwprobe)
 	.cfi_startproc
+	vdso_lpad
 	li a7, __NR_riscv_hwprobe
 	ecall
 	ret
 
 	.cfi_endproc
 SYM_FUNC_END(riscv_hwprobe)
+
+emit_riscv_feature_1_and

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
