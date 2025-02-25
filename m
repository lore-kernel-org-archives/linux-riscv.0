Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC57C021BB
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 23:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mNNOWrtONm151JeHsvYq75JQ8XcaZJOnLaayZGGfQo=; b=NJsHfBpuVoTRw3nBoWwIqRjbq/
	s1wC7pmn/MPpgwhGzsvYIYaCrkDOFiNyJ9TGOU4kXT7m7MKcycDsQLUxFfVchSIuC3mtqYBJUNsPu
	7AUZIj7kyoM6vfG+L0ijZh1AvJNcF3tW+oD836i55aBAqPSuHuO2rddRwZ+RuZxj2ee8mK+cFMXF0
	Rjh/0/35YwdnfQzbwlvyN3RmO9W+fcs1c9SuHyEKFRboGgRI0YurZwg4G7P0a3MoDsf89ITPOZtSV
	ZCpVQv8oMxhKVV5o2oX3ZEFFxc6S3rUzglWM4H8kYSV51Gip9Mxd7s5CNLms4gjYLInT72YZUh2jo
	W0iYFSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4Sc-00000001o2G-0P3q;
	Tue, 25 Feb 2025 23:35:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4SZ-00000001o1j-09jR
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 23:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3661A5C6403;
	Tue, 25 Feb 2025 23:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1664C4CEDD;
	Tue, 25 Feb 2025 23:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740526529;
	bh=+2NYmz6wq+9xFRZJ3oOmlUmkWUf7V8cF/u0f/KBIynQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BEWgs9l5FkXsNlrogatqzsZ8Z8CJZpLbZyawLLJ5wEV+jIAZtMEkfjsGTI2a50M26
	 DDW7GB5t1tQGmtch9rVgwKTeXsGDMdt1arc33OSMw/sdemiO2IluewJ6p5BMbo3k1n
	 ujgK7SrBaO/elqJnMg1sH6wuMFXLIu+32qfYXVYu5SHO54oMDLmUWcrfvM3uG5Xi7d
	 b1UrUFnQ8SVIn2hsntuBScMhm50qu2/OqZqRT98r6D/0yF4YctnsyunnbpK+zfMzIB
	 CWW3+Vm0YHEbpTFayq6ODjOkMqoU9tC1qnQdl23cM4h1IHmE/wVWyT0begK904lv/2
	 IMPWKYhXpAucw==
Date: Tue, 25 Feb 2025 23:35:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Message-ID: <20250225-lapel-unhappy-9e7978e270e4@spud>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
MIME-Version: 1.0
In-Reply-To: <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_153531_190710_411B0348 
X-CRM114-Status: GOOD (  29.92  )
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
Content-Type: multipart/mixed; boundary="===============7496273245024647144=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7496273245024647144==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q40QP/7e2VWxOAX5"
Content-Disposition: inline


--q40QP/7e2VWxOAX5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 07:48:59AM +0800, Inochi Amaoto wrote:
> On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> > On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > > The pcie controller on the SG2044 is designware based with
> > > > > custom app registers.
> > > > >=20
> > > > > Add binding document for SG2044 PCIe host controller.
> > > > >=20
> > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > ---
> > > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++=
++++++
> > > > >  1 file changed, 125 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,=
sg2044-pcie.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-=
pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..040dabe905e0
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.ya=
ml
> > > > > @@ -0,0 +1,125 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: DesignWare based PCIe Root Complex controller on Sophgo S=
oCs
> > > > > +
> > > > > +maintainers:
> > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > +
> > > > > +description: |+
> > > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synops=
ys DesignWare
> > > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > > +  snps,dw-pcie.yaml.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: sophgo,sg2044-pcie
> > > > > +
> > > > > +  reg:
> > > > > +    items:
> > > > > +      - description: Data Bus Interface (DBI) registers
> > > > > +      - description: iATU registers
> > > > > +      - description: Config registers
> > > > > +      - description: Sophgo designed configuration registers
> > > > > +
> > > > > +  reg-names:
> > > > > +    items:
> > > > > +      - const: dbi
> > > > > +      - const: atu
> > > > > +      - const: config
> > > > > +      - const: app
> > > > > +
> > > > > +  clocks:
> > > > > +    items:
> > > > > +      - description: core clk
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: core
> > > > > +
> > > > > +  dma-coherent: true
> > > >=20
> > > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoh=
erent
> > > > used to indicate systems/devices that are not.
> > >=20
> > > The PCIe is dma coherent, but the SoC itself is marked as
> > > dma-noncoherent.
> >=20
> > By "the SoC itself", do you mean that the bus that this device is on is
> > marked as dma-noncoherent?=20
>=20
> Yeah, I was told only PCIe device on SG2044 is dma coherent.
> The others are not.
>=20
> > IMO, that should not be done if there are devices on it that are cohere=
nt.
> >=20
>=20
> It is OK for me. But I wonder how to handle the non coherent device
> in DT? Just Mark the bus coherent and mark all devices except the
> PCIe device non coherent?

Don't mark the bus anything (default is coherent) and mark the devices.
That said, Is the PCIe controller actually on the same bus as the other
devices? (Not talking about the same DT node, the actual bus in the
device)

--q40QP/7e2VWxOAX5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ75TuwAKCRB4tDGHoIJi
0uQKAPoDnoB9fEauVGg2Fkr7nkk5+Fd1CxrPtMhTqMf8B8++pwEA7ORP3BTeQP9f
c/lqF8KRYkIdwrCZhZJ9jrcCKUo+RQk=
=HkuG
-----END PGP SIGNATURE-----

--q40QP/7e2VWxOAX5--


--===============7496273245024647144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7496273245024647144==--

