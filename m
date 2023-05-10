Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B08C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Vz3yH0wyHnlnKQOnPsAnfAvSRqNTrPf4CsMEZ4A9s8=; b=ow0IuCDN2GaPgo3VhRt+B5YjTw
	ZecwT+19haYCqjqpTYgW/ts8LPOVGQEhMcnUN87ncFe5ZlsJHVj7ZLG4zFlNpA4wQnQ6s3HZJS0iO
	K0qmZ5vMBgZRfnv2C5gJH8P/RHZB+t4AXyNAuW4E1DdTVqWpQS/yPZaFwzApvx6vLWJZvhwI065u2
	L9BY4nwYMx9hghhFaz2dxDao+rDkGBZ7jwRCfMIiXyKVm0VodUZ9ckNm9KGGdNwW4jZrSaou1Unav
	AMcK1tCDRStVXhS2JnG8ls4QZMYC930jhfFbrCCPsNWFFo+ZsB9vtEX/vPmc5k8F+f26MtLcvDbNK
	cdUEpnZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwioU-0067qj-23;
	Wed, 10 May 2023 12:20:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwioR-0067pw-1T
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 12:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683721255; x=1715257255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TcX1IaLwnXYJEIt2VotXZBEoSrQM67d7M4Y9YenCRXg=;
  b=FpAgL9yTNYfBNnqU9IG46QCbZN3KKHpHtwUMbxxBbw7+BJ+RedQayol/
   /80a6WjNlSf0XfQSEe4GOJ/5lilJp2NWY8eYPdyG11U+afNMSYfbV3Pcn
   8hr+3UJA6sdoYM+eLzYztQ/X3e1AAgG12RQGgb0JTlqiWq5EPHB1GCAxF
   yygx3A8L6FeeDlbZlUWI8LzKM3xz9UmcsL+PapQe9JMpA8WfsSUoxa6Hy
   ftcbFNmY0BMpJYWJ0deB3f37BEYKYBAqQrXVWaOcDxBqnehL37dFLw1sF
   Td1Q04I9kerUK/mE+LNJOso7oi7p1CLj+txJgYs18GAq4sHNo/wlzEK2u
   g==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677567600"; 
   d="asc'?scan'208";a="210554051"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 May 2023 05:20:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 10 May 2023 05:20:47 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 10 May 2023 05:20:44 -0700
Date: Wed, 10 May 2023 13:20:24 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Atish Patra
	<atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Anup Patel
	<anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<iommu@lists.linux.dev>
Subject: Re: [PATCH v3 10/11] RISC-V: Select APLIC and IMSIC drivers
Message-ID: <20230510-maybe-wrongly-14914a15c044@wendy>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-11-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230508142842.854564-11-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_052055_552994_2554AEE2 
X-CRM114-Status: UNSURE (   7.17  )
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
Content-Type: multipart/mixed; boundary="===============1770427055758889002=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1770427055758889002==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3u5hYZkmsjkmqqoH"
Content-Disposition: inline

--3u5hYZkmsjkmqqoH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--3u5hYZkmsjkmqqoH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFuMCAAKCRB4tDGHoIJi
0peMAPsF88TZqTDIFWCvsuDyzGB5/8W3/VHbAHHmMC5kyZPYzwEAhbStO8c+fjsD
mgqW/ghiLkALyo3FoMQwSXlsbmYyZw8=
=HWkU
-----END PGP SIGNATURE-----

--3u5hYZkmsjkmqqoH--


--===============1770427055758889002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1770427055758889002==--

