Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E06C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXDLNR+IL8hig/baNQ/Q+n0iXUTpIsxzFO2P4dbTuCU=; b=gclDBhLHfsxiqChxeOo5fLSBzb
	OVpHcJRY5xt6uJFgr9VBHboskhih74F4YLA/AzCNFOm3BarYi1dhIvvA1JyetGTIx0KNXgGYTqrd0
	BHcQXXcJtxViAhtr/+ZMwtsmnrHBhyIqijsNg52DjMYtWUHf3MA35Sj+KYq/Q0jERCWnquFvU3ti5
	JHDWm3lFwdHGYOaIwOxg5qzGPcTDhKYK6v9wBuXyKNS69TpaWU4fyAZQalbxQNo049qs6cSo1Po6g
	uTitx7LWduUDDeB13C84oKhmillc2+k4La2S4gUvdfRNDmn8jX/hTdRgfPKg68FHD3er1HdqMbPSY
	Ydf9m13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmZM-00000006XMR-1hbu;
	Mon, 10 Jun 2024 21:28:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmZF-00000006XJD-2WUo
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 21:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC07560B8E;
	Mon, 10 Jun 2024 21:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C486DC32789;
	Mon, 10 Jun 2024 21:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718054920;
	bh=2KZ5f8nS8yBEblGMZWCtnPRB6qzqZbzAyH4yEM/WYJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MswwGGmQlG2zRQxzKRYZ6UzjfKbdSq8rWv055efujrfc6pHMHLCFRIXV/Eo7OTOFC
	 VUTBBf+l66y+XoO4J+gKYpJ2hyvh7Z6s4tvHnARX1yi+cjlM3ONF/XP3nnmjI6t5mu
	 g5N0XZnNazZD173sjdSzNh7TqN/mS4YLf5ND0HH0jPUdAKhAetMN/lXDNWpo2nCvO2
	 imkiUhEk9Y2KWgnX9jlUMfFmV8X02P/myirNMQmDuQ/mtNO1UybzcFdWhMJaUKOsrv
	 SfX1u90IBU6IereC0tZ7cRUzZP56feHdH7zv4wWTp51trqHh2L2btEpf7aACJj0KVS
	 M/0pyC68BpZsQ==
Date: Mon, 10 Jun 2024 22:28:36 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 0/5] PolarFire SoC Icicle Reference Design PCIe
 ?support?/fixes
Message-ID: <20240610-numbing-unclothed-4a9dd7492312@spud>
References: <20240610-vertical-frugally-a92a55427dd9@wendy>
 <171804879964.2984749.10332965123533794635.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <171804879964.2984749.10332965123533794635.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_142841_767394_EC5F26FC 
X-CRM114-Status: GOOD (  10.62  )
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
Content-Type: multipart/mixed; boundary="===============7203685592474809058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7203685592474809058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="94+R1nHgD5n4qKYh"
Content-Disposition: inline


--94+R1nHgD5n4qKYh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 01:55:14PM -0600, Rob Herring (Arm) wrote:
> On Mon, 10 Jun 2024 12:09:12 +0100, Conor Dooley wrote:

> > The final patch depends on:
> > https://lore.kernel.org/linux-pci/20240527-slather-backfire-db4605ae7cd=
7@wendy/


>=20
> New warnings running 'make CHECK_DTBS=3Dy microchip/mpfs-icicle-kit.dtb' =
for 20240610-vertical-frugally-a92a55427dd9@wendy:
>=20
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg: =
[[48, 0, 0, 134217728], [0, 1124106240, 0, 8192], [0, 1124114432, 0, 8192]]=
 is too long
> 	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.y=
aml#
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg-n=
ames:1: 'apb' was expected
> 	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.y=
aml#
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg-n=
ames: ['cfg', 'bridge', 'ctrl'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.y=
aml#
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: Uneva=
luated properties are not allowed ('#address-cells', '#interrupt-cells', '#=
size-cells', 'bus-range', 'device_type', 'dma-noncoherent', 'interrupt-cont=
roller', 'interrupt-map', 'interrupt-map-mask', 'interrupt-parent', 'interr=
upts', 'msi-parent', 'reg', 'reg-names' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.y=
aml#

Yah, not a problem. Patches for that are on the pci list atm.

--94+R1nHgD5n4qKYh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmdwBAAKCRB4tDGHoIJi
0oGAAQCbNslQztfURlvjL2v2Hjrh8jVGVClINeW5m5dVQMtPBwD9GkT1g4R31Z6k
eMOjQQdaxvgZKDMPohEKPVXyhhBVrQk=
=eDSI
-----END PGP SIGNATURE-----

--94+R1nHgD5n4qKYh--


--===============7203685592474809058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7203685592474809058==--

