Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC28CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdQHtJRhTNfunRzXtsOHm+MHArvdIFb06ziQqMbOLj0=; b=Wa9yUilWkKvo6ncvBg1DekEAH+
	CKBkvXbiesrVkLfQqXCw0gDMp+aCoct6UUUjnvqWIk8tAaaNG2HeElvigizXl3dT/zXfXS99lSF3I
	e1brDqDN3d/XEI3kKfAbl0uuN5SfoTrsb1AIVWki9ybKkSZAYojQyCnO9qVJj6zFlJsr+BxW1PV57
	0+At8Q0T8zRI2X2qfzADK5rAMvXnJ6Uc62iQYm9H8jHRit3mIEA9ZVYD25nDMiXnj2u5xzOtFyVLp
	Xiz7gyf7xG/Ch5FPKM5uWa/iYea1QKmPp9ZZd8YSmQFWaPJDZHIe8nWtOPnSrDnmicZICHZtp/9nR
	0qfTABzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzf3z-00000003g6x-3k3Q;
	Fri, 19 Sep 2025 17:38:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzf3x-00000003g6X-2fOT
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 17:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC89043E53;
	Fri, 19 Sep 2025 17:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A808FC4CEF0;
	Fri, 19 Sep 2025 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758303504;
	bh=JXalJEMcPKVI/FVEmtCWbAZklUCmyc26S6X4DiPHDhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhwxqF+wG8hXFFHVWDx5aJLsRFthdERZdrOA8ex0VML4B0kDewcxb5QOC5j0CHcsY
	 x83LLiayEZ4ako1S04jEKQPZucYCyEbqkOV1aI7a594i8wRkDwfgz7URxkh5gLVIwM
	 2EOdGu9/lZ8/gwNaRGMkcKRYuYKMjqbIVSNSYv0ezhGx8xmLAcV32f3tw47e+LC7th
	 rVrzdJmK5B8S3GIc/B4vUrbIxm9KDElfmQcPPtOIACkmLVcCE5OhtQZFNRr9ccXtrk
	 0Sj9+w9gwAjrkJ5XZv9zt/7biTS6ephQD1z9xVCZIoGbw69XS2ojE7sV+b52OcMlbk
	 p6CqafBRmTViQ==
Date: Fri, 19 Sep 2025 18:38:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@gentoo.org, ziyao@disroot.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <20250919-serotonin-simple-ba6ff8cee16b@spud>
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-2-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250919155914.935608-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_103825_690824_7F4B8E43 
X-CRM114-Status: UNSURE (   6.38  )
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
Content-Type: multipart/mixed; boundary="===============2835699027050918468=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2835699027050918468==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="txZUjU8dSxy0XkUh"
Content-Disposition: inline


--txZUjU8dSxy0XkUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--txZUjU8dSxy0XkUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaM2VCwAKCRB4tDGHoIJi
0mCuAP96BDQRGtzFy5PJ4/T+VpC8SeoS17z41ztpiwSPJWowfAD/RhMhwlKRv5Bz
O5cbvTsjzlk3z7wOks+MXJiY/k1q+gA=
=ltSs
-----END PGP SIGNATURE-----

--txZUjU8dSxy0XkUh--


--===============2835699027050918468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2835699027050918468==--

