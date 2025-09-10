Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F213CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lVNxFWUiImnZ0ukWqeJt7f8e5WA6QVUx4OMjU3Brbvs=; b=y3ETfyVPb6fako
	8naOvHT7OTdfg5sy9VCp7tM5LcZ0KfgJeXWpHrRuPh6Z/mfGyJUu9yEjwkzDVhWodiF70LIojIR5X
	ZQpca4RXJxsy1EbALkm1ezBdMtt7AzqZEygejccRFqFiL+8No/VMI4BjyT7AHprvsMwEha7bcRiBB
	DBQPXjVzh6XJoHUFRPJO0ZmUKy3drnyqFzDyE69Eg5yOIOitdkwZCF9TWqDnPlcKRLkFKYZraMyQm
	Knrz0/iOSuOJfO8PVWI0vMbg5t/JDWlf1rooiNHHeQywJ4vR+52OHNclp3vPmC7jVaynNf2ifWW7Y
	PZSLlAL6X/hwz8/lBv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLjK-0000000EgIV-1aZD;
	Wed, 10 Sep 2025 14:23:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLjH-0000000EgHZ-354o
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 14:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD09644818;
	Wed, 10 Sep 2025 14:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A7FC4CEEB;
	Wed, 10 Sep 2025 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757514202;
	bh=sPrb8D0bSLp1Js3/8C0uU0W0ATkZZf+fqUxj/05AtlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZXqV7Y5wyyMy8XPbh7JLpkdcpaKmaztp6Y0DwSjdEv41hAbGELyFer083foOLZxDB
	 uVTwM9d0VzXe5ApdhOhBcOigUrmCndv5r7VieWdnOyaoM19Y2rzdYnc1aoBHnuFulc
	 AqIe8dr5b831dN+Kb2n63v4Akag6nRBwY80VbL4FSiuspLylF3TddTA/6EyrER5x/B
	 DDJiWxz4rrkQ5gD0S9WprL3hWsUolUwdU5r0Q36JY+D4tTcHsNqhb229bRBfxu4z9Y
	 ZHr8s3wIy6jmv8qTiakGq+vJ6g4lTDSc0pwVl5u9S7lykALNBAxV4MmKgjiH15D5tn
	 w5RdZe7h8z7oA==
Date: Wed, 10 Sep 2025 09:23:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: kwilczynski@kernel.org, u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de,
	bwawrzyn@cisco.com, bhelgaas@google.com, unicorn_wang@outlook.com,
	conor+dt@kernel.org, 18255117159@163.com, inochiama@gmail.com,
	kishon@kernel.org, krzk+dt@kernel.org, lpieralisi@kernel.org,
	mani@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	robh@kernel.org, s-vadapalli@ti.com, tglx@linutronix.de,
	thomas.richard@bootlin.com, sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Subject: Re: [PATCH v2 2/7] PCI: cadence: Check pcie-ops before using it.
Message-ID: <20250910142321.GA1533672@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18aba25b853d00caf10cc784093c0b91fdc1747d.1757467895.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_072323_811153_3ABE12F3 
X-CRM114-Status: GOOD (  18.78  )
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

Drop period at end of subject.

On Wed, Sep 10, 2025 at 10:08:16AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> ops of struct cdns_pcie may be NULL, direct use
> will result in a null pointer error.
> 
> Add checking of pcie->ops before using it for new
> driver that may not supply pcie->ops.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/pci/controller/cadence/pcie-cadence-host.c | 2 +-
>  drivers/pci/controller/cadence/pcie-cadence.c      | 4 ++--
>  drivers/pci/controller/cadence/pcie-cadence.h      | 6 +++---
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 59a4631de79f..fffd63d6665e 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -531,7 +531,7 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
>  	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_PCI_ADDR1(0), addr1);
>  	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(0), desc1);
>  
> -	if (pcie->ops->cpu_addr_fixup)
> +	if (pcie->ops && pcie->ops->cpu_addr_fixup)
>  		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
>  
>  	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(12) |
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
> index 70a19573440e..61806bbd8aa3 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence.c
> @@ -92,7 +92,7 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
>  	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(r), desc1);
>  
>  	/* Set the CPU address */
> -	if (pcie->ops->cpu_addr_fixup)
> +	if (pcie->ops && pcie->ops->cpu_addr_fixup)
>  		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
>  
>  	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(nbits) |
> @@ -123,7 +123,7 @@ void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
>  	}
>  
>  	/* Set the CPU address */
> -	if (pcie->ops->cpu_addr_fixup)
> +	if (pcie->ops && pcie->ops->cpu_addr_fixup)
>  		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
>  
>  	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(17) |
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index 1d81c4bf6c6d..2f07ba661bda 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -468,7 +468,7 @@ static inline u32 cdns_pcie_ep_fn_readl(struct cdns_pcie *pcie, u8 fn, u32 reg)
>  
>  static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
>  {
> -	if (pcie->ops->start_link)
> +	if (pcie->ops && pcie->ops->start_link)
>  		return pcie->ops->start_link(pcie);
>  
>  	return 0;
> @@ -476,13 +476,13 @@ static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
>  
>  static inline void cdns_pcie_stop_link(struct cdns_pcie *pcie)
>  {
> -	if (pcie->ops->stop_link)
> +	if (pcie->ops && pcie->ops->stop_link)
>  		pcie->ops->stop_link(pcie);
>  }
>  
>  static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
>  {
> -	if (pcie->ops->link_up)
> +	if (pcie->ops && pcie->ops->link_up)
>  		return pcie->ops->link_up(pcie);
>  
>  	return true;
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
