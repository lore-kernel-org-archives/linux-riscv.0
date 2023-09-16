Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2ABCD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2K9fWbkWsilcJYBZVg/s/+haIVVHuPNBJv6Zz/H3rVQ=; b=AsDzBb6273decjNpZ/1VPBkuMD
	AuugBGRvKrR6f75lzXaZhMupBsYrd3DvcN9aBAVShaYpvW856958bnTpiueADWc357iO3u5m+r477
	MLjOhDQLNW5LQYrbV4rcdYlyyLb8KSnO8vKvzx5Mk4qka7Usz6Fcq1E03RoYKUIx8EOSfcsQa0g2r
	pxHZ6UAeaXpao9fS1paZb647Fj8pOgnPyyWOZOjspMZ90+jLRcgG+Ff5YC2aA+r0PTNDyoccW5aRK
	aQkM7c8qFyY9ZvTrR+J9ie2yvo7BVYfXtMfX+Abb/9hiHBaH+5D1sz+o/oRm7AiRk/tDehY5oIauX
	XjPqBBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhIuU-00BaCh-0y;
	Sat, 16 Sep 2023 00:11:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhIuQ-00BaAY-3C
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:11:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4ABEFB82FE5;
	Sat, 16 Sep 2023 00:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077AEC43395;
	Sat, 16 Sep 2023 00:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694823095;
	bh=dq0gRhkJrXoyD7UZPSlpp03O/GEcsop/t6dIUGgIroQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K73BPAb1o1Q5WMT1Brwxt2fC0w5ujmXrmozlmjmsdA94dt42YoAz8e1DVamkVGIGg
	 832FY7FOq4XLoA32MiQGkadv0D4WLK81VXGw2PvIaMMzO10SNsGjJ622zIqL25m5t5
	 9nf1a0zNW9vX4IYJxFKxYpyyGk+1/D7H8n5zL9V7f1UgCxWN8SOapz0kAIpwO3bdoy
	 UooVVZ41ohMz4ixF7j2McO8ycbBh1Y3sXBZDicANkKem6nKc+Kx9wV7py729GYMcXj
	 OtzmKpt0ksny08DA0wyAl3YKfIwiheS1TezeD/4oSpg28N4FtoaIQe2Q0/b19TV4zz
	 CJ9xA0S44INeA==
Date: Sat, 16 Sep 2023 01:11:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v6 08/19] PCI: plda: Add event interrupt codes and IRQ
 domain ops
Message-ID: <20230916-rescuer-enroll-dd4fb1320676@spud>
References: <20230915102243.59775-1-minda.chen@starfivetech.com>
 <20230915102243.59775-9-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230915102243.59775-9-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_171139_292069_CDF93591 
X-CRM114-Status: GOOD (  25.31  )
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
Content-Type: multipart/mixed; boundary="===============5960284184403104854=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5960284184403104854==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MF1vEsgt7mymeqoW"
Content-Disposition: inline


--MF1vEsgt7mymeqoW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 06:22:32PM +0800, Minda Chen wrote:
> For PolarFire implements non-PLDA local interrupt events, most of
> event interrupt process codes can not be re-used. PLDA implements
> new codes and IRQ domain ops like PolarFire.
>=20
> plda_get_events() adds a new IRQ num to event num mapping codes for
> PLDA local event except DMA engine interrupt events. The DMA engine
> interrupt events are implemented by vendors.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Perhaps not important as they will go away in the next patch, but for
this patch the riscv patchwork stuff noticed:
drivers/pci/controller/plda/pcie-plda-host.c:114:36: warning: unused variab=
le 'plda_evt_dom_ops' [-Wunused-const-variable]
drivers/pci/controller/plda/pcie-plda-host.c:118:36: warning: unused variab=
le 'plda_event_ops' [-Wunused-const-variable]

Cheers,
Conor.

> ---
>  drivers/pci/controller/plda/pcie-plda-host.c | 99 ++++++++++++++++++++
>  drivers/pci/controller/plda/pcie-plda.h      | 33 +++++++
>  2 files changed, 132 insertions(+)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/c=
ontroller/plda/pcie-plda-host.c
> index f0c7636f1f64..f29ff0f00dda 100644
> --- a/drivers/pci/controller/plda/pcie-plda-host.c
> +++ b/drivers/pci/controller/plda/pcie-plda-host.c
> @@ -20,6 +20,105 @@
> =20
>  #include "pcie-plda.h"
> =20
> +irqreturn_t plda_event_handler(int irq, void *dev_id)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +static u32 plda_get_events(struct plda_pcie_rp *port)
> +{
> +	u32 events, val, origin;
> +
> +	origin =3D readl_relaxed(port->bridge_addr + ISTATUS_LOCAL);
> +
> +	/* Error events and doorbell events */
> +	events =3D (origin >> A_ATR_EVT_POST_ERR_SHIFT) & 0xff;
> +
> +	/* INTx events */
> +	if (origin & PM_MSI_INT_INTX_MASK)
> +		events |=3D BIT(EVENT_PM_MSI_INT_INTX);
> +
> +	/* MSI event and sys events */
> +	val =3D (origin >> PM_MSI_INT_MSI_SHIFT) & 0xf;
> +	events |=3D val << EVENT_PM_MSI_INT_MSI;
> +
> +	return events;
> +}
> +
> +static u32 plda_hwirq_to_mask(int hwirq)
> +{
> +	u32 mask;
> +
> +	if (hwirq < EVENT_PM_MSI_INT_INTX)
> +		mask =3D BIT(hwirq + A_ATR_EVT_POST_ERR_SHIFT);
> +	else if (hwirq =3D=3D EVENT_PM_MSI_INT_INTX)
> +		mask =3D PM_MSI_INT_INTX_MASK;
> +	else
> +		mask =3D BIT(hwirq + PM_MSI_TO_MASK_OFFSET);
> +
> +	return mask;
> +}
> +
> +static void plda_ack_event_irq(struct irq_data *data)
> +{
> +	struct plda_pcie_rp *port =3D irq_data_get_irq_chip_data(data);
> +
> +	writel_relaxed(plda_hwirq_to_mask(data->hwirq),
> +		       port->bridge_addr + ISTATUS_LOCAL);
> +}
> +
> +static void plda_mask_event_irq(struct irq_data *data)
> +{
> +	struct plda_pcie_rp *port =3D irq_data_get_irq_chip_data(data);
> +	u32 mask, val;
> +
> +	mask =3D plda_hwirq_to_mask(data->hwirq);
> +
> +	raw_spin_lock(&port->lock);
> +	val =3D readl_relaxed(port->bridge_addr + IMASK_LOCAL);
> +	val &=3D ~mask;
> +	writel_relaxed(val, port->bridge_addr + IMASK_LOCAL);
> +	raw_spin_unlock(&port->lock);
> +}
> +
> +static void plda_unmask_event_irq(struct irq_data *data)
> +{
> +	struct plda_pcie_rp *port =3D irq_data_get_irq_chip_data(data);
> +	u32 mask, val;
> +
> +	mask =3D plda_hwirq_to_mask(data->hwirq);
> +
> +	raw_spin_lock(&port->lock);
> +	val =3D readl_relaxed(port->bridge_addr + IMASK_LOCAL);
> +	val |=3D mask;
> +	writel_relaxed(val, port->bridge_addr + IMASK_LOCAL);
> +	raw_spin_unlock(&port->lock);
> +}
> +
> +static struct irq_chip plda_event_irq_chip =3D {
> +	.name =3D "PLDA PCIe EVENT",
> +	.irq_ack =3D plda_ack_event_irq,
> +	.irq_mask =3D plda_mask_event_irq,
> +	.irq_unmask =3D plda_unmask_event_irq,
> +};
> +
> +static int plda_pcie_event_map(struct irq_domain *domain, unsigned int i=
rq,
> +			       irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_and_handler(irq, &plda_event_irq_chip, handle_level_irq);
> +	irq_set_chip_data(irq, domain->host_data);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops plda_evt_dom_ops =3D {
> +	.map =3D plda_pcie_event_map,
> +};
> +
> +static const struct plda_event_ops plda_event_ops =3D {
> +	.get_events =3D plda_get_events,
> +};
> +
>  void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
>  			    phys_addr_t axi_addr, phys_addr_t pci_addr,
>  			    size_t size)
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/contro=
ller/plda/pcie-plda.h
> index 3deefd35fa5a..32a913d4101f 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -102,6 +102,38 @@
>  #define EVENT_PM_MSI_INT_SYS_ERR		12
>  #define NUM_PLDA_EVENTS				13
> =20
> +/*
> + * PLDA local interrupt register
> + *
> + * 31         27     23              15           7          0
> + * +--+--+--+-+------+-+-+-+-+-+-+-+-+-----------+-----------+
> + * |12|11|10|9| intx |7|6|5|4|3|2|1|0| DMA error | DMA end   |
> + * +--+--+--+-+------+-+-+-+-+-+-+-+-+-----------+-----------+
> + * 0:  AXI post error
> + * 1:  AXI fetch error
> + * 2:  AXI discard error
> + * 3:  AXI doorbell
> + * 4:  PCIe post error
> + * 5:  PCIe fetch error
> + * 6:  PCIe discard error
> + * 7:  PCIe doorbell
> + * 8:  4 INTx interruts
> + * 9:  MSI interrupt
> + * 10: AER event
> + * 11: PM/LTR/Hotplug
> + * 12: System error
> + * DMA error : reserved for vendor implement
> + * DMA end : reserved for vendor implement
> + */
> +
> +#define PM_MSI_TO_MASK_OFFSET			19
> +
> +struct plda_pcie_rp;
> +
> +struct plda_event_ops {
> +	u32 (*get_events)(struct plda_pcie_rp *pcie);
> +};
> +
>  struct plda_msi {
>  	struct mutex lock;		/* Protect used bitmap */
>  	struct irq_domain *msi_domain;
> @@ -120,6 +152,7 @@ struct plda_pcie_rp {
>  	void __iomem *bridge_addr;
>  };
> =20
> +irqreturn_t plda_event_handler(int irq, void *dev_id);
>  void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
>  			    phys_addr_t axi_addr, phys_addr_t pci_addr,
>  			    size_t size);
> --=20
> 2.17.1
>=20

--MF1vEsgt7mymeqoW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQTysQAKCRB4tDGHoIJi
0uu+AP4/FNnCefKntlXj3FGco54xkVXHnqAR+caTOE3c45xdSQEAtxTTb9CrXcVb
hw4PndW9LMDpYwZZc5tsXxenKVWDtwM=
=aNcC
-----END PGP SIGNATURE-----

--MF1vEsgt7mymeqoW--


--===============5960284184403104854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5960284184403104854==--

