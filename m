Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11784CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PARy4haDo7Kgvnl8zSxYGmIJt01T9dxNPJfYLc8AHFA=; b=QhjyePzcFRRZNkn8WfSi8GoCtH
	8kzK++GEVbeN5t34O3ZulSN/vXJU50EPpNOSc79q2b4c/tMngT/q9xUblrCwvuh2xgkkuy961dSXl
	k0iZHnCsUhDgvHEydTroTxCRQC3X9wvdir7sffL4BENdShX+V2kMJrv9pJoaxIItR+lu5l5RdYsuK
	tW7R6p1d3jeZmgA9bTDw/0pySQxeXztfGeRA8Gwqp7USYSVHYLY61m3vu7cU0WaDpYvJhmdoAeb3I
	CA7nRewD7U+oEE8CvRtvY9D7L3PpsD0XMZj0nCaXX4tKjfbvowKDP/gLP7S1Oo7fhx2Hk+jNx71v0
	u6PtB+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDNg-00000005LCk-3rbQ;
	Mon, 15 Sep 2025 17:52:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDNe-00000005LAJ-39sp
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 17:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA2F544E67;
	Mon, 15 Sep 2025 17:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87912C4CEF1;
	Mon, 15 Sep 2025 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958765;
	bh=2F0ZJ89HUHqGVIETYaRZWiY+IljshdZlHdUkoTWThoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WaAH4njo5Z15ZoDOzLXqATnsPXTYVyKeV+kHqEs3nzF9Xwm5zjLgfDF5Yva7lUvgW
	 VxJ2dInE37IXlXQ0LSqKIroCEqKOyxhSTs7bGTeKx5eK0MHpNEvtHUHjKAfrJFIKrZ
	 bA4Z6dKNa9O3Y02bTC45W9BzLwdfm3hwL0J8qowBVBSZV+HWrgSkggx+v3FVrB45aN
	 rvs+W/+1YWD7O8PslW0k3sq4MrLGKWek1MUz96UvyELqlWvXF1U8PCBuWbCmCXmHFR
	 3PjAuukKMKsDD5nmu12VeHqFjXotno0q9qr115wmSG2Op2V2ryE9djjcwamkwysnet
	 ilQQ1JM82desg==
Date: Mon, 15 Sep 2025 10:52:44 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <jms@tenstorrent.com>, Joel Stanley <joel@jms.id.au>,
	Michael Neuling <mikey@neuling.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH 7/7] riscv: Kconfig.socs: Add ARCH_TENSTORRENT for
 Tenstorrent SoCs
Message-ID: <aMhSbIvjwz2J4KCx@x1>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-7-ddb0d6860fe5@tenstorrent.com>
 <20250915-overeater-escalator-9ed8a77d809d@spud>
MIME-Version: 1.0
In-Reply-To: <20250915-overeater-escalator-9ed8a77d809d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_105246_842612_89E6B98A 
X-CRM114-Status: GOOD (  20.41  )
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
Content-Type: multipart/mixed; boundary="===============7499956677905639299=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7499956677905639299==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8o+hXkmY9sgaWHy"
Content-Disposition: inline


--a8o+hXkmY9sgaWHy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 05:48:06PM +0100, Conor Dooley wrote:
> On Sat, Sep 13, 2025 at 02:31:06PM -0700, Drew Fustini wrote:
> > From: Drew Fustini <dfustini@tenstorrent.com>
> >=20
> > Add Kconfig option ARCH_TENSTORRENT to enable support for SoCs like the
> > Blackhole A0.
> >=20
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >  arch/riscv/Kconfig.socs | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 61ceae0aa27a6fa3a91da6a46becfd96da99fd09..ff733a998612d429e7b1e00=
276eb86290d8331a3 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -57,6 +57,14 @@ config ARCH_SUNXI
> >  	  This enables support for Allwinner sun20i platform hardware,
> >  	  including boards based on the D1 and D1s SoCs.
> > =20
> > +config ARCH_TENSTORRENT
> > +	bool "Tenstorrent SoCs"
> > +	help
> > +	  This enables support for Tenstorrent SoC platforms.
> > +	  Current support is for Blackhole P100 and P150 PCIe cards.
> > +	  The Blackhole A0 SoC contains four RISC-V CPU tiles each
> > +	  consisting of 4x SiFive X280 cores.
>=20
> Can you add this to defconfig too, so that it gets build by default in
> that configuration?

Sure, will do.

Thanks,
Drew

--a8o+hXkmY9sgaWHy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaMhSawAKCRDb7CzD2Six
DGUXAQC+RY4uE7ZpwUFudLLQ/jXUQovWxEkEMCutkX0fGy9P9wD+IGwUXbjpeIN2
xH1EPpshHbgaoEiOti2tWAPGn8aczQc=
=jFZn
-----END PGP SIGNATURE-----

--a8o+hXkmY9sgaWHy--


--===============7499956677905639299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7499956677905639299==--

