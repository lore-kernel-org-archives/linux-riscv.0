Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB698C64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JucCUKEGslUzXmWGeTht4rAQDGGyFwbsXHcfUaTsSbU=; b=TpNLDSeIJ2qMktzgtnvXvHNz52
	H9bNMqPUUydwwg4cMOfYuHtEoL8jY5c7y9ApQLqV7BrXso7l2rd3w0lZpBgug/3K4lMGQYaUu4ojd
	pEaMEW9Y5kFvrayq15ltEBAOr3T4S8uL0QjcukLBw5dKxiPknJ3yM2z7/ZeTS25epFP+lY2Oui7tN
	mP3fxr4WzEDytvNjtVY5iAJWIPkvp1ZZccpgHNWdi7OLkLjjTXeOC8O8XQPllIxmiAFYzebzJhF8f
	8CmcSHi6QNtReCHE8r4S+PXG2rK4jXxtsqg7QHtSaHwNy/6xnLHN4/c0UXx3aoDzTvDe47tBH4Bc8
	sfwu6UxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTRu-001X1a-0O; Fri, 24 Feb 2023 08:29:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTRq-001WzW-Lz
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 08:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677227339; x=1708763339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SIn1p7e4VSan5YSb/O/jBQErVaCbUiyyEKP8M4PMU5w=;
  b=GD2DaJ/yuawn2XTAh5sOklfBIo37uhmREWcI45ey0Ymqu01GhU6V8RD+
   CWwoHs/jOfXKDxLF2LVQmwdUomCfq9y3xiv9TGtAvhQiv0MqgF4onDgLT
   HkYbzGtYIhwr4vqFvh02hQWOvOLF4yCywKJYAfdO6we2wcCPAWbt7pPYx
   cRnDi2HIRVCl9Rt7HtpPbxRtj31xkwZZ6vxmogLwGNHXBpzPe6+cylL3S
   DxENAWZ0oGzb8tl5035f5dBHeNbrDaNozeaWCBo7Aw2DuOsgmSvPDN5q9
   PK/WQdzFfqkNFE85vNpV1xNZcQpTFPkQHjYKmOQr+YoZSRi5ExzCZ2U4n
   A==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="asc'?scan'208";a="202385503"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 01:28:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 01:28:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 01:28:51 -0700
Date: Fri, 24 Feb 2023 08:28:24 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Xu Yilun <yilun.xu@intel.com>
CC: Conor Dooley <conor@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer
	<mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-fpga@vger.kernel.org>
Subject: Re: [PATCH v1 0/6] PolarFire SoC Auto Update Support
Message-ID: <Y/h1KFGSw13OabYw@wendy>
References: <20230217164023.14255-1-conor@kernel.org>
 <Y/ht1eHgtRrLxIhC@yilunxu-OptiPlex-7050>
MIME-Version: 1.0
In-Reply-To: <Y/ht1eHgtRrLxIhC@yilunxu-OptiPlex-7050>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_002858_749602_23DF3B11 
X-CRM114-Status: GOOD (  18.75  )
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
Content-Type: multipart/mixed; boundary="===============7304931191350261149=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7304931191350261149==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MKpYTFhinBTffULG"
Content-Disposition: inline

--MKpYTFhinBTffULG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 03:57:09PM +0800, Xu Yilun wrote:
> On 2023-02-17 at 16:40:17 +0000, Conor Dooley wrote:

> > This patchset adds support for the "Auto Update" feature on PolarFire
> > SoC that allows for writing an FPGA bistream to the SPI flash connected
> > to the system controller.
>=20
> I haven't fully checked the patches yet, just some quick comments:
>=20
> Since this feature is just to R/W the flash, and would not affect the
> runtime FPGA region, I don't think an FPGA manager is actually needed.
> Why not just use the MTD uAPI? There is a set of exsiting MTD uAPI &
> MTD tool if I remember correctly.

A lack of interest in opening up the system controller to userspace!
You're right in that the writing of the image can be done that way, and
while I was testing I used the userspace bits of mtd along the way - but
for validating that the image we are writing we rely on the system
controller.
I'm really not interested in exposing the system controller's
functionality, especially the bitstream manipulation parts, to userspace
due to the risk of input validation bugs, so at least that side of
things should remain in the kernel.
I suppose I could implement something custom in drivers/soc that does
the validation only, and push the rest out to userspace. Just seemed
fitting to do the whole lot in drivers/fpga.

Cheers,
Conor.


--MKpYTFhinBTffULG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/h1GAAKCRB4tDGHoIJi
0jYZAP0b4isZi20eYfPCosiKMCfUgAK5+YFO5MSqE1BKfxYw5wD9F8vB/xfqYImD
Iw3UauhLpsnOEvidjzCRFdckvVP+gwY=
=Xgqy
-----END PGP SIGNATURE-----

--MKpYTFhinBTffULG--


--===============7304931191350261149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7304931191350261149==--

