Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42ABC2D0E1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61FD521D40
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rEKHzAKF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="hpg4QcQy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61FD521D40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ZJcMRDu31fv6or/Gt6jVgFNKhklzvNnUdqmaYrcmFCA=; b=rEKHzAKFuAZAD4jlxTbgi9Qa4
	WujJQPz7BBr/NE3rhwrJWopYuPypx5VhIGBmN0Ih2h5564C2KSjidLQ2Oi64wBUqtgZk/9CFSRxOl
	e4QiYh3KikaDKoLVDA4RAWagGl3vxJM5z4m3gMLvB4ci88+YIrsgZ+1gMMO00jOdFubVrX9HgtX/E
	mDPAqSmDJiSN5PK2ywkltI73Dxfi51Ozsrcm+kywXHLxIIrXWQQPxdQ2wTPa3XPLSd14xe5h37xiM
	MOh++AhlelM1+103SGFkp0qdCtuto9IJ5//cgJvDQ02TZxa1NowqeNWMy9q22kU5jOPbiocs6UrDq
	q87LUy30w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFsCh-0000Nf-LD; Wed, 09 Sep 2020 04:59:31 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFsCe-0000LR-EH
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 04:59:29 +0000
Received: by mail-pg1-x543.google.com with SMTP id v15so1182272pgh.6
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 21:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/CFjqhupI1AWKqg+mCbgMP9R+W6vd0H8IsBhpy0/FFY=;
 b=hpg4QcQyAdlz4HPaeo1/zixNDr+qZlp7W1wiXTwWOYJ/GWcLojwWm0o9fbPsFjukK9
 2LKyXGPlUU1c8pEOjV/nFFboLir8U07CRMECpMSSX4NodajoEO5/g2YUnEdaUOliam3v
 x3A/YIoz3tB3O2UOgr2XwxOPgtcNU/pjXer6Nvjw/A4SmYd3kuVE2yhD1obX3twpm0ZJ
 uY8gePDhzkbYs2xr3tSi0I50LXoRUBZy62iivUyn1MDOazCVhaC0q5853njaJ5h6HPDo
 vFAMxiLoka/mwDjY4FpgeA2C3f1ROVcjIJ6bOqoC3xU+j3/VplUtfN7ZTq74wSoUoqgm
 nYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/CFjqhupI1AWKqg+mCbgMP9R+W6vd0H8IsBhpy0/FFY=;
 b=gYbzRRTCiUPKiga5FdwLPEHFPrX8FMI5UT7Vk0AisycJdXBX2xLj7jf01mZ2axpwSU
 EDluk9uc3oaAkFs/8G3c39voYc1UxkKTCh2YW9PPUvT+NNeXW/cH/x/n0WcySyyPyrKT
 wqht0zokTyH8+W7XIhzcH+NcKvLddnEfA6yl/n1zbaISfZF0tmOj2dnLTAzerBKkJpsX
 bs69boWEkKfvIT7bjCM2j9YprMT616j3/pDYa4xC0X5vQW9ABym8QHGkfkNuJlrbtLdA
 feoqs3yLee0hK3DLe6xRwmfmW1m60Jo9/sbv4Ei+UZAilK8dALJyescH1E01CGHruoUf
 MYHw==
X-Gm-Message-State: AOAM531hbPvkadyCPb3G65wBAmcSXdMJnM2zfV+kjjXug9P+T2vt9kf2
 wT8P5CA+pnkVbYmI3Om7VR07dg==
X-Google-Smtp-Source: ABdhPJwy3yBcV7Uv8j6LpvPP4ltOvLLGG22xDuMaz75P6SEw83qpXJZok8u89m0LxFNrXKeBbGOOHw==
X-Received: by 2002:a62:1bc2:: with SMTP id b185mr2014599pfb.75.1599627566376; 
 Tue, 08 Sep 2020 21:59:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z18sm1034026pfn.186.2020.09.08.21.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 21:59:25 -0700 (PDT)
Date: Tue, 08 Sep 2020 21:59:25 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Sep 2020 21:43:09 PDT (-0700)
Subject: Re: [PATCH 6/8] riscv: refactor __get_user and __put_user
In-Reply-To: <20200907055825.1917151-7-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-e4978c15-9e83-4621-a9e6-76a550f6dcda@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_005928_487996_A12C2CED 
X-CRM114-Status: GOOD (  22.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 06 Sep 2020 22:58:23 PDT (-0700), Christoph Hellwig wrote:
> Add new __get_user_nocheck and __put_user_nocheck that switch on the size
> and call the actual inline assembly helpers, and move the uaccess enable
> / disable into the actual __get_user and __put_user.  This prepares for
> natively implementing __get_kernel_nofault and __put_kernel_nofault.
>
> Also don't bother with the deprecated register keyword for the error
> return.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/uaccess.h | 94 ++++++++++++++++++--------------
>  1 file changed, 52 insertions(+), 42 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index e8eedf22e90747..b67d1c616ec348 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -107,7 +107,6 @@ static inline int __access_ok(unsigned long addr, unsigned long size)
>  do {								\
>  	uintptr_t __tmp;					\
>  	__typeof__(x) __x;					\
> -	__enable_user_access();					\
>  	__asm__ __volatile__ (					\
>  		"1:\n"						\
>  		"	" insn " %1, %3\n"			\
> @@ -125,7 +124,6 @@ do {								\
>  		"	.previous"				\
>  		: "+r" (err), "=&r" (__x), "=r" (__tmp)		\
>  		: "m" (*(ptr)), "i" (-EFAULT));			\
> -	__disable_user_access();				\
>  	(x) = __x;						\
>  } while (0)
>
> @@ -138,7 +136,6 @@ do {								\
>  	u32 __user *__ptr = (u32 __user *)(ptr);		\
>  	u32 __lo, __hi;						\
>  	uintptr_t __tmp;					\
> -	__enable_user_access();					\
>  	__asm__ __volatile__ (					\
>  		"1:\n"						\
>  		"	lw %1, %4\n"				\
> @@ -162,12 +159,30 @@ do {								\
>  			"=r" (__tmp)				\
>  		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]),	\
>  			"i" (-EFAULT));				\
> -	__disable_user_access();				\
>  	(x) = (__typeof__(x))((__typeof__((x)-(x)))(		\
>  		(((u64)__hi << 32) | __lo)));			\
>  } while (0)
>  #endif /* CONFIG_64BIT */
>
> +#define __get_user_nocheck(x, __gu_ptr, __gu_err)		\
> +do {								\
> +	switch (sizeof(*__gu_ptr)) {				\
> +	case 1:							\
> +		__get_user_asm("lb", (x), __gu_ptr, __gu_err);	\
> +		break;						\
> +	case 2:							\
> +		__get_user_asm("lh", (x), __gu_ptr, __gu_err);	\
> +		break;						\
> +	case 4:							\
> +		__get_user_asm("lw", (x), __gu_ptr, __gu_err);	\
> +		break;						\
> +	case 8:							\
> +		__get_user_8((x), __gu_ptr, __gu_err);	\
> +		break;						\
> +	default:						\
> +		BUILD_BUG();					\
> +	}							\
> +} while (0)
>
>  /**
>   * __get_user: - Get a simple variable from user space, with less checking.
> @@ -191,25 +206,15 @@ do {								\
>   */
>  #define __get_user(x, ptr)					\
>  ({								\
> -	register long __gu_err = 0;				\
>  	const __typeof__(*(ptr)) __user *__gu_ptr = (ptr);	\
> +	long __gu_err = 0;					\
> +								\
>  	__chk_user_ptr(__gu_ptr);				\
> -	switch (sizeof(*__gu_ptr)) {				\
> -	case 1:							\
> -		__get_user_asm("lb", (x), __gu_ptr, __gu_err);	\
> -		break;						\
> -	case 2:							\
> -		__get_user_asm("lh", (x), __gu_ptr, __gu_err);	\
> -		break;						\
> -	case 4:							\
> -		__get_user_asm("lw", (x), __gu_ptr, __gu_err);	\
> -		break;						\
> -	case 8:							\
> -		__get_user_8((x), __gu_ptr, __gu_err);	\
> -		break;						\
> -	default:						\
> -		BUILD_BUG();					\
> -	}							\
> +								\
> +	__enable_user_access();					\
> +	__get_user_nocheck(x, __gu_ptr, __gu_err);		\
> +	__disable_user_access();				\
> +								\
>  	__gu_err;						\
>  })
>
> @@ -243,7 +248,6 @@ do {								\
>  do {								\
>  	uintptr_t __tmp;					\
>  	__typeof__(*(ptr)) __x = x;				\
> -	__enable_user_access();					\
>  	__asm__ __volatile__ (					\
>  		"1:\n"						\
>  		"	" insn " %z3, %2\n"			\
> @@ -260,7 +264,6 @@ do {								\
>  		"	.previous"				\
>  		: "+r" (err), "=r" (__tmp), "=m" (*(ptr))	\
>  		: "rJ" (__x), "i" (-EFAULT));			\
> -	__disable_user_access();				\
>  } while (0)
>
>  #ifdef CONFIG_64BIT
> @@ -272,7 +275,6 @@ do {								\
>  	u32 __user *__ptr = (u32 __user *)(ptr);		\
>  	u64 __x = (__typeof__((x)-(x)))(x);			\
>  	uintptr_t __tmp;					\
> -	__enable_user_access();					\
>  	__asm__ __volatile__ (					\
>  		"1:\n"						\
>  		"	sw %z4, %2\n"				\
> @@ -294,10 +296,28 @@ do {								\
>  			"=m" (__ptr[__LSW]),			\
>  			"=m" (__ptr[__MSW])			\
>  		: "rJ" (__x), "rJ" (__x >> 32), "i" (-EFAULT));	\
> -	__disable_user_access();				\
>  } while (0)
>  #endif /* CONFIG_64BIT */
>
> +#define __put_user_nocheck(x, __gu_ptr, __pu_err)					\
> +do {								\
> +	switch (sizeof(*__gu_ptr)) {				\
> +	case 1:							\
> +		__put_user_asm("sb", (x), __gu_ptr, __pu_err);	\
> +		break;						\
> +	case 2:							\
> +		__put_user_asm("sh", (x), __gu_ptr, __pu_err);	\
> +		break;						\
> +	case 4:							\
> +		__put_user_asm("sw", (x), __gu_ptr, __pu_err);	\
> +		break;						\
> +	case 8:							\
> +		__put_user_8((x), __gu_ptr, __pu_err);	\
> +		break;						\
> +	default:						\
> +		BUILD_BUG();					\
> +	}							\
> +} while (0)
>
>  /**
>   * __put_user: - Write a simple value into user space, with less checking.
> @@ -320,25 +340,15 @@ do {								\
>   */
>  #define __put_user(x, ptr)					\
>  ({								\
> -	register long __pu_err = 0;				\
>  	__typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
> +	long __pu_err = 0;					\
> +								\
>  	__chk_user_ptr(__gu_ptr);				\
> -	switch (sizeof(*__gu_ptr)) {				\
> -	case 1:							\
> -		__put_user_asm("sb", (x), __gu_ptr, __pu_err);	\
> -		break;						\
> -	case 2:							\
> -		__put_user_asm("sh", (x), __gu_ptr, __pu_err);	\
> -		break;						\
> -	case 4:							\
> -		__put_user_asm("sw", (x), __gu_ptr, __pu_err);	\
> -		break;						\
> -	case 8:							\
> -		__put_user_8((x), __gu_ptr, __pu_err);	\
> -		break;						\
> -	default:						\
> -		BUILD_BUG();					\
> -	}							\
> +								\
> +	__enable_user_access();					\
> +	__put_user_nocheck(x, __gu_ptr, __pu_err);		\
> +	__disable_user_access();				\
> +								\
>  	__pu_err;						\
>  })

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
