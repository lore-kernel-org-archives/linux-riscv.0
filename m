Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A11C3DA5D
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jul 2024 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gMJJWzNXmC9U9I7v9Lm1gtyMh4HN1fbhHLQ2Ev5Ogr8=; b=P5XOlnW99LMRO/6UFBFqRxmd3I
	z3V9WGFuhpciX8ABSGpkmJ27S0yfL13f8RxVoyD8rIrkHw/B3FQoctgyqjnYe6dyeMIcE2/bH4AcV
	HMqgHWsGGcX9gykmDL7uonup/TPXNyzLjdQniYCFbhYNDDlGWcMnkUavXpnxL/9GZFlFBnjFMbtCC
	C/rQiFg3XoGwNxz0zoU6nURxtOA4OIg7H/BAsJHCTw0qtug1otO8pQk+EHDVja35iky8F5BL9qjdO
	emnpgL4PCavkpZzaM/gqP+geribOulOJmL4l1227qx5B8N9kfhFvCI9Rtl0fpkABUlKDgENrd8kEb
	KGEupwCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVZ0j-000000075t3-2IhL;
	Sun, 21 Jul 2024 16:02:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVZ0f-000000075qs-1rFh
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jul 2024 16:02:07 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B6C093F460
	for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721577720;
	bh=tzD4G7bqh5TVJf3QFh6TBIh6jpL+x3lpERZwIORhlZY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=V6UYB0c2MURRbwy/3VEbMxUFFxT4NeDfm4GvMFijpUOczPgPWzJ2OB3/BHpMyFpTx
	 Qu8i958kJ13SDt73d05+U4Ua8yRVl4g+g3Zyw3RoJRrz6LZYjxkyywMOrkxOWtB59r
	 3MtbZwqrTXLEiPpNi/IjkRxrWhyGx6MvjRv352T8EFoPZFhOjCpiPdssg6g5UxLMxi
	 zc8+FglNzm+inZt0btPEW5xFUHdUvRjqlf5RmD5S/N0Xp3+AYa/6XS6S42Z/gMCb8F
	 VAvzCEdCRnAcrhqCaoQlQKndGECNNjb4tKOrvr6daPSfSYh7wB+6ZgS7heetm4OCc4
	 xN4rGNJGKgfzQ==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-447dbe5672cso63011981cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 09:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721577720; x=1722182520;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzD4G7bqh5TVJf3QFh6TBIh6jpL+x3lpERZwIORhlZY=;
        b=hp1Pa8QrtYFl89B92Vn8tZnhJ8heR6r88nDMOJ9LWmfOSGBkYoQI76gra8/ShgLFev
         OmVommO2WF80b8PwPp04eKNhBMBwMoVhXIh7e9OYeMdLTpDpx64+UeL5g7u5q/MuABIg
         6JWcazPT/1a+WMlJlLXTDnkaSUSebA3b8vlxd6VEnIfeDgEgb5+A6K0KI4y6gwF73J8p
         XqMAXeaMxDZ1wngjNgEEFjsfuj0V3vLaSDnKgvMO0kjYTQok9oqqbxWeuryZDaoHsmto
         7GpXuZPK5yVhjcN3Vo/pnq+4HTxMc+2fn3xVCX3Xw0dKXEfSlQ4vs2kCI+FtxDYD/zPQ
         zUGg==
X-Forwarded-Encrypted: i=1; AJvYcCXZt8X+ivH8rGE/hAiVLkY6gNojMRODiMozeJovwqUlJNoHTvhMM6ZGwf01KyeC0zW5iwrMR2IqAdy/etyun7cL3Ire19Fv9I6HU38/CWuV
X-Gm-Message-State: AOJu0YxlBjM3+Ca5H8lCipxgV83K1Ci1WlZInk9LBdzip0UvzpLppJUQ
	OLX0ocMbyS/aU7AVxCYkgdBsgNgv/YonsCgKWd2PA8ZZvOwFdXjyoEth46wmR6c35lGlSEVRwVx
	kGycDpKzVgKL55jeUy21iTqwosjomeOkG41hOjKCDiQBrkaij3KpDPc7ZPgzmAhdi2Qhiy/B2oA
	oSF4wh/CNphTtee6sP+JzJGOKd01JEKDFpD6u9efoO21s+kBHjXkP54cOJ
X-Received: by 2002:a05:622a:148a:b0:447:f6ca:b23 with SMTP id d75a77b69052e-44fa584e00dmr86189601cf.26.1721577719422;
        Sun, 21 Jul 2024 09:01:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy3RBTEJERaYfS8uwMmlBGb8o8tj1sTDPaOS2yPcFwqUTcWzgoKnw5EolNVsLDZ3WjZyZf27YhuUE6vQK7AAI=
X-Received: by 2002:a05:622a:148a:b0:447:f6ca:b23 with SMTP id
 d75a77b69052e-44fa584e00dmr86189071cf.26.1721577718950; Sun, 21 Jul 2024
 09:01:58 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 21 Jul 2024 11:01:58 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240721133633.47721-17-lasse.collin@tukaani.org>
References: <20240721133633.47721-1-lasse.collin@tukaani.org> <20240721133633.47721-17-lasse.collin@tukaani.org>
Mime-Version: 1.0
Date: Sun, 21 Jul 2024 11:01:58 -0500
Message-ID: <CAJM55Z_2=aChNSbzEHvvAu66ypZHvUKJSmtaNX63OEA5U-811g@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] riscv: boot: add Image.xz support
To: Lasse Collin <lasse.collin@tukaani.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Sam James <sam@gentoo.org>, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jules Maselbas <jmaselbas@zdiv.net>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_090205_892512_DB5FDEB9 
X-CRM114-Status: GOOD (  14.84  )
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

Lasse Collin wrote:
> The Image.* targets existed for other compressors already. Bootloader
> support is needed for decompression.
>
> This is for CONFIG_EFI_ZBOOT=n. With CONFIG_EFI_ZBOOT=y, XZ was already
> available.
>
> Comparision with Linux 6.10 RV64GC tinyconfig (in KiB):
>
>     1027 Image
>      594 Image.gz
>      541 Image.zst
>      510 Image.lzma
>      474 Image.xz
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Jules Maselbas <jmaselbas@zdiv.net>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>

Looks good to me, thanks.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/Kconfig       | 1 +
>  arch/riscv/Makefile      | 6 ++++--
>  arch/riscv/boot/Makefile | 3 +++
>  3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 736457a5898a..ef6a603b80c5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -153,6 +153,7 @@ config RISCV
>  	select HAVE_KERNEL_LZO if !XIP_KERNEL && !EFI_ZBOOT
>  	select HAVE_KERNEL_UNCOMPRESSED if !XIP_KERNEL && !EFI_ZBOOT
>  	select HAVE_KERNEL_ZSTD if !XIP_KERNEL && !EFI_ZBOOT
> +	select HAVE_KERNEL_XZ if !XIP_KERNEL && !EFI_ZBOOT
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6fe682139d2e..d469db9f46f4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -159,6 +159,7 @@ boot-image-$(CONFIG_KERNEL_LZ4)		:= Image.lz4
>  boot-image-$(CONFIG_KERNEL_LZMA)	:= Image.lzma
>  boot-image-$(CONFIG_KERNEL_LZO)		:= Image.lzo
>  boot-image-$(CONFIG_KERNEL_ZSTD)	:= Image.zst
> +boot-image-$(CONFIG_KERNEL_XZ)		:= Image.xz
>  ifdef CONFIG_RISCV_M_MODE
>  boot-image-$(CONFIG_ARCH_CANAAN)	:= loader.bin
>  endif
> @@ -183,12 +184,12 @@ endif
>  vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
>  vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
>
> -BOOT_TARGETS := Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst loader loader.bin xipImage vmlinuz.efi
> +BOOT_TARGETS := Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst Image.xz loader loader.bin xipImage vmlinuz.efi
>
>  all:	$(notdir $(KBUILD_IMAGE))
>
>  loader.bin: loader
> -Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst loader xipImage vmlinuz.efi: Image
> +Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst Image.xz loader xipImage vmlinuz.efi: Image
>
>  $(BOOT_TARGETS): vmlinux
>  	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> @@ -225,6 +226,7 @@ define archhelp
>    echo  '  Image.lzma	- Compressed kernel image (arch/riscv/boot/Image.lzma)'
>    echo  '  Image.lzo	- Compressed kernel image (arch/riscv/boot/Image.lzo)'
>    echo  '  Image.zst	- Compressed kernel image (arch/riscv/boot/Image.zst)'
> +  echo  '  Image.xz	- Compressed kernel image (arch/riscv/boot/Image.xz)'
>    echo  '  vmlinuz.efi	- Compressed EFI kernel image (arch/riscv/boot/vmlinuz.efi)'
>    echo  '		  Default when CONFIG_EFI_ZBOOT=y'
>    echo  '  xipImage	- Execute-in-place kernel image (arch/riscv/boot/xipImage)'
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index 869c0345b908..710a5f6caf96 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -65,6 +65,9 @@ $(obj)/Image.lzo: $(obj)/Image FORCE
>  $(obj)/Image.zst: $(obj)/Image FORCE
>  	$(call if_changed,zstd)
>
> +$(obj)/Image.xz: $(obj)/Image FORCE
> +	$(call if_changed,xzkern)
> +
>  $(obj)/loader.bin: $(obj)/loader FORCE
>  	$(call if_changed,objcopy)
>
> --
> 2.45.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
