Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1812D12696
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1B0K39dQ4RWCCMNt3NEkYG/FKsTUQf6Bn+i2fW/SUM=; b=PGCBttqjM+Tlw89p8aDgB/JDcA
	GAGlcgP00OLOu1IxW095JvBj9oSqFLbZXcG1ySd0gVSvK7hCL8qQhaW84DhBUZXQpkuH+kHWUVwTd
	MzxT3ytqAKVMw8SUX7/NgtlGXsxDfc41y5quvf2TBEcfRP53Dj5rIT6/gEratA7seaMmn69/DcSOO
	iDp1ISZJlUwyoujsv1eAPsAaKg7McmVG2qTLkjeN9evt3JpOgkhMfypVN8Uo2yN19ZNqJQKfMXSTn
	x0kbvceyKFp1hf/fMh7qsEaYqF+jrhOijjufcUAWd1Yumh/rqRqwULn2J//6yi+8b80/TggonEOiX
	UK5MJnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjYr-00000006QFk-2MbE;
	Wed, 03 Dec 2025 09:54:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjYq-00000006QFQ-1N9m
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:54:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5E4F6013C;
	Wed,  3 Dec 2025 09:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0580AC4CEFB;
	Wed,  3 Dec 2025 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764755651;
	bh=WyIy6RdPUW5F5eYPpZa8HAXKBrsGq1YM0A/zoygdnZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxkL1MfUi4zn6ID1GMMb+owLtzF3VE0BHIj+W148v6Tb7MYKoVgsBSeTTlVhHF2DS
	 wYCQGg5+Rcu47utzTe4XofE6Ts1AoqqPpJCG1LmuRbUuInWmgU+eoZQoJ44UFc85o1
	 9XUdFXoCQA/2JCIpJCPExO6eb3xyGcREqXHbiPnFxDhcxhcmavoJyqcmT+6GSrQFYp
	 v6zIh+Aw3IpNX5fy4PNearxMeeewZ7Rw5JarFsY7LwwyoNvF7mVpYgTz+eZlxxRafU
	 qNWN84kEC39aNdEFTuS5/brpTrXerQexjhddLUml/jCXIrHAVBX599XI4fWd/QmPX5
	 USjivBjUZYj2g==
Date: Wed, 3 Dec 2025 09:54:07 +0000
From: Conor Dooley <conor@kernel.org>
To: q691800735@163.com
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr
Subject: Re: [PATCH] riscv: configs: defconfig: Add initial Kendryte K230
 defconfig
Message-ID: <20251203-virtuous-lumpish-587130b6f2ee@spud>
References: <20251203020619.16496-1-q691800735@163.com>
MIME-Version: 1.0
In-Reply-To: <20251203020619.16496-1-q691800735@163.com>
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
Content-Type: multipart/mixed; boundary="===============6023496812834469769=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6023496812834469769==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p+ynGWL66zoW2XZK"
Content-Disposition: inline


--p+ynGWL66zoW2XZK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 10:06:19AM +0800, q691800735@163.com wrote:
> From: jybruceupup <q691800735@163.com>
>=20
> Add initial defconfig for the Kendryte K230 RISC-V SoC.
> This configuration enables core features for basic boot and functionality:
> - Essential RISC-V architecture support (64-bit, S-mode, page tables)
> - Boot-critical peripherals (UART, GPIO, MMC, clock controller)
> - Device Tree overlay support
> - Basic power management and reset functionality
>=20
> This defconfig serves as the base for K230-based platforms (including
> CanMV DongshanPi) and maintains compatibility with upstream RISC-V
> kernel features.
>=20
> Signed-off-by: jybruceupup <q691800735@163.com>

I replied to this yesteday:
https://lore.kernel.org/linux-riscv/20251202-choice-crudely-b7775c3e452d@sp=
ud/

--p+ynGWL66zoW2XZK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTAIvwAKCRB4tDGHoIJi
0nXEAQDvFpC2fIB9qi044YE+dLvu2HmgZUtaB4fswOhYeZLLQQD/RuA20x5fDlVM
Kow26qL9n+otDSZh8TbLP7FHjPKekQQ=
=ut4o
-----END PGP SIGNATURE-----

--p+ynGWL66zoW2XZK--


--===============6023496812834469769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6023496812834469769==--

