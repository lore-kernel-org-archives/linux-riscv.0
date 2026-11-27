Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD011606A31F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vMlyHixR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdPaOGGn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4ZPib815Fh6Y9tzvRXUObap6MmCH9xK4OZj0Np/tXVM=; b=vMlyHixRv/OIX6mz7a+Fog88q+
	ZpMfH7apk7GvYLbRII2dwgTDV2BBHti0bUhLIiIvQOKh4w3LgEBX4WmdEVJb7vFvUjA20TWqxCNGr
	slZJXMZIJOPcTW0tzt/yFTCBJobXhooysdkhyQKg0PKZBx+G9U2/upOVMya1m6el7Du1v8bhT0awV
	vvuUdVvBo04HBWE7znco5DYlVE6L893Jk2KepXti6AZz852zstZt+uyXx8UCJYEv321FNhGk8n/Lg
	gNH+gZOrHuBHDADIxo3voDIz855KC9XwqQslyA1Ae7GxrDKNjcJbUfrBNdJ8URgZsFpX7U+QBMOn9
	x9wWRkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0oR-0000000HQvB-16G2;
	Fri, 27 Nov 2026 18:36:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0oP-0000000HQup-2rdh
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 18:36:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27300434ED;
	Fri, 27 Nov 2026 18:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE1C1F00893;
	Fri, 27 Nov 2026 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804604;
	bh=tA8Aa2jEbLtXL6FwWF9YXfWBQgC7Lngh2MOgaijaglg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VdPaOGGn/6sH+6m+tO/URPTlIQ2FUq8PDf6jXvAyHSzeSjlTA1w3kSIkYoTpqY1sp
	 JcByLFZyK4K4wnqT/KT3RcK0MDJ5/pU3477M6lDyZNqC75vQX4ECNQ5cPMmz52tZnU
	 fu+yuJ7u/QjwwQjWXxKczIR15Wz2PyV02VUBEHFyK6RTUY/Oy8BvylpGx6NG//jbST
	 7HHjPx3xkNlA9xU5lvVpNcC3qf8EbtVOMYIf5fDG6c+lU/BOowratD9+lOWDwj1aiw
	 pieyIY3QamTGrAKVc3/Vt0QmN4YaXPORxOln+LENcJy1Ziq5tNHnffizId4Bu8D5PJ
	 cqX4ICnSk2vgg==
Date: Fri, 27 Nov 2026 18:36:39 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] riscv: add OpenHW Group CVA6 APU on Digilent
 Genesys 2
Message-ID: <20261127-portal-sulfur-cf29c003666a@spud>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4988504231816616414=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4988504231816616414==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywVelhjtDLhaqdrs"
Content-Disposition: inline

--ywVelhjtDLhaqdrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 05:46:24PM +0100, marouene.boubakri@oss.nxp.com wro=
te:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>=20
> This series adds support for the OpenHW Group CVA6 APU, the FPGA SoC
> built around the CVA6 core (https://github.com/openhwgroup/cva6,
> corev_apu/fpga, release v5.3.0), running on the Digilent Genesys 2.
>=20
> Both configurations of the core built for this board are covered: the
> 64-bit cv64a6 (rv64imafdc plus B, Zcb, Zicond and Zkn, Sv39, 1 GiB) and
> the 32-bit cv32a6 (rv32ima, Sv32, 128 MiB). The SoC description is
> shared in a dtsi and the two board .dts files only carry the core
> specific properties and the memory size.
>=20
> The peripherals use existing bindings: 8250 UART, Xilinx SPI with an
> mmc-spi-slot, Xilinx GPIO with gpio-leds, SiFive compatible CLINT and
> PLIC. Patches 1 to 5 add the vendor prefix and the compatible strings
> these bindings need, patch 6 the ARCH_OPENHWGROUP Kconfig option,
> patch 7 the device trees and the MAINTAINERS entry, patch 8 enables the
> platform in the defconfig.
>=20
> The lowRISC Ethernet controller and the PULP timer of the platform have
> no upstream bindings yet and are left out of the device trees.
>=20
> The bindings and the device trees have been validated with
> dt_binding_check and dtbs_check. The v1 device trees were booted with
> the cv64a6 configuration on the Genesys 2 from U-Boot 2026.10; the v2
> changes and the cv32a6 configuration are build tested.

I've applied this stuff, should appear in linux-next soonTM. No b4-ty
email, I cocked it up messing about with the new (to me) --resolve
option..

Cheers,
Conor.

--ywVelhjtDLhaqdrs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawnNtwAKCRB4tDGHoIJi
0gXhAQCn5D8IZ1KelVmP5Mr7HS/M1Ip5p/l/fFRJ75Q0PhB6tAEAp0FnuMPtu9h+
AuVc5fJ2EXtTVMSoSecjtjnCmVEaYw8=
=B3c7
-----END PGP SIGNATURE-----

--ywVelhjtDLhaqdrs--


--===============4988504231816616414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4988504231816616414==--

