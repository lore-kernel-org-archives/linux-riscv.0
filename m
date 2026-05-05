Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531BFFF885A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Whtib/kfhNP5/hkyiD2EKUXyZI9ASZSe0G/qoz2iqQM=; b=YZuYAG2JyPr/2Sd5Z/JZRPUy+p
	3qYECN/dk8ZLNlZUWLabG7zPiQGbNkp1yT3Ne7HKAdjIJV6k/53FLuYRQNZ1/+TBwPWERNpqTnDBY
	g8f+0HMxTqMQFYz1S31AzWbdsEe0KUvlYoj8TYB1AK1kyolzV4gIJEUNt0jWw2Dmbeod9h3nnL0w6
	TtXTc7spzTTw8jnNNTK7+LpQ0d93zLnURwuvsc5YGE2ER6M2/AeVm5uMDXm1hYKRSVBs6m6r7EmRz
	Y84iFUnoZM+tM2OFkvn2j827PJ80iBDHmHOSTF5eBQ90JAZIlORXbUbbO1x+Zq7g2Mj1gJ50hIfGj
	bj1PYqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCNi-0000000FhaT-1waL;
	Tue, 05 May 2026 09:47:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCNh-0000000FhaM-3bdP
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 09:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D229560139;
	Tue,  5 May 2026 09:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DD7C2BCB4;
	Tue,  5 May 2026 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974476;
	bh=rgsC7Th5Xw5EDH8D04pUW8olV6c3tFld3eIVw0s7rDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gy/34RulvKDsuv0MnjSMnn84Ge7/lJvLURQAMdLckeXNxEzaW+Uu/NZ0MFB09oIMP
	 zlm12fLkF/m7QdQ/MRto18gRnVnDVhzyTfWyGI8/FJQuO5KQg/QatrAupbMuseuJLl
	 dvXRqbK7EM8Z3SNxbqYUHKENijNJIL56+KP7lwACqeOBL3GPqEQY0Zci8jLcchRRVP
	 UcWNtZVC2nb1uwZ8C0frs4DhrrJdrdniLfIwYFwOVoNido4p21j1fYaCFaui/9zsw+
	 U/Y4QT5HmOv7VFmALSXYuwnYrabomm4OC4dX6x2yi+tOxK9VjxfxZuMpjPDhkKW8nI
	 ArAc3DtB89Sdw==
Date: Tue, 5 May 2026 10:47:52 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com, Brian.Burke@microchip.com,
	cyril.jean@microchip.com
Subject: Re: [PATCH v1 0/5] riscv: dts: minor beaglev-fire improvements
Message-ID: <20260505-equinox-overeager-a0d7a3d84394@spud>
References: <20260319-outsell-hypnotic-94b480408ad4@spud>
MIME-Version: 1.0
In-Reply-To: <20260319-outsell-hypnotic-94b480408ad4@spud>
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
Content-Type: multipart/mixed; boundary="===============7308388637700457752=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7308388637700457752==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ah00lo09AlTLcpDr"
Content-Disposition: inline


--Ah00lo09AlTLcpDr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 04:31:14PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Yo,
>=20
> Some minor improvements etc for the BeagleV Fire, spotted while updating
> our downstream stuff to the latest lts.
>=20
> Produces errors at the moment, as it depends on changing the
> interrupt-cells in the gpio binding.

This has been merged as part of 7.1-rc1, so I've applied this series.

--Ah00lo09AlTLcpDr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafm8xQAKCRB4tDGHoIJi
0nH4AQDy2OTEZDNa2wkD6s3rmRk9pjUYRxbDgbDYkLeWpMnKrQEAj0kwU8VpeDcE
UOyR3XRxp3oX0OfWILtiePr0jnH6CgE=
=sbCY
-----END PGP SIGNATURE-----

--Ah00lo09AlTLcpDr--


--===============7308388637700457752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7308388637700457752==--

