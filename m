Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5621DC7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 17:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7v5cK0NZ14d4GCofOzGWyC1KMn9+824zVy0l3xD5nc=; b=Y+WdKVzdbBJuwwraNOQBZH5vA5
	iZF96oOGrCAdB8w50jtwtnvpD+Ag9qMMJtdvlZeLuGyMkkjISUaBUe4utBtIMYZFYD6XcTI3ftFHJ
	rgdhi1T1kFLQPysKqTXKEB1D8YO0iQ/7V3r3Z1bfZO123AKGK5EOI4I80xaxSrdXJizP82wB9qhZw
	E0fl3HarNANtA48MSH5tUHjLPrxoj/tcWlZxNGm6swwmlvmtwYazB6kmNcTxFQtwPaZSS5nOYrEIi
	upnUA1qVnlmfkxLBsIZH2zDn78edK1rA76TBKMMs2g0/u1/eXCb2G/ZdsDTyFRViCotqAdVGCL+xK
	Jd8uCxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw4ab-0013EI-0V;
	Mon, 08 May 2023 17:23:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw4aY-0013Dj-0D
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 17:23:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8268E612F3;
	Mon,  8 May 2023 17:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBD8C433EF;
	Mon,  8 May 2023 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683566631;
	bh=o/W/upx1oxojt1pe4iM5As9FLK8IM26SwU7IdjNmdic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vavk1aH4LhGTgSh9NkidLrV8NHrkBidhBM6Hidv08ZSmSvHsALg6+qSJIGuAZtCA+
	 z2xbjNHytvlsPBf3kP5dh+ytxtT+FL3EA4bCVAa/8R2KrkCOt/Sk5hT9/BSZO0Ggiu
	 NsnM7UCw+UMMpvY/6Di2BpgcUy2FGjMxHWaPmK3VxxAkumIzwknPgPrzNPF7xZNwmQ
	 CkY07sWgc8xgjrO3e81I2WSgYfUxGHEEcyn6aBFNOIU/fClvvdxLJvagBOr+7PNvL/
	 0Mbu7vnY82GaJsettzFO4ybqJ+gRThiIqtAJBuHJQrI/ZMVZZQ3JqUbD53yVgyZecc
	 l+9/BknBT/rlw==
Date: Mon, 8 May 2023 18:23:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 5/5] MAINTAINERS: add entry for T-HEAD RISC-V SoC
Message-ID: <20230508-problem-repulsive-939edfdf7663@spud>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-6-jszhang@kernel.org>
 <20230507-woof-eldercare-f1323b10bde6@spud>
 <ZFkgsHGvEIxGDxXv@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZFkgsHGvEIxGDxXv@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_102354_150317_A7FBF3CD 
X-CRM114-Status: GOOD (  19.08  )
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
Content-Type: multipart/mixed; boundary="===============4360978986889383881=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4360978986889383881==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dSqjxm9sPfcjRPhf"
Content-Disposition: inline


--dSqjxm9sPfcjRPhf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 12:17:52AM +0800, Jisheng Zhang wrote:
> On Sun, May 07, 2023 at 10:21:26PM +0100, Conor Dooley wrote:
> > Hey Jisheng,
>=20
> Hi Conor,
>=20
> >=20
> > On Mon, May 08, 2023 at 02:23:04AM +0800, Jisheng Zhang wrote:
> > > I would like to temporarily maintain the T-HEAD RISC-V SoC support.
> >=20
> > What does "temporarily" mean?
>=20
> I got a Lichee Pi 4A board, and want to mainline its support. Sending
> the new dts patches needs to touch MAINTAINERS entry, so I added it.
> But I expected an experienced people from T-HEAD, with many
> kernel contribuitions in the past, will take the maintainership
> finally, for example, Ren Guo. He knew this SoC better than me.

I see. I don't mind applying the patches for the platform for now, it's
not too much more on top of the other vendors that I am doing as things
are still low enough volume, as long as someone is willing to review
them as they come in.

Cheers,
Conor.

--dSqjxm9sPfcjRPhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFkwIgAKCRB4tDGHoIJi
0tkSAP9xd/XjooRGUlzzIUbh3gmKoz4mYhqIJ9UqthFrEHzv0gEAygtJ+Nsi4GLZ
kgnge/Y+sUV+cRzazxPcssoUADlu7gE=
=L9rr
-----END PGP SIGNATURE-----

--dSqjxm9sPfcjRPhf--


--===============4360978986889383881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4360978986889383881==--

