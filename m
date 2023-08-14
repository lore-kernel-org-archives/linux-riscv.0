Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2099EC04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ho7Mm7cqv5FUedhVMU05wkx+io37VC5cVQq3ZRvYS1M=; b=aBsdWbG6O4iaQkqu9Yw4UCkgI8
	T2oXnQ65z73DFMHvu4vHnc1rvs9nYV5lvaKYHnvEmZcRtYxE7BZCv65behB7ZlbsWer/vttYFTwWA
	cDX1sW2V87Cl9EirW88qhGbM1pdlfobfOVWQ3ASs/v2b1RVnzoUl1oSYWKXHBe3kmjr1S3pwP4s9f
	z7Z9DGQ2X/TyrMQh7Hoev0YirMBhWOO3c3T692KJK40NoV9Nu76Q7aP4LaqYuTk8cM69JA1SoGmKJ
	OzTgXqsiONSdAYWtcjcbK14JSGCG7fS1EC6qCDMAf/JcoElF+YlIVa5R/nKQjv9tHSDxRGZM4DGKX
	qXg6bbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXgw-00HAGw-2O;
	Mon, 14 Aug 2023 13:33:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXgu-00HAFn-1y
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 13:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692019984; x=1723555984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lLCW8exBkCQ0+KhPTI7tohXMvPiVJbwAMeY/3NzBgkk=;
  b=igxOekXbLsfoMxi/C8PrE8UgclXf0KzIUR6xiNmQyo6tQCiUK8L1fXTP
   sb5T5erY2ljZodsayyqTkwnEs4c0P3QzRFe0Y0vordK2wYiOgSarqlZ7v
   EwdvB3foep7VQyT4hcZIYk5m8KxrFFLUlnPlv94WfMFHQdskHLf1G7kDU
   kdSszHyCzcGBYyAt1bxnA3xm5jYqYUPUdg8gaJDSLzguBkR+9SpHOb1Fa
   Xv/Oa5RjrS2hfRG16bBW+Zj9Y/+EXem/mmDzyGHNvldbsOIUQj/0B32mv
   8h8aQCBXTgUo6BsaUNLJXXM5oqC/PXX9HA1Jj09rvlVbTgo77I5NYQ838
   g==;
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="asc'?scan'208";a="225309518"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2023 06:32:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 14 Aug 2023 06:32:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 14 Aug 2023 06:32:53 -0700
Date: Mon, 14 Aug 2023 14:32:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel
	<p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v3 03/11] PCI: microchip: Move PLDA IP register macros to
 pcie-plda.h
Message-ID: <20230814-enslave-shove-7d664aa2e446@wendy>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-4-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230814082016.104181-4-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_063304_830686_45846B68 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============0516716257308670876=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0516716257308670876==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ip6kD9UvSz6fmmdl"
Content-Disposition: inline

--ip6kD9UvSz6fmmdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 04:20:08PM +0800, Minda Chen wrote:
> Move PLDA PCIe host controller IP registers macros to
> pcie-plda.h, Including bridge and configuration space
> registers.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--ip6kD9UvSz6fmmdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNos3gAKCRB4tDGHoIJi
0rF/AQDCOE4Xmu5oEEQTrRyiRXstNx4FD2D6//vnFqowm2aMcgD+OWRPiXR7DDGX
Q4jYPDKCqmQDkItWe+4xurKC8uXvJA4=
=J3qt
-----END PGP SIGNATURE-----

--ip6kD9UvSz6fmmdl--


--===============0516716257308670876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0516716257308670876==--

