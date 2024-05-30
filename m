Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F901C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZSoUtXWlz+fo9P+XYQUZJ2hSCCNzh5YTJDIyFsv4sVk=; b=Z6t9sEKfSGJm/2
	v4max+k5uWzE8rz1KH5duuuJjVQKwGtheI0tGYjDbwWx0BN2QLgH9uQyAZNqqEpNDEkyJU53RaOCT
	PMgWPuFvhnynN+YpD9o+gWgDZhf61JpvYvV2xl2qTkQkj9SI7gBBXTp0WO4sECO1+WxIwtx2iQ5W1
	zK7GuHAlTFq9m9/a9P0GnBW1OxsJCksIlJ3dcb/Q/HR7PC67Lhnies8bscngu0GdITiKcnAPF3Un8
	azORUzs6sysx99Wd0DhZ6NAeKFoeLkMksm0J7sQaNmsBC2wU0CMIbOSg9AoFHwa7TSBB9q++5xAU5
	37v8kxV+EWk6lAecNRRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCirL-00000007sT6-460K;
	Thu, 30 May 2024 16:42:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCirJ-00000007sRs-0q5i
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 16:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9CF56CE1AF7;
	Thu, 30 May 2024 16:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98529C2BBFC;
	Thu, 30 May 2024 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717087348;
	bh=0dLZR7E5oKp84UdjpgU9+xrQH9dWMGNNbHW3aibuRLE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OWEshGzsUQnWA7DWaY96TZRjvxcpw45CwlzVYBmCQ9RGabDaYp2eoxQV8tJQOcXzx
	 blLU9+fJH4EC38RQmg8u93Yuf083lfaU46sFwhfLnVlMcbIgkRFJ8l0HpAng2ru2qE
	 XlL+qQSJqXDygXnvdmwXd0RvOdUyyWBW5Sqmv/t2Lk3a0qghcTJQGMbxpjC5DD5ZtD
	 V2LClagvE3xmqphXeBEDCL7ZTm6N7v2CVEQ9LuCIgohD7Q7F8UgJRM1NjqtUBYAn0y
	 Zva8STI9ImMw30THqyGM+EDxhLqM2N+7C9d/TFphujokr6ZBFcGjQcIWCT7fFE4nKF
	 UeQVBxWaS6gVQ==
Date: Thu, 30 May 2024 11:42:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 7/7] PCI: microchip: Re-partition code between probe()
 and init()
Message-ID: <20240530164226.GA550240@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230728131401.1615724-8-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_094233_442118_63358AF5 
X-CRM114-Status: GOOD (  15.40  )
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

On Fri, Jul 28, 2023 at 02:14:01PM +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Continuing to use pci_host_common_probe() for the PCIe Root Complex on
> PolarFire SoC was leading to an extremely large _init() function and
> some unnatural code flow. Re-partition so some tasks are done in
> a _probe() routine, which calls pci_host_common_probe() and then use a
> much smaller _init() function, mainly to enable interrupts after address
> translation tables are set up.
> ...

> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -384,6 +384,8 @@ static struct {
>  
>  static char poss_clks[][5] = { "fic0", "fic1", "fic2", "fic3" };
>  
> +static struct mc_pcie *port;
> ...

> +static int mc_host_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
>  	void __iomem *bridge_base_addr;
>  	int ret;
>  	u32 val;
> @@ -1112,13 +1141,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);

Saving this per-device pointer in a static singleton is kind of
problematic.  We may know there can only be a single instance right
now, but even if that remains true forever for this driver, we don't
want this pattern to be be copied elsewhere.

I didn't look hard enough to figure out exactly what problem this
singleton solves, but is there any other way to address it?

I suspect it's related to using pci_host_common_probe(), and it's
great to share that code, but it seems like that basically forces some
non-ECAM initialization into the struct pci_ecam_ops.init() method
where it doesn't really fit very well.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
