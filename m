Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58127C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rn/6arjMH8OMr/Qj+2yh5sbvYardzEz6+JEDk/qjL94=; b=0ZXhfOAP2PlwOxoDqt/PqilX39
	14v6LYi7iMyBtcfpC6ciAIPG/gUTnjOCmosGndYtKblJ6FrcJDSM2eHHM6MTATZ7UVVakuTOwDfaL
	TfGctEt+cNZ8gwLeysaP8R3/6PSsm0PueFhOGmFCCKXVd4F5TSJm8+xTGXYzMZeQ/Znma/aFyIiEN
	P1afRVj2ngMCXPkAnDB+n+EvAqf7TrRUt2QA1wPkyKsIdYtJtLxLSHHFtkU5667XaV4ytSIwEpYo1
	XksQroYvwnVHS15Aw4V/GqTvAi0kGJxWhKGmmkhDkcspinU06C2bmjSbrdDWs8DM7A9gylcKRp8G2
	NocBPLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzZA-00000001IFR-2cPf;
	Thu, 25 Jul 2024 14:35:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzZ9-00000001IF1-07ON
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jul 2024 14:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iMTcFDDXR5qTwo7QlDm6DG2DqRdahrxKM9Mlv6MhYmw=; b=kN0ULohgKAgcXSYkvbU1QZsW+L
	FBjlPZxgr7xflWMsK1y2iwvHLoTIfoKs5npd85/ONFpyNpe9YctfpAoUqVo6+zazCeVGXMCT1Bf0M
	2+w9Liznc7JSf0wA24WABtf/4+JxDBkxMtkSqLfuYjxhG2qzb7BoH8HUKVohHzIfiFrDppNJT0KRs
	01ShxV2l5l51gvsZlQ9FIKlYARcxOuChGegMQezKCa+EbL6aHCEwAt7bJt97YZtjqtGY0iYdFeWjK
	2YYXesE4uu7IifHBNj0b5X1oGsCCJzyjbaKhy0CO9rKwfDSqQqgWQlymA0gqhsHO/5UgHiD5NqXXf
	UlcvegrQ==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzZ5-000000042R1-0v7g
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 14:35:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE18ECE0FAE;
	Thu, 25 Jul 2024 14:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6D9C32782;
	Thu, 25 Jul 2024 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721918126;
	bh=dWHk/SHpnPTKCLsDctksze4Kfo/ASX42EotFciliEv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hoZZuPm3i0aH3yLncV6e7FXvyD9dOK0856uFSu9h35JDDJ7jdWL7E/VKnuTpU9Wfr
	 UHL+O88SASJ4OvrzVMx1G35NtbFmbBx8svvT6Fu/tc1dlrZdf8F46rLf2JjWvalXT/
	 qwqo0jHvGvzMmWpH/0ooLxBF4W8NArOA/S9hcraQMSK1VX9CaAGzBtDPy3y/Cak2xP
	 xmbp3nH4YEy95AUz/yi6bhwmVJIcGGabMYi9ou/IXmfXfqPTPlHeGRdHDHXV64NpiP
	 /2j9tqIjDGzUKbYcrkNQOr/eY1iCWWOGYLINx51Po9ekkoIO+3erQ3bslr3OuM2pnW
	 iwR4dqhvMv4qQ==
Date: Thu, 25 Jul 2024 15:35:22 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/17] riscv: dts: microchip: add PIC64GX Curiosity Kit
 dts
Message-ID: <20240725-taco-jailbreak-6630da00cda4@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-18-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240725121609.13101-18-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_153531_736575_63B3057B 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Type: multipart/mixed; boundary="===============7186389056405121962=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7186389056405121962==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yPwJHk3tpKNwQYbJ"
Content-Disposition: inline


--yPwJHk3tpKNwQYbJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:16:09PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> The Curiosity-GX10000 (PIC64GX SoC Curiosity Kit) is a compact SoC
> prototyping board featuring a Microchip PIC64GX SoC
> PIC64GC-1000. Features include:
> - 1 GB DDR4 SDRAM
> - Gigabit Ethernet
> - microSD-card slot
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/Makefile        |   1 +
>  .../dts/microchip/pic64gx-curiosity-kit.dts   | 114 ++++
>  arch/riscv/boot/dts/microchip/pic64gx.dtsi    | 616 ++++++++++++++++++
>  3 files changed, 731 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.d=
ts
>  create mode 100644 arch/riscv/boot/dts/microchip/pic64gx.dtsi
>=20
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts=
/microchip/Makefile
> index e177815bf1a2..78ba2952a164 100644
> --- a/arch/riscv/boot/dts/microchip/Makefile
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) +=3D mpfs-m100pfse=
vp.dtb
>  dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) +=3D mpfs-polarberry.dtb
>  dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) +=3D mpfs-sev-kit.dtb
>  dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) +=3D mpfs-tysom-m.dtb
> +dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) +=3D pic64gx-curiosity-kit.dtb

s/MICROCHIP_// please. And a patch renaming the others would be neat too
;)

--yPwJHk3tpKNwQYbJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJiqgAKCRB4tDGHoIJi
0pNIAQDsNaXHT+ww+2ANltZ46PqzzFdkcKcI6MA0PVMYZzWjnQD8DY1vvjdvMqQf
W3/o/h02Wbut5DXZqtSm+FHFS7ISLgI=
=ZQmA
-----END PGP SIGNATURE-----

--yPwJHk3tpKNwQYbJ--


--===============7186389056405121962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7186389056405121962==--

