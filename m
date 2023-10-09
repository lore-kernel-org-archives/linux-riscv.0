Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E921E95A98
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxBxnKnGClF7HNHDgDak6I4Nah0sv350g5ErujieqGc=; b=0SFW+uNXFL36J+RcXoTiXTFJIb
	nId22J4nBeNUTkfVctlPizwI+FCWjBjMQ8R7+GwCxUdm7JhHbdhs13ZzsxiXNPAmzKbxxxAs9XWjn
	TNhYhnjnlUKAwzQxQgaf2+i2MUTomMVe+Uo/uEk++TqDpH3tOuqR+HD7o4obRTvg1Xxsl1Qh7B8Un
	w4txTi4ZYNglmoM2bmBY40+7NAH40iVW8xgZsbZ4trWqUOFBp12RVPsl6GLbJ/i0TfM7diiBXEpl7
	oHE53Ulekx18Ry4NnnZxEpXryrlxzX4TIZXEe1JU2WKwAIkXHIrtcfW3eHLmbBBiq/sObt7Reuy3w
	cqY6hZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqZy-00AqR8-2T;
	Mon, 09 Oct 2023 13:45:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqZv-00AqQi-23
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 13:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696859147; x=1728395147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hz+kfQuBUxxU8Y+PSM82mM39soRTXn/pPst9P6FcQAc=;
  b=KAhj+b69jOrB3cYBgXCz6deQ17cYmWctyrr77fR0xHUbyhZLsYBVJLfv
   D5ax784gc6p6UsXL3FT70vvrz2NGO0HV7hAvizPkPI50A4so+4UeDC984
   VxOg8B0IPGpiEe4M8/u2qCJ/Ot1WpmbJFQN92Nk8SXhpYx0jZSeb5d7xH
   +cZJxHlVbKqTb73dVjsaYQjXczd6e+UEfPsSagzHkRpK+bXzy8kY0PYw3
   JW8coAhmjLMd7GDBH2M+dOdB1CHdnCQX9x0ZJBsldZol5yvcNd57Evrl1
   7COvofZkN100EsH83ZfyvpCrKSYN3XoL859y1I7I7u7sq7+cnGvL+4Qg6
   A==;
X-CSE-ConnectionGUID: MvdzK2qwS7idKzGlgdOLQQ==
X-CSE-MsgGUID: 4j9/r3djQzacLBhdltZ1sA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="asc'?scan'208";a="176448541"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 06:45:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 06:45:46 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 06:45:42 -0700
Date: Mon, 9 Oct 2023 14:45:22 +0100
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
Subject: Re: [PATCH v7 11/19] PCI: microchip: Add request_event_irq()
 callback function
Message-ID: <20231009-darkroom-tantrum-87c8ae61143d@wendy>
References: <20230927100802.46620-1-minda.chen@starfivetech.com>
 <20230927100802.46620-12-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230927100802.46620-12-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_064547_705513_EE846566 
X-CRM114-Status: GOOD (  24.86  )
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
Content-Type: multipart/mixed; boundary="===============3885149005034360426=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3885149005034360426==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TETxY3uZg/QuT+Jz"
Content-Disposition: inline

--TETxY3uZg/QuT+Jz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Sep 27, 2023 at 06:07:54PM +0800, Minda Chen wrote:
> PolarFire register 28 interrupts symbols name.
> PLDA just reguster 13 interrupts, it is not require to
> register symbol name. So add a callback functions
> to support StarFive and Microchip platforms.

I'm not really sure how the number of interrupts relates to whether or
not symbol names need to be registered.

The code itself (again) seems okay to me, but I think this commit
message doesn't really explain the rationale behind the patch to someone
who is not really familiar with the interrupt handling here.

Thanks,
Conor.

>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 25 ++++++++++++++++---
>  drivers/pci/controller/plda/pcie-plda.h       |  5 ++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index d9dd63084e2b..e3c7d5e66150 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -798,6 +798,17 @@ static int mc_pcie_init_clks(struct device *dev)
>  	return 0;
>  }
> =20
> +static int mc_request_event_irq(struct plda_pcie_rp *plda, int event_irq,
> +				int event)
> +{
> +	return devm_request_irq(plda->dev, event_irq, mc_event_handler,
> +				0, event_cause[event].sym, plda);
> +}
> +
> +static const struct plda_event mc_event =3D {
> +	.request_event_irq      =3D mc_request_event_irq,
> +};
> +
>  static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
>  {
>  	struct device *dev =3D port->dev;
> @@ -897,7 +908,9 @@ static void mc_disable_interrupts(struct mc_pcie *por=
t)
>  	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);
>  }
> =20
> -static int plda_init_interrupts(struct platform_device *pdev, struct pld=
a_pcie_rp *port)
> +static int plda_init_interrupts(struct platform_device *pdev,
> +				struct plda_pcie_rp *port,
> +				const struct plda_event *event)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	int irq;
> @@ -921,8 +934,12 @@ static int plda_init_interrupts(struct platform_devi=
ce *pdev, struct plda_pcie_r
>  			return -ENXIO;
>  		}
> =20
> -		ret =3D devm_request_irq(dev, event_irq, mc_event_handler,
> -				       0, event_cause[i].sym, port);
> +		if (event->request_event_irq)
> +			ret =3D event->request_event_irq(port, event_irq, i);
> +		else
> +			ret =3D devm_request_irq(dev, event_irq, plda_event_handler,
> +					       0, NULL, port);
> +
>  		if (ret) {
>  			dev_err(dev, "failed to request IRQ %d\n", event_irq);
>  			return ret;
> @@ -976,7 +993,7 @@ static int mc_platform_init(struct pci_config_window =
*cfg)
>  		return ret;
> =20
>  	/* Address translation is up; safe to enable interrupts */
> -	ret =3D plda_init_interrupts(pdev, &port->plda);
> +	ret =3D plda_init_interrupts(pdev, &port->plda, &mc_event);
>  	if (ret)
>  		return ret;
> =20
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/contro=
ller/plda/pcie-plda.h
> index 5b09ffed623c..4e0712c9365e 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -153,6 +153,11 @@ struct plda_pcie_rp {
>  	int num_events;
>  };
> =20
> +struct plda_event {
> +	int (*request_event_irq)(struct plda_pcie_rp *pcie,
> +				 int event_irq, int event);
> +};
> +
>  irqreturn_t plda_event_handler(int irq, void *dev_id);
>  void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
>  			    phys_addr_t axi_addr, phys_addr_t pci_addr,
> --=20
> 2.17.1
>=20

--TETxY3uZg/QuT+Jz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSQD8gAKCRB4tDGHoIJi
0ldRAQDzgq28nzRuO+EiOuhzCjCVyftsf9FeS4NQ3NABSGb6SgEAun1KAHB3xnBc
Y8Btcb2v4FSvG1XghK7y3x1KzvMmkAE=
=mdQF
-----END PGP SIGNATURE-----

--TETxY3uZg/QuT+Jz--


--===============3885149005034360426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3885149005034360426==--

