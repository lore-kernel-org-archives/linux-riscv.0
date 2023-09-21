Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3D9E706E3
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 08:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8CL0oUVhK6RZ3GCpJedNQizy1Fq3NfttB5av1goigc=; b=0E5NNeuC/Aw+0TGPQPxwDmJi3d
	ETX7682UeHn9ey2GgYViuwckBCJMXXFH7v7tBcld5FfWZ2aC6UVEi2wo7BrrYYSK8UiHGxFe97GB3
	utve1AtnLYli888R7sRLtKPxeB0mfbW1S3y01juTuMZcFiFQLiI9x8tdk2x68PE2IhEeepY1MT6Rx
	lJkO5WIlZu/BA0DP48o7bFK7JacamCEnPyWg/CwRAiHsI7sdST29blikJxd2tsZPIkr2f2LDWq6aQ
	B+lA3udboH38/NJZI6ED0Lhylb3xdHq8+pSA4gnNv/q4CtXXqu/sFkkVTqYN4IpwwfdxReP5RtyJU
	KkrORLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEgz-005S9m-0S;
	Thu, 21 Sep 2023 08:05:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEgw-005S7e-0V
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 08:05:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 33C04CE1D34;
	Thu, 21 Sep 2023 08:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C58AC116AC;
	Thu, 21 Sep 2023 08:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695283538;
	bh=cYb7Ub3bti/deKs/jdrs9q+vuzARawcOGZH6tlkcZ0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzndAuD5lDrILdYmfpKN3DCvqeXqeVrLQZankoX6JfzmLsKO16hXwIWP7+77ALI3g
	 6SwpEcPdr0JvsbnP13j7BllSZgFElmxjR/0Yin7ZHXWsFKaSaD6Z3Hu9p4wqvnm4E0
	 8RnqaD3d6DuKPAt8ILyxMFWgiWUT7f9ovQLmodULkRiyvryk4jdrFhE+1CS9PLkDfN
	 9rZDGaF6EB68ZyWC1fNCNGYUGzvdcG0tDQgKhU2vjpK48e4mdp8OSxMY8dmrNhfu30
	 HAVKv2GxAuuXwelQ3pt+z3LY2dQFxdRB+jETIdNiMmT+tl3x/0c0oiw72DzhmIbBrY
	 tjYfVZjbu1VlA==
Date: Thu, 21 Sep 2023 09:05:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	evicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Message-ID: <20230921-d7bab3f036e498a23eb6b578@fedora>
References: <20230920-53a04651c08acb0796dc63b4@fedora>
 <IA1PR20MB495358928C0DCF5854C99584BBF8A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495358928C0DCF5854C99584BBF8A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_010542_371149_3B7A6F20 
X-CRM114-Status: GOOD (  19.77  )
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
Content-Type: multipart/mixed; boundary="===============5610292991086784770=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5610292991086784770==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdBFnvGRk9OScnKc"
Content-Disposition: inline


--kdBFnvGRk9OScnKc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 08:43:47AM +0800, Inochi Amaoto wrote:

> >>>> but not one. In another word, there is no need to defined mtimer and=
 ipi
> >>>> device on the same base address.
> >>>
> >>> There's also no need to have two compatibles for the same interrupt
> >>> controller, so I do not get this reasoning. What actually _requires_
> >>> them to be split?
> >>>
> >>
> >> Yes, it is one, but can be mapped into different address. So I think we
> >> need two.
> >
> >Not two compatibles though, just two memory addresses that you need to
> >locate (or maybe even 3, for SSWI?)
> >
>=20
> We may need four (mtime, mtimecmp, mswi, sswi) if use register range.

Why would you need 4? The first two certainly could be individual
reg entries, no?

> Anyway, I will use a vendor spec implementation as a temporary solution.
> I hope this will be corrected in a predictable future, and we can use a
> standard way to resolve this at that time. :)

If the spec doesn't get frozen, there'll not be a standard way merged.
Hopefully not too many others go off an implement non-frozen specs, and
we will not really need to worry all that much about it.

Cheers,
Conor.

--kdBFnvGRk9OScnKc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQv5SAAKCRB4tDGHoIJi
0kwBAQCMThCZ01ziaG8cYDl53BVrJCuqYiEaCp+5ivC/5BrsOAEAptaWzL8Sle9r
wuC74Jhg0ariLbfG9Of8Zpra2j83dAM=
=fXxo
-----END PGP SIGNATURE-----

--kdBFnvGRk9OScnKc--


--===============5610292991086784770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5610292991086784770==--

