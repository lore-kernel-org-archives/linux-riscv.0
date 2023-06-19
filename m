Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C7EEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrpkOIwkOqsZtRLAUFEqn32DsD6fnFxos4XKVgrvI4M=; b=f2u8639tvpltGa
	kyGCr3dQ+QB3jpMlCDqiTcIdZ3kmxJo2GSLHa15dZ9MfDmm2mmmMaXZ+HeIjk8NmGx8UXrlFzkaYI
	Ud3umrSNKTffoS2PfuBlseMmhcqsOz/KW1B0FcXdcgTaSnZzTDl+t3EVDnb8iPUgBcdAev3EiVCOW
	B3Th8DUx4hJQW/EeN0WqkpvIeICay8lrqA6z3flOoazRb5h5tvGoaPoV9np8gUC8gpc+F+9C5I/I+
	zZLE3ypUhbcO8nXl4XTFto+8q03UvmIENSIE4VDFhMW6ow9/sAdy+Cta043O6yHsdh5Qn66DfrJvJ
	Py2IAeJzm9qxy2gMJpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBgc-0086tA-2q;
	Mon, 19 Jun 2023 10:00:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBgZ-0086rR-2Q
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 10:00:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14CDD60ADF;
	Mon, 19 Jun 2023 10:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BDEC433C8;
	Mon, 19 Jun 2023 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168834;
	bh=8qBw1ddxdTtUbmxqPlg0C8TcutXJwuzg5suaBWkJh0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCG3tktTJchd+tLELdtU/yIJLTUedhH6FrAiQfj6v9DL4n0i9RVQkBW4Z5p0tIpOY
	 bflyIRF3ZWKJ0a8w3MXWy4GPjrRmGvDS5beYb3I1h6X17pTi77butNPEsSZi6QRtZm
	 el2SiETQ2X4f+drRzgD5K8gpEGevmdfnrGDH8RmNH6bGjoIp/f0+jJ+opIxkmr7xX1
	 PVL0+mY8FhZQ3xTeHF099t8hhZGIfFRDJr3eO/PHjcDVve3B/B7DnhrI/Sxrxeihlm
	 iNlwdAC2jFi4Iz7NrG54Xm2k1XlCLne58tupakeYwzh8fnQOm3DbwGMC/qp2k1T/Ej
	 PDQ2ytmW93ORw==
Date: Mon, 19 Jun 2023 12:00:27 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v1 3/8] PCI: microchip: enable building this driver as a
 module
Message-ID: <ZJAnO3NefrPfU9i/@lpieralisi>
References: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
 <20230614155556.4095526-4-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230614155556.4095526-4-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_030035_829149_8604AA46 
X-CRM114-Status: GOOD (  21.93  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Nit: "Enable building driver as a module"

Capital "E" and removed "this" as that's obvious.

On Wed, Jun 14, 2023 at 04:55:51PM +0100, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> =

> Enable building this driver as a module. The expected use case is the
> driver is built as a module, is installed when needed, and cannot be
> removed once installed.
> =

> The remove() callback is not implemented as removing a driver with
> INTx and MSI interrupt handling is inherently unsafe.

Other than Uwe's comment, that I will integrate, the sentence above
should be linked to the Link: below otherwise it is not easy to
parse - it requires some context.

I will do it.

Lorenzo

> =

> Link: https://lore.kernel.org/linux-pci/87y1wgbah8.wl-maz@kernel.org/
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/Kconfig               | 2 +-
>  drivers/pci/controller/pcie-microchip-host.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kcon=
fig
> index 8d49bad7f847..f4ad0e9cca45 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -217,7 +217,7 @@ config PCIE_MT7621
>  	  This selects a driver for the MediaTek MT7621 PCIe Controller.
>  =

>  config PCIE_MICROCHIP_HOST
> -	bool "Microchip AXI PCIe controller"
> +	tristate "Microchip AXI PCIe controller"
>  	depends on PCI_MSI && OF
>  	select PCI_HOST_COMMON
>  	help
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/c=
ontroller/pcie-microchip-host.c
> index 73046bad1521..5efd480e42fa 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -1141,5 +1141,6 @@ static struct platform_driver mc_pcie_driver =3D {
>  };
>  =

>  builtin_platform_driver(mc_pcie_driver);
> +MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Microchip PCIe host controller driver");
>  MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
> -- =

> 2.25.1
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
