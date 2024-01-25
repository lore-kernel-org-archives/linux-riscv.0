Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9ECC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGk1h1dTjDPnYOY8gYN6j8p/ZoFWhvz/gai2M1z58tQ=; b=lq5Z9FF2lCEzqQFv50dJLikxEi
	1q2lkIzEHWXUovkGVyiP6qDq8EsqUYVQMt+lnVQHpc6R/OYQ/O5DtT8imUtsIATvP2u3O0reKOd0T
	UwmvHU2uKBAdnSpNRs65REQCCOH8j9Z1nDFc3kf2BLrswJOtlj3voLgIQ8okA6wqoW/erM1IEH7Qs
	B5pvh+vER76xKIzO1pQtrlEbHHYuPKf9lpS+RtCBDdP1MaHIEPmnB2xJKOM0v7NdSd/SjDRdveY3q
	5jdgNoJVmDJEH/ROzbPMKVX6D+xiZ7xphp2mdpkr7SY7Ja02HKFE3re63h9ObVrbz5b5XMihH/bBS
	KTTxxvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3Fh-000000015He-2RMh;
	Thu, 25 Jan 2024 17:10:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3Fd-000000015FR-1G0n
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 82F3CCE2A76;
	Thu, 25 Jan 2024 17:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18579C433F1;
	Thu, 25 Jan 2024 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706202650;
	bh=apArv/y13HeSPeRmSN34Zj5eLLWOr5OjgCHOgzlBIGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/gafDU9bR1Gmuq/H6tHuAOkh22nQj2vy8TNEPAG7cUWBIIgYkSEUNESS6kpoDUUM
	 qNXj1bhbjohTv+q8Bf5YTEcULJDqmZJtFUQSnF8QeAvYeOi5tYzuG2MSw4MM+OSiWY
	 yiUuq+Ry/6kmiAwwyujryuTD6VPyv/Skz6IMuuc8hbsZUyUOd+WBf9QksrUbhv91dU
	 iwC9hrZ7/sjznYaFTLKwjTEfa+JuVhm5t1ZFBjbsS6U9gVMtubmqSk2WzHxf2fDekB
	 v39RxBz0VRrwhmOt0OEqOFiXbJOs96OrruqYpjomN77J14zZqAqYjWGW8k/vKTUcnS
	 Q2VuxQx9P2b6w==
Date: Thu, 25 Jan 2024 17:10:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AnnanLiu <annan.liu.xdu@outlook.com>, chao.wei@sophgo.com,
	unicorn_wang@outlook.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Message-ID: <20240125-repackage-shore-049e7fcd559e@spud>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
 <9f9a1f5f-2104-4a5c-a837-cd8d18e173d6@linaro.org>
MIME-Version: 1.0
In-Reply-To: <9f9a1f5f-2104-4a5c-a837-cd8d18e173d6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_091053_586480_9A78EAF2 
X-CRM114-Status: GOOD (  13.37  )
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
Content-Type: multipart/mixed; boundary="===============7449276415795100388=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7449276415795100388==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PY07s+DrUtRLCc1c"
Content-Disposition: inline


--PY07s+DrUtRLCc1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 01:39:51PM +0100, Krzysztof Kozlowski wrote:
> On 25/01/2024 10:46, AnnanLiu wrote:
> > +
> > +		pclk: pclk {
> > +			#clock-cells =3D <0>;
> > +			compatible =3D "fixed-clock";
> > +			clock-frequency =3D <25000000>;
>=20
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
>=20

> Also, why do you describe internal clock as stub?

Under the --- line it says the patch depends on the clock series, but
as you pointed out the clock is a "fake" stub, so I don't understand
what the dependency would be.

--PY07s+DrUtRLCc1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbKWFQAKCRB4tDGHoIJi
0tqoAQD+Wvy3whUfNoEmsB1b/zxhahkinspAiLRmXLLBW4ln+QEAgexJgU/2QH4+
duQy/xFKdEnnsoj1mbE8G63JT/LScg0=
=3gZ2
-----END PGP SIGNATURE-----

--PY07s+DrUtRLCc1c--


--===============7449276415795100388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7449276415795100388==--

