Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63387C3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 21:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ow2tGY93+D85IdrujaQteVr1i7sWEeWh58RPszma+Eo=; b=jFCJZNcOoLqDVDwODQAr775HpM
	fcVd0qc9YDI/CVkZoHPfB3VcpBxHHtUet0qIffOz+Zwxc427ZmXcgqjl4+NKLSQFMVbK5gGkwa10b
	0Z3xdASmUqZCsnfBDI/vv88L40ZiQvsn/Q+Coqkwb+FK1iHVfUiHh8uCpohWkt8bY61Sxz/EM424c
	DHVO93BkRCJhlNc2k6RyXYuT8ULHf41FTPCl+ztoGW5gQqx2fs906F9AAwTjibqJuz1zw2RHq62Gk
	lA2PciehkCHevfOTfMD7G2a3gyBAd4hRNXHmOiStFPEkvI8fm1LcjUdh8p80DdNUnIEk53xlw6Vql
	YG+Sls+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2fjS-003L46-Mg; Tue, 06 Dec 2022 21:44:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2fjP-003Kta-51; Tue, 06 Dec 2022 21:44:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5DA2E61912;
	Tue,  6 Dec 2022 21:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351CAC433D7;
	Tue,  6 Dec 2022 21:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670363041;
	bh=hQJFrOi/riwxs9Q5lMZF7yhYqPIY/L8Z7et7euLwRMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFsRHJE2QieSENTNShtA8xr+u59axvZ7NnOk3RY9yQMOayaWZpptr3WVelO2Y461h
	 pc3BfKUDEHWU9kuF7HPNVFFkmcuY3VBPSDjcsyMdP9xmuNGbKLIHPV7p/3BhVAh2dW
	 4HziDxZX9PpijvGBhNIT39jawplVO7Y/esJFsQHizCyh7WnEKrvy5yfF0WIkmu06k9
	 QME+hd2y+t+7qth9IHTavEQK4FbUqOwNpxW0XRq3yauS9TBwrWE7FaFnjx7wgZUh7D
	 /5vk3EsOim7p2+ElkYXIP2UIJ1BEyNQlqd9T4Jd5WCCAUA6MluB6eOob81VceB8Duh
	 nt0b0UCdE8m1w==
Date: Tue, 6 Dec 2022 21:43:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 09/13] riscv: switch to relative alternative entries
Message-ID: <Y4+3nJ53nvmmc8+z@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-10-jszhang@kernel.org>
 <CAJF2gTRxm7LJFtups5fexJ5ishm9_j3e+yzfKv3nTtQqUtXPtA@mail.gmail.com>
 <Y44LuRcQYPnVnFje@xhacker>
 <CAJF2gTQ98fyTNc6d3PJrkMjUjUstN8s1FcRNyZQCLiN5CV5NCw@mail.gmail.com>
 <Y49WvYWIsFAIeabH@xhacker>
MIME-Version: 1.0
In-Reply-To: <Y49WvYWIsFAIeabH@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_134403_303739_4E50B661 
X-CRM114-Status: GOOD (  43.10  )
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
Content-Type: multipart/mixed; boundary="===============4837662378639070130=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4837662378639070130==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uWz0dNot0HPNalAT"
Content-Disposition: inline


--uWz0dNot0HPNalAT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng, Guo Ren,

On Tue, Dec 06, 2022 at 10:50:37PM +0800, Jisheng Zhang wrote:
> On Tue, Dec 06, 2022 at 12:34:40PM +0800, Guo Ren wrote:
> > On Mon, Dec 5, 2022 at 11:28 PM Jisheng Zhang <jszhang@kernel.org> wrot=
e:
> > > On Mon, Dec 05, 2022 at 08:51:41AM +0800, Guo Ren wrote:
> > > > On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> w=
rote:
> > > > >
> > > > > Instead of using absolute addresses for both the old instrucions =
and
> > > > > the alternative instructions, use offsets relative to the alt_ent=
ry
> > > > > values. So we can not only cut the size of the alternative entry,=
 but

"This not only cuts"

> > > > > also meet the prerequisite for patching alternatives in the vDSO,
> > > > > since absolute alternative entries are subject to dynamic relocat=
ion,
> > > > > which is incompatible with the vDSO building.

I do this this is in the wrong order though, saving on size is
secondary to enabling their use in the vdso?

> > > > >
> > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > ---
> > > > >  arch/riscv/errata/sifive/errata.c           |  4 +++-
> > > > >  arch/riscv/errata/thead/errata.c            | 11 ++++++++---
> > > > >  arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++-----=
-----
> > > > >  arch/riscv/include/asm/alternative.h        | 12 ++++++------
> > > > >  arch/riscv/kernel/cpufeature.c              | 13 ++++++-------
> > > > >  5 files changed, 33 insertions(+), 27 deletions(-)
> > > > >
> > > > > diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errat=
a/sifive/errata.c
> > > > > index 1031038423e7..0e537cdfd324 100644
> > > > > --- a/arch/riscv/errata/sifive/errata.c
> > > > > +++ b/arch/riscv/errata/sifive/errata.c
> > > > > @@ -107,7 +107,9 @@ void __init_or_module sifive_errata_patch_fun=
c(struct alt_entry *begin,
> > > > >
> > > > >                 tmp =3D (1U << alt->errata_id);
> > > > >                 if (cpu_req_errata & tmp) {
> > > > > -                       patch_text_nosync(alt->old_ptr, alt->alt_=
ptr, alt->alt_len);
> > > > > +                       patch_text_nosync((void *)&alt->old_offse=
t + alt->old_offset,
> > > > > +                                         (void *)&alt->alt_offse=
t + alt->alt_offset,
> > > >  (void *)&alt->alt_offset + alt->alt_offset. ??!!
> > >
> > > Hi Guo,
> > >
> > > what's the problem? I can't catch your meaning, could you please proi=
de
> > > more details?
> > Can you explain why:
> >=20
> > alt->old_ptr =3D (void *)&alt->old_offset + alt->old_offset
>=20
> Hi,
>=20
> when constructing the alt entry, we save the offset in
> then entry as below:
>=20
> .long \oldptr - .
>=20
> So we can restore the old_ptr by &alt->old_offset + alt->old_offset

Please correct me if I have misunderstood, but for stuff like this I
find it useful to kinda summarise a bit and figure out for myself what
is going on..

As things stand, we have absolute "locations" for the alternative and
"old" instructions/data/functions. Your commit is converting us over to
use offsets. The code that patches in the alternatives needs to have
absolute addresses though, so you need to be able to, effectively,
reverse engineer those from the offset.
You do this by taking the address of the offset & adding the offset to
the address before casting to (void *). This works, because the offset
is the offset from the alt_entry data structure to the alternative?

I hope I am in the right ballpark there haha, but I do think that this
really needs a comment explaining what it is doing. Maybe extract that
operation into some sort of macro in alternatives.h so the operation is
done in a central location & you can leave the comment there?

That'd make it at least more manageable for us mere mortals who can just
do something like
patch_text_nosync(ALT_OFFSET_ADDRESS(alt->old_offset),
		  ALT_OFFSET_ADDRESS(alt->alt_offset),
		  alt->alt_len);

when we have to go an add some alternatives..

> >=20
> > | offset | <- &offset
> > | ...       |
> > | value | <- ptr =3D &offset + offset
> >=20
> > I don't make sense of the above.
> >=20
> > >
> > > Thanks
> > >
> > > >
> > > > > +                                         alt->alt_len);
> > > > >                         cpu_apply_errata |=3D tmp;
> > > > >                 }
> > > > >         }
> > > > > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata=
/thead/errata.c
> > > > > index 21546937db39..2a6e335b5a32 100644
> > > > > --- a/arch/riscv/errata/thead/errata.c
> > > > > +++ b/arch/riscv/errata/thead/errata.c
> > > > > @@ -68,6 +68,7 @@ void __init_or_module thead_errata_patch_func(s=
truct alt_entry *begin, struct al
> > > > >         struct alt_entry *alt;
> > > > >         u32 cpu_req_errata =3D thead_errata_probe(stage, archid, =
impid);
> > > > >         u32 tmp;
> > > > > +       void *oldptr, *updptr;

Why mix the terminology with "upd" instead of "alt"?

> > > > >
> > > > >         for (alt =3D begin; alt < end; alt++) {
> > > > >                 if (alt->vendor_id !=3D THEAD_VENDOR_ID)

> > > > >  struct alt_entry {
> > > > > -       void *old_ptr;           /* address of original instrucit=
on or data  */
> > > > > -       void *alt_ptr;           /* address of replacement instru=
ction or data */
> > > > > -       unsigned long vendor_id; /* cpu vendor id */
> > > > > -       unsigned long alt_len;   /* The replacement size */
> > > > > -       unsigned int errata_id;  /* The errata id */
> > > > > -} __packed;
> > > > > +       s32 old_offset;         /* offset to original instruciton=
 or data */
> > > > > +       s32 alt_offset;         /* offset to replacement instruct=
ion or data */

Perhaps also this comment could be expanded on to specify what it is an
offset *from* as well as to?

> > > > > +       u16 vendor_id;          /* cpu vendor id */
> > > > > +       u16 alt_len;            /* The replacement size */
> > > > > +       u32 errata_id;          /* The errata id */
> > > > > +};

I hope I didn't make a hames of trying to understand what you were
doing, but please let me know what I have undoubtedly got mixed up on!
Thanks,
Conor.


--uWz0dNot0HPNalAT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4+3nAAKCRB4tDGHoIJi
0o4UAQDdFtrFC6LSB2je2GwWfqj+2QnzRowVGKALV/wZtobyOQEA0iR9BN1OvLLD
yFafJBWPiUaXNg2nrA+uOw37n1XCUwc=
=Q0N3
-----END PGP SIGNATURE-----

--uWz0dNot0HPNalAT--


--===============4837662378639070130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4837662378639070130==--

