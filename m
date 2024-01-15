Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05122C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1prw8qVx9hQ4hZVJdIW4b6NlZ+oABuXES/sJDekwp90=; b=GDlJWIAM96P1KRxLOfqZYm2Gm1
	Brw13RJWxea1erbXgmF9eBcn5ShBPs9S5e+seTCBh4pFR8wjpCb3vZFZtgFPSw/O43bSfGSyu3J7N
	qu5Jg1OSX9H9Ae0ggR4K3QaPDe/TLacXKuCVNG9gmCN7/qgYyrazCxSsI+eX0K294EroDOIe3O8nk
	duFMXf1NyRtPNzoZnKTxUkzunDkaIBh9tzKBLRQ7+/3Y5a1A+gpRQuCwoDFwnMCtdUbhEu/EOVabI
	dBbxIZ4TdeOWMZbqrig5Du6qQXVBJfpumHfooWJzh2bgs4jfXbhZiCs6TbigzCX6uTUO9MxyPkQya
	142K/USg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPwb-009h32-0p;
	Mon, 15 Jan 2024 16:36:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPwY-009h2P-16
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 16:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E655BCE17C1;
	Mon, 15 Jan 2024 16:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE023C433C7;
	Mon, 15 Jan 2024 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705336563;
	bh=xUGRPQ2EffaZwZLMEGtFK+oABfjvuI3uXumfT349cmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baIIcGGKasqctSxWoLvoIPPfrKaUFdbi3SU7f2+lkFCiFEVr5lQdbQDJDBiRNob/E
	 S7mTeaClEEVSuokJ0I8H9bdImVf+TbIj8CKBxy0J74zjOmoDJRIzNdUcSgjMje6znx
	 LgH63B0/kouOCHiikIdpJDupCsZ0aRUyFL0sGnh3KWOuVZlE+5JsTilI8jGyHbdWEK
	 CoAI8C3SzUUYPb0F2YJf/4f0ef6A8y1AKTTHnPYVLeEGSZCiM2Na8RVeDenqP1mxGo
	 yJP3rDXHZ5oItZjiLQ3p4bAnE3gsu6XrIs2G1yKP7Bf8A4aOAPuRDcnY4kkVX8o1Cg
	 199mFZfiOZYwA==
Date: Mon, 15 Jan 2024 16:35:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: sophgo: Add clock controller
 of SG2000 series SoC
Message-ID: <20240115-spendable-achiness-cff7918fe810@spud>
References: <IA1PR20MB4953C774D41EDF1EADB6EC18BB6D2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953B0CD5B8796102DE358C2BB6D2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953B0CD5B8796102DE358C2BB6D2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_083610_753544_A6C56FC9 
X-CRM114-Status: GOOD (  18.06  )
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
Content-Type: multipart/mixed; boundary="===============8584049508919596833=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8584049508919596833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TuBYItwW9BIAMewk"
Content-Disposition: inline


--TuBYItwW9BIAMewk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 14, 2024 at 12:16:58PM +0800, Inochi Amaoto wrote:
> SG2000 series SoC has the same clock as CV1810 series, but the clock
> related to A53 is functional in SG2000 series. So a new compatible
> string is needed for the new SoC.
>=20
> Add definition for the clock controller of the SG2000 series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/sophgo/sophgo-doc/releases/tag/sg2000-datasheet-=
v1.0-alpha
> ---
>  Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.ya=
ml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> index c1dc24673c0d..59ef41adb539 100644
> --- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/sophgo,cv1800-clk.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>=20
> -title: Sophgo CV1800 Series Clock Controller
> +title: Sophgo CV1800/SG2000 Series Clock Controller
>=20
>  maintainers:
>    - Inochi Amaoto <inochiama@outlook.com>
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - sophgo,cv1800-clk
>        - sophgo,cv1810-clk
> +      - sophgo,sg2000-clk

I recall before you mentioned that the Sophgo folks were considering
renaming one of their devices. Is the sg2000 the renamed one, or a
different chip?

Thanks,
Conor.

--TuBYItwW9BIAMewk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaVe7QAKCRB4tDGHoIJi
0uRwAP9mzzbnJcU5NjK3wd0CYbLltUApBRsV7oVkt08heTojJwEA5gmuu8dEjtdJ
1GycIchYx+T0qBt3L2ppGCqwqlIiMQ8=
=TyKR
-----END PGP SIGNATURE-----

--TuBYItwW9BIAMewk--


--===============8584049508919596833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8584049508919596833==--

