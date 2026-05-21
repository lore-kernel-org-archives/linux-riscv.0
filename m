Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56CCCD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 20:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+t2BQ0JV5lCyqoY0WQEXagfVLADLGifruEyoadC0vQ=; b=BS5Hr5aBbmfd6MFDqugpTqS+Uh
	u01KPKnAA5aW8U86clvzIfMurptI/VdWnTi2tNFlm/vSw7xYPORqPPM3Ow6Lof9k9j0WHRnpWxVpL
	xHtDHeKH5cvcPaPp7fm5Wv/H0vXUVNKTtSeIj94iLaVuq0AtoBzvvgmBrZEticYY7TGe7kR89wN8J
	50QR9HA7dpZcQeBI2eKf7jpWsp8n2uXtgaFUKOienyVaIZa0WWE1wEuc8Gpmcd7CwnNkU7lIywR5x
	2mFymkK+BUfRK6fKvNW5N1zrieoa6v+vR0PePTruNfSnY+H13qA92E7HpLYB0qJEI31fk5yBKt0Ki
	97Pj9eHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9eV-00000008ymW-3Um2;
	Thu, 21 May 2026 20:05:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9eU-00000008ymF-05Yl
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 20:05:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 163AB600FF;
	Thu, 21 May 2026 20:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514121F000E9;
	Thu, 21 May 2026 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779393952;
	bh=cv6uB5jJUAPv3s2OyJc+AWKUtjEFN4V62Cn/PKDP0NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K6i4QeLyErd3OIQtcKDZ5kBvfgE56iEpTI1kVR4QAHiUNKZEv1U/Z/xpYe2xStv56
	 uAf2tQG2sdLJ6RtK6PeiANL9wZoS8czm5p8FgwrSYjiOl1vwYmPvkMOTMc1EjGSNm1
	 mZKHZrn4UrNL5J8zfnu6yUkYWPg3nAZc+GbiO4KMYjwCzZzmbf1KPXBxAUg3Sz7KWt
	 p+2o9weLTNmvzc3J8LC4JeOS4gLj7qm8uXAJ8M41txlmcXJ3hT2ZZOnAvuN/J/z9ie
	 lARMLtQyOMv4Mi6+Dy6vE6GnNVHE0NyZp6oqm/mRhPOCOkckNKWV8pRPea43zzC3te
	 L3EnqmAnfAbLw==
Date: Thu, 21 May 2026 21:05:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Joerg Roedel <joerg.roedel@amd.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <20260521-unfocused-stencil-48520ecfb6e7@spud>
References: <20260521064445.1740782-2-fustini@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260521064445.1740782-2-fustini@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============0039928291287577779=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0039928291287577779==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N5nylATt8Y3roeyG"
Content-Disposition: inline


--N5nylATt8Y3roeyG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 11:41:18PM -0700, Drew Fustini wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
>=20
> Extend the binding to cover details specific to the Tenstorrent RISC-V
> IOMMU. In particular, a second register range is added which contains
> M-privileged registers, e.g., PMAs and PMPs.
>=20
> The RISC-V spec S-privileged registers remain in the first register
> range and are compatible with "riscv,iommu" so the Linux driver does not
> notice any difference, but the binding will be used by OpenSBI and
> potentially other M-mode software.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Joerg Roedel <joerg.roedel@amd.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> [fustini: fix dt_binding_check errors]
> Signed-off-by: Drew Fustini <fustini@kernel.org>

Discussed on IRC I think, sashiko complaint to be fixed.
pw-bot: changes-requested

--N5nylATt8Y3roeyG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9lmwAKCRB4tDGHoIJi
0nWsAP0TygXI7ZXe6ZVsOASVLwHfoMmNZkvxBWlW2Sd40jY25AEAzTJQRZ4uC7Yc
VC88ee2a9taFfVMMmpqdq0fm9xBSiAw=
=vTus
-----END PGP SIGNATURE-----

--N5nylATt8Y3roeyG--


--===============0039928291287577779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0039928291287577779==--

