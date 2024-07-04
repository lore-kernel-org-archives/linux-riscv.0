Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26BAC30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4H4kHQEVdkhXXdFlDR37svZkJ+atF4sAtc8NQAKLAg=; b=HngWhAYjS/BHzfCESLmK58ka/d
	YL12tJNHK1UH9Qj3UH2rQeSXC8IqlGmOwRSsJ7wxounC5k6F7tsKCMVdwwCreb9NVuDP6t2pBLy5b
	jhIDV12Fo194ByxpvIGpJu8GL5js85PQ7LhQIOoz9xUmZkcPAVeMKqvL3PwnZ1CyM3ApC7olz38yZ
	OAJxCxtMLk+9Sshhkt+MgXgPTYS6ODGaOGB0UL349bgEUScXTIool3gv8tFbuImjZ08lK5hYUwpyv
	STkkUhE7/EvYIrSrIuEO1IyDnwxMl0QAZep2Dvtdn/OEoXebhLvhgDoGDklDAPebD8G6OAvI2HgvI
	CYua+Y4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPeD-0000000DtIM-3sPj;
	Thu, 04 Jul 2024 16:49:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPeA-0000000DtHT-0b5J
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 16:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6BEE1CE069F;
	Thu,  4 Jul 2024 16:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B306C3277B;
	Thu,  4 Jul 2024 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720111763;
	bh=V/hNryxYUoqX/3hr4qkJMKJe/sxOnEhMLqbIa0w1mOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ChPzUC53rna8olX5yXkpeizcxuhdkvoYsJyKcGnFlIstZh48N3YMeD2dM6zNSfUlL
	 CGeSlmXr1KfvsdCQRDKBFX7d8Id0oUlHq1awnegoPAgSHebCDicc7n8NOp9mSgaTfD
	 BTMFfS8WoRS4JOx7tARRw6R5tE1DBOySbN+u+qDIQcp7XPwOYHwjAwVubSj5DNfFW7
	 79QrD59o3EGx0QxC9SKZ6p3iani42yt9C7CH/x2lqyXhmNx8R5As7bfGWWSMVbBIIK
	 7LM3cryE5eYoY4wv2Q8RhLX0sFVHDTDQWvhGOqhS+vaMrHbpijgf45c3pBP2zCaQaN
	 xc/Dfk/nPyyWA==
Date: Thu, 4 Jul 2024 17:49:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: add basic spi node
Message-ID: <20240704-nifty-footman-a0b21ee461e0@spud>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-5-kanakshilledar@gmail.com>
 <20240703-juice-refreeze-62c468a56ea5@spud>
 <CAGLn_=tVZ3StW3uB+CkcHBpSJG8PfNGSM6zOVV6OSJeL2Pz56A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGLn_=tVZ3StW3uB+CkcHBpSJG8PfNGSM6zOVV6OSJeL2Pz56A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_094926_382049_31B43280 
X-CRM114-Status: GOOD (  19.31  )
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
Content-Type: multipart/mixed; boundary="===============5018553526621870239=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5018553526621870239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iudhDWt6j+LdvUYo"
Content-Disposition: inline


--iudhDWt6j+LdvUYo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 11:12:43AM +0530, Kanak Shilledar wrote:
> Hi
>=20
> On Wed, Jul 3, 2024 at 8:15=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > Kanak, Drew,
> >
> > On Mon, Jul 01, 2024 at 05:43:54PM +0530, Kanak Shilledar wrote:
> > > created spi0 node with fixed clock. the spi0 node
> > > uses synopsis designware driver and has the following
> > > compatible "snps,dw-apb-ssi". the spi0 node is connected
> > > to a SPI NOR flash pad which is left unpopulated on the back
> > > side of the board.
> > >
> > > Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Separated from a single patch file
> > > ---
> > >  .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
> > >  .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
> > >  .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts |  5 +++++
> >
> > Didn't you say there was a flash on one of these two boards?
> Yes, there is a SPI nor flash pad left unpopulated on the bottom side
> of the LicheePi 4a
> carrier board. https://wiki.sipeed.com/hardware/en/lichee/th1520/lpi4a/2_=
unbox.html#Board-hardware-overview
> notice the reserved pad in the bottom part of the image.

Ah right, unpopulated. That makes sense, thanks.

--iudhDWt6j+LdvUYo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobSjgAKCRB4tDGHoIJi
0hWfAP4uT4pgwm2LlqNsYq0IrYwSClAiEbvyWGLDIpcB45LO4wEA/iWiNXaMCveq
fX/ADDYJWod2qCc/NImHzdaaCxqBKQk=
=fj/5
-----END PGP SIGNATURE-----

--iudhDWt6j+LdvUYo--


--===============5018553526621870239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5018553526621870239==--

