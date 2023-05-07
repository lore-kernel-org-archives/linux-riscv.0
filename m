Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6B7C77B75
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 21:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MH6Rl2sIEESsmkw+gmmajfUNkTTl5CsIfNrb1QpuwmQ=; b=vnX3/3O71ZZlVv2LHeqeW9HEvz
	a4Y+QTDYNL06m6mm986XgVhXdqDeq5TnurQt9LRDMatbJq9gKZL8klP7vOO+eZ7OVUlNgaHZjDQqv
	fUj45Dz3+G5xmB6VAdv9szEZ02YTuqIgaXuEsW62aN12Rs0fuzbIDm5uODocNXaKlxUoqH6817yqh
	fAg10MYV3/Md4ayJ3vmyZlkyPVL5eXsrXh78egQdsj4KD92tsbN6JRvb6Qhu1CQnFjyQQ6Dp+aXxK
	CD3gPHLQrqFZ/cqAlRctN4zxVeEUtNkzERNK/Uig4p/otpy5Fh503i5eK1Ie2Mlis7R/f4WgZUzyk
	P++Vz6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvm2L-00GiWK-32;
	Sun, 07 May 2023 21:35:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvm2J-00GiW1-0m
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 21:35:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C5ED60ADB;
	Sun,  7 May 2023 21:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA98C4339C;
	Sun,  7 May 2023 21:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683495318;
	bh=NdcD+9ij+DOpkLob2FE8gAcGrtbnol7u+fW5Ls8BxTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nhKKmRi0ny4VVMdAikGPgyZsaYig2yu7iCJGXn81dqF1HzqjVGMXGHo2sqgYUgSSb
	 sf3Se+AS0s+mR+vmq6DOv37rsTClJHsafIAJATyKXCC6X6JZVUmBFR92AjmgsY1u4Q
	 4WlBkVXcgkyNGM4xF2Z/xvdimWNiBpeoHFdrA6aDRL2R/IXYpug1pQs4/2tJ86rMGn
	 Q8l4z+KXPU7Ip/XJqW/xCyUswiWGtpBA467TyQHD23/tbvxVBxj5KX9G8eA7yK4CT/
	 3eHz4m5RXOmpDvmfjlqIOL3wFVUqGGlivBkdAOLeWWLG6S2R1GluXQcKYcF7aIhuwZ
	 qP5qm4yBrDw+A==
Date: Sun, 7 May 2023 22:35:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>, heiko@sntech.de
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Message-ID: <20230507-calamari-gentleman-bbe62af06f92@spud>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-4-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230507182304.2934-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_143519_395461_06393078 
X-CRM114-Status: GOOD (  13.28  )
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
Content-Type: multipart/mixed; boundary="===============2032159450915822525=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2032159450915822525==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OKce/XdTtjQB3lJP"
Content-Disposition: inline


--OKce/XdTtjQB3lJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Jisheng,

On Mon, May 08, 2023 at 02:23:02AM +0800, Jisheng Zhang wrote:

> +		c910_0: cpu@0 {
> +			compatible = "thead,c910", "riscv";
> +			device_type = "cpu";
> +			riscv,isa = "rv64imafdc";

Does this support more than "rv64imafdc"?
I assume there's some _xtheadfoo extensions that it does support,
although I am not sure how we are proceeding with those - Heiko might
have a more nuanced take.

> +		reset: reset-sample {
> +			compatible = "thead,reset-sample";

What is a "reset-sample"?

> +			entry-reg = <0xff 0xff019050>;
> +			entry-cnt = <4>;
> +			control-reg = <0xff 0xff015004>;
> +			control-val = <0x1c>;
> +			csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
> +		};
> +
> +		plic: interrupt-controller@ffd8000000 {
> +			compatible = "thead,c910-plic";
> +			reg = <0xff 0xd8000000 0x0 0x01000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
> +					      <&cpu1_intc 11>, <&cpu1_intc 9>,
> +					      <&cpu2_intc 11>, <&cpu2_intc 9>,
> +					      <&cpu3_intc 11>, <&cpu3_intc 9>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			riscv,ndev = <240>;
> +		};
> +
> +		clint: timer@ffdc000000 {
> +			compatible = "thead,c900-clint";

"c900"? That a typo or intentional. Hard to tell since this compatible
is undocumented ;)

> +			reg = <0xff 0xdc000000 0x0 0x00010000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>;
> +		};
> +
> +		uart0: serial@ffe7014000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xe7014000 0x0 0x4000>;
> +			interrupts = <36>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";

dtbs_check complains about this clock name.
> +
> +		dmac0: dmac@ffefc00000 {

dma-controller@

As I mentioned in the other patch, please clean up the dtbs_check
complaints for v2.

Cheers,
Conor.


--OKce/XdTtjQB3lJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFgZkAAKCRB4tDGHoIJi
0gJkAP9TyzjHcuAsWbOpJ8RnqioUEWne+Q8oDh+GeealrSC1hAEAjWjGDNcOBF7i
EgCMKjbIUEwwPx/9ox6mnCrgpzj20gA=
=Xg5D
-----END PGP SIGNATURE-----

--OKce/XdTtjQB3lJP--


--===============2032159450915822525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2032159450915822525==--

