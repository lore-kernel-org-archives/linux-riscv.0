Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BC5CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+66OqYu7fmUB2RBwB3EAFjUNeFkpEpDffxuDI/xT5Sw=; b=vu5gILfAPZC6e4YQHbImwX6yUi
	B3c2oxPMF/8esHZBteqDPTNJmqQllffyrVSvWCsTUo3XgI0AxBoF89BNq+d7hFaSUt4rLSFnfTJ1h
	VH1m7zf4Y5Bbu4WrTNri30ROZfjhAfHEDAXE1I5PEN2PyBRDj22RKAeNAuubUKs2VZ6Jz8eZXSgEO
	HAZVP5MiE4e5lnKbrHsfQW43Bi46iW+LZoPdJAuV7JGyHH3zGqbecDeWlN6HLLIxf+uUJNVxsXJro
	wADkCqp+l1Mg4xYKjZSBgM5COt1whpeqtiv7pdgXw/HtMogVBJbwGtkWsDmI/ik5bTyWDk0zK1Bzh
	jv8ljjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpXL-0000000GYuO-199v;
	Tue, 28 Oct 2025 19:39:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpXK-0000000GYuC-0MHe
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 19:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B612061191;
	Tue, 28 Oct 2025 19:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0766C4CEE7;
	Tue, 28 Oct 2025 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761680354;
	bh=9IwSPkaTApk9nUXNCx8lCj21HcoG00vqUh5SGTnv6VY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HkmM99fm0NErW/Sex3/ALjDKzpb1M3fXJ+LGMZxbi1qOilDgDhGyDHdUDdl32RrXg
	 MO2nBjY8Vs7ZXumhgXsG4a3EclWX326nMt7qeER9Y6hVmFFOAYWv+K5PfbSxRUHp7c
	 tDyFsFmSkCy8ZacGd6pdREywq7BFGwN64lZoF97PrAKA586IHMv0rJwry/1dQCY1xv
	 ocP/nLXQLL1KeV34fwxPh2JuAzRl8NdjpjUw7+MwE2Vc9kHrXEKFZPVJKAg8L6PI8x
	 3T+pVIj9yYGtZP3CcrkRcMioWBfZaK0dnEQ1NMxxrkjJQNIZ58whD4CD+xSxfyiZxG
	 3u0YZ83+iIrEg==
Date: Tue, 28 Oct 2025 19:39:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, sophgo@lists.linux.dev,
	linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 00/13] riscv: Add initial support for Anlogic DR1V90
Message-ID: <20251028-busybody-disallow-e068b221db6c@spud>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============3845734264956429769=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3845734264956429769==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wZNKDox1XiyOXQLZ"
Content-Disposition: inline


--wZNKDox1XiyOXQLZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thomas, Junhui,

On Tue, Oct 21, 2025 at 05:41:35PM +0800, Junhui Liu wrote:
> This introduces initial support for the Anlogic DR1V90 SoC [1] and the
> Milianke MLKPAI-FS01 [2] board.
>=20
> The DR1V90 is a RISC-V based FPSoC from Anlogic, featuring a Nuclei
> UX900 [3] core as its processing system (PS) and 94,464 LUTs in the
> programmable logic (PL) part. The Milianke MLKPAI-FS01 board is one of
> the first platforms based on this SoC, with UART1 routed to a Type-C
> interface for console access.
>=20
> Tested on the Milianke MLKPAI-FS01 board with both the vendor's OpenSBI
> and the not-yet-upstreamed mainline OpenSBI [4], as well as the vendor=E2=
=80=99s
> U-Boot. Because the vendor=E2=80=99s OpenSBI is loaded at 0x1f300000, we =
have
> to additionally reserve the DRAM region 0x1fe00000=E2=80=930x1fffffff to =
prevent
> overlap if using vendor's OpenSBI.
>=20
> Link: https://www.anlogic.com/product/fpga/saldragon/dr1 [1]
> Link: https://www.milianke.com/product-item-104.html [2]
> Link: https://nucleisys.com/product/900.php [3]
> Link: https://github.com/pigmoral/opensbi/tree/dr1v90 [4]
> ---
> Changes in v3:
> - Update DT binding to use ACLINT instead of CLINT
> - Drop MAINTAINERS patch
> - Rebase on v6.18-rc1
> - Link to v2: https://lore.kernel.org/r/20250922-dr1v90-basic-dt-v2-0-64d=
28500cb37@pigmoral.tech
>=20
> Changes in v2:
> - Add MAINTAINERS entry for the DR1V90 platform
> - Remove the riscv,isa property of cpu and reorder propertyies
> - Fix clint base address in the dtsi
> - Change the memory node to cover the full 512MB RAM in board dts
> - Link to v1: https://lore.kernel.org/r/20250721-dr1v90-basic-dt-v1-0-574=
0c5199c47@pigmoral.tech
>=20
> ---
> Junhui Liu (13):
>       dt-bindings: vendor-prefixes: Add Anlogic, Milianke and Nuclei
>       dt-bindings: riscv: Add Nuclei UX900 compatibles
>       dt-bindings: riscv: Add Anlogic DR1V90
>       dt-bindings: interrupt-controller: Add Anlogic DR1V90 PLIC
>       dt-bindings: interrupt-controller: Add Anlogic DR1V90 ACLINT MSWI
>       dt-bindings: interrupt-controller: Add Anlogic DR1V90 ACLINT SSWI
>       dt-bindings: timer: Add Anlogic DR1V90 ACLINT MTIMER
>       dt-bindings: serial: snps-dw-apb-uart: Add Anlogic DR1V90 uart
>       irqchip/aclint-sswi: Add Nuclei UX900 support

I'm happy enough with this series to grab it, but while I don't mind
taking some trivial binding changes with it, I don't want to take an
irqchip driver patch. Would you be able to apply the irqchip stuff
Thomas?

Cheers,
Conor.

--wZNKDox1XiyOXQLZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQEb2wAKCRB4tDGHoIJi
0rUEAQCPj7JXw7EGtQkw039iQFE+nl3J7cA4D5rsKJQEPAchSwD/XMnR2VIr4JCq
GvQFwIvj1FrbRB8ItSFbTwU6xsU7lAY=
=HzOq
-----END PGP SIGNATURE-----

--wZNKDox1XiyOXQLZ--


--===============3845734264956429769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3845734264956429769==--

