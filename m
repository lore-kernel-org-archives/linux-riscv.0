Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1C2C47DAF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 22:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eA7F2QapxlXMCyrXKoiVimoEYwf3i0wvD2sJ0qlSFSk=; b=v5/uR/5JRM9Y3V
	RuWpUGIowZ4rUmG6NUvrWyDDSQpJ4LIv646E8SxCOlgv7MXaBs5XRPd1fE6TJxFMvNlU5fOCGVpyt
	XCfDPs1pWx/m4zk5jJoSnfpE17uZQoa/Hc7GV3aqif/L8CxqVp/cJ7Y3EZZ6rAckboYnZKEq13iQ5
	LtK133baewSRwvrrbi1GhmWeu2n3iDjQBk6l46acJZV68ZVgQV3bjTpZeAPEatRXnN9htDM141OaJ
	HrK3GQX2/UhQud7DuhQtSDTr/lh2S5yJOqc7d3u7/2KYwKjDaIdBSjV8SzJ2DEv35AqMNUqvBhjI6
	xrj8k5vmrLTAtKZye7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQb2D-0040W2-2B;
	Thu, 18 Jan 2024 22:38:53 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQb2B-0040V4-0H
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 22:38:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d542701796so1087975ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 14:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705617529; x=1706222329; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ndKDXGOrFoFDHZB7HOpUvkKYbiRqvsxm4yVW9VD7xiI=;
        b=HS0mabZZDGQrIoY/Wr45sqgRPQCvRCSjZsVHcMiNcudgNFfrhMzhXsSLgJQwNH9M9v
         /tNTfDyLZZY26A/afU6j5D9YAOJow7rM4QMwvmqk5ZuKIoXoHWoPmvirFZulj8iyv4ef
         UCTGXwI6ww8ASRCs90+qS9+CgOamevaJZi+VoaM+7PLdT4TVbCCK4IxoaZMFKiRgQm2A
         VvX29aLbrF6v0I7kfzN5VW55X9/FjnAM39k8wVQgXWj0QPAjiaqAiS420xHzwFhA+TtV
         rIT5s5a9bvh3fsNvAOqwqV7fX04dLfL/Cj9IZp1OFSQrKdcjh0c76HZz8lZvxeH7+fKr
         ku3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705617529; x=1706222329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndKDXGOrFoFDHZB7HOpUvkKYbiRqvsxm4yVW9VD7xiI=;
        b=XaMiwKgicSJSq55ROs5xxTm5QqGeGBf8mMcp+iVL9w5fuYkjrATprzSJBESZWn+Z1j
         MZ8fPeQofSd/D026/Sqys2MzdWsD1ITYiyPBlEsFUFrqInXQa6kOBv+MOYO0l9MwAYC9
         R9nV5+a6hm7E1uoUhekS5KF89nWMpwanp9O4fiq4I83X5sl2U7TE+Z49lwfLWb0dBQvc
         slaKfSBYzv2RSb7o6hzbS54/mSBjJPry4cWcFDL17X94wBR7KlBjUU2RVpwS/qWsR+Ne
         ji7c4b4KBUnarVQ47OQFslJV1P/+gJnAuP6TQ2YfeqBMbBqlB0thiQVuD34lUFKEFnqI
         ID+Q==
X-Gm-Message-State: AOJu0Yz/h7V3jGCpJItCtaUeTY/AUK1lUFhmWdPwmGU67efLUSIzURGw
	6X2824EWJlGZ9lLFvf65cB0gKCMlBlHfbga+1p2+qYEfh8ymVKic4qGcJ7GCNx8=
X-Google-Smtp-Source: AGHT+IFGJdorMTyT9FVqn3Vii6en9OD33KxlGDMFNpOa4DgkXv8dWhTvsYKpyhTyfW5huuwKp1n6Kw==
X-Received: by 2002:a17:902:efd2:b0:1d4:c98a:2ceb with SMTP id ja18-20020a170902efd200b001d4c98a2cebmr1387341plb.8.1705617528948;
        Thu, 18 Jan 2024 14:38:48 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id e17-20020a170902cf5100b001d052d1aaf2sm1859084plg.101.2024.01.18.14.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 14:38:48 -0800 (PST)
Date: Thu, 18 Jan 2024 14:38:46 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: lib: Support csum on GCC <11
Message-ID: <ZamodtvgqscAqW8N@ghost>
References: <20240118-museum-ample-11d649f95de8@spud>
 <mhng-6127df88-9768-4f9d-8d78-a1aeb4213451@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-6127df88-9768-4f9d-8d78-a1aeb4213451@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_143851_124666_F67D3731 
X-CRM114-Status: GOOD (  32.07  )
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

On Thu, Jan 18, 2024 at 02:20:42PM -0800, Palmer Dabbelt wrote:
> On Thu, 18 Jan 2024 14:05:44 PST (-0800), Conor Dooley wrote:
> > On Thu, Jan 18, 2024 at 01:53:59PM -0800, Charlie Jenkins wrote:
> > > The OutputOperands field for asm goto statements is only supported
> > > starting from GCC 11. Split the asm goto to remove the use of this
> > > feature.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > Fixes: a04c192eabfb ("riscv: Add checksum library")
> > > ---
> > > The OutputOperands field for asm goto statements is only supported
> > > starting from GCC 11. Split the asm goto to remove the use of this
> > > feature.
> > 
> > Maybe this is a super naive question, but is it possible to just not
> > use the custom csum code for gcc older than 11?
> 
> Charlie and I were talking, these old GCC versions also don't support ZBB.
> So I think we can get away with something like

I sent an updated version that uses CC_HAS_ASM_GOTO_TIED_OUTPUT since
there may exist a compiler that supports ZBB but doesn't support output
in asm goto.

- Charlie

> 
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> index 06ce8e7250d9..17f883b612c9 100644
> --- a/arch/riscv/lib/csum.c
> +++ b/arch/riscv/lib/csum.c
> @@ -158,10 +158,16 @@ do_csum_with_alignment(const unsigned char *buff, int len)
> 
> 	/*
> 	 * Zbb support saves 6 instructions, so not worth checking without
> -	 * alternatives if supported
> +	 * alternatives if supported.
> +	 *
> +	 * Note that we pull the check for ZBB into the preprocessor proper
> +	 * here, as otherwise GCC will attempt to compile the code inside the
> +	 * "if (IS_ENABLED(ZBB)" block which fails because GCC10 doesn't
> +	 * support ASM goto output operands.  GCC 10 also doesn't support ZBB,
> +	 * so we're safe with that check here.
> 	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +#if defined(CONFIG_RISCV_ISA_ZBB)
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> 		unsigned long fold_temp;
> 
> 		/*
> @@ -213,6 +219,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
> end:
> 		return csum >> 16;
> 	}
> +#endif /*CONFIG_RISCV_ISA_ZBB*/
> no_zbb:
> #ifndef CONFIG_32BIT
> 	csum += ror64(csum, 32);
> @@ -244,10 +251,11 @@ do_csum_no_alignment(const unsigned char *buff, int len)
> 
> 	/*
> 	 * Zbb support saves 6 instructions, so not worth checking without
> -	 * alternatives if supported
> +	 * alternatives if supported.  See above for the ZBB preprocessor
> +	 * check.
> 	 */
> -	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> -	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +#if defined(CONFIG_RISCV_ISA_ZBB)
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> 		unsigned long fold_temp;
> 
> 		/*
> @@ -287,6 +295,7 @@ do_csum_no_alignment(const unsigned char *buff, int len)
> #endif /* !CONFIG_32BIT */
> 		return csum >> 16;
> 	}
> +#endif /*CONFIG_RISCV_ISA_ZBB*/
> no_zbb:
> #ifndef CONFIG_32BIT
> 	csum += ror64(csum, 32);
> 
> which is building for me on GCC-10/defconfig.
> 
> > 
> > > ---
> > >  arch/riscv/lib/csum.c | 42 ++++++++++++++++++++++++++++++------------
> > >  1 file changed, 30 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> > > index 06ce8e7250d9..23be289f52b6 100644
> > > --- a/arch/riscv/lib/csum.c
> > > +++ b/arch/riscv/lib/csum.c
> > > @@ -177,22 +177,35 @@ do_csum_with_alignment(const unsigned char *buff, int len)
> > >  				  : no_zbb);
> > >  #ifdef CONFIG_32BIT
> > > -		asm_volatile_goto(".option push			\n\
> > > +		/*
> > > +		 * OutputOperands in asm goto is not supported until GCC 11, so
> > > +		 * this asm has to be split to be compatible.
> > > +		 */
> > > +		asm (".option push				\n\
> > >  		.option arch,+zbb				\n\
> > >  			rori	%[fold_temp], %[csum], 16	\n\
> > >  			andi	%[offset], %[offset], 1		\n\
> > >  			add	%[csum], %[fold_temp], %[csum]	\n\
> > > -			beq	%[offset], zero, %l[end]	\n\
> > > -			rev8	%[csum], %[csum]		\n\
> > >  		.option pop"
> > >  			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
> > > -			: [offset] "r" (offset)
> > > -			:
> > > -			: end);
> > > +			: [offset] "r" (offset));
> > > +
> > > +		if (offset == 0)
> > > +			goto end;
> > > +
> > > +		asm (".option push				\n\
> > > +		.option arch, +zbb				\n\
> > > +			rev8	%[csum], %[csum]		\n\
> > > +		.option pop"
> > > +			: [csum] "+r" (csum));
> > >  		return (unsigned short)csum;
> > >  #else /* !CONFIG_32BIT */
> > > -		asm_volatile_goto(".option push			\n\
> > > +		/*
> > > +		 * OutputOperands in asm goto is not supported until GCC 11, so
> > > +		 * this asm has to be split to be compatible.
> > > +		 */
> > > +		asm (".option push				\n\
> > >  		.option arch,+zbb				\n\
> > >  			rori	%[fold_temp], %[csum], 32	\n\
> > >  			add	%[csum], %[fold_temp], %[csum]	\n\
> > > @@ -200,13 +213,18 @@ do_csum_with_alignment(const unsigned char *buff, int len)
> > >  			roriw	%[fold_temp], %[csum], 16	\n\
> > >  			addw	%[csum], %[fold_temp], %[csum]	\n\
> > >  			andi	%[offset], %[offset], 1		\n\
> > > -			beq	%[offset], zero, %l[end]	\n\
> > > -			rev8	%[csum], %[csum]		\n\
> > >  		.option pop"
> > >  			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
> > > -			: [offset] "r" (offset)
> > > -			:
> > > -			: end);
> > > +			: [offset] "r" (offset));
> > > +
> > > +		if (offset == 0)
> > > +			goto end;
> > > +
> > > +		asm (".option push				\n\
> > > +		.option arch, +zbb				\n\
> > > +			rev8	%[csum], %[csum]		\n\
> > > +		.option pop"
> > > +			: [csum] "+r" (csum));
> > >  		return (csum << 16) >> 48;
> > >  #endif /* !CONFIG_32BIT */
> > > 
> > > ---
> > > base-commit: 080c4324fa5e81ff3780206a138223abfb57a68e
> > > change-id: 20240118-csum_remove_output_operands_asm_goto-49922c141ce7
> > > -- 
> > > - Charlie
> > > 
> > > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
