Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FEBC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIu5HzhGJA8IFPDiJPWjrqIWyMZLRjU0E+Zy8loAw3Q=; b=0SV6g4qtaCpXY6ZPSmV6ZQUANR
	XzDaxd6GANg7x+pqV/6IG/liuVZC3E853oLvjQI6dN/98LI/MxWuFVnwgT6Nvhm4HA3Gl+FKeJgjZ
	7ckqHQgVmfVpgb51ECIYGsTPceW6fthngyaBH/4RBl4HgJxtcs4HBYE2cI3VjBHQ/6rX5NWkfO3h4
	vZIOIZK8gk7zP9PmH4GABVTYgaHirrISQcR+2+JPRPMX2Nx3tAyYOFQkPk04QXAisThdFs/mqYgCh
	5NlDNvbn6XNGzBWRGe81o+nJngK1Y66g65HbhG9U6D+v3LYaqbikVA+oSsMt3jIroc1FyeCbTgouS
	VILffgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2X7d-00E4Ez-1H;
	Mon, 13 Nov 2023 13:37:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2X7b-00E4Ee-0S
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9C623B80DF5;
	Mon, 13 Nov 2023 13:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF26CC433C7;
	Mon, 13 Nov 2023 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699882617;
	bh=7XqO95u4Ap+QRuJXd6EyepWelg/diNFZubTgB9saIII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4oELlsfbrOfRr8QoFxjUm+ZUpvO+8U5+2BG2aEqR+Rr9e23eHttQf4CDk4bnu7Mz
	 5qlBFjJ0/ydlei6F3M5HRadYBylYF9Wb+34XvpK8Uj58PXNpwSgeMpRPwV/NxHeCQF
	 M0f2Tu6kcyeAbDjNlF/LhXScNuTCpmicsQBYM256Geueedha3ljdliigBgSPYHap3V
	 MYdBNnM+FpjoxZTUwNX59otGiToVn47/5GWpHH958NsfVsdKs5bWQDoQkgIBy7zWo7
	 v+vF4ZYzswFt0/gwo5Pe/lasbWwVvHbYe5l90ra7NRRNYamZW2fYn00BmZzox3cte/
	 UgtrytPKKqXkA==
Date: Mon, 13 Nov 2023 13:36:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add binding for Sophgo CV1800B
 reset controller
Message-ID: <20231113-washable-elbow-629bf42b9be1@squawk>
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231113005503.2423-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_053659_324598_FF823551 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7357404182727329302=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7357404182727329302==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tzFxyJuc7xawNjzv"
Content-Disposition: inline


--tzFxyJuc7xawNjzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 08:55:00AM +0800, Jisheng Zhang wrote:
> Add devicetree binding for Sophgo CV1800B SoC reset controller.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

With the unterminated ifndef that was pointed out by the robots fixed,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +/*				0-1	*/
> +/*				10	*/
> +/*				13	*/
> +/*				15	*/
> +/*				17	*/
> +/*				36-39	*/
> +/*				53-57	*/
> +/*				59-60	*/
> +/*				63-73	*/
> +/*				90	*/
> +/*				94	*/
> +/*				102-292	*/

There are quite a lot of gaps here, do you know why that is?

Thanks,
Conor.

--tzFxyJuc7xawNjzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVImcgAKCRB4tDGHoIJi
0u9kAP46DfhtAfiGORBa22Q/gUV3tOz4iPG66mKpSXiWP887uQEA91//1i0UddnN
GAWSlENHPm1tZPfnKSq4WqLpkJVhTw8=
=THoT
-----END PGP SIGNATURE-----

--tzFxyJuc7xawNjzv--


--===============7357404182727329302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7357404182727329302==--

