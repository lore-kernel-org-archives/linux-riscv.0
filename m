Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F93C0218B
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE+4dO8HapGJVTpV04K35Ry/vZpSyEFda/+TTHnXFyI=; b=x1eQabNBcezyqL5pqfqPZwetL8
	VoZUURy1c4SzYTtB1R7bQNhhVUtJbztoxLejhEiDGk5LwlmYv6eVrUO+AvEG3npgEvqdUH0QVgj/C
	SFoX/wD8UTcX2sACavRYZYPDAc1yZVsGD+H8ptMijxHDnQ0rFZYcLLmW2078RvkCdFWxhqzsmH6kA
	hlgVnO780rsFe4KnSOskoktplZgMd0uQ3UdmVqPSNiGneUNeL2uG4/XhqxaOSlyeYBJUYcn7vQrrZ
	xvhs22wO0jIpyAVRtWTsU2vDBqAHzoXVFFNJK3TuMNjRaNRkEcs+gvjhxNsWUgiDneYrcWl9KPTWq
	AQ7Fnzkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMkA-0000000F8g3-04bI;
	Fri, 24 Jan 2025 16:41:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMjd-0000000F8cq-2aXE
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 16:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86395A41B41;
	Fri, 24 Jan 2025 16:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EC8C4CEDD;
	Fri, 24 Jan 2025 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737736844;
	bh=ZCIDAYKnmNGR7uBbI0PwRs38xGHHKQrBRx0w7qn9NCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyQIF9yo0Yiv7h+piO/BjINkoso2SNDfeK0K5vkOJ9jkjRJIFnLz7b398ueGS6rTi
	 Nv5hA/F273B47kssLNJdbuwIQLVVmVNAYInObP7g2klvZ76YelTmF2FTwXWqBlAbRw
	 Mj8hBwDoZsDFP1JxVjl7gnhKF1cowXbEcwCPHs+wiwByCsncLIZ5ESXAjrPHr3821F
	 kueCb6y2kIaMxO8Wi4kl7aFM2defoNN3NEIcmjkqrbtPkh9bgHIFyjydCFVFLPm3iz
	 w11v/9crnUxdPmVpzkTQ74ClK4xueXUwMNUUlMA60gTQaPYhVfaRvvxLFwnHYa/50f
	 o++vv08g27hKA==
Date: Fri, 24 Jan 2025 16:40:40 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/3] riscv: dts: starfive: jh7110: add timer node
Message-ID: <20250124-unweave-stainable-debbb0e75cd4@spud>
References: <20250102204137.423081-1-e@freeshell.de>
 <20250102204137.423081-2-e@freeshell.de>
 <20250113-monotone-maybe-97ae1d171710@spud>
 <b62cfcc1-5d10-43a1-80ae-f09a53c739de@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <b62cfcc1-5d10-43a1-80ae-f09a53c739de@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_084045_716009_E359F4B6 
X-CRM114-Status: GOOD (  19.32  )
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
Content-Type: multipart/mixed; boundary="===============7109801344717227455=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7109801344717227455==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="emhvCFUstfqV4EwB"
Content-Disposition: inline


--emhvCFUstfqV4EwB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 03:19:33AM -0800, E Shattow wrote:
>=20
> On 1/13/25 10:39, Conor Dooley wrote:
> > On Thu, Jan 02, 2025 at 12:41:21PM -0800, E Shattow wrote:
> > > no idea if this does anything useful; not needed for boot
> > >=20
> > > Signed-off-by: E Shattow <e@freeshell.de>
> > > ---
> > >   arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/bo=
ot/dts/starfive/jh7110.dtsi
> > > index 0d8339357bad..0bc922b3ae8a 100644
> > > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > @@ -344,6 +344,15 @@ tdm_ext: tdm-ext-clock {
> > >   		#clock-cells =3D <0>;
> > >   	};
> > > +	timer {
> > > +		compatible =3D "riscv, timer";
> >=20
> > compatible has an extra space, so won't do anything!
> >=20
> > > +		interrupts-extended =3D <&cpu0_intc 5>,
> > > +				      <&cpu1_intc 5>,
> > > +				      <&cpu2_intc 5>,
> > > +				      <&cpu3_intc 5>,
> > > +				      <&cpu4_intc 5>;
> > > +	};
> > > +
> > >   	soc {
> > >   		compatible =3D "simple-bus";
> > >   		interrupt-parent =3D <&plic>;
> > > --=20
> > > 2.45.2
> > >=20
>=20
> That extra space is my error and does not exist in U-Boot. Good catch! So,
> when corrected it appears to boot either way with or without and not any
> change in functionality that I can discern. My priority then for this ser=
ies
> is to drop this patch as something unnecessary.

I don't mind having it, if it makes the hw description more complete,
even if not used.

--emhvCFUstfqV4EwB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5PCiAAKCRB4tDGHoIJi
0mZGAQCKTX5vFdz0jcBot/jS9u2rLS53alcBk3UoQWyxovrMLwEA24f0rXaG2StP
dpCyn2UvBPNN/2eE8X/wBvNUZRP+sQ4=
=6vR5
-----END PGP SIGNATURE-----

--emhvCFUstfqV4EwB--


--===============7109801344717227455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7109801344717227455==--

