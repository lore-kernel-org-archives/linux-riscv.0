Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBA6CAC5BD
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ayfIsYHeL6wUFjg5YuVJtyls9yhBdoPCNAp271Illk=; b=uhmS/UQcR3LtMe
	sQpKn6fG1ZFEr/6nfBogjWhrXRC3FbJvLORvsEwcSdgvlzpmJ91R0bJbb5sKQvYIQlrDi/r1CJPuq
	csJp2WoQjtlqn4BP11Z8afN78H9hjJXGVVRTk+HzukaB+ptj1zKnSUTtSoABfGGHCgNTVwaebAkNd
	Lz2WjTKeYU2E+m1ftn5+TyY4TJtgJKkr5YLa8arOuSBfslpMSe6/+cE3MBu/3yXXMVn9hn5L8nE2W
	zITqC4W9nh3aiKv1a6MN4SZVDjVsRQfj6GqIaMVm9ij4R9m2flRYvPnKTRUVPoB0OtqRlLnLA9Pw5
	4HA6eGv+TzLQIZA1NUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2rfG-0000000Fo3h-2aKX;
	Sun, 28 Sep 2025 13:42:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2rfE-0000000Fo2x-3Hb6
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 13:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C98296020D
	for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 13:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A87CC4AF09
	for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759066927;
	bh=b7lQZMpm3jaFTG6dtKVKcEubjwdkNUjuclDki/TIr1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m6lhNJFdEkreSucB/dxMB91UrwJt6hhk8u7yLb3moYbEyO3YNCQDQpZeyjmsvdCA1
	 Toga5ITJofDzKTAiQhErydIP7701BjSfwg3kp6sXPKdL0m4FKAIWlEb4k0K6HA6oQj
	 0+VWp3z+6bod1kBnBzJ5bkEyJusUvXNqljcTimM988HiBmJi6VCN8FIGarZwKCEY17
	 2fMnLseHBVhWU0OvsUSNdzw3UGBQS59MU2Bb2Gyubs4sx/raxgTR21vYeCg9Ily9x/
	 zuP0FbPqRv/UjoEOb3hZUnkiKVF1LmvGr4AOcMAziRkQGBrGxpFbGkowGad8zuT8ui
	 zKfCcC33++BgA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57ea78e0618so3621538e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 06:42:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJRfcJurAeBW2efX1vk7iwMpFIy+FRjhn7TwJHlokijiw+zbkULROlthD6ZoFFkzUr5UQGB/SlgC+0wQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz93geThxY9811YVjq0YMO3RFp5zr55CMzYUsII0KmjSlyr0OF8
	h73ocqiLYK14dYm8wDQp5APU7x7aGYB2IZs/iMDD1hpBKtn/0iOo2G1MPsg6GGaSgL6b2sAXRj0
	iCVv5dRiTYpG8yzNMRQp27578hQ/bWxE=
X-Google-Smtp-Source: AGHT+IENjnF+wQFCTm2WX/2LUMrC3xClXeEULM4n0/VRgHOOZVaGDYKViPHE16Jf9kIytcqTJZySM24jjWSQ6nTxM8g=
X-Received: by 2002:a05:6512:12d1:b0:57b:8a82:1dd0 with SMTP id
 2adb3069b0e04-582d0c28621mr4021018e87.15.1759066925407; Sun, 28 Sep 2025
 06:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250928085506.4471-1-yangtiezhu@loongson.cn>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 28 Sep 2025 15:41:54 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
X-Gm-Features: AS18NWAAyvtoI8B9uL7arznbuV6ccfy2mwG4BGuL--lHKmdvv097Yi3SZbekg3Q
Message-ID: <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sun, 28 Sept 2025 at 10:55, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
> the following objtool warning on LoongArch:
>
>   vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
>   falls through to next function __efistub_exit_boot_func()
>
> This is because efi_boot_kernel() doesn't end with a return instruction
> or an unconditional jump, then objtool has determined that the function
> can fall through into the next function.
>
> At the beginning, try to do something to make efi_boot_kernel() ends with
> an unconditional jump instruction, but this modification seems not proper.
>
> Since the efistub functions are useless for stack unwinder, they can be
> ignored by objtool. After many discussions, no need to link libstub to
> the vmlinux.o, only link libstub to the final vmlinux.
>

Please try keeping these changes confined to arch/loongarch. This
problem does not exist on other architectures, and changing the way
vmlinux is constructed might create other issues down the road.

> Do the similar things for arm64 and riscv, otherwise there may be objtool
> warnings when arm64 and riscv support objtool, this is to make consistent
> with the archs that use libstub.
>
> Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/
> Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  Makefile                | 1 +
>  arch/arm64/Makefile     | 5 ++++-
>  arch/loongarch/Makefile | 5 ++++-
>  arch/riscv/Makefile     | 5 ++++-

>  scripts/link-vmlinux.sh | 5 ++---
>  5 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 10355ecf32cb..8ba2e28ef3d1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1201,6 +1201,7 @@ KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)
>  KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
>
>  export KBUILD_VMLINUX_LIBS
> +export KBUILD_VMLINUX_LIBS_PRELINK
>  export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
>
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 73a10f65ce8b..038f37ef2143 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -156,7 +156,10 @@ KBUILD_CPPFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>  KBUILD_AFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>
>  libs-y         := arch/arm64/lib/ $(libs-y)
> -libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +
> +ifdef CONFIG_EFI_STUB
> +KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +endif
>
>  # Default target when executing plain make
>  boot           := arch/arm64/boot
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index ae419e32f22e..4eb904c20718 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -169,7 +169,10 @@ CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev
>  endif
>
>  libs-y += arch/loongarch/lib/
> -libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +
> +ifdef CONFIG_EFI_STUB
> +KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +endif
>
>  drivers-y              += arch/loongarch/crypto/
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index df57654a615e..cfd82b2c1bbf 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -173,7 +173,10 @@ boot-image-$(CONFIG_XIP_KERNEL)            := xipImage
>  KBUILD_IMAGE                           := $(boot)/$(boot-image-y)
>
>  libs-y += arch/riscv/lib/
> -libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +
> +ifdef CONFIG_EFI_STUB
> +KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +endif
>
>  ifeq ($(KBUILD_EXTMOD),)
>  ifeq ($(CONFIG_MMU),y)
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 51367c2bfc21..b3cbff31d8a9 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -61,12 +61,11 @@ vmlinux_link()
>         shift
>
>         if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
> -               # Use vmlinux.o instead of performing the slow LTO link again.
>                 objs=vmlinux.o
> -               libs=
> +               libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
>         else
>                 objs=vmlinux.a
> -               libs="${KBUILD_VMLINUX_LIBS}"
> +               libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
>         fi
>
>         if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
> --
> 2.42.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
