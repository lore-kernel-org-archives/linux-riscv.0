Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EE2EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 10:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVnatr/9W70kazFxhE6NBt7o8get+IGiX9T0odm8ZmA=; b=vBREtEEJ6daQll7KCXBqh5Z08X
	D96iJ1hgLT2P06d3QMExzGcdjatSrkN78VknQX8okGUHZ7GFeUHc+luTg2ESow/WCzXzdrmu9tlTz
	odB7KS7jPpUHifDIpfz7t6gezl4rUxbE+wkhb/6Mc/1hd3fVJdHhWZvupcOn3nqXZVGRh3+hMuOJU
	RBSWS80IcrrcT1GwdUujjCu0Rwd4jb/PNZBSoRS6eQbuM+AM8tbMe55mW1U7/oQt79ZT9rK7l8tIG
	M1qIGApxpxh7rS3dP/IkPK/mtaHmNdGg20A2V6CEFivy7f7xUXdVJBG6gP3jCcNUrilxql5oLkl1X
	1NPjTEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMR3c-00As6p-2K;
	Thu, 20 Jul 2023 10:38:52 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMR3a-00As5k-05
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 10:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689849530; x=1721385530;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MUQDGWmX3jQPF4kFi+U/N/uImNqXd8LSFOduoqtvDBc=;
  b=PSy6RF286brjYHeM+MI14yYSk35QcOFo7p97o961OLuQNrCrUhzb2ON8
   tGu9ArJCmCDC/vxbvDcC1rMA9xXLw4W0MBrDzWX6JH2IBPBHg2lorllXP
   BiE8o6CmOpjqD7sYe0MsD/SbqiXmNSMAvgLueB7GA50JRr3O0/ju3xXbs
   EOSs7qUYaEzKb7Cg+tE/uFyQRGQ7b5klUzbeh7EyBu3APJ63Q+ldQKz3R
   TqY9AmGybzmHQhCPTlM8ibzNCNyBfm6956ux4j40m63WhKEDbbE5CzvXh
   5cNiPmcapkHqkhAwRxyvC4SO018WagmtZFeHy7CUeOOAt4xSWll6J6StM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="370263495"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="370263495"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 03:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789754715"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="789754715"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.191.109]) ([10.252.191.109])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 03:38:41 -0700
Message-ID: <68e3a7ab-0387-3e58-8c30-3ace807acee5@linux.intel.com>
Date: Thu, 20 Jul 2023 18:38:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu
 support.
Content-Language: en-US
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_033850_109212_E8E7FC3D 
X-CRM114-Status: UNSURE (   6.08  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023/7/20 3:33, Tomasz Jeznach wrote:
> +struct riscv_iommu_domain {
> +	struct iommu_domain domain;
> +
> +	struct list_head endpoints;
> +	struct mutex lock;
> +	struct riscv_iommu_device *iommu;

How are domains and iommu devices connected? A domain can be attached to
multiple devices, which are possibly behind different iommu devices. So
a domain is possibly connected to multiple iommu devices.

Is it possible?

> +
> +	unsigned mode;		/* RIO_ATP_MODE_* enum */
> +	unsigned pscid;		/* RISC-V IOMMU PSCID */
> +
> +	pgd_t *pgd_root;	/* page table root pointer */
> +};
> +
> +/* Private dev_iommu_priv object, device-domain relationship. */
> +struct riscv_iommu_endpoint {
> +	struct device *dev;			/* platform or PCI endpoint device */
> +	unsigned devid;      			/* PCI bus:device:function number */
> +	unsigned domid;    			/* PCI domain number, segment */
> +	struct rb_node node;    		/* device tracking node (lookup by devid) */
> +	struct riscv_iommu_device *iommu;	/* parent iommu device */
> +
> +	struct mutex lock;
> +	struct list_head domain;		/* endpoint attached managed domain */
> +};

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
