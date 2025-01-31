Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7877EC0218D
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qun4RujSOvH4Y5xIkLpMLp01TI5j3oT3FP7ZATtlvtk=; b=dfzXxuSSkOkUm3
	u/QXGsR+tnjdJT7/eYT//wcw7304vCzBK5di3zNcH5wd3a6wDwQKsEiwF6CtG+vh3FqolRjNc2L3h
	3Q70Qz5C8kjCRq8nLe7TLiFWY+waEaEyHNiV/MAP/V1/p9LURHNp+0IFUuesnGQNjsy/DPMWby76X
	dXQHoDp/jU9n8DRhlxUq//CxcMw05l85uKMiqBRPLSrVQozomPt2U4XI2UWoBTMgutFYEvyChvvOr
	JUFPFzO85QFEBA6q8cAQ3tn8ltXyp+WP8SnzpZndWEmtF3trgh9IIqSNMmcUL3eYCA4A5yPUxqNRo
	OSzlgIPJKB6uc4Dl9rZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdkuv-0000000A4dW-1f2H;
	Fri, 31 Jan 2025 06:54:17 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdkus-0000000A4d3-3ged
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 06:54:16 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so2774392a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 22:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738306454; x=1738911254; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjk/Bm1nilxEN/HqMvYtrvEtTOGs2l5rMV27l42M1Jg=;
        b=LnFRQj64C00NKyb4T6e5UrQ22tClPi4KKaKLexlWDXbufKmlAIbjkej1Q93w96rLLu
         8ixzqJyspc6w5A8+foCJs+eEOuStrGmDj7FKYhbzOUZNr8LZbvT72A4itBzRJtJgCnHK
         MeRBQyVGYRq+Y2PuGqV5REkS+NxVG8CNl1r2zQEVePunDtWmOw7mG1pclDmKax7eN2gP
         m3MgUHGZHNxOm9o7TH6VHKy3dkg8GoeK+pBDXDe5wMxGEZLnC73ZcHV607cIwKS8CTsw
         kda1I5LDOE8l0ALG0B26mxje+uqyy9Og6L4QmBrfjDP8+MRnIKxWDCT7aIAuOZX/lHwV
         i0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738306454; x=1738911254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjk/Bm1nilxEN/HqMvYtrvEtTOGs2l5rMV27l42M1Jg=;
        b=gYM+lRlk3wtWLSQXkgmQ0QufYRYOUUqMl+U8aYw1IHUqzGIkcZ+5l/mKmZdf2Ajoea
         QSoaYCB0RzO7nSCQsKPc+kUFfIwpPb8a5dLkcegntw1TAbRio5kD22ba1TmBLLxBePjs
         kzjCVtoR6tCPi7MDd/HR8B0AVpVwRJm40XmfQy45AHZ6ajWucG41/ACzB+wAXLclqEB3
         CVoDF08hBpzNOp3md3N6ZIH91O77fUTRfrQOZQJ4Iqj1G9DH3n+5U99iFrwzhrhrTAXW
         wpkRh01M9qq3NfRL8QKvD+RMTxZrAAmZWJSoCONy6bbzzWvru+dbFz1Dp0ycht9xe9iu
         Rzdw==
X-Forwarded-Encrypted: i=1; AJvYcCXaYyIHdw+qQiYrAilu/PqFTAEfFnmpems7OTlGtsGn7vNc65adsyijOQmC2oYYk4aScnLp5bzkQrCF9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZtBxRYM943KUCD9a7kvHd6dmfv7nGap6c1dBBWM4Fb5SeaXvC
	fWaBxBCEbL9ldBjeG3hceLY1b32v5rT6S56LPfnEenxmUqagzFlg8JxRaEqAWWk=
X-Gm-Gg: ASbGncuPyTxDz53kxS79owHpGBPMZog7kf0xuXSJF4GFJNIVjbxSInaMPcAsTkfuWex
	rH2aLai6Vq9vdgPYCv0aSrbyN3w7FLYQWRyM18ByHvpkValSoEn1yuUJ+/0y6YGWL+saF4TJ9is
	mN4b+9N2eA/uBhMEQ5iB/QzVOydzGxrlZFFpTDOZY5qhI/z4dx9w3DJVTPlru0iHKnKf4k6fY6n
	x5jqiLvBCWvmV0xb4ZGqoT8COwd2uIwUbkP76Hi8cfbbeRbr2GVNbnikB3j5uPZVbSPH7hkNXe1
	MR5hXkJKqoW1XVDEr+r1QeuHFjH3fqB41E6X9HZklEjqFIev5g==
X-Google-Smtp-Source: AGHT+IEz7rjrhwL3HJk43f36FIy7rrYdmVDDgayhVQoH4Dh/eG3AVR0uPbtT1vdB4HpALYHMe7rawg==
X-Received: by 2002:a17:90b:5408:b0:2f6:d266:f45c with SMTP id 98e67ed59e1d1-2f83abb34e6mr16241576a91.2.1738306453920;
        Thu, 30 Jan 2025 22:54:13 -0800 (PST)
Received: from ghost (c-24-56-227-58.customer.broadstripe.net. [24.56.227.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf9497dsm5104201a91.35.2025.01.30.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 22:54:13 -0800 (PST)
Date: Thu, 30 Jan 2025 22:54:11 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Message-ID: <Z5xzkwwZAWRRLCdj@ghost>
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250131035245.GA47826@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_225414_919296_767E10F7 
X-CRM114-Status: GOOD (  24.31  )
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

On Thu, Jan 30, 2025 at 08:52:45PM -0700, Nathan Chancellor wrote:
> On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> > On riscv, kernel modules end up with a significant number of local
> > symbols. This becomes apparent when compiling modules with debug symbols
> > enabled. Using amdgpu.ko as an example of a large module, on riscv the
> > size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> > (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
> > (--strip-debug), and 20MB (--strip-unneeded).
> > 
> > Use --strip-unneeded instead of --strip-debug to strip modules so
> > decrease the size of the resulting modules. This is particularly
> > relevant for riscv, but also marginally aids other architectures.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> Is there any sort of regression risk with this patch? If so, another
> option may be to give another level to INSTALL_MOD_STRIP like 2 so that
> INSTALL_MOD_STRIP=1 continues to behave as before but people can easily
> opt into this option. No strong opinion because I am not sure but was
> not sure if it was considered.

I do not believe this would cause regressions. The description on gnu
strip is:

"Remove all symbols that are not needed for relocation processing in
addition to debugging symbols and sections stripped by --strip-debug."

The description on llvm-strip is:

"Remove from the output all local or undefined symbols that are not
required by relocations. Also remove all debug sections."

gnu strip --strip-unneeded strips slightly more aggressively but it does
not appear this causes any issues.

> 
> Regardless:
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

- Charlie

>
> > ---
> >  scripts/Makefile.modinst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index f97c9926ed31b2b14601ff7773a2ea48b225628b..c22f35f6b9db3cac3923b9e787b219f752570642 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -80,7 +80,7 @@ quiet_cmd_install = INSTALL $@
> >  ifdef INSTALL_MOD_STRIP
> >  
> >  ifeq ($(INSTALL_MOD_STRIP),1)
> > -strip-option := --strip-debug
> > +strip-option := --strip-unneeded
> >  else
> >  strip-option := $(INSTALL_MOD_STRIP)
> >  endif
> > 
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250122-strip_unneeded-cab729310056
> > -- 
> > - Charlie
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
