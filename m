Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC57AC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 20:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdBjY6CZNK6nMm3o4LPbrU0oexwu/5Jsoln/hQP7Kok=; b=1lwIDG+omoyyyQ5y9d3fgca7D5
	Kct5LDVA1Varb7+DmNrKDyiKO1rAJDI3UViPS+cQkrKQRRDJ58opf2NiyutEiZ8h+yECPZNxgVCD0
	gnBuHSSVJrDFUn+vSllPP0HEp6a1ZuybUaPnDEInhOH/B0C7XrvBk2DE20OzOrjFqeHZRMRz+MxBc
	6AJITlhs7m7Sok0h4tKLAvIkUHSDPBGKUQwAx3eZBsdB5pb1YEaYGXBkiU3lZBGbwvVwy3/9ipntf
	0e3lijKtrsuGrKOhUP/tqdYBiYt+8yYyK7FYYwNxE5gWAMYXGYc2vWqhQeLWinDLMc3vwTtfWA555
	Xr6ZGLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefTe-00000000CEW-3iAU;
	Tue, 30 Jun 2026 20:54:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefTd-00000000CEJ-3mEZ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 20:54:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67F44435BA;
	Tue, 30 Jun 2026 20:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846451F000E9;
	Tue, 30 Jun 2026 20:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782852881;
	bh=aQrxMNIEylEiuvbRu+mi8pKFW2mloJnu3lVQOjwjvVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UYIgsbnZEVH13QexSvFBS8CuQHYP2Rajo6+lgx1+s2OpYeWhMdnYNYDL4Ac/wprkS
	 jQVrnpo/FGJAwPGpsrZy8K1Of17P22pIsN99aFiOKFjrRlYRPNxoHfmy/O4g06pleo
	 nGEuC6Go/z4VDH4nin+Q0ajgRaSjAxG0/3FOplD2p2D7VQUs7Iwo5SgsRK1w5V8CG3
	 kAI27WQNLVr0KGcVE6Qzk1cNQbPlAclFlWWyIsZpIAIHq4t8T90dw0M85jKXRPl3jt
	 VnvYNiGjNBgV7HqEKZ4GKgvFvEbMswsuryvLBQehLdOoT+FtJWsxMzxxpn46+odxyT
	 TBDt2id475V1w==
Date: Tue, 30 Jun 2026 21:54:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Message-ID: <20260630-travel-aerosol-b388e50a3ce8@spud>
References: <20260513-panhandle-ashy-70c6abf84d59@spud>
 <CAMuHMdXnkeantjtoMg+3unfP8ZSeG+7K+EGkn48=BEi_RWENwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXnkeantjtoMg+3unfP8ZSeG+7K+EGkn48=BEi_RWENwg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1519615759730722566=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1519615759730722566==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OXEFPVIeQvMmHWaa"
Content-Disposition: inline

--OXEFPVIeQvMmHWaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 05:18:13PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Wed, 13 May 2026 at 20:04, Conor Dooley <conor@kernel.org> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > The condition that needs to be checked for upload completion is the
> > UPLOAD bit in the completion register going low. The original iterations
> > of this driver used a do-while and this was converted to a
> > read_poll_timeout() during upstreaming without the condition being
> > inverted as it should have been.
> >
> > I suspect that this went unnoticed until now because a) the first read
> > was done when the bit was still set, immediately completing the
> > read_poll_timeout() and b) because the RTC doesn't hold time when power
> > is removed from the SoC reducing its utility (I for one keep it
> > disabled). If my first suspicion was true when the driver was
> > upstreamed, it's not true any longer though, hence the detection of the
> > problem.
> >
> > Fixes: 0b31d703598dc ("rtc: Add driver for Microchip PolarFire SoC")
> > CC: stable@vger.kernel.org
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks, this landed as commit 9792ff8afa9017fe ("rtc: mpfs: fix counter
> upload completion condition") in v7.2-rc1, and finally the endless
> stream of:
>=20
>     mpfs_rtc 20124000.rtc: timed out uploading time to rtc
>=20
> is gone!
>=20
> And no, it didn't go unnoticed, at least not for me, but you couldn't
> reproduce it reliably before:
> https://lore.kernel.org/bce2ca405ef96b1363fd1370887409d9e8468422.16606594=
37.git.geert+renesas@glider.be/

Oh wow, old mystery solved and not "unnoticed" at all!
To be honest, there's a good chance it'd have been investigated more
thoroughly sooner if I had the driver enabled, but I don't given it
doesn't hold time powered off. I'm glad it's eventually been solved
though.

--OXEFPVIeQvMmHWaa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakQtDQAKCRB4tDGHoIJi
0sgWAP4jbyx6hOerjyjYq7eL8RtI6ZlQWHOUAxEGAqtrcO9qkgEAu9Za9S2JFsqX
9Z5tWs1QiNlCYgiEy4EpJiqmp9Ww8ww=
=jWyy
-----END PGP SIGNATURE-----

--OXEFPVIeQvMmHWaa--


--===============1519615759730722566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1519615759730722566==--

