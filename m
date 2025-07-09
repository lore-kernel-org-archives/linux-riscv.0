Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF61C83F0A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3vvNTVJDkD1INYZLEVI1xsfKAy1x3OU8AY+RkpHuYQ=; b=NvR2NCqm7WBQUz0duTH4AzMKmb
	16Kp2DGOsOIsg3ijivQOTZmrXbchxVUkP0Vh8cmbxFL51eYQY5Ip9QLyTJ23OOmVZZAL7aPzYUp13
	kLrTty+XIDf8lcpb+rVK5+Gd2O4gfENEGN4GoQoAghTTyI4RqW794GT0oO5wDv/gxLqSpmhLPlMj8
	vc2reuPQP03vECJITklPDSaza6p44juMI2wiHYbdiKDOeerzFAFssU6oP0afAaz2YfXMGGao7eQFY
	4PHO+ijEUwCHb62F1AtWGaPUsCCbw6qjIuMIgtDWsYtNk2iBDJJRBLHRKqnMVRGvNNXcp+oY34Nco
	909I7Auw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFd-00000009g1G-0GBi;
	Wed, 09 Jul 2025 19:14:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXPU-00000009Hu8-21G4
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 16:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E0804450F;
	Wed,  9 Jul 2025 16:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69AEC4CEEF;
	Wed,  9 Jul 2025 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752077560;
	bh=RQy318+GkhVafNHZ5cXKCP2xo0jeEsfQNsJHtJFqqSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLPgCOdiC1mkJx3nzdAXPX9Fgp1Xt9kBsYqXxkqqsu1z1u2gld1UtjwQwbAvLx/Ts
	 cD2qGqYuJKvHlCaJ3IJ6YdcHhSSLCYiw3/T19jyeOzb+gQ68uAhGG6wqIMUmO0F5I6
	 qoz6BuqStT1aa59IE+M0fi2PdYiYRQeDSnfCsDaFvCuHMmXJFVs0HEcu1c1+ZoNgwt
	 jjzdP+CoTzjVma1Bb0Otz4Erv3GmlwmwDr8VVWonsEsbyDta+VzFDGCEI9XD/kJLGG
	 aSuiA9eJnMZzGkiqoB8pAPH8R6sMGCyKWmyOCmGTHTiZ1ekxcD/4aDgX4Em8xc3e5B
	 Ep8u77r+A5kmA==
Date: Wed, 9 Jul 2025 17:12:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
Message-ID: <20250709-gem-disparity-185256a670f0@spud>
References: <0886d3eb81bffbc1d48e701cae21c42cad29fefe.1751988704.git.geert+renesas@glider.be>
 <20250708-jubilant-abruptly-8ff77f7986ca@spud>
 <CAMuHMdVwbHoEbjC2y4kpJuhx7CYsRxO9Y+eCUhJkKogk=zDs8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVwbHoEbjC2y4kpJuhx7CYsRxO9Y+eCUhJkKogk=zDs8w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_091240_539637_77C22261 
X-CRM114-Status: GOOD (  21.42  )
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
Content-Type: multipart/mixed; boundary="===============4435365251489611804=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4435365251489611804==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BE3zxSWO0KkYnQpY"
Content-Disposition: inline


--BE3zxSWO0KkYnQpY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 11:29:24AM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Tue, 8 Jul 2025 at 18:49, Conor Dooley <conor@kernel.org> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > On Tue, 08 Jul 2025 17:36:48 +0200, Geert Uytterhoeven wrote:
> > > The SND_SOC_STARFIVE Kconfig symbol was removed, but it is still enab=
led
> > > in the RISC-V defconfig.  Just remove it, as it is no longer needed.
> >
> > As I mentioned to Palmer a few mins ago, I'll grab this along with a
> > couple other soc-related defconfig patches I have. (Apologies if this
> > goes out twice, I got a warning last time about a timeout, so ending ag=
ain)
> >
> > [1/1] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=3Dm
> >       https://git.kernel.org/conor/c/493e9b085299
>=20
> Sorry, I forgot to mention that the commit my patch fixes is only in
> the sound tree.  One other patch in the original series did include a
> defconfig update for a  MIPS platform, so it may be more appropriate
> for Mark to include it. Or just wait for v6.17 ;-)

I was going to include it in 6.17 material, with the other soc-related
defconfig bits. I'll drop it if it's problematic of course.

--BE3zxSWO0KkYnQpY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaG6U8gAKCRB4tDGHoIJi
0k0pAQCnoUW0gyPpDqXAOul9agDPGo1zmZs9j0vD8cAxkbR1lQD/dbVDHZXfmYol
Ug0NjgL1HfHh9vUa4uvSYpbE4Ay2/Qk=
=4vJ/
-----END PGP SIGNATURE-----

--BE3zxSWO0KkYnQpY--


--===============4435365251489611804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4435365251489611804==--

