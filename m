Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8F9C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPOarwu5W/lsOErX629FQVKY+kNtW1lutkotYWjRqSc=; b=dMYinU1ksYlF6/
	KzWBlzb9Ou5m963BdNkiAHLZkJffkTfAvqqj4uzGNETNTxwyMAETNtzTGcTjyMdQIIGHAdNZlIcou
	7Rj+/YjNKxjUuGWGMfgbJ9CCs5TbFJzbYfxbC3nVFwaSSMhIE7PZmVScgOA0dMMHgKkbMWIvsNtRF
	26Iyo6j/Y5KltOdkR4Wh1m+mQ6GdCBLWvvWtBFMLv1Zn5JTowsn3dMY6AUsvNPdASzDMHtIqFNeZc
	0fyM8Pp/XrBFIb9hrCqGB1oBdi2zrnaQ6jLUcrPdXtqlFMF5vM1PxY9PbgDPE0wfhEhgMEhe1VBCi
	NJOXI6+PeQWNVFRdnV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC1NI-00000001eYa-2r4s;
	Tue, 28 May 2024 18:16:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC1NG-00000001eXz-1VhU
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 18:16:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a626919d19dso14993466b.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716920197; x=1717524997; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R++hvr7nzebtIxTs2CU6HsOf5klg6lcgJyuQ+SjZMnE=;
        b=EmlNkkGtcrXCblgbFSpCjOVZZAvPlWX7YpIYQ8ACnYWlxrquv2E+SSSm4sCbrqrxym
         8C75znklQD4h4TOSw89NiEVRnjvnCnYe9T9KJAET112JK8oQL34dL3ybxsWlfxbeKs0f
         XANlRKLp9DMO72tjQnqZbxkpm0e6k7xl73ZHzLDX118FD7qwpe2WGuvjAqN09ISy61qi
         1fwhApdj0aCMS7LtbUqBYdzUiZEav4JoaVr9lAqMPrkk/p8HJ07tfz0fov+6pWhhebQS
         TGe1OVO3uPCvdvdic4Y8a7F9M6m0Zf4uHHrQHgJjELT+lznP2MZGODK1DVPFvDZx/GeH
         sexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716920197; x=1717524997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R++hvr7nzebtIxTs2CU6HsOf5klg6lcgJyuQ+SjZMnE=;
        b=O89TAJglJwzoCMsIn111oaIBaVUrg1t9gFUSwz9Oes+2pA7u6kqKZXYU1hwfol2lab
         XdEvKHpJCdMEOQeWaNnx8pBVzy0rKd3ghRFEp1dmGU0a0BluyjtqJzq9JAHY9Sf1yV/s
         sX+4XYD6IhU5c3bqNfuWgBokTtZ7j5KpFC4PV0l/w49NxS82WVJo9x/dhdjkk7fd3YNa
         w96GXvvVjl1TQ5Kgirs3oUD8VBtLCrOdXRWZ8hh7syboMJeQ4BtYpuwdMwyfLnPMvqMA
         oN/nx9BfTwFxAw2p2qoWTVpJ8M5VIVMSX8WmjD/MTLDex0iqMm/dHUbIRhOQ5f53sJAU
         OBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2cYWrIJX3SoOqlfET1jXh/Ji6vdkJjb+uiKgdg8MV1fDTZe4aeXInNlAMcXyK5mpPG/nwaGxGKXH3ClZf/2hX8sBiHHykeppAQyuvbLkn
X-Gm-Message-State: AOJu0YwY1fa3J7+QcyVbSAh3S8koKy3ZbfgGrIw4XjrEEW5gRtIWrn46
	EF3T6K+kXKzjFvPFBIQ8JTGcNS20lifmvSidE4pkS+rFUrRTAUOi
X-Google-Smtp-Source: AGHT+IHHlxn9HQL0alkg34k8cLrkz+dMOEar28FIIBD1BfkeQ51ARQuTKg6QUl77or34Ks1j6M/LsA==
X-Received: by 2002:a17:906:d799:b0:a62:196e:ef45 with SMTP id a640c23a62f3a-a623e8f6f57mr1424154366b.19.1716920196587;
        Tue, 28 May 2024 11:16:36 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a62c501e85dsm394788766b.117.2024.05.28.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 11:16:36 -0700 (PDT)
Date: Tue, 28 May 2024 20:16:31 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 1/7] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <ZlYff9x12FICHoP0@andrea>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528151052.313031-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_111638_430357_084D4C68 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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

> +	asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,			\
> +			     RISCV_ISA_EXT_ZACAS, 1)			\
> +			: : : : zacas);					\
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
> +	__asm__ __volatile__ (						\
> +		prepend							\
> +		"	amocas" sc_cas_sfx " %0, %z2, %1\n"		\
> +		append							\
> +		: "+&r" (r), "+A" (*(p))				\
> +		: "rJ" (n)						\
> +		: "memory");						\

With this, a cmpxchg32() will result in something like

  amocas.w.rl     a5,a4,(s1)
  fence           rw,rw

(cf. my remarks in patch #4); this will/should provide enough sync,
but you might want to try the alternative and currently more common
mapping for "fully-ordered AMO sequences", aka

  amocas.w.aqrl   a5,a4,(s1)

Similarly for cmpxchg64 and other sizes.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
