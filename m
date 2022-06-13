Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2878FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 20:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrtYU5ESsvo7Sm/wpeFxoGHNXa66Td9Bt/rJy2EoRSU=; b=tqa13ogW7Cn6Xl
	TbnsCR84mw5hslnk3RHXK3UW+6SmuG5ID3wwTO45pdx/fXVhevYQaYPCokV02LgQGITmD1eg9PoTL
	N3goW2y7kv2ReQO3nA7999ZY3Cm93h1OKuVtLpFC7KEP9Fy2tK7X95sYFj+bZ3WI8QTaiUsKsfcDW
	2aStNJOUbFrNHJQXpvQBYmTI95SPeGnSsGOUTCVhsmT0bx7HJFYegE5KW4zPtXeBtkkedHUlhLk1S
	RBZQNWUdIec48lCm3byu5QJn5m850ZCWzr4KyUJIhUeRUWP0s77SglFZZyyLQjP6TLRWipDYp+sQh
	1h+wNsn0UGg3SML5CHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qjV-005fl7-N8; Mon, 13 Jun 2022 20:32:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qdh-005d7z-UR
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 20:26:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9748C60B4A;
	Mon, 13 Jun 2022 20:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DE5C3411F;
	Mon, 13 Jun 2022 20:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655151980;
	bh=7Jrg9tuqGHw4ta7aGW741BHtoMi+5FEfHRShEJ6GnTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrCj6Br1YGXni35gDMsHp7Ju9c/0fAKL/CrFxcvhyZGI5OWSPU7AlGI3SHYJcMfMA
	 GTONfmmpaXx6gCHYmCEcUUAYOvH4ihiHxRO8li5UKaFAx2rgW1eu0HCNllrLX5DvuX
	 46hI7ZIKM+FrN8QAnwwuoEh7dv+J+CVMzuIN7csuIqxN6aqlofvV3hyyO95BDg3pS6
	 9VyH6HGqivVYKZVI2dxoGm6K3FWdHsf4J0yGzNez+GQZ06siLHw1g3f4wZKesjGQ6/
	 1o0Qni5yu+rLDwpf2kR4sZp39Vi55RLhm3dnJ18wKdeprvMD4cXm7R18wABRl9pMbs
	 BJgv+pMyCwyVw==
Date: Mon, 13 Jun 2022 13:26:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH] riscv: Fix ALT_THEAD_PMA's asm parameters
Message-ID: <YqedafxlnoXauefj@dev-arch.thelio-3990X>
References: <20220518184529.454008-1-nathan@kernel.org>
 <Yo7opc/A8ITue0/4@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yo7opc/A8ITue0/4@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_132622_109182_114E96E3 
X-CRM114-Status: GOOD (  29.53  )
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

On Wed, May 25, 2022 at 07:40:37PM -0700, Nathan Chancellor wrote:
> Small ping on this and https://lore.kernel.org/20220516214520.3252074-1-nathan@kernel.org/.
> 
> Our builds on -next have been broken for a week now. Hopefully these can
> make the first RISC-V pull request to avoid mainline being broken in the
> same fashion.

One more small ping. The patch linked above made it into 5.19-rc1 but
this one has not been applied so our builds are still broken.

Cheers,
Nathan

> On Wed, May 18, 2022 at 11:45:29AM -0700, Nathan Chancellor wrote:
> > After commit a35707c3d850 ("riscv: add memory-type errata for T-Head"),
> > builds with LLVM's integrated assembler fail like:
> > 
> >   In file included from arch/riscv/kernel/asm-offsets.c:10:
> >   In file included from ./include/linux/mm.h:29:
> >   In file included from ./include/linux/pgtable.h:6:
> >   In file included from ./arch/riscv/include/asm/pgtable.h:114:
> >   ./arch/riscv/include/asm/pgtable-64.h:210:2: error: invalid input constraint '0' in asm
> >           ALT_THEAD_PMA(prot_val);
> >           ^
> >   ./arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
> >           : "0"(_val),                                                    \
> >             ^
> > 
> > This was reported upstream to LLVM where Jessica pointed out a couple of
> > issues with the existing implementation of ALT_THEAD_PMA:
> > 
> > * t3 is modified but not listed in the clobbers list.
> > 
> > * "+r"(_val) marks _val as both an input and output of the asm but then
> >   "0"(_val) marks _val as an input matching constraint, which does not
> >   make much sense in this situation, as %1 is not actually used in the
> >   asm and matching constraints are designed to be used for different
> >   inputs that need to use the same register.
> > 
> > Drop the matching contraint and shift all the operands by one, as %1 is
> > unused, and mark t3 as clobbered. This resolves the build error and goes
> > not cause any problems with GNU as.
> > 
> > Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1641
> > Link: https://github.com/llvm/llvm-project/issues/55514
> > Link: https://gcc.gnu.org/onlinedocs/gcc/Simple-Constraints.html
> > Suggested-by: Jessica Clarke <jrtc27@jrtc27.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  arch/riscv/include/asm/errata_list.h | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> > index 9e2888dbb5b1..416ead0f9a65 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -75,20 +75,20 @@ asm volatile(ALTERNATIVE(						\
> >  	"nop\n\t"							\
> >  	"nop\n\t"							\
> >  	"nop",								\
> > -	"li      t3, %2\n\t"						\
> > -	"slli    t3, t3, %4\n\t"					\
> > +	"li      t3, %1\n\t"						\
> > +	"slli    t3, t3, %3\n\t"					\
> >  	"and     t3, %0, t3\n\t"					\
> >  	"bne     t3, zero, 2f\n\t"					\
> > -	"li      t3, %3\n\t"						\
> > -	"slli    t3, t3, %4\n\t"					\
> > +	"li      t3, %2\n\t"						\
> > +	"slli    t3, t3, %3\n\t"					\
> >  	"or      %0, %0, t3\n\t"					\
> >  	"2:",  THEAD_VENDOR_ID,						\
> >  		ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)		\
> >  	: "+r"(_val)							\
> > -	: "0"(_val),							\
> > -	  "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
> > +	: "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
> >  	  "I"(_PAGE_PMA_THEAD >> ALT_THEAD_PBMT_SHIFT),			\
> > -	  "I"(ALT_THEAD_PBMT_SHIFT))
> > +	  "I"(ALT_THEAD_PBMT_SHIFT)					\
> > +	: "t3")
> >  #else
> >  #define ALT_THEAD_PMA(_val)
> >  #endif
> > 
> > base-commit: 93c0651617a62a69717299f1464dda798af8bebb
> > -- 
> > 2.36.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
