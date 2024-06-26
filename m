Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F90C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+4Tdu1TXHrE7KczuW9b32ogcoBElVvKKOcEvVgIM68=; b=Zby5zCdLMGh2mc
	Xl+JWu8oA2Y1tO+q+QdqOvhqw1dhcT0gsdgolATCiM9ZKrv1NFfaDm9dGEhxXcgHmiqNa0F4IxaHh
	kU/lRwHvvMpnCwsIv85z4h0wN4dSLAd0/JcN2JdW7uqwb0U+X8ySHyeP8CxfEyK/8D1Q/n92CqAx2
	SdmXH1hz7twpbdE7PUNOyVw8HKLYIpuXTPTDjnEC0s1J3wp7h5dzrgPNUf2DqPmi1k+jW1WQU9oEU
	5kjB9cW32Rg0QfZ4zZEEYz7x1alWYgIxmVQ2AKyHWoooqwKm6Er+PvIl2wiH5xzCaq1GJTLZbpm0R
	MgMyCZcOwr3eAOuMdsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSJg-00000006qKY-1SQn;
	Wed, 26 Jun 2024 13:04:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSJc-00000006qIp-3iB8
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:04:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A4C161A00;
	Wed, 26 Jun 2024 13:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FF3C2BD10;
	Wed, 26 Jun 2024 13:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719407036;
	bh=Uta7Ar4IuN68vM/aeq1mQnasHGnsAdafsPir9UrleIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pd/i5zHIn/AQu7DnXglDjXVDP9Kqs1JHUD2n7nhTlLi8yjm2IKz+JBZx+4Yr+VtVE
	 e7yHGcUPsRbgcbw2P9+0iAa3eQIuPxdxCvD4zQ0061JLX7KAItn2oMa+/oo7u6EDKu
	 InxF+MFcm1V/lYROQX9e8N+GxCkVpWhXIeDRiX1glTL0WRzxgq4B6Rtu/igGkMkHjJ
	 kKbqnRgp6CKAu2f9hX6M/ujgXDcLOn2TSFJ7iTZJAYpwPGfOf02rZC1mJD1CS20bqy
	 b3G+YD1AUQjI6Cbskf2xxrUstH05FMPGqFtukjg1/JATbW2sStWEYgcPcvdhb0UfS+
	 VYyYxbL50Koew==
Date: Wed, 26 Jun 2024 20:49:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Message-ID: <ZnwObmA70Bfx9yCn@xhacker>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <20240625040500.1788-3-jszhang@kernel.org>
 <acd2e53f-b5c1-49c5-86e2-bc09eb917163@app.fastmail.com>
 <ZnwKXWzRz9B5FbLM@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnwKXWzRz9B5FbLM@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_060401_378585_2DFB280E 
X-CRM114-Status: GOOD (  37.89  )
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

On Wed, Jun 26, 2024 at 08:32:38PM +0800, Jisheng Zhang wrote:
> On Tue, Jun 25, 2024 at 07:54:30AM +0200, Arnd Bergmann wrote:
> > On Tue, Jun 25, 2024, at 06:04, Jisheng Zhang wrote:
> > > I believe the output constraints "=m" is not necessary, because
> > > the instruction itself is "write", we don't need the compiler
> > > to "write" for us. So tell compiler we read from memory instead
> > > of writing.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > 
> > I think this is a bit too confusing: clearly there is no
> > read access from the __user pointer, so what you add in here
> > is not correct. There also needs to be a code comment about
> 
> Here is my understanding: the __put_user is implemented with
> sd(or its less wider variant, sw etc.), w/o considering the
> ex_table, the previous code can be simplified as below:
> 
> __asm__ __volatile__ (
> 	"sw	%z2, %1\n"
> 	: "+r" (err), "=m" (*(ptr))
> 	: "rJ" (__x));
> 
> Here ptr is really an input, just tells gcc where to store,
> And the "store" action is from the "sw" instruction, I don't
> need the gcc generates "store" instruction for me. so IMHO,
> there's no need to use output constraints here. so I changed
> it to
> 
> __asm__ __volatile__ (
> 	"sw	%z1, %2\n"
> 	: "+r" (err)
> 	: "rJ" (__x), "m"(*(ptr)));
> 
> The key here: is this correct?
> 
> 
> Here is the put_user piece code and comments from x86
> 
> /*
>  * Tell gcc we read from memory instead of writing: this is because
>  * we do not write to any memory gcc knows about, so there are no
>  * aliasing issues.
>  */
> #define __put_user_goto(x, addr, itype, ltype, label)                   \
>         asm goto("\n"                                                   \
>                 "1:     mov"itype" %0,%1\n"                             \
>                 _ASM_EXTABLE_UA(1b, %l2)                                \
>                 : : ltype(x), "m" (__m(addr))                           \
>                 : : label)

Here is the simplified put_user piece code of arm64:

#define __put_mem_asm(store, reg, x, addr, err, type)                   \
        asm volatile(                                                   \
        "1:     " store "       " reg "1, [%2]\n"                       \
        "2:\n"                                                          \
        _ASM_EXTABLE_##type##ACCESS_ERR(1b, 2b, %w0)                    \
        : "+r" (err)                                                    \
        : "rZ" (x), "r" (addr))

no output constraints either. It just uses "r" input constraints to tell
gcc to read the store address into one proper GP reg.

> 
> 
> As can be seen, x86 also doesn't put the (addr) in output constraints,
> I think x86 version did similar modification in history, but when I tried
> to searh the git history, the comment is there from the git first day.
> 
> Any hint or suggestion is appreciated!
> 
> > why you do it this way, as it's not clear that this is
> > a workaround for old compilers without
> > CONFIG_CC_HAS_ASM_GOTO_OUTPUT.
> > 
> > > index 09d4ca37522c..84b084e388a7 100644
> > > --- a/arch/riscv/include/asm/uaccess.h
> > > +++ b/arch/riscv/include/asm/uaccess.h
> > > @@ -186,11 +186,11 @@ do {								\
> > >  	__typeof__(*(ptr)) __x = x;				\
> > >  	__asm__ __volatile__ (					\
> > >  		"1:\n"						\
> > > -		"	" insn " %z2, %1\n"			\
> > > +		"	" insn " %z1, %2\n"			\
> > >  		"2:\n"						\
> > >  		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
> > > -		: "+r" (err), "=m" (*(ptr))			\
> > > -		: "rJ" (__x));					\
> > > +		: "+r" (err)			\
> > > +		: "rJ" (__x), "m"(*(ptr)));					\
> > >  } while (0)
> > > 
> > 
> > I suspect this could just be a "r" constraint instead of
> > "m", treating the __user pointer as a plain integer.
> 
> I tried "r", the generated code is not as good as "m"
> 
> for example
> __put_user(0x12, &frame->uc.uc_flags);
> 
> with "m", the generated code will be
> 
> ...
> csrs    sstatus,a5
> li      a4,18
> sd      a4,128(s1)
> csrc    sstatus,a5
> ...
> 
> 
> with "r", the generated code will be
> 
> ...
> csrs    sstatus,a5
> li      a4,18
> addi    s1,s1,128
> sd      a4,0(s1)
> csrc    sstatus,a5
> ...
> 
> As can be seen, "m" can make use of the 'offset' of
> sd, so save one instruction.
> 
> > 
> > For kernel pointers, using "m" and "=m" constraints
> > correctly is necessary since gcc will often access the
> > same data from C code as well. For __user pointers, we
> > can probably get away without it since no C code is
> > ever allowed to just dereference them. If you do that,
> > you may want to have the same thing in the __get_user
> > side.
> > 
> >       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
