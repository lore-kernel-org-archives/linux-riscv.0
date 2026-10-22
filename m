Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4A0606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LXSjKGC9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrEUmnpo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K6wWQLdFCZ0JPwB3JK0KsPGazTWzEOfjkq5IjK6N7wo=; b=LXSjKGC9g9loa9qQcLzTEFDRc9
	6qWZtmv4Z6IVu14jUOKE+wqFAeHgsxfYWsVCWumNzctKD5IaQzRJ/cNtkWziKlgcFAAmIWbn6Hs65
	WjyIBbHRuh7qgKw1Ni5Y+vlGoBj+h84f/S38JLNfB6dHRSdkN4tPQn8+uv5EtjDjcVCRHEVEfAsXi
	GH3Gdkvqh0fBGgYz91AEagELSJwiGHBDg9NlwRmkQKN2v+F6oKoqL9RhSTSFHwpR84bqZB2FGU4Ul
	nPYEeIAI4HPnRI89e87dsH/Ek2M0FnAYgEeECL4YZ6d+Rk3Gql6KPYs4xVXrME092oV8NkcHzftqU
	/et3hrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxqH-0000000EjtR-1vhJ;
	Thu, 22 Oct 2026 18:48:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxqG-0000000EjtH-0jYC
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 18:48:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50F94600E2;
	Thu, 22 Oct 2026 18:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0A11F01825;
	Thu, 22 Oct 2026 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694923;
	bh=QHM09FpIf+RN7y0dUg3rZj1s/Cb49JyGNKlNyi4taMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IrEUmnpoaQNjxXxAg6VFq50onYEUBeDn0Ogk/X3Hxyr8AcqL0CTzgkkkkUs++dMmW
	 XqcUz3Aac9N+cZFX0XQmvuSimgJWfCfQzPGsH+DFrlRO7yf3ZTg0xdAV3+AE0MVAN9
	 Ea/zOGMyBTSaK0Te0xBze87YlLtVPFN3KXGUqJx00Lw0MxDq7zj/g7svPmGqTgNlWe
	 gICW9A5UP93YlXzCxg38FPVJGdflGCj8Y9tn8YwF0NZbXO/PHwz/kuah33/Q3IIY2F
	 +tY2F2Z0nk7Z/TiapgN8MSgPflEzZkbGt0mg/bHgGQ/BEQHIZ6PzKbVs5xlHRDaO6q
	 TGFnEmFIiA5Sw==
Date: Thu, 22 Oct 2026 19:48:36 +0100
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH 13/18] riscv: dts: zhihe: add A210 core support
Message-ID: <20261022-radiation-ivory-c8f9f9c66b7f@spud>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
 <20261022-a210-init-v1-13-5e438f972d24@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261022-a210-init-v1-13-5e438f972d24@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============6265729587605171117=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6265729587605171117==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iUH8Uc8l7nyP4fCI"
Content-Disposition: inline

--iUH8Uc8l7nyP4fCI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 03:53:33AM +0800, Han Gao via B4 Relay wrote:
> +	soc {
> +		compatible = "simple-bus";
> +		ranges;
> +		#address-cells = <2>;
> +		dma-noncoherent;
> +		#size-cells = <2>;
> +
> +		clk: clock-controller@260000 {
> +			compatible = "zhihe,a210-clk";
> +			reg = <0x0 0x00260000 0x0 0x1000>,
> +			      <0x0 0x00250000 0x0 0x1000>,
> +			      <0x0 0x10141600 0x0 0x100>,
> +			      <0x0 0x10141400 0x0 0x100>,
> +			      <0x0 0x04810000 0x0 0x1000>,
> +			      <0x0 0x05810000 0x0 0x1000>,
> +			      <0x0 0x04900000 0x0 0x1000>,
> +			      <0x0 0x20250000 0x0 0x1000>,
> +			      <0x0 0x10140000 0x0 0xe00>;

This looks very much like an incorrect modelling of the device.
Most of these should be individual devices, and those labeled "sysreg"
probably should be syscons as they likely contain multiple functions,
not just clocks?

> +			reg-names = "pll-wrap", "top-crg", "cpu-ss-clk-sysreg",
> +				    "cpu-ss-cpu-pll", "ddr0-sysreg",
> +				    "ddr1-sysreg", "slc-dual-sysreg",
> +				    "top-crg-t", "cpu-ss-ccu";
> +			#clock-cells = <1>;
> +			clocks = <&osc_32k>, <&osc_24m>, <&rc_24m>;
> +			clock-names = "osc-32k", "osc-24m", "rc-24m";
> +		};
> +
> +		clk_peri: clock-controller@300200 {
> +			compatible = "zhihe,a210-peri-clk";
> +			reg = <0x0 0x00300200 0x0 0x4>,
> +			      <0x0 0x02010200 0x0 0x8>,
> +			      <0x0 0x08400200 0x0 0x8>,
> +			      <0x0 0x00540200 0x0 0x4>,
> +			      <0x0 0x27420200 0x0 0x200>;

Same here, particularly things that are only a single word wide...

> +			reg-names = "peri0-sysreg", "peri1-sysreg",
> +				    "peri2-sysreg", "peri3-sysreg", "tee-crg";
> +			#clock-cells = <1>;
> +		};

> +		clk_aon: clock-controller@30844000 {
> +			compatible = "zhihe,a210-aon-clk";
> +			reg = <0 0x30844000 0 0x1c>;

0x1c is also suspiciously narrow, but believable. Is there a register
map for this device available somewhere (ideally in english, but I
suppose machine translation will do a sufficient job) so that I can try
to understand how this device should be modelled?

Thanks,
Conor.

> +			#clock-cells = <1>;
> +			clocks = <&aon_110m>, <&osc_24m>, <&aon_rc>, <&osc_32k>;
> +			clock-names = "high", "osc", "rc", "rtc";
> +		};

--iUH8Uc8l7nyP4fCI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpagwAKCRB4tDGHoIJi
0mLDAQCF3l7L6GJK8DqxaRSjc/+bPAJMUnncAIj8nbTRKYClrAD9EiuXFIV8GoDh
0OKintNj/ZFsbWKsunyCnWkzx4duXwE=
=PrTg
-----END PGP SIGNATURE-----

--iUH8Uc8l7nyP4fCI--


--===============6265729587605171117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6265729587605171117==--

