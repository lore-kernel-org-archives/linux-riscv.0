Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A56CAC581
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqCZk8pjG6mWZlN8Zo4+ZpKl/f2p8HnI4wR4yc34HN0=; b=xwZT6T7CMgyekHEW2B5YbJBZpn
	Bn9D5uhBobLbu/DQGVbdKEtE9tL1yDAa//DQlOsk5FuXnBrDbSaEbySUPyFADUawhECc6ALnCZkDr
	UxIRspEzEderX1TwT4dgV6GbH+Rfha+faze/oZzE3YTtr13NTiM4/1M7cA65c0PY37LfqP5rrWcgi
	7WY5QmrKJvzQ2/L4vwpLF6mkDn9MH0JRuoMl1DThqkoNIIhUiETrcFZ71cwrecfUf1amd7d5JSGds
	GuXu4T7odDgGk4ht8Z5W6hTRBBAR5kohzDvLa1W3DDDa+5ECdQ4415n833ciwfKu6Du+lsN2T9BAJ
	9ChdDIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhf8-00000001vub-1vOW;
	Mon, 08 Sep 2025 19:36:26 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdQ4-00000000ISa-1UDO
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 15:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=F2lxZqLHHvrOw0VxmILgbptbym7kVrMCHFyEXnEt8RA=;
	b=ZlNpZF4HQiUl62bILpZskVu6n6N89ejiRZZIVGu8Zvw9JDFXXCkxmgF1lP7KUR
	pPN3JyXE2YoVWsXHeoLPubDPnbkIES2MvvnvJwada81xA0mxlVI4v1cAz6P6hIKe
	20jmGAQXkbPhbndHbt69MLvsucdd4IvkPWa8u/DZGrKY4=
Received: from nilq-virtual-machine.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDn_0FS8L5oTsR7Ag--.56211S2;
	Mon, 08 Sep 2025 23:03:47 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: zong.li@sifive.com
Cc: aou@eecs.berkeley.edu,
	chenruisust@gmail.com,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ni_liqiang@126.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	will@kernel.org
Subject: Re: [RFC PATCH v2 00/10] RISC-V IOMMU HPM and nested IOMMU support
Date: Mon,  8 Sep 2025 23:03:46 +0800
Message-Id: <20250908150346.4761-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANXhq0ra+yv-Wt_vKTN3+c4StsPQB1vR+=Kp3RVSh0g10Oogqw@mail.gmail.com>
References: <CANXhq0ra+yv-Wt_vKTN3+c4StsPQB1vR+=Kp3RVSh0g10Oogqw@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDn_0FS8L5oTsR7Ag--.56211S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4R_miRDUUUU
X-Originating-IP: [60.25.78.114]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbiJBPC5Wi+W2uTvQABsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_080436_779195_AD0F93A7 
X-CRM114-Status: GOOD (  42.90  )
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
Content-Type: multipart/mixed; boundary="===============2027929031421883178=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2027929031421883178==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Tue, 2 Sep 2025 12:01:19 +0800 Zong Li <zong.li@sifive.com>  wrote:
>
> On Mon, Sep 1, 2025 at 9:37 PM niliqiang <ni_liqiang@126.com> wrote:
> >
> > Hi Zong
> >
> > Fri, 14 Jun 2024 22:21:48 +0800, Zong Li <zong.li@sifive.com> wrote:
> >
> > > This patch initialize the pmu stuff and uninitialize it when driver
> > > removing. The interrupt handling is also provided, this handler need to
> > > be primary handler instead of thread function, because pt_regs is empty
> > > when threading the IRQ, but pt_regs is necessary by perf_event_overflow.
> > >
> > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > ---
> > >  drivers/iommu/riscv/iommu.c | 65 +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 65 insertions(+)
> > >
> > > diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> > > index 8b6a64c1ad8d..1716b2251f38 100644
> > > --- a/drivers/iommu/riscv/iommu.c
> > > +++ b/drivers/iommu/riscv/iommu.c
> > > @@ -540,6 +540,62 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
> > >   return IRQ_HANDLED;
> > >  }
> > >
> > > +/*
> > > + * IOMMU Hardware performance monitor
> > > + */
> > > +
> > > +/* HPM interrupt primary handler */
> > > +static irqreturn_t riscv_iommu_hpm_irq_handler(int irq, void *dev_id)
> > > +{
> > > + struct riscv_iommu_device *iommu = (struct riscv_iommu_device *)dev_id;
> > > +
> > > + /* Process pmu irq */
> > > + riscv_iommu_pmu_handle_irq(&iommu->pmu);
> > > +
> > > + /* Clear performance monitoring interrupt pending */
> > > + riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IPSR, RISCV_IOMMU_IPSR_PMIP);
> > > +
> > > + return IRQ_HANDLED;
> > > +}
> > > +
> > > +/* HPM initialization */
> > > +static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
> > > +{
> > > + int rc;
> > > +
> > > + if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM))
> > > +     return 0;
> > > +
> > > + /*
> > > +  * pt_regs is empty when threading the IRQ, but pt_regs is necessary
> > > +  * by perf_event_overflow. Use primary handler instead of thread
> > > +  * function for PM IRQ.
> > > +  *
> > > +  * Set the IRQF_ONESHOT flag because this IRQ might be shared with
> > > +  * other threaded IRQs by other queues.
> > > +  */
> > > + rc = devm_request_irq(iommu->dev,
> > > +               iommu->irqs[riscv_iommu_queue_vec(iommu, RISCV_IOMMU_IPSR_PMIP)],
> > > +               riscv_iommu_hpm_irq_handler, IRQF_ONESHOT | IRQF_SHARED, NULL, iommu);
> > > + if (rc)
> > > +     return rc;
> > > +
> > > + return riscv_iommu_pmu_init(&iommu->pmu, iommu->reg, dev_name(iommu->dev));
> > > +}
> > > +
> >
> > What are the benefits of initializing the iommu-pmu driver in the iommu driver?
> >
> > It might be better for the RISC-V IOMMU PMU driver to be loaded as a separate module, as this would allow greater flexibility since different vendors may need to add custom events.
> >
> > Also, I'm not quite clear on how custom events should be added if the RISC-V iommu-pmu is placed within the iommu driver.
> 
> Hi Liqiang,
> My original idea is that, since the IOMMU HPM is not always present,
> it depends on the capability.HPM bit, if we separate HPM into an
> individual module, I assume that the PMU driver may not have access to
> the IOMMU's complete MMIO region. I'm not sure how we would check the
> capability register in the PMU driver and avoid the following
> situation: capability.HPM is zero, but the IOMMU-PMU driver is still
> loaded because the PMU node is present in the DTS. It will be helpful
> if you have any suggestions on this.
> 
> Regarding custom events, since we don't have the driver data, my
> current rough idea is to add a vendor event map table to list the
> vendor events and use Kconfig to define them respectively. This is
> just an initial thought and may not be the good solution, so feel free
> to share any recommendations. Of course, if we eventually decide to
> move it to drivers/perf as an individual module, then we could use the
> driver data for custom events, similar to what ARM does.
> 
> Thanks
> 

Apologies for the late reply. I understand the reasoning behind this approach now, it is indeed necessary to check the capability.HPM bit to further determine whether to load the pmu-driver. 
Also, the HPM-related registers are stored together with other registers without distinction.
Regarding custom events, I also previously thought that distinguishing them via Kconfig was the way, though it isn't the most elegant approach.
Sorry, I don't have a better idea for now. I'll be sure to follow up with you if it come across any better ideas.

Best regards,
Liqiang



--===============2027929031421883178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2027929031421883178==--
