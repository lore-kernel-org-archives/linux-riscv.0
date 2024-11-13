Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3134CD41C33
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 11:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCt9U6ieUWXcCYTBvaRS5Fa5x6UB4WKQllFaoLTZfyc=; b=wzA/Ti0tc6MaGDcCMBVVE/mZqn
	qpT7SjYorZRkiG/lNlKUMC4OjxgPh5+YLqw/RTaUpGbgboSqto1qQuGUUG00+G2zt6a52bV/Thy+1
	vyMIeuxhW/3AFNKJjvkIM7+vL51mExaaFq2Yu95uMJX9VblEGHDmyT0z5D1xqOJigZA+KnYYxcmp6
	nT/zGzmhtnlqfdK89b4CKIcEIt9akNLst61LFEZa7IOdJImfaJ8DhcgFU6AsgkznGnTyzo7oCgfVI
	GDAguu10NP6j2Za2hrklvQLESSmdKxTTxLSmm7sTCkF2AAiT8oIkwcjDZAy6jIZmTtMwSjWd+d3x+
	BTglXr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBtd-00000006ds8-1pvk;
	Wed, 13 Nov 2024 11:50:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBta-00000006dr5-3K3p
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 11:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D00D5C5866;
	Wed, 13 Nov 2024 11:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CFBC4CECD;
	Wed, 13 Nov 2024 11:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731498649;
	bh=WExTZCA4yaeorpVmk/7SNgGCtCUo6G2L9EG0WxKDbh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Poj3bqoacwRuUlIv1Osav8qmvitBgJ9aL+r2j2aysowKPidLpjeJ9BQzX1n2wpEcd
	 cl99ZcPv+8GjrpLrdJJcmnO9QUVSfqvyilpMrPTB/s2PCKAW9ebvzsHtywWTTI0fxT
	 I+y0hEdptOITZO2wTz1Z3+FkODV8HzMlNNJ2upyUBiyEbFd6RqmfrZTOgtaXUS2NAA
	 7buhP7AwPdSamTvwO4uYCsLx7cNRUwG1NzO0IdFcKtAe4CV5BDASjL947TmdGW8qEX
	 SzRikgCwELGAJT9oDGL1/ptJBltK7vgYRxSGxk1kwvW5mwKdP+/NBApyhg2F2/utDb
	 qcLqK+eUqX5ig==
Date: Wed, 13 Nov 2024 11:50:44 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com,
	kevin.xie@starfivetech.com
Subject: Re: [PATCH v10 0/3] Fix address translations on MPFS PCIe controller
Message-ID: <20241113-unified-humongous-cda4f06a6240@spud>
References: <20241011140043.1250030-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20241011140043.1250030-1-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_035051_081071_A250D3B9 
X-CRM114-Status: GOOD (  21.31  )
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
Content-Type: multipart/mixed; boundary="===============2234139440760708237=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2234139440760708237==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sZDpzgRHz94KOTCd"
Content-Disposition: inline


--sZDpzgRHz94KOTCd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey folks,

On Fri, Oct 11, 2024 at 03:00:40PM +0100, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> Hi all,
>=20
> On Microchip PolarFire SoC (MPFS), the PCIe controller is connected to the
> CPU via one of three Fabric Interface Connectors (FICs).  Each FIC present
> to the CPU complex as 64-bit AXI-M and 64-bit AXI-S.  To preserve
> compatibility with other PolarFire family members, the PCIe controller is
> connected to its encapsulating FIC via a 32-bit AXI-M and 32-bit AXI-S
> interface.
>=20
> Each FIC is implemented in FPGA logic and can incorporate logic along its=
 64-bit
> AXI-M to 32-bit AXI-M chain (including address translation) and, likewise=
, along
> its 32-bit AXI-S to 64-bit AXI-S chain (again including address translati=
on).
>=20
> In order to reduce the potential support space for the PCIe controller in
> this environment, MPFS supports certain reference designs for these addre=
ss
> translations: reference designs for cache-coherent memory accesses
> and reference designs for non-cache-coherent memory accesses. The precise
> details of these reference designs and associated customer guidelines
> recommending that customers adhere to the addressing schemes used in those
> reference designs are available from Microchip, but the implication for t=
he
> PCIe controller address translation between CPU-space and PCIe-space are:
>=20
> For outbound address translation, the PCIe controller address translation=
 tables
> are treated as if they are 32-bit only.  Any further address translation =
must
> be done in FPGA fabric.
>=20
> For inbound address translation, the PCIe controller is configurable for =
two
> cases:
> * In the case of cache-coherent designs, the base of the AXI-S side of the
>   address translation must be set to 0 and the size should be 4 GiB wide.=
 The
>   FPGA fabric must complete any address translations based on that 0-based
>   address translation.
> * In the case of non-cache coherent designs, the base of AXI-S side of the
>   address translation must be set to 0x8000'0000 and the size shall be 2 =
GiB
>   wide.  The FPGA fabric must complete any address translation based on t=
hat
>   0x80000000 base.
>=20
> So, for example, in the non-cache-coherent case, with a device tree prope=
rty
> that maps an inbound range from 0x10'0000'0000 in PCIe space to 0x10'0000=
'0000
> in CPU space, the PCIe rootport will translate a PCIe address of 0x10'000=
0'0000
> to an intermediate 32-bit AXI-S address of 0x8000'0000 and the FIC is
> responsible for translating that intermediate 32-bit AXI-S address of
> 0x8000'0000 to a 64-bit AXI-S address of 0x10'0000'0000.
>=20
> And similarly, for example, in the cache-coherent case, with a device tree
> property that maps an inbound range from 0x10'0000'0000 in PCIe space to
> 0x10'0000'0000 in CPU space, the PCIe rootport will translate a PCIe addr=
ess
> of 0x10'0000'0000 to an intermediate 32-bit AXI-S address of 0x0000'0000 =
and
> the FIC is responsible for translating that intermediate 32-bit AXI-S add=
ress
> of 0x0000'0000 to a 64-bit AXI-S address of 0x10'0000'0000.
>=20
> See https://lore.kernel.org/all/20220902142202.2437658-1-daire.mcnamara@m=
icrochip.com/T/
> for backstory.
>=20
> Changes since v9:
> - Dropped plda_setup_inbound_address_translation() from StarFive driver

Since I had some success bumping the other series for this driver, any
chance of some attention here?
AFAIK, Daire's addressed what's been pointed out by reviewers and
exempted the StarFive driver from overwriting the firmware-set values
with once calculated from DT as they requested.

Cheers,
Conor.

--sZDpzgRHz94KOTCd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzSSlAAKCRB4tDGHoIJi
0g1FAQC2u0D+iCxuqyDT+meB6fucL5/+NoT9+jBZbSOMhmwFuwEAtce6k4K9wbJC
7gjnNEUfwLGOHiS6J+f8vXAMSQx1lg8=
=bXAJ
-----END PGP SIGNATURE-----

--sZDpzgRHz94KOTCd--


--===============2234139440760708237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2234139440760708237==--

