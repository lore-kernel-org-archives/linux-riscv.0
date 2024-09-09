Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0666ECE57A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FEoo7yU9qDEtQaH/GUfUDY9MLSU3AMR+DyI50wmUVk=; b=g9tviSdhBN9jds8/T4iRlON+AG
	PQ8S6YG+juNdFBFn0/c0ziRujNF9eUeOKejcCcraDuYzPNa4IG5VaV2zzOHgZDzp21FK+2xE92xER
	OaRVt1yqVYWkoQD691qcpESutpgXtB5vogemI8vk7Ao6KUnntEApEZYfCN2TJuDEywEuPQtaMOKo7
	07SNWUC5BR+JSzzGPRvg4Z8v1ve8jYp+O3sqHlmiZYVtv25BVuF5l3ujaTEAwY2zflmmD7wpUK4HB
	fS0D+j7VXaUuIb5ZyUuYod9fT3umqFFZYTa1xjEoO8/XLuV/e099hSZvP99VVWUi2CIiPeBGLiR0k
	LCTsQxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfZz-00000002KZy-4Aog;
	Mon, 09 Sep 2024 14:41:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfZs-00000002KWm-1nBw
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 14:41:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A462A43CD5;
	Mon,  9 Sep 2024 14:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89E2C4CEC5;
	Mon,  9 Sep 2024 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725892875;
	bh=1y8PCM0+xf2FYmGsqFR3yxA7UdaRT4ZnVX9hoTW957Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nNGJOFTMog24mI5/ZWN5C41cBnMQW58iRJPehgBbxbiVE8FR6Oks/4O3pVDaSH+nQ
	 NPurmwGtKY+nIWDFKRUkA28wXGAN3zLNUkHu9Wvoae16GLz7FomdAg23RyUlHUPZYg
	 ScFeACzjitysaWeurr9h+MVS3NRvyQMcdIZcp8euluUu3R1aFuuv8rEPDKXQZeTmhJ
	 U1mLZjwhyB4O/nyqsu71Gbd70JFvk8DcE2uM26AjpJOxJhYEW/4VhP6LF8CXcEYVv1
	 l6WJnPoCqGP/f2TsDjaWJxqEt+fcYCG7HIwh4yy8+nxWKIegXSxslYIiKFN9LeKh7N
	 j3rKNdOCQYk5Q==
Date: Mon, 9 Sep 2024 15:41:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] riscv: sophgo: Add pinctrl support for CV1800
 series SoC
Message-ID: <20240909-prowler-renewal-0592d820ccca@spud>
References: <IA1PR20MB495374DB8C4208575AAC9675BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495374DB8C4208575AAC9675BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_074116_600983_475805D9 
X-CRM114-Status: GOOD (  14.94  )
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
Content-Type: multipart/mixed; boundary="===============6347074855735004159=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6347074855735004159==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PqXotlc/4udQtDqN"
Content-Disposition: inline


--PqXotlc/4udQtDqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2024 at 06:38:40AM +0800, Inochi Amaoto wrote:
> Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> This patch series aims to replace the previous patch from Jisheng [1].
> Since the pinctrl of cv1800 has nested mux and its pin definination
> is discrete, it is not suitable to use "pinctrl-single" to cover the
> pinctrl device.
>=20
> This patch require another patch [2] that provides standard attribute
> "input-schmitt-microvolt"
>=20
> The v4 version is from [3]

Which version of this ended up in linux-next? I see a link to v4 in
what's been applied, but this v5 was sent before that code was
committed.

Either way, what's been applied and what's here produce warnings:
cv1812h.dtsi:19.28-24.5: Warning (simple_bus_reg): /soc/pinctrl@3008000: si=
mple-bus unit address format error, expected "3001000"
cv1800b.dtsi:18.28-23.5: Warning (simple_bus_reg): /soc/pinctrl@3008000: si=
mple-bus unit address format error, expected "3001000"

It's just a copy-paste error I would imagine, but please send a fix.

Thanks,
Conor.

--PqXotlc/4udQtDqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt8JBgAKCRB4tDGHoIJi
0itfAQD50oTyzE/z528aScYrZw8gsOkRqQOpJWt0O2z2mrgT3AD9Gu9csCU5kBqQ
/HIkdqjVENjC4ads15qgWwinG8EbIgc=
=YoNT
-----END PGP SIGNATURE-----

--PqXotlc/4udQtDqN--


--===============6347074855735004159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6347074855735004159==--

