Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17085EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCX6eoggaYzoX9OpKvtMtAzmTbbwD3ZUe+6QZGQeoFE=; b=2K3Fxv/57Uibr/z66jbIPsjGnT
	tLkXhG6hDi2cy21QlNB33N7x4wztgKy/B8nz0MHTH5X+gNvh71yoBI7r436kJOwkZfstl47+VUKQP
	ZfV7/RobJbhSEQWfznVlijRZ4Ogu8i0gE2i9vKoPejCgkGFGa2D7MncuONBBKmkZReKf+mhKzBIcV
	+dCbgAfde+uKpimX1zYCXroAwMAVTRU0MmNC4ejG63xwrfZQFA5wxnNsD3QlxH0AetUmBjodD5PiU
	b8Lf1z6Gzcss3OqewB8N4v87nKTPjoTBTDm2ae/A74KVlArkEEC5TcVaPvyRME4gMSrfkWyw8MjXS
	c6Fx6PRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKGh0-0062Dn-1h;
	Fri, 14 Jul 2023 11:10:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKGgx-0062D1-0P
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 11:10:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBFCD61CE1;
	Fri, 14 Jul 2023 11:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48FFC433C8;
	Fri, 14 Jul 2023 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689333028;
	bh=B89npdjr2EmjlPPICYGVRfS0ln+GlrGeoE5pc7pjRhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEqSmwS2tUcXJsoyxcL+IE8RazFZLjC23j07R+2v2NewfkETfeT85+C3G/l0ntc+p
	 9B6e0lR/ZMa7HZpfgenVV5r/rU30ElLFpgKyA/R6jWfLcaFBHnIbymGO21Gxz13yPI
	 u7odM+j+sECsSdB3Px3/tK2Al3DccR1nIf+dKpb04C7kex6XiOgbrln7fcepgleFmC
	 pYER28+BDtJuQ50T1yF86SD7XhZUkqiVqkLTYvqigOOLLrGlufkjb7WEcOjh2lcw60
	 4Tc4bZviZIkI5ouEADTHFD+ByDsye0QIahJvt59eY1qODR13tHEYxT9TwxEKTgoR+C
	 CTd/qmF0mx9Tw==
Date: Fri, 14 Jul 2023 12:10:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, palmer@dabbelt.com, heiko@sntech.de,
	charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
Message-ID: <20230714-saturate-verbalize-27571671249d@spud>
References: <20230712-postal-affiliate-0d61a209897f@spud>
 <ZLAoIWX+qqWvucWz@xhacker>
 <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com>
 <20230713-statutory-balance-f2c9e862f2e3@spud>
 <CAJF2gTRy5eK73=d6s7CVy9m9pB8p4rAoMHM3cZFwzg=AuF7TDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTRy5eK73=d6s7CVy9m9pB8p4rAoMHM3cZFwzg=AuF7TDA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_041031_244963_465E4CC9 
X-CRM114-Status: GOOD (  29.65  )
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
Content-Type: multipart/mixed; boundary="===============7876974767397986048=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7876974767397986048==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KnP3SRCzNNdf194q"
Content-Disposition: inline


--KnP3SRCzNNdf194q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 02:14:45PM +0800, Guo Ren wrote:
> On Fri, Jul 14, 2023 at 1:45=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Jul 13, 2023 at 01:33:56PM -0400, Guo Ren wrote:
> > > On Thu, Jul 13, 2023 at 12:48=E2=80=AFPM Jisheng Zhang <jszhang@kerne=
l.org> wrote:
> > > > On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:
> >
> > > > > +             /*
> > > > > +              * "V" in ISA strings is ambiguous in practice: it =
should mean
> > > > > +              * just the standard V-1.0 but vendors aren't well =
behaved.
> > > > > +              * Many vendors with T-Head CPU cores which impleme=
nt the 0.7.1
> > > > > +              * version of the vector specification put "v" into=
 their DTs
> > > > > +              * and no T-Head CPU cores with the standard versio=
n of vector
> > > > > +              * are in circulation yet.
> >
> > > T-HEAD's vector 1.0 SoCs is in circulation. Kendryte K230 is the
> > > shipped SoC chip, which vendor id =3D THEAD_VENDOR_ID and with vector
> > > 1.0.
> >
> > Where can I buy one, if it is in circulation?
> > Googling in English might not be the best thing to do, but doing so I
> > could find basically no information on the k230 - I did know it existed
> > and tried to find some info on it before sending the patch.
> > If it is not in circulation, then the comment is not inaccurate & when
> > they do arrive they can use the new dedicated property to convey support
> > for vector.

I saw you sent to Palmer a link to the k230. When I clicked the link,
it gave (per google translate) purchase options for k210 and k510 only.
I figure that means there is nothing _publicly_ available?

> > > > > +              * Platforms with T-Head CPU cores that support the=
 standard
> > > > > +              * version of vector must provide the explicit V pr=
operty,
> > > > > +              * which is well defined.
> > > > > +              */
> > > > > +             if (acpi_disabled && riscv_cached_mvendorid(cpu) =
=3D=3D THEAD_VENDOR_ID) {
> > > If you insist on doing this, please:
> > >
> > > if (acpi_disabled && riscv_cached_mvendorid(cpu) =3D=3D THEAD_VENDOR_=
ID &&
> > > riscv_cached_marchid(cpu) =3D=3D 0 && riscv_cached_mimpid(cpu) =3D=3D=
 0) {
> >
> > Why? Does the c908 report non-zero mimpid/marchid?

> Yes

> > If yes, does it need either the errata for CMOs or the page tables?

> C908 is compatible to RVA22 Profile, here is the detail link:
> https://xrvm.com/cpu-details?id=3D4107904466789928960

That's fantastic news! I'll submit a v3 of this with the hammer reduced,
as you have suggested above.

Thanks,
Conor.

--KnP3SRCzNNdf194q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLEtIAAKCRB4tDGHoIJi
0l0VAP4mpVMB/zy6Pf8iKDG0UXcKeBkwWT7y103C9qdgocpCfAD/ZXQJtefq3IDK
V4UXENGh0iWIyIy9pFp+43EFPCtnEw4=
=uOIh
-----END PGP SIGNATURE-----

--KnP3SRCzNNdf194q--


--===============7876974767397986048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7876974767397986048==--

