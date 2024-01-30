Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF5BC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 02:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABns4bNxYKPP4qiTjjzdCrTgR+CTdZaACdbvWDCtAd8=; b=tj0CED/APj7vLY
	12EwBxwZok9MuFw29+tQ7wGkHlLFPh5PvPgFX8dE15VSyALUhuGAG+4qtc200QLdMPmxuU/etmaT1
	dYh1RmZXm8ITQeHAS4FK0sPs+pJYODsTTGC3suhjJMCbYnmd2nX7FRUBFJbC57WousLFDRZaI6loz
	CMXf/rN84Bw7QLHIX1qbZqFhaGis0v33GPoTNNIRwzmeJWWd5k4y5CAhnN0VtTKV3klYt/q1HkMMT
	1LPj5PoxRiQSayodPx5rFgt1UJeIXg83XLGrubu6HEtIL3psH2JRwX/sZm3EpKCcrF4n83UjJb4aZ
	vIzrJKA3tAqQZ/1jwH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdUN-0000000Eu7R-3abN;
	Tue, 30 Jan 2024 02:04:39 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdUK-0000000Eu4U-2GP1
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 02:04:38 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso2908677a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 18:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706580272; x=1707185072; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Fim+674pGlDZqdWdDtQcmpj6hFXjEMlMtTI4Aqc3R8=;
        b=UcNsz7rJjxvDtLkFIHPM49I0G1Pm5cetsnvF4HQnyeB5v8/lvcyO2Z4hPeFIZCB0et
         ltnsUoqYUfPPLw8306oGBkJF/Hb2mANf6GuLaLRGE0qbKQU+g4Cb3T4al5BIn/eWAS2j
         YDrpw7PGr4wGCSZyKtFpA+bI5/Mwo3Lf/l6MapNJpJsXgb1m5U80NDm6HmYZi1aY5t3M
         oVflR2aggvOpwS1wiKnNOuFiwooKYcbvONHW+Cos3USQtSfdCTYhHZmLhxZCCKDF0Mwe
         HYz0l2y9zHcCobMQQ70Da+IBa9v9KPFcaG0beXmKCXFroICNuMn2G+yvrRAodrrATCtC
         u+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706580272; x=1707185072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Fim+674pGlDZqdWdDtQcmpj6hFXjEMlMtTI4Aqc3R8=;
        b=ISx8DdkQMRitSXqVQ7IiT1LadkZ7kxVyGhyZtVoBXHhaalYazFtEcgLyWmOsOSryLV
         inE0KCDJ+gpbdfWaSPlM+pcAnUgqRPiiW3po5qPrEm30Yb5VxKEC5r74KSI6tQAdVG5X
         ZN2n9pNzlhfNlJgwAwCjaIz4Qp+U+yvU2PwCMZkPVH2200yYvExa2yNpT5lpjcXb2fcw
         RuPOn2CxtIE7zsqQBgm5MyBFGz9yUeciNx+bRyvhtnho3wUjuUdmquTLGaK8EVuIIM3N
         9Zl9LSZWSpcQRQE5v0pK4/odioJNqAz9up4Tm2iKj2upf0hKxOoR2RzKeT0byL28wa8E
         BvkA==
X-Gm-Message-State: AOJu0YwFhqvdKrgqkykicCheO/s+V3KTN3R9eAA6DpRnWgrA70yCgKd7
	64oI99lwNBaq5USnzP3agpVXPWtIPhppNNe0dHZGuHSvq3Bm6DQwI9nK80/l6xk=
X-Google-Smtp-Source: AGHT+IFmSAptn8T/TsbpV8/fisKKcmE5PLrVBGvVUaObTd0DsSBuMD8xee55debl4plk5IqPBv7zLA==
X-Received: by 2002:a05:6a20:ce48:b0:19c:9a25:118d with SMTP id id8-20020a056a20ce4800b0019c9a25118dmr8122763pzb.11.1706580272351;
        Mon, 29 Jan 2024 18:04:32 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id n18-20020a170902d2d200b001d6eed31a1bsm5983392plc.245.2024.01.29.18.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 18:04:32 -0800 (PST)
Date: Mon, 29 Jan 2024 18:04:29 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Yangyu Chen <cyy@cyyself.name>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZbhZLewEscaayuaG@ghost>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
 <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
 <46b90dbc-3b5f-4f52-8539-0f6fa7e28ce9@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46b90dbc-3b5f-4f52-8539-0f6fa7e28ce9@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_180436_790290_1A9CFAA4 
X-CRM114-Status: GOOD (  30.76  )
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

On Mon, Jan 29, 2024 at 08:53:31PM -0500, Stefan O'Rear wrote:
> On Mon, Jan 29, 2024, at 7:37 PM, Charlie Jenkins wrote:
> > On riscv it is guaranteed that the address returned by mmap is less than
> > the hint address. Allow mmap to return an address all the way up to
> > addr, if provided, rather than just up to the lower address space.
> >
> > This provides a performance benefit as well, allowing mmap to exit after
> > checking that the address is in range rather than searching for a valid
> > address.
> >
> > It is possible to provide an address that uses at most the same number
> > of bits, however it is significantly more computationally expensive to
> > provide that number rather than setting the max to be the hint address.
> > There is the instruction clz/clzw in Zbb that returns the highest set bit
> > which could be used to performantly implement this, but it would still
> > be slower than the current implementation. At worst case, half of the
> > address would not be able to be allocated when a hint address is
> > provided.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/processor.h | 21 ++++++++-------------
> >  1 file changed, 8 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/processor.h 
> > b/arch/riscv/include/asm/processor.h
> > index f19f861cda54..f3ea5166e3b2 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -22,14 +22,11 @@
> >  ({								\
> >  	unsigned long mmap_end;					\
> >  	typeof(addr) _addr = (addr);				\
> > -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> > -		mmap_end = STACK_TOP_MAX;			\
> 
> Setting mmap_end in the no-hint case seems to have been lost?
> 
> -s

Thanks for catching that, will fix in v2.

- Charlie

> 
> > -	else if ((_addr) >= VA_USER_SV57)			\
> > -		mmap_end = STACK_TOP_MAX;			\
> > -	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> > -		mmap_end = VA_USER_SV48;			\
> > +	if ((_addr) == 0 ||					\
> > +		(IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> > +		((_addr + len) > BIT(VA_BITS - 1)))		\
> >  	else							\
> > -		mmap_end = VA_USER_SV39;			\
> > +		mmap_end = (_addr + len);			\
> >  	mmap_end;						\
> >  })
> > 
> > @@ -39,14 +36,12 @@
> >  	typeof(addr) _addr = (addr);				\
> >  	typeof(base) _base = (base);				\
> >  	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
> > -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> > +	if ((_addr) == 0 ||					\
> > +	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> > +	    ((_addr + len) > BIT(VA_BITS - 1)))			\
> >  		mmap_base = (_base);				\
> > -	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
> > -		mmap_base = VA_USER_SV57 - rnd_gap;		\
> > -	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> > -		mmap_base = VA_USER_SV48 - rnd_gap;		\
> >  	else							\
> > -		mmap_base = VA_USER_SV39 - rnd_gap;		\
> > +		mmap_base = (_addr + len) - rnd_gap;		\
> >  	mmap_base;						\
> >  })
> > 
> >
> > -- 
> > 2.43.0
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
