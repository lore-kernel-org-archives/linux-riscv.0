Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57876EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apKW49W8qVBVwEGnjRWKmw6DIDnMO8cfwUcjr+Q0W38=; b=M8sd4C72PsvueEdd4FWepEZ6aD
	Whq6Iir6dVIhF3ji04bb1Q3krQrzN+gAMSlj4SErOmLc+Zk8ivm8bWjs+eKZzaTprl1C5ORGtzGQv
	64pc+wjw1D598PXp2P8F+LXvXQ/OndkdXrCZC/Tr/5TO3B21IL9Jui0fFfOUPi17LbDhuuUgGABgr
	tFE3Z0YE+Myx5ymGzoFgMjocCZd5Rq7ka60N2oBLTrTqcIPDpj1BPBenU/DSMeNsWmqFRpLEguGDv
	tM5Q4b5WKpP3w/GEjdpm2DinM1q991FSfqT9YNsK9bdVdHnc/XE9J7ju5bvm/2ZCPktAeHZSW/4XL
	HlgY0deg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj5Z-00Dqgm-0q;
	Tue, 04 Jul 2023 16:41:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj5V-00DqfD-1i
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:41:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AF7A612FE;
	Tue,  4 Jul 2023 16:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E826C433C7;
	Tue,  4 Jul 2023 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688488872;
	bh=uZGcW+BNNYPiMMqm5ClacCxmoqVyCYuJ9CXWf3fmoAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sSg/a38ehv1r51sCngNXAKyvtYUXf7mwmLlZAFHvmK403Rd1HupZMxojj1RSFPkWd
	 LpJhHeXARr+R1+9T4HCQXk3/BCFimstSWzVrFhbnQlq3FsP/Fe9kIdTgxHRmaU/Zqc
	 M5ppjPkzdtfwNxKsT5jFh1H6x34hC+/VWKJccJXfbkAxX5pbvVZvxfJ/malAtvbD9e
	 eR69KV2qo7YYmyy4Lwz7nqbEkuFmPQpAjFK41cFQgG99zUVvo92mNHTfnHfj4qO2xP
	 OFubV6WVMtVyEjI7RZpq4t1Oca/bp4Rr+ajPEWKdE6HX6Hl0iNfwnSDoxVUR1H9GpR
	 S6G9q4b8aqCxg==
Date: Tue, 4 Jul 2023 17:41:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	William Qiu <william.qiu@starfivetech.com>,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND v1 2/2] riscv: dts: starfive: Add spi node for JH7110 SoC
Message-ID: <20230704-commute-grape-38ded99556d5@spud>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-3-william.qiu@starfivetech.com>
 <7f3b600d-d315-22d6-b987-eabfe1b04fdf@linaro.org>
 <eba1e868-6371-42fe-91be-bcbee54d1aff@sirena.org.uk>
 <4afd90d9-f1bd-f40d-1c79-50fef1406ab7@linaro.org>
 <6307c5b2-64d2-405f-b1a5-696d4184f6a0@sirena.org.uk>
 <a8c1a5e7-9938-bf6c-6bb7-6c1e4d8ce08b@linaro.org>
 <41c905da-ae3e-4acb-bbfa-d33d3306824d@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <41c905da-ae3e-4acb-bbfa-d33d3306824d@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_094113_652602_EAFED59D 
X-CRM114-Status: GOOD (  18.67  )
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
Content-Type: multipart/mixed; boundary="===============3869117449129654037=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3869117449129654037==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DKLfejsgq4GdSLTL"
Content-Disposition: inline


--DKLfejsgq4GdSLTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 03:13:17PM +0100, Mark Brown wrote:
> On Tue, Jul 04, 2023 at 03:21:30PM +0200, Krzysztof Kozlowski wrote:
> > On 04/07/2023 15:16, Mark Brown wrote:
> > > On Tue, Jul 04, 2023 at 02:27:57PM +0200, Krzysztof Kozlowski wrote:
>=20
> > >> Also see:
> > >> "every Co-developed-by: must be immediately
> > >> followed by a Signed-off-by: of the associated co-author."
>=20
> > >> https://elixir.bootlin.com/linux/v6.4/source/Documentation/process/s=
ubmitting-patches.rst#L467
>=20
> > > Oh, that seems unhelpful especially with it not lining up with the DC=
O.
>=20
> > I assume the intention was here that if I attribute some co-author with
> > Co-developed-by, then I know that author, therefore I expect author to
> > explicitly participate in DCO chain.
>=20
> Why?  They're not the one sending the patch out, nor are they relying on
> someone else having certified anything.

It's probably safe to say that StarFive owns the contributions anyway,
so I doubt adding really makes a difference here.

> > Otherwise, just drop the Co-developed-by.
>=20
> It seems separately useful.

Yup, I'd rather have the people there if I ever have to run `git blame`
on whatever commit this becomes.

--DKLfejsgq4GdSLTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKRLowAKCRB4tDGHoIJi
0mz6AP4jqMUl/YN3mJ7p0cJwVO9EB2gCXcFLthrQYmpc03uuVgD+MdDmxiZC8PpO
NdZlsf5LpDIVnRlklVh8c1gWkrHdwAk=
=uQV7
-----END PGP SIGNATURE-----

--DKLfejsgq4GdSLTL--


--===============3869117449129654037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3869117449129654037==--

