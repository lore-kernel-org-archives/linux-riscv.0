Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E47C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lw9nI892Q1ZuseHKkTZHmz4ZnkGHwQvjoC0RajHvrhE=; b=LUadX3VfDlif9H
	AkfTqNqSXRcdhZkfrwJ4WWd5SnEu487qD+7KLLp9ceasByQsuJiigGb0siqHJwtoeMO3fr7u7eMQD
	uFBwIfhpQoCCk9hlWA/QWXeskVcCvFsT9boc87oAoOCzgyGYdgIsRsNNhi7im9XvZ0t1HZxjxIoXO
	tyKyparHEhj4X987DyEyZOViYNd3vumof5ocHXHS1bSod2aapfFZ13eagjdvTI+8TAiP5kClJgD9w
	R3+TnL86Z9IHaL10FqEaooJvvCgwbO3byBKKeEDwUIpvWbmmvfCTjRjIMmgWlK6FnTlTALOa82G+t
	mBRUALGNpygs9BvEQePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxf7-0000000EV1Q-3rZF;
	Mon, 22 Apr 2024 17:41:05 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxf3-0000000EUzm-0Z7s
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 17:41:02 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6114c9b4d83so37899877b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 10:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713807657; x=1714412457; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8oSz86JzOY9DQvGvueAGk0oxmVKc1JpB72xgEu0TDts=;
        b=pG9O/huP4kdgHlXgMhQGsxjfc1S/I90yVtdzGvoPDN6rJcUMMee0q1RlkU3jI7njj6
         Bgz/c2Fwugr+jzariGAxVr+ryI7oJbCbXmXzMtfQguQK/BqHELRIyU34V4S8l9eTlEhZ
         62w/0DtaxFD7C+5P1OoUlWnq+n488+eZDdJp9xA0WbiXc2/2Yb7xjXF1NWr/9wOkKss/
         TDmkXWBpfWfrNpUXJ2yWoW4IC/QWQmHav+m5C1of/mOQC2dWUZG7AjVEP7eVtAb+BRbi
         gLItyFYNT+2X2uU01UIdXFlhz05LbmU9NYIDS0tzMEP0tPIRVuzPtAd96Mppq2D28qjJ
         a1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713807657; x=1714412457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oSz86JzOY9DQvGvueAGk0oxmVKc1JpB72xgEu0TDts=;
        b=lmEoJTdSy602w2cGGaBoDkN/uYGOUG6niFzSJStn4ruHvxRCitkpz6z0ZoK9vFlTsl
         hNAV5sBCZFJS+CwmMhFuYz7bojTw2ro3bAF9pEwv4ZWXsX2HxPOQIDXe1PIetZSN1MmZ
         on2c2NMIaYWb23BeJYDOzUVwxJ9yWHAv/o4cmf/cf4K/BhyhzecYKprKeOhUYsCi4nkN
         c0tobOw4B9f8HJ83uh8zGRR7bTI9fw41y0lcjsUrDO02mmD4PZuTxHLoaWhfSZVLaLJN
         VRoXZVAbBsH7qie9uV2C07+jXQAGK+VfoF0gTJc9CJs1Y1aZtEdz6hiVAlUWV/InpKjX
         dB4g==
X-Forwarded-Encrypted: i=1; AJvYcCWZtQkYiiE4Sj2CFTmIxX2acWDWYuztvLWVpiwLUsHoZlR1CBHB8oKb4gGEhO1MGsFQA/n7uUFR74CJLWbU4Y8ZcXUB7Qd1VcPKgk5uhVtS
X-Gm-Message-State: AOJu0YwXs8XPM2vAQorbvatX9bpJcfQNpwYtPPo/IQMUrk3VTBl9JPr5
	XOyt1SpKFm+5arF3aVfMO+fLNo7xIHLMogjvKOp38Re78WgooamXSbvMpO+ExV8=
X-Google-Smtp-Source: AGHT+IF6LQ8zdofhxJ/PNSOv5IQXexYxxfrsaWAs34RmUulyK1yyuZ4SFyNwWs4DcElioVxSqpYRPw==
X-Received: by 2002:a05:690c:3685:b0:617:c9b0:e12c with SMTP id fu5-20020a05690c368500b00617c9b0e12cmr10651242ywb.38.1713807655898;
        Mon, 22 Apr 2024 10:40:55 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id r29-20020a81441d000000b00608876ed731sm2060370ywa.126.2024.04.22.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 10:40:55 -0700 (PDT)
Date: Mon, 22 Apr 2024 13:40:53 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 14/15] riscv: Add support for suppressing warning
 backtraces
Message-ID: <ZiahJT8MTFqAlD5A@ghost>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-15-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403131936.787234-15-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_104101_207806_365ECB4A 
X-CRM114-Status: GOOD (  23.50  )
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

On Wed, Apr 03, 2024 at 06:19:35AM -0700, Guenter Roeck wrote:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
> 
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because __func__
> is not a define but a virtual variable).
> 
> To simplify the implementation, unify the __BUG_ENTRY_ADDR and
> __BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
> the address, file, or function reference as parameter.
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> v3:
> - Rebased to v6.9-rc2
> 
>  arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index 1aaea81fb141..79f360af4ad8 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -30,26 +30,39 @@
>  typedef u32 bug_insn_t;
>  
>  #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> -#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
> -#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
> +#define __BUG_REL(val)	RISCV_INT " " __stringify(val) " - ."
>  #else
> -#define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
> -#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
> +#define __BUG_REL(val)	RISCV_PTR " " __stringify(val)
>  #endif
>  
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> +
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	__BUG_REL(%1)
> +#else
> +# define __BUG_FUNC_PTR
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +
>  #define __BUG_ENTRY			\
> -	__BUG_ENTRY_ADDR "\n\t"		\
> -	__BUG_ENTRY_FILE "\n\t"		\
> -	RISCV_SHORT " %1\n\t"		\
> -	RISCV_SHORT " %2"
> +	__BUG_REL(1b) "\n\t"		\
> +	__BUG_REL(%0) "\n\t"		\
> +	__BUG_FUNC_PTR "\n\t"		\
> +	RISCV_SHORT " %2\n\t"		\
> +	RISCV_SHORT " %3"
>  #else
>  #define __BUG_ENTRY			\
> -	__BUG_ENTRY_ADDR "\n\t"		\
> -	RISCV_SHORT " %2"
> +	__BUG_REL(1b) "\n\t"		\
> +	RISCV_SHORT " %3"
>  #endif
>  
>  #ifdef CONFIG_GENERIC_BUG
> +#ifdef HAVE_BUG_FUNCTION
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC	NULL
> +#endif
> +
>  #define __BUG_FLAGS(flags)					\
>  do {								\
>  	__asm__ __volatile__ (					\
> @@ -58,10 +71,11 @@ do {								\
>  			".pushsection __bug_table,\"aw\"\n\t"	\
>  		"2:\n\t"					\
>  			__BUG_ENTRY "\n\t"			\
> -			".org 2b + %3\n\t"                      \
> +			".org 2b + %4\n\t"                      \
>  			".popsection"				\
>  		:						\
> -		: "i" (__FILE__), "i" (__LINE__),		\
> +		: "i" (__FILE__), "i" (__BUG_FUNC),		\
> +		  "i" (__LINE__),				\
>  		  "i" (flags),					\
>  		  "i" (sizeof(struct bug_entry)));              \
>  } while (0)
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
