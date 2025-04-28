Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745BEC3ABA4
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtVBbyu20hWhfeJeWHlM0+qiwyUKmSYWXwBsIe8HFYo=; b=b1hNDYRXY8RAON/G1U9ltP7a9r
	K73pu1PxjP6A9I1TnrWcYrl/0fWAd2COKC/FQPuE/37sbOZ0MiyV5+enV+j6sOaYbcPyyjEw/9vIT
	Ko+tuBZvIe6wB7gZi47b3Ep8qjsQHkAf+mFrvL6SIJporgBZcZ8rVqFEH6wSW+QxX7kMA+C2JRTVT
	YDVXYvlejB/rdRaO24/+R+fXjHbxReSDm1NNtXX3QvYd8RUN7vhPKEKsZIK01n9gRlcsjSnnXBsr1
	gmstWDb0o5NBZ39WMCh53vaHOUlif5iNXmURgUNuM9035dg0i3vgGk+/nha7kWa99W6eKiKYeM9mo
	GbnsbqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RUM-00000006xMH-1ulu;
	Mon, 28 Apr 2025 16:37:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RPN-00000006wcn-16wA
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 16:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 530714A658;
	Mon, 28 Apr 2025 16:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2425C4CEEC;
	Mon, 28 Apr 2025 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745857960;
	bh=rF0xSYpUAFZ4WX0DlNZ8bwKocybp6SgvR0ow4RtJX8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJ4sApbPs8cZAPRs6riv1ljCbcQ7CiZzy28hxBSkKktiy9U+LpvzS9AREKfMyb9yD
	 p6QeLWon7wtV6m9KS93qC9mlhAbJUX2ZA0DqCQn/I84FQAogyi2jkOoEwsJyONzuEs
	 QrNIQFNkLO4RpCFe1g8To5VoTRdMaDp1NqisJz4Dn74nEwsjvdtAtkV7Cze3IexatV
	 IdL9aCQYFIrViVXwpkNFusEeupVAIpQoHToWqI04iEEKj374MALpPEcWJUzueqOFA1
	 o1ZIHPUV1IsZKV/B+HQQb27iQP5dgA2LPQU3IYmAffGsCs4OjvTCF/N4RcjrqK+zN8
	 ERVr7qwiBhMlg==
Date: Mon, 28 Apr 2025 18:32:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
Message-ID: <t4tnrsyl7t7hwfm752eapz3ajxkkl23nrfemw4jy6a7khi7a7u@gow3c2ba56ib>
References: <20250420070251.378950-1-guodong@riscstar.com>
 <20250420070251.378950-4-guodong@riscstar.com>
 <kftfye2zn2ogyvuv7diuyrv5qkp43csbpkcqfcms2xp5lsuubm@z2kocdzkb7qk>
 <CAH1PCMZC5xrX07rd5bo+06zJoJDiAH3UNHqH5catwEALNJL2dQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1PCMZC5xrX07rd5bo+06zJoJDiAH3UNHqH5catwEALNJL2dQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_093241_344163_E8DD01FA 
X-CRM114-Status: GOOD (  18.87  )
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
Content-Type: multipart/mixed; boundary="===============7871799984750030432=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7871799984750030432==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7d2sgdyj5xap5wjq"
Content-Disposition: inline


--7d2sgdyj5xap5wjq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
MIME-Version: 1.0

Hello,

On Mon, Apr 28, 2025 at 08:46:50PM +0800, Guodong Xu wrote:
> On Thu, Apr 24, 2025 at 4:18=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@k=
ernel.org> wrote:
> > I want to make all pwms use #pwm-cells =3D <3> in the long run. Can you
>=20
> Sure. I can do this.
>=20
> > please use that for the new binding? (Of course this needs adaption in
> > the binding doc, the code should already be prepared for that.)
> >
>=20
> I got what you mean. The code change for that is already integrated into
> v6.15-rc1.
> Commit 895fe4537cc8 ("pwm: Add upgrade path to #pwm-cells =3D <3> for use=
rs of
> of_pwm_single_xlate()")
>=20
> Now, if I change this #pwm-cells from <1> to <3>, without the dt-binding =
doc
> changes, I would expect to see warnings (" #pwm-cells: 1 was expected") d=
uring
>   make dtbs_check W=3D3
>=20
> Any suggestions when the dt-binding changes will be merged?
> or I can add your patch as a dependency.
> https://lore.kernel.org/all/cb799d8a5bb284cd861785a691b8d5e329300d99.1738=
842938.git.u.kleine-koenig@baylibre.com/

I don't want to merge this very soon given that 895fe4537cc8 isn't that
old yet. But I suggest you adapt patch #1 to require #pwm-cells =3D <3>
for the newly added compatible.

Best regards
Uwe

--7d2sgdyj5xap5wjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgPraMACgkQj4D7WH0S
/k4dZgf/b8mf9YA0V9HfCWmvx/ccVO/gZNXUxBOUpcUeheEOR03RQ7Ha/Iixpel2
Jn1AqkzVcS60PqfpZvSgsUPaJrkRJuWnL6nFV1Pi0U8Kal89jC1sxcUTE84I5yon
hzWokjzGoXi6BPxWGVdKpNkrDF4qn3HXEDDyOX7hAb0kuSsdxFC6owK+MMNoKAGm
ptA44qdpUR9A7Qko2TB97gaMIqtPGE9qxHvsaCTyi3lMtkoKIGbue3mWqM86nBeQ
uScZ5heYBT8ix1p1z3nQpKG9XuhPltKPEsMEvUMIMN/F1M0rC1COcD5jl2wwvbBm
B7MeqakfcpoT/I5Vv5a8ttdORNz/TQ==
=x5Qe
-----END PGP SIGNATURE-----

--7d2sgdyj5xap5wjq--


--===============7871799984750030432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7871799984750030432==--

