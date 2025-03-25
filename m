Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C68C3600B
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Va3b145Fwe1T7n1doasv984vNrSohMCGdr+OAj7eD0=; b=VF9qO+ORxyBQOOGLs08JcvyLPU
	Dcd9jU++m3P/pGVVwfeQ7MGbpz6YOmRLEU9rh2vEJPcvcmCEWmk0B/IpWrXnB9ooIJbj4/8NkD96M
	6+5SH8PSLWC2rUD5CvhTFBdTZkNiqGPTfM88aLqr/r7/FrgBhg57PZDgp6rOQOxddJnsCZEbKTzbI
	eqhZPwQZvBLJWUNPUXmefa3UfukzCqq4+pSmN84xtybNoK4cTRfI2cZtvNedK7LAiRAJZnKxnyeFM
	bk34spKpPVyYAD9E9pq51FVXZUxG8zZjKUHi+fzP73NjXA6EiyFKDtLZ6tKqbba9SGcD/OT+Vvjyd
	4MSDP3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6xC-00000006SC5-3QJ7;
	Tue, 25 Mar 2025 16:16:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6kc-00000006Q8R-00o0
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 16:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0017E5C5B36;
	Tue, 25 Mar 2025 16:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E514C4CEED;
	Tue, 25 Mar 2025 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742918616;
	bh=Uv1XF8v9S9z8FOJgIj6yPF0v787n7/slgtL5peSFUV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFQFl3oUGhZFZYbVJ6KTPzRZPcHuVzGRpvTwThMVO2ZdvvT5w6taPLBd61GiIxpOo
	 KVMELhfKXQuiDcMd9SGOpd88skWUWldK3GwwUDAPexBYEknxs9VNJMEXSNxEh9r2mo
	 1r5FzSqbpH2OP1YVlLTHZA/vhohcW7YACW+z9nWjVY8yoFzOhDMMvn6RFxk0BjOOZN
	 fDf5S5SwrMDBJvogOA+t9XhjuaJEkm9nUJL1AUEx5wtce4g/f8BGOCeTnaEfVLkj05
	 UArXGGPbXIGq4oVKwsAovg31pLmWiQMfqTdOxUZwD8JPlRFC9l2mJWXKtiui89EHX8
	 g4V1KsBRaPXoQ==
Date: Tue, 25 Mar 2025 16:03:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/9] dt-bindings: soc: microchip: document the
 simple-mfd syscon on PolarFire SoC
Message-ID: <20250325-feline-roundworm-dc391b755673@spud>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
 <20250321-ramrod-scabby-a1869f9979b6@spud>
 <20250325-quiet-waxbill-of-realization-675469@krzk-bin>
MIME-Version: 1.0
In-Reply-To: <20250325-quiet-waxbill-of-realization-675469@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_090338_122705_6604800F 
X-CRM114-Status: GOOD (  17.69  )
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
Content-Type: multipart/mixed; boundary="===============0567839324890946422=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0567839324890946422==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RsVPJiZ0GmQKz8rg"
Content-Disposition: inline


--RsVPJiZ0GmQKz8rg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 09:13:22AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Mar 21, 2025 at 05:22:35PM +0000, Conor Dooley wrote:
> > +title: Microchip PolarFire SoC Microprocessor Subsystem (MSS) sysreg r=
egister region
> > +
> > +maintainers:
> > +  - Conor Dooley <conor.dooley@microchip.com>
> > +
> > +description:
> > +  An wide assortment of registers that control elements of the MSS on =
PolarFire
> > +  SoC, including pinmuxing, resets and clocks among others.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: microchip,mpfs-mss-top-sysreg
> > +      - const: syscon
> > +      - const: simple-mfd
>=20
> You need to list the children if you use simple-mfd. Commit msg
> mentioned clock controller, so where is it?

I don't think a child node is required here, there's not enough
clock-related properties for it to require one. However, I think you're
correct about missing properties in a general sense - there should be a
#clock-cells here and a clocks/clock-names too.
The reason there aren't is because the existing driver (that binds to
microchip,mpfs-clkcfg) looks this node up by compatible, and implements
the clock parent for this node etc. Obviously that's not an excuse to
leave the properties out, so I'll add them even though they're going to
end up ignored.

> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#reset-cells':
> > +    description:
> > +      The AHB/AXI peripherals on the PolarFire SoC have reset support,=
 so
> > +      from CLK_ENVM to CLK_CFM. The reset consumer should specify the
> > +      desired peripheral via the clock ID in its "resets" phandle cell.
> > +      See include/dt-bindings/clock/microchip,mpfs-clock.h for the ful=
l list
> > +      of PolarFire clock/reset IDs.
> > +    const: 1
>=20
> Best regards,
> Krzysztof
>=20

--RsVPJiZ0GmQKz8rg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+LT0gAKCRB4tDGHoIJi
0vN+AP4t8YJUz+gmpo9mQKUTUBdHoSDi7e3nBrvIm/mCF/we4wEA1jBDbRKUs6Ny
zoe8o2WcUJLVSpT03NVcKTxFiD46Sw0=
=9sfG
-----END PGP SIGNATURE-----

--RsVPJiZ0GmQKz8rg--


--===============0567839324890946422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0567839324890946422==--

