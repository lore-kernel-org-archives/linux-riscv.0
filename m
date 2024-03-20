Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E503C54E71
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 01:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=IFQcPgoq/hteP+tR3SqTa7WdfIM4YQzU/Z3BNmM1IBc=; b=bi/vV2vPKI/HwCiHTz1dJnHOKz
	V7ONH1yVuPoW+wvQSQh3eNl9LHfPN9vvOfJcPjj3wxi10vBgW9p7ljpmP9Aq3FxsTe279/g8MHTNI
	DOTh3x+XRfxoaoV48vPiOACF7a0Eg1LjPUB4SfdKEONMQyncoqbSoziAQ6zGnDr9K+xPLSTduAaUo
	ShN8h+Z399ijfeyeYDwaUuZ9gPpUBSwq2JNLNUIsV8Y0lCmCl1rv9LpcI3A/BuUoFHZFTOlOPlNH1
	paxtSxBmmRnaKHuVulzFi3ucy63e+aPs7GW6Vlmmr4T3f29pv3KFW0HhOpGsuhDuU75+udKAIVVVI
	CRGJsajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rml4e-0000000Exah-3yBa;
	Wed, 20 Mar 2024 01:49:01 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rml4a-0000000ExaG-1pAp
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 01:48:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6ce174d45so5044805b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 18:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1710899335; x=1711504135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XFWeUGhARFGLtFMmrEktN1r5EqqYdHQ1yDObB41VHU=;
        b=IcGxpsV1nsbtSOPIB/T5IUH2FREtxhehlwfja4lDOHwLOk2+ogoD/s1vAXSioujv3j
         9klsvTYW38fST64krUW3wQDxHLOFDRGIuAvpEDJ+UJl0Ii+IgJ2AhnW4iQe0WvCYCWNp
         EqphkUWNbHjCIrkAaHnpvPAPwWfdhWwcv6cg6hEf8LPNb5piUUbwpFqlQu+CVaGIDtlE
         t2kvuLO/6/vPUfMTAwJ0z8pmqSqNDqtQHuRMUncO/Irlzy6YhKXOuUJmuL25fWMgqDRd
         fD8mps9S6JWSXpprU34ODf5BAs7bZ4nEvKqdPKTl0Ufs5cjFJBDILpCw8RGV91e/K5JQ
         d+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710899335; x=1711504135;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XFWeUGhARFGLtFMmrEktN1r5EqqYdHQ1yDObB41VHU=;
        b=rxK5JQzJIkzR3+0ZZ0OPm1ZuAah8+CE0oeolrOdkaKq+5XwNIB4YShhKPC0VuwK4ZU
         jPSUXOBichCmcD8smt8ZKhJO6KidRO4lOx77v0WulBWPCkJtp6bT/yHw4M9c6jWtFjud
         +GpRHpQ8wiX3Z/VbWzOuZb5VyRgtgmhpwURwRHUGtvVPSQFnNdE23LWQidNsuHC0Cp4P
         Zw/E8NjBD/pFTX2p7sPk3wTAJd+HO1zaOEtIkuRGKy/K3ho06dW8ca3q11WzSHqOlDST
         cUcAtaZJbgv9gIPPq83LzyRZd25T661hCgTy1dZYb4fvwXigukxwhD+P1ttqFGWTjmib
         qvtg==
X-Forwarded-Encrypted: i=1; AJvYcCX8/bOopFwf1xxnhE7AZUZJoRxFnBK2MDd89p1VSTTwj+nsP/46fQiwEb4m1bBdrw+ILVYGtG94xrSQ+HPzv47/2FauFCyJyrbzuLvl42cQ
X-Gm-Message-State: AOJu0Yyu5fckElMg6Q1AZF/OaxfL4l8Q7RTVToj1JmFifXt5Nv2Qc2Xm
	bW4SyyO4bx6u7olkFC836doRHUs1fzVuG1OUic7MHU0g3M6OkIPd+WSPQ190Yjg=
X-Google-Smtp-Source: AGHT+IEsM1/0CXsqPV1u7HWDW2kWwLy9n8txe/RJcjigdZRgO1jABEpVpPsAnwHTQDrbVR7Cz8D3Jw==
X-Received: by 2002:a05:6a20:b915:b0:1a3:69a9:e3e7 with SMTP id fe21-20020a056a20b91500b001a369a9e3e7mr4012756pzb.18.1710899334899;
        Tue, 19 Mar 2024 18:48:54 -0700 (PDT)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id ld11-20020a170902facb00b001db5079b705sm1628209plb.36.2024.03.19.18.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 18:48:54 -0700 (PDT)
Date: Tue, 19 Mar 2024 18:48:54 -0700 (PDT)
X-Google-Original-Date: Tue, 19 Mar 2024 18:48:50 PDT (-0700)
Subject: Re: [PATCH riscv/for-next] crypto: riscv - parallelize AES-CBC decryption
In-Reply-To: <20240210181240.GA1098@sol.localdomain>
CC: jerry.shih@sifive.com, linux-riscv@lists.infradead.org,
  linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu, Heiko Stuebner <heiko@sntech.de>,
  phoebe.chen@sifive.com, andy.chiu@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org
Message-ID: <mhng-7b6264a7-c1cd-46b2-97f1-b2c3d3dbb716@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_184857_080227_7236FC67 
X-CRM114-Status: GOOD (  30.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 10 Feb 2024 10:12:40 PST (-0800), ebiggers@kernel.org wrote:
> On Sat, Feb 10, 2024 at 11:25:27PM +0800, Jerry Shih wrote:
>> > .macro	aes_cbc_decrypt	keylen
>> > +	srli		LEN, LEN, 2	// Convert LEN from bytes to words
>> > 	vle32.v		v16, (IVP)	// Load IV
>> > 1:
>> > -	vle32.v		v17, (INP)	// Load ciphertext block
>> > -	vmv.v.v		v18, v17	// Save ciphertext block
>> > -	aes_decrypt	v17, \keylen	// Decrypt
>> > -	vxor.vv		v17, v17, v16	// XOR with IV or prev ciphertext block
>> > -	vse32.v		v17, (OUTP)	// Store plaintext block
>> > -	vmv.v.v		v16, v18	// Next "IV" is prev ciphertext block
>> > -	addi		INP, INP, 16
>> > -	addi		OUTP, OUTP, 16
>> > -	addi		LEN, LEN, -16
>> > +	vsetvli		t0, LEN, e32, m4, ta, ma
>> > +	vle32.v		v20, (INP)	// Load ciphertext blocks
>> > +	vslideup.vi	v16, v20, 4	// Setup prev ciphertext blocks
>> > +	addi		t1, t0, -4
>> > +	vslidedown.vx	v24, v20, t1	// Save last ciphertext block
>>
>> Do we need to setup the `e32, len=t0` for next IV?
>> I think we only need 128bit IV (with VL=4).
>>
>> > +	aes_decrypt	v20, \keylen	// Decrypt the blocks
>> > +	vxor.vv		v20, v20, v16	// XOR with prev ciphertext blocks
>> > +	vse32.v		v20, (OUTP)	// Store plaintext blocks
>> > +	vmv.v.v		v16, v24	// Next "IV" is last ciphertext block
>>
>> Same VL issue here.
>
> It's true that the vslidedown.vx and vmv.v.v only need vl=4.  But it also works
> fine with vl unchanged.  It just results in some extra data being moved in the
> registers.  My hypothesis is that this is going to be faster than having the
> three extra instructions per loop iteration to change the vl to 4 twice.
>
> I still have no real hardware to test on, so I have no quantitative data.  All I
> can do is go with my instinct which is that the shorter version will be better.
>
> If you have access to a real CPU that supports the RISC-V vector crypto
> extensions, I'd be interested in the performance you get from each variant.
> (Of course, different RISC-V CPU implementations may have quite different
> performance characteristics, so that still won't be definitive.)

We're stacking up a lot of stuff with HW-dependent performance 
questions, I think it's fine to just take what's reasonably simple for 
now.  If we try to speculate about what future hardware might do we're 
just going to go crazy with possibilities, IMO we're way better off just 
optimizing as things show up.

> Here is the alternative variant given as a diff from this patch:
>
> diff --git a/arch/riscv/crypto/aes-riscv64-zvkned.S b/arch/riscv/crypto/aes-riscv64-zvkned.S
> index 43541aad6386c..ef380771f606a 100644
> --- a/arch/riscv/crypto/aes-riscv64-zvkned.S
> +++ b/arch/riscv/crypto/aes-riscv64-zvkned.S
> @@ -146,10 +146,13 @@ SYM_FUNC_END(aes_ecb_decrypt_zvkned)
>  	vle32.v		v20, (INP)	// Load ciphertext blocks
>  	vslideup.vi	v16, v20, 4	// Setup prev ciphertext blocks
>  	addi		t1, t0, -4
> +	vsetivli	zero, 4, e32, m4, ta, ma
>  	vslidedown.vx	v24, v20, t1	// Save last ciphertext block
> +	vsetvli		t0, LEN, e32, m4, ta, ma
>  	aes_decrypt	v20, \keylen	// Decrypt the blocks
>  	vxor.vv		v20, v20, v16	// XOR with prev ciphertext blocks
>  	vse32.v		v20, (OUTP)	// Store plaintext blocks
> +	vsetivli	zero, 4, e32, m4, ta, ma
>  	vmv.v.v		v16, v24	// Next "IV" is last ciphertext block
>  	slli		t1, t0, 2	// Words to bytes
>  	add		INP, INP, t1
> @@ -157,7 +160,6 @@ SYM_FUNC_END(aes_ecb_decrypt_zvkned)
>  	sub		LEN, LEN, t0
>  	bnez		LEN, 1b
>
> -	vsetivli	zero, 4, e32, m1, ta, ma
>  	vse32.v		v16, (IVP)	// Store next IV
>  	ret
>  .endm
>
> A third variant would be to just replace vmv.v.v with vmv1r.v.
>
> In general, this level of micro-optimization probably needs to be wait until
> there are a variety of CPUs to test on.  We know that parallelizing the
> algorithms is helpful, so we should do that, as this patch does.  But the
> effects of small variations in the instruction sequences are currently unclear.

Ya, I agree.  So I'm fine with this, it's a base and we can always 
improve it when there's something concrete to run on.

> - Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
