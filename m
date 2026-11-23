Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72046606A686
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vlg373tf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=arngu888
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=46IVEtlK0F/0wnf8MqoArC8CFjvnbfD6RfY9VXdPSH8=; b=Vlg373tf0Bl7UUKps9hUzV3Wdb
	kUEJ0XFDakw+h4y3cG+OmaYzQhOeXV51+1jIkocZgCIMFIKs1j6nOvRWSKM8+Dc1oDrSW53EAxFbU
	CjDYMuN9jjOsmv/fQsziHEOyLRXe+YETPjufZTGtVGtta906s+opDq/+DnVrqyJYjFEMQrt32Up8z
	Nkkh8xjbJPl2xD/ETNvd3WxG+578L4zfNoIBYIGAUhJYH3u/V5F4dHLL+wdJ0+6Io1EyXUcolVNhw
	a8sAJhLW53x0liQQNPYSg7pJ2/Jlk1k6Zgn77fOjnsQ86XVPOEdMbxSHS/0oCm2AR/27Lj1PvH+It
	Eb8ANxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdB1-000000058Dp-3pXo;
	Mon, 23 Nov 2026 23:10:23 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdAl-00000005871-2Mra
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 23:10:11 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-18818daa3e7so2279463c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 15:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1795475406; x=1796080206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=omPzYJsyHFXBTWaYCXRuHKP+shwbFJ7ykCdiwHLxPZA=;
        b=arngu888qdy+blQO89/oXe4WPD+OECuLIbbJf9koMw403mI1DHW9QrjucLol8eWAxn
         tErgmj0BFS/COXRTRdfVm5+F9/nnDxUvxAyaS9UsgMTJAq2xLi4u/rJh6xpncejh6IsM
         7+296Sv7nzxjIdHhz0pA9pNLGAbtmpROG9k/aJRvo/vojW0/OsJr3781mX3jY9NM3iJ1
         4L4mP1FvKcp8BR0padGEcYqi5vhmA1H4Ibh/v2ryqm6x0s9mjxL4mu+2z81RsmtHRJxy
         mdzh09u2knoDngwPyDI9HWa0DCrCHzXo9jLhVZ8ubjQ2QZFg8hYLwcvzCheVevs2oRGq
         ITVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475406; x=1796080206;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=omPzYJsyHFXBTWaYCXRuHKP+shwbFJ7ykCdiwHLxPZA=;
        b=VkjC5enedJcFOTGP3TO6cs9oPWK1Xhef8v7k+p6mZb9nlQKNY3y2cAkjVWMwcu6fiT
         utzUa5D04lg57aCjMhDpGK88poplfJT6ztB3jQ+hOW2zq/W8HpgoMwUXFXMDzuy6Uf1R
         DxpHbZhmq6xRLnekIgtGhZ87P3kqPHFV0P9O27XriIMNIZaiSUucplq26SvjVTsSC8Ab
         h1DBUvqCRlcWWhg9hShjh53HVV5lUA0S+BMSNOyfo0oIjkuSEhgwvzoq9tDgN+3mx6l1
         7etbGzA/EC7Gxromq2ag+SxG0UisQax6K2iN7eGXQueTzwUFx89WTtGmCJn9sAJmYGhW
         YqMQ==
X-Forwarded-Encrypted: i=1; AL+hErGBR6bxFm8m+DpmjwMsryofq2Xws2WCluayk86h5WgnzUwBKPLh1S+xzgcarSpi8/mpYxM/KBJEa/HsHg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Hf2hwp1Uy2Rz/eo5JO3n1xue6x4cQjoCCVz0HZgop7i5zKD/A
	RJflLL9IJP1qPnpdh8BxfSDsrHuNzNeJ7ChVPtV617gmYy3UYX2PbLJqlm097wApnGU=
X-Gm-Gg: AZFdTZfx3avahMDB4LQLxgmak7kYcXlftiECXn34oR0hg12QXxH1/Mle4MqaHFPgXy9
	A5rzO203PyHJ2EOkr6epJwRNExvE2oT3sLk0uPxs6GHTDXBmURldPb/ThYZWNOSL5FFYlzMNGlI
	rCVBJ3zooIDitp3BCo4OafWebypaF8vST8HSxxQVlUiIzgBMCgf/khWar3N/lXtPv9DyGpI5lqF
	Lxb/u2MBTLWhl2FB+nWCZ1NSY+OkQkN/THWVvAiZ0JPOx7ZekacVFLeybaDgJgB/Zm8d/aHo6GB
	fiEwvfXJ/jnJCYhJamYaUlLis5wG5/a/EWi3FWN3tRRRwWBNzOSkXtv56sJeMeDcB0VJILQpxrT
	TZza0MBE93pNYfFqW2PAoByjSs129rmVj9Uz7/I8L0fzpCnKgILzVkoapazBoP4kUKHYqKkD0/2
	50w8RGK9Lrlu/Tm0H/FSJwcG4op/nWa7kMoTZnTwW32nbXY52TlmuXK98PN4kIMwS0NkZElJ4kp
	Tco0He6RdcDn3X0gu43tPsGMkQj5xJeK3Lv7l7bkWIjk64677gUwVFT7vJM1oGygMAuDCX4/uUc
	0LPkk2duJibSD/0qIe73bQrljSKiOTWz1HBVSa/K52QYGwzau2JumeQ+oZrH/FcAg2S0AXwJ9wc
	7mIAW4gDfGdi5LrLvYKuY9lD2HIg=
X-Received: by 2002:a05:7022:4181:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-1b5568abf0bmr18844780c88.4.1795475406085;
        Mon, 23 Nov 2026 15:10:06 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm33422877c88.6.2026.11.23.15.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:05 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:05 -0800 (PST)
X-Google-Original-Date: Mon, 23 Nov 2026 15:09:50 PST (-0800)
Subject: Re: [PATCH v4 04/19] efi/riscv: Rename __init_text_end to __inittext_end like other archs
In-Reply-To: <20261118182105.1633603-25-ardb+git@google.com>
CC: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  Ard Biesheuvel <ardb@kernel.org>, jgg@nvidia.com, pjw@kernel.org, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb+git@google.com
Message-ID: <mhng-D54B7D56-AACE-456E-AF40-670E83DF8B47@Palmers-Mini.rwc.dabbelt.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_151008_420610_171E8EE1 
X-CRM114-Status: GOOD (  18.48  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 10:21:10 PST (-0800), ardb+git@google.com wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Align RISC-V with arm64, LoongArch and x86, and drop the underscore
> between 'init' and 'text' in the section markers. This allows the value
> to be captured by generic EFI stub code that can be shared between all
> those architectures.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/include/asm/sections.h         | 2 +-
>  arch/riscv/kernel/image-vars.h            | 2 +-
>  arch/riscv/kernel/vmlinux.lds.S           | 4 ++--
>  drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> index a393d5035c54..4a882a28f414 100644
> --- a/arch/riscv/include/asm/sections.h
> +++ b/arch/riscv/include/asm/sections.h
> @@ -11,7 +11,7 @@
>  extern char _start[];
>  extern char _start_kernel[];
>  extern char __init_data_begin[], __init_data_end[];
> -extern char __init_text_begin[], __init_text_end[];
> +extern char __inittext_begin[], __inittext_end[];
>  extern char __alt_start[], __alt_end[];
>  extern char __exittext_begin[], __exittext_end[];
>
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 7b44b94f1283..bf703eba3fa5 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -27,7 +27,7 @@ __efistub__start		= _start;
>  __efistub__start_kernel		= _start_kernel;
>  __efistub__end			= _end;
>  __efistub__edata		= _edata;
> -__efistub___init_text_end	= __init_text_end;
> +__efistub___inittext_end	= __inittext_end;
>  #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
>  __efistub_sysfb_primary_display	= sysfb_primary_display;
>  #endif
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 9849a3e4d102..0ec1b4b55e41 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -46,7 +46,7 @@ SECTIONS
>
>  	. = ALIGN(SECTION_ALIGN);
>  	__init_begin = .;
> -	__init_text_begin = .;
> +	__inittext_begin = .;
>  	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
>  		_sinittext = .;						\
>  		INIT_TEXT						\
> @@ -72,12 +72,12 @@ SECTIONS
>  	}
>  	__exittext_end = .;
>
> -	__init_text_end = .;
>  	. = ALIGN(SECTION_ALIGN);
>  #ifdef CONFIG_EFI
>  	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
>  	__pecoff_text_end = .;
>  #endif
> +	__inittext_end = .;
>  	/* Start of init data section */
>  	__init_data_begin = .;
>  	INIT_DATA_SECTION(16)
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 725b634c5179..5cbc50a814e1 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -34,7 +34,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>  	efi_status_t status;
>
>  	kernel_size = _edata - _start;
> -	kernel_codesize = __init_text_end - _start;
> +	kernel_codesize = __inittext_end - _start;
>  	kernel_memsize = kernel_size + (_end - _edata);
>  	*image_addr = (unsigned long)_start;
>  	*reserve_size = kernel_memsize;

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
