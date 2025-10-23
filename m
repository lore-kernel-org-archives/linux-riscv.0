Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D44CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGjssLRcPruyAejBudM4OrBZK/YHF5JXGF5F1Zi013s=; b=GsBXz4TigW1ZJrZK6u9CMaV2ys
	ifbHTgdnFXWnZ7yG+sW2b8g0c07mxc0WUSZZaCMWa/mWFXNIQGSe54UqGLJvY6yujj/H4oEEUIyCt
	YcPqQ6KUKmbMHN0ZS9xLdSbo3sJ4qBzrp+Z4dvQn6rlHZCMZgPNkucj+ZKZ/F1v+M0c1pK4bj84dY
	vSwKW/31cZmepTHYTlHaXm7PAnV3jKXijV0XX8/v/xo+wE/kIjbOK9f0AAZZ4IbCrSvTta9AouQYM
	CDPtgZ1sHXaUmlvs6xc3w65c62+RcTnQqgvQLxrfm1Arrv89xqqnHa7Bft/oAf7o4/TDLEGDC5I35
	n2SfJRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0QG-00000007IOb-1SCS;
	Thu, 23 Oct 2025 18:52:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0QF-00000007INW-0wHW
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 18:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iNwcnFlrFMVa5EKGN1iC6ANOgbWoVEcUG/+IRxZZob4=; b=Oggl7BMudokg8+8v5ZLdwY5Xcq
	UAmeByWMgVSWyVdencZhaCKR8RT/CLRuTiuldXd8dG9aIKa6AP/mRl44xCjji9uMS8aIn2YeI9zRS
	GCtJosz/Cyr3tf3Aow4hduXqadmIPkJ/3fRnI/TjlOO8I3mZVGj9J333iuA1LcrPwfAgGk64Vl2+C
	ZyCNSi7xcpN5OdtbU+9G+T/VjMnKGXhPwP3nAv/Yg3VaQp3/ngbhY461wVqHj0gSzOL/OzjEKIPWB
	5FcazsGnKM0zLCVGtLg4YBarNoqmozAvgqdtHIjfPMbW9vbgbFrZc2SwRIujwJSVVxiRWfMLLkiJ1
	M7y2p0Dw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzYX-00000001dAt-1hoh
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:56:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D50EE45047;
	Thu, 23 Oct 2025 18:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B07C4CEE7;
	Thu, 23 Oct 2025 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761245542;
	bh=iNwcnFlrFMVa5EKGN1iC6ANOgbWoVEcUG/+IRxZZob4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5QoS1dF3wNe9aYKaLnjUxCs6RBEWGey7PVz9UvpoJmaC2/M8pHXD6ZC9avAI8I4X
	 ThyuWU/EzNKKFk1a4hV7Zp7ZEt3Qi077JzUJP7mPjS3fwcm3i1Lh2vJpM6qn5OXd9q
	 GQkqIXy0Cnj1Zhpg+T4D/widXCB81gA/PrZ+/eLiPFES7VSteD9cLLnZ+Ijhn5t/9B
	 OnK71GEVrk+Dw7lrY48B+BwR92AilDmCjJZhT7aVJOfKK+q2a0tuPLc6rdHSgVkOlQ
	 0mVfMRw2QHz9smL9twoyIwG7V4n/c3Yp/PoEWNKNWNPdX7R6Kd6VFqhy2txWA8r7aL
	 eAWFPa+43qXcQ==
Date: Thu, 23 Oct 2025 19:52:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
	Frank.li@nxp.com, guodong@riscstar.com, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Message-ID: <20251023-feline-fanciness-c4d0a91a010e@spud>
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-3-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251023175922.528868-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185657_658499_0C50CEDF 
X-CRM114-Status: UNSURE (   8.34  )
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
Content-Type: multipart/mixed; boundary="===============7007250468442623650=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7007250468442623650==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ETu37CKt9FSwtQo"
Content-Disposition: inline


--/ETu37CKt9FSwtQo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 12:59:14PM -0500, Alex Elder wrote:
> Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - The "reset" property now only applies to spacemit,k1-qspi compatible

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/ETu37CKt9FSwtQo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp5YQAKCRB4tDGHoIJi
0otQAQCK3NvE/Tm38AIhpEtP6S7mkv0RqwsNSoSYOHCFHH4WfwEAiuXWhjAfdkH1
sM3n+P4Y+mZbEkMAfgQGPWp2lHTSSwk=
=eqg5
-----END PGP SIGNATURE-----

--/ETu37CKt9FSwtQo--


--===============7007250468442623650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7007250468442623650==--

