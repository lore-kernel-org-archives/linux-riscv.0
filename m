Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60168EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 11:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2U4i0RWVQh2cVI7I0O/RM9xkPuxgT7sulfg8Q8cn8s=; b=bJOGLt2hSdLwPXioiFmy4+yCPF
	rnAB8xGQ8RcpMspiKbaIjt5ruhgxDZhqSzfHPfBBJHCCVowMZQ1PAOKMAxiff4eEJnpm7yR5rMBQe
	tG+kyI6dCInQo1zSUkVhw56WsOv0Io05TVIE0dvVHxzHK4gdSy2/LhvpKbF3VEfo3EnXhlDwqYVYa
	sl3NCUYNO9tCdT6W4oFudDHB6AkYpSh6Gt75xS7puZQgeBSwuf8OPsfFDY3RXAxve80RtHzJdJyug
	v3xkzwq2IMX9Ye3zjOgcgVb/XQYvyFK43WLClsXYstOdcRN/Z/MKiSx1evSm1UbAP6IwlZHwN106G
	gu4tEhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKHLK-006803-1w;
	Fri, 14 Jul 2023 11:52:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKHLH-0067zG-2Q
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 11:52:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A818E61D0F;
	Fri, 14 Jul 2023 11:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A81EC433C8;
	Fri, 14 Jul 2023 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689335530;
	bh=DmeN79exEsvAJkYJDMMvtjBsg+ueHrWKD/Uu8Yhd95s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFgr2mIbpn5LNqHS9h3NzsCoyBKi3V2KXEm12VaSFzsIAt/Ou+NJQaiJDjs5qJGNj
	 qD3XdXf3qAflXE6sVsXlVfbCVQoJf2N/fMyyM3oKy5EVlC9+bMcMnEVUcsJYelbk0R
	 TcDR3gTCvxKdaC4oeXurBvlb3DCosJKfgSSW0M6vyJNO+9ZAVCPxStVKFHpnGLumJG
	 JdaVa4AVGlF8AXCs1TjqoJOGbeDmfTjEKPw6/Vod1glWLKb13LWtxAlLP09uWoJ+Rn
	 Dtj7SAvA0tJq9OFY6FX7xexEI+g0gKFLh4PirN/RNhi765CFK223rdSxLo8B1g1NOG
	 PRVe4do9xGLHw==
Date: Fri, 14 Jul 2023 12:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: spi: constrain minItems of clocks
 and clock-names
Message-ID: <9891a7e3-0fce-4d05-8ead-3c0ed155d725@sirena.org.uk>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-3-william.qiu@starfivetech.com>
 <c5ad1e1c-58f4-4833-b9c7-8876c1a0dc27@sirena.org.uk>
 <e3fd0d3f-3fe4-2e23-2548-ecbd487e9c9f@linaro.org>
 <20230713145724.GA3975811-robh@kernel.org>
 <df9de3d8-09da-2b80-b2b4-626cd92fe971@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <df9de3d8-09da-2b80-b2b4-626cd92fe971@starfivetech.com>
X-Cookie: Preserve the old, but know the new.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_045211_832288_B54D997A 
X-CRM114-Status: GOOD (  14.48  )
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
Content-Type: multipart/mixed; boundary="===============8240727132850829286=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8240727132850829286==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="klm57L7u8qYMNEjf"
Content-Disposition: inline


--klm57L7u8qYMNEjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 03:14:59PM +0800, William Qiu wrote:
> On 2023/7/13 22:57, Rob Herring wrote:

> > I suspect that PCLK and SSPCLK are tied to the same clock source. There=
=20
> > must be an SSPCLK because that is the one used to clock the SPI bus and=
=20
> > we need to know the frequency of it.

> After communicating with colleagues in SoC FE, I learned that PCLK and
> SSPCLK were homologous on JH7110. He said that SSPCLK would divide the
> frequency internally anyway, and there was no need for external part freq=
uency,
> so he directly gave them together.

> So, should I call this clock ssp_apb or keep it SSPCLK?

I'd expect this to be handled in the DTS for the SoC - connect both
clocks the binding requires to whatever the upstream clock is, it's not
clear to me that any binding change is required.

--klm57L7u8qYMNEjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSxNuQACgkQJNaLcl1U
h9BFZgf9HdG+QzvFSo2OFGvw81HEFNCptH1B6hNOBEplLpmTioP2hTn7SE22nAoP
M8yy78/dMrerUMSs8l8nTWX2MvtyEhMPWrYi3vUyQhzDz1vPAj2ao4V/5zBD2P/s
xQ00phl+51kJqZ+YX5WXydz9G5EP+usoFq2i2R9ZNPgCm9Y9txRr3+CVOXQOBixW
dOFZYO+/6jfEoEOZyL1Ine5ggi4tD5Q9Q8zLMhS47XKv3me71twVFVxatUate6Cu
gg8tpmFVCiR63fSnrgbRunZjF7R2Ogfg3M7Pg5AUSiJjbMMPAnTKcZrIRM9q11sg
hZ+IpYQkDLUbk5g9cJlhw+cy1Y2egw==
=1P4J
-----END PGP SIGNATURE-----

--klm57L7u8qYMNEjf--


--===============8240727132850829286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8240727132850829286==--

