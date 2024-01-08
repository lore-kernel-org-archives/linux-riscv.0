Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F15EC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKg+TUD1840ZIvLquVJuJklhtRhZ7ykOckRDaJVnmu4=; b=Vgu/mshX0HhgBh5qUlo28cHSoq
	6Tucu7Tx5JolCT3pyzc96mpTtlpVIiwotg26QG7MF23A2EO66XIXIL6R1SSPDTT3T9Efus1n6Y9yB
	poEglZmhsDRy6/HqrPfZIAwkSRk1p9BRtCoaFdjborJK3jhDTxT5ljnMDqEDgwM/dOVAj1BnzOBts
	Gh/9yAv+hlwkbxR1fZV5dpjUcmOqer00nT75ps/5gmPndojUk5Bcku5NYvVSk91+MZMsYJv6eh3en
	hEFCSPrJqGUxUtIQcjeUqwZMWCagp1qbX4i8BEkxDa2Y5MR/EjzBss47lk1WKk8m3KuCGBxltasX6
	+Bnv8rHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtTF-005l2n-1a;
	Mon, 08 Jan 2024 17:31:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtTD-005l2J-0n
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 17:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7FB4CCE130F;
	Mon,  8 Jan 2024 17:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9E7C433C8;
	Mon,  8 Jan 2024 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704735083;
	bh=TpcI3dIuWNjlKbiZdSsWqC4HAoWP9zhHwULpZ+JjExE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=un01cIWsY2l7ec12fbUWfb1qr8tZmvTjPeOHQAZJDN7e8roSZWeXC8LHNqMgPmpt/
	 OSJq5FkZWjL4xVuyHSbSu7PnsXNvasjfv2Fewr2IM4Kn9JwVTcO+e8Atyi9TiwW0TE
	 2xCNujZTg4R/G6UpksnYomw7qHgAQ+vTmtoLzh4k+sBUjltbXgHCuwUabRygiYJh63
	 ZgkmEgfsZIbiXJaHkMiwJxqdY1kSPBHIcaKcQb5VU33KHe7SQSHhGtUqHxXc9VX8dI
	 V4xdKwwTFgLcd5t635lQSRPyblLOgmp1KqPriyffLCc/wFGfI/YcwXKFK+C8BhEkxH
	 BRzEyAvcqb7XQ==
Date: Mon, 8 Jan 2024 17:31:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	William Qiu <william.qiu@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v10 3/4] riscv: dts: starfive: jh7100: Add PWM node and
 pins configuration
Message-ID: <20240108-hubcap-stubble-ecf6ea34afb9@spud>
References: <20231222094548.54103-1-william.qiu@starfivetech.com>
 <20231222094548.54103-4-william.qiu@starfivetech.com>
 <CAJM55Z9tyrR7emEBrY0+Fnc_LUFQHkqYHLQ4ptL=XQMy52qtVw@mail.gmail.com>
 <xd2ryic6mr6d6cbljjbhmr56mfpchfzkmc3lnznhmoiwyzip2a@6bhbho267e7c>
 <CAJM55Z9DgFCwXjQGhe+urnOg-AkJMbQUR+biXKONQsRcup1GXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9DgFCwXjQGhe+urnOg-AkJMbQUR+biXKONQsRcup1GXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_093127_659836_E23064E6 
X-CRM114-Status: GOOD (  20.96  )
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
Content-Type: multipart/mixed; boundary="===============1323958351873910126=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1323958351873910126==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uwSZRLPC3LWeYwWV"
Content-Disposition: inline


--uwSZRLPC3LWeYwWV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 05:18:45AM -0800, Emil Renner Berthing wrote:
> Uwe Kleine-K=F6nig wrote:
> > Hello Emil,
> >
> > On Sun, Dec 24, 2023 at 02:49:34AM -0800, Emil Renner Berthing wrote:
> > > William Qiu wrote:
> > > > Add OpenCores PWM controller node and add PWM pins configuration
> > > > on VisionFive 1 board.
> > > >
> > > > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > >
> > > Sorry, I thought I already sent my review. This looks good.
> > >
> > > Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >
> > Is this also an implicit Ack to take this patch via the pwm tree once
> > the earlier patches are ready? Or do you want to take it via your tree?
> > (Maybe already now together with the binding? If so, you can assume my
> > Reviewed-by to be an implicit Ack for that.)
>=20
> Yes, sorry. This is also meant to be an Ack from me.
>=20
> I imagined the dt patches would go through Conor's riscv-dt-for-next bran=
ch,
> but the pwm tree is certainly also fine by.

idk, I prefer things to go as MAINTAINERS indicates, in case something
is determined to be wrong in the cycle where the patch is in the "wrong"
tree.

I suppose I could take the binding though, since I am CCed on every
binding patch under the sun... I'd rather an explicit ack in that case
though.

Cheers,
Conor.

--uwSZRLPC3LWeYwWV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZwxZQAKCRB4tDGHoIJi
0nUqAP9yJe3WrgYMWXpHjBz60+ar3t/qeJkOfk0Jf5wV3nSGKQEA/+BcCFymlJ3W
7iVCVwtlZAqIdUtOXuLEG5keZjo0kwI=
=7uiV
-----END PGP SIGNATURE-----

--uwSZRLPC3LWeYwWV--


--===============1323958351873910126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1323958351873910126==--

