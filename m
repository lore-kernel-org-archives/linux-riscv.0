Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0362DC30653
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDnSUGcBYP60U/fV7GFUgX/PPhMHp5qpnHLlLWxbWNA=; b=QGamAzv8dAd1Xo
	Ck9HoOmkca2YMbQ2c7wURflZIb7yLtuLjcxa3WbOXUfdLXY9aO7H92Iurl+4NPlOXZEJbcSacDa5E
	0Rpm2M03/7lB0K22Uj2bopRcnhLPjb0JJleNc76uFFap/yrZQ+sdcLykWTBImeU75tgAMGeNujj1p
	sLsR7x3znrCfaQnwWNogDMnKwXEOtP5beyKs84w0YXfGYKFdfplvL+EZXXK5MDkdTbrOPraDJ6akD
	oFYgguVJwrtdUNEncD0DXf6dy/b3g8EJ+VWUcML1gGPBnnjIQD0qeDcHreMGPxqlaXNBJGMNw9al7
	a0Vgyra+3V9WVOABY36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMS2p-00000006nZI-1tX9;
	Wed, 26 Jun 2024 12:46:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMS2m-00000006nY8-45dw
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 12:46:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFCE6619EE;
	Wed, 26 Jun 2024 12:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2260AC2BD10;
	Wed, 26 Jun 2024 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719405995;
	bh=yBRxGCyHhvuJu8ZihGw7xHj2l5Wg5TZnqQXWyklINCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bk9zdNnisf8YhqaofsuWXspKWLaZ42QsKYZZ399+nxPkeJCsGr8BRFYjxT3MRweEb
	 a4ckROL2LUpSOkH+ZD7F5ffOLulmU9d3rNcDOS4a7rOsq9MNCrclCoq0kMB8o+oJJB
	 v/K0r6sn7s8UtlKpro3KPQIkW+mlvbxxxH9N9Bs92m9oDtoJqsPb8mfddtxRdbgmUF
	 vqGTGcN+21rps4Z4r8/yTr4+KmEbwwBxc96hJ/oKV8+q4RsCncR5T5z/zap78sHPss
	 uFf/CMztZJZC1Ce+SY5DWxqR5IrsDVLCzQ4vDAbpHDaUZdVqxIKhi6FhjF3cqBMCWP
	 dWJU1RGH5XIXA==
Date: Wed, 26 Jun 2024 20:32:29 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Message-ID: <ZnwKXWzRz9B5FbLM@xhacker>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <20240625040500.1788-3-jszhang@kernel.org>
 <acd2e53f-b5c1-49c5-86e2-bc09eb917163@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acd2e53f-b5c1-49c5-86e2-bc09eb917163@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_054637_191987_E6415E0F 
X-CRM114-Status: GOOD (  29.60  )
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

On Tue, Jun 25, 2024 at 07:54:30AM +0200, Arnd Bergmann wrote:
> On Tue, Jun 25, 2024, at 06:04, Jisheng Zhang wrote:
> > I believe the output constraints "=m" is not necessary, because
> > the instruction itself is "write", we don't need the compiler
> > to "write" for us. So tell compiler we read from memory instead
> > of writing.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> I think this is a bit too confusing: clearly there is no
> read access from the __user pointer, so what you add in here
> is not correct. There also needs to be a code comment about

Here is my understanding: the __put_user is implemented with
sd(or its less wider variant, sw etc.), w/o considering the
ex_table, the previous code can be simplified as below:

__asm__ __volatile__ (
	"sw	%z2, %1\n"
	: "+r" (err), "=m" (*(ptr))
	: "rJ" (__x));

Here ptr is really an input, just tells gcc where to store,
And the "store" action is from the "sw" instruction, I don't
need the gcc generates "store" instruction for me. so IMHO,
there's no need to use output constraints here. so I changed
it to

__asm__ __volatile__ (
	"sw	%z1, %2\n"
	: "+r" (err)
	: "rJ" (__x), "m"(*(ptr)));

The key here: is this correct?


Here is the put_user piece code and comments from x86

/*
 * Tell gcc we read from memory instead of writing: this is because
 * we do not write to any memory gcc knows about, so there are no
 * aliasing issues.
 */
#define __put_user_goto(x, addr, itype, ltype, label)                   \
        asm goto("\n"                                                   \
                "1:     mov"itype" %0,%1\n"                             \
                _ASM_EXTABLE_UA(1b, %l2)                                \
                : : ltype(x), "m" (__m(addr))                           \
                : : label)


As can be seen, x86 also doesn't put the (addr) in output constraints,
I think x86 version did similar modification in history, but when I tried
to searh the git history, the comment is there from the git first day.

Any hint or suggestion is appreciated!

> why you do it this way, as it's not clear that this is
> a workaround for old compilers without
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT.
> 
> > index 09d4ca37522c..84b084e388a7 100644
> > --- a/arch/riscv/include/asm/uaccess.h
> > +++ b/arch/riscv/include/asm/uaccess.h
> > @@ -186,11 +186,11 @@ do {								\
> >  	__typeof__(*(ptr)) __x = x;				\
> >  	__asm__ __volatile__ (					\
> >  		"1:\n"						\
> > -		"	" insn " %z2, %1\n"			\
> > +		"	" insn " %z1, %2\n"			\
> >  		"2:\n"						\
> >  		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
> > -		: "+r" (err), "=m" (*(ptr))			\
> > -		: "rJ" (__x));					\
> > +		: "+r" (err)			\
> > +		: "rJ" (__x), "m"(*(ptr)));					\
> >  } while (0)
> > 
> 
> I suspect this could just be a "r" constraint instead of
> "m", treating the __user pointer as a plain integer.

I tried "r", the generated code is not as good as "m"

for example
__put_user(0x12, &frame->uc.uc_flags);

with "m", the generated code will be

...
csrs    sstatus,a5
li      a4,18
sd      a4,128(s1)
csrc    sstatus,a5
...


with "r", the generated code will be

...
csrs    sstatus,a5
li      a4,18
addi    s1,s1,128
sd      a4,0(s1)
csrc    sstatus,a5
...

As can be seen, "m" can make use of the 'offset' of
sd, so save one instruction.

> 
> For kernel pointers, using "m" and "=m" constraints
> correctly is necessary since gcc will often access the
> same data from C code as well. For __user pointers, we
> can probably get away without it since no C code is
> ever allowed to just dereference them. If you do that,
> you may want to have the same thing in the __get_user
> side.
> 
>       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
