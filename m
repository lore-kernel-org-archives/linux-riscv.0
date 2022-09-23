Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D62C04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1mQwiyku1KJ2Et/G6WV9EIxs0sXv93G6IhJnYA3stgs=; b=MMHgTIlBTsPq2s
	4o578b+J3AvWVgi6dpiZdzkMWcJ/m0mSpdIvQLsVj/dLiQY9iucl//nengRrXEXWUq76S48liYCU2
	b+q2Xa4aYiKTpHQh91lVjRjzhl/M9j3FmGUayPeTDuHFMSdkCpjpmmCOXdzC8I0L8UJpnNjLQHDI0
	vqlG2kV3MIKIKv2nZD1xY3awHR8sWWXa7lkMPBCNXyrwZJZGaQ3kxgMYvpf1nytCfQzZBiNwznhM3
	1LSg0G2ByGVvkP0h8rqA4uQHFeWIEzbaftZsfguB1egFMkYKyxQIKSgNU68WGn7Xq73IpUA9R/I5N
	Zbd9/AzyELNnEqbOXpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obq0U-005jPR-Da; Fri, 23 Sep 2022 21:14:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obq0R-005jOk-0V
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 21:14:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29071614D2;
	Fri, 23 Sep 2022 21:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C2FC433D6;
	Fri, 23 Sep 2022 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663967681;
	bh=5eV5oae5IogxFEibo+YbsDwpSJMyOm4+PnytOZievbw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FD8sRLDPNfI7jbxrFwUDZleTafq1KSpS/ZiCWDfez7aZyBEW0XceQwkmHD+h2QxZ0
	 P6VEmsq73Mo4MQZMXQbQHz3HHdjg9PpD3auNrgVEiWmkl4L7Vzgz//hazhgEIqKMSf
	 YhSflMFtnz7gVlbDsmF64sOQXt6+wglTsRHQzrb5RyP4be7yxAeErGQDIga7PczSAs
	 ucUEqKwHgcFPbnBz814coUGwHpGxSNm/YSRx0T82YOLJU9yIy/hLlqzizEmUwWoXIW
	 od/IRxWTgGW9gNdaYFQbfUAV6/o15NcqOT1uY0Y/qrr3HayWvWl1FllyEx6Jn07Lug
	 7gEIOX/bGHApQ==
Date: Fri, 23 Sep 2022 16:14:39 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] PCI: fu740: do not use clock name when requesting clock
Message-ID: <20220923211439.GA1418979@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220907054020.745672-1-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_141443_115295_D98F8271 
X-CRM114-Status: GOOD (  21.76  )
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

On Wed, Sep 07, 2022 at 01:40:20PM +0800, Icenowy Zheng wrote:
> The DT binding of FU740 PCIe does not enforce a clock-names property,
> and there exist some device tree that has a clock name that does not
> stick to the one used by Linux DT (e.g. the one shipped with current
> U-Boot mainline).
> 
> Drop the name in the clock request, instead just pass NULL (because
> this device should have only a single clock).

If you rework this for any reason, please capitalize the subject line
to match the convention:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/pci/controller/dwc/pcie-fu740.c

> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/pci/controller/dwc/pcie-fu740.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> index 0c90583c078b..edb218a37a4f 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -315,7 +315,7 @@ static int fu740_pcie_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(afp->pwren), "unable to get pwren-gpios\n");
>  
>  	/* Fetch clocks */
> -	afp->pcie_aux = devm_clk_get(dev, "pcie_aux");
> +	afp->pcie_aux = devm_clk_get(dev, NULL);
>  	if (IS_ERR(afp->pcie_aux))
>  		return dev_err_probe(dev, PTR_ERR(afp->pcie_aux),
>  					     "pcie_aux clock source missing or invalid\n");
> -- 
> 2.37.1
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
