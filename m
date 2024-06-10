Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB36C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/Ao2gXXYE6FuSe+A9E3j+JlPUefBUUB5cFaRsqqFiM=; b=f8gU8Jt60hdqD1yVZJMTPraiyL
	4iFnanXNUxJVYYphhwHIpD9C3CkgrZ23ZnJuQ4pGs3ZeUKYczxlxp86M94wvAIf5ALkDm5IoXmaeN
	Xbb18rDM1a98ag0VkV1U0bfeChsZOtBYEOTivzEoJEBUoECCavALK6Wkps2XopcqOrvHQyqJB6iSS
	XjbL9GhMP15tLx7tsmemlksBvZVuncsQVTKxi4o/fhxtsOSjGfrFu7X1o21Debij/Z1T7HLiNt/Q/
	ip4PzkbLgL603CzKEUnz4zpBHErsAIR1Dk7YR7WFL6HNrg0W9VkvlTyky294SrYjZUqQefZmgwiLL
	u32ELrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbae-00000004VVP-1Nmt;
	Mon, 10 Jun 2024 09:45:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbaa-00000004VUa-18iw
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 09:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718012719; x=1749548719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/drKCmK2DXtMTUWF/2XRiruDv+7VQ2JpnwDOThF158=;
  b=e+V22v3sbsZ3rDSmp4u9oTQCxKbRHFJQZFu0/ZAnicbGw5Ce6a3FNkPE
   XMy1c4uGu0/3AKF1O3l4BlyyJvmsRGbYEtca2HQe4xUEltg5xtb2pjpMU
   8aWbffANW8lp+gdf7tjXiOP2eRsJ7zo3wnVdEhzHQgcwUad90IlZiuCwE
   t+xYN+kFkiL7eBQPNJZmQumEGFL1d2ksIvI5dcRz/HnQdvKTuCzqDaqHY
   WKYHs7Zwq2TS4q2LZMhIv1+8lPYUvA2HhdN9A5SekHhIbX+dc0XMUtyQi
   6DrgDBhy4GTWCmFkzCIJDFLdXFjZXX4YenPXTS7qwWB1JNqdCCoPKdId2
   Q==;
X-CSE-ConnectionGUID: V/g+7YycS5WjtxbM+YcRvQ==
X-CSE-MsgGUID: YHLKRFNSSTaea7J20APjJQ==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="asc'?scan'208";a="27194186"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 02:45:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 02:45:12 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 02:45:11 -0700
Date: Mon, 10 Jun 2024 10:44:54 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Daire McNamara <daire.mcnamara@microchip.com>
CC: <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/2] PCI: microchip: Fix inbound address translation
 tables
Message-ID: <20240610-pointless-hamstring-908149945428@wendy>
References: <20240531085333.2501399-1-daire.mcnamara@microchip.com>
 <20240531085333.2501399-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240531085333.2501399-3-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_024520_600662_27072FAB 
X-CRM114-Status: GOOD (  18.26  )
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
Content-Type: multipart/mixed; boundary="===============8360490260104488547=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8360490260104488547==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EA8Ls/LOE2pcxK1c"
Content-Disposition: inline

--EA8Ls/LOE2pcxK1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 09:53:33AM +0100, Daire McNamara wrote:
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

Since we're talking about dma-noncoherent here, I think this series
should contain a patch that adds the property to the binding for PCIe:

-- >8 --

=46rom af066543b8f8b8b0b37e0844979f0c3e28f30513 Mon Sep 17 00:00:00 2001
=46rom: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 20 Mar 2023 11:02:11 +0000
Subject: [PATCH] dt-bindings: PCI: microchip,pcie-host: allow dma-noncohere=
nt

PolarFire SoC may be configured in a way that requires non-coherent DMA
handling. On RISC-V, buses are coherent by default & the dma-noncoherent
property is required to denote buses or devices that are non-coherent.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml=
 b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 45c14b6e4aa4..2f21109c3580 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -53,6 +53,8 @@ properties:
     items:
       pattern: '^fic[0-3]$'
=20
+  dma-noncoherent: true
+
   interrupts:
     minItems: 1
     items:
--=20
2.43.2



--EA8Ls/LOE2pcxK1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmbLFgAKCRB4tDGHoIJi
0q9RAQCyVWqWGhytWP+kBJ3WzC7JxIAbVulwqmeberwf5qSR8wD+LHH4hf+EDbaf
t9ZYSsB+xhb1P9hBtrQZ60reOFyN5Ac=
=cgf5
-----END PGP SIGNATURE-----

--EA8Ls/LOE2pcxK1c--


--===============8360490260104488547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8360490260104488547==--

