Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42571F45A0A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5hkWFkScw0Fmf7N41mVnvdcAhyIOKkr95hhzVb4TeE=; b=WUtNjjDxOxtuSC
	rzCbHmenFx0dM5IYb/G6ufMHCM1/OBuYHKGZm9uHkrR5Vp+9e7YxX8om/TTChKNzA6chPOX6H8SYY
	RWDB4YQXWGCNKmnuNvu4rPCL6hzyd71R5I66h8J6XaQLm4dtIEuKyY3gB7+4Tiyx1DZT6affhs5qx
	YG8mhnMkmbqpOnFTJOeTj0DvgZpywgvYDTnkM2TJkYWvYpPeCYBz4/Fu9jlCsEEIu+QIEn5wrX1to
	Vdp5iuV+M05Z8ebBXsTUDSvNjWIfblSuq29DmdCD+sDaui5w8OhF3uD/o4dunGocVNH30tVDSJ6XR
	Pp4/duDE8+oV++G0FWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBHYb-0000000CjGo-3IUL;
	Fri, 10 Apr 2026 19:30:21 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBHYZ-0000000CjG4-1SYY
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 19:30:20 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1274204434bso1471510c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 12:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775849418; x=1776454218; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=my2h4a55Rlk+pvbxp+YWW0yf4Z5ioBXWGNElDO5E6xo=;
        b=JKiAEepmSift2140Gn1z+xiPiGFWWuDhZzAeGiiD2zPuzr172zVaDbqWhUyrCsbJ3z
         M0W7TLxeFQjVjPKldXIu0jZm+GQxQ5IjuLVV33kw0CTfhsOa5/2UQJTrjncN4S/62del
         fMadpSGy2ilYByF8odG7VHKxiEJSlDphQIp5NN0Iv0MB98BlOeNUaW3Zn43MDHkSfIVw
         tUSduedVIlKBpFUePWt8/WCwxZ+JN8/3FVKriR+FvcV6SjPK7rcZeUKN/srQKMZVNLON
         NM1jKOmFIjcS7kDp9xYVrtKqnd8IymdujVHd3ydEE8QLej9cwYsrYjhrGvdKm4t9DTjH
         H+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775849418; x=1776454218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=my2h4a55Rlk+pvbxp+YWW0yf4Z5ioBXWGNElDO5E6xo=;
        b=qRJYjP+xjvXhy4VucsndmcS/t6/I638V1dk0HPufaZQnwZ+j4GJAZM4Adv4BrvK1Cy
         BEM/L28EUZXWA82o2VG4kBhNwpRhMb4zJjxHQO4gc15kqotvUjkO2PCDGz5Ed49Yqk/v
         0XpAog4t/rU2IuRtrcZePcDi1mPnFq4bY5UeCeGYRQqNpHyWdKJhpjUjq4ihcTPnz6zL
         rhAoYsT9o/Jx+quCOc5S5lO45sGdfGnV2h5l9ga5k6adpR3sh1WfrAR34di4qiSBKSd0
         FH8tOADog+Zq1UA4LuwqfQBACWWj0KkkJnu4VtkPwZh95cBoOEQ82BC4a5HlvOJV5hEo
         Q6+g==
X-Forwarded-Encrypted: i=1; AJvYcCUguw9HfykPFdm+nC1MySNiITiFZrkKOtawxS5KwsWUoMBqjMuJjVm6ghkVQWJBMhOD+qj6b0WrWoQ1Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy3zqvwLn1r04VgBw3HbIePwsNXWMqiqsRLYcSh0V+JJ9BTtZX
	Z8GHg2s212K6XPNYOYUh6KVrDqJ4Qgk9VcFRv2Ma4QH+Es1nG4C26OAPGQ2trZW4
X-Gm-Gg: AeBDieujMr4aeE684QujVtn2+J7nYwf4Alh3k0rPOPbG9bKKCLgHZx26pGvnQ2vmTwg
	iTwxbTOdcw7vV1zgHRcvuQUU3ALVtDsd//EScUYaP6B/v9e0vEQcuX181uciwLxQbz9dPbiQ2NC
	AxmHfYjIz7+rYUdFP5FIcb5YH6ORo299Ft/PC5k511vTVIiZs9GW5BlVyK+CdY0v/+kISgJf1dd
	U3c39MZ/4iSXUEBrWGHBpQIJB1Y6CeOp/Pj115ewitl0GFOe4M6TZI5GdTyOUmdXESjUpxM36Wm
	lWA29ilOi4zbc+Kve9L6t5JvrTc5wN8rIZo4U8SZTMASZ1zl8DlPxPn0xa8kDb/f2itrf6bDUtp
	Li7t/tAl16+GYz7RpPmvWeBWbiLzQdGZPckg3K8THZeHrtTRqoWGLLGoa57GcQ1ufCtMxgSYu5z
	0FbJXWuipFLuWSW2kmXXC086vx0U0gQT6ynSKtgEuXa8l7gOvJQA2jAvFmW6mDreuHXZ1hXPOsv
	AzDLPo=
X-Received: by 2002:a05:7022:fb04:b0:12a:8122:24a9 with SMTP id a92af1059eb24-12c28c40f4bmr3733714c88.22.1775849418074;
        Fri, 10 Apr 2026 12:30:18 -0700 (PDT)
Received: from inky.localdomain (c-73-241-101-104.hsd1.ca.comcast.net. [73.241.101.104])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb314sm4531723c88.10.2026.04.10.12.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 12:30:17 -0700 (PDT)
Date: Fri, 10 Apr 2026 12:30:14 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/2] riscv: add platform-specific double word shifts
 for riscv32
Message-ID: <20260410193014.GA817331@inky.localdomain>
References: <adavgV5IF9jMzxr3@ashevche-desk.local>
 <20260409033824.465455-1-dmantipov@yandex.ru>
 <20260409033824.465455-2-dmantipov@yandex.ru>
 <20260409232252.GA495784@inky.localdomain>
 <cd37e33a200e05f96830f8edf313b0651572c32f.camel@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd37e33a200e05f96830f8edf313b0651572c32f.camel@yandex.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_123019_395444_3531E22F 
X-CRM114-Status: GOOD (  24.28  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 10, 2026 at 01:49:31PM +0300, Dmitry Antipov wrote:
> On Thu, 2026-04-09 at 16:22 -0700, Charlie Jenkins wrote:
> =

> > However, this change causes the libstub to bypass these new functions
> > you have introduced. lib-ashldi3.o and lib-lshrdi3.o use the following
> > rule to compile the generic arch libs:
> > =

> > $(obj)/lib-%.o: $(srctree)/lib/%.c FORCE
> > 	$(call if_changed_rule,cc_o_c)
> > =

> > This is specifically for the efi libstub, the regular kernel (like in
> > your test case in the next patch) will use these newly introduced
> > functions.
> > =

> > One solution is to use this change instead:
> > =

> > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/e=
fi/libstub/Makefile
> > index e386ffd009b7..775c34d80179 100644
> > --- a/drivers/firmware/efi/libstub/Makefile
> > +++ b/drivers/firmware/efi/libstub/Makefile
> > @@ -96,7 +96,7 @@ CFLAGS_zboot-decompress-gzip.o=A0=A0=A0=A0=A0=A0=A0 +=
=3D -I$(srctree)/lib/zlib_inflate
> > =A0zboot-obj-$(CONFIG_KERNEL_ZSTD)=A0=A0=A0=A0=A0=A0=A0 :=3D zboot-deco=
mpress-zstd.o lib-xxhash.o
> > =A0CFLAGS_zboot-decompress-zstd.o +=3D -I$(srctree)/lib/zstd
> > =

> > -zboot-obj-$(CONFIG_RISCV)=A0=A0=A0=A0=A0 +=3D lib-clz_ctz.o lib-ashldi=
3.o
> > +zboot-obj-$(CONFIG_RISCV)=A0=A0=A0=A0=A0 +=3D lib-clz_ctz.o ../../../.=
./arch/riscv/lib/ashldi3.o ../../../../arch/riscv/lib/lshrdi3.o
> > =A0lib-$(CONFIG_EFI_ZBOOT)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 +=3D zboot.o $(zboot-obj-y)
> > =

> > =A0lib-$(CONFIG_UNACCEPTED_MEMORY) +=3D unaccepted_memory.o bitmap.o fi=
nd.o
> > =

> > This will link against the correct shifting libraries.
> =

> 1) This seems wrong for riscv64 which can have CONFIG_EFI_ZBOOT=3Dy as
>    well but doesn't need these 64-on-32 quirks.
> =

> 2) IIUC EFI stub executes just once before the kernel is booting, so it
>    doesn't seem too critical to link arch-specific (optimized) things
>    against it.
> =

> So I'm voting for something like:
> =

> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
> index 29e0729299f5..55fb5a20aa25 100644
> --- a/drivers/firmware/efi/Kconfig
> +++ b/drivers/firmware/efi/Kconfig
> @@ -85,6 +85,10 @@ config EFI_ZBOOT
>  	  provided that the loader implements the decompression algorithm.
>  	  (The compression algorithm used is described in the zboot header)
>  =

> +config EFI_ZBOOT_EXTRAS
> +	bool
> +	default y if RISCV && 32BIT
> +
>  config EFI_ARMSTUB_DTB_LOADER
>  	bool "Enable the DTB loader"
>  	depends on EFI_GENERIC_STUB && !RISCV && !LOONGARCH
> diff --git a/drivers/firmware/efi/libstub/Makefile
> b/drivers/firmware/efi/libstub/Makefile
> index f83301a19dc5..8f199b99d0f6 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -96,7 +96,8 @@ CFLAGS_zboot-decompress-gzip.o	+=3D -
> I$(srctree)/lib/zlib_inflate
>  zboot-obj-$(CONFIG_KERNEL_ZSTD)	:=3D zboot-decompress-zstd.o lib-
> xxhash.o
>  CFLAGS_zboot-decompress-zstd.o	+=3D -I$(srctree)/lib/zstd
>  =

> -zboot-obj-$(CONFIG_RISCV)	+=3D lib-clz_ctz.o lib-ashldi3.o lib-lshrdi3.o
> +zboot-obj-extras-$(CONFIG_EFI_ZBOOT_EXTRAS) +=3D lib-ashldi3.o lib-lshrd=
i3.o
> +zboot-obj-$(CONFIG_RISCV)	+=3D lib-clz_ctz.o $(zboot-obj-extras-y)
>  lib-$(CONFIG_EFI_ZBOOT)		+=3D zboot.o $(zboot-obj-y)
>  =

>  lib-$(CONFIG_UNACCEPTED_MEMORY) +=3D unaccepted_memory.o bitmap.o find.o
> =

> Kindly ask you to test this. And it will be even more helpful if you can =
test
> building an running riscv64 as well :-).

I agree with this solution. With this patch applied, I have tested
EFI booting on riscv32 and riscv64. Thanks for putting this together.

You can add my tags assuming this patch is applied in the next
version.

Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

> =

> Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
