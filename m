Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B515C04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 03:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hEYaq7S11JIUzi8S0VyhJKDRWxWTrbWWFIh2ckJKwo=; b=rmd2UcQHnXD4HHPyb7N2SYkYg9
	xrCbMiHy/EIZdCwg5HmFhs6OHy07uJA3g7T0f7aQ0bGKjUGZdmcvHlWhx6IRUrK+SU/0XZaV4zZyg
	awzg2Kj66QXZCPDrLojg0n6DBuQRHa15z2H5E9Xd1p8G8CzZTAjJEHJLWyxD41NzM91RKbIArYl22
	DQoVgIrrHtTihkFwJr6aEbIPlxIqOpnHcyR57ZbKPvM/+3jKad5rsaFRuoI6t4GA3o910ViE7g9aT
	4sNgQi6ltD6JWQmRCVYVDG3Gzz5v++6AQ+ECpEzlx7d+/xVvo/gH8Q+jGm6r5lNgXF0pBJx53PruP
	8VBwiFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2NUV-0000000BKqr-1LzW;
	Thu, 02 May 2024 03:52:15 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2NUS-0000000BKqB-2IQS
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 03:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714621933; x=1746157933;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qK6quWd0+fR1tNL6dF/6F94raTQfcmC3+2BRAFGNCVc=;
  b=RlAJZPV8TGT77M1FCgk9l4Ti/nG8sWZ7XqaQ6+XrQVNve5cX7RCrE+FP
   AP52lKitZQOb+rhJiM/lb2JbzG+Kb3MLEf/7zF8OwaDFl5xLX36UQK7xx
   KSSTplifN2yHDyvY4ZoVV//tJRYG/lhglaiHbdqsR9l0VHeups0JIuLed
   Ib8WOkeTyyd2fd2MFL1/w6SH6zbmoysZVcW5SM0YCpMsSn/jybCASk2yE
   PmEMorzeTJIXSn0sr9nJ0wVTKeBCASDFmBpTX6JiYmX58BdmOL1rChIjA
   xqoHlBwNW0vGQbUbqgm3eD1PAO53EhtHu1d7FoydKWy0YyXv1r40k50jM
   g==;
X-CSE-ConnectionGUID: 9/z1hUiVQQG5Uu9L3BJ7uA==
X-CSE-MsgGUID: mmrR03KaRbShH7RF0LwjCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14196402"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="14196402"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 20:52:11 -0700
X-CSE-ConnectionGUID: vGfpbaSWRyeFeHIYwU+aJA==
X-CSE-MsgGUID: LEuKkd3RTSO3a82B1VFTUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31661944"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2024 20:52:06 -0700
Message-ID: <7c3fc511-6a3b-44d8-94fa-e4fff54f93b9@linux.intel.com>
Date: Thu, 2 May 2024 11:50:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] iommu/riscv: Paging domain support
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_205212_710769_2FB14ECC 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/1/24 4:01 AM, Tomasz Jeznach wrote:
> +/*
> + * Send IOTLB.INVAL for whole address space for ranges larger than 2MB.
> + * This limit will be replaced with range invalidations, if supported by
> + * the hardware, when RISC-V IOMMU architecture specification update for
> + * range invalidations update will be available.
> + */
> +#define RISCV_IOMMU_IOTLB_INVAL_LIMIT	(2 << 20)
> +
> +static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
> +				    unsigned long start, unsigned long end)
> +{
> +	struct riscv_iommu_bond *bond;
> +	struct riscv_iommu_device *iommu, *prev;
> +	struct riscv_iommu_command cmd;
> +	unsigned long len = end - start + 1;
> +	unsigned long iova;
> +
> +	rcu_read_lock();
> +
> +	prev = NULL;
> +	list_for_each_entry_rcu(bond, &domain->bonds, list) {
> +		iommu = dev_to_iommu(bond->dev);
> +
> +		riscv_iommu_cmd_inval_vma(&cmd);
> +		riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
> +		if (len && len >= RISCV_IOMMU_IOTLB_INVAL_LIMIT) {
> +			for (iova = start; iova < end; iova += PAGE_SIZE) {
> +				riscv_iommu_cmd_inval_set_addr(&cmd, iova);
> +				riscv_iommu_cmd_send(iommu, &cmd, 0);
> +			}
> +		} else {
> +			riscv_iommu_cmd_send(iommu, &cmd, 0);
> +		}
> +
> +		/*
> +		 * IOTLB invalidation request can be safely omitted if already sent
> +		 * to the IOMMU for the same PSCID, and with domain->bonds list
> +		 * arranged based on the device's IOMMU, it's sufficient to check
> +		 * last device the invalidation was sent to.
> +		 */
> +		if (iommu == prev)
> +			continue;
> +
> +		prev = iommu;
> +		riscv_iommu_cmd_send(iommu, &cmd, 0);
> +	}

I don't quite follow why not moving "if (iommu == prev)" check to the
top and removing the last riscv_iommu_cmd_send(). My understanding is
that we could make it simply like below:

	prev = NULL;
	list_for_each_entry_rcu(bond, &domain->bonds, list) {
		iommu = dev_to_iommu(bond->dev);
		if (iommu == prev)
			continue;

		/*
		 * Send an invalidation request to the request queue
		 * without wait.
		 */
		... ...

		prev = iommu;
	}

> +
> +	prev = NULL;
> +	list_for_each_entry_rcu(bond, &domain->bonds, list) {
> +		iommu = dev_to_iommu(bond->dev);
> +		if (iommu == prev)
> +			continue;
> +
> +		prev = iommu;
> +		riscv_iommu_cmd_iofence(&cmd);
> +		riscv_iommu_cmd_send(iommu, &cmd, RISCV_IOMMU_QUEUE_TIMEOUT);
> +	}
> +	rcu_read_unlock();
> +}

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
