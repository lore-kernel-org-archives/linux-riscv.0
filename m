Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361F9CCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 19:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wP87SGV+Yy9qm3HxRKkRMXPKQ3NwkYT+gxUDzCOzvvk=; b=LNDjDioh+So/FyLsEPBT4+LMsu
	TBUMMpUC8lr4PSaUPPWLmBMDXP63TyfMxxXe2BwSoL3uEUdPG+qa1evPKpIYJL5HJd6Wrff+kZxzz
	2Q3i7y2/1K55AMz2IPt9NACb19UFijiQfDBpXnbrW2c/jYPNCPP8eEcv6mLe8S0eQ5Ng3B9ABfL3O
	+GIZ1eRUTLYCn/Opgd/RVjurPbf+Ta/sAGX9XAr7sP/UPDa0fTVQo7bHwuZLY3YY917IuLz+2y6AT
	kcdRPRjGqIV/G2teWp7FHcOAEXiOJgCXg6ol3X8S77BK2ZmmKPg5WUozqXRi9UZDyu/938dEDjbxl
	gPMaeUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIXgP-0000000628y-2ls4;
	Mon, 10 Nov 2025 19:36:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIXgO-0000000628f-0dF7;
	Mon, 10 Nov 2025 19:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 206FE60195;
	Mon, 10 Nov 2025 19:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACD7C2BCB4;
	Mon, 10 Nov 2025 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762803366;
	bh=jpF83hZl4+ePN40ExsHilbddxNFc1Cve8pvPWp8/Bmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/JiLWNHjEYRmruV9LdKTJJTd45+gaNqMVxx3rKwEocvH5raBmPhaOaSVmu3LB1qB
	 v0a/a1UV73eEVavjBqelijRtLfPFA7zKLv5pcjNmrBX6zODp941N/MZ9YvQE2P7+Ta
	 23tHNDBX6X+G+I1EZMllpz83zr6Mj/te6SLxVm8+Eq9mSpu4z8sygEjiBDcf+ZBRNT
	 nmcZDBXr7Q/x9Tn8j8zhBnrVMkPBuhyS5p81Tj270JsMuhgtxrYD8fPwYXHH0bQmlJ
	 LPzeEDTvL4PZR5+MfOyG851q9+zXYhus/EQScPYQGY2xw+9LabgDNqmWOGy5TkWuXL
	 fmQFkqDEx/eVA==
Date: Mon, 10 Nov 2025 19:35:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH RFC 00/13] drm: starfive: jh7110: Enable display subsystem
Message-ID: <20251110-clang-baking-b8b27730356e@spud>
References: <CGME20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e@eucas1p1.samsung.com>
 <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Lee Jones <lee@kernel.org>, Andy Yan <andyshrk@163.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hal Feng <hal.feng@starfivetech.com>, Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Maud Spierings <maudspierings@gocontroll.com>, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============2996142862477600361=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2996142862477600361==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cv1rMoP+ljYav3Y/"
Content-Disposition: inline


--cv1rMoP+ljYav3Y/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 02:04:34AM +0100, Michal Wilczynski wrote:
> This series enables the display subsystem on the StarFive JH7110 SoC.
> This hardware has a complex set of dependencies that this series aims to
> solve.
>=20
> I believe this is a PHY tuning issue that can be fixed in the new
> phy-jh7110-inno-hdmi.c driver without changing the overall architecture.
> I plan to continue debugging these modes and will submit follow up fixes
> as needed.
>=20
> The core architectural plumbing is sound and ready for review.
>=20
> Notes:
> - The JH7110 does not have a centralized MAINTAINERS entry like the
>   TH1520, and driver maintainership seems fragmented. I have therefore
>   added a MAINTAINERS entry for the display subsystem and am willing to
>   help with its maintenance.

Yeah, bunch of different folks wrote the drivers, so lots of entries.
Pretty much all as you've done here, authors are responsible for the
individual components and Emil is the platform maintainer but
responsible for most drivers.

Do you need any feedback dt wise on the RFC, or is it too likely that
we'll both waste our breath if the DRM folks don't approve of your
approach for the rest of this series?

--cv1rMoP+ljYav3Y/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRI+nQAKCRB4tDGHoIJi
0mgxAP9S65gNYTUGl4G/hjuQeRD2OPtB7jDPJa2U+Nb1h9guXgD/ZYh57W7dimb0
HC9nSRLUedngvCWxlTKXCDULpQjSKg8=
=vQrF
-----END PGP SIGNATURE-----

--cv1rMoP+ljYav3Y/--


--===============2996142862477600361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2996142862477600361==--

