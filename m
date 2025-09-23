Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C58CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FlbWsGmb4xjCRJKpE5jy5PF3q+CBpaVZQsGeS0mtn08=; b=MnVTAbtUKnJz97
	UjaS9aLenJEGpqJdvcE4W2FfMJiHtXN1nUqfcIQHONpa58vOJ9RiBxOXktukHhwU7yHlAwvPNgj5G
	3w+2+y4eVv4SENQx2OD9AYDxsuUBZXOS/dfacm+hRl4UATSY8RMYc0xRw/pi4lVyolDmtAqIR6hnF
	vC4mxAR9BHq8xYfqjaaeN9xho7JlWBPt2nDI21jvkooTDXdB0KZTDszLtkvlOuybXG7ZRrV1pT6uU
	Ln7RmuO7xeIGzobnEbJ0P4Iu2c4FqwNnhP7iT/ZhHWbb/a59z2LUBM17xjOL2ok3/pfWMG61a1zdP
	rfqZpu+ykPaiVOflMObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14Dr-0000000Drrx-2jZa;
	Tue, 23 Sep 2025 14:42:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14Dq-0000000DrrJ-1wp3
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 14:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D647960289;
	Tue, 23 Sep 2025 14:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550AEC4CEF5;
	Tue, 23 Sep 2025 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758638545;
	bh=LhjAgb6cgHNp6OL8pcGSJUCyxHEjPb4wLfpmEKTiQcA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nKtzcs/rDklsb7BBzw37q6GESHy8punJWjUaYFFkFxTKL3hNYgOWmFZaKEOuOVt4w
	 SxGXiCsE6P46Un9IksGHBCl4UQneYfYuNwXg4MYJNDdxU9jTfAXGEn38FRK+ly9k3o
	 vnn448Vp300VR7z4tG/XySg2wVyOq4+OwQKadoxeVBjdiLTEhw7WpV0A9T+WrTlOmy
	 GV6mLRnDyxQWlal9FAhMGmU2FC9m3ua8xZ8PrfGQUJhuMY8WWsPR9WhnSESA0U/yxY
	 weU1fSVzjyCNHwroccKHTheNdTkZ/4GPvTx/qDLncX3W8sUSFx0BrVQsiFWb3JYRjH
	 pYc8/Xu9+QzQQ==
Date: Tue, 23 Sep 2025 09:42:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Randolph Lin <randolph@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	ben717@andestech.com, inochiama@gmail.com,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	shradha.t@samsung.com, randolph.sklin@gmail.com,
	tim609@andestech.com
Subject: Re: [PATCH v3 1/5] PCI: dwc: Skip failed outbound iATU and continue
Message-ID: <20250923144223.GA2032427@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923113647.895686-2-randolph@andestech.com>
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

On Tue, Sep 23, 2025 at 07:36:43PM +0800, Randolph Lin wrote:
> Previously, outbound iATU programming included range checks based
> on hardware limitations. If a configuration did not meet these
> constraints, the loop would stop immediately.
> 
> This patch updates the behavior to enhance flexibility. Instead of
> stopping at the first issue, it now logs a warning with details of
> the affected window and proceeds to program the remaining iATU
> entries.
> 
> This enables partial configuration to complete in cases where some
> iATU windows may not meet requirements, improving overall
> compatibility.

It's not really clear why this is needed.  I assume it's related to
dropping qilai_pcie_outbound_atu_addr_valid().

I guess dw_pcie_prog_outbound_atu() must return an error for one of
the QiLai ranges?  Which one, and what exactly is the problem?  I
still suspect something wrong in the devicetree description.

> Signed-off-by: Randolph Lin <randolph@andestech.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 952f8594b501..91ee6b903934 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -756,7 +756,7 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  		if (resource_type(entry->res) != IORESOURCE_MEM)
>  			continue;
>  
> -		if (pci->num_ob_windows <= ++i)
> +		if (pci->num_ob_windows <= i)
>  			break;
>  
>  		atu.index = i;
> @@ -773,9 +773,10 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  
>  		ret = dw_pcie_prog_outbound_atu(pci, &atu);
>  		if (ret) {
> -			dev_err(pci->dev, "Failed to set MEM range %pr\n",
> -				entry->res);
> -			return ret;
> +			dev_warn(pci->dev, "Failed to set MEM range %pr\n",
> +				 entry->res);
> +		} else {
> +			i++;
>  		}
>  	}
>  
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
