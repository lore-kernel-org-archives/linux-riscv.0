Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B65606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mq0kdeAR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1BshVGv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KVs7o+7gn+koW1m0otqnHKmodXAfDCRHKZHhzjRHONA=; b=mq0kdeARszhaUplENNr3T0ePLB
	zdQu9YL2y7jjQh8tAfZtpi75kvNakq/yQn745rUw5aPjfrtYX2omqsOGrvIx/TnlEPnL0QVmDV+X+
	LsQWNe6XhbPIatTzWIJqZBN/bSwuKc6dJQw+wYcFx69GAavp8JCgBv02Ja1egufK/f8oU6Vh01ASW
	0Xg1MPfrrM874OVXxmMAGn66PrHfgtSazJzt8y5x1fpBYZc+UVtl4kc9UVziv0znaUIuSj/+2oj4s
	lfMDn+BvQ8Ngr/GojYNfiHCa1ZXIT+S+Wp2x+Q2IhLcrL5cck5zpxDYUmBOMH1vH5y+DQB55Z1XB8
	xr2DLFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxsU-0000000EkIF-0WwW;
	Thu, 22 Oct 2026 18:51:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxsR-0000000EkHH-0cJj
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 18:50:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2375409E5;
	Thu, 22 Oct 2026 18:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C681B1F01828;
	Thu, 22 Oct 2026 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792695058;
	bh=LGkffLqIi4CCplhNQsGE6qWrcEYnr0An5Jc/0inVaQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F1BshVGvR8sQaABlsf9t1xJQxtCJRbhU4Jlyss7KVQk78+JLi2m6uf7JmtF1XfCpF
	 z/jMEJFpXRC8RaAidcMbHklA0/v8AjbTJEbWQv4CA67Ebub1rVZ4ZlaVCYEJOrvQVS
	 4thyCjijB6OKNVBm+kVfZam79mkRz1NfelMtC2noV+WaA6SqH1IwTrvIh3345oRvX0
	 6RUYIRbDzCVBRTVoy9QTN2ngiAdPEliBMGkgX0MJxxPBiUr8J4TsOTMmGmOhVoLvmx
	 5GC+O6q6WkCPI5xXNUjyGusQBgSAdZAMRmuFpmva+JN96oqRZG/tLI0DqytmK5H7bT
	 /IkGU7ClH3t1Q==
Date: Thu, 22 Oct 2026 19:50:51 +0100
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH 17/18] riscv: defconfig: enable A210 support
Message-ID: <20261022-concrete-rebound-593001f1ac18@spud>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
 <20261022-a210-init-v1-17-5e438f972d24@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261022-a210-init-v1-17-5e438f972d24@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>
Content-Type: multipart/mixed; boundary="===============9014229754147275737=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9014229754147275737==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W6zy+wXyS25k0uQT"
Content-Disposition: inline

--W6zy+wXyS25k0uQT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 03:53:37AM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Enable A210 platform drivers and reserve ten 8250 UART ports.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 04ae305d5511..b9b3bca12089 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=3Dy
>  CONFIG_ARCH_SUNXI=3Dy
>  CONFIG_ARCH_TENSTORRENT=3Dy
>  CONFIG_ARCH_THEAD=3Dy
> +CONFIG_ARCH_ZHIHE=3Dy
>  CONFIG_ARCH_ULTRARISC=3Dy
>  CONFIG_ARCH_VIRT=3Dy
>  CONFIG_ARCH_CANAAN=3Dy
> @@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=3Dy
>  CONFIG_KEYBOARD_SUN4I_LRADC=3Dm
>  CONFIG_SERIAL_8250=3Dy
>  CONFIG_SERIAL_8250_CONSOLE=3Dy
> +CONFIG_SERIAL_8250_NR_UARTS=3D10
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D10

Why are these options needed?

>  CONFIG_SERIAL_8250_DW=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
>  CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
> @@ -167,6 +170,7 @@ CONFIG_SPI_PL022=3Dm
>  CONFIG_SPI_SIFIVE=3Dy
>  CONFIG_SPI_SUN6I=3Dy
>  # CONFIG_PTP_1588_CLOCK is not set
> +CONFIG_PINCTRL_A210=3Dy
>  CONFIG_PINCTRL_TH1520=3Dy
>  CONFIG_PINCTRL_SOPHGO_CV1800B=3Dy
>  CONFIG_PINCTRL_SOPHGO_CV1812H=3Dy
>=20
> --=20
> 2.55.0
>=20
>=20

--W6zy+wXyS25k0uQT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpbCwAKCRB4tDGHoIJi
0kOtAPkBzDzMgoDcB+YT1aQaWGHqAvUG/4okRxElvImnJUQklQD/RFE4ty3vJOWE
p8DrbgDvh7Xy5rvb+724fcYiBIaWXwU=
=58in
-----END PGP SIGNATURE-----

--W6zy+wXyS25k0uQT--


--===============9014229754147275737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9014229754147275737==--

