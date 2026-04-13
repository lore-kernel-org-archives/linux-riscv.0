Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE73F34C64
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 15:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJxa1cMV2oP2jX63+hDY39WOhX6ow4BRxFad9oJn91c=; b=d0ddIvMFfQkQkPvIwjFkfUoN3g
	mu/VtWrx0COIe95g2+O6ghRjHRjpyrxcq5RpB+cBT5SInO7UrBXWntjglaP5tzig6+DtI36shj8qS
	xq8DM94LcUruM0ghsPDB752lNIaF3zRsIbJdWlSCZxb5YwOMpleW5zAdduV2N59P2JZDBGq9a2zGR
	ZTvj05uGOsr7YTjFBeraxwRospwChBoNg09Y2z6Fh/7b6T/WoUlSN/3d2xfgPMO3wEwDVE1S8jWkE
	LzY5WF1C7yrTAo6UC268sktwwc/XgBnE7uoGp3admquPdDJ9TVFyZJicScixIKag9GiujsgJr3ZsS
	TP5rRtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJRR-0000000Fzl6-2URM;
	Mon, 13 Apr 2026 15:43:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJRQ-0000000Fzkt-0uRX
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 15:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6AE461333;
	Mon, 13 Apr 2026 15:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F3DC2BCAF;
	Mon, 13 Apr 2026 15:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776094991;
	bh=J6M91WN4wCbUaBUzpCxhjIP7l+s0mcfpvXiabrHgDQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7aCrpwnUb1R4a7GvWyujsiZt0jFDb4IG44cdICeSBu1WJQFlZtg0a0j1TpFphJUb
	 Slk8vaaxDFtZkR5y5YPSrGJkaLiY9TPl/ZIGdFMst2FTguMDqptzOZK3oeSJBJCUc0
	 n89V1Py4jWWoBOtqQuGQus+dzpWOhcx1FAW0ZyWSo0++CjSF85bGb0bM5qWEFOj4uG
	 LhvbjkH7a8RxkExHNkdqQuFZ26aceoy99TGXuC5DkXe1dWTPeIcjzAj1zarEvDXGpr
	 V+35PZ9B53Mlt7widHkX0lvULY0b4b5cdR+nplnqCAk/McSkHyANcqNOlE+FijOZOC
	 Ut8t4eO1IOKpQ==
Date: Mon, 13 Apr 2026 16:43:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Message-ID: <20260413-marry-discover-e8357e12cf50@spud>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
 <20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3682624065705452573=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3682624065705452573==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="url34NB/arvIj4F7"
Content-Disposition: inline


--url34NB/arvIj4F7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 09:24:43AM +0200, Iker Pedrosa wrote:
> Document pinctrl properties to support voltage-dependent pin
> configuration switching for UHS-I SD card modes.
>=20
> Add optional pinctrl-names property with two states:
> - "default": For 3.3V operation with standard drive strength
> - "state_uhs": For 1.8V operation with optimized drive strength
>=20
> These pinctrl states allow the SDHCI driver to coordinate voltage
> switching with pin configuration changes, ensuring proper signal
> integrity during UHS-I mode transitions.
>=20
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--url34NB/arvIj4F7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad0PCQAKCRB4tDGHoIJi
0ju+AP4tcscdxvK3w0q7a3EslP/B5N38OkukMtHg6HhJxJm+UgD/aSGhGAavzlZG
/mHJ2SrhK59zNN/4YPhq1XaISVMRzww=
=Mk/L
-----END PGP SIGNATURE-----

--url34NB/arvIj4F7--


--===============3682624065705452573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3682624065705452573==--

