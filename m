Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C111CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qdRePDdu/gTORT7AwxDYRD2CGpvudA1hxoPnvJXnQEQ=; b=p3k5Lbl65KVfJnZV8FuIFN2p7u
	IjuCjYw0cO7oVKOBRo76ELoa2pSZvQq0ktHIgLdubFEnrIm4VjBh2WDlizxcsr2hgXMbbsS0alOfF
	GJkAbH+bfCwAyXL9jERgK1mQlPldFXdcCJJCPoIAXoHFOpaLJ+zpbVnZt8EK4p+3eMtqlipGqHoPx
	0pzUNFo4emE3i8vR+d5rc3L6EKns/USl7CXeiCBORGOtyFRVe12t2tcfXLMyNku/5rTKERgDXITF8
	x5LooWY0fgXoaDBV5349931BbHZQpA8I4elIvOMfe6RtGhhr+fGNG0jYKaWwuDj6gQK804WIweO7t
	eLRsZ6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qknBv-00EViM-2J;
	Mon, 25 Sep 2023 15:08:07 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qknBr-00EVh2-2p
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 15:08:06 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3add37de892so3416733b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 08:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695654482; x=1696259282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0TWkUL9KVThFQGLq5BIrFH6iYPSYT+Kef88uuZlyx4=;
        b=mUqhlQ8sQCk8BBURVLXYeF6nyNRuKcV6zaZENpf7KMLrMsjmxAwL+c7DSLyvovn/Kc
         EWdBQUcD4l8TatnEBp8ry4+fCiIi2yqZr5E0GLsPpKHTk/Tik99NEpvQncdC8ZnNia/z
         d25oh9ccCX2vsdqg74Ceois6elKgJ0Y78TCPFs7pS8BdJchElsjSNSQPR9DnYllt0X9U
         R0k4GJdGQ+dIz9sZNHOgmjuTJ5e6Kc5A7XwApmDjJQvJRiCFkXFZGzCLweFQ1qbzhFuG
         v3ZfCUVU0FTlMK0jfas0PO+EdhBs5bD1k6Ksx6Il9jQlYeciA2WJ5W9J016LsIfHYUtT
         5D1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695654482; x=1696259282;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0TWkUL9KVThFQGLq5BIrFH6iYPSYT+Kef88uuZlyx4=;
        b=Qc0c05fsfol1eIE0pq8FXJulN2kzFSCoAziutX1aXLMf+y8TC2ZWoVYxO6HKmNDWUg
         +8CKtAFmxQBRswSRJdBVliigODnVlCrcfLwKvrbynpPZaEw56CgiNC39FCThQzj4h2OK
         4uM1LxpAWaYC+zykILwAiYnGX4PK8nAul0mpP/JH+WVM52KiPbC0v3LEbHN9uYVVLxFi
         BJfmtw9gVFWw/kD4895ENe5gQ05SnEExmjls7pbu2U0I0IQ8nTFD9S31PuPP8m3DlzpX
         zp41oxfhD8abRvtn6FooGCmaO6GV/q3wwpHH/hGnOdx03k6zTDZYtWbTNRYhx9JQ52Ky
         BI2A==
X-Gm-Message-State: AOJu0YzQipNN1trIJCpoAQSjZ1skkNujru/KaP6cxH1mNQb12zpzNpTF
	zrYJbHy1HAujYGgQ7X1EEWu8gw==
X-Google-Smtp-Source: AGHT+IHZ6Ka84mCE1mfCO8Z7lmY01oDm60xBzZcyy602qzp/6X+n9tYNjmxj13HAkXFoPC01vqaFUA==
X-Received: by 2002:a05:6808:1a2a:b0:3a7:7bea:d3cc with SMTP id bk42-20020a0568081a2a00b003a77bead3ccmr9005570oib.0.1695654481904;
        Mon, 25 Sep 2023 08:08:01 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id bt29-20020a63291d000000b005776aeea638sm8093781pgb.21.2023.09.25.08.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:08:00 -0700 (PDT)
Date: Mon, 25 Sep 2023 08:08:00 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Sep 2023 08:07:55 PDT (-0700)
Subject: Re: [RFC PATCH 1/1] riscv: add Kconfig.vdso
In-Reply-To: <95c2e86acbcaf8966251a471997b3f0cd3c64fbd.1684430522.git.falcon@tinylab.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, guoren@kernel.org,
  aou@eecs.berkeley.edu, ebiederm@xmission.com, keescook@chromium.org,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, falcon@tinylab.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: falcon@tinylab.org
Message-ID: <mhng-a1871255-29e2-4adc-b344-a753526cd392@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_080804_108786_F441D21E 
X-CRM114-Status: GOOD (  30.31  )
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

On Thu, 18 May 2023 10:48:52 PDT (-0700), falcon@tinylab.org wrote:
> Allow users to disable the vdso and compat vdso in Kconfig.
>
> Copied and adapted some code from arm and arm64.
>
> Size measured with a small rv64 config of v6.4-rc2:
>
>             Config | Size      | Shrink
>     ---------------|-----------|--------
>            default | 1588 KB   |
>     no compat vdso | 1584 KB   | -4 KB
>      (and) no vdso | 1576 KB   | -12 KB

Do the resulting kernels actually work?  As far as I can tell this 
disables some syscalls that would break userspace (that time-related 
stuff that would be turned off) and the lack of rt_sigreturn would need 
an executable stack (which probably cancels out any benefits from the 
smaller text size).

> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  arch/riscv/Kconfig                |  6 +-----
>  arch/riscv/Kconfig.vdso           | 28 ++++++++++++++++++++++++++++
>  arch/riscv/Makefile               |  8 +++++---
>  arch/riscv/include/asm/elf.h      |  6 ++++--
>  arch/riscv/include/asm/mmu.h      |  2 ++
>  arch/riscv/include/asm/vdso.h     |  8 ++++----
>  arch/riscv/kernel/Makefile        |  4 ++--
>  arch/riscv/kernel/alternative.c   |  2 +-
>  arch/riscv/kernel/compat_signal.c |  2 ++
>  arch/riscv/kernel/entry.S         |  2 +-
>  arch/riscv/kernel/signal.c        |  4 ++--
>  arch/riscv/kernel/sys_riscv.c     |  2 +-
>  arch/riscv/kernel/vdso.c          | 10 +++++-----
>  13 files changed, 58 insertions(+), 26 deletions(-)
>  create mode 100644 arch/riscv/Kconfig.vdso
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 348c0fa1fc8c..79a6b3f1e697 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -34,7 +34,6 @@ config RISCV
>  	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
> -	select ARCH_HAS_VDSO_DATA
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>  	select ARCH_STACKWALK
> @@ -63,7 +62,6 @@ config RISCV
>  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>  	select GENERIC_EARLY_IOREMAP
>  	select GENERIC_ENTRY
> -	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
>  	select GENERIC_IDLE_POLL_SETUP
>  	select GENERIC_IOREMAP if MMU
>  	select GENERIC_IRQ_IPI if SMP
> @@ -76,8 +74,6 @@ config RISCV
>  	select GENERIC_PTDUMP if MMU
>  	select GENERIC_SCHED_CLOCK
>  	select GENERIC_SMP_IDLE_THREAD
> -	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
> -	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
>  	select HARDIRQS_SW_RESEND
>  	select HAS_IOPORT if MMU
>  	select HAVE_ARCH_AUDITSYSCALL
> @@ -105,7 +101,6 @@ config RISCV
>  	select HAVE_FUNCTION_ARG_ACCESS_API
>  	select HAVE_FUNCTION_ERROR_INJECTION
>  	select HAVE_GCC_PLUGINS
> -	select HAVE_GENERIC_VDSO if MMU && 64BIT
>  	select HAVE_IRQ_TIME_ACCOUNTING
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> @@ -262,6 +257,7 @@ config RISCV_DMA_NONCOHERENT
>  config AS_HAS_INSN
>  	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
>
> +source "arch/riscv/Kconfig.vdso"
>  source "arch/riscv/Kconfig.socs"
>  source "arch/riscv/Kconfig.errata"
>
> diff --git a/arch/riscv/Kconfig.vdso b/arch/riscv/Kconfig.vdso
> new file mode 100644
> index 000000000000..3c7ec638361d
> --- /dev/null
> +++ b/arch/riscv/Kconfig.vdso
> @@ -0,0 +1,28 @@
> +menu "VDSO selection"
> +	depends on MMU
> +
> +config VDSO
> +	bool "Enable VDSO for acceleration of some system calls" if EXPERT
> +	default y
> +	select HAVE_GENERIC_VDSO if 64BIT
> +	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
> +	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
> +	select GENERIC_TIME_VSYSCALL if 64BIT
> +	select ARCH_HAS_VDSO_DATA
> +	help
> +	  Place in the process address space an ELF shared object
> +	  providing fast implementations of gettimeofday and
> +	  clock_gettime.
> +
> +config COMPAT_VDSO
> +	bool "Enable vDSO for 32-bit applications" if EXPERT
> +	default y
> +	depends on VDSO
> +	depends on COMPAT
> +	select GENERIC_COMPAT_VDSO
> +	help
> +	  Place in the process address space of 32-bit applications an
> +	  ELF shared object providing fast implementations of gettimeofday
> +	  and clock_gettime.
> +
> +endmenu # "VDSO selection"
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0fb256bf8270..6aa32e83f812 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -130,18 +130,20 @@ endif
>  libs-y += arch/riscv/lib/
>  libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>
> +ifeq ($(CONFIG_VDSO),y)
>  PHONY += vdso_install
>  vdso_install:
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
> -	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> +	$(if $(CONFIG_COMPAT_VDSO),$(Q)$(MAKE) \
>  		$(build)=arch/riscv/kernel/compat_vdso compat_$@)
> +endif
>
>  ifeq ($(KBUILD_EXTMOD),)
> -ifeq ($(CONFIG_MMU),y)
> +ifeq ($(CONFIG_VDSO),y)
>  prepare: vdso_prepare
>  vdso_prepare: prepare0
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
> -	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> +	$(if $(CONFIG_COMPAT_VDSO),$(Q)$(MAKE) \
>  		$(build)=arch/riscv/kernel/compat_vdso include/generated/compat_vdso-offsets.h)
>
>  endif
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index 30e7d2455960..e67ed2696f23 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -78,7 +78,7 @@ extern unsigned long elf_hwcap;
>
>  #define COMPAT_ELF_PLATFORM	(NULL)
>
> -#ifdef CONFIG_MMU
> +#ifdef CONFIG_VDSO
>  #define ARCH_DLINFO						\
>  do {								\
>  	/*							\
> @@ -110,7 +110,7 @@ do {								\
>  struct linux_binprm;
>  extern int arch_setup_additional_pages(struct linux_binprm *bprm,
>  	int uses_interp);
> -#endif /* CONFIG_MMU */
> +#endif /* CONFIG_VDSO */
>
>  #define ELF_CORE_COPY_REGS(dest, regs)			\
>  do {							\
> @@ -136,10 +136,12 @@ do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)		\
>  typedef compat_ulong_t			compat_elf_greg_t;
>  typedef compat_elf_greg_t		compat_elf_gregset_t[ELF_NGREG];
>
> +#ifdef CONFIG_COMPAT_VDSO
>  extern int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
>  					      int uses_interp);
>  #define compat_arch_setup_additional_pages \
>  				compat_arch_setup_additional_pages
> +#endif
>
>  #endif /* CONFIG_COMPAT */
>  #endif /* _ASM_RISCV_ELF_H */
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index 0099dc116168..8e88e81fcc32 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -15,7 +15,9 @@ typedef struct {
>  #else
>  	atomic_long_t id;
>  #endif
> +#ifdef CONFIG_VDSO
>  	void *vdso;
> +#endif
>  #ifdef CONFIG_SMP
>  	/* A local icache flush is needed before user execution can resume. */
>  	cpumask_t icache_stale_mask;
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index f891478829a5..a4cedac5bdc9 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -12,7 +12,7 @@
>   * All systems with an MMU have a VDSO, but systems without an MMU don't
>   * support shared libraries and therefore don't have one.
>   */
> -#ifdef CONFIG_MMU
> +#ifdef CONFIG_VDSO
>
>  #define __VVAR_PAGES    2
>
> @@ -22,7 +22,7 @@
>  #define VDSO_SYMBOL(base, name)							\
>  	(void __user *)((unsigned long)(base) + __vdso_##name##_offset)
>
> -#ifdef CONFIG_COMPAT
> +#ifdef CONFIG_COMPAT_VDSO
>  #include <generated/compat_vdso-offsets.h>
>
>  #define COMPAT_VDSO_SYMBOL(base, name)						\
> @@ -30,12 +30,12 @@
>
>  extern char compat_vdso_start[], compat_vdso_end[];
>
> -#endif /* CONFIG_COMPAT */
> +#endif /* CONFIG_COMPAT_VDSO */
>
>  extern char vdso_start[], vdso_end[];
>
>  #endif /* !__ASSEMBLY__ */
>
> -#endif /* CONFIG_MMU */
> +#endif /* CONFIG_VDSO */
>
>  #endif /* _ASM_RISCV_VDSO_H */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fbdccc21418a..0bc4eb093e47 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -52,7 +52,7 @@ obj-y	+= stacktrace.o
>  obj-y	+= cacheinfo.o
>  obj-y	+= patch.o
>  obj-y	+= probes/
> -obj-$(CONFIG_MMU) += vdso.o vdso/
> +obj-$(CONFIG_VDSO) += vdso.o vdso/
>
>  obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
>  obj-$(CONFIG_FPU)		+= fpu.o
> @@ -89,6 +89,6 @@ obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>  obj-$(CONFIG_EFI)		+= efi.o
>  obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
>  obj-$(CONFIG_COMPAT)		+= compat_signal.o
> -obj-$(CONFIG_COMPAT)		+= compat_vdso/
> +obj-$(CONFIG_COMPAT_VDSO)	+= compat_vdso/
>
>  obj-$(CONFIG_64BIT)		+= pi/
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 6b75788c18e6..16e9a10e24b4 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -181,7 +181,7 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
>  				stage);
>  }
>
> -#ifdef CONFIG_MMU
> +#ifdef CONFIG_VDSO
>  static void __init apply_vdso_alternatives(void)
>  {
>  	const Elf_Ehdr *hdr;
> diff --git a/arch/riscv/kernel/compat_signal.c b/arch/riscv/kernel/compat_signal.c
> index 6ec4e34255a9..9405880b1df6 100644
> --- a/arch/riscv/kernel/compat_signal.c
> +++ b/arch/riscv/kernel/compat_signal.c
> @@ -217,8 +217,10 @@ int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
>  	if (err)
>  		return -EFAULT;
>
> +#ifdef CONFIG_COMPAT_VDSO
>  	regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
>  			current->mm->context.vdso, rt_sigreturn);
> +#endif
>
>  	/*
>  	 * Set up registers for signal handler.
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 3fbb100bc9e4..11c5e6edae3c 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -345,7 +345,7 @@ SYM_CODE_START(excp_vect_table)
>  excp_vect_table_end:
>  SYM_CODE_END(excp_vect_table)
>
> -#ifndef CONFIG_MMU
> +#ifndef CONFIG_VDSO
>  SYM_CODE_START(__user_rt_sigreturn)
>  	li a7, __NR_rt_sigreturn
>  	scall
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 9aff9d720590..bb8ee87ae28f 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -29,7 +29,7 @@ extern u32 __user_rt_sigreturn[2];
>  struct rt_sigframe {
>  	struct siginfo info;
>  	struct ucontext uc;
> -#ifndef CONFIG_MMU
> +#ifndef CONFIG_VDSO
>  	u32 sigreturn_code[2];
>  #endif
>  };
> @@ -201,7 +201,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
>  		return -EFAULT;
>
>  	/* Set up to return from userspace. */
> -#ifdef CONFIG_MMU
> +#ifdef CONFIG_VDSO
>  	regs->ra = (unsigned long)VDSO_SYMBOL(
>  		current->mm->context.vdso, rt_sigreturn);
>  #else
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 5db29683ebee..8691bc8d247b 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -246,7 +246,7 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
>  	return 0;
>  }
>
> -#ifdef CONFIG_MMU
> +#ifdef CONFIG_VDSO
>
>  static int __init init_hwprobe_vdso_data(void)
>  {
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index 9a68e7eaae4d..8a4cb4e4bd8b 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -50,7 +50,7 @@ struct __vdso_info {
>  };
>
>  static struct __vdso_info vdso_info;
> -#ifdef CONFIG_COMPAT
> +#ifdef CONFIG_COMPAT_VDSO
>  static struct __vdso_info compat_vdso_info;
>  #endif
>
> @@ -115,7 +115,7 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
>  	for_each_vma(vmi, vma) {
>  		if (vma_is_special_mapping(vma, vdso_info.dm))
>  			zap_vma_pages(vma);
> -#ifdef CONFIG_COMPAT
> +#ifdef CONFIG_COMPAT_VDSO
>  		if (vma_is_special_mapping(vma, compat_vdso_info.dm))
>  			zap_vma_pages(vma);
>  #endif
> @@ -179,7 +179,7 @@ static struct __vdso_info vdso_info __ro_after_init = {
>  	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
>  };
>
> -#ifdef CONFIG_COMPAT
> +#ifdef CONFIG_COMPAT_VDSO
>  static struct vm_special_mapping rv_compat_vdso_maps[] __ro_after_init = {
>  	[RV_VDSO_MAP_VVAR] = {
>  		.name   = "[vvar]",
> @@ -203,7 +203,7 @@ static struct __vdso_info compat_vdso_info __ro_after_init = {
>  static int __init vdso_init(void)
>  {
>  	__vdso_init(&vdso_info);
> -#ifdef CONFIG_COMPAT
> +#ifdef CONFIG_COMPAT_VDSO
>  	__vdso_init(&compat_vdso_info);
>  #endif
>
> @@ -254,7 +254,7 @@ static int __setup_additional_pages(struct mm_struct *mm,
>  	return PTR_ERR(ret);
>  }
>
> -#ifdef CONFIG_COMPAT
> +#ifdef CONFIG_COMPAT_VDSO
>  int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
>  				       int uses_interp)
>  {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
