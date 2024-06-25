Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFD3C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOUuPCYBJerQLMhUCFC20/H8cCnNHbc+sfAIVUJvgeE=; b=u+/2RsKpkcABQBOqYhbBAI1+At
	GUdECndsjzFH08cBca8zISip4pz50pKyNRTP4MUm189kJ7viJr/RQTV2DFacAskMuF3J0Zw2MIp6E
	6xA79BVKmgKvQxIz4TK51J86dKW+cMqC/FQhuV7ZWDEFc1oDCrcR4S7YaePWFtUpPGUwoUaSYRN23
	9Z5eOJ6WFNLDGQVH+0ouMZeqLbYqLMNb4SiNO516VItxPFv+UVKJhfL9DlZuzVCwWZ4Kr9Zv3ME8Q
	X0lgcUAQ1z05RQ9K0hQ7T9qP8H0ZibPng4MZhVoZ9HI+wYXxHS9hCwfJ58EC6C5VL+dP7+Kws8UYI
	pXCnrUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM90J-00000003h21-0jKn;
	Tue, 25 Jun 2024 16:26:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM90F-00000003h0A-2QUy
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 16:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E98E4CE1C1E;
	Tue, 25 Jun 2024 16:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FCEC32781;
	Tue, 25 Jun 2024 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719332801;
	bh=k4FmAIrTJcBCRz+b2v73feqo0jByBWdFWEdwWR0gKjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkB/j2V2bOXzEZqM4yTCc1N7D7VxaouKFlBiM74XLTaFihJxLpo9efylmQ7DfyFI0
	 Elzj3g88aQm7az0dEsH/a1P6BRuezr3MEgux7NM5P5o7Pruh3JR1Ams/ayWZ5BUB4/
	 F63DBf3RvAQoJ/SABUy+nRSbGgiORlvWaBycVPsA4XrWqPVASD8IQR3TleVLTUsHgW
	 oEMvudWyi9zK1EVxgfMeATVwnMlGxKlkDf5QetU9MIGCq/VUhdzgtEeXLnlEdc/R0T
	 fLhzpL55DHfP64PXQJQCP7GZ0dyw6MwUqb4RZ6t7ZCAFwYWUyBKjSKc/DAECR3hvez
	 PXKdsLVHxUEsg==
Date: Tue, 25 Jun 2024 17:26:36 +0100
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v5 2/3] PCI: microchip: Fix inbound address translation
 tables
Message-ID: <20240625-charter-hardcover-36e9a2739cd8@spud>
References: <20240625123845.3747764-1-daire.mcnamara@microchip.com>
 <20240625123845.3747764-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240625123845.3747764-3-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_092643_820884_89211068 
X-CRM114-Status: GOOD (  12.90  )
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
Content-Type: multipart/mixed; boundary="===============8882417516646701067=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8882417516646701067==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DjaEz/ZbS4TcTu5m"
Content-Disposition: inline


--DjaEz/ZbS4TcTu5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 01:38:44PM +0100, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> On Microchip PolarFire SoC the PCIe Root Port can be behind one of three
> general purpose Fabric Interface Controller (FIC) buses that encapsulates
> an AXI-S bus. Depending on which FIC(s) the Root Port is connected
> through to CPU space, and what address translation is done by that FIC,
> the Root Port driver's inbound address translation may vary.
>=20
> For all current supported designs and all future expected designs,
> inbound address translation done by a FIC on PolarFire SoC varies
> depending on whether PolarFire SoC in operating in dma-coherent mode or
> dma-noncoherent mode.
>=20
> The setup of the outbound address translation tables in the root port
> driver only needs to handle these two cases.
>=20
> Setup the inbound address translation tables to one of two address
> translations, depending on whether the rootport is marked as dma-coherent=
 or
> dma-noncoherent.
>=20
> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe contro=
ller driver")
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--DjaEz/ZbS4TcTu5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrvvAAKCRB4tDGHoIJi
0j+MAQDkxF2nwyRlgf9MjhSnnVS8WtmKLlm6bY1IaYNMFB96qgD9Ep4rd4/dRqvj
ICIMqDSrZqRmjvPAfcOsawdwwrcGSgw=
=VsVS
-----END PGP SIGNATURE-----

--DjaEz/ZbS4TcTu5m--


--===============8882417516646701067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8882417516646701067==--

