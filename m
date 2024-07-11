Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FAFC3DA41
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NoPP6aSgB0uJjx9YHf8GHOMNwxomFDOVHVdPDXhMAY=; b=wbahSoeuqKlW7FjkKM4VbMH+9+
	/ddGb+I+Aa2jFfHtRDaxypvCsK9o2aWCZFAS6Cm6IaJkvd6Rt9oBGjHdWYCaHDJNDv5WRa2zsI4wI
	iEnpP7agvUGjcllRqTrFyoAxCHOSYCSzx6ZHDFc4XDrstEjSkOnO3cd9sFsyEK1xekJI0PFFtwSvs
	GHJJCn3xR3cWWjElTMx11gDhBscr2Nei9hO/kPdh33rpnHY2R8cih66J5n5I8B/op0uylve4e2iQi
	U6Yk5ZO26Rk6ZdA5d0J8QUfJsEl0SXfDiPUyKVlEk0LPCJWRFycG2otK+UEOs1X+anDiV0OWOrnef
	dthJgOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRrcD-0000000DfAr-08Qm;
	Thu, 11 Jul 2024 11:05:33 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRrc9-0000000DfA5-35H3
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 11:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720695930; x=1752231930;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JiYpCqAyIboDSFHKDduO+bx97bBcPjVtQTohMQc4QLg=;
  b=gRBxbwSfkL2LkiwaaUktDjKYS3NcgDAnF+AGmFRRpDAIHA+qnruW6xE5
   QyuZf78kITjYUC4kSGOJSUfP9th38QqBBH3JDTx/WMzSRYWstfuFLST0r
   HYNTeW6qwnRU3Zw1pzYd5ixccqnKEnkVtyfIASUYF3dbeocQjlTI7SOAT
   AqSRilb/Hg55FmEz+p79Twn7XSEfIGyKBsu95cWw0Tqd4zDmUvI8uBr5t
   C6OaSEnPdTXIz4EEOPCPPik7jrnN2UZGMtiLbq0v259ebH2ZWVGq7vY4s
   4f/1+6RvQ2ZJzF2OATb0WaPTFmjPeIoJRZyIe08R/fUO18rchyNUaiUDD
   Q==;
X-CSE-ConnectionGUID: m3KNLGSJQQ2/Rtve5ROYpw==
X-CSE-MsgGUID: l7i8e2MFTfio/wZqxdbd4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="40580183"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="40580183"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:05:27 -0700
X-CSE-ConnectionGUID: k3DNBoMrRN63B7vi2mAG0A==
X-CSE-MsgGUID: vycflJQMRyemJRMSn71qtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="53700819"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.127])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:05:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jul 2024 14:05:19 +0300 (EEST)
To: daire.mcnamara@microchip.com
cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
    conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com, 
    robh@kernel.org, bhelgaas@google.com, LKML <linux-kernel@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v7 2/3] PCI: microchip: Fix inbound address translation
 tables
In-Reply-To: <20240711102218.2895429-4-daire.mcnamara@microchip.com>
Message-ID: <b22a15d8-54d5-a8cf-717b-73c5af347755@linux.intel.com>
References: <20240711102218.2895429-2-daire.mcnamara@microchip.com> <20240711102218.2895429-4-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1175667782-1720695919=:6262"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_040529_835072_76D1CD8F 
X-CRM114-Status: GOOD (  10.60  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1175667782-1720695919=:6262
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 11 Jul 2024, daire.mcnamara@microchip.com wrote:

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
> depending on whether PolarFire SoC in operating in coherent DMA mode or
> noncoherent DMA mode.
>=20
> The setup of the outbound address translation tables in the Root Port
> driver only needs to handle these two cases.
>=20
> Setup the inbound address translation tables to one of two address
> translations, depending on whether the rootport is being used with cohere=
nt
> DMA or noncoherent DMA.
>=20
> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe contro=
ller driver")
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1175667782-1720695919=:6262
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323328-1175667782-1720695919=:6262--

