Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42CECCFA18
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxC+SxvXVtA9JVAY+Z7ByyaDoZtc4LvRuKP/gpqqYjw=; b=QGNI0WxRtfk2UmXjw2DeNRC8Wq
	BA7zuw6VReQxN+VBifftw6OqOEuIkAGogqoyFziIznDm50b+jHEMV+zEGsUSvE8N6bLJNumg2hRCz
	66hKCEoAz47FtGXs+kiZsEQgaE79OHIRDM5jtuyMUA/wl1QO/Wca6VQ9CTLVR7GPbuUWwT6wwTGgD
	JBCnKBMS5r3quT7fSLr8XQ/rJiXLTOPzkUBzRDzsdNr9vMAwMYNstvOYpMoxt3MNqCxflDFFBBR2M
	dXAsCqd+qbYzfrn1TrnieY5wGMOpUMM8xRXYMielLVh5H/VzlPZWNiQ7mMeP8klqbcmP8GQ0+EJyA
	iKjtVY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIstQ-00000007aj7-48zK;
	Tue, 11 Nov 2025 18:15:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIstP-00000007aiX-0hAS;
	Tue, 11 Nov 2025 18:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 036FE60209;
	Tue, 11 Nov 2025 18:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF59C4CEF7;
	Tue, 11 Nov 2025 18:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762884897;
	bh=YJZ2BYCy/RFNPtkZFsqxaPgXCs3zWEQSsNMKkzCW8hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTyOuaBcX/6ltywosBlk/NwujGRrcJfEf8qH4zrh95pJAt8KmLpY0rchl/8qtmmFz
	 Qa8aDw06RDCss8Kjwi1Qe/onQEh5ofgzEewAcX+H2bNOc7Br0Em4wLlqP2YplseInE
	 UU14ps8vqndAKHvQrGwOSZl4mE10pCFh2mkdJNjMIWPUkgxgVEyX4mwIdoMls+80we
	 Hco0gmIy2hh/V6SIk7fVd1rSUqsggZXdtjysstDTlfkDjXZG/9OTl5AKEGRAb5K6lr
	 BSDUwHwZplb8f+HiSYVis4M+DIzNyu2PPjkMhdxWTXnGXJ2ls1CidyEq6/oXFK1ICK
	 2Xjdgg8pBJJqA==
Date: Tue, 11 Nov 2025 18:14:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH RFC 00/13] drm: starfive: jh7110: Enable display subsystem
Message-ID: <20251111-footing-eclair-332f5f0769f2@spud>
References: <CGME20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e@eucas1p1.samsung.com>
 <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <20251110-clang-baking-b8b27730356e@spud>
 <00e897dc-9966-439b-a74a-7604a1870027@samsung.com>
MIME-Version: 1.0
In-Reply-To: <00e897dc-9966-439b-a74a-7604a1870027@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============0492203586820966406=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0492203586820966406==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/gBidW5Sm+Kw8wVT"
Content-Disposition: inline


--/gBidW5Sm+Kw8wVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 04:33:28PM +0100, Michal Wilczynski wrote:
>=20
>=20
> On 11/10/25 20:35, Conor Dooley wrote:
> > On Sat, Nov 08, 2025 at 02:04:34AM +0100, Michal Wilczynski wrote:
> >> This series enables the display subsystem on the StarFive JH7110 SoC.
> >> This hardware has a complex set of dependencies that this series aims =
to
> >> solve.
> >>
> >> I believe this is a PHY tuning issue that can be fixed in the new
> >> phy-jh7110-inno-hdmi.c driver without changing the overall architectur=
e.
> >> I plan to continue debugging these modes and will submit follow up fix=
es
> >> as needed.
> >>
> >> The core architectural plumbing is sound and ready for review.
> >>
> >> Notes:
> >> - The JH7110 does not have a centralized MAINTAINERS entry like the
> >>   TH1520, and driver maintainership seems fragmented. I have therefore
> >>   added a MAINTAINERS entry for the display subsystem and am willing to
> >>   help with its maintenance.
> >=20
> > Yeah, bunch of different folks wrote the drivers, so lots of entries.
> > Pretty much all as you've done here, authors are responsible for the
> > individual components and Emil is the platform maintainer but
> > responsible for most drivers.
> >=20
> > Do you need any feedback dt wise on the RFC, or is it too likely that
> > we'll both waste our breath if the DRM folks don't approve of your
> > approach for the rest of this series?
>=20
> Hi Conor,
>=20
> Thank you for your response.
>=20
> That's a fair point about the risk of the DRM approach being rejected.
> While I can't be certain, I'm hopeful that part is relatively
> straightforward, as it primarily integrates other recently reviewed
> (though not yet merged) components like the inno-hdmi bridge and dc8200
> drivers.
>=20
> To be honest, I was more concerned that the DT part of the series would
> be more problematic. Given that, I would find it very helpful to get
> your feedback on the DT aspects now, if you have the time.

Right. You'll definitely want some actual DRM people to weigh in though
before making changes, I am really not familiar enough with this type of
hardware to know if the breakdown is correct.

--/gBidW5Sm+Kw8wVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRN9GAAKCRB4tDGHoIJi
0r8GAPkBsYDP7LLqp2+h6FYJs9F/YlRAnuueN9JB2on22suIYQEA03Yvk0N2Sfh+
Ee2i/GJcLr7XOYAXK2mOE8f+CiHaLQU=
=L7ty
-----END PGP SIGNATURE-----

--/gBidW5Sm+Kw8wVT--


--===============0492203586820966406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0492203586820966406==--

