Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03E5CCFA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em51pHMJvaE/8yiTPJ6Q+Yj6QT4rRQNWhtKQnZljZDE=; b=njW1uW1/o4FWSY6ZGWvTJ6Ft4I
	Mptsji/ZGFItUk2WFJrdgmoy6QuEmU2hs2rLHbwOhoYI/R2ff/lSgClPlJHZC4PD1AIONwi19Jqbq
	mAkvxVJcCJhna7CMYl2pPZ9WG0BJZsW1CYUhLDAHU1Wcm36kiQNwaSRfSReDkPRbrDC29Grl0xrb6
	QI274SR8lPK71+VRH8E/BHrOkCkCIi29AqkOle1PxvqPSN9d+9hFiGt+jDp8YGwIYV3Kgd2iH9ySL
	5WwiBERDBiUwFIXT4pJdLkpO/Ooi1tM37vsmD0WQEIDM3umKatDTyVb/yMqz3a4FeB7yrehXPUwSI
	uRsPTvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC18-00000008wxr-2xUw;
	Wed, 12 Nov 2025 14:40:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC17-00000008wxE-13DG
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 14:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4857560227;
	Wed, 12 Nov 2025 14:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975F8C16AAE;
	Wed, 12 Nov 2025 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762958411;
	bh=gFZwBjqnrl19OxTrYC0mLSsa806uq14xs/QzjVBVgVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFtHcz/nDVI4vRMyJ6ir9z+uaWieVNvrv/urkCN3hmP1T5Z5sEfQWQSTCHi97Iv1D
	 m1L6ydPm7G2Dn2bKK8ZfTJst7ba8leenJH6Gzg4fU4RSnKu0l8XgoMk9scaB9SUPmY
	 Hkx4w1MpppUSdlO+t+1wLUFXHqv1NCJQcU4YXtx36/j63SBS3X+yHetDj6I6EHv11v
	 d4zmY01N9C8O84EaQF8lBEFqYXNTfTD96kfrYGF18zS7An4EAmitwR57t1QwI7iJ4r
	 9BPzzTDWqHCEE7NbG+ZVccUAIre5wrycWBcZKS3bId4P7GatzFSI8Pw/52qn4QfHvm
	 j7oTVUA3zxMvQ==
Date: Wed, 12 Nov 2025 14:40:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>
Subject: Re: [PATCH v3 3/3] spi: add support for microchip "soft" spi
 controller
Message-ID: <20251112-eradicate-onslaught-f6cab44cc6b0@spud>
References: <20251107122104.1389301-1-prajna.rajendrakumar@microchip.com>
 <20251107122104.1389301-4-prajna.rajendrakumar@microchip.com>
 <20251107-emit-slip-b1ab5f7d5591@spud>
MIME-Version: 1.0
In-Reply-To: <20251107-emit-slip-b1ab5f7d5591@spud>
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
Content-Type: multipart/mixed; boundary="===============4717553076099738035=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4717553076099738035==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="myID+3ZAXg5EfgBj"
Content-Disposition: inline


--myID+3ZAXg5EfgBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 05:15:12PM +0000, Conor Dooley wrote:
> On Fri, Nov 07, 2025 at 12:21:04PM +0000, Prajna Rajendra Kumar wrote:
> > Introduce driver support for the Microchip FPGA CoreSPI IP.
> >=20
> > This driver supports only Motorola SPI mode and frame size of 8-bits.
> > TI/NSC modes and wider frame sizes are not currently supported.
> >=20
> > Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.co=
m>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Now that I think about it, this should probably have been
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--myID+3ZAXg5EfgBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRScRwAKCRB4tDGHoIJi
0mziAQCy9+R2tv3ebHyzPAgKiOwVWpPQKfWM3B1FLvgEnXVZnAEAsFs9Vv2zmO69
zEn3f0mnZEZG6betXCnkGJ/XCk4uNQ8=
=pcfB
-----END PGP SIGNATURE-----

--myID+3ZAXg5EfgBj--


--===============4717553076099738035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4717553076099738035==--

