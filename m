Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8122EC3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVfQWI7BHX5GScX0NL7ENH5GRfkOuasFOUHaPp1BKKo=; b=nTUjWWOwtrQcQT
	qguq1jOD9GC86zmqYbDz1lJMONkalZktgM3R5UUU8HVeWey/hZY6HeKKQEpM8ny2HFpbuwOdzkQzl
	3XTuxWBnjvXqd/JcNorYs0k/N3vV17xcb9WSh7N8urKRoCf/YPS5tIcgmma6XDPBqS3P1lhbT+VK5
	OMFJ8m1JZcvrtik5tt2FwjjUv0BYQ9cNQq1obGXCMkZKF44n6xR8wjkVB5pmNfBK76eEoR+DnW4ZU
	n61NlzC9PiJWIi1/k9mnbkefVUAaxceWDB5kqdhryrPu8Br8cl2bahlYE/xIIOCf68ZMQ7zm5w1+O
	0K1CuK8pcwAFqZV4mZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmye-0000000A5lZ-1d8y;
	Thu, 27 Jun 2024 11:07:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmy3-0000000A5OC-1WKx
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 11:07:15 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-57d1d614049so1696142a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 04:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719486410; x=1720091210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZobcV7LUgT3AtmVz+YLZMFY8b9IQxrzUyiNj5oBAUM=;
        b=CYwSJnsytfJ+31Yc01tVX9euqrtmzyaVlOwrJzxOFNtgmKmmDth/1w+MmOCyG/RKos
         xZF2vbqhOeLmqnX0Ws7Nst75E4Fp+Mqd5m5Imajmfgw+mSLTITbY7n2X4Heru9g3OrKI
         CmeJsruefcepEVs1pbIb1xO2KNa3nksQlNmP1ANVwPzODn8qsBrYYr/SG9xMzCbigfM2
         ly+2cLWweTD481cTwxytXPTI6UWRd/kDwFmNRtuc8Yzw4YQsNtm2clin+iWiChX49Jq3
         Aa+MKLK6OeB+OLDMhZEM4x+0eeOxHqgnJz/6Lo+EfldgVN+3jdyMSn5GlgfIrhPCSkjc
         kVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486410; x=1720091210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZobcV7LUgT3AtmVz+YLZMFY8b9IQxrzUyiNj5oBAUM=;
        b=gA/e0ZWlLg+ni/KP9CyrDfq0iGXrf7o+KNqCfnPd0FxzrNy5E0DR+NQudKaig7TTOW
         ozcXSG6TTWwit15B3vSCCMYmZl4/PF7RCQdpnITCyDpoOFmzTGTSwFd3SwYvPga4N9Zu
         qTQkLRhEsLMOl/mZDa9Iv/PvWUHowb29keiUczsoKBFEhegtzwmRhzgwgwOQ49wTy8Gi
         DEiaxCOm17bbffbqDcLexWg++hGdpQh2mJZa/oKsd4i2dVa6EDYdHHTBnBe34FyLriX9
         KFYHS6SFLSQbqVFP7fAS4JI3lgtuSYhKIIH+KX+onndcXRA2PgyPTCT+852wywyiLQYq
         FmiA==
X-Forwarded-Encrypted: i=1; AJvYcCVSeRc/0nE+BHOd2eQfaoQErgWYK+QCSBaP7+YEGClA/z0N2vNz8A/CywX4YS8ZPMegWQOzjoGBHDVRmy6zeHlaHNz5m/b7xy6PEnGXRbgt
X-Gm-Message-State: AOJu0YwzVSCaCIlTxxLmJSmAu4NZNFGAQ84+J9OWtRUQGTAK3+Z0XxWm
	9DZIh1voxsRbtHg54xrbIeO2qcdj4OB0BasO0AaqFgoWIQj2eHeJ
X-Google-Smtp-Source: AGHT+IF9IGb+EAqcYH0xHZ8HF47kVV4+X97fRL+JfZxNkC2UpJv60e/BcSk/SP3WOORT9Eilh3uoUQ==
X-Received: by 2002:a50:c081:0:b0:57d:519:ba3c with SMTP id 4fb4d7f45d1cf-57d7004c60emr7710603a12.24.1719486409637;
        Thu, 27 Jun 2024 04:06:49 -0700 (PDT)
Received: from andrea ([217.201.220.159])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d1280e71sm718305a12.37.2024.06.27.04.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:06:49 -0700 (PDT)
Date: Thu, 27 Jun 2024 13:06:42 +0200
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
Subject: Re: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <Zn1Hwpcamaz1YaEM@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626130347.520750-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_040708_416493_23F4998B 
X-CRM114-Status: GOOD (  11.15  )
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

> -#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
> +#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
>  ({									\
> +	__label__ zacas, end;						\
>  	register unsigned int __rc;					\
>  									\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
> +		asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,		\
> +				     RISCV_ISA_EXT_ZACAS, 1)		\
> +			 : : : : zacas);				\
> +	}								\
> +									\
>  	__asm__ __volatile__ (						\
>  		prepend							\
>  		"0:	lr" lr_sfx " %0, %2\n"				\
>  		"	bne  %0, %z3, 1f\n"				\
> -		"	sc" sc_sfx " %1, %z4, %2\n"			\
> +		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
>  		"	bnez %1, 0b\n"					\
>  		append							\
>  		"1:\n"							\
>  		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
>  		: "rJ" (co o), "rJ" (n)					\
>  		: "memory");						\
> +	goto end;							\
> +									\
> +zacas:									\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
> +		__asm__ __volatile__ (					\
> +			prepend						\
> +			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
> +			append						\
> +			: "+&r" (r), "+A" (*(p))			\
> +			: "rJ" (n)					\
> +			: "memory");					\
> +	}								\

Is this second IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) check actually needed?
(just wondering - no real objection)


> +end:;									\

Why the semicolon?


>  })
>  
>  #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
> @@ -156,7 +177,7 @@
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(*(__ptr)) __old = (old);				\
>  	__typeof__(*(__ptr)) __new = (new);				\
> -	__typeof__(*(__ptr)) __ret;					\
> +	__typeof__(*(__ptr)) __ret = (old);				\

This is because the compiler doesn't realize __ret is actually
initialized, right?  IAC, seems a bit unexpected to initialize
with (old) (which indicates SUCCESS of the CMPXCHG operation);
how about using (new) for the initialization of __ret instead?
would (new) still work for you?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
