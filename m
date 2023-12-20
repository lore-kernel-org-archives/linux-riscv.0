Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A996C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBSCb8YqcmBdggSVs8gqXDrLLs82ZDy63TEp5wkkZgQ=; b=kjSCGMnKUt8ldOkbnGfWQ+O9al
	/3fZr4+dZeoClwSYuFI1DRLE6wW9MK4jZqwAL3zqv7H880pie53XYmMGStobScD2+Ql/Jvt/yEj8v
	g6/86G6t81pNKkLevD1mnYjcwFanFPYQfhr6K5+sArxo+igEsju7CG128XFcIMCgTdMSVWkccakyy
	jSqHZ7eoB3isXXcubbORttEAeiExAKWa6/pdE4r7tcqGFLKUB/QPAN4kwEUJdxyLq6IslNgk9/0xr
	1I7S5krtGsUWP3keV+f6VYbPgdeAg1frc/h6uf/ZLXm+lKahKKmAn9oFIiYtsuaoBMpF85CEOIDOu
	TVH4Le/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG59f-0015Sv-10;
	Wed, 20 Dec 2023 22:35:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG59b-0015RL-36
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 22:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E164ECE1DCB;
	Wed, 20 Dec 2023 22:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFBCC433C8;
	Wed, 20 Dec 2023 22:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703111695;
	bh=d9zxtgGvD0FyI9tDgmuHthjr3LnvFT1djbBAQIHHqVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tc//UKmY5eBORtXFIrS/YTHjOtG8CcbB4Jn2wqgDBrQJJ743cJrS9Y/iKMsT+172S
	 VV9lZYB2UESLqlCHUoP1ln3bQojQ1SkWKLqFDxgTe6Ez8U4jeXoNF5IhygSu9vWhut
	 j7gk4yUBRimouyu0Y9o8RnP9zQ16HqeciFutGfEpDVH8UffUtDQN5KfXBsYquYboCt
	 QY9lwhFiOK83jgBMDAyrok1XSC2U6VbqiuIZatc6ccGPMZ/zfgmcZGXcEvsdeWD1Fx
	 vdlJdHfKTGzDv6lNtafLpg4MTgdv1jwXCHVebZxEIcravMPvWt6/ZQO5mJviRYmLwO
	 f+hoto2ZoqEog==
Date: Wed, 20 Dec 2023 22:34:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, anup@brainfault.org,
	samitolvanen@google.com, rppt@kernel.org,
	panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: put va_kernel_xip_pa_offset into CONFIG_XIP_KERNEL
Message-ID: <20231220-bash-booting-2dc46e8c41f7@spud>
References: <20231220103428.61758-1-cuiyunhui@bytedance.com>
 <594df6bc-0207-46f6-aa81-dcf1f3665917@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <594df6bc-0207-46f6-aa81-dcf1f3665917@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_143504_469663_3A0E125B 
X-CRM114-Status: GOOD (  20.05  )
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
Content-Type: multipart/mixed; boundary="===============7007137871126413813=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7007137871126413813==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9VC1To1d/DjgDtuf"
Content-Disposition: inline


--9VC1To1d/DjgDtuf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 10:14:59PM +0100, Alexandre Ghiti wrote:
> Hi Yunhui,
>=20
> On 20/12/2023 11:34, Yunhui Cui wrote:
> > opitmize the kernel_mapping_pa_to_va() and kernel_mapping_va_to_pa().
> >=20
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >   arch/riscv/include/asm/page.h | 33 ++++++++++++++++++++-------------
> >   1 file changed, 20 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/pag=
e.h
> > index 5488ecc337b6..0d2b479d02cd 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -113,8 +113,8 @@ struct kernel_mapping {
> >   	unsigned long va_pa_offset;
> >   	/* Offset between kernel mapping virtual address and kernel load add=
ress */
> >   	unsigned long va_kernel_pa_offset;
> > -	unsigned long va_kernel_xip_pa_offset;
> >   #ifdef CONFIG_XIP_KERNEL
> > +	unsigned long va_kernel_xip_pa_offset;
> >   	uintptr_t xiprom;
> >   	uintptr_t xiprom_sz;
> >   #endif
> > @@ -134,12 +134,25 @@ extern phys_addr_t phys_ram_base;
> >   #else
> >   void *linear_mapping_pa_to_va(unsigned long x);
> >   #endif
> > -#define kernel_mapping_pa_to_va(y)	({					\
> > -	unsigned long _y =3D (unsigned long)(y);					\
> > -	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
> > -		(void *)(_y + kernel_map.va_kernel_xip_pa_offset) :		\
> > -		(void *)(_y + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
> > -	})
> > +
> > +#ifdef CONFIG_XIP_KERNEL
> > +#define kernel_mapping_pa_to_va(y)							\
> > +	(((unsigned long)(y) < phys_ram_base) ?						\
> > +		(void *)((unsigned long)(y) + kernel_map.va_kernel_xip_pa_offset) :	\
> > +		(void *)((unsigned long)(y) + kernel_map.va_kernel_pa_offset + XIP_O=
FFSET))
> > +
> > +#define kernel_mapping_va_to_pa(y)						\
> > +	(((unsigned long)(y) < kernel_map.virt_addr + XIP_OFFSET) ?		\
> > +		((unsigned long)(y) - kernel_map.va_kernel_xip_pa_offset) :	\
> > +		((unsigned long)(y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET))
> > +#else
> > +#define kernel_mapping_pa_to_va(y)						\
> > +	((void *)((unsigned long)(y) + kernel_map.va_kernel_pa_offset + XIP_O=
FFSET))
> > +
> > +#define kernel_mapping_va_to_pa(y)						\
> > +	((unsigned long)(y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET)
> > +#endif
> > +
> >   #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
> >   #ifndef CONFIG_DEBUG_VIRTUAL
> > @@ -147,12 +160,6 @@ void *linear_mapping_pa_to_va(unsigned long x);
> >   #else
> >   phys_addr_t linear_mapping_va_to_pa(unsigned long x);
> >   #endif
> > -#define kernel_mapping_va_to_pa(y) ({						\
> > -	unsigned long _y =3D (unsigned long)(y);					\
> > -	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFF=
SET) ? \
> > -		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
> > -		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
> > -	})
> >   #define __va_to_pa_nodebug(x)	({						\
> >   	unsigned long _x =3D x;							\
>=20
>=20
> Not sure using #ifdef optimizes anything since the compiler should do the
> same with the IS_ENABLED(CONFIG_XIP_KERNEL) and it does not really improve
> the readability of this file which is already overloaded with #ifdef, so I
> don't think this change is needed.

I would say that we explicitly do not want to move things that are
guarded by IS_ENABLED() to ifdeffery. In fact, we should move things in
the other direction if possible, especially for stuff like XIP_KERNEL
that nobody ever build tests.

--9VC1To1d/DjgDtuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYNsCgAKCRB4tDGHoIJi
0j5AAQDfD3hOrSf1w4Vr0SLOYvfQvnozBNrGfGmnoJXphENmagEAscxW3hYminqS
v99vGB5Ab9jM9vbhOdfgK4sEMKUPuAI=
=D6Wb
-----END PGP SIGNATURE-----

--9VC1To1d/DjgDtuf--


--===============7007137871126413813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7007137871126413813==--

