Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D465DCCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9f98UDlnI5vhzgmAil9Ht8mHvQanSlaY7JXuAKhpSc4=; b=PComTScUpaqpixvXSLDgzEm1UE
	24QMWMCZ35GiFuFNZPC6Q37L1go68q/Xw8nZ/fim3s7kJjreMl23keODtaxdUYtFc1MYWTQawdkrc
	mlDF8GXGEjxlYsV2sBsIYe7jiX+y7Jw5iWUhrlCW1swfGs5wwT5baELfrBhPVuQhtecbJL97f0QlK
	5nv3KgtnpzcXS/Rd1viPXJPffso9y6L4ZVkDVXgUfMRs9jSLSkuU+Qtl+LPIzK7/UuEb3zRHi8b1x
	7h0WSyP9L9wEomyjhzT1/dSwNOeVDCPjHc+STnLsRmmIVDN/aOOZg5JWaBAOSMgOLviVHYWJeNm/B
	kBXRdOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItFC-00000007cSB-380m;
	Tue, 11 Nov 2025 18:37:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItFB-00000007cRm-16N4;
	Tue, 11 Nov 2025 18:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FAFA6020B;
	Tue, 11 Nov 2025 18:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A888C4CEF7;
	Tue, 11 Nov 2025 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762886248;
	bh=pgKLi07v3nAzgSWrbOhew+tkCftrGPnHwK+HWRmbZgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Td5CWsFiCm4X1/AxMKmU39/vysxniGwqTFaV8jeP7qaIc3yIbF1rA/+YLuR6zMsf4
	 TzZ7i3+8tluttQnfUp9v5hCiYFbUfU0MNj8NSDs8ANlJhbW4W1wJY+07jc+k52guAO
	 tLNgouUqw99pq5Mv7o8Cs1G9BygfFX9HZXCykZdE6GK5yDbPMeX47V8ivCfBIFxsv3
	 TL7BN7hwsQdaMGPH/4pVTNj9tPrV2p01diVJ3OygK6ut4ZJ7jQbmbEEeAoCcHctlDm
	 aKX5cwajRuJEWXEH1AEUPJkIuxSttxv7QI5sfExLHhSH7t+d0CCfpkDGNvv+ag2N+K
	 ObPnOLSezIrcQ==
Date: Tue, 11 Nov 2025 18:37:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH RFC 00/13] drm: starfive: jh7110: Enable display subsystem
Message-ID: <20251111-matriarch-diocese-b314e7bdaf81@spud>
References: <CGME20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e@eucas1p1.samsung.com>
 <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <20251110-clang-baking-b8b27730356e@spud>
 <00e897dc-9966-439b-a74a-7604a1870027@samsung.com>
 <20251111-footing-eclair-332f5f0769f2@spud>
MIME-Version: 1.0
In-Reply-To: <20251111-footing-eclair-332f5f0769f2@spud>
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
Content-Type: multipart/mixed; boundary="===============0331313345753704936=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0331313345753704936==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oEuULB+ZwvMAwWb+"
Content-Disposition: inline


--oEuULB+ZwvMAwWb+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 06:14:48PM +0000, Conor Dooley wrote:
> On Tue, Nov 11, 2025 at 04:33:28PM +0100, Michal Wilczynski wrote:
> >=20
> >=20
> > On 11/10/25 20:35, Conor Dooley wrote:
> > > On Sat, Nov 08, 2025 at 02:04:34AM +0100, Michal Wilczynski wrote:
> > >> This series enables the display subsystem on the StarFive JH7110 SoC.
> > >> This hardware has a complex set of dependencies that this series aim=
s to
> > >> solve.
> > >>
> > >> I believe this is a PHY tuning issue that can be fixed in the new
> > >> phy-jh7110-inno-hdmi.c driver without changing the overall architect=
ure.
> > >> I plan to continue debugging these modes and will submit follow up f=
ixes
> > >> as needed.
> > >>
> > >> The core architectural plumbing is sound and ready for review.
> > >>
> > >> Notes:
> > >> - The JH7110 does not have a centralized MAINTAINERS entry like the
> > >>   TH1520, and driver maintainership seems fragmented. I have therefo=
re
> > >>   added a MAINTAINERS entry for the display subsystem and am willing=
 to
> > >>   help with its maintenance.
> > >=20
> > > Yeah, bunch of different folks wrote the drivers, so lots of entries.
> > > Pretty much all as you've done here, authors are responsible for the
> > > individual components and Emil is the platform maintainer but
> > > responsible for most drivers.
> > >=20
> > > Do you need any feedback dt wise on the RFC, or is it too likely that
> > > we'll both waste our breath if the DRM folks don't approve of your
> > > approach for the rest of this series?
> >=20
> > Hi Conor,
> >=20
> > Thank you for your response.
> >=20
> > That's a fair point about the risk of the DRM approach being rejected.
> > While I can't be certain, I'm hopeful that part is relatively
> > straightforward, as it primarily integrates other recently reviewed
> > (though not yet merged) components like the inno-hdmi bridge and dc8200
> > drivers.
> >=20
> > To be honest, I was more concerned that the DT part of the series would
> > be more problematic. Given that, I would find it very helpful to get
> > your feedback on the DT aspects now, if you have the time.
>=20
> Right. You'll definitely want some actual DRM people to weigh in though
> before making changes, I am really not familiar enough with this type of
> hardware to know if the breakdown is correct.

It looks generally sane to me chief, but as I said I am not really
familiar enough with this sort of hardware to have a real take on it.
Sorry, you'll need to get your affirmation about how you've laid stuff
out elsewhere :/

--oEuULB+ZwvMAwWb+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaROCXwAKCRB4tDGHoIJi
0lHNAP0VY2m9JP4EgIKWtYcUv/PdugQ015SJrRdoXUnsVhh14gEA7/E/wvGod2Wf
uGM6z13gp3dI+KrJhyqfO1LThr8IXwE=
=h9/B
-----END PGP SIGNATURE-----

--oEuULB+ZwvMAwWb+--


--===============0331313345753704936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0331313345753704936==--

