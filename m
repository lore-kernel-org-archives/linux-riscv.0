Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2473DC4828D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 02:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpmQCmO9sU1i1ZX3NL4ej9EwwOfKxkt8sU4GYbNUcNw=; b=E2clpO/iqcxgUd
	kyuZy/mSsY5gp3Po6aM6WMbqJ5bqXEOn/3CgtR5dnUXf3Eu4/MIzFeOSY4ZMAX/oJ6k9nkGFQQVhK
	9t7Ymo2tPxmVnKfdw4N8j4bRVKkQjMrFMqpKS0phZZ7TPBWsGBKtXw5IKXVK2UuB1AK9DD8sTsq1y
	LeT2/Y/bk/Ju+HxDFcNwWQM8DVmdfCH16XpelEoBCmMoWVsz+RyyiS+WPZWlnHRcmx4i3+7lpE1St
	Yb3REzsTvDNd9946ZSdy1t1QbK/Qw1vRZ4regU55d1qIWTdSOf27L4/ewDRlBQ7OajS917w8CUKoI
	7QtZ6fPtQ6MeWHoymWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjMO-00000009u4s-1FiA;
	Fri, 02 Feb 2024 02:32:56 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjMM-00000009u3t-17NM
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 02:32:55 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-295ecd6a198so1767049a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 18:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706841173; x=1707445973; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0bXBoUL8xedCmLcnMAqTDLt5mCSq9W7voiTTkiqTwv4=;
        b=SZPYvRCRTqTICXGscHfpCzBwFlQfo396f7NU1M4Bml2Jz/6/aIIcW06jQ7RnBF9w4z
         J03fwYzgq9B1pwvus1HaJ+LYk1qh+10MV2MKT+YlrhviXeSXu32GddkfnEneWHeeaAB0
         /mbxJuEG+ivVL3JPcsKEMPGoHH/zchAZ7x0MaAQFm2aSZDOB7+rwAWtUIxdavqjEMhYM
         ApWtAILAuD48NwX+OJlJvzQvlY0E/G0fLnCERpYl7mTkYFQKwOmhwtuOy3DDw7O3sJY1
         hUUvgwdTJIWyDbKozGf/Q79aeOqhe0vjPKAMensJ5CjCxpzN8I6ctzFZXHXJP4BRyy1i
         nIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706841173; x=1707445973;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bXBoUL8xedCmLcnMAqTDLt5mCSq9W7voiTTkiqTwv4=;
        b=DhrHIogQAWuUusoDl2k/rN8TEUIb2mNPd6kVW36VWDGZGWHgRfBItx8IFf4fEZ7QPl
         h+0N/vfn4aoAmwe+UFmFBhAFpNT7vYKxMBJJZuvsqMw8MznH8p9X5dp0BVGmvXID/P8b
         Q5r1P+jBsOmG7YJ7hlfDYPj3AKfWyFxjnACZFAwqDCFxxXw5O2E1HrjgDeoy87Gux47S
         ICoIZrI2d8f8bybwW020Wpbg0+STZTJSItgFKOamlmtHvt/DCu9jNmhh1dJm1/6O5DHl
         KF+W/pd9y8R4hPr5J2zqtacf1ErW8eq7Azu1tfERo/TSWuXWkZrPf/hDl0sDolJGwkL4
         d8ug==
X-Gm-Message-State: AOJu0YwP9vW9NcSBcEdGeF/eWHTonPFSXMFBDnCzc6xuiYvQAI+yjfF0
	FBPparXKIPzflh7lfYWVtVQbuUSZi5z9P63IelYMDmNRkHhUOonQXya3lnHNGjY=
X-Google-Smtp-Source: AGHT+IGtFCDECe658rt2QpCLasaQ2JkghYeJOImzP8BJBK7/gOp6/f6aiZdBc58sQIW8BtovrJE54Q==
X-Received: by 2002:a17:90a:b10a:b0:296:2843:99cd with SMTP id z10-20020a17090ab10a00b00296284399cdmr1401923pjq.19.1706841173141;
        Thu, 01 Feb 2024 18:32:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXZ6STwiDMcre3f6rZaunHarbO54/adMkGh2ZZ/CykLb79STq4eDTPsA5FX5WMZZXHBB5Msk+NlKkixeem05d2nlknG/D+rpeG6q2rYqx6udY6poFg+E2WGpkLZbpqBQQDqH9FQ+G+6INoHRtQ2OYwp3QKaCj50D06NLGYRrElpiFFjg3oohH9gLBhab/i78AaPUCe4L/BJDoWZYoChqaaYdPZqS09P7OlDc5V51mcNlvFgyeGGbBkX4bUko2TCq4ihf/Ye1gsASBbkH+BajspR/pXVmcfJ83NELoR6FiZShQ==
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id t13-20020a17090a024d00b0028ce81d9f32sm650159pje.16.2024.02.01.18.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 18:32:52 -0800 (PST)
Date: Thu, 1 Feb 2024 18:32:50 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robin Ehn <rehn@rivosinc.com>
Subject: Re: [PATCH] riscv: hwprobe: export VA_BITS
Message-ID: <ZbxUUsKdKIPI8Fb/@ghost>
References: <20240201140319.360088-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240201140319.360088-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_183254_331919_A4DF1F06 
X-CRM114-Status: GOOD (  25.64  )
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

On Thu, Feb 01, 2024 at 03:02:45PM +0100, Cl=E9ment L=E9ger wrote:
> Some userspace applications (OpenJDK for instance) uses the free bits
> in pointers to insert additional information for their own logic.
> Currently they rely on parsing /proc/cpuinfo to obtain the current value
> of virtual address used bits [1]. Exporting VA_BITS through hwprobe will
> allow for a more stable interface to be used.

mmap already supports this without a need for applications to know the
underlying hardware. If a hint address is passed into mmap, it will never
return an address that uses more bits than the hint address. I designed
it that way so that something like this wasn't necessary.

- Charlie

> =

> Link: https://github.com/openjdk/jdk/blob/master/src/hotspot/os_cpu/linux=
_riscv/vm_version_linux_riscv.cpp#L171 [1]
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> =

> ---
>  Documentation/arch/riscv/hwprobe.rst  | 3 +++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 3 +++
>  4 files changed, 8 insertions(+), 1 deletion(-)
> =

> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index b2bcc9eed9aa..6f198c6ed4f0 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -210,3 +210,6 @@ The following keys are defined:
>  =

>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_VA_BITS`: An unsigned long which
> +  represent the number of bits used to store virtual addresses.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  =

>  #include <uapi/asm/hwprobe.h>
>  =

> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
>  =

>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 9f2a8e3ff204..2a5006cddb7b 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -67,6 +67,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> +#define RISCV_HWPROBE_KEY_VA_BITS		7
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  =

>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index a7c56b41efd2..328435836e36 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -202,6 +202,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pa=
ir,
>  		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
>  			pair->value =3D riscv_cboz_block_size;
>  		break;
> +	case RISCV_HWPROBE_KEY_VA_BITS:
> +		pair->value =3D VA_BITS;
> +		break;
>  =

>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
> -- =

> 2.43.0
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
