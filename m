Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105D7C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 10:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzD261XTziFWpMWCuIZ360gbu++exCjn8LwGIfkqT7k=; b=p45frHQstO8rag0f06PRCLp0UG
	EpXEEo2m9cVmD4C1IUbr2/op9lLCGrCsoR7c56dcizVIv/TjVj66MSUt7MASWXAsb1Djuy2mYP78k
	VM9T6JCVvmgsZD/mWBtRlTu25E1WmntNc1oFleFg/XSHQ1Wd3/Px/W17QCYZcTSmBQaifxtLIfhf5
	c10WOVILlycSnqBsE+E8tzI/ZeUm+m3jYimzt2sc3eMp8pc0kEWhC3V+ShdDIYjBkAFMx9peVOGYq
	1SJljcTONsDZFdAiXbMWj1KuH6xP/PfPKQB19i/oRuYg2Q33TUzHRa7nUryCcNKHPrZ0+BWaGUVKf
	jF5TxxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wBx-00DICt-00;
	Tue, 30 May 2023 10:03:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wBu-00DIAp-2n
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 10:03:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 751C462CC9;
	Tue, 30 May 2023 10:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F37C433D2;
	Tue, 30 May 2023 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685440973;
	bh=0+SGUOiDQ5nqxSY0Q4GE42XjVvbo4WQnUN2x3XBiXLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDjDwm0gzNDxPM0YLaa6EZgFsIlXnTNFvV6o0KSu/QojbM+Ky9IRLH4YjxWv1RmZF
	 RoD1mt5WV7zzVXWKJ3Lu1FHO7vCrvI8sae8ZfsytrVFAflwJk/Vpmfsv4k2XjiZLsZ
	 4pCHIS7B46VZKrG+gbwV9T77tNwzcNFOabKC4rTJZIT/H6rFddYlxWWNO+rKcHMe4u
	 z0BDgHfu8aAmKX8VLs8wqozA0A832ne2fWdb4+JlhaxqtgQ7aQ2jp2jv8MfEGsIMuW
	 vckff0nz2GXQMs/eBrwymwOlz0ZnpqspZ6wfdYC9wr83dfVGY1P39+t+vv47iMcQJl
	 95OlhukAsml8A==
Date: Tue, 30 May 2023 11:02:48 +0100
From: Mark Brown <broonie@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
Message-ID: <d417628d-7994-4b07-a670-ec14ad938764@sirena.org.uk>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
 <20230526062529.46747-2-william.qiu@starfivetech.com>
 <87e9ed95-ea57-44c8-85f8-34264b5c6dde@sirena.org.uk>
 <a09cc0c9-ef4e-120f-e61a-94f628d67e38@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <a09cc0c9-ef4e-120f-e61a-94f628d67e38@starfivetech.com>
X-Cookie: I've read SEVEN MILLION books!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_030258_961675_051DA209 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Type: multipart/mixed; boundary="===============4093435689302358665=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4093435689302358665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OStcWnmwJi2B52q7"
Content-Disposition: inline


--OStcWnmwJi2B52q7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 29, 2023 at 02:44:13PM +0800, William Qiu wrote:
> On 2023/5/26 23:33, Mark Brown wrote:
> > On Fri, May 26, 2023 at 02:25:27PM +0800, William Qiu wrote:

> >> +        clock-names:
> >> +          items:
> >> +            - const: qspi-ref
> >> +            - const: qspi-ahb
> >> +            - const: qspi-apb

> 	I'm going to change the names of these three clocks to hclk, pclk,
> and ref_clk, as defined in the data book. What do you think?

That looks fine.  ref, ahb and apb would also be fine, it's just the
qspi- prefix that I was querying.

--OStcWnmwJi2B52q7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR1yccACgkQJNaLcl1U
h9DfAgf5Ad6LjZ0DMJ0r5lAycWLFFFtfNyz0mTrawQwG8YBWBhOCeCcdPjjJIiUg
NFKMOUJHcx60wG72KuRjERBeDR3xqA7KdREBspEM004CeKMYPUX4WmG9Wt4VNjtJ
Dcrt2QUrhdx8yvc1nf83wj2bF4xxKtI31Y/6zK2dVrrloTXfne04z3Kv3snetvtc
ZICIfgYQzb3Nzi6Uc0ib6CPNh6lEF+liqsPghw1K1TAC4dGLg9yOIxvxv2MEBKBX
dsGCuq4W1fi1Uzm9hQFm+TqjfdKSqCdtaf4insH1t7KI8ih60bcUuKC2R/NeK8FG
VqH2t0tD1RUh562zh4jZBFepUEaJpg==
=SLrS
-----END PGP SIGNATURE-----

--OStcWnmwJi2B52q7--


--===============4093435689302358665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4093435689302358665==--

