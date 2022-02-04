Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D19FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 19:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqHCn32xvuGFyQHFJZq+MCfb8JFY4uvctUo9G22N3Gg=; b=luI3bo53t7UzsK
	5j/7lxFeNj7PSZ6CJdOSa33mMraXTCSIIJtiphFTCDrmHPMhx7+egObi43l8goV3zFvcyiZbdB4fm
	JiZImB4mjvB4jxYxu6UzfR8g+6J6FyCUx8lfPmqL0+k/vUrK4Kj3Gdglf8MO++OgiVFXuGMsBpTkz
	91SW6oYmBHibzRIO1Z46k6STUR0emjqWE37C7J5k0aFuPu4/A1SG2cOLSO0nuIyNc97NK84u97g6Y
	VKxGg4W3O2VUaIiF0k1qOJ9KbFOGA0dPccqF9vHNU4Wj21jbQWSP/Erp6gqvJ4+alYa4SXEDDbtUr
	j+6RBa/5NOVIcbZXrHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG40x-005HrX-Of; Fri, 04 Feb 2022 19:12:59 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG40v-005HqZ-4A
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 19:12:58 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 cx3-20020a17090afd8300b001b87b9c0247so7966pjb.0
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 11:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+2vQhaK54H9Hdp01q4kx6TzLMZbpfp4A4zBHmmTnPc=;
 b=kC+yjJYVoYE0SMFrNpOfqbJLywLEVTVjVFXJH5t/nVKAI4qoNmGB2tNJhLvh0K6ZMo
 fZM5nF2Sif+TYJOWv81vRU/v5r5Zdov66tmOZFfmWHJcFw6EKU6UGC9CvV1rJiM/Ph0T
 xxD++0G7RFrHIAcOJrQLb+8i13VDY+jK4NyruwM5ev0Q8d5/oUcS2hKsMgg3LlCxilIi
 OBC7yFC/tXYAEzOYohoifQ5tOVYA+r6Yc9onVPqb/VJJAisIty14jtME3e7WvwqAS2g8
 RbpZl5Mg5xEoOHbnsXF7KddBAvz1eBSy8OYY7+UX0eVtRgLmcuR1XEWh2BX4tB7t7L4z
 gX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+2vQhaK54H9Hdp01q4kx6TzLMZbpfp4A4zBHmmTnPc=;
 b=eYZnbF3PaTs8b29RxWZrMKp3b0b5qABgjcpdoqf+UyNkLrZ8sE4xA3fi7cJHXGN6jd
 /2NApqUToyaQjSel7l22wIVBsZqDFedzFqWkztGssIyMD0/X4jgW77NKCbAJAe+Fbz7+
 U5WZD0L3HqDGEC/aVmZm/3Dh5rBVfxT1Dqol3mFUFknb9FanmZs2wPl5lAUkw/7twsK4
 NDwcIdywyEmOQ3zvtkKWJFiUT5ZPnulF3NctlCripG45CaRrtNyUaa5Ilsp3LWHLZIGd
 2t1y+U8SUpZU8xpAW2gZIoRBs398P6rydsVz+c4c2zidSbSwdkbvO72zC5fjoBWfGEvn
 BC2Q==
X-Gm-Message-State: AOAM530ZIF6j01EEniyOq4+kEh5B/mnZUXsPQ9whkNSc1xsn702m8/Zi
 5Q6iIgnrZzO6gXkRwRLFhn4W2c4XRVfN2gWhFzs=
X-Google-Smtp-Source: ABdhPJyPI8usXYMumMnrEQ3nLDq5zjec+fco1omgVZwxBeH6nOTi/fUN2f8Dc8+wqicpUpw+xbOinGtCvbA54nwhPh0=
X-Received: by 2002:a17:90a:df0e:: with SMTP id
 gp14mr436884pjb.57.1644001975488; 
 Fri, 04 Feb 2022 11:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20220204183316.328937-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20220204183316.328937-1-ben.dooks@codethink.co.uk>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Fri, 4 Feb 2022 21:12:19 +0200
Message-ID: <CAEn-LTo96qGWyq7Zp9=VUaJh_kAW2JA7hRKwVzrSyz=xwDT=rg@mail.gmail.com>
Subject: Re: [PATCH] PCI: fu740: RFC: force gen1 and get devices probing
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, 
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com, bhelgaas@google.com, 
 linux-pci@vger.kernel.org, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, macro@orcam.me.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_111257_206014_AC70B70A 
X-CRM114-Status: GOOD (  23.53  )
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

On Fri, Feb 4, 2022 at 8:35 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> The dw pcie core does not probe devices unless this fix
> from u-boot is applied. The link must be changed to gen1
> and then the system will see all the other pcie devices
> behind the unmatched board's bridge.
>
> This is a quick PoC to try and get our test farm working
> when a system does not have the pcie initialised by a
> u-boot script.
>
> I will look at a proper patch when I am back in the office

Hi,

Have you looked into the patches posted for Linux and U-Boot from
Maciej W. Rozycki?

On the Linux side (not reviewed yet):
[PATCH v3] pci: Work around ASMedia ASM2824 PCIe link training failures
https://www.spinics.net/lists/linux-pci/msg120112.html

The U-Boot fix was merged a few days ago.

david

> ---
>  drivers/pci/controller/dwc/pcie-fu740.c | 37 +++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> index 960e58ead5f2..44f792764e45 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -181,11 +181,48 @@ static void fu740_pcie_init_phy(struct fu740_pcie *afp)
>         fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE3_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
>  }
>
> +/* u-boot forces system to gen1 otherwise nothing probes... */
> +static void pcie_sifive_force_gen1(struct dw_pcie *dw, struct fu740_pcie *afp )
> +{
> +       unsigned val;
> +
> +#if 0
> +       /* u-boot code */
> +        /* ctrl_ro_wr_enable */
> +        val = readl(sv->dw.dbi_base + PCIE_MISC_CONTROL_1);
> +        val |= DBI_RO_WR_EN;
> +        writel(val, sv->dw.dbi_base + PCIE_MISC_CONTROL_1);
> +
> +        /* configure link cap */
> +        linkcap = readl(sv->dw.dbi_base + PF0_PCIE_CAP_LINK_CAP);
> +        linkcap |= PCIE_LINK_CAP_MAX_SPEED_MASK;
> +        writel(linkcap, sv->dw.dbi_base + PF0_PCIE_CAP_LINK_CAP);
> +
> +        /* ctrl_ro_wr_disable */
> +        val &= ~DBI_RO_WR_EN;
> +        writel(val, sv->dw.dbi_base + PCIE_MISC_CONTROL_1);
> +#endif
> +
> +       val = readl_relaxed(dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
> +       val |= PCIE_DBI_RO_WR_EN;
> +       writel_relaxed(val, dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
> +
> +       val = readl(dw->dbi_base + 0x70 + 0x0c);
> +       val |= 0xf;
> +       writel(val, dw->dbi_base + 0x70 + 0x0c);
> +
> +       val = readl_relaxed(dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
> +       val &= ~PCIE_DBI_RO_WR_EN;
> +       writel_relaxed(val, dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
> +}
> +
>  static int fu740_pcie_start_link(struct dw_pcie *pci)
>  {
>         struct device *dev = pci->dev;
>         struct fu740_pcie *afp = dev_get_drvdata(dev);
>
> +       pcie_sifive_force_gen1(pci, afp);
> +
>         /* Enable LTSSM */
>         writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
>         return 0;
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
