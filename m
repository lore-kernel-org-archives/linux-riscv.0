Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C59CC61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ws8h6Ujmz1jfx2yh0c8WuWKxGZ8ymYlhm94jVagJZjA=; b=hnhXDhovTIV93c
	laF4bRXXSofodKV7jjsV3XHVLhj3KVQzIwHv6uMK9nexodsLIc20ULrricxYLkUruZMqCMzWVtV2Z
	ZrOj7BPha8kHy5zkc7Ssu7z4B5c+SW+90OqMKhEfl6CX//0zrNvmM68ylmMiws/Phfbd8oziw38Ll
	+mw7tx111QDgI86KCxPcl1kr2YqK2R+3/VCZDmqWuJn94mf1ATT6jIlsf3D7gIS7dSibafxDr59D3
	dJgCXgyvHBB+evua3ej/5DdF999+m5WnK7tVkDTCLWIK0gn5BHRwr6RCd/fzUzQOwYSUdCsJbzrXr
	nB5ytnTSULR2UJOg5LMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TkI-00HIdJ-0A;
	Tue, 21 Nov 2023 16:37:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TkF-00HIcB-1s
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 16:37:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96A40CE1C45
	for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 16:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6176C433CC
	for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700584620;
	bh=90jfxCqzjOBfBN+wpF26ZcGIh+zvRIz7KOwb6AcEbkk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iVzqhREwZPIcasf4XWCszbWXVJDs8LY4hHhilR3fXsLsLZ0fWJO8k79KzCMyvIAHc
	 cI9iZJ6+O3USDAdAEySFLBOIGlPKhLyEfs5kcbxlI+q3rqwyMe5Lb8+o/PlXDLIxl6
	 hNSiRmvHgkf0kF/IEkDRbd75UxggTeohYIWmVIRZgWBIwn93RbxYyF2z1XWnpRCXLT
	 tonxPq2JKNQXTjqwMNjeM5WStrTT5BBRHWQbTnksnXwHo0RY3qzYRKwZAIaSfz3VQt
	 TWoT+JXq214C2oceKyGPUdwHTttVbpymo6shPUg7QEi8xgsTchxPjIdGyjndD6S3sP
	 BXoT63PqgDZKA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c871890c12so48362121fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 08:37:00 -0800 (PST)
X-Gm-Message-State: AOJu0YxLupo3F2ABdaHhEX3rwGsX+TvG/xc4bXrb1bH3UXFdQyIkMIiY
	zJQHEecstY+DmzSOWttz9eHxxnUCCX6oc9TFUzg=
X-Google-Smtp-Source: AGHT+IHNYCwF3uqqI4dsPxCI3mpJ+DNt7kg6IHqCmH3GN1kM9w/qG4RkuMgpCd8A0ebUCzePmaiJMAeizaskFjJhi3Q=
X-Received: by 2002:a2e:b4b4:0:b0:2c5:6e01:58b8 with SMTP id
 q20-20020a2eb4b4000000b002c56e0158b8mr6668049ljm.37.1700584619083; Tue, 21
 Nov 2023 08:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20231119100024.2370992-1-masahiroy@kernel.org>
In-Reply-To: <20231119100024.2370992-1-masahiroy@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Nov 2023 11:36:48 -0500
X-Gmail-Original-Message-ID: <CAMj1kXF5Vm+Br68qk3rxgtsUxTknz2stfBTpruwQ3diVQrAc3Q@mail.gmail.com>
Message-ID: <CAMj1kXF5Vm+Br68qk3rxgtsUxTknz2stfBTpruwQ3diVQrAc3Q@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add dependency among Image(.gz), loader(.bin),
 and vmlinuz.efi
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_083704_074553_4BC9C47A 
X-CRM114-Status: GOOD (  17.66  )
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

On Sun, 19 Nov 2023 at 05:00, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> A common issue in Makefile is a race in parallel building.
>
> You need to be careful to prevent multiple threads from writing to the
> same file simultaneously.
>
> Commit 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
> generate invalid images") addressed such a bad scenario.
>
> A similar symptom occurs with the following command:
>
>   $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     GZIP    arch/riscv/boot/Image.gz
>     AS      arch/riscv/boot/loader.o
>     AS      arch/riscv/boot/loader.o
>     Kernel: arch/riscv/boot/Image is ready
>     PAD     arch/riscv/boot/vmlinux.bin
>     GZIP    arch/riscv/boot/vmlinuz
>     Kernel: arch/riscv/boot/loader is ready
>     OBJCOPY arch/riscv/boot/loader.bin
>     Kernel: arch/riscv/boot/loader.bin is ready
>     Kernel: arch/riscv/boot/Image.gz is ready
>     OBJCOPY arch/riscv/boot/vmlinuz.o
>     LD      arch/riscv/boot/vmlinuz.efi.elf
>     OBJCOPY arch/riscv/boot/vmlinuz.efi
>     Kernel: arch/riscv/boot/vmlinuz.efi is ready
>
> The log "OBJCOPY arch/riscv/boot/Image" is displayed 5 times.
> (also "AS      arch/riscv/boot/loader.o" twice.)
>
> It indicates that 5 threads simultaneously enter arch/riscv/boot/
> and write to arch/riscv/boot/Image.
>
> It occasionally leads to a build failure:
>
>   $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     PAD     arch/riscv/boot/vmlinux.bin
>   truncate: Invalid number: 'arch/riscv/boot/vmlinux.bin'
>   make[2]: *** [drivers/firmware/efi/libstub/Makefile.zboot:13: arch/riscv/boot/vmlinux.bin] Error 1
>   make[2]: *** Deleting file 'arch/riscv/boot/vmlinux.bin'
>   make[1]: *** [arch/riscv/Makefile:167: vmlinuz.efi] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>     Kernel: arch/riscv/boot/Image is ready
>     GZIP    arch/riscv/boot/Image.gz
>     AS      arch/riscv/boot/loader.o
>     AS      arch/riscv/boot/loader.o
>     Kernel: arch/riscv/boot/loader is ready
>     OBJCOPY arch/riscv/boot/loader.bin
>     Kernel: arch/riscv/boot/loader.bin is ready
>     Kernel: arch/riscv/boot/Image.gz is ready
>   make: *** [Makefile:234: __sub-make] Error 2
>
> Image.gz, loader, vmlinuz.efi depend on Image. loader.bin depends
> on loader. Such dependencies are not specified in arch/riscv/Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Fix commit log
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 5cbe596345c1..1d6ed27e0a2a 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -163,6 +163,8 @@ BOOT_TARGETS := Image Image.gz loader loader.bin xipImage vmlinuz.efi
>
>  all:   $(notdir $(KBUILD_IMAGE))
>
> +loader.bin: loader
> +Image.gz loader vmlinuz.efi: Image
>  $(BOOT_TARGETS): vmlinux
>         $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
>         @$(kecho) '  Kernel: $(boot)/$@ is ready'
> --
> 2.40.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
