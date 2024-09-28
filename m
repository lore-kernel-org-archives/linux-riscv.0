Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A562BCF649A
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Sep 2024 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3o6wbQnqFsFGiv4r+IHmIvgD/mXrDqODJkwSeDqOe3Y=; b=SlPHW7Ao8itDZY
	4efqhl1Wjh6TmQaX+NVrXPlaeyOo6xqQQyXrh7da06uKLkYKWQm9RE2i7lRhCfMgbvKR9iTae4ihL
	ulMYVjC0cut/m03wfxt6VcvCFQV4w6x7xR5hFjMiLUNzoJWWu19Oe0QPBCuRDk6XskWAyhSisn4TS
	6CpyF/FxRytjzGnbqZCtcSGAOxAzSqGio2urz7D1jmgNwPrqGb4QMt/cg6IT7avDEI3RFKJaCTbtK
	l23Spaf6iMgLy8FExXRwAY4ot0ZAL95GfFcOWg3LV1G8Wcifch6LxTAUvv6YaUpfIZlGoreqx/FYO
	069PkBlj6ovd4WryZk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suSO1-0000000CmcX-2HO5;
	Sat, 28 Sep 2024 08:01:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suSNy-0000000Cmc2-2b7e
	for linux-riscv@lists.infradead.org;
	Sat, 28 Sep 2024 08:01:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC6C85C05AD;
	Sat, 28 Sep 2024 08:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF4FC4CEC3;
	Sat, 28 Sep 2024 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727510461;
	bh=qlJzuJRE9Sn5Kw0Zcfet8Sxavy9TJ8gtErUmJx8vCWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IrLubET93T+OXdMS+LoTOq9d2NZJU3b2Ekbwwegi5ck8RcOUrkEYa/shXTDNXFHzY
	 kv5kwXB6ckx/1fOia+/RgM+36ztyPZVU+lK+839m3CfsMBnWWqbHBJ5gpCK9+wDP47
	 u1cG4xJ530oF/FRmw1ehW/Q6sEDPvTtMvGJnzq1FoQZsX6cIQaHQ5PlHNz7BC/FnQL
	 PGjtN26mCMfRnkM4OlvFSRlvDGqYbRxGmmRI4NtTBNMPofUX57pkvmFJAF7a2pknxu
	 Ji+6RrreaGryF4gzKRarRbTvmeku7mqftNHBh8MvHZhaapD/IJSkGB+JCj53nWPACx
	 hK5eRuNfjjrLQ==
Date: Sat, 28 Sep 2024 10:00:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	m.szyprowski@samsung.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] mailbox: Introduce support for T-head TH1520
 Mailbox driver
Message-ID: <vgnd5fbapw2hhjbbtzcmxikzprbnzo6m7dr6tqh7n4yepdlmyd@hs7lkieqtshk>
References: <20240927094207.1650085-1-m.wilczynski@samsung.com>
 <CGME20240927094214eucas1p272cf99b40344f501cbbfaa91c929c709@eucas1p2.samsung.com>
 <20240927094207.1650085-2-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240927094207.1650085-2-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_010102_781957_3F07EA74 
X-CRM114-Status: GOOD (  29.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 27, 2024 at 11:42:05AM +0200, Michal Wilczynski wrote:
> This driver was tested using the drm/imagination GPU driver. It was able
> to successfully power on the GPU, by passing a command through mailbox
> from E910 core to E902 that's responsible for powering up the GPU. The
> GPU driver was able to read the BVC version from control registers,
> which confirms it was successfully powered on.
> 
> [   33.957467] powervr ffef400000.gpu: [drm] loaded firmware
> powervr/rogue_36.52.104.182_v1.fw
> [   33.966008] powervr ffef400000.gpu: [drm] FW version v1.0 (build
> 6621747 OS)
> [   38.978542] powervr ffef400000.gpu: [drm] *ERROR* Firmware failed to
> boot
> 
> Though the driver still fails to boot the firmware, the mailbox driver
> works when used with the not-yet-upstreamed firmware AON driver. There
> is ongoing work to get the BXM-4-64 supported with the drm/imagination
> driver [1], though it's not completed yet.
> 
> This work is based on the driver from the vendor kernel [2].
> 
> Link: https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/2 [1]
> Link: https://github.com/revyos/thead-kernel.git [2]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                      |   1 +
>  drivers/mailbox/Kconfig          |  10 +
>  drivers/mailbox/Makefile         |   2 +
>  drivers/mailbox/mailbox-th1520.c | 551 +++++++++++++++++++++++++++++++
>  4 files changed, 564 insertions(+)
>  create mode 100644 drivers/mailbox/mailbox-th1520.c

...

> +static int th1520_mbox_startup(struct mbox_chan *chan)
> +{
> +	struct th1520_mbox_priv *priv = to_th1520_mbox_priv(chan->mbox);
> +	struct th1520_mbox_con_priv *cp = chan->con_priv;
> +	u32 data[8] = {};
> +	int mask_bit;
> +	int ret;
> +
> +	/* clear local and remote generate and info0~info7 */
> +	th1520_mbox_chan_rmw(cp, TH_1520_MBOX_GEN, 0x0, 0xff, true);
> +	th1520_mbox_chan_rmw(cp, TH_1520_MBOX_GEN, 0x0, 0xff, false);
> +	th1520_mbox_chan_wr_ack(cp, &data[7], true);
> +	th1520_mbox_chan_wr_ack(cp, &data[7], false);
> +	th1520_mbox_chan_wr_data(cp, &data[0], true);
> +	th1520_mbox_chan_wr_data(cp, &data[0], false);
> +
> +	/* enable the chan mask */
> +	mask_bit = th1520_mbox_chan_id_to_mapbit(cp);
> +	th1520_mbox_rmw(priv, TH_1520_MBOX_MASK, BIT(mask_bit), 0);
> +
> +	if (cp->type == TH_1520_MBOX_TYPE_DB)
> +		/* tx doorbell doesn't have ACK, rx doorbell requires isr */
> +		tasklet_init(&cp->txdb_tasklet, th1520_mbox_txdb_tasklet,
> +			     (unsigned long)cp);
> +
> +	ret = request_irq(priv->irq, th1520_mbox_isr,
> +			  IRQF_SHARED | IRQF_NO_SUSPEND, cp->irq_desc, chan);

Mixing devm- and non-devm with shared interrupts is error-prone (or even
discouraged). Your code looks here correct, but probably this deserves
a comment that you investigated the path and it is not possible to
trigger interrupt from another device while device is unbound.

> +	if (ret) {
> +		dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->irq);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void th1520_mbox_shutdown(struct mbox_chan *chan)
> +{
> +	struct th1520_mbox_priv *priv = to_th1520_mbox_priv(chan->mbox);
> +	struct th1520_mbox_con_priv *cp = chan->con_priv;
> +	int mask_bit;
> +
> +	/* clear the chan mask */
> +	mask_bit = th1520_mbox_chan_id_to_mapbit(cp);
> +	th1520_mbox_rmw(priv, TH_1520_MBOX_MASK, 0, BIT(mask_bit));
> +
> +	free_irq(priv->irq, chan);

Odd order. This should be reverse order from startup. Why is it not?

> +}
> +
> +static const struct mbox_chan_ops th1520_mbox_ops = {
> +	.send_data = th1520_mbox_send_data,
> +	.startup = th1520_mbox_startup,
> +	.shutdown = th1520_mbox_shutdown,
> +};
> +
> +static int th1520_mbox_init_generic(struct th1520_mbox_priv *priv)
> +{
> +#ifdef CONFIG_PM_SLEEP
> +	priv->ctx = devm_kzalloc(priv->dev, sizeof(*priv->ctx), GFP_KERNEL);
> +	if (!priv->ctx)
> +		return -ENOMEM;
> +#endif
> +	/* Set default configuration */
> +	th1520_mbox_write(priv, 0xff, TH_1520_MBOX_CLR);
> +	th1520_mbox_write(priv, 0x0, TH_1520_MBOX_MASK);
> +	return 0;
> +}
> +
> +static struct mbox_chan *th1520_mbox_xlate(struct mbox_controller *mbox,
> +					  const struct of_phandle_args *sp)
> +{
> +	struct th1520_mbox_priv *priv = to_th1520_mbox_priv(mbox);
> +	struct th1520_mbox_con_priv *cp;
> +	u32 chan, type;
> +
> +	if (sp->args_count != 2) {
> +		dev_err(mbox->dev, "Invalid argument count %d\n",
> +			sp->args_count);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	chan = sp->args[0]; /* comm remote channel */
> +	type = sp->args[1]; /* comm channel type */
> +
> +	if (chan >= mbox->num_chans) {
> +		dev_err(mbox->dev, "Not supported channel number: %d\n", chan);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (chan == priv->cur_icu_cpu_id) {
> +		dev_err(mbox->dev, "Cannot communicate with yourself\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (type > TH_1520_MBOX_TYPE_DB) {
> +		dev_err(mbox->dev, "Not supported the type for channel[%d]\n",
> +			chan);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	cp = mbox->chans[chan].con_priv;
> +	cp->type = type;
> +
> +	return &mbox->chans[chan];
> +}
> +
> +static int th1520_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct th1520_mbox_priv *priv;
> +	struct resource *res;
> +	unsigned int remote_idx = 0;
> +	unsigned int i;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (of_property_read_u32(np, "thead,icu-cpu-id", &priv->cur_icu_cpu_id)) {
> +		dev_err(dev, "thead,icu-cpu-id is missing\n");
> +		return -EINVAL;
> +	}
> +
> +	if (priv->cur_icu_cpu_id != TH_1520_MBOX_ICU_CPU0 &&
> +	    priv->cur_icu_cpu_id != TH_1520_MBOX_ICU_CPU3) {
> +		dev_err(dev, "thead,icu-cpu-id is invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->dev = dev;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "local");
> +	priv->local_icu[TH_1520_MBOX_ICU_CPU0] = devm_ioremap_resource(dev, res);

Use proper wrapper over these two.

> +	if (IS_ERR(priv->local_icu[TH_1520_MBOX_ICU_CPU0]))
> +		return PTR_ERR(priv->local_icu[TH_1520_MBOX_ICU_CPU0]);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "remote-icu0");
> +	priv->remote_icu[0] = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->remote_icu[0]))
> +		return PTR_ERR(priv->remote_icu[0]);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "remote-icu1");
> +	priv->remote_icu[1] = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->remote_icu[1]))
> +		return PTR_ERR(priv->remote_icu[1]);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "remote-icu2");
> +	priv->remote_icu[2] = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->remote_icu[2]))
> +		return PTR_ERR(priv->remote_icu[2]);

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
