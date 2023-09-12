Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4D4CA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhncEFHynWHleTR+p19Go4U3ZVOR6iIQYCvKju/tnPE=; b=D8pX6gfhjjmtdTqSY8TzuXx+7B
	Tt/zpwOfi5UhTuapyhBXoGjTd8ZCsFxY1ArpsupEY4ixGNY6Mm/GLys5syjYujbFFpmDt005rIX6+
	r5J4Em99+QvXZgjCOt1pY6Gm3RX7GtDQgIdf6vwd0i5KPWBBjGyBTGP5GcgfHxKh3/xxbCJyyeVhC
	RTzCrSQuDT6HhizOiIqB8Tg7hjFMb3uHCuntt6UGdqp1Sw2bUAD277ZQjCpgGWvcgm+P7YnmdE0tz
	F05kRoLjch6GO9L5Vpl2dcSSHAl34quaqZ6ZGy2oX0lJAAJS6t8BjF6mNQs40FxfKSYIhtQFBI4GI
	b+MDfxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6Em-003pXZ-0n;
	Tue, 12 Sep 2023 16:27:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6Ej-003pWt-1L
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 16:27:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9E3C61530;
	Tue, 12 Sep 2023 16:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92E2C433C7;
	Tue, 12 Sep 2023 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694536056;
	bh=bv7Iv5VgHVPJ6lM+M2Zxb2Yans87pWgfeZ8AlEiNrz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lILXc5E4FhEYv8fuvDsGkuvHJ2DnFl+NMUfeMJafGAz3mfJzrp4uvSRpEoiO63GdW
	 2uKvPxhP3JKXVy9o54F/+cL0MDEFZYXlzA0HnIFPdG1VhnfuJSCN0OyLFxM63p7ZvG
	 F/OrOHGc+pLF9KC8CdALvdswKGB+GR1EAZjiLxkn7+kuV815G0Vf8vS55ryVWws5CI
	 YmSLe2gG+kzn8lrfigUTdPFXa8mwDw5JT/c1RuWftTfsYSj0ssHcK+z0zUeyaVSE3Z
	 biGdhtjaNY/miUV+o5UNPLiRwO5O+NSn3xP3EFR2VUiko3t3UuJyqJzOMZauTSKem4
	 FEsuuB/lEq5Iw==
Date: Tue, 12 Sep 2023 17:27:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <20230912-trailing-pampered-52738ec6f009@spud>
References: <20230912072232.2455-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230912072232.2455-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_092737_515053_B9B852BB 
X-CRM114-Status: GOOD (  15.27  )
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
Content-Type: multipart/mixed; boundary="===============0842936680958271998=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0842936680958271998==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DcZx3Ial+vgjWY0d"
Content-Disposition: inline


--DcZx3Ial+vgjWY0d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 03:22:32PM +0800, Jisheng Zhang wrote:
> riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> dma coherent, so set dma-noncoherent to reflect this fact.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Tested-by: Drew Fustini <dfustini@baylibre.com>
> ---
>=20
> Since v1:
>  - rebase on v6.6-rc1
>  - collect Tested-by tag

Does this mean you're expecting me to take this?

>=20
>  arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index ce708183b6f6..ff364709a6df 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -139,6 +139,7 @@ soc {
>  		interrupt-parent =3D <&plic>;
>  		#address-cells =3D <2>;
>  		#size-cells =3D <2>;
> +		dma-noncoherent;
>  		ranges;
> =20
>  		plic: interrupt-controller@ffd8000000 {
> --=20
> 2.40.1
>=20

--DcZx3Ial+vgjWY0d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCRcwAKCRB4tDGHoIJi
0uF4AQCC0yGFWykN5lVA7ttKf7xI/KAt2zqKey5loUVcTCKeewEA/Qu3oqmy+WyO
C5iFFtyyupU0IxGU5PkxjcPqACgjOAI=
=jBrY
-----END PGP SIGNATURE-----

--DcZx3Ial+vgjWY0d--


--===============0842936680958271998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0842936680958271998==--

