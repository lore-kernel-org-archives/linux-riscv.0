Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0C1ECD995
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 18:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIjcxJtYkKR80PnuwcCDGXJb2iX48vUk4plaXYhoTKo=; b=2ipOpNWK2FA+aYmAHpEmgP3UXt
	qtqycxQ6AftsxTNJmYrBLicKVCz4iHzlQOVVWd1VF66rN4210q9Sa1/XAjO7kBCLJlvFpDSmTVCFk
	MeqiXJWlpLAHXrvUUEnWxEXAwxUvCEFVSq1kWS7CKwiMCC7H7mWkQjDGkGxLCUuDVfpGqIZ1KYu4R
	QEhLq54DJPuTN8cLOZMiGP+Sctm0zz50uhrwkUDF5UpypocIxJsG58slmSn4bGw6iGsqCJZ34/OSI
	ysoKV7pe/TSK8ftwugqZjpOr6QCcUNwowuEoJwLu3nLvPWjySMeb7gMjZloAyPfXo5aQjnkaO7YL1
	jx22m/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo43p-0000000AMey-0mIC;
	Thu, 05 Feb 2026 18:26:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo43o-0000000AMel-0MuR
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 18:26:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D7F36011F;
	Thu,  5 Feb 2026 18:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53717C4CEF7;
	Thu,  5 Feb 2026 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770315994;
	bh=NN1BUnMnduStMQdjhiWVthLf60Zi6vxqqFlWRMKB3tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsac3tkQQvBRe1vcrzaCV+6mQiPlEiyWMw9mPcRLRHivih1hS0FMHXWTafR1nYyLV
	 7SZuAAhwsJDxLePGS+3jGIQNk4WTFors4R4pcRmZO1BVlgL3ZySLvVkz9YMPptKzgH
	 xHhv3JvWwpezgSsq0cXaDU6uZ9PilVYmk0jNzgt2OgPFt5C9f74w442HfSA/Y2Qc/s
	 wlvbbTUr6hVyNbWa8LVs3OTsCzVvMxFOowPZXbD0wSBzIQIMsUKXYry+j7ei59EY3C
	 mxsH2xV75BgE8l1cUFDlyapVjpGwNqQUvgmwsuaQ3NfGg9ZCKqrRCnE1UvZb9z7iye
	 HC16rG8XKxsxw==
Date: Thu, 5 Feb 2026 18:26:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jingyu Li <joey.li@spacemit.com>,
	Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/7] dt-bindings: iommu: Add spacemit/t100 features
Message-ID: <20260205-presoak-reshape-9465d18bca4a@spud>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770281596.git.lv.zheng@linux.spacemit.com>
 <B1AEE717CF03B1BB+22fe4be0d3c8d2c6b4c5d3c19736c937cbed3c0d.1770281596.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <B1AEE717CF03B1BB+22fe4be0d3c8d2c6b4c5d3c19736c937cbed3c0d.1770281596.git.lv.zheng@linux.spacemit.com>
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
Content-Type: multipart/mixed; boundary="===============7699433531733234384=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7699433531733234384==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wpxlm2V7JNdyFlL0"
Content-Disposition: inline


--Wpxlm2V7JNdyFlL0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2026 at 05:10:43PM +0800, Lv Zheng wrote:
> Adds device tree bindings for SpacemiT T100 specific features by
> introducing spacemit,100 compatible. T100 contains distributed IOATCs,
> each of which exposes pmiv interrupt.
>=20
> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> Signed-off-by: Jingyu Li <joey.li@spacemit.com>

Please wait until discussion has finished on prior versions before
sending more. The merge window opens next week, so there's absolutely no
rush with this series, there's weeks before anything could happen with
it.

--Wpxlm2V7JNdyFlL0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYTg1QAKCRB4tDGHoIJi
0vDeAP9r/oVVVhAJWRxgemIGWRfNsY/zaFj7V/mrthly06/WvgEAxJWFOZkvjIPe
TaZIC5+OJVGIHnO5PdrGA73zOoKx+gc=
=unhL
-----END PGP SIGNATURE-----

--Wpxlm2V7JNdyFlL0--


--===============7699433531733234384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7699433531733234384==--

