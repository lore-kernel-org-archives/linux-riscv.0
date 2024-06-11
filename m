Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BC7C27C5E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOqBWBoOH/7l0CSD/2RM9kS3qBjBhCQ+0pr7WhCWPGM=; b=I38JWJz7CBPPP8xP3X8SpLudLS
	oHJ8haX8VRvIzalv+8ER9RT0N/QPZ7l/sWrlSn71crq9P7pjrnxaaNk/NHW33lT9i3zudLnJvfraz
	Rp+Vhho8sfkWXsb95HUogJwxscGxtuCnlIozMMAEPJqHYiGu6tjQo4iia14vD0KMzs1Ktt5hvHq/P
	xZo+AbCRsmAe7tlT4/jkWgSGU6PBxuF5x38KLFj5rneMaqNAybqT1p4cyg8koH/4CFX/7t9t5WDFn
	fpXKgzQO/jlkV5rJVcEF1NK9wd7LwuPNiEmw2/TCHTEiibt+Rs4/Ap6KbcW4uUlJiC8+C34Nwyn3d
	pBg3oEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1J3-00000008vyr-3aZa;
	Tue, 11 Jun 2024 13:12:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1J0-00000008vxa-25U6
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 13:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C28C6CE1AA7;
	Tue, 11 Jun 2024 13:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A823CC2BD10;
	Tue, 11 Jun 2024 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718111570;
	bh=OGe3r2/6pOkH3bSOKeGtF6RD1v4JiSo+hRENqhCkqew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dkfn9bGAJxiqPyULSPh28vzRbnNR6uLlnIrDo64O2djHmmF+9RmhcOl1CvS6RlPCw
	 pEJ2EeFIlvJ2EkvwVCxHDm6slBdVLgQr4kN+c7fu1vggrJNAQ9FU4FVyenGIoeEKIZ
	 GepRVPGZdqhokEa+3vxMyNcH4/J0S6sBObj0+l1nCYzNlO0dGTz9njTbNCnfqNnsSW
	 k2nXmY37Jup2keBhBI+3nFdUIX9sYSAJ+XVaGfcfvON3MDtvtB3cBR5RM/GwnlHNj1
	 +5k/Mos4HWpzcryvLv3rM0CC0LbLDh3IMsleknX2XOrTBCPVUhzp8aMzyluerjV77T
	 PGUGdv3n3DVTA==
Date: Tue, 11 Jun 2024 14:12:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/2] PCI: microchip: rework reg region handing
Message-ID: <20240611-relapsing-hurt-3a5f37743784@spud>
References: <20240527-slather-backfire-db4605ae7cd7@wendy>
 <20240527-flint-whacky-4fb21c38476b@wendy>
MIME-Version: 1.0
In-Reply-To: <20240527-flint-whacky-4fb21c38476b@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_061254_750372_66701B87 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Type: multipart/mixed; boundary="===============3641232819722388662=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3641232819722388662==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="66+HdzG+IeYp/nLS"
Content-Disposition: inline


--66+HdzG+IeYp/nLS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 10:37:17AM +0100, Conor Dooley wrote:
> @@ -1150,28 +1129,44 @@ static int mc_host_probe(struct platform_device *=
pdev)
> =20
>  	port->dev =3D dev;
> =20
> -	port->axi_base_addr =3D devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(port->axi_base_addr))
> -		return PTR_ERR(port->axi_base_addr);
> +	/*
> +	 * The original, incorrect, binding that lumped the control and
> +	 * bridge addresses together still needs to be handled by the driver.
> +	 */
> +	axi_base_addr =3D devm_platform_ioremap_resource_byname(pdev, "apb");

I noticed yesterday that this will print an error during boot, which I
don't really want for the devices using the updated format. I'll send a
v2 tomorrow with the reg region probing inverted.

Thanks,
Conor.

> +	if (!IS_ERR(axi_base_addr)) {
> +		port->bridge_base_addr =3D axi_base_addr + MC_PCIE1_BRIDGE_ADDR;
> +		port->ctrl_base_addr =3D axi_base_addr + MC_PCIE1_CTRL_ADDR;
> +		goto addrs_set;
> +	}
> =20
> +	port->bridge_base_addr =3D devm_platform_ioremap_resource_byname(pdev, =
"bridge");
> +	if (IS_ERR(port->bridge_base_addr))
> +		return dev_err_probe(dev, PTR_ERR(port->bridge_base_addr),
> +				     "legacy apb register and bridge region missing");
> +
> +	port->ctrl_base_addr =3D devm_platform_ioremap_resource_byname(pdev, "c=
trl");
> +	if (IS_ERR(port->ctrl_base_addr))
> +		return dev_err_probe(dev, PTR_ERR(port->ctrl_base_addr),
> +				     "legacy apb register and ctrl region missing");
> +
> +addrs_set:
>

--66+HdzG+IeYp/nLS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmhNTQAKCRB4tDGHoIJi
0m6kAP9Yi9S7w0ZvHdiZWSo84UEHKpHj2Y1/n5bHC+FrPclaqgD8DZbVakSMXx/j
Ui6ZHfzPJVENrprpWkS4r/azLfon1A4=
=qPrU
-----END PGP SIGNATURE-----

--66+HdzG+IeYp/nLS--


--===============3641232819722388662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3641232819722388662==--

