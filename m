Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609CBC54E5D
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Mar 2024 17:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOPLw0WuI7sML2aPzuGkFuYeB95U7O5CDChTA3BwLnA=; b=dOXWornFHyTQcV
	uj+2fsSzwSaz5g7GwJzF/vNKjb/7QSghkndAPn7jCQGxKdCiKQXqxZNBIl84qp0vZqDcE7DD1zsh+
	Cee0mlUl9V50EoQ8+i2YI2uXsepC1In5ZYiw5prY61pD9eckm6LXYLjuq1B5a76oUyw9VdNonwtpt
	s0mO8jeD5fuaAt9guPB3BG+uz9L9V2SDGvs0f/qNCR6dEr5aMYfOm+AcmLpiEcarzfGcvxNYs8CEf
	Uylxr9rBk30kV0o3Y7XF8ngWNjyJU8TNCaF9SgaDSd3xe1zX7zz1UxHlcEep8vKJeIyVRyAAGASOp
	shx4Q5RRr/h5a017N0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlXfE-00000003YLI-0TYK;
	Sat, 16 Mar 2024 17:17:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlXfA-00000003YIL-2mtV
	for linux-riscv@lists.infradead.org;
	Sat, 16 Mar 2024 17:17:43 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a3122b70439so380633966b.3
        for <linux-riscv@lists.infradead.org>; Sat, 16 Mar 2024 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710609457; x=1711214257; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKgxw6/2ddEQ89H8+Mq1Elgai7DWJv30Mn+eMDkhrL4=;
        b=h5G7+9LHYVq1IetElZpB1k/SaiOaZyWNSOHnGFbdvcCay7fkaSd/nMXFaNLIuC+cR8
         40TNlJOPuoHd+8pjjWDZPTRKhkcXztcUqX5t5v/CJgo3GP4vIau74inGeIA3LbpT3YDn
         57dlyyvbXNJnbd/mQoEuI1/pu38HCIQglqPrl3PYwAMC6Uwb5Z41dyBFdnup+K1KmzyF
         OPYmpM9UgzEuFMlFNfLLy9Cdl2tsdZuq1HNNDqaljcDuYDWz/1MpRQ7VWs1OFQmADwAa
         4Tu9L5i58Qr0J4xLJf94zP0/5PlLpTwKJknmVWR8sE5BGgUSED7xfeCHhWrgfVq9LdIf
         w65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710609457; x=1711214257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKgxw6/2ddEQ89H8+Mq1Elgai7DWJv30Mn+eMDkhrL4=;
        b=UQ/kd28UBs4UtSJo/vPDgdQr7I9N0dd2TFmxIiF5BPQYuZWwJ0qH1H2EKBuydDUMut
         x871eHxenrW6kyWrU5gHruWaGnNdL9nVvag+SXssi3CZ4Mfq2VyZbKa8NEXytHWnjtBG
         UTjFo8NPj7o0mX09j3BqAS+GfupXD936/+E3WIrAKsSlJg1Es7wuD1PZZXumU74DsQc3
         F1K8meB1uFCpAx9hCRbrXMY0iveD0h8fwCfCeeaDA/TEKYGc6PoJnoRtsQxHpeV0HSlv
         ru0AgVv1WrWPZNYyYt9UJpxiUdT1a9qNFH8pTVgZvSMR7gwk+Y/xILXQKBqcPmUBLabh
         ECsw==
X-Gm-Message-State: AOJu0YzEOMamGAuKRC29iM9JJZWNBlYBwulQ4dy/ZIsmdAnFROEw3K9v
	eqI2hw4ZNLyk3GCsyfc5G6jaHhdHWjeLvyAHAujs1sTdypmsSSUpv+KUcv5g1cE=
X-Google-Smtp-Source: AGHT+IF6OO/ldRMYgC1gaiWyGTCUyi8O4rOlkGReNmCRnXS5+i298XzM/9PKkijZ25mzjtXDdOAk1Q==
X-Received: by 2002:a17:906:4a0b:b0:a46:4e73:9c67 with SMTP id w11-20020a1709064a0b00b00a464e739c67mr4950682eju.68.1710609456322;
        Sat, 16 Mar 2024 10:17:36 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e25-20020a170906845900b00a4652efd795sm2951998ejy.83.2024.03.16.10.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 10:17:35 -0700 (PDT)
Date: Sat, 16 Mar 2024 18:17:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, anup@brainfault.org, atishp@atishpatra.org, 
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com, David.Laight@aculab.com, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/5] riscv: Add Zawrs support for spinlocks
Message-ID: <20240316-f4304327a56993561a4721f1@orel>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
 <20240315134009.580167-8-ajones@ventanamicro.com>
 <ZfWEN2PXxDC4waE/@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZfWEN2PXxDC4waE/@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_101740_886225_665EC105 
X-CRM114-Status: GOOD (  41.82  )
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


Hi Andrea,

I actually just forgot to re-review the thread and make changes... I
grabbed the patch and then focused on experimenting and testing it's
impact on guests. I guess I should have started with applying the thread
comments, because I ended up forgetting to return to them before
posting...

On Sat, Mar 16, 2024 at 12:36:23PM +0100, Andrea Parri wrote:
> > +config RISCV_ISA_ZAWRS
> > +	bool "Zawrs extension support for more efficient busy waiting"
> > +	depends on RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Enable the use of the Zawrs (wait for reservation set) extension
> > +	   when available.
> > +
> > +	   The Zawrs extension instructions (wrs.nto and wrs.sto) are used for
> > +	   more efficient busy waiting.
> 
> Maybe mention that this is about _power_-efficiency?  In the discussion
> of the previous iteration, I suggested [1]:
> 
>   The Zawrs extension defines a pair of instructions to be used in
>   polling loops that allows a core to enter a low-power state and
>   wait on a store to a memory location.
> 
> (from the Zawrs spec  -- I remain open to review other suggestiongs).

Sounds good to me. I'll make a change like that for v2.

> 
> 
> > +#define ZAWRS_WRS_NTO	".long 0x00d00073"
> > +#define ZAWRS_WRS_STO	".long 0x01d00073"
> 
> In the discussion of the previous iteration, you observed [2]:
> 
>   I'd prefer we use insn-def.h to define instructions, rather than
>   scatter .long's around, but since this instruction doesn't have
>   any inputs, then I guess it's not so important to use insn-def.h.
> 
> So that "preference" doesn't apply to the instructions at stake?  Or is
> not "important"?  No real objections to barrier.h, trying to understand
> the rationale.

Besides having simply forgotten to address my own comment, in this case I
can live with the .long since we're at least not hard coding an operand
register. However, since I prefer '.4byte', I'll change to that.

> 
> 
> > +#define ALT_WRS_NTO()							\
> > +	__asm__ __volatile__ (ALTERNATIVE(				\
> > +		"nop\n", ZAWRS_WRS_NTO "\n",				\
> > +		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
> > +#define ALT_WRS_STO()							\
> > +	__asm__ __volatile__ (ALTERNATIVE(				\
> > +		"nop\n", ZAWRS_WRS_STO "\n",				\
> > +		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
> > +
> >  #define RISCV_FENCE(p, s) \
> >  	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
> 
> FYI, this hunk/patch conflicts with Eric's changes [3].

Thanks, I had mentally noted that series as a possible conflict, but
then forgot to try basing on it to see if it would be a problem.

> 
> 
> > +#define ___smp_load_reservedN(attr, ptr)				\
> > +({									\
> > +	typeof(*ptr) ___p1;						\
> > +									\
> > +	__asm__ __volatile__ ("lr." attr "       %[p], %[c]\n"		\
> > +			      : [p]"=&r" (___p1), [c]"+A"(*ptr));	\
> > +	___p1;								\
> > +})
> > +
> > +#define __smp_load_reserved_relaxed(ptr)				\
> > +({									\
> > +	typeof(*ptr) ___p1;						\
> > +									\
> > +	if (sizeof(*ptr) == sizeof(int))				\
> > +		___p1 = ___smp_load_reservedN("w", ptr);		\
> > +	else if (sizeof(*ptr) == sizeof(long))				\
> > +		___p1 = ___smp_load_reservedN("d", ptr);		\
> > +	else								\
> > +		compiletime_assert(0,					\
> > +		"Need type compatible with LR/SC instructions for "	\
> > +		__stringify(ptr));					\
> > +	___p1;								\
> > +})
> 
> In the discussion of the previous iteration, you observed [2]:
> 
>   It's more common to use a switch for these things, [...] something
>   like the macros in arch/riscv/include/asm/cmpxchg.h.  Can we stick
>   with that pattern?
> 
> Along the same lines (#codingstyle), notice that ___smp_load_reservedN()
> would become one of the first uses of the asmSymbolicName syntax in the
> arch/riscv/ directory.
> 
> So again, why not stick to the common style? something's wrong with it?

For v2, I'll switch to the style that I recommended :-)

> 
> 
> > +#define smp_cond_load_relaxed(ptr, cond_expr)				\
> > +({									\
> > +	typeof(ptr) __PTR = (ptr);					\
> > +	__unqual_scalar_typeof(*ptr) VAL;				\
> > +									\
> > +	VAL = READ_ONCE(*__PTR);					\
> > +	if (!cond_expr) {						\
> > +		for (;;) {						\
> > +			VAL = __smp_load_reserved_relaxed(__PTR);	\
> > +			if (cond_expr)					\
> > +				break;					\
> > +			ALT_WRS_STO();					\
> > +		}							\
> > +	}								\
> > +	(typeof(*ptr))VAL;						\
> > +})
> > +
> > +#define smp_cond_load_acquire(ptr, cond_expr)				\
> > +({									\
> > +	typeof(ptr) __PTR = (ptr);					\
> > +	__unqual_scalar_typeof(*ptr) VAL;				\
> > +									\
> > +	VAL = smp_load_acquire(__PTR);					\
> > +	if (!cond_expr) {						\
> > +		for (;;) {						\
> > +			VAL = __smp_load_reserved_acquire(__PTR);	\
> > +			if (cond_expr)					\
> > +				break;					\
> > +			ALT_WRS_STO();					\
> > +		}							\
> > +	}								\
> > +	(typeof(*ptr))VAL;						\
> > +})
> 
> In the discussion of the previous iteration, you observed [2]:
> 
>   I guess this peeling off of the first iteration is because it's
>   expected that the load generated by READ_ONCE() is more efficient
>   than lr.w/d?  If we're worried about unnecessary use of lr.w/d,
>   then shouldn't we look for a solution that doesn't issue those
>   instructions when we don't have the Zawrs extension?
> 
> To which Palmer replied (apparently, agreeing with your remarks) [4]:
> 
>   I haven't looked at the patch, but I'd expect we NOP out the
>   whole LR/WRS sequence?  I don't remember any reason to have the
>   load reservation without the WRS,  [...]

For v2, I'll look closer at this to decide what to do.

> 
> Unfortunately, this submission makes no mention to those comments and,
> more importantly, to the considerations/tradeoffs which have led you
> to submit different changes.  In submitting-patches.rst's words,
> 
>   Review comments or questions that do not lead to a code change
>   should almost certainly bring about a comment or changelog entry
>   so that the next reviewer better understands what is going on.

Eh, there's nothing mysterious going on here. It was just me being
forgetful... And, I even forgot to write a changelog entry explaining
that I forgot :-)

> 
>   Andrea
> 
> P.S. BTW, not too far from the previous recommendation/paragraph is:
> 
>   When sending a next version, [...]  Notify people that commented
>   on your patch about new versions by adding them to the patches CC
>   list.

Yeah, had I returned to the old thread for the re-review, I would have
seen your comments again and then remembered to CC you.

Thanks,
drew

> 
> [1] https://lore.kernel.org/lkml/ZTE7eUyrb8+J+ORB@andrea
> [2] https://lore.kernel.org/lkml/20230524-35efcabbbfd6a1ef83865fb4@orel
> [3] https://lore.kernel.org/lkml/20240217131206.3667544-1-ericchancf@google.com
> [4] https://lore.kernel.org/lkml/mhng-d92f84d8-03db-4fb1-93c3-0d5bfbe7a796@palmer-ri-x1c9a

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
