Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F971C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 20:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2w8g3JdFdAdc3mSbepEgIBm/1YZGXtnXEgTaLvlRh2o=; b=WeHecYWM0oTYmH/cJRVk+FjQu4
	LT43Wvp/fBYGi2C5aNW0fz4MwNnTM1dEZLn7QG14/AzCvpazHBDRUdDYK/gMiL1xCS3twio3ywgB9
	5BUHiM36m8w23MNq4I68cPXpvEC1UHY+VW++wyfl4vMcKmCn1YqTCDj8wS7dBwR8IKXXPOb6yRPCh
	o1eQC7c8oo5Mu2eJCgrxIrbdR13kVP9H7h3tuBfvIfF04h+SwukRpmXiqCWCBShS+rSjXe0qijfb7
	FSu/PHv/qU+qIkGYAKq5tntbXPZen/GoYdvz6g9GNnxEaL2c51Hf96UZzBt446/Fo8Uz+Bq3FkY3M
	HBtqshQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR0G-0000000CUP0-1VTS;
	Thu, 03 Jul 2025 20:57:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMFV-0000000Btrq-1nmo
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 15:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EC4D5C6564;
	Thu,  3 Jul 2025 15:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC50C4CEE3;
	Thu,  3 Jul 2025 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558000;
	bh=7ZkAS2JYYvW6DUgBJBC+3Y0euDXDj7tfAQya4dZqio8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNDYiHSf1wMeVVTUajE5QTDHdUB7IW/EJuZPrAme8a4JTtcH4J7V1Wza0M1XQdimL
	 esOhAP3nVDwCF9cgDXJ3XLDz/ooPorxqplUaYwjWY7D08fyh+XrB+LU6Td32YWu64u
	 fi3e6qn+v5txVbRUI9GndtiT+6uB6MEht1gTHSTvk/SBHxi0eBW3KwRW/sIBuQJ11z
	 Mo0SWecwMP2ZSvSvOT6NTg8yMOKZHXUwz4lrtVg6uM6OtvEZ+MZnVrB9R3lqI3PFcj
	 LWTIaoI1iKr1nqR4XA9hUCsOwwvcDfHDXJTrja4jONkIzd9mif0/sloypMm+rXm4Pg
	 hV865px6dJrxA==
Date: Thu, 3 Jul 2025 16:53:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ben Zong-You Xie <ben717@andestech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tim609@andestech.com
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <20250703-exposable-exes-fd41e7318fba@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
 <20250609-donut-oozy-4dcc8b8a292d@spud>
 <20250609-twiddling-clamp-eaa0dd2b1cad@spud>
 <aEmrHPd7RxUSOLAY@atctrx.andestech.com>
 <20250611-tapeless-arson-a6ace3c42c00@spud>
 <352681c3-88ca-4122-9ad3-0a0ef33caf7b@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <352681c3-88ca-4122-9ad3-0a0ef33caf7b@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_085321_558655_E71A8636 
X-CRM114-Status: GOOD (  42.41  )
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
Content-Type: multipart/mixed; boundary="===============6461845252258350134=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6461845252258350134==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eJ54DOEKjtpZVjGl"
Content-Disposition: inline


--eJ54DOEKjtpZVjGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03, 2025 at 05:32:08PM +0200, Arnd Bergmann wrote:
> On Wed, Jun 11, 2025, at 18:21, Conor Dooley wrote:
> > On Thu, Jun 12, 2025 at 12:13:16AM +0800, Ben Zong-You Xie wrote:
> >> On Mon, Jun 09, 2025 at 05:17:50PM +0100, Conor Dooley wrote:
> >> > > > >=20
> >> > > > > Ball is in your court now, after rc1 make a tree and get it in
> >> > > > > linux-next, and then send a pr to soc@kernel.org with this new=
 content.
> >> > > > > Perhaps the defconfig should go separately, I can take that on=
e if you
> >> > > > > want.
> >
> >> > > > Thanks for your guidance on these patches. I will send a PR to
> >> > > > soc@kernel.org as you suggested.
> >> > > >=20
> >> > > > For the defconfig patch, I'm happy for you to handle it. Just le=
t me
> >> > > > know if there's anything specific you'd like me to include.
> >> > >=20
> >> > > Okay, I picked it up on the basis that you'll send this all to Arn=
d for
> >> > > 6.17
> >> >=20
> >> > Sorry, I think that was really poorly worded. I picked it up on the
> >> > basis that you're going to send the other patches in the series to A=
rnd
> >> > for 6.17.
> >>=20
> >> According to the SoC maintainer documentation [1], I should send a
> >> patchset (not a PR) to soc@kernel.org. Since I'm not a submaintainer y=
et.
> >> I think I should not sent a PR to the main SoC maintainer. Is that rig=
ht?
> >
> > I think you can send a PR and not worry about it.
> >
> >> Further, I have two questions about sending a patchset:  =20
> >> 1. Should I send v5 or start a new patchset?
> >> 2. Should I continue excluding the defconfig patch, as we discussed
> >>    previously? I think it should be included now.
> >
> > Arnd, you okay with a defconfig in the same branch as the dts/core
> > bindings for a new platform? I'll happily drop it from by branch if it
> > can all go as one.
>=20
> Sorry I missed your question earlier, I finally got to it now as
> I am going through the pull requests in patchwork.

Yeah, I've been kinda out of it lately. Ordinarily I'd have pinged you
on IRC or something, but instead this thread has just been sitting in my
devicetree mail folder.

> Having the defconfig, MAINTAINERS and Kconfig updates in the branch
> for a new platform is fine, in this case it makes sense to keep
> everything together.

Okay, I have dropped it from my config branch.

> I'm also planning to have multiple new SoC targets in 6.17 and
> would put them into a separate branch that does not contain the
> dts changes for the existing SoCs.
>=20
> For the pull request that Ben sent, there were a couple of
> mistakes, I'll reply on that separately. It probably would made
> more sense to send the patches to soc@lists.linux.dev (note
> that the soc@kernel.org address got renamed but they still
> both work) than to send a pull request this time.

Is that a general comment btw? If there are other people coming in with
new platforms should I ask them to send patches to soc@lists.linux.dev
instead of a PR for their first time?


--eJ54DOEKjtpZVjGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGanagAKCRB4tDGHoIJi
0oxtAQC/emJTagK2s7eNu+LaXiETKXUzE658RJtlELVw2G2+PwEAwr21eS7DTVdk
KKKtwTjYS7KRgTPG96/98VaVPrPglAA=
=hY2F
-----END PGP SIGNATURE-----

--eJ54DOEKjtpZVjGl--


--===============6461845252258350134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6461845252258350134==--

