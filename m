Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E46CCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSpK1gZPDedxBVMq7cdbnycYvIsoa9QNxt5zbsulvG4=; b=bwLybh9WFEPtxGXq/Ic/X3UVYk
	L7EW4k0ItouG0hvggwsV9XdFKis3xQ0XOijcgdnUyoFomY4dDbxzX/iapXpcll70ahFika8VQMq5K
	bHMKpSo+87TTPD7QbRK0wx3kezNNYuliRIegKESv/Y7sjQowf0i5+/rXL9QmOD8dg8orJ87XEnSc/
	2KzP/eB4g61+bRutQQK12JzR6VGfnThZ/VYl1p4R5r5MOErxoNx1dL3mKCCe6ws12RDupfjsyjFvR
	GCEj0Q8Lo4vDt0iNjuKAOPIbEhp1/83jud0m1GgCAl18Xst5hMZSiOqA1qR5Fonw5GMBFBWdmhrhF
	Wa6kIXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NJu-0000000EA6Q-1gMa;
	Mon, 13 Oct 2025 18:30:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NJs-0000000EA64-2Rg9
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 18:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 063C661D11;
	Mon, 13 Oct 2025 18:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86168C4CEE7;
	Mon, 13 Oct 2025 18:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760380221;
	bh=DQQ6OBr2524+qZB672GSzrUccJmaXhbWsh5xplRUxZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rqn9IlqgfeldlIBto2PijJ0hKPkB5Tz/7lpv+p+BEac8+AkDi6Xq7ORyv67/TGA3K
	 d9Pu9seNioMricGO54V5H7i773NG1SfdgctmHcNuoOIx2pRQNSz6fscnrsPTBH5u6B
	 ZmzTuP2KHJ4J+irZBd/UfOesMGjOLEozy03uQ2JhvQ8Rne2eEvaMZTI8s6yqpwsXlh
	 plgxUb5Xy8/pmejhxQQ+1jbyB88INzOsP6mdtz3z4m89zEmUS1kyPD1LE0AZ/6tmSv
	 3IAoBg+YaA27SH8y/sYJNBIV7dJ2acBaK+lkeggxxK76uCUNyl43Xv1d9q0Ps+mwV5
	 COJTaTrsndliQ==
Date: Mon, 13 Oct 2025 19:30:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Zampieri <lzampier@redhat.com>
Cc: linux-kernel@vger.kernel.org, Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>, linux-riscv@lists.infradead.org,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>
Subject: Re: [PATCH v2 3/3] irqchip/plic: add support for UltraRISC DP1000
 PLIC
Message-ID: <20251013-trimness-stainless-48343053f204@spud>
References: <20251013111539.2206477-1-lzampier@redhat.com>
 <20251013111539.2206477-4-lzampier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251013111539.2206477-4-lzampier@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1916571765534224832=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1916571765534224832==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fCaikIoT7Zs8h/ij"
Content-Disposition: inline


--fCaikIoT7Zs8h/ij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 12:15:38PM +0100, Lucas Zampieri wrote:
> From: Charles Mirabile <cmirabil@redhat.com>
>=20
> Add a new compatible for the plic found in UltraRISC DP1000 with a quirk =
to
> work around a known hardware bug with IRQ claiming.
>=20
> When claiming an interrupt on the DP1000 PLIC all other interrupts must be
> disabled before the claim register is accessed to prevent incorrect
> handling of the interrupt.
>=20
> When the PLIC_QUIRK_CLAIM_REGISTER is present, during plic_handle_irq
> the enable state of all interrupts is saved and then all interrupts
> except for the first pending one are disabled before reading the claim
> register. The interrupts are then restored before further processing of
> the claimed interrupt continues.
>=20
> The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
> SoCs using UR-CP100 cores, regardless of the specific SoC implementation.

Why is that? I expect that you're doing that intentionally given the
ultrarisc employee listed as a co-developer, but with only one SoC using
this IP core it seems possible that this bug in the hardware could be
fixed for other SoCs that are built using this IP core.
Is there a plan to, for example, change the core version to UR-CP101
when the bug is fixed?

Thanks,
Conor.

> This has no impact on other platforms.
>=20
> Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 83 ++++++++++++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifi=
ve-plic.c
> index 9c4af7d58846..a7b51a925e96 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -49,6 +49,8 @@
>  #define CONTEXT_ENABLE_BASE		0x2000
>  #define     CONTEXT_ENABLE_SIZE		0x80
>=20
> +#define PENDING_BASE                    0x1000
> +
>  /*
>   * Each hart context has a set of control registers associated with it. =
 Right
>   * now there's only two: a source priority threshold over which the hart=
 will
> @@ -63,6 +65,7 @@
>  #define	PLIC_ENABLE_THRESHOLD		0
>=20
>  #define PLIC_QUIRK_EDGE_INTERRUPT	0
> +#define PLIC_QUIRK_CLAIM_REGISTER	1
>=20
>  struct plic_priv {
>  	struct fwnode_handle *fwnode;
> @@ -367,6 +370,82 @@ static const struct irq_domain_ops plic_irqdomain_op=
s =3D {
>  	.free		=3D irq_domain_free_irqs_top,
>  };
>=20
> +static bool dp1000_isolate_pending_irq(int nr_irq_groups, u32 ie[],
> +				       void __iomem *pending,
> +				       void __iomem *enable)
> +{
> +	u32 pending_irqs =3D 0;
> +	int i, j;
> +
> +	/* Look for first pending interrupt */
> +	for (i =3D 0; i < nr_irq_groups; i++) {
> +		pending_irqs =3D ie[i] & readl(pending + i * sizeof(u32));
> +		if (pending_irqs)
> +			break;
> +	}
> +
> +	if (!pending_irqs)
> +		return false;
> +
> +	/* Disable all interrupts but the first pending one */
> +	for (j =3D 0; j < nr_irq_groups; j++) {
> +		u32 new_mask =3D 0;
> +
> +		if (j =3D=3D i)
> +			/* Extract mask with lowest set bit */
> +			new_mask =3D (pending_irqs & -pending_irqs);
> +
> +		writel(new_mask, enable + j * sizeof(u32));
> +	}
> +
> +	return true;
> +}
> +
> +static irq_hw_number_t dp1000_get_hwirq(struct plic_handler *handler,
> +					void __iomem *claim)
> +{
> +	void __iomem *enable =3D handler->enable_base;
> +	void __iomem *pending =3D handler->priv->regs + PENDING_BASE;
> +	int nr_irqs =3D handler->priv->nr_irqs;
> +	int nr_irq_groups =3D DIV_ROUND_UP(nr_irqs, 32);
> +	int i;
> +	u32 ie[32] =3D { 0 };
> +	irq_hw_number_t hwirq =3D 0;
> +
> +	raw_spin_lock(&handler->enable_lock);
> +
> +	/* Save current interrupt enable state */
> +	for (i =3D 0; i < nr_irq_groups; i++)
> +		ie[i] =3D readl(enable + i * sizeof(u32));
> +
> +	if (!dp1000_isolate_pending_irq(nr_irq_groups, ie, pending, enable))
> +		goto out;
> +
> +	hwirq =3D readl(claim);
> +
> +	/* Restore previous state */
> +	for (i =3D 0; i < nr_irq_groups; i++)
> +		writel(ie[i], enable + i * sizeof(u32));
> +out:
> +	raw_spin_unlock(&handler->enable_lock);
> +	return hwirq;
> +}
> +
> +static irq_hw_number_t plic_get_hwirq(struct plic_handler *handler,
> +				      void __iomem *claim)
> +{
> +	/*
> +	 * Due to a hardware bug in the implementation of the claim register
> +	 * in the UltraRISC DP1000 platform, other interrupts must be disabled
> +	 * before reading the claim register and restored afterwards.
> +	 */
> +
> +	if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
> +		return dp1000_get_hwirq(handler, claim);
> +
> +	return readl(claim);
> +}
> +
>  /*
>   * Handling an interrupt is a two-step process: first you claim the inte=
rrupt
>   * by reading the claim register, then you complete the interrupt by wri=
ting
> @@ -384,7 +463,7 @@ static void plic_handle_irq(struct irq_desc *desc)
>=20
>  	chained_irq_enter(chip, desc);
>=20
> -	while ((hwirq =3D readl(claim))) {
> +	while ((hwirq =3D plic_get_hwirq(handler, claim))) {
>  		int err =3D generic_handle_domain_irq(handler->priv->irqdomain,
>  						    hwirq);
>  		if (unlikely(err)) {
> @@ -432,6 +511,8 @@ static const struct of_device_id plic_match[] =3D {
>  	  .data =3D (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>  	{ .compatible =3D "thead,c900-plic",
>  	  .data =3D (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
> +	{ .compatible =3D "ultrarisc,cp100-plic",
> +	  .data =3D (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
>  	{}
>  };
>=20
> --
> 2.51.0
>=20

--fCaikIoT7Zs8h/ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO1FOQAKCRB4tDGHoIJi
0ivUAQD/Pb15fC2TzJvig9NwYEzMS6COdO2rFEosfel5YRSh/wEAjfmALZ82Zu5t
ZRfxApD3LqaW+Tx/zWBhztMPJKaxtwI=
=4Tzv
-----END PGP SIGNATURE-----

--fCaikIoT7Zs8h/ij--


--===============1916571765534224832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1916571765534224832==--

