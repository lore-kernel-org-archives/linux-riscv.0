Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E4FEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV5HCI+wPr2MZ7w8J1KBr/Pfj1ih6N403/lCN4sgZbo=; b=C4U9ZQ1VkVQ3Z74SYW6DoSx65W
	33iZ13LHa7SNWX/jO3fRZehGSyCR4N4NBcg4cFqgs+Z/fT2OCxXQu4j/RjcvC0C0qKn9LyE5Y0xa0
	eP52OzC0x4j7U3ydjtxrhvnuieXsej8stmhwA2uDsOPHBNZjNvVh0sNXPWdNXKaskmUYSFHKjSff7
	n3gSRT4a4bSlVvrLFYavvPCQRJZImtPulu1Rah+SLJ1eAxvGNRRfoG1DQ8AU292xbCyOev+nCWoTt
	wXAIRQjr5/l9bV0dOXClxWdiFwXpY4hX8fONDxooWDg527VX3BZ8BOWynE0j/f6Ke/XEBUEGENQD+
	rTGqSrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0vs-005sMs-0W;
	Wed, 19 Jul 2023 06:45:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0vp-005sKb-0W
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zdvmDJMdEm8WfkZrLoyzdPxOO3h3hbh7c/bASlq5Y0s=; b=hDKCDRo+bLFDj74rCywAUN9ATp
	qSU9+M+uT+WnxOW6gKF/MGgmv5VfY6yp5+NrV33QSzg5Gk0Osy2zFH+Apm+/2Q7a9515MW4wAp34a
	cpTXer1y85dZusQpQXLGvuNCIyYb00zyW98yEJUyz5w8+5OoD4Uu6OgkIm/WfCpgLn8IQ4xB3rOeC
	gD2FopASCP/KbU/8kgMtLXiULH0aqG2wegxdAlCpwovVWxiUwSuaTTHlwB0SWB7qu8D4tcfH6vrSU
	dpPWVUaX5In+ylHPb1HaB8sHwMQ5s+ESfvfOqdYPn2Hg+Ib3+WTrAFlTz6UtIdr9i+oDJU8bw9ky1
	uA3PxSjA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLlMy-00BcvE-2S
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 14:08:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01FE5615EB;
	Tue, 18 Jul 2023 14:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844BAC433C8;
	Tue, 18 Jul 2023 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689689250;
	bh=zdvmDJMdEm8WfkZrLoyzdPxOO3h3hbh7c/bASlq5Y0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECdEFnsdpYuqfFYfyDj13RVp1fS9AiFX+NJ+aKviNzYKxgZsfaJ/f8uYzbNsswrFi
	 qfIMWA+zocXwtruNYUrPCMRMIyOu2qCufekSXXC5AcpRsIu7XiNHQ6RsKi7ZOxYByi
	 fAt7la3qt5ZuBWI85cNZTzpSFW47N4BrxhB+7L1J+a2EoDY6Kj7UVFv30jf+yO6Tb+
	 YPHgqoyzw9IvdjCf1tWcuf6KFvUtXiJ4gLABRsNmH5VEx66jJBZ/EkWARD3umnPezs
	 YHRKPF0mbxAm6kCm9H8nYKu/APzu2cVnlD2e5157RtfBZF2fphFiNzeGYfpAPwfk8J
	 z3j+L/YfECIJA==
Date: Tue, 18 Jul 2023 15:07:25 +0100
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
Message-ID: <c53a6193-0417-4e01-9226-9c0557a497d6@sirena.org.uk>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-3-william.qiu@starfivetech.com>
 <c5ad1e1c-58f4-4833-b9c7-8876c1a0dc27@sirena.org.uk>
 <e3fd0d3f-3fe4-2e23-2548-ecbd487e9c9f@linaro.org>
 <20230713145724.GA3975811-robh@kernel.org>
 <df9de3d8-09da-2b80-b2b4-626cd92fe971@starfivetech.com>
 <9891a7e3-0fce-4d05-8ead-3c0ed155d725@sirena.org.uk>
 <6c53310c-1dc0-6623-369b-1a73fc8f63a5@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <6c53310c-1dc0-6623-369b-1a73fc8f63a5@starfivetech.com>
X-Cookie: Nothing happens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_150805_472356_6B80A42D 
X-CRM114-Status: GOOD (  15.89  )
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
Content-Type: multipart/mixed; boundary="===============4647553988148612040=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4647553988148612040==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fiXkAa88DxIXZCAv"
Content-Disposition: inline


--fiXkAa88DxIXZCAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 02:06:01PM +0800, William Qiu wrote:
> On 2023/7/14 19:52, Mark Brown wrote:
> > On Fri, Jul 14, 2023 at 03:14:59PM +0800, William Qiu wrote:

> >> After communicating with colleagues in SoC FE, I learned that PCLK and
> >> SSPCLK were homologous on JH7110. He said that SSPCLK would divide the
> >> frequency internally anyway, and there was no need for external part frequency,
> >> so he directly gave them together.

> >> So, should I call this clock ssp_apb or keep it SSPCLK?

> > I'd expect this to be handled in the DTS for the SoC - connect both
> > clocks the binding requires to whatever the upstream clock is, it's not
> > clear to me that any binding change is required.

> You mean binding two clocks, with the same clock source? Then there is no
> need to modify YAML.

Yes, exactly.

--fiXkAa88DxIXZCAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS2nJwACgkQJNaLcl1U
h9CWiAf/bC0fx/Sgnty2fRf6b2sm8C4OURlZf4h7LOlPJeWfWc6+jOhKAfeYMInw
oA/ZlTHv1V5S/rfmU9JoCFJIGwrX/wAXQ9s6jvpqMNtzDoHQi14kny4rUg6GDfjM
CTf19IbvX1ff+Q2DfvoHmtZNt/wn3oLbfIDujesSqVhvKSR5qrsVRbiraZmmgXOK
vb2Jt0rFL30Sy8ICP0PomsbMFkVLvPOx808QsBOWSzd/Jvow/EHNv1HbE+GOXRSL
FhlcXHO9OrJs3YPKRGnS8FfblaO1zTNCdS9pKZXJRidvjEhlFyDUOEDtbR0D3jJ9
APJkPHVoQfR/eAstxEx64ohiOnY5yQ==
=RmWn
-----END PGP SIGNATURE-----

--fiXkAa88DxIXZCAv--


--===============4647553988148612040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4647553988148612040==--

