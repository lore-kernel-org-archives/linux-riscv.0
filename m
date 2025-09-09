Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A938CCAC587
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 10:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjlK/XAIPgHRrQAxgKnhrhkDfB0MCyOWiZ6/wQo1bBo=; b=yooS8gQreD4szrRE2zCCKL68U4
	86xDqVFb0lwqy1PoNESfomQDJEnBBRlO0OeLeVQsY6EscFhVOwkTANmYDrKNAIraDkMLeBxSoJxER
	Q0woE8vK+svoTITsi1oKh6WS03EsW2wyer1ICxw0pkfsWeSDWlBOKh+/Mn+C7E7+BUxs6TBvdJGZr
	XTD597qbcVuY4qCHP/bTxwPNc7i/bb40e1UyfjJtSTTFTvLdG6hBIqqCWkWm/JKZVBZvN/JmI7aPW
	6MzTlFPDq72gDNB58pR+r+Z17bkjiOtBKigt0RCHWp7+6lFH5gzzPYfnuD2LhvhIjej+8eIvQUsrp
	NaYRLNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvFq-00000006FDZ-3EPV;
	Tue, 09 Sep 2025 10:07:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtpQ-00000005buV-1onw
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 08:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF66B601B4;
	Tue,  9 Sep 2025 08:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12690C4CEF4;
	Tue,  9 Sep 2025 08:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757406951;
	bh=wz0UHmZkyV0Vbp6rUO0Hwq4qZc9k9fz9jblD2E/udtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7Am5K2sWCsKvH3sK7JjAxAmM4Ho9ll9VGlBR2qNYGfpc5LuQVZr9sBlkE474DL0h
	 KyQLjavEICKkr49s4AN1SlvCjY8U5KHRXIK29F5qfP8azaStVhx18V17iOgnFSOada
	 ukfefVuMlGq+RkU+jIo39oGutPwZaPT7sbxT/ksUSdOtHZ9znMpt6XLC9X+UL1y+QT
	 K81sGcgRv8zW4yneISzMgN35vca0omHxiOHIAIlVhUzcL1j/DLALAzR4xSEdLsJiT9
	 7DFdIUKlxpcyBmX//FRxxXCERIbufdsR6lCFiXG5osH8nF5ta+TDWI4mFSJMETvMK1
	 orjQR/S1vaVYA==
Date: Tue, 9 Sep 2025 09:35:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, robh@kernel.org,
	krzk+dt@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: microchip: document icicle
 kit with production device
Message-ID: <20250909-division-fetch-01bf5027f6d9@spud>
References: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
 <20250908115732.31092-3-valentina.fernandezalanis@microchip.com>
 <20250909-accurate-wisteria-spider-222341@kuoka>
MIME-Version: 1.0
In-Reply-To: <20250909-accurate-wisteria-spider-222341@kuoka>
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
Content-Type: multipart/mixed; boundary="===============0547529599883880458=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0547529599883880458==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnYwVAd+w3ZrbIcG"
Content-Disposition: inline


--xnYwVAd+w3ZrbIcG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2025 at 08:53:05AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Sep 08, 2025 at 12:57:28PM +0100, Valentina Fernandez wrote:
> > With the introduction of the Icicle Kit using the production MPFS250T
> > device, it's necessary to distinguish it from the engineering sample
> > (-es) variant. Engineering samples cannot write to flash from the MSS,
> > as noted in the PolarFire SoC FPGA ES errata.
> >=20
> > Add specific compatibles for the Icicle Kit with Production device
> > (MPFS250T) and Icicle Kit with Engineering Sample (MPFS250T_ES).
> >=20
> > The icicle kit reference designs in the v2025.07 release include the
> > Mi-V IHC IP v2, used to send/receive data between clusters when
> > using Asymmetric Multiprocessing (AMP) mode.
> >=20
> > In reference design releases prior to v2025.07, the MI-V IHC subsystem
> > was included as a proof of concept in the design prior to becoming an
> > IP available in the Libero catalog.
> >=20
> > Among other improvements, the new Mi-V IHC IP v2 includes some
> > changes to the register map. For this reason, make use of a new
> > reference design compatible to denote that v2025.07 reference design
> > releases are not backwards compatible.
> >=20
> > Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip=
=2Ecom>
> > ---
> >  Documentation/devicetree/bindings/riscv/microchip.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>=20
> Why are you sending patches which are already applied? For two weeks?

That's probably my bad, I dropped the series when you had complaints
about the version that I applied and forgot to mention it.

--xnYwVAd+w3ZrbIcG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaL/m4gAKCRB4tDGHoIJi
0mR3AP97FGlnUbQYSGCOJbP/F4fIUOtaxL8XQBiJqV80n/g4pgD9EJ0WkjjcrSzE
QXVSt2O+TY+hK9UkHkQof+bWrew1/gg=
=5rHi
-----END PGP SIGNATURE-----

--xnYwVAd+w3ZrbIcG--


--===============0547529599883880458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0547529599883880458==--

