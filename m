Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692DEC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 20:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sMptL48IO32OYrPGADQv4wGIP2SMFvvLvYO+RdJTVg=; b=IzF7t0Huxm4pSgGxtbwoFG+VxC
	sGYRSk8LaxlX3rNzpzrXcKr7zqBVR/KrvJWdDnt1O7EWeNthScjo4FUlrwL8v6kxIGbeKnS03u8ZO
	y0WfN2Fr+c4v6qVNBfGZIAiPBpHGdTh6FFdfhIW5FJ2h9fnGjCzWYsDsgnFWm1k7pMOZHne2qK+5S
	b8k8o5bApsRo5LRX8+P0liYClJhlCxq3z+/9WW+cLWYgYGB9hcAPspN7On3Lfk++Xvug57+IFx+gD
	2OHAMx2fyoE7P25BeDCOjVSr9SKl5T2oECaWeUh4Q6gtUOxCzPjqXcZ9z3HrBS/eoUbbSw+P0G7eY
	169kHicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEzz-0000000AcaN-2gPs;
	Mon, 04 Mar 2024 20:33:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEzx-0000000AcZx-1Yd3
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 20:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7C851CE170D;
	Mon,  4 Mar 2024 20:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A327C433C7;
	Mon,  4 Mar 2024 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709584398;
	bh=kpA/7pn9mASzroHmqDoFxSE2elACiXObSuvnlyB3WC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0p/wUtlCENa0byHYGPMmupleg8lrPhhXs1o1qKUEb+SRYVOrehff1u1dEjYMoawr
	 4pc2tOJQFbjUUnLq0ETNLwgdIeUS/FYMtrLqM+Lyj/TNhEZwVEX9Vo3H1SJOmRhj6q
	 xUbh+9H0MF1vOxas6WZd6Nax+MzUY9+C6rP3Yvf2iHB0Kx3HsE7vc3Oj2lNfwHYWBh
	 AWbitvC/2Nmm2kZ75G+mf9CWOAGxD9AJf8AxHVp720gjU5swjYVPwFijnWu28tt5HF
	 YXAn8mBz+paSX03iBMcIrSgwrbcfwGeft11VA1kM/fOpD/SerTeMK6o8v01xcbnKnQ
	 ZC72KDaIDdvOA==
Date: Mon, 4 Mar 2024 20:33:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: interrupt-controller: Add Canaan
 K230 PLIC
Message-ID: <20240304-froth-ecosphere-9ee29b2085ec@spud>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
 <tencent_23A08076AB6331AE43CC64C87FA3081F8006@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_23A08076AB6331AE43CC64C87FA3081F8006@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_123321_610626_9541F32D 
X-CRM114-Status: GOOD (  12.87  )
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
Content-Type: multipart/mixed; boundary="===============6586746177896172573=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6586746177896172573==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CACqwa9A6+6CIXkZ"
Content-Disposition: inline


--CACqwa9A6+6CIXkZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 11:16:23PM +0800, Yangyu Chen wrote:
> Add compatible string for Canaan K230 PLIC.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index 709b2211276b..da147faf32bd 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -69,6 +69,7 @@ properties:
>                - sophgo,cv1812h-plic
>                - sophgo,sg2042-plic
>                - thead,th1520-plic
> +              - canaan,k230-plic

Add this in alphanumerical order please.

>            - const: thead,c900-plic
>        - items:
>            - const: sifive,plic-1.0.0
> --=20
> 2.43.0
>=20

--CACqwa9A6+6CIXkZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYwCgAKCRB4tDGHoIJi
0stTAPwKRfMRoeIDnrMRXeK7RYpCbLmlvm8J8cf/OixdlnJk9gD+KTSYTpv8jygT
ZSw3TqHWSdZ0u27JE6N5rE2R2h7pMw0=
=tgwG
-----END PGP SIGNATURE-----

--CACqwa9A6+6CIXkZ--


--===============6586746177896172573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6586746177896172573==--

