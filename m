Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB439EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 22:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nS0e23p9Mo3LajPRLrqygaTw42hat58hQduOqbYUpsY=; b=einQeUdYZWRgwBTV6ZBj2KK2FG
	1Rw6fZMYggxh3BUwHAW3BzYdW7lxbigbIWV418bJVTwo1mwezJHtlc3aiOcJ5KtHzIFrsp6nknRO2
	yHnmmbd/n6YxeRvb8Bu0EIaPjB/ABSmYGfEMD4Edo0ZazRnHIEMOVm2BiprWxs6kwm0kkMrSe8Kos
	N8CH4oTg3c8pMY0vqnuWxUJRl6LVqBV9MwdKTGNsAaGsxuW8VVkVp/Qs60o/kh+hAa90Dy+J1+sCL
	Wlrp6v9pKLI0CQkoc9iWhxakwhGCXkcM2CZ2JegLIk3x/CRCWmCNGBO5YF1VFgmjFEtc6UYMIjPhz
	ACC/P/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGoOw-00EI0X-2x;
	Tue, 04 Jul 2023 22:21:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGoOu-00EI06-1k
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 22:21:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D33B061373;
	Tue,  4 Jul 2023 22:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18497C433C7;
	Tue,  4 Jul 2023 22:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688509295;
	bh=zvw/mDYDfWKt/nf/UUoCzc7T+cN/cP+PxbobIDiIOi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npI6pcNrbUA4mj2CaNsW7a7zk2p+EAuvqUSDtutievqz13OIqEqndI6Y96UHpEKJK
	 6p8Lva217GO4RGvmHaGlg6F62xj2VftUhpqy8yFw7iO8s52m3IaIICRMrdMkD9p1cu
	 pLRFSDX6Z7fmvtLm1J09qzjizPatJsxM4c82jT6z02i8mT5MYcXb1GHmvWwrsyz/1v
	 yzk26wPz3GzagAZ5CcSu7m/xr+uwaD/PQzcSa5rg4cnwPSHNpIE01lknG4C9AcQwqG
	 y8oBN9jXU6SCYOK4FslwLfPwUBTqXr6elFOYY5Hh7cE4tMYUMIcTZdtev+PXtzcOBd
	 gs9Sdp0koxdyg==
Date: Tue, 4 Jul 2023 23:21:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RESEND PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive
 syscon module
Message-ID: <20230704-parcel-pavestone-71900e35406d@spud>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-3-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230704064610.292603-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_152136_710098_61337C2D 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4708035963754476772=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4708035963754476772==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X3k1Y95kYeIlaDWM"
Content-Disposition: inline


--X3k1Y95kYeIlaDWM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 02:46:05PM +0800, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
>=20
> Add documentation to describe StarFive System Controller Registers.
>=20
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

This looks good to me now, thanks for keeping at it.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--X3k1Y95kYeIlaDWM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKSbaQAKCRB4tDGHoIJi
0jUMAQD0A+H8IQHZIwrq+Sf+CN/N8upNkt9KWFQ+VUDQIj2I4wEA3OF7RUmRKi+D
M1wrWqJq6nv5GGSCGs51WUljkCkBTAA=
=o3Mb
-----END PGP SIGNATURE-----

--X3k1Y95kYeIlaDWM--


--===============4708035963754476772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4708035963754476772==--

