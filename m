Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B13C3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 10:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPyiGajksmaLA3h0HUfwRWKDTbBSfwiPheeHr2CcQfc=; b=nZXyh6JBVcCsjW
	ar4GJkD+LdflxQ1CbzmL95+iAXXtdH2abTN+3p+7aBF4w3UoLifpcH9iPS3svStrlDZfZEP1juBPP
	TGgzaR262cH8vTu0R624ikefSySDWOBEBLDO4UHbHnnMPKREIkTRfWNig/xLxrJNGMUA1LCCmeOeb
	57HUTJyoPHs0WcsfHE99735cebVNWFxYx3SnnfpeKskbjhuGrcn1OmBx0wNpOPZhVI2a9ZQxr8wU/
	2nPfP/HBI78kE+6+WPFZHYjuMK2kXfALqUws1lqEpVJ+KBeCOtvZZ1DagrP9LlAQag/4GYeGGKIwj
	9b5db9MzUDCU/my1BpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKZ5-00000003C7p-34Wj;
	Fri, 09 May 2025 10:02:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJqk-000000034SF-15C7
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 09:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A501A4A6A3
	for <linux-riscv@lists.infradead.org>; Fri,  9 May 2025 09:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B536C4CEFA
	for <linux-riscv@lists.infradead.org>; Fri,  9 May 2025 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746782217;
	bh=x+d130iQ4OisBQ1RwPsHMzQrkjOFTBbyg4UmChoAzGs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BOaX9KxJUz8CzmtKc8p70TeZxOwMMeIU4P3Qtnex8TyDKK4VYg9IguIg1nbe6u4Cz
	 wejSp+/rUd3iHSV5P56w6VddU5fFt2ptNTSXNpmxHA+Ann9HmYECkHdCgo1rNjs8U3
	 LENz92T5AZFm83CWRB5QPTzB2ZJM8pF91OoSVGXASMjhwgJ3bJH+qgBMYKq6qn1dJw
	 tRdM03mLNDqEIfK3m8WLnRrefrtJIqW3xNUQAMfoCCUx5d6qaAzUWonrVBH+KglHXH
	 ARooMbo+YLL3oiMr4HECY+y+3dZOyLLu0/7Zmc3bQEWvRUdkBVRveB7lvSbPzIpc+B
	 WnYoYqTtBKKyg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54fc64e8419so863482e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 02:16:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBuZCwe0Mn3IDwGy36lpmC+q05a7FRQqn0WrOftTUUP0OswMAr4csik63ZEXfd/wJ/HWvWKvolvce9UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymjDaynZV4ogXAYpDOiFLzJxz89tBI3gVI5+R121NcYzZOxhuU
	INevhpZ6m31yUqAnM7U8T0y3AU3PI01U82/6RL/QprMaO16rBAOw+tqDANb7fhbqWkFx7Cr+o3q
	B1ANBcOgtUW6aWGaERxJ0lXgMkks=
X-Google-Smtp-Source: AGHT+IHkBaVzoQTAsYshsXOwRceKOTjqdoPFSB4Nen3iA8jPmif43We1NbgcTURYcEcll6NAIemTE7E1kMosjzoprD8=
X-Received: by 2002:a05:6512:6613:b0:549:7145:5d2d with SMTP id
 2adb3069b0e04-54fc6769fc3mr707169e87.16.1746782215612; Fri, 09 May 2025
 02:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250505154523.231233-1-vkuznets@redhat.com> <20250505154523.231233-2-vkuznets@redhat.com>
In-Reply-To: <20250505154523.231233-2-vkuznets@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 9 May 2025 11:16:44 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHSW1=k59J9vOQULw2A_htLiKYc0h9zQ12xYqmutja+eg@mail.gmail.com>
X-Gm-Features: ATxdqUHIWMlwRPxGAvRlP1N6SGtiAq6FedBV8uC9y8j_U6nYAhSL-_feheWMgt8
Message-ID: <CAMj1kXHSW1=k59J9vOQULw2A_htLiKYc0h9zQ12xYqmutja+eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] efi: zboot specific mechanism for embedding SBAT section
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: x86@kernel.org, linux-efi@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Jones <pjones@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
	Emanuele Giuseppe Esposito <eesposit@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Luca Boccassi <bluca@debian.org>, 
	Peter Zijlstra <peterz@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_021658_337341_48660580 
X-CRM114-Status: GOOD (  27.30  )
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

On Mon, 5 May 2025 at 17:45, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> SBAT is a mechanism which improves SecureBoot revocations of UEFI binaries
> by introducing a generation-based technique. Compromised or vulnerable UEFI
> binaries can be prevented from booting by bumping the minimal required
> generation for the specific component in the bootloader. More information
> on the SBAT can be obtained here:
>
> https://github.com/rhboot/shim/blob/main/SBAT.md
>
> Upstream Linux kernel does not currently participate in any way in SBAT as
> there's no existing policy in how SBAT generation number should be
> defined. Keep the status quo and provide a mechanism for distro vendors and
> anyone else who signs their kernel for SecureBoot to include their own SBAT
> data. This leaves the decision on the policy to the vendor. Basically, each
> distro implementing SecureBoot today, will have an option to inject their
> own SBAT data during kernel build and before it gets signed by their
> SecureBoot CA. Different distro do not need to agree on the common SBAT
> component names or generation numbers as each distro ships its own 'shim'
> with their own 'vendor_cert'/'vendor_db'
>
> Implement support for embedding SBAT data for architectures using
> zboot (arm64, loongarch, riscv). Put '.sbat' section in between '.data' and
> '.text' as the former also covers '.bss' and thus must be the last one.
>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/firmware/efi/Kconfig                | 24 +++++++++++++++++++++
>  drivers/firmware/efi/libstub/Makefile.zboot |  4 ++++
>  drivers/firmware/efi/libstub/zboot-header.S | 22 +++++++++++++++++--
>  drivers/firmware/efi/libstub/zboot.lds      | 11 ++++++++++
>  4 files changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
> index 5fe61b9ab5f9..db8c5c03d3a2 100644
> --- a/drivers/firmware/efi/Kconfig
> +++ b/drivers/firmware/efi/Kconfig
> @@ -281,6 +281,30 @@ config EFI_EMBEDDED_FIRMWARE
>         bool
>         select CRYPTO_LIB_SHA256
>
> +config EFI_SBAT
> +       def_bool y if EFI_SBAT_FILE!=""
> +
> +config EFI_SBAT_FILE
> +       string "Embedded SBAT section file path"
> +       depends on EFI_ZBOOT
> +       help
> +         SBAT section provides a way to improve SecureBoot revocations of UEFI
> +         binaries by introducing a generation-based mechanism. With SBAT, older
> +         UEFI binaries can be prevented from booting by bumping the minimal
> +         required generation for the specific component in the bootloader.
> +
> +         Note: SBAT information is distribution specific, i.e. the owner of the
> +         signing SecureBoot certificate must define the SBAT policy. Linux
> +         kernel upstream does not define SBAT components and their generations.
> +
> +         See https://github.com/rhboot/shim/blob/main/SBAT.md for the additional
> +         details.
> +
> +         Specify a file with SBAT data which is going to be embedded as '.sbat'
> +         section into the kernel.
> +
> +         If unsure, leave blank.
> +
>  endmenu
>
>  config UEFI_CPER
> diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
> index 48842b5c106b..92e3c73502ba 100644
> --- a/drivers/firmware/efi/libstub/Makefile.zboot
> +++ b/drivers/firmware/efi/libstub/Makefile.zboot
> @@ -44,6 +44,10 @@ AFLAGS_zboot-header.o += -DMACHINE_TYPE=IMAGE_FILE_MACHINE_$(EFI_ZBOOT_MACH_TYPE
>  $(obj)/zboot-header.o: $(srctree)/drivers/firmware/efi/libstub/zboot-header.S FORCE
>         $(call if_changed_rule,as_o_S)
>
> +ifneq ($(CONFIG_EFI_SBAT_FILE),)
> +$(obj)/zboot-header.o: $(CONFIG_EFI_SBAT_FILE)
> +endif
> +
>  ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a
>
>  LDFLAGS_vmlinuz.efi.elf := -T $(srctree)/drivers/firmware/efi/libstub/zboot.lds
> diff --git a/drivers/firmware/efi/libstub/zboot-header.S b/drivers/firmware/efi/libstub/zboot-header.S
> index fb676ded47fa..e02247458b65 100644
> --- a/drivers/firmware/efi/libstub/zboot-header.S
> +++ b/drivers/firmware/efi/libstub/zboot-header.S
> @@ -123,11 +123,29 @@ __efistub_efi_zboot_header:
>                         IMAGE_SCN_MEM_READ | \
>                         IMAGE_SCN_MEM_EXECUTE
>
> +#ifdef CONFIG_EFI_SBAT
> +       .ascii          ".sbat\0\0\0"
> +       .long           __sbat_size
> +       .long           _sbat - .Ldoshdr
> +       .long           __sbat_size
> +       .long           _sbat - .Ldoshdr
> +
> +       .long           0, 0
> +       .short          0, 0
> +       .long           IMAGE_SCN_CNT_INITIALIZED_DATA | \
> +                       IMAGE_SCN_MEM_READ | \
> +                       IMAGE_SCN_MEM_DISCARDABLE
> +
> +       .pushsection ".sbat", "a", @progbits
> +       .incbin CONFIG_EFI_SBAT_FILE
> +       .popsection
> +#endif
> +
>         .ascii          ".data\0\0\0"
>         .long           __data_size
> -       .long           _etext - .Ldoshdr
> +       .long           _data - .Ldoshdr
>         .long           __data_rawsize
> -       .long           _etext - .Ldoshdr
> +       .long           _data - .Ldoshdr
>
>         .long           0, 0
>         .short          0, 0
> diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
> index 9ecc57ff5b45..c3a166675450 100644
> --- a/drivers/firmware/efi/libstub/zboot.lds
> +++ b/drivers/firmware/efi/libstub/zboot.lds
> @@ -29,7 +29,17 @@ SECTIONS
>                 . = _etext;
>         }
>
> +#ifdef CONFIG_EFI_SBAT
> +        .sbat : ALIGN(4096) {
> +               _sbat = .;
> +               *(.sbat)
> +               _esbat = ALIGN(4096);
> +               . = _esbat;
> +       }
> +#endif
> +
>         .data : ALIGN(4096) {
> +               _data = .;
>                 *(.data* .init.data*)
>                 _edata = ALIGN(512);
>                 . = _edata;
> @@ -52,3 +62,4 @@ PROVIDE(__efistub__gzdata_size =
>
>  PROVIDE(__data_rawsize = ABSOLUTE(_edata - _etext));
>  PROVIDE(__data_size = ABSOLUTE(_end - _etext));
> +PROVIDE(__sbat_size = ABSOLUTE(_esbat - _sbat));
> --
> 2.49.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
