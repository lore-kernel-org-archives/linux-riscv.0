Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBFBC001CC
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sv+iFUKLiBJGU17NCYFQLNnyb4EDknLFGdJDY9EfiFQ=; b=HD3+am58GE6e0o
	3IyFsbfw3GonQvfLR2XH1lqzp0kZr84HfDnteTqC5ak0lNecAdHFT2AFVoWPoRcrhqilmWZV/ldlA
	JqjJgVG3BQU8JdVuHcCmPxZuFCBLuMjdC4vHGnLBEZePgQlQlbJUqGTm+9PYyMIs6b2xkCDg/hF8Q
	u8Xw68xn2dmu5alYj3zWNYJ0ucP75g3V2Mq/4q5xsFW50wgu38L7S3KKfOz6n/3xkIjTkJ7uirFmc
	KRINKU8SZefNrMtkt4KM/ANqexbFKWUU8TdNGsb+XHE3kPGMbJ/x6/cPgk5VWLzUM48GZAvD9+v3+
	2uEmsfLQuyVl/AimYplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxDKK-000000009J3-1EoH;
	Wed, 17 Apr 2024 22:00:24 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxDKF-000000009Gd-494Y
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 22:00:21 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso82000a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 15:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713391216; x=1713996016; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uQ2asP1T1xuvOSck++wQC9ZSwwPqaUNm6JnqVfU5CKQ=;
        b=FTnB/i734lCk/9Fhus4BECsFwziFT3FBsLaiT7hZpaN8wbsxk2By4FROGJNvSs+uhE
         eMAQd7IcR5MhnyoXevutAu0JEfsfMVaiUUWGQz2hu4lQT9+Hqv1VN++NjlXGUYQwVopl
         iSJQEE01ia1jZ9EQ6GJj7TQM56BpREzu2UgAQuzGJc4msgZK6CRAmHpzdrbUwl4p0ojU
         oPECYGMsj5XrvpiKUcUKb2FrSe3ETGUyWI5COsTvvNHN5ELXjRIOVJ9RLzw0r4LMxboz
         dIDGzvvarc3r9raoPs4rqIW69wSNAcPO/4T71D8tVmLLv3rNjNTx5Xo79Y44XPuZp+t/
         /R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713391216; x=1713996016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQ2asP1T1xuvOSck++wQC9ZSwwPqaUNm6JnqVfU5CKQ=;
        b=jZWsJUGJjTkf/Pq1ErGjGr6l1rP4CDC9aw+KybFEf5g7QAZI5nQbI3cu79Nqz/9nO6
         xl0IAMskuSNTns8KAgNKOECZf2pUcCsg0EuXySW+1v0OQLPnP6nKOBP30dW+bKW/Xh6Z
         R1aiPIJw8qKvDXEpSVylKhQ/qdc04n+h9LOMhftmw4amNNM/2o23B62w8DF4efLifKgj
         csQCDWFgmiiuu6qduMFsv+lTMvGKjt6+UM2dZTbG6+bRwPi7lks+VoeUn5e2EorHqOId
         8mp9CC44/DHCA/n6Wk+gjk3brlvTp0Ax7PBsKGh5rwbaOLJTl93VT+VWxCyks6lFJ4J7
         8YiA==
X-Forwarded-Encrypted: i=1; AJvYcCV/yKP/TPW5a5we5kmIQviS4OAGDgdR5fVnUYY5IGM88KY1a1dPiR9B/CIs4G6VAecY2QbUxca9gMXsFRcxtBddUbAZwbQ/jSxSVh7wCvGm
X-Gm-Message-State: AOJu0YxOI3T829SN+cERA7vehy2lfPKvXj84NQF7ey55EIiil/Rd+LzH
	y8zhYJ0VqxWmJ2tJ2GwuvquH5XY4rNadhpKedu5SqfnTtttMVD1duve6mmiGOuQ=
X-Google-Smtp-Source: AGHT+IEiDU5SQjuL7+0vdKdkoS1KFGY8onYhPVJwXQzy7eXZ9mhuURRy3tq7dfxgiflxBiFa6A84tg==
X-Received: by 2002:a05:6a21:3381:b0:1aa:6ddb:4adf with SMTP id yy1-20020a056a21338100b001aa6ddb4adfmr1271607pzb.39.1713391214298;
        Wed, 17 Apr 2024 15:00:14 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id j18-20020a62e912000000b006e681769ee0sm151780pfh.145.2024.04.17.15.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 15:00:13 -0700 (PDT)
Date: Wed, 17 Apr 2024 15:00:07 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 13/17] riscv: vector: Support xtheadvector save/restore
Message-ID: <ZiBGZ9UOpYm3Grvh@ghost>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-13-c7d68c603268@rivosinc.com>
 <20240417-semisweet-willed-1ce1098d8c41@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240417-semisweet-willed-1ce1098d8c41@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_150020_353698_D679BE67 
X-CRM114-Status: GOOD (  33.89  )
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

On Wed, Apr 17, 2024 at 03:50:24PM +0100, Conor Dooley wrote:
> On Mon, Apr 15, 2024 at 09:12:10PM -0700, Charlie Jenkins wrote:
> 
> > diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> > index 6727d1d3b8f2..f42eaa8178e9 100644
> > --- a/arch/riscv/kernel/vector.c
> > +++ b/arch/riscv/kernel/vector.c
> > @@ -33,10 +33,24 @@ int riscv_v_setup_vsize(void)
> >  {
> >  	unsigned long this_vsize;
> >  
> > -	/* There are 32 vector registers with vlenb length. */
> > -	riscv_v_enable();
> > -	this_vsize = csr_read(CSR_VLENB) * 32;
> > -	riscv_v_disable();
> > +	/*
> > +	 * This is called before alternatives have been patched so can't use
> > +	 * riscv_has_vendor_extension_unlikely
> 
> () after that function name please.
> 
> > +	 */
> > +	if (has_xtheadvector_no_alternatives()) {
> > +		/*
> > +		 * Although xtheadvector states that th.vlenb exists and
> > +		 * overlaps with the vector 1.0 vlenb, an illegal instruction is
> > +		 * raised if read. These systems all currently have a fixed
> > +		 * vector length of 128, so hardcode that value.
> 
> I had this written before the meeting, so pasting it anyway:
> -- >8 --
> From 5ed25d0f841e755b8dd4f1f6a3ea824601758d8e Mon Sep 17 00:00:00 2001
> From: Conor Dooley <conor.dooley@microchip.com>
> Date: Wed, 17 Apr 2024 14:39:36 +0100
> Subject: [PATCH] dt-bindings: riscv: cpus: add a vlen register length property
> 
> Add a property analogous to the vlenb CSR so that software can detect
> the vector length of each CPU prior to it being brought online.
> Currently software has to assume that the vector length read from the
> boot CPU applies to all possible CPUs. On T-Head CPUs implementing
> pre-ratification vector, reading the th.vlenb CSR may produce an illegal
> instruction trap, so this property is required on such systems.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> We could actually enforce the latter since we know the compatibles of
> the relevant CPUs and can tell if xtheadvector is present.
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d067f2a468ee..2a6449a0f1d7 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -95,6 +95,12 @@ properties:
>      description:
>        The blocksize in bytes for the Zicboz cache operations.
>  
> +  riscv,vlenb:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      VLEN/8, the vector register length in bytes. This property is required in
> +      systems where the vector register length is not identical on all harts.
> +
>    # RISC-V has multiple properties for cache op block sizes as the sizes
>    # differ between individual CBO extensions
>    cache-op-block-size: false
> -- 
> 2.43.0
> 
> 
> 
> > +		 */
> > +		this_vsize = 128;
> > +	} else {
> > +		/* There are 32 vector registers with vlenb length. */
> > +		riscv_v_enable();
> > +		this_vsize = csr_read(CSR_VLENB) * 32;
> > +		riscv_v_disable();
> > +	}

Thank you for this, I can add this patch to my v3.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
