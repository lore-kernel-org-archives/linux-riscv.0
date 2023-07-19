Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C011BC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 17:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4WIZGBN+FfRgg875wzutjZ7oPvrNkc36ZNf20srVR0=; b=cNnDk6EuZGEVrdZr474trLYhgb
	y+beKdaiPBwkWVVV/Ko/9Yh6AsQ4c0FsGL5KE+DCt8kcscFjhnSPHFxT+wSeIQQErx6qKsNJP/Mzk
	a74ufzByimq0yf0s7fs/NUgTA6k67oKL8m9BtFHMn3gn+Tq7LX+lYwNHLFdrqyzsHRPXM1xkgYDOe
	Xqam6+k6g+xDI6XauAVXtkDfOzgnyg7J+05MV8XJMGzfmWBncEieaLSeW2wxXJ1O7EETYwP0q0mUy
	i0IZ3yIikswqsvP8Aq3y/iD9eCRnNoh63wWpd7HGs/lJvE2FG9xnP7P5goE9Y4Cg1xrsjWMCfxfUI
	qQzlYaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAXd-008Fgq-0S;
	Wed, 19 Jul 2023 17:00:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAXa-008Fg5-2B
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 17:00:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A41F61629;
	Wed, 19 Jul 2023 17:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC45EC433C7;
	Wed, 19 Jul 2023 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689786041;
	bh=NCr+wrohPKasdJtsGDWcsEmJh/cWN0ySeKvgcJTFzIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ul/zdll6AFFD6188OX5Iny3t12DdgbcXapKizmchwK+ELZ+2ucxDwsLE5Rg0caviR
	 jeC/VE0nM9nR9eLmLN5vTuEmNA8isXukMtrZnZ6M9ra8f3hIhBD91neU5+u2D/dKdA
	 82g29m1/FOo6BlcKHcOMt8cbxz0oVtAvWx8vlVLVGKbo6Wrx4nB7OVTy4V9yarx36b
	 eQuqcSmQP4f8JETm7YvB6qjneV4/gIqU68eVn29dlqJI01dnzZyV+EfL7c6VgxEY8L
	 NcHTrDUF++0dTrNp0wR12QJQdQCyvMdIGbksR3vxuqrt4E7e/UemHiwcRgLjkYitGa
	 F9p/BcI8b6lvA==
Date: Wed, 19 Jul 2023 18:00:37 +0100
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 0/8] PCI: microchip: Fixes and clean-ups
Message-ID: <20230719-roster-preheated-799d7e103ddb@spud>
References: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_100042_803129_CBB245B6 
X-CRM114-Status: GOOD (  20.97  )
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
Content-Type: multipart/mixed; boundary="===============4577316057613569817=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4577316057613569817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xRfGtZNLLEHjsLNX"
Content-Disposition: inline


--xRfGtZNLLEHjsLNX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey folks,

On Fri, Jun 30, 2023 at 04:48:51PM +0100, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> This patch series contains fixes and clean-ups for the Microchip PolarFir=
e SoC PCIe driver
>=20
> These patches are extracted from the link below to separate them from the=
 outbound and inbound
> range handling which is taking considerable time.
> Link: https://lore.kernel.org/linux-riscv/20230111125323.1911373-1-daire.=
mcnamara@microchip.com/
>=20
> These patches are regenerated on v6.4-rc6.
>=20
> Main Changes from v1:
> - Dropped "Remove cast warning for devm_add_action_or_reset()". This
>   has been overtaken by a patch series from Krzysztof Wilczynski.
> - Improved the comment for "Enable building driver as a module" to
>   clarify what enables building the driver as a module.
> - Split "Gather MSI information from hardware config registers",
>   for clarity, into:
>    - "Gather MSI information from hardware config registers" purely
>       changing the of source of MSI-related information (Num MSIs and
>       MSI address) from #defines (which can be incorrect) to FPGA
>       configuration registers (which is the ultimate source of truth),
>       and a
>    - "Rename and refactor ..." patch as a function's code is now clearly
>       unrelated to its current name.

This series has been sitting with reviews (albeit from myself) for a
couple of weeks. What's missing to get this series picked up?

Thanks,
Conor.

> cc: Conor Dooley <conor.dooley@microchip.com>
> cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> cc: "Krzysztof Wilczy=C5=84ski" <kw@linux.com>
> cc: Rob Herring <robh@kernel.org>
> cc: Bjorn Helgaas <bhelgaas@google.com>
> cc: linux-riscv@lists.infradead.org
> cc: linux-pci@vger.kernel.org
>=20
> Daire McNamara (8):
>   PCI: microchip: Correct the DED and SEC interrupt bit offsets
>   PCI: microchip: Enable building driver as a module
>   PCI: microchip: Align register, offset, and mask names with hw docs
>   PCI: microchip: Enable event handlers to access bridge and ctrl ptrs
>   PCI: microchip: Clean up initialisation of interrupts
>   PCI: microchip: Gather MSI information from hardware config registers
>   PCI: microchip: Rename and refactor mc_pcie_enable_msi()
>   PCI: microchip: Re-partition code between probe() and init()
>=20
>  drivers/pci/controller/Kconfig               |   2 +-
>  drivers/pci/controller/pcie-microchip-host.c | 402 +++++++++++--------
>  2 files changed, 238 insertions(+), 166 deletions(-)
>=20
>=20
> base-commit: 858fd168a95c5b9669aac8db6c14a9aeab446375
> --=20
> 2.25.1
>=20

--xRfGtZNLLEHjsLNX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLgWtQAKCRB4tDGHoIJi
0lonAP9PCe1BscZRjZgxgo1oxmf0IEZvZbis0Lm3q5HPIMeiHAEA+ZkGJ57OVfKM
AMKYN+3w4QGjetvoPOjvn66wmw6kFQ4=
=TJqo
-----END PGP SIGNATURE-----

--xRfGtZNLLEHjsLNX--


--===============4577316057613569817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4577316057613569817==--

