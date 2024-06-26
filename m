Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AACCC30659
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 23:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJX/r65QqUKMbaYhIdge3sYonNj3QnxuJe3lBEaG+oY=; b=QQsGulmeTenSHG
	n3e1PIL3i9V6HPU6P8V5XRvX0wv4mIDfFhgQEL8Ee21QLsk6ECkHVhGYtSBy+eox7I5PmCbVH2/y/
	FBW3O2ARmSfhB6IBTkO/LUTnY8VI6FrX8VFydp99MdmO991z10wuVWz3YnmAEi8HJ+bp4VnRhRpAh
	nrsyFuPZgoVURRMW+OmOyTvKw+xOVhXTEdql2aN0m0AKThckCCvqbRJn8dCpCZcbtyZnfnDM76ZOy
	UQkJISi5zDOpwaY0NefVoFgKn0ePsMRYIdyE49FiJBpmZkmpfPNeEjsJLJ3uzDGHuljVSTW0T0pqa
	EgzRPs42Dg121BUmZePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMcDs-00000008e1a-1vYF;
	Wed, 26 Jun 2024 23:38:44 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMcDo-00000008e16-49me
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 23:38:42 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2c86869685aso695529a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 16:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719445119; x=1720049919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5l2iQ8Un/MYJ+DJGhn22FpNWybdeze/D551Fw/5heU=;
        b=X8ahoGufFbEN+eFUWGhqmhWtfk2rct1hoZV2qJJbhCnR8/hib3w3HgyQgkc1Rg9aYr
         +vU0OlJY5ihp1hCqZ4P5JhHpokZStbhNbdNoJrIWlC0O1O+gFp1TvSkgC6BWBiJ8GDsw
         LY+qDZY2zot0HTijibhYV6gQZnu+EY4DzX/Pndjw3bhmEGciAKHe5lzW4/dzScH3xdyZ
         I8Nwm8moyBJpXPJvhZaUJz5lHryVV5rvX8J77qFJCjY5spWlbDDYeZat/dSuKYcsSif6
         w7JBubaNzRvmZgJNIj8uXj7Dxp9xh7o8hb7obpYjtZPpxOYB2bgyEG7qtC9Gw+7ORn6x
         cUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719445119; x=1720049919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5l2iQ8Un/MYJ+DJGhn22FpNWybdeze/D551Fw/5heU=;
        b=dXD7do1ndOB4GPCrwaXH3/Lol9iQWYKO+w14x0jvrf62afu18ORvFTCwtTsWY6HyKd
         emInYZQsX/vZx0IlK8Nk2QFWOs3TgnEcDaqDMNDUB9J7nICMAtu+2m+nR2dECY7za0Ei
         nt57uQkkSp8Y31L1jDVLZ1hspsvbL0lCwdvNaTmimKcAm9BdgDSxnU19ycUCrhjxSism
         7oeVM2pABiEDHv7G0QAVGOGiF4pzb3z1+pf7Zpgv1tj6JVQU66T6MUOhn0eH3vlS8MW0
         n+wB+KMtzHzszwWN/wvelG8YhVI26nyRxnmydbl+aPxlYvE3G/4ah5ebokuDUI1kfePh
         zUGw==
X-Gm-Message-State: AOJu0YyTC6AAiHJzEU2lstJTKJrEc3QuA+lp/VBK7BTPT9QFOIeYtTV/
	CtzjBzkBvv12rbuPN6V/zbRJa14PVVSoOUeDbY80I5raybI5YWBhqzmLfYZR1A==
X-Google-Smtp-Source: AGHT+IEIxwlFob/uR3zR47IhM4aRFVDuY3BEZzYIiR7DjwWFH88aC1QjMj212v19rbPR+O7dL4RCqQ==
X-Received: by 2002:a17:90a:6286:b0:2c8:af45:adb9 with SMTP id 98e67ed59e1d1-2c8af45af82mr6393441a91.0.1719445119379;
        Wed, 26 Jun 2024 16:38:39 -0700 (PDT)
Received: from [192.168.50.113] ([27.96.222.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8fe9f210esm91677a91.31.2024.06.26.16.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 16:38:38 -0700 (PDT)
Message-ID: <c6609d59-8bfc-462c-98cf-db9b5373a497@tenstorrent.com>
Date: Thu, 27 Jun 2024 09:38:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] riscv: implement user_access_begin and families
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240625040500.1788-1-jszhang@kernel.org>
 <20240625040500.1788-2-jszhang@kernel.org>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <20240625040500.1788-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_163841_234816_D50BB2A8 
X-CRM114-Status: GOOD (  22.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 25/6/2024 2:04 pm, Jisheng Zhang wrote:
> Currently, when a function like strncpy_from_user() is called,
> the userspace access protection is disabled and enabled
> for every word read.
> 
> By implementing user_access_begin and families, the protection
> is disabled at the beginning of the copy and enabled at the end.
> 
> The __inttype macro is borrowed from x86 implementation.
> 

Beat me to it, I've written an almost identical patch. The performance 
improvement where the unsafe_ variants are used is very good even 
without the rest of the series.

Reviewed-by: Cyril Bur <cyrilbur@tenstorrent.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/include/asm/uaccess.h | 63 ++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 72ec1d9bd3f3..09d4ca37522c 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -28,6 +28,19 @@
>   #define __disable_user_access()							\
>   	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
>   
> +/*
> + * This is the smallest unsigned integer type that can fit a value
> + * (up to 'long long')
> + */
> +#define __inttype(x) __typeof__(		\
> +	__typefits(x,char,			\
> +	  __typefits(x,short,			\
> +	    __typefits(x,int,			\
> +	      __typefits(x,long,0ULL)))))
> +
> +#define __typefits(x,type,not) \
> +	__builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
> +
>   /*
>    * The exception table consists of pairs of addresses: the first is the
>    * address of an instruction that is allowed to fault, and the second is
> @@ -335,6 +348,56 @@ do {									\
>   		goto err_label;						\
>   } while (0)
>   
> +static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
> +{
> +	if (unlikely(!access_ok(ptr,len)))
> +		return 0;
> +	__enable_user_access();
> +	return 1;
> +}
> +#define user_access_begin(a,b)	user_access_begin(a,b)
> +#define user_access_end()	__disable_user_access();
> +
> +static inline unsigned long user_access_save(void) { return 0UL; }
> +static inline void user_access_restore(unsigned long enabled) { }
> +
> +#define unsafe_put_user(x, ptr, label)	do {				\
> +	long __kr_err = 0;						\
> +	__put_user_nocheck(x, (ptr), __kr_err);				\
> +	if (__kr_err) goto label;					\
> +} while (0)
> +
> +#define unsafe_get_user(x, ptr, label)	do {				\
> +	long __kr_err = 0;						\
> +	__inttype(*(ptr)) __gu_val;					\
> +	__get_user_nocheck(__gu_val, (ptr), __kr_err);			\
> +	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> +	if (__kr_err) goto label;					\
> +} while (0)
> +
> +/*
> + * We want the unsafe accessors to always be inlined and use
> + * the error labels - thus the macro games.
> + */
> +#define unsafe_copy_loop(dst, src, len, type, label)				\
> +	while (len >= sizeof(type)) {						\
> +		unsafe_put_user(*(type *)(src),(type __user *)(dst),label);	\
> +		dst += sizeof(type);						\
> +		src += sizeof(type);						\
> +		len -= sizeof(type);						\
> +	}
> +
> +#define unsafe_copy_to_user(_dst,_src,_len,label)			\
> +do {									\
> +	char __user *__ucu_dst = (_dst);				\
> +	const char *__ucu_src = (_src);					\
> +	size_t __ucu_len = (_len);					\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
> +} while (0)
> +
>   #else /* CONFIG_MMU */
>   #include <asm-generic/uaccess.h>
>   #endif /* CONFIG_MMU */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
