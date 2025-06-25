Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD573C7EE30
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9J2/HGX7WRKm80pK0tRu6/UQkEuRlaU6p9NIgPd1b4=; b=O+C/E8Yy1S9iYr
	L2xINkOBf7czxo1OBPmlUbtOnOFBcWoBcFhxAb6R0/ShL05qCeiDIEcezPF3CnpjaoZVNm0Br0rFr
	qY3nFH60Pr1fDZErUIoVamJv2R88ucsx7tsoUM0rqi52VZ9mlcbSh97ruyoTOAbRZIISJSZmAI2nc
	7HG6qZM8VgKeLmiKMoQ2cGUNSP0DG0x7mVje72TsGsEaifLXkOkznkizX+0yqmPKvWxiKiz70HT3q
	t2+fnC23/X17HzOA4W6ZnAsVnSRLsANTeK9dNZOxMsLbUb3gg7ER4BlRtSWmUKi8l0ySxhqQpBvJK
	Ux4Po/d8UFGWbkuwfjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUsY-00000009ajo-2k7X;
	Wed, 25 Jun 2025 18:29:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSaI-00000009DEu-48j0
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 16:02:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4537deebb01so12624225e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750867369; x=1751472169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cINHqIFzOlIyPqhGj+q+rLlY+QbAuzwrgIP8a6FcGlk=;
        b=Q/fspb6Qz6JoVjaW+erePG2kaT8AV/V0NvjiB9nR8SU5nflFia2H2mjsVyEOoBeH3t
         usOGQIHmNeHqXQrfBgPDg95FSJhExboENiH6UQBt5/xbN0Vsud82JhVOYf+aOC/c8Fdf
         HcwaWgPf/R+Ke0IbU7Ag9R+HqwESYP/UcKYWB2tm5NxLnZUfMGkru89LMbtxjKR7jm7e
         qMYTNKYvxakrCssTV2r7v0B3Fe/EtzI8AAKeg0mxJypzbTgvGUg4V1kAKR/sM/4ubrX9
         SlAlASmbezKKYGe20fFEotMTCITgKFNCBfTUsKoeUvYSGKsJp1Xoi9E2lYBmimgrprNQ
         Comw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867369; x=1751472169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cINHqIFzOlIyPqhGj+q+rLlY+QbAuzwrgIP8a6FcGlk=;
        b=evkHAmyC/5gIm6arazGY+YDcwR0WIM7GB+5K4qHwBDGzC5i2sKYhfdgrNMapfTIXOi
         +SIXV3wT7aD72nGTDim9SpuOTXsCeOZ46pFHY06NUGlzlVw2oi6D8EmT/vBKkKFG4Z3p
         AA1cLDoPwTi+lkinGEuDI03e5TpKMBRevz8okz3cXH4ruV8abPLKfsodPFy2Cb30hLlh
         tXfF8VDdd4oHR4EMgUV8THG+sBuPR1LfeTTKB3mLfH4L82+rSuHlmCakeNbde/rrl0lx
         Qg7nWbNlz9jSwXJvhL3si1oLJb5SQcfcjrRxTC0ovoQtSHXtn9jcvpJxeqbwnZeBX5sn
         v12g==
X-Forwarded-Encrypted: i=1; AJvYcCVSDANhfmaY4RqRUudFz66sG4WljaxGat0CcKumDvBtWDcTVw+pkjPBLDHU8CLpxFQC62HIole5B7LZgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzftF/IybWvDDm0MwtAHyv6T6mOdbLLmPNW1jGmAepwMzaDQiJk
	r/8mm5er+J16WOmAjRsRaQ71JTRAqn1JlbfDsta3esAP2wFkFwtYdNxG
X-Gm-Gg: ASbGncuGHbBqh8MuykvWKZzihyQkr7AC8IVbXAumIX23MNFk8LG0Z/vHE7lt7ygQzSy
	ZCPk514E2ax27fA/YOsgMVNEoRHzGfCtWGoKCc0O9G23/MEngHg9idvi5u9fs/R3WfSBAH4qDoT
	dpD76Aum2dOHZAp2UojdjKtXwVlkoxx3K1HPfWK/B84QkbqOSxjO7uLnn4b8YXjWnqRZLZTvCvR
	qfYnLkcZy0EcaITx3Ef4S0/9W+83/dciSN7FhwNX409+Vyy0eGFzkCvjB7eNRoE3Tw42qoJWg3V
	F4HcUm0d6qYYQoRLCJGG3GLG91QF4RLSP+OYrugic2T1+JNktmqsFfHa9pgAdwA/HmUfy5IJgIp
	+ZQMIDmK1pYAOyIrDUhTup9u2
X-Google-Smtp-Source: AGHT+IEMB/YbssMtZ1NrMoQOmyfN0LtNB/8HKXUiqEQNnI7tYcd1rYZA65i7s1VULz2iDuXb5Pc0CQ==
X-Received: by 2002:a05:600c:5305:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-45381ae787fmr35533775e9.6.1750867368666;
        Wed, 25 Jun 2025 09:02:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm24091875e9.5.2025.06.25.09.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:02:48 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:02:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: cp0613@linux.alibaba.com, linux@rasmusvillemoes.dk, arnd@arndb.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb
 extension
Message-ID: <20250625170234.29605eed@pumpkin>
In-Reply-To: <aFWKX4rpuNCDBP67@yury>
References: <20250620111610.52750-1-cp0613@linux.alibaba.com>
	<20250620111610.52750-3-cp0613@linux.alibaba.com>
	<aFWKX4rpuNCDBP67@yury>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_090251_032641_43884D9C 
X-CRM114-Status: GOOD (  19.31  )
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

On Fri, 20 Jun 2025 12:20:47 -0400
Yury Norov <yury.norov@gmail.com> wrote:

> On Fri, Jun 20, 2025 at 07:16:10PM +0800, cp0613@linux.alibaba.com wrote:
> > From: Chen Pei <cp0613@linux.alibaba.com>
> > 
> > The RISC-V Zbb extension[1] defines bitwise rotation instructions,
> > which can be used to implement rotate related functions.
> > 
> > [1] https://github.com/riscv/riscv-bitmanip/
> > 
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> > ---
> >  arch/riscv/include/asm/bitops.h | 172 ++++++++++++++++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> > index d59310f74c2b..be247ef9e686 100644
> > --- a/arch/riscv/include/asm/bitops.h
> > +++ b/arch/riscv/include/asm/bitops.h
> > @@ -20,17 +20,20 @@
> >  #include <asm-generic/bitops/__fls.h>
> >  #include <asm-generic/bitops/ffs.h>
> >  #include <asm-generic/bitops/fls.h>
> > +#include <asm-generic/bitops/rotate.h>
> >  
> >  #else
> >  #define __HAVE_ARCH___FFS
> >  #define __HAVE_ARCH___FLS
> >  #define __HAVE_ARCH_FFS
> >  #define __HAVE_ARCH_FLS
> > +#define __HAVE_ARCH_ROTATE
> >  
> >  #include <asm-generic/bitops/__ffs.h>
> >  #include <asm-generic/bitops/__fls.h>
> >  #include <asm-generic/bitops/ffs.h>
> >  #include <asm-generic/bitops/fls.h>
> > +#include <asm-generic/bitops/rotate.h>
> >  
> >  #include <asm/alternative-macros.h>
> >  #include <asm/hwcap.h>
> > @@ -175,6 +178,175 @@ static __always_inline int variable_fls(unsigned int x)
> >  	 variable_fls(x_);					\
> >  })  
> 
> ...
> 
> > +static inline u8 variable_ror8(u8 word, unsigned int shift)
> > +{
> > +	u32 word32 = ((u32)word << 24) | ((u32)word << 16) | ((u32)word << 8) | word;  
> 
> Can you add a comment about what is happening here? Are you sure it's
> optimized out in case of the 'legacy' alternative?

Is it even a gain in the zbb case?
The "rorw" is only ever going to help full word rotates.
Here you might as well do ((word << 8 | word) >> shift).

For "rol8" you'd need ((word << 24 | word) 'rol' shift).
I still bet the generic code is faster (but see below).

Same for 16bit rotates.

Actually the generic version is (probably) horrid for everything except x86.
See https://www.godbolt.org/z/xTxYj57To

unsigned char rol(unsigned char v, unsigned int shift)
{
    return (v << 8 | v) << shift >> 8;
}

unsigned char ror(unsigned char v, unsigned int shift)
{
    return (v << 8 | v) >> shift;
}

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
