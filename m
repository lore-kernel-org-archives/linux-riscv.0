Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D15E77184
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6xUDET4Zq1+yLgIO0cGokR0VwgQGemrqWSsFNALKcU=; b=bODOUfK12i1XIJ
	xNuE36q9w2oSJuzKBCtMZuTPJ4ASCeGIkIYsWRwaAR9q87A4rEcvU0AS8WS6dGNJPwAsXNL2YIjx0
	JCFCuEv4/A8SvHu5jOUEFnJljl7hJANoQ0i7NgXqZufGAT58GkS57oGiLH4QA0NuMRIC6gBOhmVRx
	fmdd+AJJnEjqyKw4FM7xSI4UARM7UigEXSXq7BDLfVK8144oI53f4HGs37AyXHudt1YUoEycpqUUx
	vJC17Sd2f9va0l6ZLQyBQily4fJphjrj4npzb0mLvDZF+aYz5ocwf4DJKp84wHPT3yjXHTNGVOQ3f
	aPyqsW3xz7HeSIrxjoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXEs-0000000DUdv-2xVz;
	Tue, 17 Dec 2024 13:03:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXEq-0000000DUau-15ai
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 13:03:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3451438f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2024 05:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734440627; x=1735045427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAzrzlkr4RB37/qzrBgJi3C0ocxC7xm6ioWJHZHQAZY=;
        b=nQtFBKrj6XZsyU5ibTZXkJRcv+V+M8p94vEa/EzZMR4R/OzcDm+eVNo/5vYzOnt/A3
         o8V5jKyh1kP7tVwLvPORQZiHgYiZv7Qq0UkrvbXNZTF8JsEDQ3jLTzeXZxd3iGbdoG16
         XWTBA5P9Rip5Bo0qKmKlyotzTs8BGamFHXO8WIENhttI9otQsgLn6rtLHRLdfJc/lUty
         Xb+HT5gakisRr2LJXcxSEL7GPd4vpVI2JRWiZjxO3PyAp2HyvaBT+EeqHNGNpmvzOXAu
         opJwhwa50/LzMDD1UPuwH4QFJN+98O7tFjQvS6iUdrzIrdER1xjVCs1qCqhbUWls/MFe
         bX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440627; x=1735045427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAzrzlkr4RB37/qzrBgJi3C0ocxC7xm6ioWJHZHQAZY=;
        b=TWQMac29UpjyKngumg87M39IRUeEjuBdtiedMtpqMSCV1jm+FrAxcyf1bt4L7q45L7
         CdKh2HwK4ME9yITihFVa7N5DMU26wWqQTzrtBaMDLBZpv3gpMzyZ9zkFewBxHSn8HIGn
         UJm69bh/Dz/8FivU9w+0EuNTHLlD8uzoPl8m6CSjMPZqiXI84yFMvDOsjWQirILnTpBp
         EsRKTh6ujgVfR/GcdAagOsb/G+90iTSKexaGjLZVb4Fs1U3OzZKXx4G00DhXg888aRpF
         Ijk2PTIN+kkan43EUO+gUBC19/LCi+/xH8ohpMC/DQGxrqf2QHpDWM91Ueq6a4BJuizi
         ke+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHjDB+3jPm5t5HaQK28nnFWS25a++WsTgtvP+U+99d5x1hhq3m4BQyrpkebWSvfPq/LUWawI+yJYzxVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkNJmxuOBm6/RxAhnNhX1kaXPvfaRljJLEJqy40FwzzgmT/Ekl
	ZDcSyrJUAjRcpPeqXMEhGJW6RR8N2HRuMIqHn/PCn9ULX+u96fa3DRoOeLjpOCI=
X-Gm-Gg: ASbGncuP0HMrwQZehgP1Lubw4RRH9PfOD5Xsy/biYdivJ85qKQRmtMAkw2zSa0GbG5M
	NUkHhL0Nn9K9yxeXgc1GZVxYLuPboDaguGBTBE9sEVU7/mEEvdb3hzI+bHpe1vjF+r4GnDgrvj1
	nCU7mQ4XNdo+KQrIYKDl0i4gkRdoNRTBgFJaRtr0Lj6YqmN9ILi9/4E7JDosyI8rnKTBhjQu86u
	/4kxBA6kXHk5DHZlvsTCpGXFrLR7JC+3bTHgKw9dSjHaq1KesbF9B7rxUVriG0/otY5fhxJM7mv
	sE+NaMtmLS7z4l3ps5OteoU8UF3z2BiaUcjkLTa/LQ==
X-Google-Smtp-Source: AGHT+IEKS6vZ3lyCphldOOnSEThLUJVSEi8gV34bIF+zP4H4VepebemaK38GszXC3GUeu3p2D/6jgw==
X-Received: by 2002:a05:6000:1848:b0:385:e30a:394e with SMTP id ffacd0b85a97d-38880ac2114mr14939098f8f.3.1734440626301;
        Tue, 17 Dec 2024 05:03:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8060679sm10987341f8f.105.2024.12.17.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 05:03:45 -0800 (PST)
Date: Tue, 17 Dec 2024 14:03:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com, 
	conor@kernel.org, leobras@redhat.com, alexghiti@rivosinc.com, 
	christoph.muellner@vrull.eu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	parri.andrea@gmail.com, ericchancf@google.com, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2] riscv: Implement smp_cond_load8/16() with Zawrs
Message-ID: <20241217-aba8759654f30826104e5da0@orel>
References: <20241217013910.1039923-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217013910.1039923-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_050348_299897_0E5CCA2C 
X-CRM114-Status: GOOD (  17.78  )
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

On Mon, Dec 16, 2024 at 08:39:10PM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> RISC-V code uses the queued spinlock implementation, which calls
> the macros smp_cond_load_acquire for one byte. So, complement the
> implementation of byte and halfword versions.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Andrew Jones <ajones@ventanamicro.com>
> ---
> Changes in V2:
>  - Fixup mask typo (0xf -> 0xff, 0xff -> 0xffff) by Andrew.
> ---
>  arch/riscv/include/asm/cmpxchg.h | 38 +++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..aa4410beb065 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -365,16 +365,48 @@ static __always_inline void __cmpwait(volatile void *ptr,
>  {
>  	unsigned long tmp;
>  
> +	u32 *__ptr32b;
> +	ulong __s, __val, __mask;
> +
>  	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop",
>  			     0, RISCV_ISA_EXT_ZAWRS, 1)
>  		 : : : : no_zawrs);
>  
>  	switch (size) {
>  	case 1:
> -		fallthrough;
> +		__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
> +		__s = ((ulong)(ptr) & 0x3) * BITS_PER_BYTE;
> +		__val = val << __s;
> +		__mask = 0xff << __s;
> +
> +		asm volatile(
> +		"	lr.w	%0, %1\n"
> +		"	and	%0, %0, %3\n"
> +		"	xor	%0, %0, %2\n"
> +		"	bnez	%0, 1f\n"
> +			ZAWRS_WRS_NTO "\n"
> +		"1:"
> +		: "=&r" (tmp), "+A" (*(__ptr32b))
> +		: "r" (__val), "r" (__mask)
> +		: "memory");
> +		break;
>  	case 2:
> -		/* RISC-V doesn't have lr instructions on byte and half-word. */
> -		goto no_zawrs;
> +		__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
> +		__s = ((ulong)(ptr) & 0x2) * BITS_PER_BYTE;
> +		__val = val << __s;
> +		__mask = 0xffff << __s;
> +
> +		asm volatile(
> +		"	lr.w	%0, %1\n"
> +		"	and	%0, %0, %3\n"
> +		"	xor	%0, %0, %2\n"
> +		"	bnez	%0, 1f\n"
> +			ZAWRS_WRS_NTO "\n"
> +		"1:"
> +		: "=&r" (tmp), "+A" (*(__ptr32b))
> +		: "r" (__val), "r" (__mask)
> +		: "memory");
> +		break;
>  	case 4:
>  		asm volatile(
>  		"	lr.w	%0, %1\n"
> -- 
> 2.40.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
