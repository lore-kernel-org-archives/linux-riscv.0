Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB28C9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PH6xGzlLdV0wDHa2QGivX2HaeEEZB4xDrqhiO9wee64=; b=ItI7J7mdAnltwpB3ytP7dBvPcW
	N3VVEA4za9qeQVY6rAjXPFqd6ZPR8HM4tNCPmrT7Jf68cNuZpHNvUbUmnDKw8xWwR0ex6/pgqE9E3
	dVQowBEUclo6zmZf/9QC0+JGBAHEouP5HcWs8b4p9bGzPghju6H3T5vqGyvQbOJS0ZqEGytoMtHGw
	VcrHrjkr53YE1F1TVdUFbjQcgqsVBVqVSmRo+YA9Lr7rmnkfldqCZm6O2+qBi+FOnNMoNVyvw1aIG
	8bh0ue9BF/LVg+Btah3pc+iyq8bCZyN6hY1po2LPDOSWh0XisTBKg1ojHO4mE+r3Sw4vGV6AjOKkC
	g2suRlfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qYB-0000000CBAg-1Jz7;
	Thu, 24 Sep 2026 21:00:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qY9-0000000CBAV-0zGK
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 21:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60261600D4;
	Thu, 24 Sep 2026 21:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D031F000FF;
	Thu, 24 Sep 2026 21:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790283612;
	bh=PwJOVvkMlxAljxs9EmNGUMj/t/l87e3L1ciWxDWzd3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KwGm6clRr+o4Amr6Ir9PjBd0Cr6AHQli0vJZChnR9ieVPp7HscV7TFVNwjcKJHVH7
	 Wu57k1gs9pzG79huOHxEB4pAINo5NuQBHs/JsxEZ82W4b3Y9Jfs9QHiw5hpsNi4TCh
	 eGaJSb1MYXEJJayozxMuJ7t7TWndogvg7qnY9Zn3AtUbQWEIaqdgcN/nqZ1X5hVmxN
	 EDESGUafnc/NrSfCHREDpOelEEnhzQtmBydqgaH8Fiv1D57XJhvVghD+sQ8M1sd7WL
	 LzYYlMOECN+xbRrsOPBmo8ZTocRi17sxTpihrR/IfO/SEWeH1HflO6UATH0HehFMkv
	 5TPeEyZmFN5JA==
Date: Thu, 24 Sep 2026 22:00:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>, lgirdwood@gmail.com,
	rahul@summations.net, anup@brainfault.org, lftan.linux@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Message-ID: <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
MIME-Version: 1.0
In-Reply-To: <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
X-Cookie: Oh, so there you are!
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
Content-Type: multipart/mixed; boundary="===============4286125112739416464=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4286125112739416464==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y+6on071O8QTkAF9"
Content-Disposition: inline


--y+6on071O8QTkAF9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 10:35:08PM +0200, Krzysztof Kozlowski wrote:
> On 23/09/2026 09:00, Joshua Yeong wrote:

> > +    voltage-service {

> There is no such service. Don't invent names. See DT spec.

Looks like it comes from the RPMI spec:

   https://github.com/riscv-non-isa/riscv-rpmi/blob/main/src/srvgrp-voltage.adoc

> > +  "#voltage-domain-cells" on the provider, a consumer lists
> > +  "voltage-domains = <&provider DOMAIN_ID>" and names each entry in
> > +  "voltage-domain-names", the way it names a voltage power domain. Both
> > +  properties belong to the consumer, so a consumer binding describes them
> > +  itself:

> And where do you explain what is that "voltage domain" and why it is
> completely different than everything else we have?

> No, don't come up with your own naming for standard things.

That also looks like what the spec says (some of the description is
copied pretty closely from the spec).

--y+6on071O8QTkAF9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1j1UACgkQJNaLcl1U
h9BDRgf/ULwJBqpkvE1nb/w6KJt9M73kmw7FUwKNe3U7s9SQ5BID77H3eui5NcGD
JAH0sWEUxQK+I7r0kyC817OZr+sMBi7ADiSX/TFEGVpEs3NzWuSNoIAUphm+ToE+
6Y/3OpI3OxL7V/O/45vJ81tjVHf4YTYdj6JLVW/bSwKEPOjH++mXaJyAi0WhZ+gO
hLVHYdlTzVUaH4/JRqiqmPs0tp6n9tgBPrhrAnYIsKM57xkeREVPhIjdAWUVa4l3
ZFg7R0l0XXG6wTZpGCRU/NTvWJau0sHXPtbkfrtfUSFskJYtt1L4lpwsEYOhYJFm
YH9kDyZ3K8DbnAQlZZfTbBLVNZ/9jg==
=/9WJ
-----END PGP SIGNATURE-----

--y+6on071O8QTkAF9--


--===============4286125112739416464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4286125112739416464==--

