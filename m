Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3C4C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9hM9X7XqaAynGM9KxPOXeAhgwB4BfvzU8z5U4e0akw=; b=F/lVLr/xEZM2ca
	YIZnlvkNlrz9qutNtrDZwfIKoOWZx4O4Vs6iklEZLl3iUAGDLokwzmBrTuoEgY5Wwr1FjV9ltKeUr
	CFZACIw17G9c8EyGGbW9lCFii9/0ETRD7OifaT/Tb54OdN0LK5SlAspjaw6V78o3QWF6NfqtvKAEE
	yP+Gk2ylqv2R6NDRLG7XyEu78/mznBNlzPxYpVtGJ0h8d4uuibzUzSml0MmzSOqB4Rx7ILAEAweqn
	mi2rhp3TCeQgkQ/5fYz4PYb5kXG8AFq2RiGCchY3PUAsEfk8uNdf9yANxz/32Zh72Fqs74hJTGOnL
	BrxBhTq3zInF7lN/MvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2o2-0000000BsOv-0B8H;
	Wed, 15 Jan 2025 12:47:34 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1gF-0000000BhVL-1NXX
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 11:35:29 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso1189169966b.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 03:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736940926; x=1737545726; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lUHWtySzqJ9yO6ZWLDwixXceZtGyWajzSTrgRbyzKjU=;
        b=EpqCJtIi+G8DQ6HHzssk3IWErNz0V+mRTCTYjLt7pPPXfLesofTvCYwpl6dfY/KQqa
         gWpued0AWv4xaOMl0xPWQLoO/1JWGjGPLiBKQrSH1shPOAxKNpGHTV2ASbJGwzEb6O87
         KkRdtI809xIFUO6h6j7CqutU2dGTF4RIIVsaiTakj/LEb15adtZ2pez5O9Htug902Bz3
         hgrB50onzk56e6Wyd48qIfLAydI2VcybbFPjpzXgvhthhE7A385jfJilevglIH3rvUOg
         EKxj23DUI13cLOYawi1IKgO0vzAdTZvKUJjirR6TZuF8/QEZP2GPBgBTrU2U/IXihTHd
         PYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940926; x=1737545726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUHWtySzqJ9yO6ZWLDwixXceZtGyWajzSTrgRbyzKjU=;
        b=fyP7HQJ9Jhhg4T5tl4zjVu8PTE4QEVu7qmMvfsNB+pDmls74uwYQKZi8r3yEOzQRGO
         hMl412S1lgfe+zriMfcFjCPRRtHvDGgsUasipV8eXVHqWJPZLLD5xPPWhKaQxSt9xz7Y
         RhM1axzKYC9l+U01MABqYvTwld1nwgxeRs9X8JpU+F88Jf8jmD4TMLgtqHmGZU34/yms
         0hXYb898QJw6isVCtAa6BNMvqIjpYZEjNWDT0HMA3Tijqt2m2v1OdVmTzeHAubcfT/8V
         4stOuGp+hCstQD7pFVl8+2x9x/JXCxc1Qeu6yOrHuPCuFjBM47UWPl1imYCnZR0yIiNe
         cOdw==
X-Forwarded-Encrypted: i=1; AJvYcCUkfQKM2+6uR0NSOlV3hIwmGwKYO9PnWbZE7YTYA8sa5OXOR1XnCfBgKNz5FwFNLNiBlGBJXYqvNl/nXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu8lIsGixa4O/ndLRAV8Lm7vU0hFru9r4+lhCGBk0mTBq53JY/
	9/brsI2i9pfNlkR3gE8c/iymZ3XAe5HnFYGzOJ3hLNwG7D1Oz6RwNWtGWtzfkew=
X-Gm-Gg: ASbGnct2ywRtQJRC7Frq313TjUHv6ENMgQsm+24Ve0MdWu7keBKMYqEcyQ1ff4f5qmD
	y0haxh9g7BkLup6JsV+x/JqCJFhPRxLRrVworgpXLrDLo3q+9E+EE7iWKFcDDRIV2oZWbiNfExU
	f0HWzaqgzUfJzQfv6EuZZUs/fnqe+J/8XhrB9hAP0u/utz6J4PukcYu2jhGoEtuOus6DIepNoNU
	UD4CUDsM57RbRQxO2kVJ4xcQz+m0o7xNEE790227o68FAibQeGV3sVOJYdczFB/o0UZtLHHb65j
	ZFQYvTfkfPPuoUiCASzWpi+mC4pElZoWYPD8lhHcLw==
X-Google-Smtp-Source: AGHT+IEQLKTa0DBxC8EOVUTlbuIfogqAL7gY4MctOjS7wqT4IZEViihjVaBW+6yGKWlOG3PEpzozoQ==
X-Received: by 2002:a17:907:9617:b0:ab2:d2e7:abc7 with SMTP id a640c23a62f3a-ab2d2e7b16bmr2022380966b.19.1736940925400;
        Wed, 15 Jan 2025 03:35:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905ed87sm738090866b.28.2025.01.15.03.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:35:24 -0800 (PST)
Date: Wed, 15 Jan 2025 12:35:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: Oleg Nesterov <oleg@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, 
	Charlie Jenkins <charlie@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, Guo Ren <guoren@kernel.org>, 
	Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 2/3] tools: copy include/linux/stddef.h to
 tools/include
Message-ID: <20250115-710fcf2a3f874dfd032211c2@orel>
References: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
 <20250115-riscv-new-regset-v6-2-59bfddd33525@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115-riscv-new-regset-v6-2-59bfddd33525@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_033527_370603_4C8284A7 
X-CRM114-Status: GOOD (  26.84  )
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

On Wed, Jan 15, 2025 at 07:13:28PM +0800, Celeste Liu wrote:
> Some macro defined in stddef.h are useful and have been used in many
> code in selftests. Copy them to tools/include so developers needn't
> create their copy in every files.
> 
> Remove some definitions like NULL and true/false to be suitable to
> non-kernel environment.
> 
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> ---
>  tools/include/linux/stddef.h      | 85 +++++++++++++++++++++++++++++++++++++++
>  tools/include/uapi/linux/stddef.h |  6 +--
>  2 files changed, 87 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/include/linux/stddef.h b/tools/include/linux/stddef.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..55f3964d9a3d9f9f9345a75248eec027c56faef9
> --- /dev/null
> +++ b/tools/include/linux/stddef.h
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_STDDEF_H
> +#define _LINUX_STDDEF_H
> +
> +#include <uapi/linux/stddef.h>
> +
> +/**
> + * sizeof_field() - Report the size of a struct field in bytes
> + *
> + * @TYPE: The structure containing the field of interest
> + * @MEMBER: The field to return the size of
> + */
> +#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
> +
> +/**
> + * offsetofend() - Report the offset of a struct field within the struct
> + *
> + * @TYPE: The type of the structure
> + * @MEMBER: The member within the structure to get the end offset of
> + */
> +#define offsetofend(TYPE, MEMBER) \
> +	(offsetof(TYPE, MEMBER)	+ sizeof_field(TYPE, MEMBER))
> +
> +/**
> + * struct_group() - Wrap a set of declarations in a mirrored struct
> + *
> + * @NAME: The identifier name of the mirrored sub-struct
> + * @MEMBERS: The member declarations for the mirrored structs
> + *
> + * Used to create an anonymous union of two structs with identical
> + * layout and size: one anonymous and one named. The former can be
> + * used normally without sub-struct naming, and the latter can be
> + * used to reason about the start, end, and size of the group of
> + * struct members.
> + */
> +#define struct_group(NAME, MEMBERS...)	\
> +	__struct_group(/* no tag */, NAME, /* no attrs */, MEMBERS)
> +
> +/**
> + * struct_group_attr() - Create a struct_group() with trailing attributes
> + *
> + * @NAME: The identifier name of the mirrored sub-struct
> + * @ATTRS: Any struct attributes to apply
> + * @MEMBERS: The member declarations for the mirrored structs
> + *
> + * Used to create an anonymous union of two structs with identical
> + * layout and size: one anonymous and one named. The former can be
> + * used normally without sub-struct naming, and the latter can be
> + * used to reason about the start, end, and size of the group of
> + * struct members. Includes structure attributes argument.
> + */
> +#define struct_group_attr(NAME, ATTRS, MEMBERS...) \
> +	__struct_group(/* no tag */, NAME, ATTRS, MEMBERS)
> +
> +/**
> + * struct_group_tagged() - Create a struct_group with a reusable tag
> + *
> + * @TAG: The tag name for the named sub-struct
> + * @NAME: The identifier name of the mirrored sub-struct
> + * @MEMBERS: The member declarations for the mirrored structs
> + *
> + * Used to create an anonymous union of two structs with identical
> + * layout and size: one anonymous and one named. The former can be
> + * used normally without sub-struct naming, and the latter can be
> + * used to reason about the start, end, and size of the group of
> + * struct members. Includes struct tag argument for the named copy,
> + * so the specified layout can be reused later.
> + */
> +#define struct_group_tagged(TAG, NAME, MEMBERS...) \
> +	__struct_group(TAG, NAME, /* no attrs */, MEMBERS)
> +
> +/**
> + * DECLARE_FLEX_ARRAY() - Declare a flexible array usable in a union
> + *
> + * @TYPE: The type of each flexible array element
> + * @NAME: The name of the flexible array member
> + *
> + * In order to have a flexible array member in a union or alone in a
> + * struct, it needs to be wrapped in an anonymous struct with at least 1
> + * named member, but that member can be empty.
> + */
> +#define DECLARE_FLEX_ARRAY(TYPE, NAME) \
> +	__DECLARE_FLEX_ARRAY(TYPE, NAME)
> +
> +#endif
> diff --git a/tools/include/uapi/linux/stddef.h b/tools/include/uapi/linux/stddef.h
> index bb6ea517efb51177a7983fadad9b590b12b786e5..f2548fd95f6e1d8cb218d52918bb81a3317d10b1 100644
> --- a/tools/include/uapi/linux/stddef.h
> +++ b/tools/include/uapi/linux/stddef.h
> @@ -1,8 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -#ifndef _LINUX_STDDEF_H
> -#define _LINUX_STDDEF_H
> -
> -
> +#ifndef _UAPI_LINUX_STDDEF_H
> +#define _UAPI_LINUX_STDDEF_H
>  
>  #ifndef __always_inline
>  #define __always_inline __inline__
> 
> -- 
> 2.48.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
