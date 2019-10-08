Return-Path: <SRS0=zF8f=YB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472E9C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2019 15:46:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18208206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2019 15:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ub+5cor8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18208206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhDz5do90e23nEM1b2DJz8LYAgntaK+WtwDw5fG8Bvc=; b=Ub+5cor8DTdPfS
	reOqeyKiu3fa0yS+5h5YsfgS/D5Lux9KieW5jy0vs7G7t3yfjS4TpP1zFSxtwOEuJYJXHVwTm88n6
	i0UwEDBPurRC14QzYwPUe7urTe7D3vCZPkLqTsEsx4xzPUWIZlxksra2ct0CuO4nSG+pCScZPIU3A
	yLck72WQIhPu4bflWO+XyOIXbjA+Zaxxgnkk+S//fuc594a5CnpYi9t7b00EDYhG/8OwPkxDIuJ88
	2hzEox/gmfmt7jW4dzMVMJQ54H9LH+bNn8M2bUpJvDa5R8lYImoeziWpEc5hyK6qPQ0ZQ1DXYyHvv
	J/KNqJt/M+Mt30HCe2uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHrhO-0004ll-5g; Tue, 08 Oct 2019 15:46:54 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iHrhM-0004lP-GK; Tue, 08 Oct 2019 15:46:52 +0000
Date: Tue, 8 Oct 2019 08:46:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] PCI/MSI: Enable PCI_MSI_IRQ_DOMAIN support for
 Microblaze
Message-ID: <20191008154652.GB7903@infradead.org>
References: <b5959a9f6bfa65f0ae1a6a184e1b09dcec8e8f15.1570539512.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5959a9f6bfa65f0ae1a6a184e1b09dcec8e8f15.1570539512.git.michal.simek@xilinx.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kuldeep Dave <kuldeep.dave@xilinx.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>, monstr@monstr.eu,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Firoz Khan <firoz.khan@linaro.org>, git@xilinx.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index a304f5ea11b9..9d259372fbfd 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -52,7 +52,7 @@ config PCI_MSI
>  	   If you don't know what to do here, say Y.
>  
>  config PCI_MSI_IRQ_DOMAIN
> -	def_bool ARC || ARM || ARM64 || X86 || RISCV
> +	def_bool ARC || ARM || ARM64 || X86 || RISCV || MICROBLAZE

Can you find out what the actual dependency is so that we can
automatically enabled this instead of the weird arch list?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
