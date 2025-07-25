Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C92C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0cuHuCs3WTt56zytfEbzaupsu311ljqLlvYNJ24sik=; b=J0zOaKu32pWWqm
	VQZvTS1KpYWEDGoubzzZKyDg5jLDJ6JFWhEfeCitVvyKgVJ/WCEX6FH4hiLz8vYSz8zhSun8jobuu
	pZh2SAzabkW2ihDHZGZzVsSyDVCBqrKBFuw7fLQVlYc5+XHvLmV92R3Qj/FriwalrsBZSdzTPMuuD
	42Oz+TGZs3Oy6uqtPKk7Z0mWvqA+OIcJBWhCQyk0PsgLJTJEaCsqsxPOvkKphUj73H8jnk/a0QpTy
	EUEYoQtx5n8EV4mUr9H73SQBKWmKqHQmrM3EQwFyN3kTaN4VCY2JHh9/hhoYzXzTbWUSSSQSdbKDv
	9Ok1M+yS8R90i5WorE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufH6M-00000009loM-3rEK;
	Fri, 25 Jul 2025 12:00:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGZh-00000009hxY-4Bke
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 11:26:55 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 862313FCE1
	for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753442810;
	bh=/9lBchv8Xl3/zU+kUSWuOOJSWBoJGBapA/sirJQnK+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=IoQJOh4sNZovBP8WnVd0cx64alEswS+yTOFmW8EY5WbjHv10LpzDS5t9otczGpnSP
	 pDnRVj6g9xbR3iDtuRXV5289FqGdHlkLGICTUh52SbhYRfJFwZa+taHzrMANcp4dSN
	 V9ve2ciXnsA7nqo0JMQRHlVHg9518igys0Mg9MOhL9JNstiwIcZ226iNqxRw48g5l0
	 BMHJLL/tk+RTaHqF1B4GKXA+LfpVT9FZBZJJ82xWgDSAC0dkQGl5SyjPkrr0FlmKc/
	 gfleo7wH7i+OKHSpWQTjVUsU9saPKqzwFrbz4k0oI76PBGqvU5Bn/gLJb7D1qwE3SO
	 Lyem+tgQmpKsg==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ae3c5ca46f2so159139366b.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 04:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753442809; x=1754047609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9lBchv8Xl3/zU+kUSWuOOJSWBoJGBapA/sirJQnK+E=;
        b=cpQSCMFpvVmGZ/yFWhT6f7JBjKpFkCD9fcFDCv4MEGJgDCFX8KUY2KywPqEablPHWS
         ZejzdyrM0IZJrKaeSnaBs4jOc7pDfiTO85OJbFpRjn+5dw1sm03fJ6FCEqkScGCjoCck
         s+q3YI+GnMSIxlMlLGFkSHDdRsBV21XLh2/lwQimkr8cLp7M5u8pJlAtUamiJyCJhgzy
         4mLYuyd3OmIURi0mgQjv4WYu+2/iu3Vmq5awG6PM6BpRK2jfBuoVv2uoqQCYxa6y/BG7
         6ppQnI60Nfce80d/tyAoKQ5vphyTLDfYw5VJEAKg/QN42xFOWdXquztYhMCDEPr9Hbvr
         H83A==
X-Gm-Message-State: AOJu0Yz0Ou5ZQ1HPcNtXeX8junk8EbCTGKUsd4sH8Tha6mSGo+Vxkm4o
	9x/ODJ/NMSwX/GWP+fQqbOBAQ3gRyZoQP1pKRJafRb4lGtMnSux8EcPlHdhXio6ng2y0eOiG7Ru
	NxnFyi3HA1gBu4x+5SlPolw3icqdxVIoeIlfqzGCIaZzS8Wg0P4ch47iHNXywkdKu2uKC+uVSy8
	JvkstG+7TWCw==
X-Gm-Gg: ASbGncurYtH0nxl8ia5skdRwwunkYeYYnqGM4ZG2dni4ltYpcMwWMpuLSPzJD/ZUNKA
	zchTWYqNQRvSNJxu/ulEPQh3/Zzlbh4VVaCW4j1QIxwkpEVvXD2D6dnteX/ccIYlszJMHEmwrIS
	GSZIUjs2nPVh+vUVi/K2udJzaGF7AdbYtwPnSp4u8wkBSylqdoeSWAA1g/vRS/3oxaUsfyWmQjv
	rMmBe0S75Tt6HsNbEMFIRsFs9gwGnTIKlV5UVV9idnkmSLWXdNn6U+CnKewyLHmvd8FMgoYfHyQ
	QsYg3cCTXQdqeZO4iqXKXLRjhTF7KmMEtJTMXk3f+MftjKi0nWoZ+wKrkx7kVfc+I3e+gYX4s12
	o5WxOwU27DUrPc7gs46AN1kEXiKq8mnkiucHS
X-Received: by 2002:a17:907:868b:b0:ae0:dd95:1991 with SMTP id a640c23a62f3a-af619efda7fmr218779366b.51.1753442808347;
        Fri, 25 Jul 2025 04:26:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF62wP3IqAMJ1/E1mQqpiMFCO0fY8T1aVjgbgNEGN4i3p5BpL7PdyFIzDt2eRf4SEXlVdUVvQ==
X-Received: by 2002:a17:907:868b:b0:ae0:dd95:1991 with SMTP id a640c23a62f3a-af619efda7fmr218773366b.51.1753442807745;
        Fri, 25 Jul 2025 04:26:47 -0700 (PDT)
Received: from [192.168.103.102] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd31ac41sm1898416a12.54.2025.07.25.04.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:26:47 -0700 (PDT)
Message-ID: <b50da4ef-53ca-4edf-bd74-f5e037a14f99@canonical.com>
Date: Fri, 25 Jul 2025 13:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] riscv: Kconfig & Makefile for riscv kernel control
 flow integrity
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-11-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-11-04b8fa44c98c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_042654_433193_80074A05 
X-CRM114-Status: GOOD (  27.51  )
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

On 25.07.25 01:37, Deepak Gupta wrote:
> Defines `CONFIG_RISCV_KERNEL_CFI` and selects SHADOW_CALL_STACK
> and ARCH_HAS_KERNEL_SHADOW_STACK both so that zicfiss can be wired up.
> 
> Makefile checks if CONFIG_RISCV_KERNEL_CFI is enabled, then light
> up zicfiss and zicfilp compiler flags. CONFIG_RISCV_KERNEL_CFI is
> dependent on CONFIG_RISCV_USER_CFI. There is no reason for user to
> not select support for user cfi while enabling for kernel.
> 
> compat vdso don't need fcf-protection (toolchain lacks support).
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/Kconfig                     | 37 +++++++++++++++++++++++++++++++++-
>   arch/riscv/Makefile                    |  8 ++++++++
>   arch/riscv/kernel/compat_vdso/Makefile |  2 +-
>   arch/riscv/kernel/vdso/Makefile        |  2 +-
>   4 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 385c3d93e378..305ba5787f74 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -245,7 +245,7 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
>   	depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C
>   
>   config HAVE_SHADOW_CALL_STACK
> -	def_bool $(cc-option,-fsanitize=shadow-call-stack)
> +	def_bool $(cc-option,-fsanitize=shadow-call-stack) || $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
>   	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
>   	depends on $(ld-option,--no-relax-gp)
>   
> @@ -864,6 +864,16 @@ config RISCV_ISA_ZICBOP
>   
>   	  If you don't know what to do here, say Y.
>   
> +config TOOLCHAIN_HAS_ZICFILP
> +	bool
> +	default y
> +	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp)
> +
> +config TOOLCHAIN_HAS_ZICFISS
> +	bool
> +	default y
> +	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
> +
>   config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>   	def_bool y
>   	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
> @@ -1182,6 +1192,31 @@ config RISCV_USER_CFI
>   	  space does not get protection "for free".
>   	  default n.
>   
> +config RISCV_KERNEL_CFI
> +	def_bool n
> +	bool "hw assisted riscv kernel control flow integrity (kcfi)"
> +	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
> +	depends on RISCV_USER_CFI
> +	select ARCH_SUPPORTS_SHADOW_CALL_STACK
> +	select SHADOW_CALL_STACK
> +	select ARCH_HAS_KERNEL_SHADOW_STACK
> +	help
> +	  Provides CPU assisted control flow integrity to for riscv kernel.
> +	  Control flow integrity is provided by implementing shadow stack for
> +	  backward edge and indirect branch tracking for forward edge. Shadow
> +	  stack protection is a hardware feature that detects function return
> +	  address corruption. This helps mitigate ROP attacks. RISCV_KERNEL_CFI
> +	  selects CONFIG_SHADOW_CALL_STACK which uses software based shadow
> +	  stack but is unprotected against stray writes. Selecting RISCV_KERNEL_CFI
> +	  will select CONFIG_DYNAMIC_SCS and will enable hardware assisted shadow
> +	  stack protection against stray writes.

Please, consider adding a blank line for better readability.

> +	  Indirect branch tracking enforces that all indirect branches must land
> +	  on a landing pad instruction else CPU will fault. This enables forward
> +	  control flow (call/jmp) protection in kernel and restricts all indirect
> +	  call or jump in kernel to a landing pad instruction which mostly likely
> +	  will be start of the function.
> +	  default n

For Linux distributions it is important that the same kernel can run 
both on hardware both with and without CFI support. The description 
provided does not help to understand if RISCV_KERNEL_CFI=y will result 
in such a kernel. Please, enumerate the minimum set of extensions needed 
for supporting a kernel built with RISCV_KERNEL_CFI=y. I guess this will 
at least include Zimop.

Best regards

Heinrich

> +
>   endmenu # "Kernel features"
>   
>   menu "Boot options"
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 7128df832b28..6ef30a3d2bc4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -61,8 +61,10 @@ else ifeq ($(CONFIG_LTO_CLANG),y)
>   endif
>   
>   ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
> +ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>   	KBUILD_LDFLAGS += --no-relax-gp
>   endif
> +endif
>   
>   # ISA string setting
>   riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
> @@ -91,6 +93,12 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
>   KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>   export KBUILD_BASE_ISA
>   
> +ifeq ($(CONFIG_RISCV_KERNEL_CFI),y)
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFILP) := $(riscv-march-y)_zicfilp
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFISS) := $(riscv-march-y)_zicfiss
> +KBUILD_CFLAGS += -fcf-protection=full
> +KBUILD_AFLAGS += -fcf-protection=full
> +endif
>   # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
>   # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
>   KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
> diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
> index 24e37d1ef7ec..552131bc34d7 100644
> --- a/arch/riscv/kernel/compat_vdso/Makefile
> +++ b/arch/riscv/kernel/compat_vdso/Makefile
> @@ -69,4 +69,4 @@ quiet_cmd_compat_vdsold = VDSOLD  $@
>   
>   # actual build commands
>   quiet_cmd_compat_vdsoas = VDSOAS  $@
> -      cmd_compat_vdsoas = $(COMPAT_CC) $(a_flags) $(COMPAT_CC_FLAGS) -c -o $@ $<
> +      cmd_compat_vdsoas = $(COMPAT_CC) $(filter-out -fcf-protection=full, $(a_flags)) $(COMPAT_CC_FLAGS) -c -o $@ $<
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 2b528d82fa7d..7b1446b63ebc 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -17,7 +17,7 @@ ifdef CONFIG_VDSO_GETRANDOM
>   vdso-syms += getrandom
>   endif
>   
> -ifdef CONFIG_RISCV_USER_CFI
> +ifneq ($(CONFIG_RISCV_USER_CFI), $(CONFIG_RISCV_KERNEL_CFI))
>   CFI_MARCH = _zicfilp_zicfiss
>   CFI_FULL = -fcf-protection=full
>   endif
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
