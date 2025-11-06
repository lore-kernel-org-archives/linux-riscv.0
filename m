Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709C3CCFA05
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 17:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7ik+juE93ewRiPJI181QdpTB9bkaHYlWNulHj+Hqfc=; b=ILmpCRz6jsBHN5X1vbKxMxfHh4
	nOgAQ5WKYbNqbtbcq/tY1stVKIyXtL2bzJufb8cyL1ySWYS+Afr0LW6WS4BCTXyXJdQGwtBjfH+UL
	lx3BgpT6MVQhR6kHyNlMnph0EbBRpl9akEeYJ6v+75ODfERZt/uAD2IL6l32Tbd4cGsQpze22ZizB
	XJlr2s6PRiR2breB+0e+vLS6vlrmAChO9qvrka/LjPo75cX8yjR5NqC3cCvkN1vnXuWMSNHT7G4oU
	LgQ0Ba9t8jW29I5VYdeAo4qKm564FT0ALSthg8jyCJ/CLOMVuVmgZf339g7ZT8XnXHaQ7JUkvgQv7
	syYVAbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3Vg-0000000Fzhq-0RiG;
	Thu, 06 Nov 2025 17:10:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3VW-0000000FzhL-2juH
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 17:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1228943F73;
	Thu,  6 Nov 2025 17:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A649C4CEF7;
	Thu,  6 Nov 2025 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762449045;
	bh=5RJd2yoe7u43AeupxdyVCQ4K/Vt3gB+8I1S4CehziNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lkBZ2i+/mwOOuX9GhGdECytYLR4ZoDkJl849J2hQtO1L+/oDFNXYCeNt174ancQT3
	 xbCnN9sPThUf3r7wQHPF8iYrx9QE8ByQfGeeXHSpXSc7X1ozl146yDIHzIyhN477Zl
	 24roSdsWpljUoU1b1XPiOx3tQ9nNpNF0qwmsuiok+l3p312VCp83G1KCMDxzYj3j4R
	 V6CN2ulyVc4L6VZFinUoMZZKTE8+9ekl/LsZXnN1C4wR4qq87Iee247p9DqgX4zpQx
	 Mdo/2h36rXZ5gLXNVAuKxGQMnTO8WdbmjhK4ji+z1/V5GYGE6HlP6rgt50139EhDg6
	 7lEF3XunOSRJA==
Date: Thu, 6 Nov 2025 17:10:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>, tglx@linutronix.de
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
Message-ID: <20251106-tinfoil-primer-30ff181203f4@spud>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
 <20251028-busybody-disallow-e068b221db6c@spud>
MIME-Version: 1.0
In-Reply-To: <20251028-busybody-disallow-e068b221db6c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_091046_731684_1DB92EF8 
X-CRM114-Status: GOOD (  23.66  )
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
Content-Type: multipart/mixed; boundary="===============8026158200459850204=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8026158200459850204==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RxsOAUIaAk6EjGuV"
Content-Disposition: inline


--RxsOAUIaAk6EjGuV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thomas,

On Tue, Oct 28, 2025 at 07:39:07PM +0000, Conor Dooley wrote:
> Thomas, Junhui,
>=20
> On Tue, Oct 21, 2025 at 05:41:35PM +0800, Junhui Liu wrote:
> > This introduces initial support for the Anlogic DR1V90 SoC [1] and the
> > Milianke MLKPAI-FS01 [2] board.
> >=20
> > The DR1V90 is a RISC-V based FPSoC from Anlogic, featuring a Nuclei
> > UX900 [3] core as its processing system (PS) and 94,464 LUTs in the
> > programmable logic (PL) part. The Milianke MLKPAI-FS01 board is one of
> > the first platforms based on this SoC, with UART1 routed to a Type-C
> > interface for console access.
> >=20
> > Tested on the Milianke MLKPAI-FS01 board with both the vendor's OpenSBI
> > and the not-yet-upstreamed mainline OpenSBI [4], as well as the vendor=
=E2=80=99s
> > U-Boot. Because the vendor=E2=80=99s OpenSBI is loaded at 0x1f300000, w=
e have
> > to additionally reserve the DRAM region 0x1fe00000=E2=80=930x1fffffff t=
o prevent
> > overlap if using vendor's OpenSBI.
> >=20
> > Link: https://www.anlogic.com/product/fpga/saldragon/dr1 [1]
> > Link: https://www.milianke.com/product-item-104.html [2]
> > Link: https://nucleisys.com/product/900.php [3]
> > Link: https://github.com/pigmoral/opensbi/tree/dr1v90 [4]
> > ---
> > Changes in v3:
> > - Update DT binding to use ACLINT instead of CLINT
> > - Drop MAINTAINERS patch
> > - Rebase on v6.18-rc1
> > - Link to v2: https://lore.kernel.org/r/20250922-dr1v90-basic-dt-v2-0-6=
4d28500cb37@pigmoral.tech
> >=20
> > Changes in v2:
> > - Add MAINTAINERS entry for the DR1V90 platform
> > - Remove the riscv,isa property of cpu and reorder propertyies
> > - Fix clint base address in the dtsi
> > - Change the memory node to cover the full 512MB RAM in board dts
> > - Link to v1: https://lore.kernel.org/r/20250721-dr1v90-basic-dt-v1-0-5=
740c5199c47@pigmoral.tech
> >=20
> > ---
> > Junhui Liu (13):
> >       dt-bindings: vendor-prefixes: Add Anlogic, Milianke and Nuclei
> >       dt-bindings: riscv: Add Nuclei UX900 compatibles
> >       dt-bindings: riscv: Add Anlogic DR1V90
> >       dt-bindings: interrupt-controller: Add Anlogic DR1V90 PLIC
> >       dt-bindings: interrupt-controller: Add Anlogic DR1V90 ACLINT MSWI
> >       dt-bindings: interrupt-controller: Add Anlogic DR1V90 ACLINT SSWI
> >       dt-bindings: timer: Add Anlogic DR1V90 ACLINT MTIMER
> >       dt-bindings: serial: snps-dw-apb-uart: Add Anlogic DR1V90 uart
> >       irqchip/aclint-sswi: Add Nuclei UX900 support
>=20
> I'm happy enough with this series to grab it, but while I don't mind
> taking some trivial binding changes with it, I don't want to take an
> irqchip driver patch. Would you be able to apply the irqchip stuff
> Thomas?


Could you pick up 4-6 and 9 here please?

--RxsOAUIaAk6EjGuV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzWjgAKCRB4tDGHoIJi
0pjLAP4i3LKjrcugZ1SHa8IN8d1ahJjzKig/a42m3C3BLhx/6AD8CjGNPrqdnGjb
X9OAq+b6bdQXfUDl2Y1epPRbb3x1AwE=
=g1P8
-----END PGP SIGNATURE-----

--RxsOAUIaAk6EjGuV--


--===============8026158200459850204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8026158200459850204==--

