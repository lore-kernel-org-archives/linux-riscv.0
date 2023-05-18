Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEE3C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oki1UGJXp8MTtfZTmR3FO/hO1OhcP9hVpdtNjEyn/bk=; b=SvDEU2p4qFpaKBryJhjjXRLT+M
	xT4ZHASZRcVN7ZHnpPlbI9069NXLKB3aRpEMUX2BdNW276l3uwbt/xH/pzjNq7ZIOyOjzZ0Mdpap1
	66Yj9OYZvq0ZnNZO2SWUyImDuVuBilKkuDm/pElnbcck0Bh5cRPmcAa6vE3VOUSAyY7AYr7iPZqHC
	ET4QayBWA7YRRgFvFODCcZHuskELP43KUmsjfLy6uU72Ijs0zUqnMzGxT8FRN9JXdaMYrPq1hTt/u
	/j1DPDsUJTJrX6+5XJtdjF/U1AsYqbU5cejdvZ/iiZlYIHcrbpCp54BudlXX9cCwvpu+uruiYkDY1
	l0ip3yvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzklK-00EBTS-1Z;
	Thu, 18 May 2023 21:02:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzklH-00EBSl-3B
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 21:02:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 621AE6522F;
	Thu, 18 May 2023 21:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD91C433D2;
	Thu, 18 May 2023 21:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684443730;
	bh=dG9KGkwnVBL2/+dISO9tPB3QBs7KKkNCCeDRptlnaxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnfsM4wAfszJ/tjCSKiARr2+tU525tH8OXmB69pIGnIJ2pPTcTojqfySF5eH17DkH
	 41uWVG6fYdY5Tw3xhjGsKm1F79PRCH0JA6sqx0owU/IKQ4pfTI0KukrA6WcRhdo6Mc
	 hCnRKEOb4nlIlEumZ34MbbxnRGH+iEcWt6l42dB4pUjwRTGOH3gs2TM7gE+bp2YJZU
	 5XZuAnb+0syhVsBUSIR8mfrGdFTVlL+DCy5aWsu4Tvmdhzey5nXGPzbjx0rEjq6oEA
	 660HJuZV/3yQDDUTDOWVkzRMNIpJvMSGIw5jQLr1/1a2ludLFLS+belE65vsUjJ4KV
	 6E9Jku6fJNxlQ==
Date: Thu, 18 May 2023 22:02:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 6/9] riscv: dts: add initial T-HEAD TH1520 SoC device
 tree
Message-ID: <20230518-slider-pointless-14c1e653cc1c@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-7-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518184541.2627-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_140212_097601_8C81D7EB 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============8746161849694921863=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8746161849694921863==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aofeKfy/KZUnV2RS"
Content-Disposition: inline


--aofeKfy/KZUnV2RS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 19, 2023 at 02:45:38AM +0800, Jisheng Zhang wrote:
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&c910_0>;
> +				};
> +
> +				core1 {
> +					cpu = <&c910_1>;
> +				};
> +
> +				core2 {
> +					cpu = <&c910_2>;
> +				};
> +
> +				core3 {
> +					cpu = <&c910_3>;
> +				};
> +			};
> +		};

We actually don't need to add these anymore, I fixed our topology
detection :) No harm to keep it though!

> +		cpurst: cpurst {
> +			compatible = "thead,reset-th1520";
> +			entry-reg = <0xff 0xff019050>;
> +			entry-cnt = <4>;
> +			control-reg = <0xff 0xff015004>;
> +			control-val = <0x1c>;
> +			csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
> +		};

I figure this will be no surprise to you:
arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: soc: cpurst: {'compatible': ['thead,reset-th1520'], 'entry-reg': [[1099494953040]], 'entry-cnt': [[4]], 'control-reg': [[255, 4278276100]], 'control-val': [[28]], 'csr-copy': [[2035, 1984, 1985, 1986, 1987, 1989, 1996]]} should not be valid under {'type': 'object'}
arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: cpurst: control-reg:0: [255, 4278276100] is too long

> +		dmac0: dma-controller@ffefc00000 {
> +			compatible = "snps,axi-dma-1.01a";
> +			reg = <0xff 0xefc00000 0x0 0x1000>;
> +			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&apb_clk>, <&apb_clk>;
> +			clock-names = "core-clk", "cfgr-clk";
> +			#dma-cells = <1>;
> +			dma-channels = <4>;
> +			snps,block-size = <65536 65536 65536 65536>;
> +			snps,priority = <0 1 2 3>;
> +			snps,dma-masters = <1>;
> +			snps,data-width = <4>;
> +			snps,axi-max-burst-len = <16>;
> +                        status = "disabled";
    ^^^^^^^^^^^^^^^^^^^^^^^
These are spaces :(

> +		};

Cheers,
Conor.


--aofeKfy/KZUnV2RS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGaSTQAKCRB4tDGHoIJi
0uMoAQCBw0zNKchg9GvcORqcH1KUqfPdzjJFZkl1FjcZJuZKzgEA0Uni0Kk00pQ7
Uo5y1A3imHMXoThfyp/695rWmPg+5g8=
=Ppsm
-----END PGP SIGNATURE-----

--aofeKfy/KZUnV2RS--


--===============8746161849694921863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8746161849694921863==--

