Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BF8CD6102
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=br31/0+E8bIkzfiTUnksfy/a/gaZRtvKFEWmr9x6nVM=; b=vS41GO037J1vq4vFI9lyhzzhXX
	a5Ct5kNWoT2dEh492/bxUqIaRp7V7N9hbwdcse4KxcAWyk9jFFD6DtKh84AXQd6mQcrutUPmeoxWf
	lfBQTnzIcohvk/REIuRaQQvENRI9DOI3t7P9gdUc3IiRfBe9Ng03R6ihMglYptbIR58rmmIbwHMa+
	LLCp1k6y2JNYQrHqicjK+f/aSN7BUygmTz8E7EEBDhUwV4i/imhdcPLrC0BL7/gIQf0KFgejoKHur
	iyzb3tjU2WrqDKL2lBtyk0Ym6jUCcFlIRMWv+wfXfAubNbbbU3B0E3dbEVYu9Jm/1vQxeFmSGU2tY
	O64r+gmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpsvU-00B9ht-2X;
	Mon, 09 Oct 2023 16:16:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpsvS-00B9go-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 16:16:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CDE360FB9;
	Mon,  9 Oct 2023 16:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAB7C433C8;
	Mon,  9 Oct 2023 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696868167;
	bh=TUuYHkOnACwqBBmD9bJNqds06LCxmeRiTfbnAwarBgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eU2EVyLZvP0ynT/R9wgeiq9r9+GUMtVerH0hdEET3jzhYlaDfeI/DmNIjffFhYsRs
	 c29FAKVXTo9TBjOwydx+byNRi0CpoqNqEQBstZC0fL+OdsHQ0VTJ5+MPxrU6yvvTVy
	 DoND44aejrDEG2pU1yl/Z8ziE5sQ5aEiecoNKpfebw63j/PKR8Q33OqJvLqSCn4z4I
	 MVZTLvStj7UDzGDV1NwogxSnxHTBdZdxjx3QRb8z6zO/qAPz5CpvamzCPE4jCwqI5O
	 0T0H0pFkF0YY7YDPpzIkOnLI+5ng5KYYqjwsziP55JOvz2EWx2Z8cZ0IbcWdtHuk+T
	 TDEGHZ/bTsriQ==
Date: Mon, 9 Oct 2023 17:16:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new
 properties
Message-ID: <20231009-underpass-decorator-12e153d8f8e7@spud>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231009-smog-gag-3ba67e68126b@wendy>
 <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_091610_317731_194F3C6B 
X-CRM114-Status: GOOD (  24.73  )
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
Content-Type: multipart/mixed; boundary="===============6476280511644701660=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6476280511644701660==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qLX05ACkobQ/OGT+"
Content-Disposition: inline


--qLX05ACkobQ/OGT+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 02:15:47PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Mon, Oct 9, 2023 at 11:44=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> > Convert the RZ/Five devicetrees to use the new properties
> > "riscv,isa-base" & "riscv,isa-extensions".
> > For compatibility with other projects, "riscv,isa" remains.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch!
>=20
> > --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > @@ -24,6 +24,9 @@ cpu0: cpu@0 {
> >                         reg =3D <0x0>;
> >                         status =3D "okay";
> >                         riscv,isa =3D "rv64imafdc";
> > +                       riscv,isa-base =3D "rv64i";
> > +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d=
", "c", "zicntr", "zicsr",
> > +                                              "zifencei", "zihpm";
>=20
> LGMT, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> I could not review the "zi*" parts, as the documentation that I have
> does not mention these.

These are effectively the assumptions that the kernel already makes, for
things that used to be part of the base isa (or were assumed to be) that
are now extensions in their own right.

The Zihpm it'd be good if someone from the Renesas or Andes sides could
confirm though.

Cheers,
Conor.

>=20
> >                         mmu-type =3D "riscv,sv39";
> >                         i-cache-size =3D <0x8000>;
> >                         i-cache-line-size =3D <0x40>;
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

--qLX05ACkobQ/OGT+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSQnQAAKCRB4tDGHoIJi
0pk+AQCDTGDR196WU+S3VHp6GoZyYrKV0pxVwcmVbOTky5SKxAD/bz6cONYAr9SE
2ryKqLVowNyGAA93Sr/qimPdZABBYgc=
=nGga
-----END PGP SIGNATURE-----

--qLX05ACkobQ/OGT+--


--===============6476280511644701660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6476280511644701660==--

