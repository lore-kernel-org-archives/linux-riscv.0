Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739E2EB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 21:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2S2FR7PM4StlXYklbkNCg0no9yT4ZWGx+2V0As2xheE=; b=KQoAThpc0scRBKcY/quorhRItF
	zdYQABLhkbXxR1Ja+oJkWkUDYpCjBSFJDr1ldsHVrPEdDyK2cii1bb6246dt2FLXs4egOf6cd1MDa
	PcdeC8C3oRzSTAIPakGJTCjpd9G0gl8sgj5XVC/2rPp/O8e8Z15wyayMxoNk37KhAnJNjJoHcgfxy
	VUbrNanKUxDgX2+omAp5V+kbz5erYw8SDff2YkKynrLIC+stigCIFCI2MO2zpHz8OpWTBFZx7drW0
	CI0vHcE/jM5N2JPNzDE++2p1iqeu3vsM1U4Ojlyy9rZpCXFfHYIlaS0LlC00NVoWLD3hOB+iTiL2t
	oVaxtXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9uPa-00G7uZ-31;
	Thu, 15 Jun 2023 21:21:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9uPY-00G7u1-12;
	Thu, 15 Jun 2023 21:21:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC8EE62081;
	Thu, 15 Jun 2023 21:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CADC433C8;
	Thu, 15 Jun 2023 21:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686864103;
	bh=yEJ1sVebWOjpqJF7Ce+024H12ihDLGhFejIzI51dkA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcNKYEcjPsJehqtPbRYFE7N6WFFHDMEvvgaGYe8BzpaM6VEOC3gEI4D6Gu/SwZ+jS
	 /BYZOukFZbbSfEbJ83MVuvNp8GX98Hl/VGofHWdrHVJr9vtDH+dEzHz46eCjddmWfv
	 b1v4X5qNsw8uDY9Q8atCZChuFzAEpFloEdaWMAe6lZ9maHFlgIEmJW4n5gUCOvgV2T
	 VqnKUk0BXJp7LMDvsMgchb5+jte3Z2EprOdxpcAHUXCMhEKKYgDVJFi0tqGOyu+K8o
	 ffZ6N0+GwAjpdWYh4Gd3s045VTooAy6DhjGmPEbclSSPt1yDyCBY0Epum6vZocMxd0
	 g8pj/Wy5Ir1NQ==
Date: Thu, 15 Jun 2023 22:21:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] riscv: dts: allwinner: d1: Add GPADC node
Message-ID: <20230615-overact-lard-9402836697f5@spud>
References: <20230615205540.1803975-1-bigunclemax@gmail.com>
 <20230615205540.1803975-4-bigunclemax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230615205540.1803975-4-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_142144_400747_B147FCB2 
X-CRM114-Status: GOOD (  10.80  )
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
Content-Type: multipart/mixed; boundary="===============3030771764725040085=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3030771764725040085==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NWC+jNAdJ4jwAH42"
Content-Disposition: inline


--NWC+jNAdJ4jwAH42
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 11:55:22PM +0300, Maksim Kiselev wrote:
> This patch adds declaration of the general purpose ADC for D1
> and T113s SoCs.
>=20
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--NWC+jNAdJ4jwAH42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIuA3gAKCRB4tDGHoIJi
0hhUAP9/W2wEpDsdB/Sc22oil+LX2XhuR7HCsY8W1oqAguqBagD/T8gxH24r/hy1
AaVKYORuvL5Bv/c/MlUxLX7izpr1rg8=
=Y/s0
-----END PGP SIGNATURE-----

--NWC+jNAdJ4jwAH42--


--===============3030771764725040085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3030771764725040085==--

