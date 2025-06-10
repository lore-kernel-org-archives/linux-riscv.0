Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767BBC5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKff+1ZRC2UaH3I3XfjqRfh6EW5bkjboBgVawZycQvU=; b=x44M1LTiDBx0dj
	yxKy1LQZ/HFjn4WWbedMlNlhUwqIhEMN3osevMb0+f5Dc6YF9yTRodRhK1EgBMEm08tU3Q6tg5qd+
	vJ7XesoQ1GU/Jc0yPSGdy+cCSiO3QIktVSvjbEPBDtFUUVGhNfHeTUIh9E5xXuHARDYYGCJvGK6HD
	vRptVbk3qd0LA56N7uFf8q0sihhXSPAJTjDyn4leub6Ahhfu6rNYONysqzV12ZvP5Vj8WW1IZ0qH6
	dEv/dX+I36YzWWYUMHFhRBDpPG1mck4ECf/fXiuP6ab2T5V7AxJeYmiyGptXQFVXryZfMpxuoD70A
	AWXhEKtJXyf/EBQyLGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOt8z-00000005zwW-3Q0d;
	Tue, 10 Jun 2025 07:11:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOt8x-00000005zuY-1ISO
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 07:11:36 +0000
Date: Tue, 10 Jun 2025 09:11:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749539492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjKNx+UqOSaW/5Z0xhucrewFq9jqNFu8JVC4O9AKh2c=;
	b=U6rRYD6AqSUxdFmZJx8Tek5zKRMLScgYkIAAhOI4gej/rUUneRdhYEm2gte7qoYYNnRSAe
	TijkiYOJu3BCQThdooxNSVGAC9PvUGETI9AWhMRWr1n2P7BaoHERpkgoCQQ1nloJiuT8tc
	jXlgemqO9hcH0EulyUmJXsf0aF8me6rgiZsqhabaVYOU8j73vNgW4yzuDY/Ft02HVSF+uE
	Noz+mvBY5eg8j8/3uOZw4nYXS1BxAt5+NDcmQiKjKpJsNXjJOEmtZjDZCuIs/+fkhIIO/A
	7qfvJjj0y/nLVaBf8IPuGz0TjTV0Nz+S/6Y781qdU0I+0SXXZctMTf9cEfbfMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749539492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjKNx+UqOSaW/5Z0xhucrewFq9jqNFu8JVC4O9AKh2c=;
	b=Xwt91q1FEe8Of8Xgs0LlFlfiuxflDP2u5NAryYIVJCD2Db2rcbdWoZnGIFn6Bh3AQVNY8V
	CJ4qs5aEU16IG5Dw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Vineet Gupta <vineetg@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the getrandom syscall wrapper
Message-ID: <20250610090648-c6d4e08a-3efa-4c19-9a03-d04a65d18af2@linutronix.de>
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
 <20250606092443.73650-2-xry111@xry111.site>
 <94f9af73-0b2d-484c-ba1d-d4435908336b@rivosinc.com>
 <6163d55a1e7910f89dda114a2ee52c9df5235dad.camel@xry111.site>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6163d55a1e7910f89dda114a2ee52c9df5235dad.camel@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_001135_623541_5C3F8609 
X-CRM114-Status: GOOD (  29.13  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jun 07, 2025 at 10:16:34PM +0800, Xi Ruoyao wrote:
> On Fri, 2025-06-06 at 15:01 -0700, Vineet Gupta wrote:
> > On 6/6/25 02:24, Xi Ruoyao wrote:
> > > As recently pointed out by Thomas, if a register is forced for two
> > > different register variables, among them one is used as "+" (both inp=
ut
> > > and output) and another is only used as input, Clang would treat the
> > > conflicting input parameters as undefined behaviour and optimize away
> > > the argument assignment.
> > > =

> > > Per an example in the GCC documentation, for this purpose we can use =
"=3D"
> > > (only output) for the output, and "0" for the input for that we must
> > > reuse the same register as the output.=A0 And GCC developers have
> > > confirmed using a simple "r" (that we use for most vDSO implementatio=
ns)
> > > instead of "0" is also fine.
> > > =

> > > Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-=
1-6d12d6dfbdd0@linutronix.de/
> > > Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Va=
riables.html
> > > Link: https://gcc.gnu.org/pipermail/gcc-help/2025-June/144266.html
> > > Cc: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > > Cc: Nathan Chancellor <nathan@kernel.org>
> > > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > > ---
> > > =

> > > v1 -> v2: Keep using "r" for buffer to follow the existing convention
> > > (that the GCC developers have confirmed fine).
> > > =

> > > =A0arch/riscv/include/asm/vdso/getrandom.h | 2 +-
> > > =A01 file changed, 1 insertion(+), 1 deletion(-)
> > > =

> > > diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/inc=
lude/asm/vdso/getrandom.h
> > > index 8dc92441702a..c6d66895c1f5 100644
> > > --- a/arch/riscv/include/asm/vdso/getrandom.h
> > > +++ b/arch/riscv/include/asm/vdso/getrandom.h
> > > @@ -18,7 +18,7 @@ static __always_inline ssize_t getrandom_syscall(vo=
id *_buffer, size_t _len, uns
> > > =A0	register unsigned int flags asm("a2") =3D _flags;
> > > =A0
> > > =A0	asm volatile ("ecall\n"
> > > -		=A0=A0=A0=A0=A0 : "+r" (ret)
> > > +		=A0=A0=A0=A0=A0 : "=3Dr" (ret)
> > > =A0		=A0=A0=A0=A0=A0 : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
> > > =A0		=A0=A0=A0=A0=A0 : "memory");
> > =

> > My 2 cents as I've dabbled into this for ARC glibc syscall macros [1] w=
here r0
> > is both the first syscall/function arg and also the function/syscall re=
turn.
> > =

> > The v2 approach still keeps 2 different variables in same local reg whi=
ch has
> > potential for any future compiler shenanigans.
> > Segher's example avoided specifying the same reg.
> > What about something like the following: seems to generate the right co=
de (with
> > gcc 15)
> > =

> > =A0=A0=A0=A0=A0=A0 register long ret asm("a0");
> =

> Then it would be better to rename this variable to just "a0".  And I
> guess Thomas doesn't want a new convention different from all other
> syscall wrappers in vDSO...

Indeed. I want to keep it consistent. Especially for a bugfix.
Speaking of which, IMO this patch should have a Fixes tag.

Then we could start a new discussion about changing it to something else ev=
erywhere.
Although I don't think that the single-variable variant is better.

> > =A0=A0=A0=A0=A0=A0 register long nr asm("a7") =3D __NR_getrandom;
> > =A0=A0=A0=A0=A0=A0 register size_t len asm("a1") =3D _len;
> > =A0=A0=A0=A0=A0=A0 register unsigned int flags asm("a2") =3D _flags;
> > =A0=A0=A0=A0=A0=A0 ret =3D (unsigned long) _buffer;
> > =

> > =A0=A0=A0=A0=A0=A0 asm volatile ("ecall\n"
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : "+r" (re=
t)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 // keep "+r"
> > for input _buffer / output ret
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : "r" (nr)=
, "r" (len), "r" (flags)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : "memory"=
);
> > =

> > =A0=A0=A0=A0=A0=A0 return ret;
> > =

> > Thx,
> > -Vineet
> > =

> > [1] https://github.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux=
/arc/sysdep.h
> =

> -- =

> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
