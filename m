Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2AEC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4iyWu1NyyHUlCFEnF7fI5IH7RsFref3NDt5astoBm0=; b=BPcN9t0hgIcWaT
	dwzO/yvTnI4vo+jdVibiC3eo3PanKrg8Am9u3Xz0JkW5JdFad+CYxD7euA38f5YLfj6S4t7bgizz2
	odR9eV187wQWxcEH1cQpj1r/u3yHf7m+uCzKFiXVSrXP+5fRNoC04X7x5lHlBggPHB9TJDxnmn//S
	8UHAuq7by7HFseBU/J8Xn9sqJUwXk5CW1ebo+th2NWmffQr1Bnc0aYF0U0bgkdYxkTpghHxzFw8UE
	Wy6iDCJkwzwiDd35Z92AiQBlJz7Db1wgkcZ+kJ+qE10KnKoCGBdUjvGQbqdLsfpvRM/CcDiNM2IaV
	QVMejd0AnYcgwlCQb2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpRo-0000000AVzk-25qC;
	Thu, 27 Jun 2024 13:46:00 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpRk-0000000AVyq-2m25
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 13:45:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so1863728a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 06:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719495955; x=1720100755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kqCUxWciB9MbG2JQ9jtj996Vwl+0BU0fXmC1Jg/exqU=;
        b=AG93jNWNlCwtT49TT8K95u74DOkfHnQgIpKL5A47LyA34ox4WZihhN0KPQnIfDrWhN
         IEfIWIeyhN0HpvjCRHliwIYNZilLQbj5rOH7801k5jqiLD77+S1etjxZxT9T/MtMayrT
         K2RRURJJQc9eYlAbbbvHLzIWVajeMfaZjPAFCTWvfEPbOgCqVKHvO8jG7T3KuPoAspSI
         bXUphejjEoCCjU2acWC/u/k2hVHqJq4QYrVSrA4OpnESnzEzzwVcQqcQ6sO+UsGewSvP
         YNpbxQrlLqf3fbvJGHIsnJK7c47yjsS6MeK0H8S5xtH8XRzfZF6/Sbmu+r9KZ9q2Dsat
         XJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495955; x=1720100755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqCUxWciB9MbG2JQ9jtj996Vwl+0BU0fXmC1Jg/exqU=;
        b=pN+3a/ELdm/AGbQiOQpqjLbuxVk98ETEi5pUV2SmsDDikTyCNcqdnBXooS1UBVKYWa
         DSu8dXgpvEYE2K8PRaLXTtAwKFfdlV9xbdOJtTcXMfDyVhq1Q+Gf3edTTfNyQXTg9K0B
         DAf3zILFU62gS5+R0ovuWhYERgluTldfLZDDEfoxOawpMTGMnG0hkkB5FvBM9m+aJhuQ
         ZUlPqAyeAYncfjluM6W/agdXL2VuPHQkNClb2h9azg87wHpJjL3nt5SI5t/65GmIg2Cc
         OmuUe+/KFvTSK7NH9m74IZqws6XTvk7m8IMubEEZ+e3bRIevaJmb07x8x4rhoHH/Eyhg
         P+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX15ddKtmPmdKkK9ORMeEsmSqBKt7lmhwWTH8h4oo+OMXzGN4KcQ5tSjbXs1h48OVuAnGy9E4oJcltRdgzDKQG6+5hVuWrTAWtTijLQMigT
X-Gm-Message-State: AOJu0YxEhJb7wmgSx5dDCes9OUUzo2PxKOOXuow8NGOr0+Wdd3SAEawg
	fo4b+Y7CMShv4eSita/BYW6D5loPTkPiN6KHBmArnh8Ttth2hUzD
X-Google-Smtp-Source: AGHT+IGKZ1CSUGDI4rs/M/a4ZH4Jj1812GjsMZF8LngzceqmSBm6tDeQ9YvrE+dUO5jhVyH6YeGZRA==
X-Received: by 2002:a05:6402:340d:b0:582:5195:3a7a with SMTP id 4fb4d7f45d1cf-58251957777mr6515379a12.35.1719495954679;
        Thu, 27 Jun 2024 06:45:54 -0700 (PDT)
Received: from andrea ([217.201.220.159])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d1280e93sm902182a12.33.2024.06.27.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:45:54 -0700 (PDT)
Date: Thu, 27 Jun 2024 15:45:47 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 06/10] riscv: Implement xchg8/16() using Zabha
Message-ID: <Zn1tC1G6eiyIW/yJ@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-7-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626130347.520750-7-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_064556_903906_013BAAB5 
X-CRM114-Status: GOOD (  12.63  )
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

> -#define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
> +#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,	\
> +			   swap_append, r, p, n)			\
>  ({									\
> +	__label__ zabha, end;						\
> +									\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
> +		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
> +				     RISCV_ISA_EXT_ZABHA, 1)		\
> +			 : : : : zabha);				\
> +	}								\
> +									\
>  	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
>  	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
>  	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
> @@ -28,12 +37,25 @@
>  	       "	or   %1, %1, %z3\n"				\
>  	       "	sc.w" sc_sfx " %1, %1, %2\n"			\
>  	       "	bnez %1, 0b\n"					\
> -	       append							\
> +	       sc_append							\
>  	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
>  	       : "rJ" (__newx), "rJ" (~__mask)				\
>  	       : "memory");						\
>  									\
>  	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
> +	goto end;							\
> +									\
> +zabha:									\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
> +		__asm__ __volatile__ (					\
> +			prepend						\
> +			"	amoswap" swap_sfx " %0, %z2, %1\n"	\
> +			swap_append						\
> +			: "=&r" (r), "+A" (*(p))			\
> +			: "rJ" (n)					\
> +			: "memory");					\
> +	}								\
> +end:;									\
>  })

As for patch #1: why the semicolon? and should the second IS_ENABLED()
be kept?


> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e17d0078a651..f71ddd2ca163 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,7 @@
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
> +#define RISCV_ISA_EXT_ZABHA		75
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5ef48cb20ee1..c125d82c894b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> +	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),

To be squashed into patch #3?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
