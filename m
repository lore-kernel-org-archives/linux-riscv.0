Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF740C7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvlpl5aX8oq/juhgBf0ypiFYTSFIbOzjvIdlorFVg2c=; b=0y0HlUjl0yuXtVFIUP/wxHQ4xo
	jN3/kE+qg//JTBhNfU2sWzX9UEb6IgEtLXr7Rtujx26QF1yJIB/GsbpE4KItQEv1zTf0Rq9UlGYNj
	GwWRl1IfiXatCtFhF0F13sOUprZvXpVqscwPitPrjQdKrUzdNEKaB0GAWpm7mH3LclXVZfdF2L9Vq
	X+jmPQ+U4P6s1e9OomPJC3X2b4Dpr0jJiBr/yuwg42E2V78WbVHwvyvIiGhQpqPBmcCSkwgT/d11J
	l3bHKOivdfvtw4+fQjEU/ZDTuq8f17dn2Wqjb7vDGVQtcvInDRXavLJtM21MIt8bboMq90+YyXgAf
	lY3i+Mzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUS2-008GzU-06;
	Thu, 06 Apr 2023 18:35:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkURz-008Gyo-0M
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 18:35:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 453FD60F38;
	Thu,  6 Apr 2023 18:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14497C433D2;
	Thu,  6 Apr 2023 18:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680806109;
	bh=IVpmg/9zjCkonOv9tBAoQgo1Lp6wBXA3GJcvRZ34LWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpHrTPTEWANN+WTgkrZU/vS8IG9oFKJ/VaNRJC1jqFweHi5tY9N0r8+/FxxNuwvPg
	 x/eDNMHq3jZEq/5WHV/Fwh5AXtGO7dI53Q5oMY3t98DRFehD1ssJsdSvjGBf7bvUJv
	 RaF/jTEjYybYb2TpRLVMXNWQxTsbi6ph7ArSaeWphRJPLJlw/vbAQeiNNdBHTTgJOc
	 joF+9MSK+6S0vVSfiFoOhM6ouqOv1+UktHwja2TLkfIEwxGqabDIKDdlC1fEMJNff1
	 IMBHbXa3ED/0khfcACoO5tXIu6NWO9KiZMkKuFBkPp1r1rIoMncz2QH5rNjIjeXZj7
	 paFbim0CZlyog==
Date: Thu, 6 Apr 2023 19:35:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Minda Chen <minda.chen@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 1/3] dt-binding: pci: add JH7110 PCIe dt-binding
 documents.
Message-ID: <20230406-revisit-patchy-a0063d964070@spud>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
 <20230406111142.74410-2-minda.chen@starfivetech.com>
 <38bc48bf-7d8c-8ddd-861f-3b7f3d2edce6@linaro.org>
MIME-Version: 1.0
In-Reply-To: <38bc48bf-7d8c-8ddd-861f-3b7f3d2edce6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_113511_229839_79343E4F 
X-CRM114-Status: GOOD (  13.34  )
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
Content-Type: multipart/mixed; boundary="===============2557044359412236583=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2557044359412236583==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8c3Cr3rYhW4crgm2"
Content-Disposition: inline


--8c3Cr3rYhW4crgm2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 08:24:55PM +0200, Krzysztof Kozlowski wrote:
> On 06/04/2023 13:11, Minda Chen wrote:
> > +
> > +  interrupt-controller:
> > +    type: object
> > +    properties:
> > +      '#address-cells':
> > +        const: 0
> > +
> > +      '#interrupt-cells':
> > +        const: 1
> > +
> > +      interrupt-controller: true
> > +
> > +    required:
> > +      - '#address-cells'
> > +      - '#interrupt-cells'
> > +      - interrupt-controller
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - reg
> > +  - reg-names
> > +  - "#interrupt-cells"
>=20
> Keep consistent quotes - either ' or "
>=20
> Are you sure this is correct? You have interrupt controller as child node.

I know existing stuff in-tree is far from a guarantee that it'll be
right, but this does at least follow what we've got for PolarFire SoC:
Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml

Both PLDA and both RISC-V w/ a PLIC as the interrupt controller, so in
similar waters.
This note existed in the original text form binding of the Microchip
PCI controller:
| +NOTE:
| +The core provides a single interrupt for both INTx/MSI messages. So,
| +create an interrupt controller node to support 'interrupt-map' DT
| +functionality.  The driver will create an IRQ domain for this map, decode
| +the four INTx interrupts in ISR and route them to this domain.

Given the similarities, I figure the same requirement applies here too.
Minda?

Cheers,
Conor.

--8c3Cr3rYhW4crgm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC8Q1wAKCRB4tDGHoIJi
0uVVAQDHgZupjjAEUR9lEnrmhcHf4bOLxjmLHOA7N0MNdc+M0gD+PTj3m9Z4X5bX
gloCfnCtJczlVceBZUYlixYiqd/8pQA=
=LjRe
-----END PGP SIGNATURE-----

--8c3Cr3rYhW4crgm2--


--===============2557044359412236583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2557044359412236583==--

