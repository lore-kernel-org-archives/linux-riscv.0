Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E31EC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 02:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXV6rC4DeNPHhyT3IeuTlURlIzIaot+TcCKn3DdetPU=; b=WCZqzPQfRnv3Bk
	2Ne65qBOofiykLfsB5ggTn9KJT2tLoLHVSw52abup1bRjiYenQaLc6nPu9PoDAogSOmmcUirhQeJz
	6gyF9bCaMLvqz9fhv8sQD2mkii54rorHbBFuXSrFgHH9CKIMlopjfi+GeJ8aqTIotqoSYv4suXly6
	n+b7qDJPzvV8IvvTcRGnWtTuKIDEoivmPXHoO5s6fJdPjilF3/fv1Scz87F9X0avFoAKiSArviMpC
	oY2vN+vxt9BW0UGpsOH9DU9WO5dPewQk1/RhvuJBNCLOpmj6OcpPOWfnHtWrDAxVkF99XhWiCARJF
	59aDOHVBoUZ9A2KaVoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rowit-00000002nrl-03nk;
	Tue, 26 Mar 2024 02:39:35 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rowip-00000002nqX-3msW
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 02:39:33 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-609fc742044so53676847b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 19:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711420768; x=1712025568; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4AgrCK3LU8fuZoVf5zgRFHwqwQjRIG9mTqB1m/TopnI=;
        b=XXCyXJWTeQ7f+A3Lohmk3O22LsMYZqbo3cem4zIWctrppWxhSsLcmbdHUfPIbdi0HE
         kpcxmIqtTPffvjjCCQ3x7J/j1a4dvtpKzx/SCAhzRwca7+2f9OdvtNn4RRRboH0KA+bP
         SVU1TAGnW/AI0xckvgCvCfJJ1rOUrSL1laMJn0dtLtig/gcVa3EysfZTZ1x+5ALYA5J2
         E5aPK9USOLtP/AjlyIyiUoemfrXM/5FrUm6Uzzb6HTnuy3oYqeJvWOqDp4rH3wy8ENBm
         ioJhazmGP0D7MoXKauIYTW+Mjg2y0zPzjprnH5adkIkDNOXckZ+nzrx0nh1TZ7KAlLv0
         /fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711420768; x=1712025568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AgrCK3LU8fuZoVf5zgRFHwqwQjRIG9mTqB1m/TopnI=;
        b=n7GqkqTqy6T5yRasqFFRvkjiO6Xz9pSzkmkWD/d3HNGv+HAnJJLRNPo7iGdHpdEly9
         Dl6UmpBtOBKJS1eCbSU08mMuzhodXmwC/shn8h9x/vqDJ0irZXCeOOkQ/Qv3yo3wqI3R
         6CtZr5jr5jyBsUdkgdHIKb7GUXpdJ9tComlYqJTyHE/VeRaSPub3aXWIFBJ7lFXqU/dv
         ippAKr1EYuDJGhToCNnKr2w/UAXQOz7iqwis9bVv1JEMwqPd5qeFmqtB9p9whKyiIzox
         YUAhVNulTfnSnMQ+GP3GXNJw/Mh4YzJ65HkU9EmkydfGxCZnK0QeDZNPeCXJ5vMvWaF5
         NQwg==
X-Gm-Message-State: AOJu0YyC3EajxINvxqg9dUGJVUlr6FTmWdyfMe3KmspmJBkvIsS3S607
	LkVfIIjZii2FF0elTdCHiFVbwdr6cmLR4Qia8CXq8QeiqUTNZvj6j/0bk5QASZE=
X-Google-Smtp-Source: AGHT+IGhOODqIBgHDvsLlXa8CZ2AvqOoTdQC6r7LnHvkeyb4qLLlvDI6hphbf8OzjNSc06qsQlPQTQ==
X-Received: by 2002:a0d:e446:0:b0:610:f43d:6f9a with SMTP id n67-20020a0de446000000b00610f43d6f9amr6625429ywe.50.1711420768139;
        Mon, 25 Mar 2024 19:39:28 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id r19-20020a028813000000b00474a1ac6434sm2497058jai.162.2024.03.25.19.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 19:39:27 -0700 (PDT)
Message-ID: <b063df9b-90b6-4f06-8be5-5a8c267e6c8d@sifive.com>
Date: Mon, 25 Mar 2024 21:39:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] riscv: nommu: use CSR_TIME* for get_cycles*
 implementation
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240325164021.3229-1-jszhang@kernel.org>
 <20240325164021.3229-3-jszhang@kernel.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240325164021.3229-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_193931_987048_77480E72 
X-CRM114-Status: GOOD (  20.27  )
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

Hi Jisheng,

On 2024-03-25 11:40 AM, Jisheng Zhang wrote:
> Per riscv privileged spec, "The time CSR is a read-only shadow of the
> memory-mapped mtime register", "On RV32I the timeh CSR is a read-only
> shadow of the upper 32 bits of the memory-mapped mtime register, while
> time shadows only the lower 32 bits of mtime." Since get_cycles() only
> reads the timer, it's fine to use CSR_TIME to implement get_cycles().

Unfortunately there are various implementations (e.g. FU740/Unmatched, probably
K210 which this code was originally used for) which do not implement the time
CSR, relying on M-mode software to emulate the CSR so S-mode software doesn't
notice. So this code is needed to support those platforms when running Linux in
M-mode.

Maybe there should be an option to assume the time CSR is/is not implemented,
like there is for misaligned access?

Regards,
Samuel

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/timex.h | 40 ----------------------------------
>  1 file changed, 40 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index a06697846e69..a3fb85d505d4 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -10,44 +10,6 @@
>  
>  typedef unsigned long cycles_t;
>  
> -#ifdef CONFIG_RISCV_M_MODE
> -
> -#include <asm/clint.h>
> -
> -#ifdef CONFIG_64BIT
> -static inline cycles_t get_cycles(void)
> -{
> -	return readq_relaxed(clint_time_val);
> -}
> -#else /* !CONFIG_64BIT */
> -static inline u32 get_cycles(void)
> -{
> -	return readl_relaxed(((u32 *)clint_time_val));
> -}
> -#define get_cycles get_cycles
> -
> -static inline u32 get_cycles_hi(void)
> -{
> -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> -}
> -#define get_cycles_hi get_cycles_hi
> -#endif /* CONFIG_64BIT */
> -
> -/*
> - * Much like MIPS, we may not have a viable counter to use at an early point
> - * in the boot process. Unfortunately we don't have a fallback, so instead
> - * we just return 0.
> - */
> -static inline unsigned long random_get_entropy(void)
> -{
> -	if (unlikely(clint_time_val == NULL))
> -		return random_get_entropy_fallback();
> -	return get_cycles();
> -}
> -#define random_get_entropy()	random_get_entropy()
> -
> -#else /* CONFIG_RISCV_M_MODE */
> -
>  static inline cycles_t get_cycles(void)
>  {
>  	return csr_read(CSR_TIME);
> @@ -60,8 +22,6 @@ static inline u32 get_cycles_hi(void)
>  }
>  #define get_cycles_hi get_cycles_hi
>  
> -#endif /* !CONFIG_RISCV_M_MODE */
> -
>  #ifdef CONFIG_64BIT
>  static inline u64 get_cycles64(void)
>  {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
