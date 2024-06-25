Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D41C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuYEJO/hQkf1f3InAUsxEkLcvv57KYlf1ISPOKhkukg=; b=cSVFwXJR0U7mNoIVlSOHUU5Jkq
	P8ocEUxDicDAwgR+J9YFwbJs4J7Y/QoOe9kT4+W4sUbnFMPMDzoLohx6lFXme5gBocCBT9ex9Rkuv
	soM39GM4EvT+80r183touB+vsFkEwjz26kGBo5NYZuVpuLGA5ym9dlyKjSl5JSJSbsuTSv6NQm7GS
	vU9HVSF0o83b2fY60WSbYLADctbukK0RP80GkRz2bn0BW5t165qqkzChYeZTxpM1pBn6+giQqXxFg
	CvlNdABANbtsPNqdpsxrAM3ztN939axIV5jm3wZtTAcZTHHY88pnJl2M3+uG9P+nEP4Cx97D5Olmb
	EUYYrN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8zt-00000003gtx-36aD;
	Tue, 25 Jun 2024 16:26:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8zq-00000003gsS-1lVw
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 16:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 506A361682;
	Tue, 25 Jun 2024 16:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88757C32781;
	Tue, 25 Jun 2024 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719332777;
	bh=NzFJdhpkPkPsPzXdsQO/C4ohQJeIVQhnJ4XDaukByws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOSWshGxvpIGg5W+3uakVVD/UZviTeUUghcGHUKWVmzkIOxsHwJjFZn8ewuoxnF5t
	 CEqLq7BBUwY//+JGrGpAhiGObQyWwiQU4MxzPDYIe/f9uB+58x79Kw7gZAG5jwE6l0
	 QyVckm7pan8+smkCN2ngJK+WDw+gjE5DYT541DO+2TCKaGr8/QbdAodJxHEml8bjUz
	 gDFk69fgHBU289NPaetQcMYd4Q4646u9Sfi5WGKKV0X79XuACiWAzB4HNp9VAP78BG
	 vjTOLe0VgH12YmH8LNpUIOA8Llbj06c2Ca4rSVT4lZLaUpXuAyPYluzrwCcN0VgdF1
	 wngDuMLL/5BnA==
Date: Tue, 25 Jun 2024 17:26:12 +0100
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v5 1/3] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <20240625-length-user-c6c36e36bbeb@spud>
References: <20240625123845.3747764-1-daire.mcnamara@microchip.com>
 <20240625123845.3747764-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240625123845.3747764-2-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_092618_811671_FBDEF12F 
X-CRM114-Status: GOOD (  11.28  )
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
Content-Type: multipart/mixed; boundary="===============6773422711651476302=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6773422711651476302==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P6b8YckaqdTiq6l6"
Content-Disposition: inline


--P6b8YckaqdTiq6l6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 01:38:43PM +0100, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind one of
> three general-purpose Fabric Interface Controller (FIC) buses that
> encapsulate an AXI-M interface. That FIC is responsible for managing
> the translations of the upper 32-bits of the AXI-M address. On MPFS,
> the Root Port driver needs to take account of that outbound address
> translation done by the parent FIC bus before setting up its own
> outbound address translation tables.  In all cases on MPFS,
> the remaining outbound address translation tables are 32-bit only.
>=20
> Limit the outbound address translation tables to 32-bit only.
>=20
> This necessitates changing a size_t in mc_pcie_setup_window
> to a resource_size_t to avoid a compile error on 32-bit platforms.
>=20
> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe contro=
ller driver")
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--P6b8YckaqdTiq6l6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrvpAAKCRB4tDGHoIJi
0hKTAP95sopi5DgFJu1MLiGcqbgay3iUerfxQhqqMp/GXTD+LQEA0OoeZdHlxGKp
4TxEvb2EORLwww5AnCACQDT0S0Ed5go=
=5PKF
-----END PGP SIGNATURE-----

--P6b8YckaqdTiq6l6--


--===============6773422711651476302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6773422711651476302==--

