Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB879C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 21:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4q3oJP8f59yv8RH9OK3MDfQOT4uc8gXvGvedtr47yY=; b=YxoCDR2BvqmXxX
	smeaC39UByZkNXeDUakXMjDKkrN9neX6VCDZMd3b/a6B65y96CcYNeKCwR0XcV+jUpWRCaTsuMULS
	7iS+2mRc8PyxWxSEvlmd/NBINSoZ0hI4AYPz27Sd4ktG5L0YIcTQcIvkmRI5LwdWCgZ7Uiz/f+79x
	J8lu0LmbvC1eHYeo8VQYk7x0dmn60ry0W7S8SNM8tFpnw23lZQyrhVngryF0AYpGRzbvzsd5AEH+U
	ZMuGFtrCfvF1lUoZizZEuw8v+69G5HCbTe8bqyQEaBX43OAOazpLBjYDxngH5LqCr6ZNfhtsax/LX
	+fOC6KDqhuKldfqmJOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYB1t-0000000DAwI-1WJ1;
	Wed, 15 Jan 2025 21:34:25 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYB1q-0000000DAva-3tZc
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 21:34:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2165448243fso4186425ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 13:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736976862; x=1737581662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVmYZuo4JztFy4oHdJS4ilSyh+oEt0DgqkgC+LTjKe0=;
        b=CNZqaHSFqSH6ewFUiqICb/zEkklMOv6AvPZz9hEenH+1djTGYUW2W4iVy6h/u1Tad5
         s/3FWbUWvpB2P4VG/qZpRmdtYUq/WJgupsH9FSu4yFPdukOib6mZiDE+PUdTE0nHQ/1w
         vt/Wpy+S6/ngj/MbTLCz5foRco3dqBN8GYb0gzzksQxeyqUmDhyli3oyRRgY0cVOh6Lx
         hWizaVbBwyYL52tq1wu6AAHWPuMBMqVJwEs6/fkxjwF0SaBapJlY3NNXXqgE8VAtm8y/
         15VFpwIe6CTdNzib+VnPOB/kGG9wgaBCRgOViOwOxc9tVxsUmQB1cPJsIMSVmmjBm0X5
         bHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736976862; x=1737581662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVmYZuo4JztFy4oHdJS4ilSyh+oEt0DgqkgC+LTjKe0=;
        b=OMLD9yHkGqGjFK5Zj3SU2EKd15AEaNEeXNTy24ArplaK+E/8HsZyJ/dyI4rdO13aMY
         yjiHXHNc11+m13Rz5/pNMRndtKpwiWn1NtJ6zGt8HbtUbgNMeuqBQ+UBm0mmP1o7kRZ8
         MPC/3Cn3l9uGmyP+ogjulVWpCIkwdg8iciskzz8s4NHZbPs2WE1K5LsBtGs9v3rH8x4j
         Tu0SyH3Uot5KZdfd+ypcQCSly7tz6c5q+OFv/h+iabaoaVZ5AAY7TBuZjOa6U1tWVSS3
         iL08BpcWT7sMVlnc0DndKeA/O+znJPEmlJja0EkQm9T+/yXblQOHc+5LOe26HuhCnzzX
         M+dg==
X-Forwarded-Encrypted: i=1; AJvYcCVFjrqs+cW0J0FrlwHj3VlwWUN6bA042/jLrTI7X/PMIBgFSG3oQ7T5GeEdtkYkkh0vy8jMmkfGD7ADfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJogk7YRi1AyRFC8qXkJzalmTfkDf0q86LEe7IWPJJTG+2JVD7
	aU6tWTUeRl5B7a0vIfPGCcFWkZ5/PURnsiktZYxqt5JAhDvJGthFDZ7WG+jBrJs=
X-Gm-Gg: ASbGncvLPrEGv1xaQx+oKBJMlhhSSvzO9xDUilNDNZUzV8wrP5wXma+uUjej7X2oAEO
	JZBCttE6moc4HYcWogHHYaq3m/8Q5wmbPhN5LJm5hnCTh4gx1lyPtuGPVs5i2adA9FbWVsQXwqi
	KpI4sh7drrNMbAkHDQrlbi57YJvZE/ySZ9rzzvLP2NtcBE27iEHrW4zJmLwo84oHhSmjyvbTWv+
	yUFlCtNa+ddkKpg8Q/wjj2u7lJzBF/KzypRFNre2wTRvbA=
X-Google-Smtp-Source: AGHT+IEFFmZNaH6UqZPYmMZlBbhtp2FzCX0zJ/bThZgticWcSW23VRr/5H6Ff6GcPQSKFDKM32goTg==
X-Received: by 2002:a17:903:2311:b0:216:4724:2757 with SMTP id d9443c01a7336-21a83f46a3fmr512059935ad.4.1736976862005;
        Wed, 15 Jan 2025 13:34:22 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25c927sm87197555ad.228.2025.01.15.13.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:34:21 -0800 (PST)
Date: Wed, 15 Jan 2025 13:34:17 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
	Andrea Bolognani <abologna@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 2/3] tools: copy include/linux/stddef.h to
 tools/include
Message-ID: <Z4gp2f-wQwLPCaO1@ghost>
References: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
 <20250115-riscv-new-regset-v6-2-59bfddd33525@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115-riscv-new-regset-v6-2-59bfddd33525@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_133422_970562_012A5FA9 
X-CRM114-Status: GOOD (  25.89  )
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

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
