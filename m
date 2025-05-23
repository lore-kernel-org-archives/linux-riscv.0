Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19753C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJzzHbwYjFWtadX2EjvzlucfxIEfIYLc/fEMDuI/hEk=; b=dYvWRFDu+5HY7XAVE2MXrXg6zq
	Z4kpUEAR3EgWlXuRX9/B1AoEgE54F5qw4tcq0EOZczldLNN4dTABexC3hyKAmRNaAdPz7yrwhVgHz
	Lkl4gO5Zz/Xw8ExLctQIm9VFNIJnkFhSoQL3wgpgHyUEQbFKiyT/dZ41RXijoK6SOR4xPZ2LDU54u
	EN9SvlQ/0r+Vi5sDSmXSAMqpV9eCa+fLiSmEYGtRjs+sPt7wi8QuAoSCVD2WandgEW4yu78CzALOb
	H9vb4ZYyLf1lJZ1hIKGW/G7Mk+9inZGG+V5T+pEMcOFgug3ASdnehi8L3PBDvhF5OmOnxesuXcZY4
	3jal+oJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uILSy-000000034ii-0TT8;
	Fri, 23 May 2025 06:01:12 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uILSr-000000034hE-41DI
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 06:01:10 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b07d607dc83so6711576a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 23:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747980065; x=1748584865; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MM8qECzGuabOnUf85/QEm4aqRBTZg6DD4xWO9Ub0wak=;
        b=g0e/KFE43T6CUMHi9itVYQtDVPcvhnNYatjkbkq3aLHTkPBICijg4Xx5sHKwLHzHCT
         h2Jd50haogpyFFXk/F2HaeiAAOJj3RRbBLs6wf4sJQczMxcP/leG0vabRJMZsETZE5IF
         Ng9oWPmpyjlBmvLcVXkSjH4eeSjJD6hvz/K5RqWFUumN+79m+bG7xO673Y6zW2PazAxA
         ZJUoAljzLchZvb6BNlVofUqBbckQWhlNSxWBvhZ0d8v7gm81u/LjmUy7iBY8F1cHqmv6
         3H6RBR9ISUPntz7vRW9MowVWRK295sFk+ELHzo0SQjFup82T+OaoRKjhKuRi18gBA3qk
         GOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747980065; x=1748584865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM8qECzGuabOnUf85/QEm4aqRBTZg6DD4xWO9Ub0wak=;
        b=Opsh+Ke1BOL/pSq76fiPuDklCRL9yUBM/sS9S8oT/G06ntQVsFINVJ9aH28BtmcdWl
         QYsN7ice+y7UOt3HZw36wyyIws+a2/SValJdazCggllojJsdMMG8AH+G2aO2upHAN8wH
         r2NnH2kJAqZBiSid50xs3tLqQ9HgisNKRKahIj8A1XKbC6ZfJw/vKdraQgVTb7WTUBbd
         FKd9GQD7l6nTiW48okDxao90m4lGWhkV1ILOFIyrP/Qt5rKu11PLcmicO5R385gKlPNs
         q1AoO7f1W8Ui855O2bKxD0DbCCHn/v9rZt0azLMOzdqvOkE2OrP9VJNNt7DseQEvthBQ
         nqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxlABXABarxfnP9Fwi3Hi4Lzmk5qm9tISKiYyB5cfHA7jFsouy1R7OrqrmS0onnkO6A3STWKe8lYxSSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8WIeZTbP+KVYdJ1b/43rQ8ODPYu8RoXdlM99FaudIzaIOe/MI
	ZqxmXm5wMHKy0ilbiYS51+5m/qYY1a/qEP6BCP4FBBejMmgZqjLK0+HV8690TKZqoeo=
X-Gm-Gg: ASbGncujmX0vqAsdFubg9/fk1JTNv0y499Ud1J6ZjihAwifWm0n6LgSSmDiDu3hlCBB
	winZReIlCe9XzC0ByxjyFP05K1mDCncd8euMxcIP0drX4GldG4ZMa9trEvHEDJC2vDsNdlGb29v
	Z5iINb2Q9J7q60nrc9bkivgi6DaObkvfd+rf904eOSCSaU4unX+B8Ne3TJ8YptnPiNOkGeaBo78
	FZ8iTCnnjGJlnaTekGkOuuc0ZHj2jpAvybp2w0MhGGAJPTOZNUL231kZlLrU5LDxwqmybqjzXCs
	wo80xHPl0pzv46KWm5QXq7LeYWNYjrr6F77slbJ16iuplbDxjTWMRsUhzwhRvA==
X-Google-Smtp-Source: AGHT+IH2GKe/Xm4Ppo32AJJr6pQEKHz5ShbLWceyV6lc/d0LTWPehEZJe6GO4uOPRwS1AloDMoJLOw==
X-Received: by 2002:a17:902:d4c1:b0:223:54aa:6d15 with SMTP id d9443c01a7336-233f21ccb31mr27879805ad.12.1747980064763;
        Thu, 22 May 2025 23:01:04 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365f7a32sm6495296a91.49.2025.05.22.23.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 23:01:04 -0700 (PDT)
Date: Thu, 22 May 2025 23:01:00 -0700
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
Subject: Re: [PATCH v16 23/27] arch/riscv: compile vdso with landing pad
Message-ID: <aDAPHHN0yRgmqSOI@debug.ba.rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
 <20250522-v5_user_cfi_series-v16-23-64f61a35eee7@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250522-v5_user_cfi_series-v16-23-64f61a35eee7@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_230106_006859_01B08F8C 
X-CRM114-Status: GOOD (  24.66  )
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

On the topic of vDSO generation, I wanted to have a discussion thread. So
I'll use this patch and create a discussion thread.

Binaries in address space can call into vDSO and thus in order to have
homogenous cfi policies, vDSO is also compiled with cfi extensions enabled.
Thus it has shadow stack and landing pad instructions in it. Shadow stack
instructions encodings are from zimop/zcmop encodings while landing pad is
from HINT space of `auipc x0, imm`. Thus landing pad is truly backward
compatible with existing and future hardware both.

zimop/zcmop encodings are illegal instruction on existing hardware and any
future hardware that will not implement zimop/zcmop encodings. RVA23 profile
mandates zimop/zcmop encodings and thus any RVA23 compatible hardware should
be compatible with libraries (including vDSOs) with zimop/zcmop instructions
in them.

Kernel which is built doesn't know upfront which hardware it is going to run
on. It can be placed on top of a existing hardware, RVA23 compatible hardware
or any future hardware which is not RVA23 compatible but has not implemented
zimop/zcmop extensions. Question is should kernel be building two different
vDSOs (one with cfi/shadow stack instructions compiled and another without
cfi instructions inthem) and expose the one depending on underlying CPU
supports zimop/zcmop or not.

My initial hunch was to go with two different vDSOs in kernel and expose only
one depending on whether zimop/zcmop is implemented by platform or not.

However as ziciflp and zicfiss toolchain support is trickling into gnu-
toolchain, shadow stack instructions are part of libgcc and all small object
files that gets generated as part of toolchain creation (and eventually libc
too). So eventually anyone running on a hardware without zimop/zcmop must be
first building toolchain from scratch in order to build userspace rootfs and
later packages. This sounds like a significant chunk of work and at that point
they might as well just build kernel without `CONFIG_RISCV_USER_CFI` and should
get vDSO without any cfi instructions in them.

Thus I did not decide to provide multi-vDSO support in kernel considering it a
futile exercise. I wanted to put my thought process here so that there is some
discussion on this.

On Thu, May 22, 2025 at 10:31:26PM -0700, Deepak Gupta wrote:
>From: Jim Shu <jim.shu@sifive.com>
>
>user mode tasks compiled with zicfilp may call indirectly into vdso (like
>hwprobe indirect calls). Add landing pad compile support in vdso. vdso
>with landing pad in it will be nop for tasks which have not enabled
>landing pad.
>This patch allows to run user mode tasks with cfi eanbled and do no harm.
>
>Future work can be done on this to do below
> - labeled landing pad on vdso functions (whenever labeling support shows
>   up in gnu-toolchain)
> - emit shadow stack instructions only in vdso compiled objects as part of
>   kernel compile.
>
>Signed-off-by: Jim Shu <jim.shu@sifive.com>
>Reviewed-by: Zong Li <zong.li@sifive.com>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>---
> arch/riscv/Makefile                   |  5 +++-
> arch/riscv/include/asm/assembler.h    | 44 +++++++++++++++++++++++++++++++++++
> arch/riscv/kernel/vdso/Makefile       |  6 +++++
> arch/riscv/kernel/vdso/flush_icache.S |  4 ++++
> arch/riscv/kernel/vdso/getcpu.S       |  4 ++++
> arch/riscv/kernel/vdso/rt_sigreturn.S |  4 ++++
> arch/riscv/kernel/vdso/sys_hwprobe.S  |  4 ++++
> 7 files changed, 70 insertions(+), 1 deletion(-)
>
>diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>index 539d2aef5cab..c2dd09bb9db3 100644
>--- a/arch/riscv/Makefile
>+++ b/arch/riscv/Makefile
>@@ -88,9 +88,12 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
> # Check if the toolchain supports Zabha
> riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
>
>+KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>+export KBUILD_BASE_ISA
>+
> # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
> # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
>-KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>+KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
>
> KBUILD_AFLAGS += -march=$(riscv-march-y)
>
>diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/assembler.h
>index 44b1457d3e95..a058ea5e9c58 100644
>--- a/arch/riscv/include/asm/assembler.h
>+++ b/arch/riscv/include/asm/assembler.h
>@@ -80,3 +80,47 @@
> 	.endm
>
> #endif	/* __ASM_ASSEMBLER_H */
>+
>+#if defined(CONFIG_RISCV_USER_CFI) && (__riscv_xlen == 64)
>+.macro vdso_lpad
>+lpad 0
>+.endm
>+#else
>+.macro vdso_lpad
>+.endm
>+#endif
>+
>+/*
>+ * This macro emits a program property note section identifying
>+ * architecture features which require special handling, mainly for
>+ * use in assembly files included in the VDSO.
>+ */
>+#define NT_GNU_PROPERTY_TYPE_0  5
>+#define GNU_PROPERTY_RISCV_FEATURE_1_AND 0xc0000000
>+
>+#define GNU_PROPERTY_RISCV_FEATURE_1_ZICFILP      (1U << 0)
>+#define GNU_PROPERTY_RISCV_FEATURE_1_ZICFISS      (1U << 1)
>+
>+#if defined(CONFIG_RISCV_USER_CFI) && (__riscv_xlen == 64)
>+#define GNU_PROPERTY_RISCV_FEATURE_1_DEFAULT \
>+	(GNU_PROPERTY_RISCV_FEATURE_1_ZICFILP)
>+#endif
>+
>+#ifdef GNU_PROPERTY_RISCV_FEATURE_1_DEFAULT
>+.macro emit_riscv_feature_1_and, feat = GNU_PROPERTY_RISCV_FEATURE_1_DEFAULT
>+	.pushsection .note.gnu.property, "a"
>+	.p2align        3
>+	.word           4
>+	.word           16
>+	.word           NT_GNU_PROPERTY_TYPE_0
>+	.asciz          "GNU"
>+	.word           GNU_PROPERTY_RISCV_FEATURE_1_AND
>+	.word           4
>+	.word           \feat
>+	.word           0
>+	.popsection
>+.endm
>+#else
>+.macro emit_riscv_feature_1_and, feat = 0
>+.endm
>+#endif
>diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>index ad73607abc28..441c5431d27e 100644
>--- a/arch/riscv/kernel/vdso/Makefile
>+++ b/arch/riscv/kernel/vdso/Makefile
>@@ -13,12 +13,18 @@ vdso-syms += flush_icache
> vdso-syms += hwprobe
> vdso-syms += sys_hwprobe
>
>+ifdef CONFIG_RISCV_USER_CFI
>+LPAD_MARCH = _zicfilp_zicfiss -fcf-protection=full
>+endif
>+
> # Files to link into the vdso
> obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
>
> ccflags-y := -fno-stack-protector
> ccflags-y += -DDISABLE_BRANCH_PROFILING
> ccflags-y += -fno-builtin
>+ccflags-y += $(KBUILD_BASE_ISA)$(LPAD_MARCH)
>+asflags-y += $(KBUILD_BASE_ISA)$(LPAD_MARCH)
>
> ifneq ($(c-gettimeofday-y),)
>   CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
>diff --git a/arch/riscv/kernel/vdso/flush_icache.S b/arch/riscv/kernel/vdso/flush_icache.S
>index 8f884227e8bc..e4c56970905e 100644
>--- a/arch/riscv/kernel/vdso/flush_icache.S
>+++ b/arch/riscv/kernel/vdso/flush_icache.S
>@@ -5,11 +5,13 @@
>
> #include <linux/linkage.h>
> #include <asm/unistd.h>
>+#include <asm/assembler.h>
>
> 	.text
> /* int __vdso_flush_icache(void *start, void *end, unsigned long flags); */
> SYM_FUNC_START(__vdso_flush_icache)
> 	.cfi_startproc
>+	vdso_lpad
> #ifdef CONFIG_SMP
> 	li a7, __NR_riscv_flush_icache
> 	ecall
>@@ -20,3 +22,5 @@ SYM_FUNC_START(__vdso_flush_icache)
> 	ret
> 	.cfi_endproc
> SYM_FUNC_END(__vdso_flush_icache)
>+
>+emit_riscv_feature_1_and
>diff --git a/arch/riscv/kernel/vdso/getcpu.S b/arch/riscv/kernel/vdso/getcpu.S
>index 9c1bd531907f..5c1ecc4e1465 100644
>--- a/arch/riscv/kernel/vdso/getcpu.S
>+++ b/arch/riscv/kernel/vdso/getcpu.S
>@@ -5,14 +5,18 @@
>
> #include <linux/linkage.h>
> #include <asm/unistd.h>
>+#include <asm/assembler.h>
>
> 	.text
> /* int __vdso_getcpu(unsigned *cpu, unsigned *node, void *unused); */
> SYM_FUNC_START(__vdso_getcpu)
> 	.cfi_startproc
>+	vdso_lpad
> 	/* For now, just do the syscall. */
> 	li a7, __NR_getcpu
> 	ecall
> 	ret
> 	.cfi_endproc
> SYM_FUNC_END(__vdso_getcpu)
>+
>+emit_riscv_feature_1_and
>diff --git a/arch/riscv/kernel/vdso/rt_sigreturn.S b/arch/riscv/kernel/vdso/rt_sigreturn.S
>index 3dc022aa8931..e82987dc3739 100644
>--- a/arch/riscv/kernel/vdso/rt_sigreturn.S
>+++ b/arch/riscv/kernel/vdso/rt_sigreturn.S
>@@ -5,12 +5,16 @@
>
> #include <linux/linkage.h>
> #include <asm/unistd.h>
>+#include <asm/assembler.h>
>
> 	.text
> SYM_FUNC_START(__vdso_rt_sigreturn)
> 	.cfi_startproc
> 	.cfi_signal_frame
>+	vdso_lpad
> 	li a7, __NR_rt_sigreturn
> 	ecall
> 	.cfi_endproc
> SYM_FUNC_END(__vdso_rt_sigreturn)
>+
>+emit_riscv_feature_1_and
>diff --git a/arch/riscv/kernel/vdso/sys_hwprobe.S b/arch/riscv/kernel/vdso/sys_hwprobe.S
>index 77e57f830521..f1694451a60c 100644
>--- a/arch/riscv/kernel/vdso/sys_hwprobe.S
>+++ b/arch/riscv/kernel/vdso/sys_hwprobe.S
>@@ -3,13 +3,17 @@
>
> #include <linux/linkage.h>
> #include <asm/unistd.h>
>+#include <asm/assembler.h>
>
> .text
> SYM_FUNC_START(riscv_hwprobe)
> 	.cfi_startproc
>+	vdso_lpad
> 	li a7, __NR_riscv_hwprobe
> 	ecall
> 	ret
>
> 	.cfi_endproc
> SYM_FUNC_END(riscv_hwprobe)
>+
>+emit_riscv_feature_1_and
>
>-- 
>2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
