Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CE9C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnLOSE0LuUQBEEAxZKurR6x2mmFKNuZG0phQafXqj0U=; b=vITnfEWRZazKnBn99ZkJFG8vXD
	rKoNqDRr6y05WS5I2TrwGfmcmVQpDl5D57Yecy4Y+GQaueUUVr7BjQ0OhV9nB6nQzodRAILtyoVcm
	hgRX3TAdrgDd0tOZI/wQuRfTAs6UMIub5M95mqVXlJNq8LRDsOXtAndGp0bs9nqzpYZoft0Jzl1DI
	kCaXGeLW/n62Lhqh1hj/00v4GFaXKMu4HLKv+ARksBiowfXJS2eHMs4ZgDMsnOLxyEkqaHqxf1OAx
	6dGkqKp8JfO4ovPqr3xWfNmMKJLw1wiJq4qzHkLwkmRGsSwlIvBawX+TII4rXnIvkSyKvnahKTJN+
	YC8oXMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA4tD-00000005iZE-1FaE;
	Thu, 23 May 2024 09:37:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA4tA-00000005iWt-1Rhw
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 09:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1716457052; x=1747993052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JY2WbpEI+mWUW18lUIt92d13APRa1KMU3S+PnCTrQYY=;
  b=11F5gmmUdRn9wab59uCx+sh35SfuTCMm331Siy+HY/uoH6AW5cXJtddV
   P4hnhDbxpka+sae3lWNDzxojLB+5aVGiT7QAA7OUDVZ6evyXFYiIFEDX8
   k+YmPx05xH97acy4BXzrL/SDJYelmzdLHL4VAgJc+sK6bkYxzb9NLnoeJ
   fefhOHaOVxBpwq/hWcHCy8MbanT4KAZhBWqZGICVKVk13cM8S1dmJcjrQ
   w+yJ7oagoTP8HyL1yuVa8ptsLiM2ek3oNjVzS6mQV+LboIA4S3+azOv/s
   /Ad/XWn9gNzLYOrs3P0HA8pPfvitTNAM7xEE8LGyS4h2M8Zb/B4rsv5xV
   g==;
X-CSE-ConnectionGUID: HkvOnEM3TYyKWZsRs1HTVA==
X-CSE-MsgGUID: A7IIXf1OSrWGf5ZNODCYxQ==
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="asc'?scan'208";a="26488561"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2024 02:37:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 23 May 2024 02:36:51 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:36:47 -0700
Date: Thu, 23 May 2024 10:36:29 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Conor Dooley <conor@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v16 08/22] PCI: microchip: Change the argument of
 plda_pcie_setup_iomems()
Message-ID: <20240523-scroll-sloping-a297ef0ab464@wendy>
References: <SHXPR01MB086345C911E227889E3A4211E6F42@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <20240523023549.GA105928@bhelgaas>
 <SHXPR01MB08637281B32AEE455F030081E6F42@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB08637281B32AEE455F030081E6F42@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_023732_886775_5662A000 
X-CRM114-Status: GOOD (  10.48  )
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
Content-Type: multipart/mixed; boundary="===============8776542132642760704=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8776542132642760704==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jqWlq/BhKECf1ah8"
Content-Disposition: inline

--jqWlq/BhKECf1ah8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2024 at 09:22:01AM +0000, Minda Chen wrote:
> Hi Conor
>    Thanks for help us for this patch set !
>    I see mars dts have been merged to mainline, this version dts patch can not be merged
>    I will resend the dts patch on v6.10-rc1.

No worries, the dts patches in this series are long gone out of
patchwork anyway so I wouldn't have even tried to apply them ;)

Cheers,
Conor.

--jqWlq/BhKECf1ah8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk8OHAAKCRB4tDGHoIJi
0hGZAP9XeCytwAGiMDsRE76sT98+KIjp7JPfuV4CVnQSht2O6gD9EaIZJ/+EM0dy
O+M3hpVKvaItendrAIFPy+CvMDC6yw4=
=YxeV
-----END PGP SIGNATURE-----

--jqWlq/BhKECf1ah8--


--===============8776542132642760704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8776542132642760704==--

