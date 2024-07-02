Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3114C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Wo/Ugn39giA9z4OJq0ki8u1afTvlOg/Y5fo6zG6vGc=; b=hWBQqwK3CDzMZtsC4gXhuWoKVT
	62SMfWUjmgqGfrEqu5CCm3z172fA4kDLyyVvk2TmYJ0Qsa5AYT8vpZht+MfTRigft2emqNSVZp/e2
	ZZq2IJH/62QmAbX1QBMUehs01tuoe+hExahRQMo62cn8aXC47oEcqse28Nyf0RIpbEFSuaWtXNoHW
	7/f7Zg1p+SZH5xdNPDZ2rLXvhrQ77WTsWvxhiMtn2C880a97X1Nhb/0kHY1wdf2VoIRqxpixnf8kE
	u+8Vpos/jM8glKndbbbaiSxhmmZAV+o6tGaB+9oe9yLLLFZFCJybORXu8Szx/NhPFL/n5VZ+gctn2
	ykyv6iqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOfbW-00000007EXr-2wxJ;
	Tue, 02 Jul 2024 15:39:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOfbT-00000007EWx-1FrR
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 15:39:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CDB361E10;
	Tue,  2 Jul 2024 15:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64C5C4AF0C;
	Tue,  2 Jul 2024 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719934773;
	bh=g+sRA4FxF0h1IXfXKKTkTHt+QuvIbChKxddB8lzK4EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2rFR4+1H8QAjHvU9Nz3JkKytSJuyGXKQhLFL1bLBu4/dRgrX3qdt0w6Xq/S6XkFZ
	 ZlB8VolHFV5FXsu4clie838j9pElkHVJKrVH2pYsB34+zZPYXftXRi0jLjnmKosCF+
	 XRqvP4pTy97ke6vL8nabJ3odm4GxIbubsDZztRCtBQhRkPTZeOcs6LUWEU8C684usv
	 5ZbydD7hBTg+SJjg+VwMNbV0djJTy9wrTgEA/3DLdINP+ZmnGY9KmI+sMgil7QiQMZ
	 t9VU8adMQ/COk9f2GOfv1+DkuhttuUaaPgJg/2LUPc3gtKxmh4MJHSExYyjk3CSlLz
	 jq57ItKWe1/vg==
Date: Tue, 2 Jul 2024 16:39:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, tim609@andestech.com,
	dminus@andestech.com, ycliang@andestech.com
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <20240702-protegee-exploring-49c0dbd831e5@spud>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
 <0cc13581-5cc4-4a25-a943-7a896f42da4c@sifive.com>
 <20240701-prancing-outpost-3cbce791c554@spud>
 <7ab7d629-6993-4cad-b5b7-62bddfc74a49@sifive.com>
 <20240701-pyromania-spinster-709a6c8cc460@spud>
 <ZoPMEaq8wKzXhFuA@APC323>
MIME-Version: 1.0
In-Reply-To: <ZoPMEaq8wKzXhFuA@APC323>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_083935_491712_4B63C9C1 
X-CRM114-Status: GOOD (  41.99  )
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
Content-Type: multipart/mixed; boundary="===============2684194992434962611=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2684194992434962611==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hXUitlnmUnc9XLtm"
Content-Disposition: inline


--hXUitlnmUnc9XLtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 05:46:42PM +0800, Yu-Chien Peter Lin wrote:
> On Mon, Jul 01, 2024 at 05:31:01PM +0100, Conor Dooley wrote:
> > On Mon, Jul 01, 2024 at 11:11:55AM -0500, Samuel Holland wrote:
> > > Hi Conor, Charlie,
> > >=20
> > > On 2024-07-01 11:07 AM, Conor Dooley wrote:
> > > > On Mon, Jul 01, 2024 at 10:27:01AM -0500, Samuel Holland wrote:
> > > >> On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> > > >>> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch=
/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > > >>> index 64c3c2e6cbe0..6367112e614a 100644
> > > >>> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > > >>> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > > >>> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> > > >>>  			riscv,isa =3D "rv64imafdc";
> > > >>
> > > >> The ISA string should be updated to keep it in sync with riscv,isa=
-extensions.
> > > >=20
> > > > This probably looks like this cos I said that the kernel shouldn't =
parse
> > > > vendor extensions from "riscv,isa". My rationale was that we have
> > > > basically no control of what a vendor extension means in riscv,isa =
so=20
> > > > we shouldn't parse them from it (so marginally worse than standard
> > > > extensions, where it means what the spec says except when it doesn'=
t).
> > > >=20
> > > > Given how we implement the parsing, it also meant we weren't implyi=
ng
> > > > meanings for vendor extensions ACPI-land, where we also can't ensur=
e the
> > > > meanings or that they remain stable. That change is in a different
> > > > series:
> > > > https://patchwork.kernel.org/project/linux-riscv/patch/20240609-sup=
port_vendor_extensions-v2-1-9a43f1fdcbb9@rivosinc.com/
> > > >=20
> > > > Although now that I think about it, this might break xandespmu... I
> > > > dunno if the Andes guys switched over to using the new property out=
side
> > > > of the single dts in the kernel tree using their SoC. We could
> > > > potentially special-case that extension if they haven't - but my
> > > > position on this mostly is that if you want to use vendor extension=
s you
> > > > should not be using riscv,isa (even if the regex doesn't complain i=
f you
> > > > add them). I'd like to leave the code in the other patch as-is if w=
e can
> > > > help it.
> > > >=20
> > > > I added Yu Chien Peter Lin here, maybe they can let us know what th=
ey're
> > > > doing.
> > >=20
> > > OK, that makes sense to me. Then please ignore my original comment.
> >=20
> > Should the xandespmu thing be an issue, I'd suggest we just do something
> > like the following, in place of the new switch arm added by Charlie:
> >=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index ec4bff7a827c..bb99b4055ec2 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -628,6 +628,17 @@ static void __init riscv_parse_isa_string(const ch=
ar *isa, unsigned long *bitmap
> >  		if (unlikely(ext_err))
> >  			continue;
> > =20
> > +		if (*ext =3D=3D 'x' && acpi_disabled) {
> > +			/*
> > +			 * xandespmu predates this "rule", so special case it for
> > +			 * hysterical raisins
> > +			 */
> > +			if (strncasecmp(ext, "xandespmu", ext_end - ext)) {
> > +				pr_warn_once("Vendor extensions are ignored in riscv,isa. Use risc=
v,isa-extensions instead.");
> > +				break;
> > +			}
> > +		}
> > +
> >  		match_isa_ext(ext, ext_end, bitmap);
> >  	}
> >  }
> >=20
>=20
> Thanks for the hands-up!
> We don't use the deprecated riscv,isa to specify xandespmu, so no
> need to address this special case.

Great, that's good to know - thanks!

--hXUitlnmUnc9XLtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQfLgAKCRB4tDGHoIJi
0hXfAQCCxZXEBqT4cPTHb0LGQh6uikBkC+CR23ztTmUdfDTFHgD+LGxDU34bLk9W
K+AGaZjFkN9dMlpWdebZ/9qZ/D4iqAY=
=KERh
-----END PGP SIGNATURE-----

--hXUitlnmUnc9XLtm--


--===============2684194992434962611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2684194992434962611==--

