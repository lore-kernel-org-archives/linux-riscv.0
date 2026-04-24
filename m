Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A93DFED3EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dhAdDEyk8Ggw90QP3v5l2FwfuqmVstrUoeqSOsA9jg=; b=zoy+1HbtGVCDJB0+w004fDzgL2
	ofFJasfHWovl/bA6PYXwhrj2QLsFcCO/7cSwkx3FitkWPoufghHT4++YjziBf+v+WdF8wptYurs22
	JJ/9BxNxCpagB6jCiwUDTlV/YMO8oyR41RUamUN0NfuOW5HkL/JPXJ/lJz85tkZ3O1R6tiJLUCA77
	vWZA+zeMDhSzYiZwfMJYahh+t2pKTnlx1SB6r8ngJ7wxNMGeyd9qTNglPoMp7/WDjWHkz5Y5mV0E/
	m42nM4FjLfHbTE4zeObAwkB05ATrMoR4SAePkBBhB1MycQAj9tegadkZHr4rFhpZeAR4zOfHk7lm3
	TW4J8OwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJwb-0000000DZEU-2Ue1;
	Fri, 24 Apr 2026 17:03:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJwa-0000000DZED-0yqn
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 17:03:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DA3C600AE;
	Fri, 24 Apr 2026 17:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBB8C19425;
	Fri, 24 Apr 2026 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050235;
	bh=vpzvilq6KjAFWPzsZTe/h1k59Km6tBvjeHIMJU1XgVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IpugPL49eT4rknt5I79qcZe3fYCzBUMSyILi/UbhYrpOpoDXJilS3IwNftdeMohl0
	 r2v1HMKoXASRE/RWS1+TEW2XtBCaGY5Zddy1REBKsHeDsEzlPyFt4njYIAUJZC7/pI
	 YlZ08TtSOsv1pN2mhbws/nv6oP28HANjH8LIatOLOnzUBBbmXwr9CLTEQYNDM6izek
	 Bv0F1uJ3sUqnvIEq8bQVdJ7A88BNJOHIfkGxwge+/M2mPYOJu1+jmUF5X5yz335kIi
	 cw1ei+fsew6EHR/N/bKn6eD2ISFWlMJkMTYjRjAAVef0+mnZRyiFe+h2gTv2mzCkxJ
	 7pC5x8SS72STA==
Date: Fri, 24 Apr 2026 18:03:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
Message-ID: <20260424-collector-zone-26410e4707a7@spud>
References: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>
 <20260424-k3-pdma-v3-1-efdf2e414a08@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260424-k3-pdma-v3-1-efdf2e414a08@linux.spacemit.com>
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
Content-Type: multipart/mixed; boundary="===============2280135348630504429=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2280135348630504429==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FJVvYi+3HKEojWVf"
Content-Disposition: inline


--FJVvYi+3HKEojWVf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 04:20:29PM +0800, Troy Mitchell wrote:
> From: Guodong Xu <guodong@riscstar.com>
>=20
> Add the "spacemit,k3-pdma" compatible string for the SpacemiT K3 SoC.
>=20
> While the K3 PDMA IP reuses most of the design found on the earlier
> K1 SoC, a new compatible string is required because the DRCMR
> (DMA Request/Command Register) base address for extended DMA request
> numbers (>=3D 64) differs from the K1 implementation.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FJVvYi+3HKEojWVf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeuidQAKCRB4tDGHoIJi
0t/CAQCIAOQN4TYlpXK82vNLDwwODSFHT7GsOjh3smrUC7w+mwEA8RlB1ObCy1Og
Sg0d01zgcYTCnZq0zfzrc83Psv/L+w8=
=xIIX
-----END PGP SIGNATURE-----

--FJVvYi+3HKEojWVf--


--===============2280135348630504429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2280135348630504429==--

