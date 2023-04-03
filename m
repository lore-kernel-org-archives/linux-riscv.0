Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C2C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkopM+P2F3hzo9al1+zqNvDWmjPY7G+OU5345lfsIy4=; b=4sK7lvoJcNBkGjJ0UEWglro+13
	hxp3e29qGRM/OvioqhdtNEfN9tZvf4rUK9YDA8suKmo3Geo4jhoJBtd7wdWZVueWPagm8jgdn5+DB
	2qWP5Go4oSb4VkUAFMaPWEwlc1Bu6mr40MJ2u9RTBCawhoUObXxe4u03731d8XmzZF/hWtDojQcOT
	VjuOCaX05MKB8V14YTRvUfeRXsHAMUsTt4vpj9TBrvAK7dA8btTIFSUFGx401WULb95Qnzpn2vMDi
	/BSROYfmgeqIEWUk9h8+ogmt+As7dwadUSAtH/84c09Q1ejepyvXBiX5u0muh3khnw9kH3pkkUz67
	RBlolTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEv4-00EQy9-2C;
	Mon, 03 Apr 2023 07:48:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEv1-00EQwk-0l
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 07:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680508079; x=1712044079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zGqIFvsIBpWbq/uZw0Ixb3JhhlFXJPObQzt1HnJSOpc=;
  b=mGi/20Tx5SQnCDfmAE3z1N5zdzZl9bkhEKfWmRwyTnpafmgKkmvuE3Md
   qsMPDO9Aj4QOUUuYISU/sXxZPNJ6RpSbVa20eHpN679RoiqGhW3I4Bpnf
   +l2Zn86KOSrSNlVLoHzxcd8r3yWMUpfdhww5DGoFsGB4TLxjhJ3GeZHnT
   35Utsu6stbwM+GpHt8lOniJXLC/WAuJlbHd70iJ8SgYkNlbQqNeq4IgEm
   m5WGU4EfL5iX2ZS0oNi3DOtYnqNx2nXjKB7vZ7yuhJ5jEPURAMyxtGkzB
   BqmHPu9wEmMynTCjDkmIGkFLJ0az9E5kZmVQBx+tjSQZpH42VaxblYY6b
   w==;
X-IronPort-AV: E=Sophos;i="5.98,314,1673938800"; 
   d="asc'?scan'208";a="145174505"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Apr 2023 00:47:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 00:47:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Apr 2023 00:47:50 -0700
Date: Mon, 3 Apr 2023 08:47:35 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/22] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <1eda304a-a8e0-4f19-bfe4-8793052f73a9@spud>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
 <acb36897-8085-4f41-9b68-b243467ffc6f@spud>
 <ce4ee037-c53c-5bd4-8968-437ee21c9c51@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <ce4ee037-c53c-5bd4-8968-437ee21c9c51@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_004759_386667_3E3A1D85 
X-CRM114-Status: GOOD (  16.04  )
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
Content-Type: multipart/mixed; boundary="===============9193953444071830025=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9193953444071830025==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QEXRWawa+Yd/Oc16"
Content-Disposition: inline

--QEXRWawa+Yd/Oc16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 03:30:32PM +0800, Hal Feng wrote:
> On Sun, 2 Apr 2023 20:19:41 +0100, Conor Dooley wrote:
> > On Sat, Apr 01, 2023 at 07:19:12PM +0800, Hal Feng wrote:

> > And the rest as riscv-jh7110_clk_reset:
> > MAINTAINERS: generalise StarFive clk/reset entries
>=20
> For this patch, I find something to improve.
> 1. Could you please help me sort the StarFive entries in MAINTAINERS?
> "STARFIVE JH71X0 CLOCK DRIVERS" should be added after
> "STARFIVE JH7110 MMC/SD/SDIO DRIVER".
>=20
> 2. A "S" should be added at the end of
> "STARFIVE JH7100 RESET CONTROLLER DRIVER".
>=20
> I have tested your branch and have no comments on the other patches.

Done:
diff --git a/MAINTAINERS b/MAINTAINERS
index f405114bf096..0a701632b0b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19907,6 +19907,12 @@ M:     Emil Renner Berthing <kernel@esmil.dk>
 S:     Maintained
 F:     arch/riscv/boot/dts/starfive/
=20
+STARFIVE JH7110 MMC/SD/SDIO DRIVER
+M:     William Qiu <william.qiu@starfivetech.com>
+S:     Supported
+F:     Documentation/devicetree/bindings/mmc/starfive*
+F:     drivers/mmc/host/dw_mmc-starfive.c
+
 STARFIVE JH71X0 CLOCK DRIVERS
 M:     Emil Renner Berthing <kernel@esmil.dk>
 M:     Hal Feng <hal.feng@starfivetech.com>
@@ -19915,12 +19921,6 @@ F:     Documentation/devicetree/bindings/clock/sta=
rfive,jh71*.yaml
 F:     drivers/clk/starfive/clk-starfive-jh71*
 F:     include/dt-bindings/clock/starfive?jh71*.h
=20
-STARFIVE JH7110 MMC/SD/SDIO DRIVER
-M:     William Qiu <william.qiu@starfivetech.com>
-S:     Supported
-F:     Documentation/devicetree/bindings/mmc/starfive*
-F:     drivers/mmc/host/dw_mmc-starfive.c
-
 STARFIVE JH71X0 PINCTRL DRIVERS
 M:     Emil Renner Berthing <kernel@esmil.dk>
 M:     Jianlong Huang <jianlong.huang@starfivetech.com>
@@ -19931,7 +19931,7 @@ F:      drivers/pinctrl/starfive/pinctrl-starfive-j=
h71*
 F:     include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
 F:     include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
=20
-STARFIVE JH71X0 RESET CONTROLLER DRIVER
+STARFIVE JH71X0 RESET CONTROLLER DRIVERS
 M:     Emil Renner Berthing <kernel@esmil.dk>
 M:     Hal Feng <hal.feng@starfivetech.com>
 S:     Maintained

 Cheers,
 Conor.

--QEXRWawa+Yd/Oc16
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCqElwAKCRB4tDGHoIJi
0sqbAQCMsACpQzkzhLoKfCAGm331fVF+ABaBHJYSyLnVCVgBVAEAmAp9CCOzimm4
keaJvJy+j9w82evuGi+U1ktFrXhXDQs=
=7zTB
-----END PGP SIGNATURE-----

--QEXRWawa+Yd/Oc16--


--===============9193953444071830025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9193953444071830025==--

