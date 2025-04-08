Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93800C369A2
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wvO+nFkAHrjU7X8cseY3+h+pnHPC44U8vb8V7ofcfk=; b=DbMDEIVO2XlFgF/EpgDxg2aKR8
	0PaqAzZBsdbKq/+vhx2/zaV9BVvSFwRoEQdNKeS83diQovN6lC3tkbpN9m94uGtbPDBtB7+G2d6TU
	YizVEDW6TbDD1e37OBfIYlfW98CE+Wfl4zCmCkSGDT59lvBZnSCjy/x01LY0UnLK7WrEcsnYNHZ6W
	eKsaqqA7aKigJW6fjNHpy5FiTNeWHkavIhF51uiKKgJ0pl2VRm2PY6TX2QhEJGa5I4BPInmBybF3v
	VzvoX8SAVi3Wyot9QatkoTTZEwUAJAWyySHFScf3ZtdrPWX9dWYuVwJgD+0VCl+8Qrtzq2HhcHYLf
	o8E1cPqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2C4R-00000004qsD-0XtT;
	Tue, 08 Apr 2025 16:45:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2C2m-00000004qbT-1cT4
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 16:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6553B43EB6;
	Tue,  8 Apr 2025 16:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35166C4CEE5;
	Tue,  8 Apr 2025 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744130604;
	bh=raJz/ai0ZijncBOlpXxt8uuwgqGiy01W9ag8yTzBix8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CN5QCqo8FfJuS+kH2SrW9SXisJd5pHEXM8AdUowcpWagegjOXBQVbBANE07oZlmzQ
	 li5c+mCiTm83gAQ3bOAX+pfgdLKJBTZvlL2u7f3xCCNDIQEeWP1a60PccTMgN8wXtO
	 bMrQt1hXozSe81baudtBer5uThmcSifBWXLWrigdtGK6mwSX5oKw8vkizKf8RKZxnZ
	 JETomvJV5XQZnyZFxsKx/aGxKNE8xkAQU8wlrIgL7jdZqAvJxcCeBRcyD2g1s3k43m
	 I7sEGUcGFtK3bnTaQQhzLyWWJA2oKRJz+mDPuaJ2APbfB5vh7NgeA3IDvVjL2LrwE8
	 eFV0zUGdNCPaw==
Date: Tue, 8 Apr 2025 17:43:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH 7/9] riscv: dts: andes: add QiLai SoC device tree
Message-ID: <20250408-activism-botany-351c2e49b4e9@spud>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-8-ben717@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20250407104937.315783-8-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_094324_442955_30AB4596 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Type: multipart/mixed; boundary="===============8545851027311310478=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8545851027311310478==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="awb5ELcIZKsHge4i"
Content-Disposition: inline


--awb5ELcIZKsHge4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 06:49:35PM +0800, Ben Zong-You Xie wrote:
> Introduce the initial device tree support for the Andes QiLai SoC.
>=20
> For further information, you can refer to [1].
>=20
> [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/q=
ilai-chip/
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  MAINTAINERS                          |   1 +
>  arch/riscv/boot/dts/andes/qilai.dtsi | 194 +++++++++++++++++++++++++++
>  2 files changed, 195 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1e1b98dfe7b..b974e83c9f10 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20731,6 +20731,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plic=
sw.yaml
>  F:	Documentation/devicetree/bindings/riscv/andes.yaml
>  F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
> +F:	arch/riscv/boot/dts/andes/

New platform, but your maintainers entry contains no git tree. Who are
you expecting to apply patches and send PRs to the soc maintainers for
this platform? Hint: I really hope it is you.

If it is you, please look at the soc platform maintainers documentation
entry:
https://docs.kernel.org/process/maintainer-soc.html

Cheers,
Conor.

--awb5ELcIZKsHge4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/VSJwAKCRB4tDGHoIJi
0vZcAP9RbDFg/af3ECEvZAxIZ+AZ8LsCFlFr9kWSatf+nA5aEAEAtS1YMjdLacjF
5TjTqZ65HkYhQTbXoa6mn6dLiR1j6gE=
=oOMV
-----END PGP SIGNATURE-----

--awb5ELcIZKsHge4i--


--===============8545851027311310478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8545851027311310478==--

