Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB96C07E8D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 05:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=236su76+hRfHsgUbVmpLZ+D8EMidCBDPn+Bih6YNcLE=; b=qv/N5t9oE0w8LLw0cdeZPH3BRT
	2gGZEe0M0J6a8+1fv/aPq5Sy/7zyK6dLG3FdJeyEYaa09OxRbKdFqi4X6dG1qoiUtDZC6C/3WeYXg
	RT/fvcxldhFr3n9bysTrT9M7L0LMa3+pMiNWtGvGjLGxgUsWugQ99qmMPQ3E7lDFi9ptZh9CjXp5O
	W9ZxYoy0uxJ4jlGx5/3D9wof1NBWQ1gnK5GJ4IUpPQhKOCou+nisvFu4wGgKclBt3MbJsvYYZF+qN
	heQU9S/yuxHF4J2jb5zsSoYytGdnZuH8AjVspzV5EydXScdyI48+cVhk5VRc+t6ThBn1oZHsQBVbI
	sxoRCS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rylzZ-0000000C4Gg-2Uma;
	Mon, 22 Apr 2024 05:13:25 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rylzW-0000000C4FO-1320
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 05:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713762802; x=1745298802;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DKjA0dK037dChvDf0JvnAQW0/y9B6MEd698fmMfs8IE=;
  b=LXkkrATOV/JhrK3yJnImF6qDz4Mb6GHkznLj4VKInuqjtne1u/CuLFKW
   w6cdbU8TEwoFw1X/8gcXZSAfH3XqNL+ky1GDF0o+pypFtQOVDBAzWC11R
   v7iZDsR8ciuixfM+YwNFqFvtzjYCGsNyqC1/xdArJH0mVhjoYC2wqQR4H
   3h0gatrCIxVtvlxc0nrYbXXKd9uHGqF7zfgS/WJEOJjYvGXmdHCYbjh+p
   wxIk05YilMcyJ1F0K8g4fMOya756lyE2DXZGCACM73bI2Kf2jqFLydDjv
   Fa7K0wFcw61skQi8BAt8SYpYTkm8pfA3DScWpfAx/PF1tdzaknDH6Z32m
   A==;
X-CSE-ConnectionGUID: Zv9Bvb0lSESG8VMEW9uAsg==
X-CSE-MsgGUID: nbfbHW0NQBemdLK77BaF+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9148168"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9148168"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 22:13:19 -0700
X-CSE-ConnectionGUID: gCCWIIMWTq+J3iew0YRR0A==
X-CSE-MsgGUID: CVejsV1ORxqcz60ioG20Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="61338676"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by orviesa001.jf.intel.com with ESMTP; 21 Apr 2024 22:13:13 -0700
Message-ID: <964db2aa-6535-4243-9b3f-e72bff9b6297@linux.intel.com>
Date: Mon, 22 Apr 2024 13:11:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] iommu/riscv: Device directory management.
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <232b2824d5dfd9b8dcb3553bfd506444273c3305.1713456598.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <232b2824d5dfd9b8dcb3553bfd506444273c3305.1713456598.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_221322_431283_B056ECEE 
X-CRM114-Status: GOOD (  37.33  )
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

On 4/19/24 12:32 AM, Tomasz Jeznach wrote:
> Introduce device context allocation and device directory tree
> management including capabilities discovery sequence, as described
> in Chapter 2.1 of the RISC-V IOMMU Architecture Specification.
> 
> Device directory mode will be auto detected using DDTP WARL property,
> using highest mode supported by the driver and hardware. If none
> supported can be configured, driver will fall back to global pass-through.
> 
> First level DDTP page can be located in I/O (detected using DDTP WARL)
> and system memory.
> 
> Only identity protection domain is supported by this implementation.
> 
> Co-developed-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>   drivers/iommu/riscv/iommu.c | 369 +++++++++++++++++++++++++++++++++++-
>   drivers/iommu/riscv/iommu.h |   5 +
>   2 files changed, 365 insertions(+), 9 deletions(-)

[ ... ]

> +
> +/*
> + * Discover supported DDT modes starting from requested value,
> + * configure DDTP register with accepted mode and root DDT address.
> + * Accepted iommu->ddt_mode is updated on success.
> + */
> +static int riscv_iommu_set_ddtp_mode(struct riscv_iommu_device *iommu,
> +				     unsigned int ddtp_mode)
> +{
> +	struct device *dev = iommu->dev;
> +	u64 ddtp, rq_ddtp;
> +	unsigned int mode, rq_mode = ddtp_mode;
> +	int rc;
> +
> +	rc = readq_relaxed_poll_timeout(iommu->reg + RISCV_IOMMU_REG_DDTP,
> +					ddtp, !(ddtp & RISCV_IOMMU_DDTP_BUSY),
> +					10, RISCV_IOMMU_DDTP_TIMEOUT);
> +	if (rc < 0)
> +		return -EBUSY;
> +
> +	/* Disallow state transition from xLVL to xLVL. */
> +	switch (FIELD_GET(RISCV_IOMMU_DDTP_MODE, ddtp)) {
> +	case RISCV_IOMMU_DDTP_MODE_BARE:
> +	case RISCV_IOMMU_DDTP_MODE_OFF:
> +		break;
> +	default:
> +		if (rq_mode != RISCV_IOMMU_DDTP_MODE_BARE &&
> +		    rq_mode != RISCV_IOMMU_DDTP_MODE_OFF)
> +			return -EINVAL;

Is this check duplicate? It appears that it's always true in the default
branch.

> +		break;
> +	}
> +
> +	do {
> +		rq_ddtp = FIELD_PREP(RISCV_IOMMU_DDTP_MODE, rq_mode);
> +		if (rq_mode > RISCV_IOMMU_DDTP_MODE_BARE)
> +			rq_ddtp |= phys_to_ppn(iommu->ddt_phys);
> +
> +		riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP, rq_ddtp);
> +
> +		rc = readq_relaxed_poll_timeout(iommu->reg + RISCV_IOMMU_REG_DDTP,
> +						ddtp, !(ddtp & RISCV_IOMMU_DDTP_BUSY),
> +						10, RISCV_IOMMU_DDTP_TIMEOUT);
> +		if (rc < 0) {
> +			dev_warn(dev, "timeout when setting ddtp (ddt mode: %u, read: %llx)\n",
> +				 rq_mode, ddtp);
> +			return -EBUSY;
> +		}
> +
> +		/* Verify IOMMU hardware accepts new DDTP config. */
> +		mode = FIELD_GET(RISCV_IOMMU_DDTP_MODE, ddtp);
> +
> +		if (rq_mode == mode)
> +			break;
> +
> +		/* Hardware mandatory DDTP mode has not been accepted. */
> +		if (rq_mode < RISCV_IOMMU_DDTP_MODE_1LVL && rq_ddtp != ddtp) {
> +			dev_warn(dev, "DDTP update failed hw: %llx vs %llx\n", ddtp, rq_ddtp);
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * Mode field is WARL, an IOMMU may support a subset of
> +		 * directory table levels in which case if we tried to set
> +		 * an unsupported number of levels we'll readback either
> +		 * a valid xLVL or off/bare. If we got off/bare, try again
> +		 * with a smaller xLVL.
> +		 */
> +		if (mode < RISCV_IOMMU_DDTP_MODE_1LVL &&
> +		    rq_mode > RISCV_IOMMU_DDTP_MODE_1LVL) {
> +			dev_dbg(dev, "DDTP hw mode %u vs %u\n", mode, rq_mode);
> +			rq_mode--;
> +			continue;
> +		}
> +
> +		/*
> +		 * We tried all supported modes and IOMMU hardware failed to
> +		 * accept new settings, something went very wrong since off/bare
> +		 * and at least one xLVL must be supported.
> +		 */
> +		dev_warn(dev, "DDTP hw mode %u, failed to set %u\n", mode, ddtp_mode);
> +		return -EINVAL;
> +	} while (1);
> +
> +	iommu->ddt_mode = mode;
> +	if (mode != ddtp_mode)
> +		dev_warn(dev, "DDTP failover to %u mode, requested %u\n",
> +			 mode, ddtp_mode);
> +
> +	return 0;
> +}
> +

[ ... ]

> +
> +static int riscv_iommu_attach_domain(struct riscv_iommu_device *iommu,
> +				     struct device *dev,
> +				     struct iommu_domain *iommu_domain)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct riscv_iommu_dc *dc;
> +	u64 fsc, ta, tc;
> +	int i;
> +
> +	if (!iommu_domain) {
> +		ta = 0;
> +		tc = 0;
> +		fsc = 0;
> +	} else if (iommu_domain->type == IOMMU_DOMAIN_IDENTITY) {
> +		ta = 0;
> +		tc = RISCV_IOMMU_DC_TC_V;
> +		fsc = FIELD_PREP(RISCV_IOMMU_DC_FSC_MODE, RISCV_IOMMU_DC_FSC_MODE_BARE);
> +	} else {
> +		/* This should never happen. */
> +		return -ENODEV;
> +	}

Move the domain->type check code to the domain-specific ops.

> +
> +	/* Update existing or allocate new entries in device directory */
> +	for (i = 0; i < fwspec->num_ids; i++) {
> +		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i], !iommu_domain);
> +		if (!dc && !iommu_domain)
> +			continue;
> +		if (!dc)
> +			return -ENODEV;
> +
> +		/* Swap device context, update TC valid bit as the last operation */
> +		xchg64(&dc->fsc, fsc);
> +		xchg64(&dc->ta, ta);
> +		xchg64(&dc->tc, tc);
> +
> +		/* Device context invalidation will be required. Ignoring for now. */
> +	}
> +
>   	return 0;
>   }
>   
> +static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
> +					      struct device *dev)
> +{
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +
> +	/* Global pass-through already enabled, do nothing. */
> +	if (iommu->ddt_mode == RISCV_IOMMU_DDTP_MODE_BARE)
> +		return 0;
> +
> +	return riscv_iommu_attach_domain(iommu, dev, iommu_domain);
> +}
> +
>   static struct iommu_domain riscv_iommu_identity_domain = {
>   	.type = IOMMU_DOMAIN_IDENTITY,
>   	.ops = &(const struct iommu_domain_ops) {
> @@ -82,6 +420,13 @@ static void riscv_iommu_probe_finalize(struct device *dev)
>   	iommu_setup_dma_ops(dev, 0, U64_MAX);
>   }
>   
> +static void riscv_iommu_release_device(struct device *dev)
> +{
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +
> +	riscv_iommu_attach_domain(iommu, dev, NULL);

Attaching a NULL domain to a device has already been removed. You can
use the iommu_ops->release_domain here.

> +}
> +
>   static const struct iommu_ops riscv_iommu_ops = {
>   	.owner = THIS_MODULE,
>   	.of_xlate = riscv_iommu_of_xlate,
> @@ -90,6 +435,7 @@ static const struct iommu_ops riscv_iommu_ops = {
>   	.device_group = riscv_iommu_device_group,
>   	.probe_device = riscv_iommu_probe_device,
>   	.probe_finalize = riscv_iommu_probe_finalize,

The probe_finalize op will be removed soon.

https://lore.kernel.org/linux-iommu/bebea331c1d688b34d9862eefd5ede47503961b8.1713523152.git.robin.murphy@arm.com/

> +	.release_device = riscv_iommu_release_device,
>   };
>   
>   static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
> @@ -124,6 +470,7 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
>   {
>   	iommu_device_unregister(&iommu->iommu);
>   	iommu_device_sysfs_remove(&iommu->iommu);
> +	riscv_iommu_set_ddtp_mode(iommu, RISCV_IOMMU_DDTP_MODE_OFF);
>   }
>   
>   int riscv_iommu_init(struct riscv_iommu_device *iommu)
> @@ -133,12 +480,14 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
>   	rc = riscv_iommu_init_check(iommu);
>   	if (rc)
>   		return dev_err_probe(iommu->dev, rc, "unexpected device state\n");
> -	/*
> -	 * Placeholder for a complete IOMMU device initialization.
> -	 * For now, only bare minimum: enable global identity mapping mode and register sysfs.
> -	 */
> -	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP,
> -			   FIELD_PREP(RISCV_IOMMU_DDTP_MODE, RISCV_IOMMU_DDTP_MODE_BARE));
> +
> +	rc = riscv_iommu_ddt_alloc(iommu);
> +	if (WARN(rc, "cannot allocate device directory\n"))
> +		goto err_init;
> +
> +	rc = riscv_iommu_set_ddtp_mode(iommu, RISCV_IOMMU_DDTP_MODE_MAX);
> +	if (WARN(rc, "cannot enable iommu device\n"))
> +		goto err_init;
>   
>   	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, NULL, "riscv-iommu@%s",
>   				    dev_name(iommu->dev));
> @@ -154,5 +503,7 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
>   err_iommu:
>   	iommu_device_sysfs_remove(&iommu->iommu);
>   err_sysfs:
> +	riscv_iommu_set_ddtp_mode(iommu, RISCV_IOMMU_DDTP_MODE_OFF);
> +err_init:
>   	return rc;
>   }
> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> index 700e33dc2446..f1696926582c 100644
> --- a/drivers/iommu/riscv/iommu.h
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -34,6 +34,11 @@ struct riscv_iommu_device {
>   	/* available interrupt numbers, MSI or WSI */
>   	unsigned int irqs[RISCV_IOMMU_INTR_COUNT];
>   	unsigned int irqs_count;
> +
> +	/* device directory */
> +	unsigned int ddt_mode;
> +	dma_addr_t ddt_phys;
> +	u64 *ddt_root;
>   };
>   
>   int riscv_iommu_init(struct riscv_iommu_device *iommu);

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
