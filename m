Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E03AEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhI1N6RwrjhUBZ8u4fItqUWK/XbiBB8ykrFGm+TO90s=; b=Nju/HxwcRnc3IRW1XN+WHM7Vwk
	bWwW4p18hjJJn57RIy1eQGyuWyeaHYsC9W/w2ufraoix05A5jwvUpaSDdv46RxRArgjabotjrvlxY
	PT3sJ1fJuWzj+EkY7MUBFwGMV1xzpKH97N3zE67WdsYu3qjY/60LOEaHLO/zmI9D8luCyUHXPGCVL
	JAo3KJ5Qdn4iN6e+uebCezbhTL7adfQLDD11MsrSi9Uv0Va8nZ8Ymb/9XIBVE/0+dfu3LlBf8uiIg
	G0PFNpwl268g5WmQbH0aaB4cuADSuQoRdSqImcMbc6dbe0/8Izj2tpyfzHBmcn+0YY2bZ47aM3G1m
	VdJFySLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSkw-00B8HC-2n;
	Thu, 20 Jul 2023 12:27:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSkt-00B8G3-1U
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 12:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689856060; x=1721392060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ZGiXBA7knMeVbYBzBnYdJHrkPeF9rSCMSWxNZrS0q0=;
  b=Jik4d0glmPZqqj9uvobN8MXllmF1WkPy8TRSOIt7pw/FG3X73nYH9TQu
   t3Np4Rhjdvb5bPM2LQtwg+lCUP4DO+ofYKVaxOqAaSYRKC7zi8u6yhNe7
   QHuAwAQt68q9zE+/9vb4gZ68FtIwJgIX+VrEsQRIVIdMY87EGRGjvzPrz
   ZPEfRt+nChW6FtcCJ+eTbqk0eMl/xrVON2hvMsT2CBYJgx191LgMvcBnF
   N4H8Hnw7yIsN35lVy4ueQn+L2lZRkZ4vBRNptvzBMizQic2PQJibxzgz9
   1hK/flZWInwsuRJ5whuUhM3wE4X0SaxEsiJM1o/RtbwNnHZ44UtBFcv4J
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="asc'?scan'208";a="224927705"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2023 05:27:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 20 Jul 2023 05:27:31 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 20 Jul 2023 05:27:27 -0700
Date: Thu, 20 Jul 2023 13:26:54 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 4/9] PCI: microchip: Move PCIe driver to PLDA directory
Message-ID: <20230720-exception-spectator-b48ecb9d4c39@wendy>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-5-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230719102057.22329-5-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_052739_503548_FBD32274 
X-CRM114-Status: UNSURE (   8.41  )
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
Content-Type: multipart/mixed; boundary="===============8041049231488028757=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8041049231488028757==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lilo/J5IxQgX/2YQ"
Content-Disposition: inline

--Lilo/J5IxQgX/2YQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Minda,

On Wed, Jul 19, 2023 at 06:20:52PM +0800, Minda Chen wrote:
> Move Microchip specific platform codes to PLDA directory.
> Including clock init, interrupt event handle and platform
> init codes.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Something else that I noticed, looking at what is not in the diff here,
but is everything under the "/* PCIe Controller Phy Regs */" comment
that remains in the microchip driver not also common to the plda IP?

Thanks,
Conor.

--Lilo/J5IxQgX/2YQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLkoDgAKCRB4tDGHoIJi
0vX+AQCNRNQvcPAT0vcVJXASNscuAioQvT52F/KhEUDLy/SoSAEA6U+2742WoaFO
H9PBHMPTzScdWPvpyEsWaGVXPs7Z+gc=
=rUDs
-----END PGP SIGNATURE-----

--Lilo/J5IxQgX/2YQ--


--===============8041049231488028757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8041049231488028757==--

