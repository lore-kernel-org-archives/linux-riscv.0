Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DB2CA0FFF
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 17:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNnNjSB54ybWCheKyLW8Kv7jJsw9GkxNbmrbVpFmASU=; b=hECoNBZ0QXv6sR
	na02KL/dR9DSlKtzELztp2pqnQsq7xcoMws/8F3NMH8uIdEH7mwgbQ40MFuFr9AdMe/L2qittK1Nz
	DDxJKc4S2DxXbePkqDThZrTLv4XEEWCIQbVojHuBa3/ux9RqVg9ahJICUnbPqwvGqA/8AHyC3ecfo
	9woDp4cMbkts4m6ELjB7B9NmQgWYh/0B9ABdmdKXT+hrw0fy/TzVOv2OC0C7M68U2GM4S2AEPY+9u
	j3eq7pMbPQnzyxbq9+cZ1eLl6jwc2EEdT8kNC62RjNYCSIYhnjlpUoGzCMhLayXpcvahjRCWUFGrU
	YCrqMdCSa4JY+ycCkZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7wW-0000000DO96-0nrq;
	Mon, 01 Sep 2025 17:03:44 +0000
Received: from m16.mail.126.com ([220.197.31.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4il-0000000Ci0T-3YgW
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 13:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=NF
	pR6ok6bqJwalFjFmoTWIfA/y6t00m5bKO/H591X14=; b=PQoAnWOcEmcr5FztZw
	WcLAX/jkwamLGx35GgA2v48m0SmYsd162pfiixVcy8Ps2+B9Bhu5DMeGKJNQXk2/
	dj8LOcsaQFFqjpTzfWR1moIdZQ0/PzZHl+Aeu9XqsgEqbCPF0ZBAOYgO2X3dAXqG
	XHkR0bzlfP0XtsIsttuK6FZow=
Received: from nilq-virtual-machine.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDn72JdobVo9G7cAA--.40462S2;
	Mon, 01 Sep 2025 21:36:31 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: zong.li@sifive.com
Cc: aou@eecs.berkeley.edu,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	will@kernel.org,
	chenruisust@gmail.com
Subject: Re: [RFC PATCH v2 00/10] RISC-V IOMMU HPM and nested IOMMU support
Date: Mon,  1 Sep 2025 21:36:29 +0800
Message-Id: <20250901133629.87310-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614142156.29420-3-zong.li@sifive.com>
References: <20240614142156.29420-3-zong.li@sifive.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDn72JdobVo9G7cAA--.40462S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFW8CFWftF13tryxuw13twb_yoW5GF1DpF
	Z8CrZIkr18JryxJ3W3J3W8CrZ0qan2kFWYvF1fC398Xw4UKrWUWF1DG3yFyrn8GrWDA3W2
	qa1Y9FsxCF15trJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UY9aPUUUUU=
X-Originating-IP: [111.162.127.71]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbiJAW25WiuVI1HCQABsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_063720_251021_AFAACB04 
X-CRM114-Status: GOOD (  21.83  )
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

Hi Zong

Fri, 14 Jun 2024 22:21:48 +0800, Zong Li <zong.li@sifive.com> wrote:

> This patch initialize the pmu stuff and uninitialize it when driver
> removing. The interrupt handling is also provided, this handler need to
> be primary handler instead of thread function, because pt_regs is empty
> when threading the IRQ, but pt_regs is necessary by perf_event_overflow.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/iommu/riscv/iommu.c | 65 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 8b6a64c1ad8d..1716b2251f38 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -540,6 +540,62 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
>   return IRQ_HANDLED;
>  }
>  
> +/*
> + * IOMMU Hardware performance monitor
> + */
> +
> +/* HPM interrupt primary handler */
> +static irqreturn_t riscv_iommu_hpm_irq_handler(int irq, void *dev_id)
> +{
> + struct riscv_iommu_device *iommu = (struct riscv_iommu_device *)dev_id;
> +
> + /* Process pmu irq */
> + riscv_iommu_pmu_handle_irq(&iommu->pmu);
> +
> + /* Clear performance monitoring interrupt pending */
> + riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IPSR, RISCV_IOMMU_IPSR_PMIP);
> +
> + return IRQ_HANDLED;
> +}
> +
> +/* HPM initialization */
> +static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
> +{
> + int rc;
> +
> + if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM))
> +     return 0;
> +
> + /*
> +  * pt_regs is empty when threading the IRQ, but pt_regs is necessary
> +  * by perf_event_overflow. Use primary handler instead of thread
> +  * function for PM IRQ.
> +  *
> +  * Set the IRQF_ONESHOT flag because this IRQ might be shared with
> +  * other threaded IRQs by other queues.
> +  */
> + rc = devm_request_irq(iommu->dev,
> +               iommu->irqs[riscv_iommu_queue_vec(iommu, RISCV_IOMMU_IPSR_PMIP)],
> +               riscv_iommu_hpm_irq_handler, IRQF_ONESHOT | IRQF_SHARED, NULL, iommu);
> + if (rc)
> +     return rc;
> +
> + return riscv_iommu_pmu_init(&iommu->pmu, iommu->reg, dev_name(iommu->dev));
> +}
> +

What are the benefits of initializing the iommu-pmu driver in the iommu driver? 

It might be better for the RISC-V IOMMU PMU driver to be loaded as a separate module, as this would allow greater flexibility since different vendors may need to add custom events.

Also, I'm not quite clear on how custom events should be added if the RISC-V iommu-pmu is placed within the iommu driver.


Best regards,
Liqiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
