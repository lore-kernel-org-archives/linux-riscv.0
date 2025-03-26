Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ED9C36010
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 17:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvAcQl7AO/vczwy96ynXZ5S8NKGGKUvT17zsQw/OSUk=; b=TA7O8RG55oT49+AsJrIbYN1/Se
	M0NgTOxCfA+5WUxwMQuXW+aTSNZPD0orobjwhvm6llvw5H3B6jcASBMrlUxrcdvxKZYAleNpV4i65
	WueRnYpcO1tsx6OMb07AmNOSLRUKzmgXXCDvGEJQnndmsS3GinUL8iguNTYF3iQ8n65E7Dj4VaQLI
	yaflzo/tgntkQ20sZQJy13r00hZPPY7oak0Nkr6hQgVnXOTYGdCnKO97PakeZ9DZfd8UoHBtQ+bGe
	opUBYSM0icL0fqM7B63BV+WeiceZu4SeD+oS2zZLU/Ok1GuJgPeckpGaOCQmz4X+aj96j9pAiH06E
	xFE8Cgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txV1V-00000009HuH-3Rq2;
	Wed, 26 Mar 2025 17:58:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUyk-00000009HSb-3o1A
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 17:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4595D61145;
	Wed, 26 Mar 2025 17:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB1FC4CEE2;
	Wed, 26 Mar 2025 17:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743011749;
	bh=Pfbg4v0DebGjPxxWA2H3tagASlPqCzzk/T3jUMFOpVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGuYJ0Oja57q8CSfcJRR1aqMWPnV4WDD3RQN+SO/EuxjLrVzIclJJOK8tXWg6KXwo
	 vHzFZqaHbHuMu1mbOI4l6/TgHn5Q2SyCkpOtgHFKjPIZSfwYBpFBLIVQLKLaTaoO78
	 4bP5mIxYIQX7jPgVkkPyKW2M250m6VIMMTUYgBpgUCYGg4tk/FlCcBmwPeKybgJ3X+
	 OoM+TJFlsMjafJDuNp2o7HYF9nh3W7sq3EFFjFiQyrvRwuOeWXOr1Xuj9fSS91cY1q
	 e7FM04/3zdaREWyXE+sadvpG+Bjr8HM2O59t1owPdMsHXFl4ne3ofs9uEsoV6oR8J8
	 3WK0dAFTkq6Ow==
Date: Wed, 26 Mar 2025 17:55:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	"rafal@milecki.pl" <rafal@milecki.pl>,
	Anup Patel <anup@brainfault.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/10] riscv: dts: add initial support for EIC7700 SoC
Message-ID: <20250326-headpiece-muskiness-dc167183018e@spud>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
 <20250320105449.2094192-10-pinkesh.vaghela@einfochips.com>
 <CAJM55Z-LUoeh0pSDnPKpduub_UBOPeg4g3t20JA0GBosJKuiAQ@mail.gmail.com>
 <CH3PR04MB89282DDB25C289C34581DC0083A62@CH3PR04MB8928.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH3PR04MB89282DDB25C289C34581DC0083A62@CH3PR04MB8928.namprd04.prod.outlook.com>
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
Content-Type: multipart/mixed; boundary="===============8255886101397480277=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8255886101397480277==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rTLsjSiGtjGVhaqj"
Content-Disposition: inline


--rTLsjSiGtjGVhaqj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 02:20:55PM +0000, Pinkesh Vaghela wrote:
> On Tue, Mar 25, 2025 at 7:06 PM, Emil Renner Berthing wrote:
> > Pinkesh Vaghela wrote:
> > > +     soc {
> > > +             compatible =3D "simple-bus";
> > > +             ranges;
> > > +             interrupt-parent =3D <&plic>;
> > > +             #address-cells =3D <2>;
> > > +             #size-cells =3D <2>;
> >=20
> > Hi Pinkesh,
> >=20
> > Thank your for the patches!
> >=20
> > Should this not be marked dma-noncoherent to avoid having to mark each
> > peripheral as such?
>=20
> Thanks for your feedback.
>=20
> We have not added "dma-noncoherent" because there are no DMA-capable
> peripherals in the devicetree yet.
> We planned to add this later when we add any DMA capable devices
> i.e. sdhci, gmac, sata, pcie, spi.
>=20
> Do you recommend to add this property in current version?

If the bus is not cache coherent, then it should be marked as such now.

--rTLsjSiGtjGVhaqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+Q/ngAKCRB4tDGHoIJi
0n7aAP4jVxpp0wr2qb1fmfC7vFhxjp/hYUFQHIsYJhgPw/AWWAD8C8fH2G1sWMmf
o5lcIaBpmpHNe5dwLWy9UJh331OzZQM=
=xhbb
-----END PGP SIGNATURE-----

--rTLsjSiGtjGVhaqj--


--===============8255886101397480277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8255886101397480277==--

