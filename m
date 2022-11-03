Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E4EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiOiPBKaZLDp9elxndqS7vA/jWULvRMtTv9e2M+ziPA=; b=WvRG0Mt4yVeK/X
	r4885cs5uI+vSylkm9DvlMx7Gnos4F4iR/2IMMyyPBL8mm7nbqLzsbya1+aLWAnIt8geWk8Nz3n3j
	D+4CUkAysh089d7iTpkn7l+oTD9mgXqRAqPprboXdGlMKWg4QcA4GusjZVL1q8UctAy74I87IDDrM
	bT86kqpAQktqUyOAwKJMa9KFn9idB3jpO9jMjQQyj38MNd4tIUaxn4mIlwm+9693Zi9SYxqzJOZOY
	ToAE2wgSDvSe5kK612aEFB/mPkN/YVWjcpmUQ13c424IVqCdyZjb+AjnXeriSKUiTe0BzTxtSmdON
	j9nKfZ2W7GBYHeTjNkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqXMK-00H4Wk-Ao; Thu, 03 Nov 2022 10:22:04 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqXMG-00H4Vs-PW
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 10:22:02 +0000
Received: by mail-ej1-x62a.google.com with SMTP id d26so3870003eje.10
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ByGl95fLjh8Cpi3JWyUdCMrHeP2wN0DMwTQPtXf0l/c=;
        b=PLD6XSJ6myW32BrjymWcPRAIZ93gz+Uki55VG252g2XY5yx/WMRpv7GsQGbC4kAhpK
         o6TKTzyvvmF++f0OQsvG4E1Pi6KURyHx1W2FuVQAaycUlOS6SJLpunXseJZtBsOHUJgT
         ezTtmmvl50morzB30KWD7UEOk8yEsZEP/DMlxNWFn4tyb/SctJakmpL1fFxwGlZJ6XW2
         aPOUo/AfbfSz+67tFMeSOYGS7piSZijzp82LlfUWtxeKBbJpHAl5I6A/mkeYWq6/0ier
         C6TYoKF+9dA99BY6uwLY46tdZTWLqkYiI0YfOEhF+NEPAmpKyaExMCzRzRN+F1p9LrfU
         c00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByGl95fLjh8Cpi3JWyUdCMrHeP2wN0DMwTQPtXf0l/c=;
        b=n+INeaUVD6Z1oxbjh4EfjBEF6885xXMD6bp9H8yQ9eeRBRqbWXJvWtoxKMyAxmTv0f
         5W95icHab+Y86mrTgobqfLG2PiVcLqHR52mxMjCK8iVZcnqLuxilWCJWcgIx6+Zhx+I8
         v2+dDykNCeDJqDczN/IhSjAIJM7RKUNf9ihIloS42+CTJR2MT5Kl4MCVt3OFTKihl215
         VdcfYxrRu+UGcL0WRZ/rQ2kUZUdbD3Hs9Q7JlzQTcTpFn35dpq3C+bV/J96OSqD7PX4M
         /Q0gRrZ1yVjOoxd7+KHmdux3GcjVXOJ3eGvQBaixfivVtLSUa0pz1U0qocO2yhJGomzM
         Al0g==
X-Gm-Message-State: ACrzQf29fBGZrOgocJtCNpKlYx0uS2QHH3wn3hW7EF5BfX8Spea+v0cZ
	y/wjjlK6HfgRvgyB6gSajrijBQ==
X-Google-Smtp-Source: AMsMyM6sToDeGkYz5O3uCAiOZ7vyYgi0ut8ALF2q0MDb12rU54USCGoCKIAGZfmJynrGKovgVw+jdw==
X-Received: by 2002:a17:907:6296:b0:787:d066:9fcf with SMTP id nd22-20020a170907629600b00787d0669fcfmr26455431ejc.692.1667470915909;
        Thu, 03 Nov 2022 03:21:55 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id gw24-20020a170906f15800b007389c5a45f0sm307094ejb.148.2022.11.03.03.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 03:21:55 -0700 (PDT)
Date: Thu, 3 Nov 2022 11:21:54 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	apatel@ventanamicro.com, heiko@sntech.de,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>, jszhang@kernel.org
Subject: Re: [PATCH 9/9] RISC-V: Use Zicboz in memset when available
Message-ID: <20221103102154.stqsqswonhchrdof@kamzik>
References: <20221027130247.31634-10-ajones@ventanamicro.com>
 <mhng-4fd71e9d-58b8-4e65-812f-bf0624628de7@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-4fd71e9d-58b8-4e65-812f-bf0624628de7@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_032200_873553_BFC6C71A 
X-CRM114-Status: GOOD (  35.23  )
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

On Wed, Nov 02, 2022 at 07:43:03PM -0700, Palmer Dabbelt wrote:
> On Thu, 27 Oct 2022 06:02:47 PDT (-0700), ajones@ventanamicro.com wrote:
> > RISC-V has an optimized memset() which does byte by byte writes up to
> > the first sizeof(long) aligned address, then uses Duff's device until
> > the last sizeof(long) aligned address, and finally byte by byte to
> > the end. When memset is used to zero memory and the Zicboz extension
> > is available, then we can extend that by doing the optimized memset
> > up to the first Zicboz block size aligned address, then use the
> > Zicboz zero instruction for each block to the last block size aligned
> > address, and finally the optimized memset to the end.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/lib/memset.S | 81 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> > 
> > diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> > index 74e4c7feec00..786b85b5e9cc 100644
> > --- a/arch/riscv/lib/memset.S
> > +++ b/arch/riscv/lib/memset.S
> > @@ -5,6 +5,12 @@
> > 
> >  #include <linux/linkage.h>
> >  #include <asm/asm.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/insn-def.h>
> > +#include <asm/hwcap.h>
> > +
> > +#define ALT_ZICBOZ(old, new)	ALTERNATIVE(old, new, 0, RISCV_ISA_EXT_ZICBOZ, \
> > +					    CONFIG_RISCV_ISA_ZICBOZ)
> > 
> >  /* void *memset(void *, int, size_t) */
> >  ENTRY(__memset)
> > @@ -15,6 +21,58 @@ WEAK(memset)
> >  	sltiu	a3, a2, 16
> >  	bnez	a3, .Lfinish
> > 
> > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > +	ALT_ZICBOZ("j .Ldo_memset", "nop")
> 
> This at least deserves a comment: the jump is PC-relative, so it'll only
> work if alternative processing happens in a way that ensures these PC
> offsets don't change.  I think this might actually work if all that section
> stuff avoids touching the PC, but that'd need to be written down if we're
> going to depend on it.

I believe the "old" instructions can be anything, so PC-relative jumps
should always work. The "new" instructions cannot contain any branch
targets outside its content though. I agree we should better document
the constraints in arch/riscv/include/asm/alternative-macros.h as
my beliefs come from some trial-and-error and also from reading the
constraints in arm64's implementation, as it appears riscv's
implementation was derived from there. I can try to do an ALTERNATIVE
documenting patch independently of this series.

> 
> That said, this is really just a static_branch implemented differently.  Can
> we just use one?

I don't think we can use static branches in assembly.

Thanks,
drew

> 
> > +	/*
> > +	 * t1 will be the Zicboz block size.
> > +	 * Zero means we're not using Zicboz, and we don't when a1 != 0
> > +	 */
> > +	li	t1, 0
> > +	bnez	a1, .Ldo_memset
> > +	la	a3, riscv_cboz_block_size
> > +	lw	t1, 0(a3)
> > +
> > +	/*
> > +	 * Round to nearest Zicboz block-aligned address
> > +	 * greater than or equal to the start address.
> > +	 */
> > +	addi	a3, t1, -1
> > +	not	t2, a3			/* t2 is Zicboz block size mask */
> > +	add	a3, t0, a3
> > +	and	t3, a3, t2		/* t3 is Zicboz block aligned start */
> > +
> > +	/* Did we go too far or not have at least one block? */
> > +	add	a3, a0, a2
> > +	and	a3, a3, t2
> > +	bgtu	a3, t3, .Ldo_zero
> > +	li	t1, 0
> > +	j	.Ldo_memset
> > +
> > +.Ldo_zero:
> > +	/* Use Duff for initial bytes if there are any */
> > +	bne	t3, t0, .Ldo_memset
> > +
> > +.Ldo_zero2:
> > +	/* Calculate end address */
> > +	and	a3, a2, t2
> > +	add	a3, t0, a3
> > +	sub	a4, a3, t0
> > +
> > +.Lzero_loop:
> > +	CBO_ZERO(t0)
> > +	add	t0, t0, t1
> > +	bltu	t0, a3, .Lzero_loop
> > +	li	t1, 0			/* We're done with Zicboz */
> > +
> > +	sub	a2, a2, a4		/* Update count */
> > +	sltiu	a3, a2, 16
> > +	bnez	a3, .Lfinish
> > +
> > +	/* t0 is Zicboz block size aligned, so it must be SZREG aligned */
> > +	j	.Ldo_duff3
> > +#endif
> > +
> > +.Ldo_memset:
> >  	/*
> >  	 * Round to nearest XLEN-aligned address
> >  	 * greater than or equal to the start address.
> > @@ -33,6 +91,18 @@ WEAK(memset)
> > 
> >  .Ldo_duff:
> >  	/* Duff's device with 32 XLEN stores per iteration */
> > +
> > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > +	ALT_ZICBOZ("j .Ldo_duff2", "nop")
> > +	beqz	t1, .Ldo_duff2
> > +	/* a3, "end", is start of block aligned start. a1 is 0 */
> > +	move    a3, t3
> > +	sub	a4, a3, t0		/* a4 is SZREG aligned count */
> > +	move	t4, a4			/* Save count for later, see below. */
> > +	j	.Ldo_duff4
> > +#endif
> > +
> > +.Ldo_duff2:
> >  	/* Broadcast value into all bytes */
> >  	andi	a1, a1, 0xff
> >  	slli	a3, a1, 8
> > @@ -44,10 +114,12 @@ WEAK(memset)
> >  	or	a1, a3, a1
> >  #endif
> > 
> > +.Ldo_duff3:
> >  	/* Calculate end address */
> >  	andi	a4, a2, ~(SZREG-1)
> >  	add	a3, t0, a4
> > 
> > +.Ldo_duff4:
> >  	andi	a4, a4, 31*SZREG	/* Calculate remainder */
> >  	beqz	a4, .Lduff_loop		/* Shortcut if no remainder */
> >  	neg	a4, a4
> > @@ -100,6 +172,15 @@ WEAK(memset)
> > 
> >  	addi	t0, t0, 32*SZREG
> >  	bltu	t0, a3, .Lduff_loop
> > +
> > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > +	ALT_ZICBOZ("j .Lcount_update", "nop")
> > +	beqz	t1, .Lcount_update
> > +	sub	a2, a2, t4		/* Difference was saved above */
> > +	j	.Ldo_zero2
> > +#endif
> > +
> > +.Lcount_update:
> >  	andi	a2, a2, SZREG-1		/* Update count */
> > 
> >  .Lfinish:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
