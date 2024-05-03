Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A82C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWZ5a9cRwa73Yx92LtFLHNW8b+Zx7uBKxcoyOcJXtOM=; b=gx9bUC6yx7G6GNFkKMrNsIj2ow
	lZ7JM5lJ8APdgBx3v4qhs2cZuHA9N91FYFDUkK8h/Yeh1zteKEJle0QkzoiU18uSqlEF+RloHAk6O
	zRTeEAgk4tRGnyNtoI02JeJX0JUiJI10OqAtQBJpuw0dZJAtHm6MdP+rVZ7VabEMpSRSaBl/GZ4mm
	Dd1LHJh7Xu9U4fYGq17rIyxzgsKCMMlRE6njWs4jjl/59f7JIhuNXGs9amNQ00FKTyxAotzJewIl/
	znztkSQA2tr+4n9o5BJZV4e0x9JkmDY9hngqt+wYJc1uz0rtkUAQrFDApdgTM0riyq0mOOXxKlwGV
	/8cO3j1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vVH-0000000HABE-2rdZ;
	Fri, 03 May 2024 16:11:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vVE-0000000HA9n-1jZR
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 16:11:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A35D61DC9;
	Fri,  3 May 2024 16:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648FFC116B1;
	Fri,  3 May 2024 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714752674;
	bh=oTisFi01Zd4Pmszwj1C79oYyoxXOL2cP5wDm4FBUB0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5BPH4lm8wFiIzo7U4RpWrvjfuEHIfOlXunrBHzTAkRo/ybsXdsJilnRzLV2d5T/t
	 Wg+TZvPL6PyBeUPkpyAxUFQ2aMXFzvLuLWU+hlhS/4ElfquhuUEhip/PQNILgmCpty
	 j79V1KJOp7PpIXBqZPkR1F+gNQJxFupobZJVGN3EhzoAWFyWYS/L39dvMU7u3hQkl/
	 yTkmkuzMrvhSiVsM997jm7zWvJseNZkUpR9yVUL7Lf9u7Tj/qxQ56dOJbIWYC4rrDd
	 BGqMUkb5GYHAEMEBKQKpeItgB3A+Te8gUPQANaBy8Ml6xrSncOJ6xM69Q6cK3c3FE5
	 38CwvYmqKGm5w==
Date: Fri, 3 May 2024 17:11:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prajna.Rajendrakumar@microchip.com, broonie@kernel.org,
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org,
	Conor.Dooley@microchip.com, devicetree@vger.kernel.org,
	robh@kernel.org, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Daire.McNamara@microchip.com
Subject: Re: [PATCH 2/3] spi: dt-bindings: Add num-cs property for mpfs-spi
Message-ID: <20240503-unfair-charger-8d47fd7b4a91@spud>
References: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
 <20240502143410.12629-3-prajna.rajendrakumar@microchip.com>
 <10671947-f418-4520-a29f-4ce129770e65@kernel.org>
 <1edb6c4c1a66c1a2009278b99f897e3a71b592c6.camel@microchip.com>
 <7b6489b7-ec9f-4fc7-af72-4d5cc87acd7f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <7b6489b7-ec9f-4fc7-af72-4d5cc87acd7f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_091116_783440_729B0BA0 
X-CRM114-Status: GOOD (  12.30  )
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
Content-Type: multipart/mixed; boundary="===============6864054463395315579=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6864054463395315579==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QPyTx+r9rQ2f1FX5"
Content-Disposition: inline


--QPyTx+r9rQ2f1FX5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2024 at 04:46:13PM +0200, Krzysztof Kozlowski wrote:
> On 03/05/2024 14:54, Prajna.Rajendrakumar@microchip.com wrote:
> >>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: microchip,mpfs-spi
> >>> +      not:
> >>> +        required:
> >>> +          - cs-gpios
> >>
> >> I don't understand what you are expressing here. Did you actually
> >> validate it that it achieves exactly what you want?
> >=20
> > Since the controller supports only one chip select, the num-cs should
> > default to 1 and cannot exceed 1 unless GPIOs are used as chip selects.
>=20
> That's not really the answer... or you want to say you did not test it?

She told me she did, and even if she hadn't, I did, despite what my
email earlier today might suggest!

Cheers,
Conor.

--QPyTx+r9rQ2f1FX5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjUMngAKCRB4tDGHoIJi
0ioOAP4qrZKQTHIXUkqkdaR7KEF4zHhg4D/1C9rn1t8djg/KQwEAhKRMyrlN9M8l
95XsbmHI+ErsPIxOkVKUzCTi8NTnRgs=
=mXlZ
-----END PGP SIGNATURE-----

--QPyTx+r9rQ2f1FX5--


--===============6864054463395315579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6864054463395315579==--

