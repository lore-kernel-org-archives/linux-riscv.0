Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3998CC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 19:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stv3PfJBGN+wLKfgE+IKJ4Ag1qDAfMiskDJrNN+QgoE=; b=Wq4DR+/KQyxuhI/oyIZSWtppbF
	pUxdN+zatykFF8LhiCOY9TJ94dEOZWzq69Sor1lJMV9MYTIYj3gYkG1Du+jEUH/JtWYTarUn0czxa
	Fv1HKDoNBq4Yp/GfuEuqJQPtwux0Ii45pMy5OAEP1i4pAJDJWJjgyKlPPqskIisd0NTECzGM59xmn
	bCVwbMIzCK2AlLfLrrfJGUq+/aCFWkNvgIj5GlqfaFu9/tXF+ibckuKXZMNDyhgT7OsfspOik5FQD
	Jwg99MJ1RhDY+P/KHymR5yU42ypdG7WOgBsFE7ctvdMsLGoYOgKhjtczP05lCJBHToG8f5gQMgods
	ndQdZqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAFH2-00FY8s-R1; Tue, 27 Dec 2022 19:06:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAFGw-00FY6Z-Ue
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 19:06:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E6B7ECE1185;
	Tue, 27 Dec 2022 19:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEFAC433D2;
	Tue, 27 Dec 2022 19:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672167955;
	bh=4Iq28ijX84/ekVDcIz81dorRqX9Q8VZLSIRF5fCCmc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQYcPbsUVXHCvCRUzptPL/mR4vHPmBjQMY05vFR0z/fXHbG8pvL1R+K3H5EfuFBDp
	 5ykxF6GBHqoFf8tmvcCUAZ3F2JCJgLJ+UbuUvKPT+l01CGpK2qdUcAhUzODYPHxGwE
	 nB55t6E8JysbwCs9t0p5gzP20eDxEs7M3PoQ1G66TKDIiu7r5vZs61QTtMo3IArkaR
	 Len3arf7vFWmgJCZndLI1TE3yraSkM/8m4cQs0Q86zBUd/mYQN4aBC+JPEtFlgkJiX
	 ua+D/t5dlGjX39fkptYAvzRQGvTc/bCVeMXhOrvCmoJUnxrrUfv0dfQss9fXLSd2Ex
	 rK3cwJ4vo6B+Q==
Date: Tue, 27 Dec 2022 19:05:51 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: undefined symbol in modpost "zero"
Message-ID: <Y6tCD61D70IKimUo@spud>
References: <6a1d6ad7-89b6-8d67-ffcb-fc1a4a1033ee@codethink.co.uk>
 <a00241eb-fa43-f53b-16b0-a77625aded49@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <a00241eb-fa43-f53b-16b0-a77625aded49@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_110600_470552_87E6CECA 
X-CRM114-Status: GOOD (  26.67  )
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
Content-Type: multipart/mixed; boundary="===============4866191004729145236=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4866191004729145236==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6MwecUqpXPFNxQFz"
Content-Disposition: inline


--6MwecUqpXPFNxQFz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2022 at 04:59:51PM +0000, Ben Dooks wrote:
> On 23/12/2022 16:38, Ben Dooks wrote:
> > I'm getting the following error from modpost:
> >=20
> > ERROR: modpost: "zero" [arch/riscv/kvm/kvm.ko] undefined!
> > ERROR: modpost: "zero" [drivers/gpu/drm/drm.ko] undefined!
> > ERROR: modpost: "zero" [drivers/nvme/host/nvme.ko] undefined!
> > ERROR: modpost: "zero" [drivers/i2c/algos/i2c-algo-bit.ko] undefined!
> >=20
> > This seems to be coming from arch/riscv/include/asm/jump_label.h
> > with the arch_static_branch_jump() assembling some code:
> >=20
> > > =A0=A0=A0 40=A0 {
> > > =A0=A0=A0 41=A0=A0=A0=A0=A0=A0=A0=A0=A0 asm_volatile_goto(
> > > =A0=A0=A0 42=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=
=A0=A0=A0=A0=A0 .option
> > > push=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 \n\t"
> > > =A0=A0=A0 43=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=
=A0=A0=A0=A0=A0 .option
> > > norelax=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 \n\t"
> > > =A0=A0=A0 44=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=
=A0=A0=A0=A0=A0 .option
> > > norvc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \n\t"
> > > =A0=A0=A0 45=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "1:=
=A0=A0=A0=A0 jal=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 zero,
> > > %l[label]=A0=A0=A0=A0=A0=A0=A0=A0 \n\t"
> > > =A0=A0=A0 46=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=
=A0=A0=A0=A0=A0 .option
> > > pop=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 \n\t"
> > > =A0=A0=A0 47=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=
=A0=A0=A0=A0=A0 .pushsection=A0=A0=A0 __jump_table,
> > > \"aw\"=A0=A0=A0 \n\t"
> > > =A0=A0=A0 48=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=
=A0=A0=A0=A0=A0 .align=A0=A0=A0=A0=A0=A0=A0=A0=A0 " RISCV_LGPTR
> > > "=A0=A0=A0=A0=A0=A0=A0=A0 \n\t"
> > > =A0=A0=A0 49=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=
=A0=A0=A0=A0=A0 .long=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1b - ., %l[label] -
> > > .=A0=A0 \n\t"
> > > =A0=A0=A0 50=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=
=A0=A0=A0=A0=A0 " RISCV_PTR "=A0=A0 %0 -
> > > .=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \n\t"
> > > =A0=A0=A0 51=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> > > .popsection=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 \n\t"
> > > =A0=A0=A0 52=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 :=A0 =
:=A0 "i"(&((char *)key)[branch]) :=A0 : label);
> > > =A0=A0=A0 53
> > > =A0=A0=A0 54=A0=A0=A0=A0=A0=A0=A0=A0=A0 return false;
> > > =A0=A0=A0 55=A0 label:
> > > =A0=A0=A0 56=A0=A0=A0=A0=A0=A0=A0=A0=A0 return true;
> > > =A0=A0=A0 57=A0 }
> > >=20
> >=20
> > Changing the jal zero to jal x0 doesn't fix it, it just comes up with
> > "x0" being undefined.
> >=20
> > gcc version 12.2.0 (Debian 12.2.0-9)
> > GNU assembler version 2.39.50 (riscv64-linux-gnu) using BFD version (GNU
> > Binutils for Debian) 2.39.50.20221208
> >=20
> > I suspect this is a gas bug where it means to assemble a J instruction
> > to the label without outputting the unused symbol "zero" into the symbol
> > table. Is the right thing to fix gas, or can the kernel be changed?
> >=20
> > FYI:
> >=20
> > tmp.s:
> >  =A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=A0=A0 .text
> >  =A0=A0=A0=A0 2
> >  =A0=A0=A0=A0 3=A0 1:
> >  =A0=A0=A0=A0 4=A0=A0=A0=A0=A0=A0=A0=A0=A0 jal zero, 1b
> >=20
> >=20
> > produces:
> >=20
> > 0000000000000000 <.L1^B1>:
> >  =A0=A0 0:=A0=A0 0000006f=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
j=A0=A0=A0=A0=A0=A0 0 <.L1^B1>
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0: R_RISCV_JAL=A0 .L1^B1
> >=20
> > and
> >=20
> > $ riscv64-linux-gnu-nm -a tmp.o
> > 0000000000000000 b .bss
> > 0000000000000000 d .data
> > 0000000000000000 n .riscv.attributes
> > 0000000000000000 t .text
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 U zero
> >=20
> > Current fix is to:
> >=20
> >=20
> > diff --git a/arch/riscv/include/asm/jump_label.h
> > b/arch/riscv/include/asm/jump_label.h
> > index 6d58bbb5da46..a4abbacd0b62 100644
> > --- a/arch/riscv/include/asm/jump_label.h
> > +++ b/arch/riscv/include/asm/jump_label.h
> > @@ -42,7 +42,7 @@ static __always_inline bool
> > arch_static_branch_jump(struct static_key * const ke
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0=A0 .opt=
ion push=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \n\t"
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0=A0 .opt=
ion norelax=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 \n\t"
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0=A0 .opt=
ion norvc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 \n\t"
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "1:=A0=A0=A0=A0 jal=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 zero, %l[label]=A0=A0=A0=A0=A0=A0=A0=A0 \n\t"
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "1:=A0=A0=A0=A0 j=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 %l[label]=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 \n\t"
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0=A0 .opt=
ion pop=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 \n\t"
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0=A0 .pus=
hsection=A0=A0=A0 __jump_table, \"aw\"=A0=A0=A0 \n\t"
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0=A0 .ali=
gn=A0=A0=A0=A0=A0=A0=A0=A0=A0 " RISCV_LGPTR "=A0=A0=A0=A0=A0=A0=A0=A0 \n\t"
> >=20
> >=20
> > This fixes modpost, not sure if this should be applied or not.
> >=20
>=20
> I just checked riscv64-linux-gnu-nm vmlinux.o and it has
>=20
>                  U zero
>=20
>=20
> So I guess the linker just ignores this undefined symbol as it is never
> actually used for a relocation.

For anyone not paying attention to the RISC-V IRC, it is an upstream
binutils issue that does not affect released versions (yet) although it
does affect what is in debian-testing.

The upstream report for the issue is here:
https://sourceware.org/bugzilla/show_bug.cgi?id=3D29940

and for debian here:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1026979

Thanks,
Conor.


--6MwecUqpXPFNxQFz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6tCDwAKCRB4tDGHoIJi
0pNuAP425pf6/X2HYTd13iab5FFq+XKI5oKf9S3ILxLlb2+XUwEAvNwH/lSy16NF
n0GtSRKX2983FvAyY/TEeVDU8+QH8gM=
=nhWf
-----END PGP SIGNATURE-----

--6MwecUqpXPFNxQFz--


--===============4866191004729145236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4866191004729145236==--

