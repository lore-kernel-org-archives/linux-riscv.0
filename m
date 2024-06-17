Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D2EC27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqpK8gBnTrKZhG2MQUn3cNaiy8WxRE/YQgmRHNaEf2g=; b=HGS42rZ1TeSUkwXolkHFjsLZ5I
	jgCI+sUhOevXrkAOaoFOZx81HWIQUHk1DoJdwYciU8pwaUAzm5s7faz/GcuOsEIKkvukulU7cX0Hf
	O1u11bTiQhZ6XEd+7DLikxOa7IYVjUtEt+r0yy97SPz/4urrNp4i/Aadnkcv3sKe0wql8uNBSWpus
	twEUJBsZO4ngNawKRafnaswDHTGRlIk1sPqhsdOK8gnSJgpTexbwx7mXvonYNmHUMeBcQpfTHpKzq
	+5lzj3CGvK3lqO3A4NRBt/dBJ7hKrsM8hGeiL2nKH96pWoMXjHPThsoiiwY1AOxNMDYFjJnOvTalD
	rQbEVBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJETb-0000000BWhl-3ZSo;
	Mon, 17 Jun 2024 15:40:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJETZ-0000000BWgf-0Sj4
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 15:40:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F45B61314;
	Mon, 17 Jun 2024 15:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63FBC2BD10;
	Mon, 17 Jun 2024 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718638854;
	bh=42hDqBHzInQELIWlWJ6Z/FBQrQe2GH5qVRKdgXovl2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXPal40qQwXg9yBesIIsPIrSQU6dPocxlDznXC5WIw+h/lK+NrfL/Y+5UEDM6sf4z
	 ne0VGv/pBIe8ridyIR95LpL8M8owUAc2lWmfBTi1BrkwNFRSb8ZMbzmf9cKTvOXe+h
	 hwJzj8ASQlc7i64FQwbsp9VqoQ6lDzC/dINSIz5YyD/+Lf1HEWsgYycmT7zDGymzwV
	 xV0GHRKUNoscXTlOEfFA8dH4db8ETiJFWpK7cl0Z8ijIUm4a/RidmdcKSbv75xQp+B
	 FMWstlfXlxvBqpQflidLqtuIutF3KQbqhiYV+ZyrEuivPiMzcQu2wF9bKrW9Ka/jn+
	 AaC4WTDm+0xOQ==
Date: Mon, 17 Jun 2024 16:40:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] riscv: dts: sophgo: Put sdhci compatible in dt of
 specific SoC
Message-ID: <20240617-exuberant-protegee-f7d414f0976d@spud>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-1-19a585af6846@bootlin.com>
 <IA1PR20MB49534C9E29E86B478205E4B3BBC02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240616235829.GA4000183@ofsar>
 <c75601a1-1389-400e-90b9-99c1e775a866@bootlin.com>
 <ZnA3O14HOiV1SBPV@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZnA3O14HOiV1SBPV@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_084057_321609_3803920E 
X-CRM114-Status: GOOD (  27.38  )
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
Content-Type: multipart/mixed; boundary="===============6214217610641383423=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6214217610641383423==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6tC78+3mmqFBDz9z"
Content-Disposition: inline


--6tC78+3mmqFBDz9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 09:16:43PM +0800, Jisheng Zhang wrote:
> On Mon, Jun 17, 2024 at 11:16:32AM +0200, Thomas Bonnefille wrote:
> > On 6/17/24 1:58 AM, Yixun Lan wrote:
> > > On 18:47 Wed 12 Jun     , Inochi Amaoto wrote:

> > > > Is this change necessary? IIRC, the sdhci is the same across
> > > > the whole series.

> sorry for being late, I was busy in the past 2.5 month. Per my
> understanding, the sdhci in cv1800b is the same as the one in
> sg200x. Maybe I'm wrong, but this was my impression when I cooked
> the sdhci driver patch for these SoCs.
>=20
> > > I tend to agree with Inochi here, if it's same across all SoC, then n=
o bother to
> > > split, it will cause more trouble to maintain..
> > >=20
> >=20
> > To be honest, I agree with this to, but as a specific compatible for the
> > SG2002 was created in commit 849e81817b9b, I thought that the best prac=
tice
> > was to use it.
>=20
> I'd like to take this chance to query DT maintainers: FWICT, in the past
> even if the PLIC is the same between SoCs, adding a new compatible for
> them seems a must. So when time goes on, the compatbile list would be
> longer and longer, is it really necessary? Can we just use the existing
> compatible string?
> DT maintainers may answered the query in the past, if so, sorry for
> querying again.

For new integrations of an IP, yes, new specific compatibles please. New
integrations may have different bugs etc, even if the IP itself is the
same. If there's different SoCs that are the same die, but with elements
fused off, then sure, use the same compatible.

I expect the list of compatibles in the binding to grow rather large, but
that is fine. No one SoC is going to do anything other than something like
compatible =3D "renesas,$soc-plic", "andestech,corecomplex-plic", "riscv,pl=
ic";
which I think is perfectly fine.


--6tC78+3mmqFBDz9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBZAAAKCRB4tDGHoIJi
0l7HAP47j2HyEc+VKIMCrgYDBYv2vBXJXmUQgX5EoSTWn2eiggD9HUVWmEdowlqP
9Cn3abEuvtkfKb4yr9voKsKLFHWBsQM=
=hwsr
-----END PGP SIGNATURE-----

--6tC78+3mmqFBDz9z--


--===============6214217610641383423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6214217610641383423==--

