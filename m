Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EA0C27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jun 2024 19:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOY/mlWqm8uWeN0sooTtMFRyS6U/xNuQ4D4IQq0iftk=; b=lnw966pCSdVpu9
	0OA2HXKQ1M9TTNkGXh3NhupfETqL+xhqYtVqRgO+K4N7AmRyENL5sRBRqcxf7Ek0QUwDV537WqLBK
	fRxQ+Mazxpj5C8OmMbDln3caA5e+eHnoJkg0ZUY358lUhS3R02qcEdaOdn+gZQTVrXGuKF6iMkY66
	ueKm4gb3PInqv150j4Zljfn5kmcAi53jL0VZyyomoJ/NhorKrtHCUpPDJR/XkUxFW0skKe30LNsLA
	uUfFjKwGaqF2C5zeAr62HIDANxSZgvpaMpISTPJWL9EI/ygSg3kbJJeTqTQboF4jhAg1dAPCgkp72
	SCI3LDx39Qkuc9g8J9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNdcR-0000000Gqee-2w6H;
	Sat, 29 Jun 2024 19:20:19 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNdcO-0000000Gqdq-2nOF
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jun 2024 19:20:18 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52cdf2c7454so3219936e87.1
        for <linux-riscv@lists.infradead.org>; Sat, 29 Jun 2024 12:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719688813; x=1720293613; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=115ZNpFqbD4D/Gv906cLAl5QOwsv87o++hj04Lr8r4Y=;
        b=Gg0ai8phW1TFa8wMW0M37xa74+oUfwQIEL4JKZrEMM38lRZHArHS0mrqpgA9ShA9fh
         zHb/fnTREAlnitVaFHUpq7Jtt4zn+hLRW08jCk8yBY5SyPDOXuWb9sZeO4wtIXQorrqz
         cBi9l24aISx9g+sfyBYUz0wivCvxJO7tTV3kAkYGzTcQM6zpUcw3LHGR0YmXYExcGmmg
         pZp5hboIurUv4aWneqXQdHVZlAw1DIV2S/Hevn7m7qk/5PTaKgPpTsTklLyG32Fxy3KC
         2ERGpNpzJPkGROuyz+1uSp564c3NZ/UdrewzyCYFK2R95oaX0aRYw+SX0aJo+r64E4A4
         xFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719688813; x=1720293613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=115ZNpFqbD4D/Gv906cLAl5QOwsv87o++hj04Lr8r4Y=;
        b=BnaMPCJVbs79RP8/2Y7bF+InwOz9wR63H77IJFFbZRQsVP9io63RaRRG720lVh9qi4
         ZFeXKmcKnUqeszDhENEgXkXwrvjtbdnav+LEC5bbyP7Y9Plg1cM6z5GBpGaBZHN1DRFF
         JYc2QmfP+dH+wfPDBt526uRg7nt9p0Z4+Cm8cy7SdZ7DlM2tLPT11L2V63/lDF6Ani/C
         2Hdh65ho2oLTMS8uVQ6pIlZg2vb+C/YMzQP1W0+BR1G28Sa6imGy1Hud4AsiZJHwITNm
         GpeAiXasctYbgQC8cygEZseuaXb5SvHAMmy7AyGfyEqaPiNDc7pLIDCe1ZV5XpmbHnQL
         WNgg==
X-Forwarded-Encrypted: i=1; AJvYcCWnt7KuW0YG9Tz+L02xhzslT1oEx9wpIcoYXEC5hO+Pph5PXmRavLT7gwvSaVRBVjViNjE6zZ0mQlobfBCEASNilwuR7lgTY+cJs4SSES2f
X-Gm-Message-State: AOJu0YzfmroDvqJAv/uI97ZnrwghJuhaTb4St0OWmAixAOBe0EP6o/VP
	Exhedg76A8rTUvGpSWY8ZCP1XO2yJpzBFqixPdzelO80PTpzvdjv
X-Google-Smtp-Source: AGHT+IHJmrqKd+ZUfaM7arqCzy8Vv8yoDvxco3EeRFo3mfQJCEF1GHI4mFixe6ydIK4oX9Pq6c0aJg==
X-Received: by 2002:a05:6512:2345:b0:52c:76ac:329b with SMTP id 2adb3069b0e04-52e82687e21mr1665502e87.35.1719688812427;
        Sat, 29 Jun 2024 12:20:12 -0700 (PDT)
Received: from andrea (host-79-49-165-53.retail.telecomitalia.it. [79.49.165.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf18933sm187310666b.13.2024.06.29.12.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 12:20:11 -0700 (PDT)
Date: Sat, 29 Jun 2024 21:19:41 +0200
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
Subject: Re: [PATCH v2 03/10] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <ZoBeTTdMYdXU8gxD@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-4-alexghiti@rivosinc.com>
 <Zn1StcN3H0r/eHjh@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zn1StcN3H0r/eHjh@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_122016_752350_AED76294 
X-CRM114-Status: GOOD (  13.56  )
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

> I admit that I found this all quite difficult to read; IIUC, this is
> missing an IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) check.  How about adding
> such a check under the zabha: label (replacing/in place of the second
> IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) check) and moving the corresponding
> asm goto statement there, perhaps as follows? (on top of this patch)

[...]

> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index b9a3fdcec919..3c913afec150 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -110,15 +110,12 @@
>  	__label__ no_zacas, zabha, end;					\
>  									\
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
> -		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
> -				     RISCV_ISA_EXT_ZACAS, 1)		\
> -			 : : : : no_zacas);				\
>  		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
>  				     RISCV_ISA_EXT_ZABHA, 1)		\
>  			 : : : : zabha);				\
>  	}								\
>  									\
> -no_zacas:;								\
> +no_zacas:								\
>  	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
>  	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
>  	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
> @@ -148,16 +145,20 @@ no_zacas:;								\
>  	goto end;							\
>  									\
>  zabha:									\
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
> -		__asm__ __volatile__ (					\
> -			prepend						\
> -			"	amocas" cas_sfx " %0, %z2, %1\n"	\
> -			append						\
> -			: "+&r" (r), "+A" (*(p))			\
> -			: "rJ" (n)					\
> -			: "memory");					\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZAZAS)) {			\
> +		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
> +				     RISCV_ISA_EXT_ZACAS, 1)		\
> +			 : : : : no_zacas);				\
>  	}								\
> -end:;									\
> +									\
> +	__asm__ __volatile__ (						\
> +		prepend							\
> +		"	amocas" cas_sfx " %0, %z2, %1\n"		\
> +		append							\
> +		: "+&r" (r), "+A" (*(p))				\
> +		: "rJ" (n)						\
> +		: "memory");						\
> +end:									\
>  })
>  
>  #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\

Unfortunately, this diff won't work e.g. when ZABHA is supported and
detected at boot while ZACAS is not supported; more thinking required...

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
