Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F9BC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 00:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88X7E2dEfmquy8qCrTIFP4Iqf2dlgELi+f1DfSapI5I=; b=C1ZQQEcxgbq6Yj
	c7FE6OdSb1+BstGpKCBZ65rJ2egWDOm7XEuDpRKmx5X1fvVEZyUiYiLynkb0rHt/b11uFtDQUly8q
	G/2gFyhYJ4Rzw20hFT4mZj4Ut1soJbBPgpDewMT+XN08VE8z5CHlcv1plKF1lmDbRC57Wzftg4lO6
	pFb0pU8BQexZGsaPQd8y/8Un8u7+v8NwqI4/1CNE67IVqw/VsiVEgNI2g8QOzElMERauuwc7/jyCf
	ULoNQB+WRZlA8o9YZPJC0MQ7D5G8nWJqAYweMVIcS65uMDjIpp0Rt4nlkGkD1wifBxV7kP01ZHWFd
	EQoMihDXIsxSbjFLwhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omld0-00Gbox-QU; Mon, 24 Oct 2022 00:47:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omlcp-00GbnA-Fa; Mon, 24 Oct 2022 00:47:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DA585B80E2C;
	Mon, 24 Oct 2022 00:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8FEC4347C;
	Mon, 24 Oct 2022 00:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666572447;
	bh=eKfyQ9JvQkHMYp0oSdnbc/60KLnQGcBug839FEafCbw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tltgi9ATVOA2q+RwBtGrH/dVSqysEyxnEIsDMvsMZuwFwDw7PQYgFGMI2sHvAVnSF
	 ZNW3UxS9XWSDzt+D1NWXDkfShNrCPEcRfylEYHIbOs84jfoxI++BpNWHaSFTmE7IWa
	 lbSjp4Ygzdk1fEM5VyLmAPNYrdv6NTKHDyiNtqd4Vm7rAtSGJiQfzadSNB0jUPxHcm
	 gQDOOUUsSJiwMVZQACTEUoBfFO8S8ph9sSuwzTpt2E7BMBXv6/mM8bYXR6Qz9V4buP
	 vHjFoiR6o+hfsCSCdK0AlHhDdUrc7l4wiVRIbgNAoP65BIZNn2Vytafz47A7CSDrZV
	 H4qqHBaVsRB5w==
Received: by mail-oi1-f179.google.com with SMTP id y72so9436649oia.3;
        Sun, 23 Oct 2022 17:47:27 -0700 (PDT)
X-Gm-Message-State: ACrzQf206Sy+pSaCb5XwfZSHYOvSnsq3dIRx+3VS/WQJHT412gFaUGYT
	Eo9446A372qhZcxXc5VYu62avwCSoRx1vbmM6V8=
X-Google-Smtp-Source: AMsMyM7009U9fo6Wj1OBVCOrzgnAnnM4a9IV75Exy9bv6NK9Bj31r01l0ngnnVp614GR5Po40WpMPngCeLU7/ER3RuU=
X-Received: by 2002:a05:6871:b0d:b0:13b:b91:dc94 with SMTP id
 fq13-20020a0568710b0d00b0013b0b91dc94mr11308877oab.112.1666572436415; Sun, 23
 Oct 2022 17:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221023203208.118919-1-Jason@zx2c4.com> <20221023203208.118919-3-Jason@zx2c4.com>
In-Reply-To: <20221023203208.118919-3-Jason@zx2c4.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 Oct 2022 08:47:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS5rgm8mZ1RPWm8dA36hY6CRkg4GF=JV1bbbMOJy1fDZg@mail.gmail.com>
Message-ID: <CAJF2gTS5rgm8mZ1RPWm8dA36hY6CRkg4GF=JV1bbbMOJy1fDZg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] stackprotector: actually use get_random_canary()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_174731_842311_78B42198 
X-CRM114-Status: GOOD (  24.40  )
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

On Mon, Oct 24, 2022 at 4:32 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> The RNG always mixes in the Linux version extremely early in boot. It
> also always includes a cycle counter, not only during early boot, but
> each and every time it is invoked prior to being fully initialized.
> Together, this means that the use of additional xors inside of the
> various stackprotector.h files is superfluous and over-complicated.
> Instead, we can get exactly the same thing, but better, by just calling
> `get_random_canary()`.
>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/arm/include/asm/stackprotector.h     |  9 +--------
>  arch/arm64/include/asm/stackprotector.h   |  9 +--------
>  arch/csky/include/asm/stackprotector.h    | 10 +---------
>  arch/mips/include/asm/stackprotector.h    |  9 +--------
>  arch/powerpc/include/asm/stackprotector.h | 10 +---------
>  arch/riscv/include/asm/stackprotector.h   | 10 +---------
>  arch/sh/include/asm/stackprotector.h      | 10 +---------
>  arch/x86/include/asm/stackprotector.h     | 14 +-------------
>  arch/xtensa/include/asm/stackprotector.h  |  7 +------
>  9 files changed, 9 insertions(+), 79 deletions(-)
>
> diff --git a/arch/arm/include/asm/stackprotector.h b/arch/arm/include/asm/stackprotector.h
> index 088d03161be5..0bd4979759f1 100644
> --- a/arch/arm/include/asm/stackprotector.h
> +++ b/arch/arm/include/asm/stackprotector.h
> @@ -15,9 +15,6 @@
>  #ifndef _ASM_STACKPROTECTOR_H
>  #define _ASM_STACKPROTECTOR_H 1
>
> -#include <linux/random.h>
> -#include <linux/version.h>
> -
>  #include <asm/thread_info.h>
>
>  extern unsigned long __stack_chk_guard;
> @@ -30,11 +27,7 @@ extern unsigned long __stack_chk_guard;
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {
> -       unsigned long canary;
> -
> -       /* Try to get a semi random initial value. */
> -       get_random_bytes(&canary, sizeof(canary));
> -       canary ^= LINUX_VERSION_CODE;
> +       unsigned long canary = get_random_canary();
>
>         current->stack_canary = canary;
>  #ifndef CONFIG_STACKPROTECTOR_PER_TASK
> diff --git a/arch/arm64/include/asm/stackprotector.h b/arch/arm64/include/asm/stackprotector.h
> index 33f1bb453150..ae3ad80f51fe 100644
> --- a/arch/arm64/include/asm/stackprotector.h
> +++ b/arch/arm64/include/asm/stackprotector.h
> @@ -13,8 +13,6 @@
>  #ifndef __ASM_STACKPROTECTOR_H
>  #define __ASM_STACKPROTECTOR_H
>
> -#include <linux/random.h>
> -#include <linux/version.h>
>  #include <asm/pointer_auth.h>
>
>  extern unsigned long __stack_chk_guard;
> @@ -28,12 +26,7 @@ extern unsigned long __stack_chk_guard;
>  static __always_inline void boot_init_stack_canary(void)
>  {
>  #if defined(CONFIG_STACKPROTECTOR)
> -       unsigned long canary;
> -
> -       /* Try to get a semi random initial value. */
> -       get_random_bytes(&canary, sizeof(canary));
> -       canary ^= LINUX_VERSION_CODE;
> -       canary &= CANARY_MASK;
> +       unsigned long canary = get_random_canary();
>
>         current->stack_canary = canary;
>         if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
> diff --git a/arch/csky/include/asm/stackprotector.h b/arch/csky/include/asm/stackprotector.h
> index d7cd4e51edd9..d23747447166 100644
> --- a/arch/csky/include/asm/stackprotector.h
> +++ b/arch/csky/include/asm/stackprotector.h
> @@ -2,9 +2,6 @@
>  #ifndef _ASM_STACKPROTECTOR_H
>  #define _ASM_STACKPROTECTOR_H 1
>
> -#include <linux/random.h>
> -#include <linux/version.h>
> -
>  extern unsigned long __stack_chk_guard;
>
>  /*
> @@ -15,12 +12,7 @@ extern unsigned long __stack_chk_guard;
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {
> -       unsigned long canary;
> -
> -       /* Try to get a semi random initial value. */
> -       get_random_bytes(&canary, sizeof(canary));
> -       canary ^= LINUX_VERSION_CODE;
> -       canary &= CANARY_MASK;
> +       unsigned long canary = get_random_canary();
Acked-by: Guo Ren <guoren@kernel.org> #csky part

>
>         current->stack_canary = canary;
>         __stack_chk_guard = current->stack_canary;
> diff --git a/arch/mips/include/asm/stackprotector.h b/arch/mips/include/asm/stackprotector.h
> index 68d4be9e1254..518c192ad982 100644
> --- a/arch/mips/include/asm/stackprotector.h
> +++ b/arch/mips/include/asm/stackprotector.h
> @@ -15,9 +15,6 @@
>  #ifndef _ASM_STACKPROTECTOR_H
>  #define _ASM_STACKPROTECTOR_H 1
>
> -#include <linux/random.h>
> -#include <linux/version.h>
> -
>  extern unsigned long __stack_chk_guard;
>
>  /*
> @@ -28,11 +25,7 @@ extern unsigned long __stack_chk_guard;
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {
> -       unsigned long canary;
> -
> -       /* Try to get a semi random initial value. */
> -       get_random_bytes(&canary, sizeof(canary));
> -       canary ^= LINUX_VERSION_CODE;
> +       unsigned long canary = get_random_canary();
>
>         current->stack_canary = canary;
>         __stack_chk_guard = current->stack_canary;
> diff --git a/arch/powerpc/include/asm/stackprotector.h b/arch/powerpc/include/asm/stackprotector.h
> index 1c8460e23583..283c34647856 100644
> --- a/arch/powerpc/include/asm/stackprotector.h
> +++ b/arch/powerpc/include/asm/stackprotector.h
> @@ -7,8 +7,6 @@
>  #ifndef _ASM_STACKPROTECTOR_H
>  #define _ASM_STACKPROTECTOR_H
>
> -#include <linux/random.h>
> -#include <linux/version.h>
>  #include <asm/reg.h>
>  #include <asm/current.h>
>  #include <asm/paca.h>
> @@ -21,13 +19,7 @@
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {
> -       unsigned long canary;
> -
> -       /* Try to get a semi random initial value. */
> -       canary = get_random_canary();
> -       canary ^= mftb();
> -       canary ^= LINUX_VERSION_CODE;
> -       canary &= CANARY_MASK;
> +       unsigned long canary = get_random_canary();
>
>         current->stack_canary = canary;
>  #ifdef CONFIG_PPC64
> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
> index 09093af46565..43895b90fe3f 100644
> --- a/arch/riscv/include/asm/stackprotector.h
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -3,9 +3,6 @@
>  #ifndef _ASM_RISCV_STACKPROTECTOR_H
>  #define _ASM_RISCV_STACKPROTECTOR_H
>
> -#include <linux/random.h>
> -#include <linux/version.h>
> -
>  extern unsigned long __stack_chk_guard;
>
>  /*
> @@ -16,12 +13,7 @@ extern unsigned long __stack_chk_guard;
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {
> -       unsigned long canary;
> -
> -       /* Try to get a semi random initial value. */
> -       get_random_bytes(&canary, sizeof(canary));
> -       canary ^= LINUX_VERSION_CODE;
> -       canary &= CANARY_MASK;
> +       unsigned long canary = get_random_canary();
>
>         current->stack_canary = canary;
>         if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
> diff --git a/arch/sh/include/asm/stackprotector.h b/arch/sh/include/asm/stackprotector.h
> index 35616841d0a1..665dafac376f 100644
> --- a/arch/sh/include/asm/stackprotector.h
> +++ b/arch/sh/include/asm/stackprotector.h
> @@ -2,9 +2,6 @@
>  #ifndef __ASM_SH_STACKPROTECTOR_H
>  #define __ASM_SH_STACKPROTECTOR_H
>
> -#include <linux/random.h>
> -#include <linux/version.h>
> -
>  extern unsigned long __stack_chk_guard;
>
>  /*
> @@ -15,12 +12,7 @@ extern unsigned long __stack_chk_guard;
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {
> -       unsigned long canary;
> -
> -       /* Try to get a semi random initial value. */
> -       get_random_bytes(&canary, sizeof(canary));
> -       canary ^= LINUX_VERSION_CODE;
> -       canary &= CANARY_MASK;
> +       unsigned long canary = get_random_canary();
>
>         current->stack_canary = canary;
>         __stack_chk_guard = current->stack_canary;
> diff --git a/arch/x86/include/asm/stackprotector.h b/arch/x86/include/asm/stackprotector.h
> index 24a8d6c4fb18..00473a650f51 100644
> --- a/arch/x86/include/asm/stackprotector.h
> +++ b/arch/x86/include/asm/stackprotector.h
> @@ -34,7 +34,6 @@
>  #include <asm/percpu.h>
>  #include <asm/desc.h>
>
> -#include <linux/random.h>
>  #include <linux/sched.h>
>
>  /*
> @@ -50,22 +49,11 @@
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {
> -       u64 canary;
> -       u64 tsc;
> +       unsigned long canary = get_random_canary();
>
>  #ifdef CONFIG_X86_64
>         BUILD_BUG_ON(offsetof(struct fixed_percpu_data, stack_canary) != 40);
>  #endif
> -       /*
> -        * We both use the random pool and the current TSC as a source
> -        * of randomness. The TSC only matters for very early init,
> -        * there it already has some randomness on most systems. Later
> -        * on during the bootup the random pool has true entropy too.
> -        */
> -       get_random_bytes(&canary, sizeof(canary));
> -       tsc = rdtsc();
> -       canary += tsc + (tsc << 32UL);
> -       canary &= CANARY_MASK;
>
>         current->stack_canary = canary;
>  #ifdef CONFIG_X86_64
> diff --git a/arch/xtensa/include/asm/stackprotector.h b/arch/xtensa/include/asm/stackprotector.h
> index e368f94fd2af..e1e318a0c98a 100644
> --- a/arch/xtensa/include/asm/stackprotector.h
> +++ b/arch/xtensa/include/asm/stackprotector.h
> @@ -14,7 +14,6 @@
>  #ifndef _ASM_STACKPROTECTOR_H
>  #define _ASM_STACKPROTECTOR_H 1
>
> -#include <linux/random.h>
>  #include <linux/version.h>
>
>  extern unsigned long __stack_chk_guard;
> @@ -27,11 +26,7 @@ extern unsigned long __stack_chk_guard;
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {
> -       unsigned long canary;
> -
> -       /* Try to get a semi random initial value. */
> -       get_random_bytes(&canary, sizeof(canary));
> -       canary ^= LINUX_VERSION_CODE;
> +       unsigned long canary = get_random_canary();
>
>         current->stack_canary = canary;
>         __stack_chk_guard = current->stack_canary;
> --
> 2.38.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
