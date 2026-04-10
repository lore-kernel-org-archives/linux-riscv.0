Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EDBF459EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHZSJkLhivBI5SJraly/U8wvFdMBaKchUgnf5S2hc1o=; b=CXg8NDW2dOC5MsN7+Qz0E9cRdJ
	FNC+9U26rZqfv8cO7BtZKdGWs43rxCwG6FZgZjtolo5d/CK7N44YZpWZknwKNYigcPL58nah7+ngR
	2Nj/7jEgFv+muZfBH6sVfltHEXlMmOVQr274wSw8yljUrzBEM1JBgY6F4oSYTsYvU4ugeAhZprSMW
	/h8XB67oTqnZb6Rr9WwQf4ItDAdKAqN316ase8+npE3ab/rEgWdPKkMtxeEajRFPWqlmh5oef8IsE
	QD5iv2NODFsDMDu+vuP6gr3tfhskSGIORAeOUBWZOgXDo1G8J8gp8I/8Ygr6WoQmRMzZlnkvJ2zlH
	tOq2gL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBES3-0000000CWFu-2RN8;
	Fri, 10 Apr 2026 16:11:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBES1-0000000CWFY-2e16
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 16:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41DF543E78;
	Fri, 10 Apr 2026 16:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8455C19421;
	Fri, 10 Apr 2026 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775837481;
	bh=6ywWy6DPRk7+h0RyeGTRliH2Flx/nz1qZaA/Em5pnB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxNX0NIpIpiSkOF38tS/vr5i8gH+tKycbKH+b2jDtGloBbwhyBmClxxKH9B1meYIP
	 g3S0dZ/MMudxmN1T71w4LjoPUBorTsc0ZGXhBTf6G1sHpup5q2zXxBgfQsokxROwJF
	 KrV9VrvaEhS+9M0BhJ/psdK+H+Bnenxw58AJJTpHPIa3f8cN92XY8bxt1uPODpYVHK
	 f42dGWab0dYB6Gm26Rdv4viYZ2Hf1QXc7GLGK+g816XLZLefgER8NC75wp0qe/VeRJ
	 55xoSz1wcWkITGLmn4u0YWiKpVPZ+PQUKvEm7qlBuhImNThYQnQ19iDBro2a2C/Ma1
	 8bnhx7RUzeLFA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 909B21AC58B9; Fri, 10 Apr 2026 17:11:18 +0100 (BST)
Date: Fri, 10 Apr 2026 17:11:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v8 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
Message-ID: <adkhJhEQIZHgIQpH@sirena.co.uk>
References: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
 <20260410-spi-spacemit-k1-v8-2-53ebb48a4146@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260410-spi-spacemit-k1-v8-2-53ebb48a4146@riscstar.com>
X-Cookie: You will be divorced within a year.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_091121_733906_9B04EF33 
X-CRM114-Status: GOOD (  24.83  )
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
Content-Type: multipart/mixed; boundary="===============5144981078306190211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5144981078306190211==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mMqcETBJi9wtUPjh"
Content-Disposition: inline


--mMqcETBJi9wtUPjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 11:04:21PM -0400, Guodong Xu wrote:
>=20
> This patch introduces the driver for the SPI controller found in the
> SpacemiT K1 SoC.  Currently the driver supports master mode only.
> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
> supports both PIO and DMA mode transfers.

> +static struct dma_async_tx_descriptor *
> +k1_spi_dma_prep(struct k1_spi_driver_data *drv_data,
> +		struct spi_transfer *transfer, bool tx)
> +{
> +	phys_addr_t addr =3D drv_data->base_addr + SSP_DATAR;
> +	u32 burst_size =3D K1_SPI_THRESH * drv_data->bytes;
> +	struct dma_slave_config cfg =3D { };
> +	enum dma_transfer_direction dir;
> +	enum dma_slave_buswidth width;
> +	struct dma_chan *chan;
> +	struct sg_table *sgt;
> +
> +	width =3D drv_data->bytes =3D=3D 1 ? DMA_SLAVE_BUSWIDTH_1_BYTE :
> +		drv_data->bytes =3D=3D 2 ? DMA_SLAVE_BUSWIDTH_2_BYTES :
> +		/* bytes =3D=3D 4 */       DMA_SLAVE_BUSWIDTH_4_BYTES;

Please use normal conditional statements (in this case a case statement)
to keep the code legible.

> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
> +{
> +	struct k1_spi_driver_data *drv_data =3D dev_id;
> +	u32 val;

> +	/* Return immediately if we're not expecting any interrupts */
> +	if (!drv_data->transfer)
> +		return IRQ_NONE;

That does't mean the hardware agrees!

> +	/* Get status and clear pending interrupts; all are handled below */
> +	val =3D readl(drv_data->base + SSP_STATUS);
> +	writel(val, drv_data->base + SSP_STATUS);

Nothing after here can report IRQ_NONE, even if SSP_STATUS didn't flag
anything.  I'd just move the checks for transfer to when we're handling
FIFOs and have the IRQ_NONE report be based on there being something set
in the ISR.

> +	/*
> +	 * For SPI, bytes are transferred in both directions equally, and
> +	 * RX always follows TX.  Start by writing if there is anything to
> +	 * write, then read.  Once there's no more to read, we're done.
> +	 */
> +	if (drv_data->tx_resid && (val & SSP_STATUS_TNF)) {
> +		/* If we finish writing, disable TX interrupts */
> +		if (k1_spi_write(drv_data, val)) {
> +			val =3D SSP_INT_EN_RX | SSP_INT_EN_ERROR;
> +			writel(val, drv_data->base + SSP_INT_EN);
> +		}
> +	}

This overwrites val...

> +
> +	/* We're not done unless we've read all that was requested */
> +	if (drv_data->rx_resid) {
> +		/* Read more if there FIFO is not empty */
> +		if (val & SSP_STATUS_RNE)
> +			if (k1_spi_read(drv_data, val))
> +				goto done;

=2E..so the read won't see that there's data to read and we'll need
another interrupt.  I would suggest using a more meaingful name for the
actual interrupt status.

--mMqcETBJi9wtUPjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnZISUACgkQJNaLcl1U
h9A2Tgf7B2Of1h7VKFoheYpdDXTd76daIJkw059x63Qz69BDTzeal71jnJzDc0Oh
d4UKQXLnzn5cguF8GIR8w5Hl1R9tc59DdM0rZ085q0ABgA+5JGtCS1qzIFwp/53p
+LZBefeQPmmS++HkTi4h2N3rLN85ZcEY6oURIjjO2UGJ7SYnZH2rSBeTmRdDZufx
8iqqlry7hdeamly3M+wrQ2V3QIbjjWucrU5cU9c3r+cAfiEtT0i3vpG5RarIUcHW
CpWFPe+J+H09mOvtJboJ+g/BdbOG47iwtTcrGcJ8nQ9MbBpBjGRcjGJdu1SP2cHU
vJ7C9bL822LrGXMn4db9LTx5Lg/RMg==
=ZICv
-----END PGP SIGNATURE-----

--mMqcETBJi9wtUPjh--


--===============5144981078306190211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5144981078306190211==--

