Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AFAC3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDsqoivUFrO6bc594z8ehSZ6qO2apyAcmCiaa+czmq0=; b=HanpIblUFW9YC6
	8EbMV+SFdYlPA5sc9qtwg/a1GZuF85Y4smXdSUo6cSZn5GqswYSGZhrMWLYQ/ndEauK/MXxgm/185
	E/jb56pHK1X6h0cOmhboGsaxKfV7CGAJ0rzyrgDCQpr2vFWLJYqjAzPM53bYJ1H98aEXFIJ3HDSuZ
	blLbkTUo47+GWTfHm7NDJsxetPQtKDM5KDe8co7Ey4YJLKbCUjXyj+hr5I/DNA4R2b7rIUaiQxlJI
	I9r1OnWZp0xDlCaTLdjVf9vAqg7x1bRgfBcyl4adLWUOHtQwrdLA7zALIV1CiUwTAMG3uj/vrLS7A
	ewb0+/q19Vo00mXsbRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE4mS-000000079PW-3gjK;
	Sun, 11 May 2025 11:23:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE4mQ-000000079P2-2AIY
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 11:23:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a0b9303998so1764373f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746962616; x=1747567416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr62AM3KoGEBAH10wBbEzrU82okG3T/6xZVPR3kGFKE=;
        b=DjfyI5vkMvDJDxRLkHoI4e9BOKZaIgDILRcfYoDYmyJR6clyMU8qTqYO/NX2j+VruM
         V1cfOS8JoKHKUQAMyQObXEtv779sIqRmktuYTJE/ULEU2Y4myng70to7OezMS5GKCedF
         n7CDj+Z+SGG5wT6Qn2YwMH97Til1oXjKOooxq1RHnarFRF91MyDX3FVD+o7Ff9uC0bcX
         f9KJApGkCM7oA4TdNNDFMDBIdwxAODVA3YlAwRL2VPveJitBoDbhrLzWsfVHwfmGbRoN
         fRtjZz0EWhaICGrkB/XIeDF5VwSuMiKVmGZsHtak0Cr5jgxSHfiOVnIzWVXrgp+u3P8K
         hNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746962616; x=1747567416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr62AM3KoGEBAH10wBbEzrU82okG3T/6xZVPR3kGFKE=;
        b=cDDMw+n5zruEzP7eQM/QF9yLweD92qFjENWwe+8xr/5hUYxoF3YLdQRtdwr7C9isVA
         /1yfHu0/zd9j3TDCQV+SCdZspXhYBtJU6oxl9yYqRZvyQec0KieirWoERW2jo42r0Lbx
         Le3OfEIlhnxVqrUXoKN80k+GsKGc5t9c9+KwhAEOfyHUe2PmxvJMZD9YA2+kBbtzZYHV
         kk4ih6SzG2F58Otqv5hcGD8fY/xADok/D42ROZaQChqqxqRzd4jmnKtyIwac3KKl6k7b
         nK/uYhy8jKYlvXSG3toIv5rfe7c8Uz55DVXdlyqeUOsYiffn4EyElJ2UFTOzSUzrwQ/k
         gOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN0P0UrFOfpw34kVON+FlEGz/FjV7VKj13Ur+mhhpWVsRc+1vBMn9+6BbQY7uzeukMsam1uDcqJQSQAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSxotnesNvOlSrHRybWuAtiD7LxASeHMulZirHgbJI6EamJOzA
	dBnBJ5S6VxYU0XKwny+ouOpXcrXCc0RWaR77zJlU7MPUWXxvUQ0XGu+IRg==
X-Gm-Gg: ASbGncstkD7NYRtIrh62U+nbgyJcms18ReW+7oF4C7zg1Ag4MPf+5KRUE5P1Ft8NWB8
	L/y6gpyEnmRY9Xse9MKGH7ZHDrPBeX4oupkQisFm4bnA0xLz4k+UsqciPh4sogV5xUmPWC2VWWq
	iy8k6DCKAIRLiZvRD8U1Wh6bjqufmi30GPM440Qs+jgCXai1mYzajevLSs4Co0P+BBWbhswtsyi
	qM1mTWCwQ0D81ZDEGb9ThNYw5DNLxdOKCXzMQ4Vmg2uU5L1z3ljFKyVFDhb0e8o24thLg81Ba+u
	u8TAXK5aCNL+yUxwgxHjL0hv12nUvMPpgS8gCmeKD/2X0Wucukxo/e6HXITf6jSKnZGegAhfH2Y
	y2I7aGFFNYyu+xAiCyrwnWJBQ
X-Google-Smtp-Source: AGHT+IGqYzj25cJHQkUXe9+tpC/pNhXG07X1IG93ZPDwcMrzYGRzVt+SJJU2Lolx8RxeBWOFjdnGRQ==
X-Received: by 2002:a05:6000:2dc7:b0:3a0:b84f:46de with SMTP id ffacd0b85a97d-3a0b9941bd0mr11326589f8f.21.1746962616029;
        Sun, 11 May 2025 04:23:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf38sm8956991f8f.77.2025.05.11.04.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 04:23:35 -0700 (PDT)
Date: Sun, 11 May 2025 12:23:28 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann
 <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, Zhihang
 Shao <zhihang.shao.iscas@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 1/2] include/uapi/linux/swab.h: move default
 implementation for swab macros into asm-generic
Message-ID: <20250511122328.79e9a2d4@pumpkin>
In-Reply-To: <20250426-riscv-swab-v4-1-64201404a68c@iencinas.com>
References: <20250426-riscv-swab-v4-0-64201404a68c@iencinas.com>
	<20250426-riscv-swab-v4-1-64201404a68c@iencinas.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_042338_580551_18345D57 
X-CRM114-Status: GOOD (  22.84  )
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

On Sat, 26 Apr 2025 16:56:18 +0200
Ignacio Encinas <ignacio@iencinas.com> wrote:

> Move the default byteswap implementation into asm-generic so that it can
> be included from arch code.
> 
> This is required by RISC-V in order to have a fallback implementation
> without duplicating it.
> 
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
>  include/uapi/asm-generic/swab.h | 33 +++++++++++++++++++++++++++++++++
>  include/uapi/linux/swab.h       | 33 +--------------------------------
>  2 files changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/include/uapi/asm-generic/swab.h b/include/uapi/asm-generic/swab.h
> index f2da4e4fd4d1..232e81661dc5 100644
> --- a/include/uapi/asm-generic/swab.h
> +++ b/include/uapi/asm-generic/swab.h
> @@ -3,6 +3,7 @@
>  #define _ASM_GENERIC_SWAB_H
>  
>  #include <asm/bitsperlong.h>
> +#include <linux/types.h>
>  
>  /*
>   * 32 bit architectures typically (but not always) want to
> @@ -16,4 +17,36 @@
>  #endif
>  #endif
>  
> +/*
> + * casts are necessary for constants, because we never know how for sure
> + * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.

I know you are just moving the code, but that comment just isn't right.
Linux pretty much assumes that ULL is 64bit and U 32bit (UL varies).

So the UL constants should just be U ones (int isn't going to be 16 bits).

Not only that, but the code requires that the (__unn) casts don't
truncate the values. Performing the maths on a larger type isn't
going to change the value of the result.

Then we get to the integer promotion that does an implicit conversion
of the return of all the (__u16) casts back to signed integer.
So it may be better to leave/make the result of swap16() unsigned int
rather than casting it to __u16 and getting it promoted to int.

The only plausibly necessary cast is a (__u32) one in the result
of (except swap64()) to stop the compiler doing 64bit maths with the
result when the constant has a 64bit type (and all the other casts are
removed).

	David

> + */
> +#define ___constant_swab16(x) ((__u16)(				\
> +	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
> +	(((__u16)(x) & (__u16)0xff00U) >> 8)))
> +
> +#define ___constant_swab32(x) ((__u32)(				\
> +	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
> +	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
> +	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
> +	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
> +
> +#define ___constant_swab64(x) ((__u64)(				\
> +	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
> +	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
> +	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
> +	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
> +	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
> +	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
> +	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
> +	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
> +
> +#define ___constant_swahw32(x) ((__u32)(			\
> +	(((__u32)(x) & (__u32)0x0000ffffUL) << 16) |		\
> +	(((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
> +
> +#define ___constant_swahb32(x) ((__u32)(			\
> +	(((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |		\
> +	(((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
> +
>  #endif /* _ASM_GENERIC_SWAB_H */
> diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
> index 01717181339e..ca808c492996 100644
> --- a/include/uapi/linux/swab.h
> +++ b/include/uapi/linux/swab.h
> @@ -6,38 +6,7 @@
>  #include <linux/stddef.h>
>  #include <asm/bitsperlong.h>
>  #include <asm/swab.h>
> -
> -/*
> - * casts are necessary for constants, because we never know how for sure
> - * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
> - */
> -#define ___constant_swab16(x) ((__u16)(				\
> -	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
> -	(((__u16)(x) & (__u16)0xff00U) >> 8)))
> -
> -#define ___constant_swab32(x) ((__u32)(				\
> -	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
> -	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
> -	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
> -	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
> -
> -#define ___constant_swab64(x) ((__u64)(				\
> -	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
> -	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
> -	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
> -	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
> -	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
> -	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
> -	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
> -	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
> -
> -#define ___constant_swahw32(x) ((__u32)(			\
> -	(((__u32)(x) & (__u32)0x0000ffffUL) << 16) |		\
> -	(((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
> -
> -#define ___constant_swahb32(x) ((__u32)(			\
> -	(((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |		\
> -	(((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
> +#include <asm-generic/swab.h>
>  
>  /*
>   * Implement the following as inlines, but define the interface using
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
