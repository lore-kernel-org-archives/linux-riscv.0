Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BF2C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 11:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5V0me6V5rxrHK4UVI0rZibA0PHMfkF0Afra6o7DgS0=; b=vXft1JtEWgmJpo47EiQ9FVBjsQ
	+NEKAhdLGjjRERqIhILQZ27c34h3jPASJxOzxw/VK6gshU1M6zZy8TIAZ5/9BqBDLLzP/SXuMEQFT
	wDnnEpx6e5Vraeda47oKr9bPGkSYwELPEaocg2Qq2u8aZY0+cZ7Vbh/zGajdPvrmZFc4ODaWHIaaY
	XhTJUd8gSBNwlg1o1bc06jiWjtXVvBJMcorGqMi+DuMWx0bC1H5+yXO4ffA/o8QvCYDqCYAyHxsyh
	uMjpfUPz323p7RVFfqS1c8EFHamxIQeP+xN2iXdzX/7Hy+GhAHTrjDVpOa0zIhK0jhdrcpQWOLNvR
	jAWqIHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIpFT-009wQ6-ES; Fri, 20 Jan 2023 11:07:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIpFQ-009wPA-BN
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 11:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674212872; x=1705748872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tddhBs+s6Mm/9EWouBm1BqAaL6YzSOYT4DgxKFbeOzE=;
  b=EWM3iJeOEFOcVPF2hkU/ztLbliG6XW635l6rA6iwPz4wpvil5ZkZsdY3
   0npE6P8ESKzW26EU0ldgU6v6XL8S+U6ZPpp3aiy/x/WW5kXouTPbw8WDW
   EOQ72mKuw26cIU/J1kqITUxKYykXkE0hdGjLSxQoYGeuFjdCiWvBIc3OW
   9ex5SV8BgRMYFGegHvO7hIMZrpeAohU1c5+miGPPk6Aqem+emR5taJ/bO
   q6Sji/5+dR5LEyZtrO5Tq5nknOIW9rFWBNvelJC6pkkbe24yM8SXtfZBp
   f3rnQ10s6MpeKJ3WQZxZJ6FT/3PiM4dbKEVZh6CSgQiDjtOhDdUYzj7nA
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="asc'?scan'208";a="133267851"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 04:07:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 04:07:47 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 04:07:45 -0700
Date: Fri, 20 Jan 2023 11:07:22 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <daire.mcnamara@microchip.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<lpieralisi@kernel.org>, <kw@linux.com>, <bhelgaas@google.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-pci@vger.kernel.org>
Subject: Re: [PATCH v3 00/11] PCI: microchip: Partition address translations
Message-ID: <Y8p16kaddL+Ot2Oa@wendy>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_030752_494163_92B6CD0C 
X-CRM114-Status: GOOD (  13.31  )
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
Content-Type: multipart/mixed; boundary="===============1172458061588220104=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1172458061588220104==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nx5WSvkbl8tPQo8f"
Content-Disposition: inline

--nx5WSvkbl8tPQo8f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Bjorn, Lorenzo,

On Wed, Jan 11, 2023 at 12:53:12PM +0000, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>

> I expect Conor will take the dts patch via the soc tree once the PCIe par=
ts
> of the series are accepted.
>=20
> Conor Dooley (1):
>   riscv: dts: microchip: add parent ranges and dma-ranges for IKRD
>     v2022.09

I don't want to take this patch just yet as it needs to be sequenced
with some other dts changes, so please don't wait to hear anything on
that patch from me in terms of the rest of the series!

Thanks,
Conor.

> Daire McNamara (10):
>   PCI: microchip: Correct the DED and SEC interrupt bit offsets
>   PCI: microchip: Remove cast warning for devm_add_action_or_reset() arg
>   PCI: microchip: enable building this driver as a module
>   PCI: microchip: Align register, offset, and mask names with hw docs
>   PCI: microchip: Enable event handlers to access bridge and ctrl ptrs
>   PCI: microchip: Clean up initialisation of interrupts
>   PCI: microchip: Gather MSI information from hardware config registers
>   PCI: microchip: Re-partition code between probe() and init()
>   PCI: microchip: Partition outbound address translation
>   PCI: microchip: Partition inbound address translation
>=20
>  .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  62 +-
>  drivers/pci/controller/Kconfig                |   2 +-
>  drivers/pci/controller/pcie-microchip-host.c  | 688 +++++++++++++-----
>  3 files changed, 533 insertions(+), 219 deletions(-)


--nx5WSvkbl8tPQo8f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8p16gAKCRB4tDGHoIJi
0kvUAQDhU9O835lZt9HbL0FEwtohVT3iiFZvKHnxEBL9CcpaqgEAuphEfww5Lg3z
F4LF1DiXm4CRt329OoQPMWHD0RPDJww=
=hfRX
-----END PGP SIGNATURE-----

--nx5WSvkbl8tPQo8f--


--===============1172458061588220104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1172458061588220104==--

