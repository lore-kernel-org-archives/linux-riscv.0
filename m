Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E373C001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsft6znaiXv2ArN3hzpE7GfmdoX3yjXqtejfU7n5dT8=; b=JaUuFmgDLxAesSSFRKyEco52rw
	bu++CIYq7AWKe8yDdCVpxPfDDVPveXNxlOHMjSXwyw9+YCPaAbvSvZmE8ZGofxSHZ6PKwcbPdxgyr
	xlKkrOJURLGve1yWgNrZqWlm92IjxbLZ/Yp9HHVLe9ThuvasDB840RU4ruYTVe9IfkpRmSDc8rmsT
	jzBFnpJxVjmUS0Q+yIiChXNXrZmLVT3gbzqjB4Ns2Rj4IwxaDewCyMLuSei/RcMXXUiTSbs+RiJLq
	dzDNcNQX/kMpibboS0Mrep8ZytPHoPf1L7WP2fIzYgdovKtuXNQNm+pDSNyNHqK6SbiOEMGMpsGAo
	6jQcAk9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXqe-00HBpW-2U;
	Mon, 14 Aug 2023 13:43:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXqb-00HBoU-1D
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 13:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692020585; x=1723556585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3RJki/UyBhVD4cEMr5FQ7PWWAd+xOqV2/EbyzQNzzuY=;
  b=CP5rEIQCpGrfFmA+69R0x6vb9iGMZmsJByMaNZW01WtMKgGtUw0XhuyM
   P5WsSKj+HDFCju+bxfS/dwz/Nlxzpya9T96gNR/XgYsLIqNrSdP7NU5hf
   vxOStIkSxnoDvLHysi2+MvtDvum62FDAHBwsa7vhAX7RhOUG45qTCAZJA
   +RDGFyBxnA6lLzgYEjWZ/9cN8BtZeyp3MIbvagpDQK/SC3z2IFct/gHn6
   kgVEc2KzKWx+nPAOS9sVAC6C0gyzGJcfXALiEvs1ujibPk0R4f8rCM6JZ
   T79mFu8VYrqOUN+49yNYqXdT5gbtYQhuElMEgz9snhTfUhXUlhlOHsMoJ
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="asc'?scan'208";a="241510632"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2023 06:43:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 14 Aug 2023 06:43:04 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 14 Aug 2023 06:43:00 -0700
Date: Mon, 14 Aug 2023 14:42:21 +0100
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
Subject: Re: [PATCH v3 04/11] PCI: microchip: Rename data structure and
 functions
Message-ID: <20230814-earshot-batting-607d70ccc051@wendy>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-5-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230814082016.104181-5-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_064305_439271_B0E76511 
X-CRM114-Status: GOOD (  17.67  )
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
Content-Type: multipart/mixed; boundary="===============5732180805051245142=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5732180805051245142==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RnUNCLF+ofFKLsLa"
Content-Disposition: inline

--RnUNCLF+ofFKLsLa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 04:20:09PM +0800, Minda Chen wrote:
> Rename mc_* to plda_* for common data structures,
> setup and IRQ functions.
>=20
> The modification includes:
> - Add related data structures of PCIe host instance.
>   mc_pcie --> plda_pcie_rp (Get most of data members)
>   mc_msi  --> plda_msi
> - function rename list:
>   mc_pcie_setup_window     --> plda_pcie_setup_window
>   mc_pcie_setup_windows    --> plda_pcie_setup_iomems
>   mc_allocate_msi_domains  --> plda_allocate_msi_domains
>   MSI interrupts related functions and IRQ domain
>   (primary function is mc_handle_msi):
>   mc_handle_msi            --> plda_handle_msi
>   INTx interrupts related functions and IRQ domain
>   (primary function is mc_handle_intx):
>   mc_handle_intx           --> plda_handle_intx
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 216 ++++++++----------
>  drivers/pci/controller/plda/pcie-plda.h       |  20 ++
>  2 files changed, 120 insertions(+), 116 deletions(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index 5ab11741f406..e25459f34891 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -21,9 +21,6 @@
>  #include "../../pci.h"
>  #include "pcie-plda.h"
> =20
> -/* Number of MSI IRQs */
> -#define MC_MAX_NUM_MSI_IRQS			32
> -
>  /* PCIe Bridge Phy and Controller Phy offsets */
>  #define MC_PCIE1_BRIDGE_ADDR			0x00008000u
>  #define MC_PCIE1_CTRL_ADDR			0x0000a000u
> @@ -175,22 +172,9 @@ struct event_map {
>  	u32 event_bit;
>  };
> =20
> -struct mc_msi {
> -	struct mutex lock;		/* Protect used bitmap */
> -	struct irq_domain *msi_domain;
> -	struct irq_domain *dev_domain;
> -	u32 num_vectors;
> -	u64 vector_phy;
> -	DECLARE_BITMAP(used, MC_MAX_NUM_MSI_IRQS);
> -};
> -
>  struct mc_pcie {
> +	struct plda_pcie_rp plda;

I'm not super keen on the "rp"s that've been introduced here and
elsewhere when "port" is what's used all over the shop.
Not a big gripe though, so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--RnUNCLF+ofFKLsLa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNovPQAKCRB4tDGHoIJi
0p3PAQC3LAlrzFZcNKEUSHbTg6enYHF6mQCSbRaaKuQ/dLhhRgEAgRII9idgkq6C
1wdA8wsy+0T0C19t6hlAmb4RkChLAAg=
=44Tv
-----END PGP SIGNATURE-----

--RnUNCLF+ofFKLsLa--


--===============5732180805051245142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5732180805051245142==--

