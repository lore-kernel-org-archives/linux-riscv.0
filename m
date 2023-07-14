Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E8EEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 18:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIvuCDvdh9DSDeRZ4Z4nxRHaaqXJmsdu0e/x4lItdG0=; b=ie7ZXClGWul/lg8ro9uT5R6ruV
	OsOT/L0ZouW7C6MmvN258/MUJ3eSLtbB6tIuhLb+JiJZHnv9SUeehEhsCi7hqYH3A3vccbcKFd25V
	pqAzANdmfMoAW8mZb0OFp2jcifsHoA/+tdEjWAT3TcJ5MBcCljRgJynvVZf57D4zGIUT12hmE5Lnq
	1pIThAB8PmDvDcHYDy14YzolKz4kdE0Q1wTSsmFhNJQhGIh6uCDGG5qHF/1xFn73NNiq+dhg5Iuch
	RcK3Kq9eFcCI/NFnR34HonJGYh14XZWd6j/GjMROczFedJiGE44n8rf+47H4286QaCEOpcoQywvhg
	LEWjzhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNnO-0070jH-18;
	Fri, 14 Jul 2023 18:45:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNnK-0070id-2S
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 18:45:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 730C361DC1;
	Fri, 14 Jul 2023 18:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32083C433C7;
	Fri, 14 Jul 2023 18:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689360332;
	bh=oFOyMHpJL3dzjOh1YrgmJC2i8J3vQBQT5jly2Sy4fgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CuM2YvWKVPpmLZrQb/Hq0M9RuTzzrQTkgt+ZIpFBXdvU6KfolLg8a0XkjthhgYkW2
	 bvH0kb/2dUHF6BwAfdCTcpb00byFIM2Z2+vP2jgEI5XClHPZmsRSLyqySxmp3JzIBB
	 /D00NEMZBQ509F5urtNTj7V9m8z6GphG1fIJlyXOpVqxtUd0TdpnZ/y0P/0fEfpvwE
	 LP03BAet1cUWc+W4Z9XqR+z8AHee70lLSrRYJMYqYode1iTmg3QMx16wIP1upzbrlT
	 4IzThffOpkR78IFa0Qt8/E25TAlHxT+DJo7tSta7PoMtC92cRHxdfcKQ4Dsk0XKTjI
	 YzUzTqSYda2MQ==
Date: Fri, 14 Jul 2023 19:45:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, palmer@dabbelt.com, heiko@sntech.de,
	charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
Message-ID: <20230714-scrambled-monogram-0dd1029a030c@spud>
References: <20230712-postal-affiliate-0d61a209897f@spud>
 <ZLAoIWX+qqWvucWz@xhacker>
 <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com>
 <20230713-statutory-balance-f2c9e862f2e3@spud>
 <CAJF2gTRy5eK73=d6s7CVy9m9pB8p4rAoMHM3cZFwzg=AuF7TDA@mail.gmail.com>
 <20230714-saturate-verbalize-27571671249d@spud>
MIME-Version: 1.0
In-Reply-To: <20230714-saturate-verbalize-27571671249d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_114534_904169_E9586DC5 
X-CRM114-Status: GOOD (  32.47  )
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
Content-Type: multipart/mixed; boundary="===============7850359826204821928=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7850359826204821928==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q91EOWbnkz/HbRX/"
Content-Disposition: inline


--Q91EOWbnkz/HbRX/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 12:10:24PM +0100, Conor Dooley wrote:
> On Fri, Jul 14, 2023 at 02:14:45PM +0800, Guo Ren wrote:
> > On Fri, Jul 14, 2023 at 1:45=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Thu, Jul 13, 2023 at 01:33:56PM -0400, Guo Ren wrote:
> > > > On Thu, Jul 13, 2023 at 12:48=E2=80=AFPM Jisheng Zhang <jszhang@ker=
nel.org> wrote:
> > > > > On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:
> > >
> > > > > > +             /*
> > > > > > +              * "V" in ISA strings is ambiguous in practice: i=
t should mean
> > > > > > +              * just the standard V-1.0 but vendors aren't wel=
l behaved.
> > > > > > +              * Many vendors with T-Head CPU cores which imple=
ment the 0.7.1
> > > > > > +              * version of the vector specification put "v" in=
to their DTs
> > > > > > +              * and no T-Head CPU cores with the standard vers=
ion of vector
> > > > > > +              * are in circulation yet.
> > >
> > > > T-HEAD's vector 1.0 SoCs is in circulation. Kendryte K230 is the
> > > > shipped SoC chip, which vendor id =3D THEAD_VENDOR_ID and with vect=
or
> > > > 1.0.
> > >
> > > Where can I buy one, if it is in circulation?
> > > Googling in English might not be the best thing to do, but doing so I
> > > could find basically no information on the k230 - I did know it exist=
ed
> > > and tried to find some info on it before sending the patch.
> > > If it is not in circulation, then the comment is not inaccurate & when
> > > they do arrive they can use the new dedicated property to convey supp=
ort
> > > for vector.
>=20
> I saw you sent to Palmer a link to the k230. When I clicked the link,
> it gave (per google translate) purchase options for k210 and k510 only.
> I figure that means there is nothing _publicly_ available?
>=20
> > > > > > +              * Platforms with T-Head CPU cores that support t=
he standard
> > > > > > +              * version of vector must provide the explicit V =
property,
> > > > > > +              * which is well defined.
> > > > > > +              */
> > > > > > +             if (acpi_disabled && riscv_cached_mvendorid(cpu) =
=3D=3D THEAD_VENDOR_ID) {
> > > > If you insist on doing this, please:
> > > >
> > > > if (acpi_disabled && riscv_cached_mvendorid(cpu) =3D=3D THEAD_VENDO=
R_ID &&
> > > > riscv_cached_marchid(cpu) =3D=3D 0 && riscv_cached_mimpid(cpu) =3D=
=3D 0) {
> > >
> > > Why? Does the c908 report non-zero mimpid/marchid?
>=20
> > Yes
>=20
> > > If yes, does it need either the errata for CMOs or the page tables?
>=20
> > C908 is compatible to RVA22 Profile, here is the detail link:
> > https://xrvm.com/cpu-details?id=3D4107904466789928960
>=20
> That's fantastic news! I'll submit a v3 of this with the hammer reduced,
> as you have suggested above.

=46rom some chat on IRC, I realised that this xrvm.com link mentions that
the c908 supports both XMAE and Svpbmt.
If it does support both, could you explain about how that works?
Is there some CSR that allows to switch between them?
How do you intend communicating to s-mode etc which of them is in use?

Thanks,
Conor.

--Q91EOWbnkz/HbRX/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLGXyAAKCRB4tDGHoIJi
0jpHAP48bggOKuIHl2rkAlU1HGDP5eJ9vEEaQ8HNLq9gIcF2xgEA/q3HveocniNk
wDXZ0qbsNYnnONZG1P+wx6JuEMc6pAY=
=eus4
-----END PGP SIGNATURE-----

--Q91EOWbnkz/HbRX/--


--===============7850359826204821928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7850359826204821928==--

