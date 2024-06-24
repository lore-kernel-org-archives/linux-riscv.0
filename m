Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED96C2D0D1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 03:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54Vvf1nFIrmMf59qJ55iowWfYlwfg9Dhg/yyZ9YSKQo=; b=qPRbZzc5g3py46
	d6B1ljh785KL+uqF1Am8p4/kCeTd564V9rgMzzEOkexq3L8ifD2xo3dhyOWaeiwLEtEdFCJItFMjv
	HrbJbvKesHqfwMao1+SFpo7v264NqkT6wMcXAUXkf1f7z1/V/ImPw3Y6LqQnTMdvZ4duRePTE3NGP
	b4f0bPzO3adbHn9xhIKqvAPaF59D89eEEOQ5ELkxu3VSBOTW7cQuHNgonb0altl04rz0iceFuU3U8
	mFACR7AAEbH+20yoBXRgeEjGwMbSlfcODOcwh/MNGEq8WQuVvRMuFstpXnDerElhYChEuOayprBly
	BgSCcqKttCjNsJjiVbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLaJE-0000000FN2L-1qKL;
	Mon, 24 Jun 2024 03:24:00 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLaJB-0000000FN1S-10LV
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 03:23:59 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-700a6853664so1047374a34.1
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jun 2024 20:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719199431; x=1719804231; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FWaEUeTMDHJoELxY+ZgcV9lMMpnHL5SsFDjxF9/VXs=;
        b=eGCfW4T8KuyPmdU7AnUYos0qMvq7n8CwHWPv8k336NIoMnxagRS0oRXdjFttlcAKLb
         yvT7/yybb5vDPCll7zgQTfYvn6OVlwWEbCk6JWL433aHzOv4EEAhwxHkyZtxbGVPlhMQ
         6oc61H7mtgMnzuvtZjsrOyFbCPSY6pkQYdll4pxtI8EP2Q0HIAAZQIX5u6HGa9IZwnls
         q3FWc02f8LTl8PpT6KcwCHYHSrUpoPtJAV5kJpWe6U/OmtwF/9WoBGpzZmxzOSUmme5h
         v/Zyu5PGlYKyBVF+E+qUHgQ0RkQCICB0prRuGL+v1KKjSdx2zBqViTN1nQF7+hX6ZJhi
         JuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719199431; x=1719804231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FWaEUeTMDHJoELxY+ZgcV9lMMpnHL5SsFDjxF9/VXs=;
        b=g1ra4dXbJqVVy5RDy8zON+8vPkipwxrX9q5BDaCnYGXhKLgPAkKliDrZLtKYrbpR/9
         oRekB6CWh/GbYb6EKUr/q1Xt7hsEUsy0VYL3k72fQbw0FYdyq4OkScg9eKx/Ij0f0Sx6
         KPc/gr8qSs+iAWC5ab3LyfyCmyq1/EVRIVKTtw2dBHcOUdgpK3ChAeVgDVrmlfuq3yKG
         jGA1aawNPRnOWUKMUTEQHY1+T+PeJcbGhjAAqUPWTIVpX2rFqGXG2rMfl9e6jQ3CJILd
         YGiAAb0VtTmLQObKqizJm72KoUcgOO/T2pFZUc/GaHZ1uJEywe/11WZ0tRlNPsZwtrnT
         C3dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNalGBIHeGtgm3eYgc3+kR5RyS2JtkRub3DqECEQhWFxsvOR0WAngsUT4BC2+QUzXHRHZnBmQjuE1D7jMxGTa184SbNHqWN4PAWvBuh4HH
X-Gm-Message-State: AOJu0Yxtr6uS4nMYmlUcr4Eb5FKDeG9epJha+HftYXzOmIeDv+8PDP2H
	nzoc9Z174Rg/7JaNUX8x0lgQLD8quPDd6tCcTxwD+hGZrjqiwgOwaPI0fztj/3Q=
X-Google-Smtp-Source: AGHT+IE+osSaSeirW6Qbfg0AmVximTUoIwMN39FxDLs9j+BLB3XcDNJN4I4yZNiCnV4rh4f1rTSaSg==
X-Received: by 2002:a05:6830:4428:b0:6fb:9752:4d3a with SMTP id 46e09a7af769-700afa03484mr4199879a34.24.1719199430755;
        Sun, 23 Jun 2024 20:23:50 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:e283:b00b:36c9:cbf5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716bb040d0esm3811211a12.79.2024.06.23.20.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 20:23:49 -0700 (PDT)
Date: Sun, 23 Jun 2024 20:23:47 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH v2] riscv: enable HAVE_ARCH_STACKLEAK
Message-ID: <Znjmw469+P1iFRHg@ghost>
References: <20240623235316.2010-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240623235316.2010-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_202357_428809_9E03449B 
X-CRM114-Status: GOOD (  18.32  )
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

On Mon, Jun 24, 2024 at 07:53:16AM +0800, Jisheng Zhang wrote:
> Add support for the stackleak feature. Whenever the kernel returns to user
> space the kernel stack is filled with a poison value.
> 
> At the same time, disables the plugin in EFI stub code because EFI stub
> is out of scope for the protection.
> 
> Tested on qemu and milkv duo:
> / # echo STACKLEAK_ERASING > /sys/kernel/debug/provoke-crash/DIRECT
> [   38.675575] lkdtm: Performing direct entry STACKLEAK_ERASING
> [   38.678448] lkdtm: stackleak stack usage:
> [   38.678448]   high offset: 288 bytes
> [   38.678448]   current:     496 bytes
> [   38.678448]   lowest:      1328 bytes
> [   38.678448]   tracked:     1328 bytes
> [   38.678448]   untracked:   448 bytes
> [   38.678448]   poisoned:    14312 bytes
> [   38.678448]   low offset:  8 bytes
> [   38.689887] lkdtm: OK: the rest of the thread stack is properly erased
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> 
> since v2:
>  - add #include <linux/sizes.h> to fixing compiler error found by
>    Charlie

Thanks!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 
>  arch/riscv/Kconfig                    | 1 +
>  arch/riscv/include/asm/thread_info.h  | 1 +
>  arch/riscv/kernel/entry.S             | 4 ++++
>  drivers/firmware/efi/libstub/Makefile | 3 ++-
>  4 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0525ee2d63c7..9cbfdffec96c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -118,6 +118,7 @@ config RISCV
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
>  	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>  	select HAVE_ARCH_SECCOMP_FILTER
> +	select HAVE_ARCH_STACKLEAK
>  	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>  	select HAVE_ARCH_TRACEHOOK
>  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 5d473343634b..fca5c6be2b81 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -10,6 +10,7 @@
>  
>  #include <asm/page.h>
>  #include <linux/const.h>
> +#include <linux/sizes.h>
>  
>  /* thread information allocation */
>  #define THREAD_SIZE_ORDER	CONFIG_THREAD_SIZE_ORDER
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 68a24cf9481a..80ff55a26d13 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -130,6 +130,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
>  #endif
>  	bnez s0, 1f
>  
> +#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
> +	call	stackleak_erase_on_task_stack
> +#endif
> +
>  	/* Save unwound kernel stack pointer in thread_info */
>  	addi s0, sp, PT_SIZE_ON_STACK
>  	REG_S s0, TASK_TI_KERNEL_SP(tp)
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index 06f0428a723c..3a9521c57641 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -28,7 +28,8 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
>  				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
>  				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
>  				   $(call cc-option,-mno-single-pic-base)
> -cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax
> +cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax \
> +				   $(DISABLE_STACKLEAK_PLUGIN)
>  cflags-$(CONFIG_LOONGARCH)	+= -fpie
>  
>  cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
