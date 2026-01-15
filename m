Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FE8D4661A
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzEN6QKHrSgBHud3AfofnOkV6hI83CuiEsx8na8kP+k=; b=Xqna4LegY1foiqgBZPqT3kyhd6
	AwZ//YGrvTYzqNrDFeBltoNUqSr0NEn5Iv7cPVWue1of/4HEY3v2lBJ6AuGbD1iZkezXpoMAZMg0S
	YFWLJ2RCFnKipIJv9yTwHiUEzhxUIyGXFXI81HGMiVS+ed1Urry8hyfxKCfmuU5mu9V2dJWlbdi/S
	2WVh1xuhKcqz9Xm9HubuG7KyaLCLfB+7nL0LC2G/eG7k1BxbMDPi24BXqePMGoo5chI7jxT7qHNuv
	aMxGcwY3+uTC9eRj8htac+2wu7Ya6Eznyzsk7P7v1fbJiMqJQiSmWueDwRaxd9vCPDMW+XvdDhw/X
	oxyHAyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSmc-0000000D1hT-0oKL;
	Thu, 15 Jan 2026 19:13:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSma-0000000D1hB-1Ejr
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:13:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4788D6015E;
	Thu, 15 Jan 2026 19:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590A7C116D0;
	Thu, 15 Jan 2026 19:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768504403;
	bh=6ERhtSOK4Q4fZaqgucSIqkZPcyHf8nMO3hzMy9j2wWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsvKt4sd05QKOUaPz2q6BkE1QSNszgX8p8G6nz1F55VMcfHQpEdOWVCIHKu/GKeeR
	 3M3YkKAadYREkVOiMlmwcBYalZdwftWcycDbHUR2TBfHY2kWE/Bnm2RE1dzyVTgJL0
	 tZ6LzUVFDZagq8YZFCDk0UhW9XDgOIciRVlpG4p10ycqwJueivh8NbDjqHSmv9R1E2
	 XMmgAM2ucb8XKGfEevA5Pf3ImuXQXpPr9esn9U/b7jnn9ANaIZyRJNS+1UCRL1FQU/
	 KXMesoIe2rQ5d5Kl1vwXkPLBoMDwOG/JbqXKUDNh5Sjiyj7iKUtsJEGxZ/xf6RPrfu
	 JrHci5Xp+FyKQ==
Date: Thu, 15 Jan 2026 19:13:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Message-ID: <20260115-phonics-reversal-80541ca1f2df@spud>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============8540927875842418161=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8540927875842418161==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sP0KQQHEFQVHHdeO"
Content-Disposition: inline


--sP0KQQHEFQVHHdeO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 07:18:56AM +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
>=20
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
>=20
> Patch 2, 3 and 4 adds "b" after "c" in 3 different device tree files
> respectivly, anlogic, sophgo and spacemit, fixing the related dtbs_check
> warnings.
>=20
> This patchset is based on top of linux-next, tag: next-20260109, and
> depends on [2].
>=20
> Link: https://lore.kernel.org/all/20251230-imprison-sleet-6b5a1e26d34b@sp=
ud/ [1]
> Link: https://lore.kernel.org/all/20260110-k3-basic-dt-v4-0-d492f3a30ffa@=
riscstar.com/ [2]
>=20
> Changes in v2:
> - Patch 1: Add Acked-by from Paul Walmsley.
> - Patch 2/3/4: These are splits from the v1 Patch 2. Split into three
>     different patches for each SoC.
> - Link to v1: https://lore.kernel.org/r/20260113-adding-b-dtsi-v1-0-22d6e=
55d19df@riscstar.com
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> Guodong Xu (4):
>       Documentation: riscv: uabi: Clarify ISA spec version for canonical =
order
>       riscv: dts: anlogic: dr1v90: Add "b" ISA extension
>       riscv: dts: sophgo: sg2044: Add "b" ISA extension
>       riscv: dts: spacemit: k1: Add "b" ISA extension
>=20
>  Documentation/arch/riscv/uabi.rst           |   4 +-
>  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
>  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------=
------
>  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
>  4 files changed, 150 insertions(+), 147 deletions(-)
> ---
> base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
> change-id: 20260113-adding-b-dtsi-148714533f07
> prerequisite-message-id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar=
=2Ecom>
> prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
> prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
> prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
> prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
> prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
> prerequisite-patch-id: 1f162c02f8bdb5bbc8ce52ead4fcb76258f5c2b9
> prerequisite-patch-id: 76e1ff26c2f1fe4019cfa574942b568000e6ca1f
> prerequisite-patch-id: 77ddc9e5dc85495adc803cdc605bdda2ddc7fa47
> prerequisite-patch-id: a75c798383b46a14d40436357c769c3671184768
> prerequisite-patch-id: 781fc10dcae2c38c84c25bee887ef7474786dd36
> prerequisite-patch-id: 5be5d3e62aa73024bf9e1de6aad155be6d618f40

FWIW, this kind of prereq-patch-id stuff isn't really helpful, because I
don't think there's actually any dependencies on that work. It actually
trips up some parts of b4 that think they're needed.

I applied the Anlogic patch.

Thanks,
Conor.

--sP0KQQHEFQVHHdeO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWk8TAAKCRB4tDGHoIJi
0qJXAP9BAi/JL4BUX4v3frtYl233RdCgXONa5Aa6sLWiDuldrAD+LoenY5vTUJMs
2yqbA1IH2zP1CkI5ysicbD/YYaQMtww=
=HTet
-----END PGP SIGNATURE-----

--sP0KQQHEFQVHHdeO--


--===============8540927875842418161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8540927875842418161==--

