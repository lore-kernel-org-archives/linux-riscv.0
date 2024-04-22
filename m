Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC400C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 07:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaYIZuerf6Wa8cXOwGk5f9soI2vMYXI2nc6jLlIrtTc=; b=NnS6N0VzXYFvAtBqLOkMRebnqn
	sACVVM278XLWSTmFnUN3oAXGcbHGEVJpMGpGhYanWv3QkxS/5dzYdv7EoO2WjxFg62OQ4GQ425beB
	kYkv3hgUn9NGo4N5iomMH1/6OrZnMd8ciS0b2NsDoX8IsxPXleb7CaQXwCVF5zkZn6qvL06XgMQPo
	VM06bN+ojJzncBJX6dJZc/kSM5uGzYTJ3vsi+zC9YSPkZJfnQt3MetsjdY4Rnt3I5Ez21irgSRf68
	2sKDHzrnX0fv9b9uxZ09Rv6bGw4kxuAxwMQzE1gGP0K8JD8bNEz/nzkfqc6jRowV7ZU/34B6nQGKx
	QQSsncbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoIU-0000000CTZR-1sCg;
	Mon, 22 Apr 2024 07:41:06 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoIR-0000000CTWX-1RRV
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 07:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713771664; x=1745307664;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=USR3bFEd40WckrOHmGi8VAlZeJ/vjjPTOFMN/FwP1iw=;
  b=FRBHfDvFGYBC6P1+ekzs2CfnTwD/g9xNj97SXLAq/nnShbg0l17u4Wvb
   LadAJ2HjCPTJqdHx+fST5npB9pyJtUUGtc6dXJEKWfBhJo4YS7Q2IcYoa
   72/F3lqHymiNeXSNbbuMnGUhVZr2Pb5yMyAegY6hc6kWjDL8UbpuC8i99
   vVM519W0lwMeX8jM3iSf3WCyye0mWZ+Yi83P3adL4Anhbbf5kCA9KGnxl
   AQS9yPaQahYZhhYQYsSCILLcEAF9NjlhwcttMMGT6aEJIVhcQUdP7D/e+
   bL2+KhDHNn56akgG25+uWhRbkyvwBt2xgwmoGpSVSlr2naSKX3O0bZvua
   A==;
X-CSE-ConnectionGUID: WRxu2kzxR2W7QAChWEViHQ==
X-CSE-MsgGUID: huDg7grlTfOdTjELxz6E8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20436791"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="20436791"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 00:40:59 -0700
X-CSE-ConnectionGUID: Bhjbqn5PRx+ExxI/+DpaQg==
X-CSE-MsgGUID: I0j9NBpPT8OLzM2aqsevpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="24012803"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.225.176]) ([10.124.225.176])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 00:40:54 -0700
Message-ID: <23ef7fbd-7498-4fb0-895b-81c618acedc1@linux.intel.com>
Date: Mon, 22 Apr 2024 15:40:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] iommu/riscv: Paging domain support
To: Jason Gunthorpe <jgg@ziepe.ca>, Tomasz Jeznach <tjeznach@rivosinc.com>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
 <20240419125627.GD223006@ziepe.ca>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240419125627.GD223006@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_004103_463774_114B474C 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024/4/19 20:56, Jason Gunthorpe wrote:
>> +		riscv_iommu_cmd_inval_vma(&cmd);
>> +		riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
>> +		if (len > 0 && len < RISCV_IOMMU_IOTLB_INVAL_LIMIT) {
>> +			for (iova = start; iova < end; iova += PAGE_SIZE) {
>> +				riscv_iommu_cmd_inval_set_addr(&cmd, iova);
>> +				riscv_iommu_cmd_send(iommu, &cmd, 0);
>> +			}
>> +		} else {
>> +			riscv_iommu_cmd_send(iommu, &cmd, 0);
>> +		}
>> +	}
> This seems suboptimal, you probably want to copy the new design that
> Intel is doing where you allocate "bonds" that are already
> de-duplicated. Ie if I have 10 devices on the same iommu sharing the
> domain the above will invalidate the PSCID 10 times. It should only be
> done once.
> 
> ie add a "bond" for the (iommu,pscid) and refcount that based on how
> many devices are used. Then another "bond" for the ATS stuff eventually.

The latest version is under discussion here.

https://lore.kernel.org/linux-iommu/20240416080656.60968-1-baolu.lu@linux.intel.com/

Supposedly, you can make such optimization after the base code is landed
in the mainline tree if the change is big.

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
