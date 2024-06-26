Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A814C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBjcVA6BS1/Pbjb8BHPPISR7hOxaqaa6zds+89MMBNU=; b=GpeBl8jOY7YJYW
	1auXdXUFIhBh98e4Nzv9mF0a+xN/kQ5zCe+r9HzoJKdWkaRuun6u2N04bdw3/iaGbqTThpa8u7pZR
	Y6HVh95Da6dUgp0mzX7x6LtDpJxGeqlL8S+dkYClGsZWRM6db+jiZ2WZv3b5kgcypUaCoOqgaeqhT
	6KarNSOgaY3DIqXiN2wf/TETIemKoKxmKmTY2wyinLaTCMlZEqDNHibHZOtmpIx0ANP/fC7jxz2Yn
	hndqsWIKwrLxotT/jGBN1XVpvD9+AzJXWS6Dz7ppayZcSngPo6rbpKUIKmK2+4XwS5Y94qHwgTLaw
	puvL2pqjMuZxEj1zgAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSlf-00000006ymM-09fq;
	Wed, 26 Jun 2024 13:32:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSlZ-00000006yiQ-2o37
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6CA1CE21B8;
	Wed, 26 Jun 2024 13:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA85C2BD10;
	Wed, 26 Jun 2024 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719408760;
	bh=BpC4jkRO/Y4dva9jy2LNSSoyaFURbYQjZeqc2cVtz0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f4fRYrbwf1JT5YZst1PiAi4aFzq22Q10NLheMwylJUhz8LLva7P4Bpi+kywhJYXEt
	 RNLKDvyL1TZTvSIsQLImQo1uEkeHfZHbiLKYXYL1BcZ/phfTW2Wa/cPeJG/qI2BwSM
	 UtDfChLs+W09T/UjLqPD2xIZamMQy8JNF5c2szq9PfN433dsIGAOOsrulb+GPIPhmW
	 gseBbYOQ2uFIGizssSl38u7UCrGhVKB7Bd1FEGA/mC3j/bFwcJEho0QaXYIy3AGVKu
	 nf6Sna6aiAlnUZm6Si+We7A3BbVPN5ThytXCD0+2v+QtCbdRrRzyowKZp3igLB2lJJ
	 p6tgEk9LWOI/Q==
Date: Wed, 26 Jun 2024 21:18:34 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Message-ID: <ZnwVKs3vI9Zrtvb-@xhacker>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <20240625040500.1788-3-jszhang@kernel.org>
 <acd2e53f-b5c1-49c5-86e2-bc09eb917163@app.fastmail.com>
 <ZnwKXWzRz9B5FbLM@xhacker>
 <ZnwObmA70Bfx9yCn@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnwObmA70Bfx9yCn@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_063254_561701_5FCF1529 
X-CRM114-Status: GOOD (  42.71  )
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

On Wed, Jun 26, 2024 at 08:49:59PM +0800, Jisheng Zhang wrote:
> On Wed, Jun 26, 2024 at 08:32:38PM +0800, Jisheng Zhang wrote:
> > On Tue, Jun 25, 2024 at 07:54:30AM +0200, Arnd Bergmann wrote:
> > > On Tue, Jun 25, 2024, at 06:04, Jisheng Zhang wrote:
> > > > I believe the output constraints "=m" is not necessary, because
> > > > the instruction itself is "write", we don't need the compiler
> > > > to "write" for us. So tell compiler we read from memory instead
> > > > of writing.
> > > >
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > 
> > > I think this is a bit too confusing: clearly there is no
> > > read access from the __user pointer, so what you add in here
> > > is not correct. There also needs to be a code comment about
> > 
> > Here is my understanding: the __put_user is implemented with
> > sd(or its less wider variant, sw etc.), w/o considering the
> > ex_table, the previous code can be simplified as below:
> > 
> > __asm__ __volatile__ (
> > 	"sw	%z2, %1\n"
> > 	: "+r" (err), "=m" (*(ptr))
> > 	: "rJ" (__x));
> > 
> > Here ptr is really an input, just tells gcc where to store,
> > And the "store" action is from the "sw" instruction, I don't
> > need the gcc generates "store" instruction for me. so IMHO,
> > there's no need to use output constraints here. so I changed
> > it to
> > 
> > __asm__ __volatile__ (
> > 	"sw	%z1, %2\n"
> > 	: "+r" (err)
> > 	: "rJ" (__x), "m"(*(ptr)));
> > 
> > The key here: is this correct?
> > 
> > 
> > Here is the put_user piece code and comments from x86
> > 
> > /*
> >  * Tell gcc we read from memory instead of writing: this is because
> >  * we do not write to any memory gcc knows about, so there are no
> >  * aliasing issues.
> >  */
> > #define __put_user_goto(x, addr, itype, ltype, label)                   \
> >         asm goto("\n"                                                   \
> >                 "1:     mov"itype" %0,%1\n"                             \
> >                 _ASM_EXTABLE_UA(1b, %l2)                                \
> >                 : : ltype(x), "m" (__m(addr))                           \
> >                 : : label)
> 
> Here is the simplified put_user piece code of arm64:
> 
> #define __put_mem_asm(store, reg, x, addr, err, type)                   \
>         asm volatile(                                                   \
>         "1:     " store "       " reg "1, [%2]\n"                       \
>         "2:\n"                                                          \
>         _ASM_EXTABLE_##type##ACCESS_ERR(1b, 2b, %w0)                    \
>         : "+r" (err)                                                    \
>         : "rZ" (x), "r" (addr))
> 
> no output constraints either. It just uses "r" input constraints to tell

make it accurate: by this I mean the "addr" of __put_user() isn't
in the output constraints.

> gcc to read the store address into one proper GP reg.
> 
> > 
> > 
> > As can be seen, x86 also doesn't put the (addr) in output constraints,
> > I think x86 version did similar modification in history, but when I tried
> > to searh the git history, the comment is there from the git first day.
> > 
> > Any hint or suggestion is appreciated!
> > 
> > > why you do it this way, as it's not clear that this is
> > > a workaround for old compilers without
> > > CONFIG_CC_HAS_ASM_GOTO_OUTPUT.
> > > 
> > > > index 09d4ca37522c..84b084e388a7 100644
> > > > --- a/arch/riscv/include/asm/uaccess.h
> > > > +++ b/arch/riscv/include/asm/uaccess.h
> > > > @@ -186,11 +186,11 @@ do {								\
> > > >  	__typeof__(*(ptr)) __x = x;				\
> > > >  	__asm__ __volatile__ (					\
> > > >  		"1:\n"						\
> > > > -		"	" insn " %z2, %1\n"			\
> > > > +		"	" insn " %z1, %2\n"			\
> > > >  		"2:\n"						\
> > > >  		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
> > > > -		: "+r" (err), "=m" (*(ptr))			\
> > > > -		: "rJ" (__x));					\
> > > > +		: "+r" (err)			\
> > > > +		: "rJ" (__x), "m"(*(ptr)));					\
> > > >  } while (0)
> > > > 
> > > 
> > > I suspect this could just be a "r" constraint instead of
> > > "m", treating the __user pointer as a plain integer.
> > 
> > I tried "r", the generated code is not as good as "m"
> > 
> > for example
> > __put_user(0x12, &frame->uc.uc_flags);
> > 
> > with "m", the generated code will be
> > 
> > ...
> > csrs    sstatus,a5
> > li      a4,18
> > sd      a4,128(s1)
> > csrc    sstatus,a5
> > ...
> > 
> > 
> > with "r", the generated code will be
> > 
> > ...
> > csrs    sstatus,a5
> > li      a4,18
> > addi    s1,s1,128
> > sd      a4,0(s1)
> > csrc    sstatus,a5
> > ...
> > 
> > As can be seen, "m" can make use of the 'offset' of
> > sd, so save one instruction.
> > 
> > > 
> > > For kernel pointers, using "m" and "=m" constraints
> > > correctly is necessary since gcc will often access the
> > > same data from C code as well. For __user pointers, we
> > > can probably get away without it since no C code is
> > > ever allowed to just dereference them. If you do that,
> > > you may want to have the same thing in the __get_user
> > > side.
> > > 
> > >       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
