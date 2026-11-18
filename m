Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D005B606A334
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 15:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Von/ruZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhFZoIz5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oqYFoT0IMwIsQDKunOz+mCcSAM4KhDQo+/A8JIlGukA=; b=2Von/ruZJ+AOxmv7Dqu/rxBhPr
	82Zhr2fyDdCE/fayxM8egaQyIzh9hfqTw8ihnsbYI2xm8D3RCAB/lFL37L8phoT9Jk4GZqwLEXk2T
	LGJoWNnBuqAKwkZYkYuUXFoHHXLjILuBiwD63/CcD0RQbXHMexk/dX+uMCYia690EmB+bj3k+DPyt
	1dOYwkRRv7UZImqy7UcjDqI8FzHYqYeDqJ0Nc/X2MqtOWS4PC5FII6OadX8XkEinw2GNgKDc3k04K
	ZldsM/kmKU3U23HNak8YBs0ogjD6V0ved/n6ahUS/s9MlIijfhwXnuB04fFMvRJJhGHznyjhysq8G
	OnQyUtoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThwR-00000009MtQ-3fKF;
	Wed, 18 Nov 2026 15:51:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThwP-00000009Msr-3uSV
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 15:51:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0228625F3;
	Wed, 18 Nov 2026 15:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8806E1F000C4;
	Wed, 18 Nov 2026 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017080;
	bh=qf8B0pWSRob2jQEYRVRkMJrJy+KCpepLoEzVzLVC7JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AhFZoIz5QPddGxQPSruoErjT8itmH040m+DxUw4Xf9wTElEkeOjtXi5Dz8iLlXf4l
	 7QZC56tdiGTXLqUQjQM26gTHFMKk1S8CKYdoLT9aHwZowMADj8kh0ga1IwlEsoaHGM
	 0UADq1Upe/15I96CG175mb9DwM3WKjZ8kcQCnFxtA+tJTN41+ICNOH+xKCFvK8P6En
	 jSVCE/UjgX5Q3/K5plWFDB26K4I/979XXfMQQ5kfh99EvS1MnfNeUL4hNDuAr2tFJd
	 +67kLMeYnEI14tgz1tVoyNdnjJht3qETjzczfA9NbUDFVGTdTYu11WcIh3qXkX+bpT
	 nu2LyjcOLO50A==
Date: Wed, 18 Nov 2026 15:51:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xincheng Ji <jixincheng@ultrarisc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-clk@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, Fei Chen <chenfei@ultrarisc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update UltraRISC driver maintainers
Message-ID: <20261118-unimpeded-swapping-6b1b3e5bebba@spud>
References: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
 <179501112283.639563.5233054429317576626.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <179501112283.639563.5233054429317576626.b4-review@b4>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8549738115290868930=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8549738115290868930==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N/uanLs0bA0BfJcj"
Content-Disposition: inline

--N/uanLs0bA0BfJcj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 03:12:02PM +0100, Jerome Brunet wrote:
> > Jia Wang and Xincheng Zhang have left UltraRISC and are no longer
> > maintaining its drivers. Jia's listed company email address is
> > no longer available.
> >=20
> > Replace Jia Wang with Xincheng Ji and add Fei Chen as a co-maintainer
> > for the DP1000 PCIe, clock, DWMAC and pinctrl drivers. Remove
> > Xincheng Zhang from the PCIe maintainer entry.
> >=20
> > Having two maintainers provides continuity for maintenance and
> > patch review when either maintainer is unavailable, as suggested
> > by Conor Dooley during the UltraRISC maintenance handover.
> >=20
> > Link: https://lore.kernel.org/all/20261112-legend-outcast-c2226b5e02a1@=
spud/
> >=20
> > Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
> > ---
> > Hi all,
> >=20
> > Jia Wang and Xincheng Zhang have left UltraRISC and no longer
> > maintain these drivers. Jia's listed company email address is
> > no longer available.
>=20
> Maintenance is not necessarily tied to an employer.

True, but if the people don't care enough to update their emails they
probably aren't that interested in staying involved...

> It would be better if the people removed could Ack the change, and let
> the community know they don't plan on being involved anymore.
>=20
> If they do not reply within a reasonable timeframe (a cycle maybe?) I gue=
ss
> you can remove them anyway.
>=20
> That does not prevent you from adding yourself in the meantime.
>=20
> I suppose this would go through a starfive/riscv tree ?

Sure, I can take it if the subsystem folk don't.

>=20
> For the clock:
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
>=20
> --=20
> Jerome
>=20

--N/uanLs0bA0BfJcj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3JbQAKCRB4tDGHoIJi
0qBxAQDnNYlzvCuzp3y54+YqWrqv9AdYL7pLR7wQG8oNc1UbhgD+MDe5Ob5AFsHw
x1lndPqct4ZQjA7FNv/bu6vHGgf/xgE=
=YLuJ
-----END PGP SIGNATURE-----

--N/uanLs0bA0BfJcj--


--===============8549738115290868930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8549738115290868930==--

