Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC7606B5D6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pouswsee;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i5EelJRB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=thIFP7YZeej7K1xllR4qwHfV7RjelSd4QNkmtkY5IGM=; b=PouswseePCahIq5gABMUwlHH9C
	3DRu54hPNA/vVSpm0mANyyGuqdtc6kcqINRd2syTOu45268tPNSOWRP1OFJZb5O40wtd7BqUnuqYr
	nfXv2DRO3u1ugp3557Lfe9yipqNzCwwvxmyHaEe04Y4tV8hd3X8pVHh+3fEWplocU7VsMt7mWB5S1
	uITlVuuhi+7/SuL4SkhCbRg1Oo2ZcXCOs4PufSgNNIPpHW2pXJrEsZz7pLF0jhGxEYNvgDPbpln1y
	/bJjC2X8mB83BxhU6svTI45XeZXxghPFQvbYS/aQ2BzYyO/4xiW0D+wRw4K6fdGEW7p4bummQm06G
	l5HroPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRu2K-0000000DXIK-0K3h;
	Fri, 13 Nov 2026 16:22:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRu2J-0000000DXI7-1Ecf
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 16:21:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFDA343CCD;
	Fri, 13 Nov 2026 16:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E07C1F000C4;
	Fri, 13 Nov 2026 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586918;
	bh=fIXPmzhR4Ap9kSK0s1ZKRTXuiT+xn9k/ZdxjDpdymhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i5EelJRBHORAp13IHkBsq3E84S2AkEYzM9L5ugnwkXXka+PDWQ+ZldHoj5Y5UDlJg
	 bubhAGlj7FnjrVRDytr8ShilLe/HCl8H7nYzpL29zcPNBH2WFKVbHswekM/W3Shlt+
	 ivhTMgzcIxY/maB8AwarXYoQmvsIntqZ+iOlguNADPyR9npSBV3IIpuATleWJiztaS
	 8uZn+a4uhvMAdh/PzvXMeL63oCgmeVq3PSqq+RPxIqEQalI0FVc/40Dp1Jn9MUmqSv
	 Jdtcd4aXMeQzxdhVVY3dc8l5lxqakYyYPjweUonx4rqUEz4JQ9HyTUJK7SK5Pn94Vj
	 MxKY60igbNkQQ==
Date: Fri, 13 Nov 2026 16:21:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 00/19] riscv: andes: make the LLC driver and cache
 errata generic
Message-ID: <20261113-overcoat-facedown-fcac3e162931@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4697558192943755033=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4697558192943755033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lRtlk1dXxjMUQU+8"
Content-Disposition: inline

--lRtlk1dXxjMUQU+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:24PM +0800, Mina Hui-Min Chou wrote:
> The Andes last level cache (LLC) driver and the Andes cache errata were
> written for the AX45MP core in the Renesas RZ/Five. Other Andes cores use
> the same LLC controller and need the same CCTL-based cache maintenance,
> but the driver, its binding and the errata only handle AX45MP.
>=20
> This series makes them generic, in preparation for the Allwinner V821
> SoC [1][2], which uses the Andes A27L2 core [3]. The A27L2 has neither
> IOCP nor Zicbom, so it relies on the LLC driver for DMA cache
> maintenance.
>=20
> The series is organized as follows:
>=20
> - Patches 2-6 rename the AX45MP and L2 identifiers to generic Andes and
>   LLC names, move the Andes CSR definitions to a shared header, and
>   rename ax45mp_cache.c to andes_llcache.c. No functional change.
>=20
> - Patches 1, 7 and 8 are small cleanups. No functional change.
>=20
> - Patches 9-11 fix issues that do not show up on RZ/Five but affect
>   other Andes platforms:
>   - write the full physical address to the 64-bit CCTL registers,
>   - register the CCTL cache ops only when the errata asks for them, so
>     that they do not override Zicbom CMO,
>   - index the per-core CCTL registers by hart ID, not logical CPU
>     number.
>=20
> - Patches 12-15 add andestech,llcache as a generic compatible, keep
>   andestech,ax45mp-cache for existing devicetrees, and add a
>   MAINTAINERS entry for the driver.
>=20
> - Patches 16-18 make the Andes cache errata usable on any Andes SoC:
>   ERRATA_ANDES_CMO no longer depends on ARCH_R9A07G043, Andes cores
>   other than AX45MP use the CCTL ops when they do not implement Zicbom,
>   and the SBI-based IOCP check is limited to RZ/Five.

> - Patch 19 adds the andestech,a27l2 CPU compatible. The V821 devicetree
>   will be submitted separately by Allwinner.

This patch is missing.

--lRtlk1dXxjMUQU+8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavc5IAAKCRB4tDGHoIJi
0moEAQDVBv655Pk8FJSiHbmcw6iWuP15bwLdSG7Or5clXJmJvgD+LbkpwW05yW5Z
7PSdKmrUiXFApjw40K1A9GLE1AmDSgk=
=fCFy
-----END PGP SIGNATURE-----

--lRtlk1dXxjMUQU+8--


--===============4697558192943755033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4697558192943755033==--

