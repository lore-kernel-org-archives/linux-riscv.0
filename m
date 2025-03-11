Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D8C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 18:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7GGQNRANsqbyU0YbSFgsTcF6MLjJOTDCutZIEB9f3Y=; b=EpURrSkRizgSKD5us3cbHjKvvW
	kl2QKU9KWhfQYvMFS0bsU4NkqM4AjheXc07p7k+dkDCGyMsiCdZbiQzQONMUalUkQ0gXOo1T9qVS6
	P7ry5zaIzZoifVxc+SHFKn12ojUFYMzkp7Nv91X2p1/qt7gR/NoPkjsDg/HDHmdUVsAQ6iWYBCMLB
	M4Ls/t4QrdAFcDbxLZ5P/QBVNgOsDcRaHMN2uJJhX18d3eA51F8VD5F3BFaZtz3ivHtAQG9wO75t5
	EnkogISF8XXfDgg/qwHktrJrPoaef+dmyxrUwwpi/LzxnxYqh5HHwzsLJVqzdyr3L2nWtDZzA8T/0
	W9ygypmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4GX-00000006c41-1PJJ;
	Tue, 11 Mar 2025 18:23:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts413-00000006Z3v-1z5a
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 18:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBCE65C1D25;
	Tue, 11 Mar 2025 18:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AADC4CEE9;
	Tue, 11 Mar 2025 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716464;
	bh=/8sCzo09LD1mdUJPxmXKa2i8Cun9j2U4D43IY/3nebk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lV9CbVESi0mwa7NPSqazEt3LCxc+y7/vjXsNQr8IeoWR6WTTWSNoYVpN59cPpas+m
	 UOUZu7MgC4+fHG8LtYnA56KbvlX41H8X02Z1Yy7V269IaHVoVljKyEwFMqPh30d/Ct
	 kR8AGRAMy5NYtzXoc3Ng8HJInukn96ie0NF7uAc46dWYvw5fhvF1MFvvQnhdlOLyqI
	 EfCAjw2FepzyKTH1KNaQSUZNFyRsSTY3EcEvmVr+nXYhsSoLZ6pYAe/3qkl8GuE0E4
	 RS/SIteOeNQqoc+XbDm1r5j5zYZrSfJT8w8vR0KAUCMk8xBs85qP3+oT4rjQmWXKcp
	 XY21ZaGmCmWEA==
Date: Tue, 11 Mar 2025 18:07:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
Message-ID: <20250311-backdrop-porthole-440ae005e8fa@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110745_600067_051D40FC 
X-CRM114-Status: GOOD (  17.01  )
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
Content-Type: multipart/mixed; boundary="===============0570743842084488797=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0570743842084488797==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ccnRVPIec56gG3E1"
Content-Disposition: inline


--ccnRVPIec56gG3E1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 01:04:22PM +0530, Pinkesh Vaghela wrote:
> Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> P550 CPU cluster and the first development board that uses it, the
> SiFive HiFive Premier P550.
>=20
> This patch series adds initial device tree and also adds ESWIN
> architecture support.
>=20
> Boot-tested using intiramfs with Linux 6.14.0-rc2 on HiFive Premier
> P550 board using U-Boot 2024.01 and OpenSBI 1.4.

There's no git tree in your MAINTAINERS entry, nor mention here of what
the story is going to be in terms of sending patches to Arnd. Who is
going to be doing that?

Cheers,
Conor.

> Darshan Prajapati (3):
>   dt-bindings: riscv: Add SiFive P550 CPU compatible
>   dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
>   dt-bindings: timer: Add ESWIN EIC7700 CLINT
>=20
> Min Lin (2):
>   riscv: dts: add initial support for EIC7700 SoC
>   riscv: dts: eswin: add HiFive Premier P550 board device tree
>=20
> Pinkesh Vaghela (2):
>   riscv: Add Kconfig option for ESWIN platforms
>   cache: sifive_ccache: Add ESWIN EIC7700 support
>=20
> Pritesh Patel (3):
>   dt-bindings: vendor-prefixes: add eswin
>   dt-bindings: riscv: Add SiFive HiFive Premier P550 board
>   dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC
>     compatibility
>=20
>  .../bindings/cache/sifive,ccache0.yaml        |  28 +-
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/cpus.yaml       |   1 +
>  .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
>  .../bindings/timer/sifive,clint.yaml          |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   7 +
>  arch/riscv/Kconfig.socs                       |   6 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/eswin/Makefile            |   2 +
>  .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 344 ++++++++++++++++++
>  drivers/cache/sifive_ccache.c                 |   2 +
>  13 files changed, 450 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
>  create mode 100644 arch/riscv/boot/dts/eswin/Makefile
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550=
=2Edts
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi
>=20
> --=20
> 2.25.1
>=20

--ccnRVPIec56gG3E1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9B76QAKCRB4tDGHoIJi
0vQ8AP43Anh9XY0PB4DXa7cODFRPlV0FhokZ8K/uAp2SiIdq3gEA+iI1Mf0iiizD
F/N0vWPXU/KQ4Y5X+2kFV9FcHGFH1Qs=
=RNCF
-----END PGP SIGNATURE-----

--ccnRVPIec56gG3E1--


--===============0570743842084488797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0570743842084488797==--

