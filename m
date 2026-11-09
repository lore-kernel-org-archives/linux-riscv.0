Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F347606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fSoegU4I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HcUKnm+k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Q5Oh+s6TqnE7PnHvUbVWzlYhoLGAMhHIzqVHMcGaHs=; b=fSoegU4ItVI8WkRFo+9L/16Stj
	vbQNrK3rbNfDIYb62C60XFn077CtEy+eaLtzTSDBY9DOyyZ/UPVKnk1g/6HNbiG1Udzr4yBvsBzo3
	/Q1hjeD8aTG9qtaUswzhs6CaGy6i4ifXCN3B4vIUgNqbVnEnMPv+XreQvE3B7JvccgcAta3DpahwX
	axs27nWIxDW2mI2PSreAGEgwAp8j3xWe2kCLunAPv5evewGDopAJHqfs9FKkqOzk3+AK/l0vobsXC
	PS3QvVJyyjrACE9W4A7gvcwN4RQMrnSCBNpW/G8JPYRuRGtzNTsUklkhHJoGQymhb42enj+v6QOXT
	412rKlXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUSV-00000001VBL-0GKW;
	Mon, 09 Nov 2026 18:51:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUST-00000001VAW-25V2
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 18:51:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B67B43E8E;
	Mon,  9 Nov 2026 18:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD91A1F008A1;
	Mon,  9 Nov 2026 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250268;
	bh=kn4X6Xnaj6tVLjASU1DBTDnXZ8Bkp/tVdzWviNAkNa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HcUKnm+kCVXRMKIzVHGJ+agqfupO9+DgWO1IyMF/ng51qBDFy27vtO53laLR/yTEk
	 hUHkKCc0oKY4v68iMnnv8Y+bgexnsZXfZDz4LIOHihHdczdb7ZzB5HQtibflYYM9B5
	 hx3YiZhnRQNmD2c49gPZjxQ9xjoV6kwHcU2CUK1sgXAjitL7+xGcevltbgse249c+W
	 U9s5brUDcedjOVd7JxwiXtgiGq7hUJvWkpIhIlgiVsp5JFU2uNMAM7UtUPohcoQDhI
	 UIXmYDSVNJTRc1W6OT4ovLz/coCtBwQIfTyDkW+vPr51WP726nK5NPZwUl04GuXIGk
	 h3U8FwoTu3Mwg==
Date: Mon, 9 Nov 2026 18:51:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Lunn <andrew@lunn.ch>, Jia Wang <wangjia@ultrarisc.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 0/7] riscv: Add device tree support for UltraRISC
 DP1000
Message-ID: <20261109-december-oil-cb6524baf274@spud>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
 <179419183382.2791817.17305257804227954338.b4-reply@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <179419183382.2791817.17305257804227954338.b4-reply@b4>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1790103886173003281=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1790103886173003281==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bcTszYGBuLy82DqL"
Content-Disposition: inline

--bcTszYGBuLy82DqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 10:37:13AM +0800, Xincheng Ji wrote:
> On 2026-10-25 20:24 +0800, Xincheng Ji wrote:
> Hi all,
>=20
> A gentle ping on this series adding device tree support for the
> UltraRISC DP1000 SoC and the Shenzhen Rongda M0 and Milk-V Titan boards.
>=20
> Are there any remaining issues I should address before the series can
> be picked up?

RISC-V ULTRARISC SoC SUPPORT
M:	Jia Wang <wangjia@ultrarisc.com>
L:	linux-riscv@lists.infradead.org
S:	Supported
T:	git https://github.com/ultrarisc/linux.git
F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
F:	arch/riscv/boot/dts/ultrarisc/

Your colleague is the maintainer of this platform, you should be asking
them - unless you're expecting someone else to apply the series (me?).

Cheers,
Conor.

>=20
> Thanks,
> Xincheng
>=20
> --=20
> Xincheng Ji <jixincheng@ultrarisc.com>
>=20

--bcTszYGBuLy82DqL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavIWFgAKCRB4tDGHoIJi
0qb5AP9fwzC5MOM3iSNB/HrLlRRT1EbdbRPqW8FvOcPUT6xVCgD/SPYVNUA6AR/J
jew/up1fnP9U2rgmfmxzX5+TtfbJIQY=
=v1Wd
-----END PGP SIGNATURE-----

--bcTszYGBuLy82DqL--


--===============1790103886173003281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1790103886173003281==--

