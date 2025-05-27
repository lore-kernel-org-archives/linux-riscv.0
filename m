Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B014DC54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxQnJ4Wxia2B35sh+m1KnWKHQa7woO1Ulzj3KagMa/Q=; b=P7eRoalvs5M1lOGCG3POo0eEjK
	PchtIMe3R1y0S/XgR5/ioR0EA9ZzMAQtmQLm1eHGiyZ1oivJOHGbT5MnHg2zHVfDz3ftb1k4p27Vy
	+RCSsr8Dk7mLXqhfnGwjkl/+9JA4MAN9Un0eU42PnL3iWL5n9SGuyccREfifxatLlMb0x/ynPIe4d
	jC5maEqaxHfwffL51xQxOvoE6xtj0d4JKvIJq0ecSxpXtlzOs5LoHou2gxfhJJOWyIfWQVu/tZ7I7
	umgtv2MAuz74GDaTdGtBGnT/UwD0burbEA4ozjlv4DEws5uaDKumPvNhpeR4PZ/Y4AiL8Pqy6/zKE
	8YWkSGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqDZ-0000000AKcd-1JLK;
	Tue, 27 May 2025 09:03:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqDX-0000000AKcJ-2wKC
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 09:03:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A91CA61129;
	Tue, 27 May 2025 09:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD77C4CEE9;
	Tue, 27 May 2025 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748336606;
	bh=CepjyP+8Q0P8lM7xYgC7fRcPO5/D444YGpDm/oPFMSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsr3+FxZDJEeNzjVpWICNvLCrY2dAQ6fM+iHHjwd1LIfkdiIacQV2KvO7a0ud7U0c
	 jUi8nOf1811mTewLQB1jrm4TbfRivKocjf91TNEBbmpv9nH7zAYFnTnrMT2KYQ0x6W
	 brNuYokQS0qR6oF38Y+sfENS3vY5ppIGfsjfK9kfEXQg3ue9KlbfHhRBhx9bRAsDFq
	 dvqPzC3It9Es2eUYtcOuuKoD5VvbtbuWfVdUtJfSR5nov2OjhuDwbEd80uIVjCShn/
	 x4WkaUsCQtiOza4xi4S9+dieTwxB9ofpwIfXbdNakLQplD6zxHKqp3GnYqIpyx9Cqg
	 xY+MiDA26ekiA==
Date: Tue, 27 May 2025 11:03:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr, heikki.krogerus@linux.intel.com, 
	elder@riscstar.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
Message-ID: <e2erhnhqfeeb5b74x5aspowgdiqdnywmfswl7vhgr7wt3pacns@j2lbkcnjl7ne>
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <lgjntm2v4qtp3uwccriodxdefdc4vqydzl4dmula4avhws4zfi@xevkgzfuhyhl>
 <CAH1PCMZBBmDibwSLUAhDAyjAORgpS+D-U5_kfLJkbZ2r=XpFDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1PCMZBBmDibwSLUAhDAyjAORgpS+D-U5_kfLJkbZ2r=XpFDA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8196888873949111164=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8196888873949111164==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26g7v56eogwogiqd"
Content-Disposition: inline


--26g7v56eogwogiqd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
MIME-Version: 1.0

Hello Guodong,

On Tue, May 27, 2025 at 10:41:20AM +0800, Guodong Xu wrote:
> You're right that patches 1, 2, and 5 do not depend on that reset series
> and can be applied independently.
>=20
> > [...]
>=20
> Yeah. And I confirm that they can be applied without the reset
> dependencies.

Thanks for the confirmation, pushed as is to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-nexxt

(i.e. as material for the 6.17-rc1 merge window as the PWM PR for
6.16-rc1 is already sent).

Best regards
Uwe

--26g7v56eogwogiqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg1f9cACgkQj4D7WH0S
/k6Dhgf/X9WuY7qFhMFlefMe19qBwAufGzkajhCdv+bnqB05R5v/Jt+kVwQmhzec
6mBTGEvmeuNhKUA+kXqLyiTEs36yUqVI6LScD9LHe6QzBQaCmMqYelh8SgcfZ4iO
kubD1Zz0uZdhiqzajOI7+z+foBW6rZ7qgNYuOlvjPaNP2YCUYRNd8ypUGCYVn9Zr
mwZvDCDrnH2G+4Cchw+4quN/mGHULoyJawC9djxSfLhWPg72AxLlABSovzvIC+hh
b/uI5FRi/EIzcate4L1hKTVHF9rFIipT3gUv9sFbINCtAUKLhvZ/MlBVLeGWGiiK
40qWRrtpvZ859pNH+jYQzAHk2rmYYQ==
=GMeA
-----END PGP SIGNATURE-----

--26g7v56eogwogiqd--


--===============8196888873949111164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8196888873949111164==--

