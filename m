Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A814ACA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhWSD5LfN1wrD1+X/zeJqEaoYhePwdO6eeZdtxclOcE=; b=F3j3QQhKZ+nCHMfZrgD2fyiIBy
	Cv0rjnpceSTZH1I9XUQ3RItO7U1b3f/oC83j08Et6zBY9XGhzKF0NVR6cWEUmHpMh+2gr6FVCQAkN
	LXOLSaZZiad2jYOyaDnu6eZF/hVifvOlyDJcl4rryL+Fhd5FKGEdjr76RRwp8I7v0yb8/oVVcedNn
	aN9JWErLlo1Gsl1eddRTMwtsJ6fRmvL+LBslf4MQAeopSCEVVQkDAe/xGQ3HBbmBp3n0i9MPlqfhj
	uykYKTxfZJIdP9P2acy5WbiHeuK247BfmagkqUgyd9BDWwukKw4NaD7e1aqPYVwBau8rO0XhDfWkS
	4Eipr1RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBrM-0000000A0Xu-0EtP;
	Mon, 12 Oct 2026 08:58:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBrJ-0000000A0Wn-2W4b
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 08:58:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3096F434AA;
	Mon, 12 Oct 2026 08:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEB91F0089B;
	Mon, 12 Oct 2026 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795493;
	bh=rJXSlO+yX93SzHGI7B7MKyOSt4BAzDowsGIwtbd2HDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oSC8psi7mxIeBu1are30Nv2uSvsFld/1chhJeilVUqb+fmpbnq9qpGQ558aUkvoFa
	 CAjY6hl580UpGF4sACOCSm6Qs3bilWMk+4IPJM/LZxxh0Xz4Ffv3rX5HXMyfn9bXkB
	 4zJ4BooYdMsSfGwhNJYgWYcdTbYRB7ajGPSkUeAeFgQVvyG9b8qxphPHfwzoItyFGU
	 bmnVVGMDZwkQUzpEfjlvEWM+MU2GCGr3uMPqJdPHbzR4FfJ2l6B6QrZzv7uMx0xYdq
	 6RzswfXZtr5KUGgcAepZcJHU7wVNCsncBScGf2ggdA8jcJXIKWdgvI9ehV8tfvxiZy
	 3KXIF151M5CuA==
Date: Mon, 12 Oct 2026 09:58:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V devicetrees fixes for v7.3-rc
Message-ID: <20261012-ridden-paralysis-c095f7e937d7@spud>
References: <20260925-parlor-snowfield-6ca46312a610@spud>
 <ab03d380-f49d-4eaf-9e8a-e8b09d1d0195@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <ab03d380-f49d-4eaf-9e8a-e8b09d1d0195@app.fastmail.com>
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
Content-Type: multipart/mixed; boundary="===============8909605166659860194=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8909605166659860194==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2cQo3iO6rfjhHBrc"
Content-Disposition: inline

--2cQo3iO6rfjhHBrc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 10:10:25AM +0200, Arnd Bergmann wrote:
> On Fri, Sep 25, 2026, at 18:56, Conor Dooley wrote:
> >
> > are available in the Git repository at:
> >
> >   git@gitolite.kernel.org:pub/scm/linux/kernel/git/conor/linux=20
> > tags/riscv-dt-fixes-for-v7.3-rc
> >
>=20
> Hi Conor,
>=20
> I replaced this with the corresponding https://git.kernel.org/ URL
> in order to pull it, otherwise I get
>=20
> $ b4 pr 20260925-parlor-snowfield-6ca46312a610@spud
> Looking up 20260925-parlor-snowfield-6ca46312a610@spud
> Looking at: [GIT PULL] RISC-V devicetrees fixes for v7.3-rc
> git@gitolite.kernel.org:pub/scm/linux/kernel/git/conor/linux uses unsuppo=
rted protocol
> ERROR: Could not find pull request info in 20260925-parlor-snowfield-6ca4=
6312a610@spud
>=20
> Can you change your 'insteadOf' setting to send this as a URL accepted
> by b4 in the future? I think an ssh://git@gitolite.kernel.org/ URL would
> work fine, but most people use https://git.kernel.org/

Ah shite, I know what's happened here.. I accidentally did "rm -rf linux"
instead of "rm -rf linux-temp" a few weeks ago and forgot that I used to
have things set up with different pull and push URLs. Things should be
fixed now:

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/ris=
cv-dt-fixes-for-v7.3-rc

for you to fetch changes up to 0f70fd6f4c1d6c1f2ea298d8dd07c4a4d5dff9af:

  riscv: dts: microchip: beaglev-fire: remove double definition of gpio int=
errupts (2026-09-08 19:18:19 +0100)

----------------------------------------------------------------
RISC-V devicetrees fixes for v7.3-rc

Microchip:
Remove double definition of interrupts on the BeagleV-Fire, which cause
the sensor to be associated the wrong plic interrupt.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: beaglev-fire: remove double definition of gpio=
 interrupts

 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 18 ------------------
 1 file changed, 18 deletions(-)

 Thanks for telling me, I keep running into stuff that I forgot I had
 configured. At least deleting my main repo instead of a worktree only
 lost me one branch with work that was easily recoverable...

 Thanks,
 Conor.

--2cQo3iO6rfjhHBrc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasyhIQAKCRB4tDGHoIJi
0u+yAP9/iXthQoxbEtV05QtXv22VQDmrXYDcNUyyZY7uWo8hUgEAoujyUjBSys2X
Gk7F1KKNCPkpESXBTTob+FMF4gWAHQE=
=cy1F
-----END PGP SIGNATURE-----

--2cQo3iO6rfjhHBrc--


--===============8909605166659860194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8909605166659860194==--

