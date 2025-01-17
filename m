Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91287C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 23:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSjEwm4h+/mSgraRPgtjRbw1dNmC67HXkutkh6xJ818=; b=WXUYVLyf7v4nW0
	IBdSEJSaXdFI0Z/1qs6ip4RttYRieV7GEQZs7BT5j4ev0/j2zawcMuYQrOxu255GKwFfPNzoxXuaT
	F88U/OBmstk0OM+ouubImieCfV0ddCrCsTXsJ6A4gmn3ehW6/v+f1xiExubUN0Q/VFWeUQhvx+so1
	ti9EKcGcR5/spui20QMyelobf8lrpu2+qbn9lBG3Hh4sjeA9GLdwV/KTmgXFw3+1yus9heAvQqyoV
	YKyCm3IjYHcc+j2vUlxWX3rGQGfUspo459pZokxiJq30tK+PVZSxMz21zNhR/PGeydj5PTVWWOfwi
	4yQzVn9liiN0jFEX4/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvea-00000001WZk-1Tb9;
	Fri, 17 Jan 2025 23:21:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYveX-00000001WYb-2EDo
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 23:21:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-216426b0865so48288305ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 15:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737156084; x=1737760884; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A2KDSSjMPoe6KhHmCqTxDB5hjW9EhX35hsDpyUvTOnM=;
        b=nFFhhdixGzehgN4OOyxaVer201wef4wrSuqfO6LOpG2sO2e5aT6A9PWf7qYVu1q3BG
         a7g9EG3/Cu6/EfV6YtH75kBAxbzIyCFSUHHrYNA75n+RE03/c9dGZ7h8GIh/1i5+5vJS
         82NbPC+GSsqkZwi1fPJShn896kwscvIs6dPqlDIy+ddFTJ43wmQEVNY8vSK9+UeauyOV
         Tm2XCrE59d3amG9fD44FLlFMcA8goJtWfv5FTPjFOG/HLQpsO3WGw/95FHd6/E34kF/X
         FvIZp18MMdWiIRTUHBdVGnBmnsnTn9LgQhWnTguFHDCJnJa+6BBC+uMLsvoqROx/X/a5
         52ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737156084; x=1737760884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2KDSSjMPoe6KhHmCqTxDB5hjW9EhX35hsDpyUvTOnM=;
        b=F/DQReUCxPdJUCKC9EU0NH9gE+ivx3gsC3qLN/w+gVpYapRnv8fL7tGx8wpsYFQl5D
         u5AxHbntcyyOBbrJrX7drc9nklM9Iu1LxIip23Ql33vyNE+DWIjuA39+fztCJhNXWPBr
         r81beZp6nRMaxBRYzBbFiwMLLV2bxVJ7Ow7rIwrz1Nxsg57Q56fsI6gL4t3e1w4j+FR1
         /yS3+O/+7f+5e3R81bjOdwk4Y7OkIA8+fWmoupdUw7z8J+sTtggmZXS1e7lgW/ZKam7y
         lZ/il2SlQ4NnYbzFBl4c4KonE5Atysw6ufW+exwqvxCo54VCqwQ1/PYCUvyL/2jvXpN1
         KWRg==
X-Forwarded-Encrypted: i=1; AJvYcCXdAH9hh0JeNjrngG1izjP2l9SQfgZkm6OroqeeAhJcC0ZJwHB8AyES9nTe2noCyCOrv5yGxAHwGtkDWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXGt0ZUf9xcw9R4ePRnuJJt7vWFvBtJFfFSy9KMMJITOjwS8EW
	PMJ6ttvTQKZJFRekdZ0Mxk6Jvntsm0cOiFmS5vZBYuooAn3nabHf1DO+u+HIXaw=
X-Gm-Gg: ASbGnct8Udmj/f7E2scwJupTQ1h5MYPMmN8BvtqqOOFb2nx3/yw7TEynJsEru/D0nIJ
	oiq/8rZK9r4uB00diZDN2/oMc5E+DHRa2gOvu9sE5g6oilOjS3TUKNJ4ZxDtSPOwMHq+duKBoG3
	K6WBRu4zPeeDHcFSwk5Oo2Ejz/HZwF+6NAuMnOs/U7UtyDZv5JegfamYEVP/DzLZMIk0q/yuS8R
	BKIrKSBmHqiQBFjz0knxJhEk8ZpV61FfmQPlI5j2NdVz4FJdyvdVNfnfk+Lt9cJ2g==
X-Google-Smtp-Source: AGHT+IFFDclPSde28EVYoiFIZFZ3Ujco9A17f76zbeRAwHkYFdPC1xAWhkq2oVqSM/QEw4QVdzl5Xw==
X-Received: by 2002:a05:6a00:ad8a:b0:72d:8fa2:99ac with SMTP id d2e1a72fcca58-72daf975d73mr7162106b3a.13.1737156084118;
        Fri, 17 Jan 2025 15:21:24 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:d0ea:9b9e:5556:aa82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba48951sm2450749b3a.121.2025.01.17.15.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 15:21:23 -0800 (PST)
Date: Fri, 17 Jan 2025 15:21:20 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 1/4] riscv: implement user_access_begin and families
Message-ID: <Z4rl8BgoV8tygCn9@ghost>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-2-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118230112.2872978-2-cyrilbur@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_152125_834252_A35FAA1B 
X-CRM114-Status: GOOD (  26.05  )
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

On Mon, Nov 18, 2024 at 11:01:09PM +0000, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Currently, when a function like strncpy_from_user() is called,
> the userspace access protection is disabled and enabled
> for every word read.
> 
> By implementing user_access_begin and families, the protection
> is disabled at the beginning of the copy and enabled at the end.
> 
> The __inttype macro is borrowed from x86 implementation.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
>  arch/riscv/include/asm/uaccess.h | 63 ++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 72ec1d9bd3f3..09d4ca37522c 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -28,6 +28,19 @@
>  #define __disable_user_access()							\
>  	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
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
>  /*
>   * The exception table consists of pairs of addresses: the first is the
>   * address of an instruction that is allowed to fault, and the second is
> @@ -335,6 +348,56 @@ do {									\
>  		goto err_label;						\
>  } while (0)
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

Since a handful of these functions are duplicated across x86/arm64 it
would be nice to consolidate them to a shared header. That would
probably require quite a bit more work though so not in scope for this
patch.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
