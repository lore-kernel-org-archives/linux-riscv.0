Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA96EC369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 14:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIkoECFuaQxVCjnGwv8FG4r7r2U3GaRbiRXXaKB9upk=; b=B9v15F4f6Z87prxkJ5crODMgmA
	xGDHb1eB8TwFrL/1Ugakm7hYoUsvXujZqAQ4AITpg7CgNSs03dM5hWk+cJAhqIANhuWMwB1MJ3AOr
	E6454Gi3imwfxTRXgLCcEcsuYYTbETkb1nOOdzVpXU1Hdfgb49LwXJhf7HZyg6kQiU6dvYG6o2qS+
	+IPQUInrWtIB9raciJvFBRkZl5GEuWNcofb9D8PKu3Vdxv2oSMcSiSlq+/yroazaqrykL+L1+LNXn
	6T0vau/aiP7Xo5rHCyoFpfreFjQqOTfuqpisnpd42Rbx+l5Z5kAH849WgUrXTbIb/Zm+PB8uz0/rF
	4nX/YQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wsi-00000007Zen-3LgQ;
	Wed, 09 Apr 2025 14:58:24 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WPd-00000007SFl-3Y12
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 14:28:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-227b828de00so69212085ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744208901; x=1744813701; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKdsZVjEB+ld4A+96BXpcZU7N3NQ0asG+U4PZDEXS+s=;
        b=XXihYTskM2+wpn8MAI9MJEfWw1axm89j9/5L3LkXvNcMQgLjtLjsfHpr40c1cVB+kU
         IqvZ7hHWop1Ki/Klsgghq8ZOovO4d7z2vmsZvmoGXi75xb9DkF0m5UQ6NkLBjiCs5QYA
         sSUJCOud/JshZK9Hf2WsafhKNPyHyTGYDybRfYc4JlwRQYNkIBDB6vRpBbq8nfOC+Fzu
         2/LMUbiY+BFSOcrKLnoJPNhQubfoOdULZOnqjX28N4jLXoixYpT4uFfyAVNZcVkxnFxY
         YNIs1DdBGNLy5ds2T+4iCHngzPxkGE6npqv0ryxgRjb8UUVxdLJb9ytD/9qKmOqSa65+
         uRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208901; x=1744813701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKdsZVjEB+ld4A+96BXpcZU7N3NQ0asG+U4PZDEXS+s=;
        b=GFcOD0425ZY6uzU0n+mdR+jr/euC2Tpz/4s39ViC6mb8OLxhUK0o4+LgtwfEcE50fu
         K+1IbcImCnWZivY5k72dcLpzxtVqOApyktx7YPJf8ofm/GtukJ+2olzJxgXNbPlJxHNQ
         gzxI/I5VowIKWLRjtw/v+r/fKVGH5zEhkaHMIw2Vlsm2fmmMCaKUV5lNuVI5xB1LO7ZT
         GTgzNJ0TDcagtxP4dSyvJi4Ti+MVxnnJwEW42H7XiH2rO7qAYjGmsFKbNGOfwgT0d1B5
         BxPAVJHCMPKRk57jgYfVM2cTJSHbGXK3lkz2v3S41fKnOp0GAgTM1Jk4NTXdR8jWTS86
         eH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYzPXQ6QydGuZIMoo3MuAHyoNZ+WPHLgA0ul7TPe0+3fJ9ipXWhwTy5MCIqdkgXFjE6G/pBh+4cBVApQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpM0ZAU+ZExZWw7ZOF/8Ko+pfOwojlpJavHVppyqYPbMpxWJ7F
	BQfTTFVsZLr/4d+yuksx+NS7i+HmuLwOj+D78nhDCOdukMlPCwHk0MTvwPRd9e0=
X-Gm-Gg: ASbGnctHKxDuDUYMakQnfDcZiBjc9UL1pLUsk5eh49kiqRwgNz5Xfrw0L+Q3nDlCNyQ
	Wb/bu+wM12WdU7p2NjyToDQrA9gGErfBiwqhyW+WX4ugbkY0oq29KoVI5vEFmygoJ3Qy20gzwDJ
	VHI2/uirs2DTuKy47MrW40fqxo+TvqmC/U5/tYiOcEVxFyfQxegPdMU2Aza2VV8BxqhwvynjlRR
	dGZkoGsZL24YvzhqB3qHIigI/YDKyIa9qqJcS0lw+qzd1DCnp0Vzta18FqLqIKGS0+RpuAsz8uI
	GOgiKyMReKq9qlBlNZezFYzn5ktCXZSR7tVHEMX5NbtLH6/9NANmm4t/HF+SQA==
X-Google-Smtp-Source: AGHT+IEZcb3DjiGcYzGFWX/udT1ybgSSFf/OKSBgPoOLDb9/c2yI1PJe1NZkwsT9h6HK1NAI3V+uKw==
X-Received: by 2002:a17:903:1787:b0:224:1220:7f40 with SMTP id d9443c01a7336-22ac298441fmr44614275ad.3.1744208900819;
        Wed, 09 Apr 2025 07:28:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cafdaasm12457775ad.165.2025.04.09.07.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:28:20 -0700 (PDT)
Date: Wed, 9 Apr 2025 07:28:17 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v12 24/28] arch/riscv: compile vdso with landing pad
Message-ID: <Z_aEAWFnNYMhEYaq@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-24-e51202b53138@rivosinc.com>
 <4f6a0c65-7c3a-4457-8b0b-cd39f40931c8@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f6a0c65-7c3a-4457-8b0b-cd39f40931c8@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_072821_880822_FDB406A8 
X-CRM114-Status: GOOD (  17.45  )
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

On Tue, Apr 08, 2025 at 02:45:25PM +0200, Alexandre Ghiti wrote:
>
>On 14/03/2025 22:39, Deepak Gupta wrote:
>>From: Jim Shu <jim.shu@sifive.com>
>>
>>user mode tasks compiled with zicfilp may call indirectly into vdso (like
>>hwprobe indirect calls). Add landing pad compile support in vdso. vdso
>>with landing pad in it will be nop for tasks which have not enabled
>>landing pad.
>>This patch allows to run user mode tasks with cfi eanbled and do no harm.
>>
>>Future work can be done on this to do below
>>  - labeled landing pad on vdso functions (whenever labeling support shows
>>    up in gnu-toolchain)
>>  - emit shadow stack instructions only in vdso compiled objects as part of
>>    kernel compile.
>>
>>Signed-off-by: Jim Shu <jim.shu@sifive.com>
>>Reviewed-by: Zong Li <zong.li@sifive.com>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/Makefile                   |  5 +++-
>>  arch/riscv/include/asm/assembler.h    | 44 +++++++++++++++++++++++++++++++++++
>>  arch/riscv/kernel/vdso/Makefile       | 12 ++++++++++
>>  arch/riscv/kernel/vdso/flush_icache.S |  4 ++++
>>  arch/riscv/kernel/vdso/getcpu.S       |  4 ++++
>>  arch/riscv/kernel/vdso/rt_sigreturn.S |  4 ++++
>>  arch/riscv/kernel/vdso/sys_hwprobe.S  |  4 ++++
>>  7 files changed, 76 insertions(+), 1 deletion(-)
>>
>>diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>>index 13fbc0f94238..eca94246cda6 100644
>>--- a/arch/riscv/Makefile
>>+++ b/arch/riscv/Makefile
>>@@ -88,9 +88,12 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
>>  # Check if the toolchain supports Zabha
>>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
>>+KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>>+export KBUILD_BASE_ISA
>>+
>>  # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
>>  # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
>>-KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>>+KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
>>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>>diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/assembler.h
>>index 44b1457d3e95..a058ea5e9c58 100644
>>--- a/arch/riscv/include/asm/assembler.h
>>+++ b/arch/riscv/include/asm/assembler.h
>>@@ -80,3 +80,47 @@
>>  	.endm
>>  #endif	/* __ASM_ASSEMBLER_H */
>>+
>>+#if defined(CONFIG_RISCV_USER_CFI) && (__riscv_xlen == 64)
>>+.macro vdso_lpad
>>+lpad 0
>>+.endm
>>+#else
>>+.macro vdso_lpad
>>+.endm
>>+#endif
>>+
>>+/*
>>+ * This macro emits a program property note section identifying
>>+ * architecture features which require special handling, mainly for
>>+ * use in assembly files included in the VDSO.
>>+ */
>>+#define NT_GNU_PROPERTY_TYPE_0  5
>>+#define GNU_PROPERTY_RISCV_FEATURE_1_AND 0xc0000000
>>+
>>+#define GNU_PROPERTY_RISCV_FEATURE_1_ZICFILP      (1U << 0)
>>+#define GNU_PROPERTY_RISCV_FEATURE_1_ZICFISS      (1U << 1)
>>+
>>+#if defined(CONFIG_RISCV_USER_CFI) && (__riscv_xlen == 64)
>>+#define GNU_PROPERTY_RISCV_FEATURE_1_DEFAULT \
>>+	(GNU_PROPERTY_RISCV_FEATURE_1_ZICFILP)
>>+#endif
>>+
>>+#ifdef GNU_PROPERTY_RISCV_FEATURE_1_DEFAULT
>>+.macro emit_riscv_feature_1_and, feat = GNU_PROPERTY_RISCV_FEATURE_1_DEFAULT
>>+	.pushsection .note.gnu.property, "a"
>>+	.p2align        3
>>+	.word           4
>>+	.word           16
>>+	.word           NT_GNU_PROPERTY_TYPE_0
>>+	.asciz          "GNU"
>>+	.word           GNU_PROPERTY_RISCV_FEATURE_1_AND
>>+	.word           4
>>+	.word           \feat
>>+	.word           0
>>+	.popsection
>>+.endm
>>+#else
>>+.macro emit_riscv_feature_1_and, feat = 0
>>+.endm
>>+#endif
>>diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>>index 9a1b555e8733..daa10c2b0dd1 100644
>>--- a/arch/riscv/kernel/vdso/Makefile
>>+++ b/arch/riscv/kernel/vdso/Makefile
>>@@ -13,12 +13,18 @@ vdso-syms += flush_icache
>>  vdso-syms += hwprobe
>>  vdso-syms += sys_hwprobe
>>+ifdef CONFIG_RISCV_USER_CFI
>>+LPAD_MARCH = _zicfilp
>>+endif
>>+
>>  # Files to link into the vdso
>>  obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
>>  ccflags-y := -fno-stack-protector
>>  ccflags-y += -DDISABLE_BRANCH_PROFILING
>>  ccflags-y += -fno-builtin
>>+ccflags-y += $(KBUILD_BASE_ISA)$(LPAD_MARCH)
>>+asflags-y += $(KBUILD_BASE_ISA)$(LPAD_MARCH)
>>  ifneq ($(c-gettimeofday-y),)
>>    CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
>>@@ -40,6 +46,12 @@ endif
>>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
>>  CFLAGS_REMOVE_hwprobe.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
>>+# Disable profiling and instrumentation for VDSO code
>>+GCOV_PROFILE := n
>>+KCOV_INSTRUMENT := n
>>+KASAN_SANITIZE := n
>>+UBSAN_SANITIZE := n
>
>
>So I looked into this and it seems it is not needed. All the profilers 
>above only add their corresponding "clags" if the object 
>"is-kernel-object" (https://elixir.bootlin.com/linux/v6.14-rc6/source/scripts/Makefile.lib#L147) 
>which is not the case for hwprobe.c since it is not added to obj-y.

Noted. Will remove it.

>
>
>>+
>>  # Force dependency
>>  $(obj)/vdso.o: $(obj)/vdso.so
>>diff --git a/arch/riscv/kernel/vdso/flush_icache.S b/arch/riscv/kernel/vdso/flush_icache.S
>>index 8f884227e8bc..e4c56970905e 100644
>>--- a/arch/riscv/kernel/vdso/flush_icache.S
>>+++ b/arch/riscv/kernel/vdso/flush_icache.S
>>@@ -5,11 +5,13 @@
>>  #include <linux/linkage.h>
>>  #include <asm/unistd.h>
>>+#include <asm/assembler.h>
>>  	.text
>>  /* int __vdso_flush_icache(void *start, void *end, unsigned long flags); */
>>  SYM_FUNC_START(__vdso_flush_icache)
>>  	.cfi_startproc
>>+	vdso_lpad
>>  #ifdef CONFIG_SMP
>>  	li a7, __NR_riscv_flush_icache
>>  	ecall
>>@@ -20,3 +22,5 @@ SYM_FUNC_START(__vdso_flush_icache)
>>  	ret
>>  	.cfi_endproc
>>  SYM_FUNC_END(__vdso_flush_icache)
>>+
>>+emit_riscv_feature_1_and
>>diff --git a/arch/riscv/kernel/vdso/getcpu.S b/arch/riscv/kernel/vdso/getcpu.S
>>index 9c1bd531907f..5c1ecc4e1465 100644
>>--- a/arch/riscv/kernel/vdso/getcpu.S
>>+++ b/arch/riscv/kernel/vdso/getcpu.S
>>@@ -5,14 +5,18 @@
>>  #include <linux/linkage.h>
>>  #include <asm/unistd.h>
>>+#include <asm/assembler.h>
>>  	.text
>>  /* int __vdso_getcpu(unsigned *cpu, unsigned *node, void *unused); */
>>  SYM_FUNC_START(__vdso_getcpu)
>>  	.cfi_startproc
>>+	vdso_lpad
>>  	/* For now, just do the syscall. */
>>  	li a7, __NR_getcpu
>>  	ecall
>>  	ret
>>  	.cfi_endproc
>>  SYM_FUNC_END(__vdso_getcpu)
>>+
>>+emit_riscv_feature_1_and
>>diff --git a/arch/riscv/kernel/vdso/rt_sigreturn.S b/arch/riscv/kernel/vdso/rt_sigreturn.S
>>index 3dc022aa8931..e82987dc3739 100644
>>--- a/arch/riscv/kernel/vdso/rt_sigreturn.S
>>+++ b/arch/riscv/kernel/vdso/rt_sigreturn.S
>>@@ -5,12 +5,16 @@
>>  #include <linux/linkage.h>
>>  #include <asm/unistd.h>
>>+#include <asm/assembler.h>
>>  	.text
>>  SYM_FUNC_START(__vdso_rt_sigreturn)
>>  	.cfi_startproc
>>  	.cfi_signal_frame
>>+	vdso_lpad
>>  	li a7, __NR_rt_sigreturn
>>  	ecall
>>  	.cfi_endproc
>>  SYM_FUNC_END(__vdso_rt_sigreturn)
>>+
>>+emit_riscv_feature_1_and
>>diff --git a/arch/riscv/kernel/vdso/sys_hwprobe.S b/arch/riscv/kernel/vdso/sys_hwprobe.S
>>index 77e57f830521..f1694451a60c 100644
>>--- a/arch/riscv/kernel/vdso/sys_hwprobe.S
>>+++ b/arch/riscv/kernel/vdso/sys_hwprobe.S
>>@@ -3,13 +3,17 @@
>>  #include <linux/linkage.h>
>>  #include <asm/unistd.h>
>>+#include <asm/assembler.h>
>>  .text
>>  SYM_FUNC_START(riscv_hwprobe)
>>  	.cfi_startproc
>>+	vdso_lpad
>>  	li a7, __NR_riscv_hwprobe
>>  	ecall
>>  	ret
>>  	.cfi_endproc
>>  SYM_FUNC_END(riscv_hwprobe)
>>+
>>+emit_riscv_feature_1_and
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
