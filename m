Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD873C76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y2MvI0HcmTPmp+e+DG9Cx6U+Ypaa6C9IP1gSzDxcB4=; b=GEliUnKXrxWhYREMiFfZiy7yqM
	l1j5OJthcq4iFJ6lkIHVWFmPwO6L8XwGdsVC0kSG0jLO+xFznBm4V+y0TouPGF2EWZFqGh6qq/cjS
	K2PrJqzIK1dHtVItC43fDmmmnCdK+JvCgLCd2yhst9zK4OFm10vWypcnhKjtEpF9i30XNJAuzsOM4
	iXPD9Nhspdqvk0gIkdXyTRy3eF9RqmA7/m1sTrAgOaD8j5UV02vVwRVbfkUZzpXHnxYZbtExDO87Q
	ci4z6yjXQt8+ROb6lSRARUVkHj9dCg0B0d6ggw8OOGAWDxuHzjO/aGmoKJsTsWw0N3T5Uf3N0NB44
	1/uNTpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkO5y-007D94-1w;
	Thu, 06 Apr 2023 11:48:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkO5v-007D7h-10
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 11:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680781680; x=1712317680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b+UYC0tfkmmnRQ4kbRq5dBoEfB7CyXL08W8hMYkXxdM=;
  b=j4dC5ijl9LTNVHPl+/XEaPuF77t7fjicunogaP28iGzWuWDuxU1//36b
   8LVFO3igCeCUCetHFz5ZrIJfiXq3E3dA2py1hKckk9LWY6t7q71ueiMQl
   uGSGPYEtjLzWLibc73AKYbQtXvFCrYNXRl34IhWgH69PtYZe16UB42aX2
   qg35aqDu3F/vX0xHxaoA8MzceK2iYJKU6V7ffXSb4PVawML6hdGSWEqch
   isxE46j8AapmBS9n4VrZLzp6moghPrMY1VQ13xAs80pwC9r5WSpuTfMzf
   5hwQy6Yg9+/LfcjdMTlLR9w8e/LVetY11xiRLbcj9QxjYnf2tx8K0EQxA
   g==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673938800"; 
   d="asc'?scan'208";a="208441268"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Apr 2023 04:47:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 04:47:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 6 Apr 2023 04:47:50 -0700
Date: Thu, 6 Apr 2023 12:47:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 0/3] Add JH7110 PCIe driver support
Message-ID: <20230406-quench-unharmed-2c11b2617e9f@wendy>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230406111142.74410-1-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_044759_407966_9BCA0C30 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Type: multipart/mixed; boundary="===============7879330360019854355=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7879330360019854355==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pdoU8EknNFXRqqKf"
Content-Disposition: inline

--pdoU8EknNFXRqqKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Daire

Hey Minda,

On Thu, Apr 06, 2023 at 07:11:39PM +0800, Minda Chen wrote:
> This patchset adds PCIe driver for the StarFive JH7110 SoC.
> The patch has been tested on the VisionFive 2 board. The test
> devices include M.2 NVMe SSD and Realtek 8169 Ethernet adapter.

I was talking with Daire last week about some changes he's working on
for the microchip driver, and we seemed to recall an off-list email
sent to Daire & Bjorn about extracting the common PLDA bits from the
pcie-microchip-host driver to be used with an (at that point)
unreleased SoC. Perhaps Bjorn has this in his mailbox somewhere still,
our corporate mail policy scrubs things from over a year ago & I could
not find it.

I realised that that may actually have been StarFive, and the driver on
your GitHub [1] certainly felt very familiar to Daire (he said it was
very similar to his earlier revisions of his driver).

I've not looked at a diff between this and the version you ship on
GitHub, but first a quick inspection it mostly just looks like you
did s/plda/sifive/ on the file.

I'm obviously not a PCI maintainer, but if there are common bits between
the two drivers, extracting common bits seems like a good idea to me...

https://github.com/starfive-tech/linux/blob/JH7110_VisionFive2_devel/driver=
s/pci/controller/pcie-plda.c
>=20
> This patchset should be applied after the patchset [1], [2], [3] and[4]:
> [1] https://patchwork.kernel.org/project/linux-riscv/cover/20230314124404=
=2E117592-1-xingyu.wu@starfivetech.com/
> [2] https://lore.kernel.org/all/20230315055813.94740-1-william.qiu@starfi=
vetech.com/
> [3] https://patchwork.kernel.org/project/linux-phy/cover/20230315100421.1=
33428-1-changhuang.liang@starfivetech.com/
> [4] https://patchwork.kernel.org/project/linux-usb/cover/20230406015216.2=
7034-1-minda.chen@starfivetech.com/

How many of the dependencies here are compiletime for the driver & how
many of them are just for the dts patch?

Cheers,
Conor.

--pdoU8EknNFXRqqKf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC6xWAAKCRB4tDGHoIJi
0jhVAP9hS1vC8Hz2Ej8p78BoR9XtyvbMZlUphCIZh2iul1lqHAD+IvTQjBopn9vt
uyBVB9MXQ5t8DwGJ/nm7POC3aFb2/gA=
=PlsG
-----END PGP SIGNATURE-----

--pdoU8EknNFXRqqKf--


--===============7879330360019854355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7879330360019854355==--

