Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12EEC04A6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlbqJqTaHdfSW+LaRWkPb8pWpgl9Jiei1jV5enMwNuc=; b=UKrwXGPkaCKcLQT7JUnjQiLsGY
	FUaMJCXxts6E0/pQyA9urCUba6fTAynGu0adCPfmKxINbjgt8JMJPrJ//iYL3PDVOP00DFyo8dA9V
	s4jKwbIUAo431YUZ/R5z12mnt8fhSzd015ufZ2W+DIfug5+Hk49eC43721uZGfefTisp0l/rOSUoh
	tIgrFyHBUb03g6hsZhsnzVXdtmegsY26a3+qZ+ZRWN7Hw7RPZ6rBU3v6RRRroP96vLOmW6OTEPwjP
	BWT5FuVxmET1eFVBDp0UG2OrLW0Us1DUBptsEsomvypxsAAkOMjE6aQpC0+dpvApvY4x9mSImn/Qz
	2cyUQx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVY0c-00HCpm-1x;
	Mon, 14 Aug 2023 13:53:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVY0Y-00HCpL-36
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 13:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692021203; x=1723557203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/0KD1L1RDnuKAhdqbw1tkprSQp/H4jNSydLSzkdaZqk=;
  b=gntor0doiKPsEiVBitZUx6h9vxsqbiu1vWjfXl9ojktPILkWDM2xtBbG
   AuntiDFTqWceSmJFp7F35sh0bxqzD8nz3JYEya9SvmJlvbTebASBQSlki
   eP9p2Ifo3tzSp2xy74afQhYUfta5nPM9A3htOYQTVhOozMaxpy4kn9sIn
   MT69z2cYi7KgyUABSR9pvcDG3JOWUmm5lgUcvVFAgekP4GE53QmS3njiY
   qYqAHfp2uA8ChrHsAnzh7Ec7x91iFd0TSmXPnkomulopUEaHG3svn694h
   wCgPpr5Sww8vZOa3MBCtxvnvm+4f+dmAK2+ShLTfOCURGCub4MZbc8ld5
   A==;
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="asc'?scan'208";a="225313785"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2023 06:53:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 14 Aug 2023 06:52:47 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 14 Aug 2023 06:52:44 -0700
Date: Mon, 14 Aug 2023 14:52:05 +0100
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
Subject: Re: [PATCH v3 06/11] PCI: plda: Add event interrupt codes and IRQ
 domain ops
Message-ID: <20230814-episode-untidy-c66107a33ea0@wendy>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-7-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230814082016.104181-7-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_065323_076453_86FC046E 
X-CRM114-Status: GOOD (  15.05  )
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
Content-Type: multipart/mixed; boundary="===============7452873796051130496=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7452873796051130496==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y4kxwzWfSP8ufxW9"
Content-Disposition: inline

--Y4kxwzWfSP8ufxW9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 04:20:11PM +0800, Minda Chen wrote:
> For PolarFire implements non-PLDA local interrupt events, most of
> event interrupt process codes can not be re-used. PLDA implements
> new codes and IRQ domain ops like PolarFire.
>=20
> plda_handle_event adds a new IRQ num to event num mapping codes for
> PLDA local event except DMA engine interrupt events. The DMA engine
> interrupt events are implemented by vendors.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 29 +++---
>  drivers/pci/controller/plda/pcie-plda-host.c  | 99 +++++++++++++++++++
>  drivers/pci/controller/plda/pcie-plda.h       | 19 ++++
>  3 files changed, 133 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index c28840315019..b42f1aac3ec3 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -96,20 +96,21 @@
>  #define EVENT_LOCAL_DMA_END_ENGINE_1		12
>  #define EVENT_LOCAL_DMA_ERROR_ENGINE_0		13
>  #define EVENT_LOCAL_DMA_ERROR_ENGINE_1		14
> -#define EVENT_LOCAL_A_ATR_EVT_POST_ERR		15
> -#define EVENT_LOCAL_A_ATR_EVT_FETCH_ERR		16
> -#define EVENT_LOCAL_A_ATR_EVT_DISCARD_ERR	17
> -#define EVENT_LOCAL_A_ATR_EVT_DOORBELL		18
> -#define EVENT_LOCAL_P_ATR_EVT_POST_ERR		19
> -#define EVENT_LOCAL_P_ATR_EVT_FETCH_ERR		20
> -#define EVENT_LOCAL_P_ATR_EVT_DISCARD_ERR	21
> -#define EVENT_LOCAL_P_ATR_EVT_DOORBELL		22
> -#define EVENT_LOCAL_PM_MSI_INT_INTX		23
> -#define EVENT_LOCAL_PM_MSI_INT_MSI		24
> -#define EVENT_LOCAL_PM_MSI_INT_AER_EVT		25
> -#define EVENT_LOCAL_PM_MSI_INT_EVENTS		26
> -#define EVENT_LOCAL_PM_MSI_INT_SYS_ERR		27
> -#define NUM_EVENTS				28
> +#define NUM_MC_EVENTS				15
> +#define EVENT_LOCAL_A_ATR_EVT_POST_ERR		(NUM_MC_EVENTS + EVENT_A_ATR_EVT=
_POST_ERR)
> +#define EVENT_LOCAL_A_ATR_EVT_FETCH_ERR		(NUM_MC_EVENTS + EVENT_A_ATR_EV=
T_FETCH_ERR)
> +#define EVENT_LOCAL_A_ATR_EVT_DISCARD_ERR	(NUM_MC_EVENTS + EVENT_A_ATR_E=
VT_DISCARD_ERR)
> +#define EVENT_LOCAL_A_ATR_EVT_DOORBELL		(NUM_MC_EVENTS + EVENT_A_ATR_EVT=
_DOORBELL)
> +#define EVENT_LOCAL_P_ATR_EVT_POST_ERR		(NUM_MC_EVENTS + EVENT_P_ATR_EVT=
_POST_ERR)
> +#define EVENT_LOCAL_P_ATR_EVT_FETCH_ERR		(NUM_MC_EVENTS + EVENT_P_ATR_EV=
T_FETCH_ERR)
> +#define EVENT_LOCAL_P_ATR_EVT_DISCARD_ERR	(NUM_MC_EVENTS + EVENT_P_ATR_E=
VT_DISCARD_ERR)
> +#define EVENT_LOCAL_P_ATR_EVT_DOORBELL		(NUM_MC_EVENTS + EVENT_P_ATR_EVT=
_DOORBELL)
> +#define EVENT_LOCAL_PM_MSI_INT_INTX		(NUM_MC_EVENTS + EVENT_PM_MSI_INT_I=
NTX)
> +#define EVENT_LOCAL_PM_MSI_INT_MSI		(NUM_MC_EVENTS + EVENT_PM_MSI_INT_MS=
I)
> +#define EVENT_LOCAL_PM_MSI_INT_AER_EVT		(NUM_MC_EVENTS + EVENT_PM_MSI_IN=
T_AER_EVT)
> +#define EVENT_LOCAL_PM_MSI_INT_EVENTS		(NUM_MC_EVENTS + EVENT_PM_MSI_INT=
_EVENTS)
> +#define EVENT_LOCAL_PM_MSI_INT_SYS_ERR		(NUM_MC_EVENTS + EVENT_PM_MSI_IN=
T_SYS_ERR)
> +#define NUM_EVENTS				(NUM_MC_EVENTS + NUM_PLDA_EVENTS)

Is this change not in the wrong patch & should be changed alongside the
movement of defines?=20

--Y4kxwzWfSP8ufxW9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNoxhQAKCRB4tDGHoIJi
0i9LAP4sQcKHRQUviJH9x11dE7n8ONwvAzh2QWhHwntrCc2kcAD+KQ0V/O4R1C50
8jAkUvBTjG95nhERLU8N++0omqA4Fw4=
=J6we
-----END PGP SIGNATURE-----

--Y4kxwzWfSP8ufxW9--


--===============7452873796051130496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7452873796051130496==--

