Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A55ED7B8A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiPvsHjcXog9ikve6jr/W06Oq8ceRTZJ97ehW59Ujfo=; b=mC2Jb5hGiiOOngefMKRxZq/oR5
	kD4qHj9MlQ8MMkxZ/WDlboTrR+98KIk5ath6H/s0g+LSfkipi2WyppeJ7HmU24HgqHcYNQURNcib0
	Du0Bou/uDeHts83q9CgqHS3Fbv3egyG7X3wgnvGNjl/2vPo652oyBt92o7zqoHS2pb+LCuEVP5JLr
	3hfjGJfSlv/M0OoILticebInz2Dwo5StV18doBUnwdhPysuJ6bfKciuMg5H18EbVxuRKGVKpdZOnq
	qBoTHjp1w5Z86FfqMOzlD8mqz95e7APK8wXcdqk9yaG1dv8L7eDGJVs4hnDhxcUjH6RtWsD/b4mu5
	oDWgeAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZUy-0000000H17B-1t7i;
	Tue, 14 Apr 2026 08:51:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZUw-0000000H16z-3fy6
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 08:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E29E960018;
	Tue, 14 Apr 2026 08:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2078EC19425;
	Tue, 14 Apr 2026 08:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776156713;
	bh=AEXwQ9+zCpeRarpI+crLAToxDi6vZC8Hs1as6pCd9tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VcJ0UqUR1HWxQob5+TUyGTSp1j9V7/RfeyEcUcT0JkavYBqPFomDsk/tFrxmjjKH/
	 ZpZmnfKokk2JEx4I5YIPlnRmZ1GOv6ryaLaKF0ZkSJuT5jeJxyharSt2P7th8WuBG6
	 4M3HomPVWSxsjH+B9wAD7i+JHIaUn6HWzEfyMhnTwJvrKyVWiOGcPTRXEW3Ts24hgh
	 I0/ZpixNSnNQlQlsSPdHXBEKJ9p0bkeAwC80lmxc4+nx1nG8yhNp9m2MlFoEjKSAiv
	 HR/glsvcmkLIGkAQMRfZeT6b3Gq0NBFI2ixQjEd3M0QjOsl86SvgPmvpg4BiHf51+S
	 L7wy6TcL6qNhQ==
Date: Tue, 14 Apr 2026 10:51:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] pwm: pxa: Add optional bus clock
Message-ID: <ad3_t19jQ4P5NqSK@monoceros>
References: <20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org>
 <20260409-03-k3-pwm-drv-v1-2-1307a06fba38@kernel.org>
 <adyq-Uckwwe9uACA@monoceros>
 <20260414060453-GKA203300@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260414060453-GKA203300@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============2541655749017846016=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2541655749017846016==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lg2qudji4ddugdlr"
Content-Disposition: inline


--lg2qudji4ddugdlr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] pwm: pxa: Add optional bus clock
MIME-Version: 1.0

Hello,

On Tue, Apr 14, 2026 at 06:04:53AM +0000, Yixun Lan wrote:
> On 10:38 Mon 13 Apr     , Uwe Kleine-K=F6nig wrote:
> > On Thu, Apr 09, 2026 at 12:45:12AM +0000, Yixun Lan wrote:
> > > +	/* Get named func clk if bus clock is valid */
> > > +	pc->clk =3D devm_clk_get(dev, pc->bus_clk ? "func" : NULL);
> >=20
> > I'm not sure, but I think passing "func" unconditionally to
> > devm_clk_get() would also work fine.
> Passing "func" unconditionally, will break old compatibles(not k3-pwm), a=
s only
> one clocks property is provided, but no clock-names property

I thought that if there is a single clock without a name,
clk_get(dev, "somename") will return that one. But looking at the code,
that assumption is wrong. So keeping the conditional here is fine.

Best regards
Uwe

--lg2qudji4ddugdlr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmneACQACgkQj4D7WH0S
/k6GUQf/XUpuHEHCjJWM30P5yPGqtdpF2dQLSODSO3OqjWaYtSgh9yTuYgTCUdjg
SgQbtGGQMih30RLAqIIZFnoR/Wc5vTMrN/QSel8Ue3FlPjQ2zfGv/0alEx4mo7ny
jZeBywaadyAhFxa0PZsRbMbiJAnp3OQ7P+E4zv7thoejLC8G08YtwGH7lOJHgriw
0WaGX/7X8wz/iiC4e276/etJ/KKHH7q5RyxE0F8gUUjd4Rtyk40VnAvGNvn25Txx
BVcgvaQ+s7WG1a0P3Pny4Jgm9PYEX1BgeZF1ItHlopg0IrCVQOsblygW3xazEdAs
Oy5LF5qKWbxCFcnkUnRKEvHCXNgCSw==
=CL9c
-----END PGP SIGNATURE-----

--lg2qudji4ddugdlr--


--===============2541655749017846016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2541655749017846016==--

