Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41664CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOLeoEzzRqZDv0UiJYi8JKu+Q93asSFf9kj+Z4rvxhQ=; b=dBY6bP8C/RgWKMb5eU7Gm08oLF
	KXpbudzm+qSJK47YEbcjVS2hzI55NYO3lf/KT4WJrbWvgYssy8B7frR5EE9CGdoMq80/leqYgrzTB
	bX5ZbUqMHospZTDSKhmVkHaAD0PuKjalAS9dmzxo7RfDTre1h62DNUDBjvZx7vDsExoKITeUv9DPw
	kJfuPB5+ecg/QGewDiin5MG6n0wWYsgnF9nunL++5OGCek/y5AQA9lkoYd2UdleSiNyxPVdY1HWf0
	xkiKJ/faoa0XjgInLVO6anvxx3EzfD1hcDPE761BxyGZjvInDzPqq8bNfi0yvHbuzRdfgHOZhdxmY
	qS1gjeOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Pr-00000007ICj-2oca;
	Thu, 23 Oct 2025 18:52:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Po-00000007IB3-08Rl
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 18:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76A8348236;
	Thu, 23 Oct 2025 18:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A0DC4CEE7;
	Thu, 23 Oct 2025 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761245519;
	bh=eESPCSSOXsamdSuHXgJXCQrhot0/CQd3pgItLPG55rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bA3b2DEt1Qj9qdsRfH8GCJ5h0s/H+acgjn84ZW3oj9j5P3DZqMYlP4KXOQELIoOyJ
	 pntbvPcNso9/wMaH8FA1GkPYMHXL+kUQjiS0Wh/HQXLlAllv0Fq7/AANwXg0r7j3LV
	 oKy0N+6zDNkN74OEltqsVPXqKNFR8P93zL3FxGyWYC1CLXkpaCtofUJaprqS6Mi7RV
	 zCRs0AYDKzez8eVjNxDKiVOLwiDQxtVa54yw640Q3XXkNn6DTTOMyrl7b4JCCSeN5R
	 4MiJzsVSsvvNw5ulxutifgawh2Uve19vLrs398gq9xKBGaKkz8Tl7vAAn8fra+y3pZ
	 4IIozRWIUa6gA==
Date: Thu, 23 Oct 2025 19:51:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
	Frank.li@nxp.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Message-ID: <20251023-finlike-outline-86e62afa4bd7@spud>
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-2-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251023175922.528868-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_115200_630952_765A9BE4 
X-CRM114-Status: UNSURE (   9.49  )
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
Content-Type: multipart/mixed; boundary="===============8025903021345483821=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8025903021345483821==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TUrEZvgml7CQLLIf"
Content-Disposition: inline


--TUrEZvgml7CQLLIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 12:59:13PM -0500, Alex Elder wrote:
> Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.  This
> is the first non-Freescale device represented here.  It has a nearly
> identidal register set, and this binding correctly describes the hardware.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - Point out that this is the first non-Freescale device used here

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TUrEZvgml7CQLLIf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp5SgAKCRB4tDGHoIJi
0hS8AQDYMRazoABNlKH/b+Mygp/zkDAWNQf1cbEZnLpyMl7Y4wD/Re8aUdx97KFQ
e82V6/zj8gHJG/3k0oy3joGkFupZOg0=
=OZe3
-----END PGP SIGNATURE-----

--TUrEZvgml7CQLLIf--


--===============8025903021345483821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8025903021345483821==--

