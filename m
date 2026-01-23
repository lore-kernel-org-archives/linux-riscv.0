Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11EAD77894
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 17:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvr9QNQdNG61PiP/sjjZaDLAwvzaDubSinanXQp4Ocw=; b=Lm7fKfLhutgLjLc5eJJIxsqY2t
	CRrSOHyYLfUJBPMKAJrKUR+qqJrRfm0DlStEQE3N0ACY5RnRNUl2hvaDXyhvGEE1mjY/KP/HZspGm
	ok6VFsia2kwe0ROOb9emQrVkxw799SmeUmUiz6pSAvIzoZsKlwesLaicQLutPz0DML3p1R5oqas+R
	zvsgObuls5g6Xb1YAZaCLjsy8mDSypEg9D5ze2hb6y32D8A1C989FJ+IE5rZcrfhGR0NjdW3FsJOM
	6ZAHgF+d+Wottlo6dIEfd7xIee4wpm5bKF9n1XKlYb04+sM2ElPxuaCKQRkKWXCXRyrqHNmJch3Mf
	Af89t6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKtN-00000009HiS-0u3F;
	Fri, 23 Jan 2026 17:24:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKtL-00000009HiB-2w1j
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 17:24:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C673560135;
	Fri, 23 Jan 2026 17:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8591AC4CEF1;
	Fri, 23 Jan 2026 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769189054;
	bh=1iFXkFiW5IRcxv20ZM521sbV1+F7TXqM6Nja0SMCg+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2FN5rsCQdDfLjoZ8VgMn7Rh+tli/6+KJU+t2Q4q7dUCCl7ql77pgz3nOigmZ2CXY
	 uFjc2pwbSRuCWEPulozzncyX30wXc17aPkLftO9+UlUEvpSLK7xeZBrs2wuQbYl7sy
	 m+LZljKi42aieQjxuhIUnLDbmF+qLgo5mIS2e3OfBkYqBzp3FD6Hj8qgR8MfSbS+eo
	 basn4ghX6Rjas1XzHxe4mdeB6gUTcr1UEnMknpM5ieHVGV+JHvhk+mt11jT17IbEUC
	 h/dF4eZHET+B+Jc7R5Pz7Kj+QreRJ2T7F5EZ44+6OTKJPFLKznKz8arW1u965Eh/Ba
	 i3Cgbm4UKBKPA==
Date: Fri, 23 Jan 2026 17:24:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: riscv: Add Supm extension description
Message-ID: <20260123-regime-example-c53814f85bad@spud>
References: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
 <20260116-supm-ext-id-v1-1-5fcf778ba4a6@riscstar.com>
 <20260122-headlamp-champion-0bbad2551d33@spud>
 <CAH1PCMY+FrxkT+qnAXbS75T=PTzGB_BkKWY1f3-anOjHwG9CkA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1PCMY+FrxkT+qnAXbS75T=PTzGB_BkKWY1f3-anOjHwG9CkA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6300688014640680995=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6300688014640680995==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7xcWmSwswcfCaFDt"
Content-Disposition: inline


--7xcWmSwswcfCaFDt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 07:29:52AM +0800, Guodong Xu wrote:
> On Fri, Jan 23, 2026 at 2:52=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Fri, Jan 16, 2026 at 10:10:31AM +0800, Guodong Xu wrote:
> > > Add description for the Supm extension. Supm indicates support for po=
inter
> > > masking in user mode. Supm is mandatory for RVA23S64.
> > >
> > > The Supm extension is ratified in commit d70011dde6c2 ("Update to rat=
ified
> > > state") of riscv-j-extension.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/extensions.yaml | 17 +++++++=
++++++++++
> > >  1 file changed, 17 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index 4ffd61926505..1922dff03787 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -262,6 +262,23 @@ properties:
> > >              ratified in RISC-V Profiles Version 1.0, with commit b1d=
806605f87
> > >              ("Updated to ratified state.")
> > >
> > > +        - const: supm
> > > +          description: |
> > > +            The standard Supm extension for pointer masking support =
in user
> > > +            mode (U-mode) as ratified at commit d70011dde6c2 ("Updat=
e to
> > > +            ratified state") of riscv-j-extension.
> > > +
> > > +            Supm represents a combination of underlying hardware cap=
ability
> > > +            (Smnpm or Ssnpm), U-mode consumer privilege level, and M=
/S-mode
> >
> > Should we therefore make this require that Smnpm or Ssnpm are present?
>=20
> I'm not sure. Would U-mode DTBs typically omit the privileged extensions =
like
> Smnpm/Ssnpm, making such a dependency impractical?

I don't actually know of any u-mode software that uses a devicetree, but
my guy feeling is that people won't trim out the lower-priv mode things
because they might want/need to know if those features are available on the
platform.

> > > +            software configuration that enables pointer masking for =
U-mode.
> > > +
> > > +            DO NOT include this property in device trees targeting p=
rivileged
> > > +            system software (S-mode or M-mode).
> > > +
> > > +            This property is only appropriate in device trees provid=
ed to
> > > +            U-mode software where the next-higher-privilege-mode sup=
ports
> > > +            Smnpm or Ssnpm and enables it for U-mode.
> > > +
> > >          - const: svade
> > >            description: |
> > >              The standard Svade supervisor-level extension for SW-man=
aged PTE A/D
> > >
> > > --
> > > 2.43.0
> > >

--7xcWmSwswcfCaFDt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXOuuQAKCRB4tDGHoIJi
0lARAQCw6xeBCMvnkMZXdVDTmW8UaI95vKbCXYpHPfG3jyruoAEAnfru/kFDHa+s
T43B5i4zwtYiw6O0oerDYK/DrbtnUg8=
=udYY
-----END PGP SIGNATURE-----

--7xcWmSwswcfCaFDt--


--===============6300688014640680995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6300688014640680995==--

