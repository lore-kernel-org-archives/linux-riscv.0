Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9628FC5CFEB
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 22:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql3hYKXAAr2U1CHissmh/0YJvcZhEJGM+DYdW6uX95s=; b=YO/3bXyOCwCrk2rhZpqAvbiXYA
	E4uQqaG7VOOy5ePTA3vqpf4AphfEKaorDBHtvKRIx8GmPyYioWi44337bLlRnctFGngzv3BQY6EQG
	czruhMourFCOwL+oH89w11uX+Tr38XoIUnplLJhRHeE/zaGB8mWpEQ6ryewKp0nZ1sT5FXvxl73Z0
	8S4YhgkRyFu1QqRQZF7soikEgbueVvmNKKmoMFTar97LO1Slz9EF9gbwARzYPc0PyvrD2dqAb3QdS
	cQQQyyV8uInVs28lHEXRyJ/9LVUz+m6a0GO5Onh+X92jCwv5oRxZ+aRV/KeUio/IyFSSTJ/oetZkH
	1wvfAw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtZ08-0000000Fezo-1u3B;
	Fri, 20 Feb 2026 22:29:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtZ07-0000000FezZ-1fap
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 22:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D25EE60123;
	Fri, 20 Feb 2026 22:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341BBC116C6;
	Fri, 20 Feb 2026 22:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771626540;
	bh=11otB+0C7jYVhaDxWBeram0e1X5fMU/f0Ln1ESpvEjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3h/4uFOa/J5BG0X4/6yM6a07SKXwLgiBv+QCvuuyf2FmME4xpAKnWETPBeSX/xed
	 UrSmCDomq8BlunEIKGC+u3se+LW/r9nxhn9ivo4onmKVsa5D9rO3QgBa0ixs0+7qdJ
	 XKwz382H/4jfyu3ojeABxVz6NKAQ+wXWUfdixU99s64YWJVn4YPqUp3sJ8pWjOQStI
	 n+9gmFJLQE070EdcdUR7Cvdwpl0kLgZ1kUAIwRFUnA2pwjwxXCspPWiXYP8KynT5SG
	 hwOxgyRsL5+MWR4N8IsD/t8R+d+R/LijnQDWuKKQ6hzivoKgxBiAlRKuuSdQxA9KYr
	 xHojA/+IIQ1HA==
Date: Fri, 20 Feb 2026 22:28:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Max Hsu <max.hsu@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Green Wan <green.wan@sifive.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Debbelt <palmer@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: dma: sifive,fu540-c000-pdma: add fu740
 support
Message-ID: <20260220-gonad-plutonium-60e1baddecec@spud>
References: <20260221-pdma-v1-0-838d929c2326@sifive.com>
 <20260221-pdma-v1-4-838d929c2326@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20260221-pdma-v1-4-838d929c2326@sifive.com>
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
Content-Type: multipart/mixed; boundary="===============2411147909744912250=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2411147909744912250==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4diucl4xuCXo0x14"
Content-Disposition: inline


--4diucl4xuCXo0x14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 03:43:56AM +0800, Max Hsu wrote:
> Add "sifive,fu740-c000-pdma" compatible string.
>=20
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma=
=2Eyaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> index 609e38901434..b6c49060bc6f 100644
> --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -36,6 +36,7 @@ properties:
>            - enum:
>                - microchip,mpfs-pdma
>                - sifive,fu540-c000-pdma
> +              - sifive,fu740-c000-pdma

Based on the driver change and related discussion, I'm not sure that
this is the correct change to make.
This shouldn't be applied til the discussion on the driver is figured
out.

Cheers,
Conor.
pw-bot: not-applicable

>            - const: sifive,pdma0
>      description:
>        Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
>=20
> --=20
> 2.43.0
>=20

--4diucl4xuCXo0x14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZjgJgAKCRB4tDGHoIJi
0sF9AP46m1QKgFzFZtWRE8BffzPh9vx1iQM4ymKZBIOR3oErdQD/QJsiq/QotQMJ
wEpnHgIGg5SaNrX+xWsBYxthqnvQ9gE=
=Ni+J
-----END PGP SIGNATURE-----

--4diucl4xuCXo0x14--


--===============2411147909744912250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2411147909744912250==--

