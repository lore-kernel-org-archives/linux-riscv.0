Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8E0C54E5D
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Mar 2024 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNLPWHfOW0UvQw54pR6J8vDHMa3C1JK6bdmc4zOfPKI=; b=JhdhF2iTEQ7s16
	NTmkkFl2AJrYix6IQvMfHqIFBhxC49AQzUSosqNLZx5ypEne9XKhiNYrePgdjEP223X84TGQI8m+G
	OqAUqjz6GQTVTmU4tGggqibRuZyilbdqFSQLFYZaMUhEPZIym3g1V574SDBpBXSBx34qhWiz6u+ZZ
	aDkZq3gBTp/tfVUwKZ2jfk6CT6m4YZ3wLn5Dr30kiUJTPx+btn06rVHCUJuyLWzLIJWqPXGi9lDjH
	We0pOCMKiN6uwdofORxur+epRgbCvaW7kzkeOQddeZ++AZBPg2lqBu1gq8nRHuy4UM1+tOYWMUtmX
	nGBCqrrD61BaTb9hB7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlSL7-0000000323P-0Q0P;
	Sat, 16 Mar 2024 11:36:37 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlSL3-0000000321m-0zjU;
	Sat, 16 Mar 2024 11:36:35 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-568107a9ff2so3486051a12.3;
        Sat, 16 Mar 2024 04:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710588991; x=1711193791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjcQRtwHgShfLwSDa1kRl5y3Kq1I1e3RFDRcxVbID5s=;
        b=DkvMkMwXkHBu2JL8SUwYl8C/Ryo/7+w0BKnzqR81QXyCQeAIBMhTirA/MD+uTnTKQf
         Us6sOwPZMS0V/jLF5cNI9mudDs9gn09gO+q1C1stq5vgqcliwZBgLfrz/bmvV6W3PCRU
         2BLi+YfKckPFNADHyekOJ0Fo3kIi7gYpbFE7KNvaHg4ZgLBLBIlpzZiJhWFImhODTqxl
         GGg/oTcLz1YqRaxIvJ1HkVN30kOd0sX/bR1oPu3v5xq6RJrpxkCopPsfb4sHRK/S3eFn
         v4tQ7F+F1TU5i4hmXKBnVL+7s/W/dyvuv338BMyuTPBbEQgaGooQYqpTmZ9T5CopB4ow
         9S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710588991; x=1711193791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjcQRtwHgShfLwSDa1kRl5y3Kq1I1e3RFDRcxVbID5s=;
        b=SlD5NBmFH2NvMegQhob66YfsKImZaNiFIg9a8UulQSDycmMzRTvKwCXHxGQzbx2o1q
         5kbCV55jMgc66DxxnXueVUFG0cXgX0YliSLzxVVfsW6mG8oEcOoGtDwCcSm/Uz1cvk31
         3tiukfL2pxf6nwO+1557Ci3aruFP7r5SD2YDsaRhdQe3+ikWPcVz0uU4+2jDLR0o92j5
         JcQcs8B3LvAzs5L+W/1aVV5Mz9dxBLwMoq5tZTOCKqsCOAxrCRAnuyZVPI/021EjeRCj
         0QYVLATDdzpM48ugGwNCwXOwEUWFZVGq/Y9yPmsZjMxz2yFWYrD0z7/CCMa6Zp/C4TaU
         fPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyD9V1V4lIiE/llH6RTdplQRHFf83GS3MyQCpCCHHTo1hT7OGg7ryMscF54eQ47Z/2xDIYr/tEq86CxZrQQBpq5+I6UzN9O/90lfuguw==
X-Gm-Message-State: AOJu0YzKASnjC2B919LwJhUMhq9vj6YsakD5i4iqA1Cz6jzYEqR0W63L
	6tKdyn8wQ+nFfKmqVFjj9U3ugegAfHXm+UxhglIOSVKyZS473WUb
X-Google-Smtp-Source: AGHT+IHbbRoWPYiaephe9iLPqx7dE0TuVT4q52aePxZ5UnHlFRnyuaEMS1cO64CjC0vzWl3KFVn9yg==
X-Received: by 2002:a17:906:1309:b0:a46:acdf:5a20 with SMTP id w9-20020a170906130900b00a46acdf5a20mr141936ejb.37.1710588990638;
        Sat, 16 Mar 2024 04:36:30 -0700 (PDT)
Received: from andrea ([217.201.228.235])
        by smtp.gmail.com with ESMTPSA id c19-20020a170906341300b00a45e80cbf99sm2670503ejb.221.2024.03.16.04.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 04:36:30 -0700 (PDT)
Date: Sat, 16 Mar 2024 12:36:23 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, christoph.muellner@vrull.eu, heiko@sntech.de,
	charlie@rivosinc.com, David.Laight@aculab.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/5] riscv: Add Zawrs support for spinlocks
Message-ID: <ZfWEN2PXxDC4waE/@andrea>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
 <20240315134009.580167-8-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240315134009.580167-8-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_043633_312136_CBCD9CD3 
X-CRM114-Status: GOOD (  24.32  )
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

> +config RISCV_ISA_ZAWRS
> +	bool "Zawrs extension support for more efficient busy waiting"
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Enable the use of the Zawrs (wait for reservation set) extension
> +	   when available.
> +
> +	   The Zawrs extension instructions (wrs.nto and wrs.sto) are used for
> +	   more efficient busy waiting.

Maybe mention that this is about _power_-efficiency?  In the discussion
of the previous iteration, I suggested [1]:

  The Zawrs extension defines a pair of instructions to be used in
  polling loops that allows a core to enter a low-power state and
  wait on a store to a memory location.

(from the Zawrs spec  -- I remain open to review other suggestiongs).


> +#define ZAWRS_WRS_NTO	".long 0x00d00073"
> +#define ZAWRS_WRS_STO	".long 0x01d00073"

In the discussion of the previous iteration, you observed [2]:

  I'd prefer we use insn-def.h to define instructions, rather than
  scatter .long's around, but since this instruction doesn't have
  any inputs, then I guess it's not so important to use insn-def.h.

So that "preference" doesn't apply to the instructions at stake?  Or is
not "important"?  No real objections to barrier.h, trying to understand
the rationale.


> +#define ALT_WRS_NTO()							\
> +	__asm__ __volatile__ (ALTERNATIVE(				\
> +		"nop\n", ZAWRS_WRS_NTO "\n",				\
> +		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
> +#define ALT_WRS_STO()							\
> +	__asm__ __volatile__ (ALTERNATIVE(				\
> +		"nop\n", ZAWRS_WRS_STO "\n",				\
> +		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
> +
>  #define RISCV_FENCE(p, s) \
>  	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")

FYI, this hunk/patch conflicts with Eric's changes [3].


> +#define ___smp_load_reservedN(attr, ptr)				\
> +({									\
> +	typeof(*ptr) ___p1;						\
> +									\
> +	__asm__ __volatile__ ("lr." attr "       %[p], %[c]\n"		\
> +			      : [p]"=&r" (___p1), [c]"+A"(*ptr));	\
> +	___p1;								\
> +})
> +
> +#define __smp_load_reserved_relaxed(ptr)				\
> +({									\
> +	typeof(*ptr) ___p1;						\
> +									\
> +	if (sizeof(*ptr) == sizeof(int))				\
> +		___p1 = ___smp_load_reservedN("w", ptr);		\
> +	else if (sizeof(*ptr) == sizeof(long))				\
> +		___p1 = ___smp_load_reservedN("d", ptr);		\
> +	else								\
> +		compiletime_assert(0,					\
> +		"Need type compatible with LR/SC instructions for "	\
> +		__stringify(ptr));					\
> +	___p1;								\
> +})

In the discussion of the previous iteration, you observed [2]:

  It's more common to use a switch for these things, [...] something
  like the macros in arch/riscv/include/asm/cmpxchg.h.  Can we stick
  with that pattern?

Along the same lines (#codingstyle), notice that ___smp_load_reservedN()
would become one of the first uses of the asmSymbolicName syntax in the
arch/riscv/ directory.

So again, why not stick to the common style? something's wrong with it?


> +#define smp_cond_load_relaxed(ptr, cond_expr)				\
> +({									\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +									\
> +	VAL = READ_ONCE(*__PTR);					\
> +	if (!cond_expr) {						\
> +		for (;;) {						\
> +			VAL = __smp_load_reserved_relaxed(__PTR);	\
> +			if (cond_expr)					\
> +				break;					\
> +			ALT_WRS_STO();					\
> +		}							\
> +	}								\
> +	(typeof(*ptr))VAL;						\
> +})
> +
> +#define smp_cond_load_acquire(ptr, cond_expr)				\
> +({									\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +									\
> +	VAL = smp_load_acquire(__PTR);					\
> +	if (!cond_expr) {						\
> +		for (;;) {						\
> +			VAL = __smp_load_reserved_acquire(__PTR);	\
> +			if (cond_expr)					\
> +				break;					\
> +			ALT_WRS_STO();					\
> +		}							\
> +	}								\
> +	(typeof(*ptr))VAL;						\
> +})

In the discussion of the previous iteration, you observed [2]:

  I guess this peeling off of the first iteration is because it's
  expected that the load generated by READ_ONCE() is more efficient
  than lr.w/d?  If we're worried about unnecessary use of lr.w/d,
  then shouldn't we look for a solution that doesn't issue those
  instructions when we don't have the Zawrs extension?

To which Palmer replied (apparently, agreeing with your remarks) [4]:

  I haven't looked at the patch, but I'd expect we NOP out the
  whole LR/WRS sequence?  I don't remember any reason to have the
  load reservation without the WRS,  [...]

Unfortunately, this submission makes no mention to those comments and,
more importantly, to the considerations/tradeoffs which have led you
to submit different changes.  In submitting-patches.rst's words,

  Review comments or questions that do not lead to a code change
  should almost certainly bring about a comment or changelog entry
  so that the next reviewer better understands what is going on.

  Andrea

P.S. BTW, not too far from the previous recommendation/paragraph is:

  When sending a next version, [...]  Notify people that commented
  on your patch about new versions by adding them to the patches CC
  list.

[1] https://lore.kernel.org/lkml/ZTE7eUyrb8+J+ORB@andrea
[2] https://lore.kernel.org/lkml/20230524-35efcabbbfd6a1ef83865fb4@orel
[3] https://lore.kernel.org/lkml/20240217131206.3667544-1-ericchancf@google.com
[4] https://lore.kernel.org/lkml/mhng-d92f84d8-03db-4fb1-93c3-0d5bfbe7a796@palmer-ri-x1c9a

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
