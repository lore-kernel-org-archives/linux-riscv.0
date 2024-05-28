Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568E0C25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 11:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPTakNHD8kIxVq1idfms4CpEKXIjAgdhs4yNgdI9cEw=; b=NjFwGhkiqfN3xex2C3LqDshUSO
	CUUcPFUR/+o2fLb3PDojaVTtaeBNILMYKGlEqKOjF3yeXFpmi7Sxrc0p5DbxReYzYI0ZKUMXrVaST
	JZPIsxExqr1rSisi8BpeQbt0IN2wLVXSYZRkoDBKkhnfLN1+17MuxBSI4+xE83NuWzkbIOUS1lDg+
	meRHuOqvGGpACEhiraG0qQ9Ye1EhK34dtVjdZ7xvFWyEtWulZPDzI7KJhAKgJAlQEnQg/2TL1pHqU
	MVv3OT88BKiTdOT2QLqPP1DuGjiwChoc2M66yLDddw0NK0soNR4zwMmwqLT9hMslgCg6ErHnSY6Bi
	lfp12XYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBvSt-00000000TYs-2qWT;
	Tue, 28 May 2024 11:58:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBvSr-00000000TXt-00RE
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 11:58:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 54E00CE0B26;
	Tue, 28 May 2024 11:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9DDC3277B;
	Tue, 28 May 2024 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716897478;
	bh=1lYQK5mXOyUpa175X1Sy96vhJCVsXrfaSlYdbye/ge8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LI/XBhMMNJFFMWherkusHeRzK7+ig9lgB76uzLfVZp6mhu+jz6rvYccIm0xFBmnKI
	 qdIp+dgugEptH32RE3YLTOitOBMYIkW2ueYGAhLeAMPyxUOVCSOta9cjGgW1C4zOwq
	 NPG4ouUTyBKglYbxJy43bFGuKim5CphIm3SzdPGjIbeMsjvBwRhxSag7ZF37u6JI7v
	 slfoiaO2tH4JIOhF6hiISFnV6FP+EPXBqSnwoLRHUdXfAxWjd9PoxOVOTWUtwxR3zb
	 PQ7jbqxiTd1NKwpJEwNtDkY8ZihuVAt9Nv59Uwgr6NKwU4MDZdrVCRFvdWakdI1uFC
	 MK1nXmNHqjmyw==
Date: Tue, 28 May 2024 12:57:53 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 5/5] riscv: dts: microchip: add an initial devicetree
 for the BeagleV Fire
Message-ID: <20240528-movable-chlorine-cc5ebabb8abf@spud>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
 <20240327-hurry-escapable-e3212bf3cdd8@spud>
MIME-Version: 1.0
In-Reply-To: <20240327-hurry-escapable-e3212bf3cdd8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_045801_420068_91CA04A8 
X-CRM114-Status: GOOD (  10.18  )
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
Content-Type: multipart/mixed; boundary="===============6748613909776140350=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6748613909776140350==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z79wW9aJnFNbzgAR"
Content-Disposition: inline


--z79wW9aJnFNbzgAR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 27, 2024 at 12:24:40PM +0000, Conor Dooley wrote:

> +	fabric-pcie-bus@3000000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0x20000000>,
> +			 <0x30 0x0 0x30 0x0 0x10 0x0>;
> +
> +		pcie: pcie@3000000000 {
> +			compatible = "microchip,pcie-host-1.0";
> +			#address-cells = <0x3>;
> +			#interrupt-cells = <0x1>;
> +			#size-cells = <0x2>;
> +			device_type = "pci";
> +			reg = <0x30 0x0 0x0 0x8000000>,
> +			      <0x0 0x43000000 0x0 0x10000>;

So this ain't right, I sent some patches yesterday to sort out accessing
instance 2:
https://lore.kernel.org/all/20240527-slather-backfire-db4605ae7cd7@wendy/

> +			reg-names = "cfg", "apb";
> +			bus-range = <0x0 0x7f>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <119>;
> +			interrupt-map = <0 0 0 1 &pcie_intc 0>,
> +					<0 0 0 2 &pcie_intc 1>,
> +					<0 0 0 3 &pcie_intc 2>,
> +					<0 0 0 4 &pcie_intc 3>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			clocks = <&ccc_nw CLK_CCC_PLL0_OUT1>,
> +				 <&ccc_nw CLK_CCC_PLL0_OUT3>;
> +			clock-names = "fic1", "fic3";
> +			ranges = <0x43000000 0x0 0x9000000 0x30 0x9000000 0x0 0xf000000>,
> +				 <0x1000000 0x0 0x8000000 0x30 0x8000000 0x0 0x1000000>,
> +				 <0x3000000 0x0 0x18000000 0x30 0x18000000 0x0 0x70000000>;
> +			msi-parent = <&pcie>;
> +			msi-controller;
> +			status = "disabled";
> +
> +			pcie_intc: interrupt-controller {
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +	};

--z79wW9aJnFNbzgAR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlXGwQAKCRB4tDGHoIJi
0oeuAQCripgxkKIvfMVj9OYaqpJnxghyOymmY6JCpmywHPYZ3gD+JxPnKPy7CEG/
pxHE90yC5iB1AQRd+jHpUhskYg101gg=
=Au0t
-----END PGP SIGNATURE-----

--z79wW9aJnFNbzgAR--


--===============6748613909776140350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6748613909776140350==--

