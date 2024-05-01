Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FB8C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyZjK4XLEbiTTr6T6QJn1duW1TxiY0TdlSs/3CSVV/c=; b=Dx3PJFCyzy6GNq7ADjjtNQNs+k
	0kOskIrVGlNoT+qNUIvKQ/1DVBsKc5UZelAqoGR6aHaKvl/96Edc43bZ9i+DzUId7XQvKxn55OTxZ
	9GAItmL4H8MnVkhvNMdSZQzyi0V/FBPe9LEvYACxA/nm6R/aeItX33IcVre5sQITBdHrpOdaYEWCq
	oJb3c0BbbIs3BTl0EmlWCv4Vt1GQMUKHiGiRgcmqBtff4F00YxmARTrXmPv+vw4zi0E0F3z7QTAzZ
	0m3dJml6fHK3G2JsoAgfls78c2kZ9w4enChTMMgqNU264aF06RM9U82gzqWYumgDEooB1RnM1o/Fj
	O01tKfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26f6-000000091xf-0CIP;
	Wed, 01 May 2024 09:54:04 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26ez-000000091w3-3vuW
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 09:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714557238; x=1746093238;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Hb846Cf7SRZX9pIUAJ1q07Z7Vsj0+r1xmkNfW29a3ZQ=;
  b=RKY/RHIDBGbip8LTHSpbypPwxGiwQsjkHdrywvzz+cvXkTKfyu+RS036
   Njxpj75xwIreYqchxa8ONekXvDas26kYK4KD6a1ol8DKltWtyLlAuv9Do
   1ig4Jc6FJtpwIoh9K+VB8GUxkm72p/n66MSOsUJV+XqSNCtm9H+cL9ZbQ
   k8srIoRI68Mq1f4r2n4qjC2wYWBQcj8hccAjeeuRL8BHCo4bIm/e13efL
   9Lr9NA1QMzA2DZgaFKgfJh+pwAz+sbDNooa3qyqmtq962KoygWSEJe2jr
   Xv6USm+fhjujx20+uFGuktYbiiK1uk4UR6T1Rmkh3CwAT0SGRhb18z5kI
   Q==;
X-CSE-ConnectionGUID: obw79difQ+uBIeUA9GCknw==
X-CSE-MsgGUID: qjUUorOgRty5//HDC6UDyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="27730364"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="27730364"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 02:53:55 -0700
X-CSE-ConnectionGUID: aAIcMIixT9Wtz8LRNgu3+Q==
X-CSE-MsgGUID: rSDqELpPRceJmOjVWPQj2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="31455876"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.225.176]) ([10.124.225.176])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 02:53:50 -0700
Message-ID: <89cbae17-58dd-4c06-9f24-0c651209f037@linux.intel.com>
Date: Wed, 1 May 2024 17:53:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] iommu/riscv: Enable IOMMU registration and device
 probe.
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <f9c9e5dcdc1457da4af70302e85c0a7be532f650.1714494653.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <f9c9e5dcdc1457da4af70302e85c0a7be532f650.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_025358_210684_4BC71801 
X-CRM114-Status: GOOD (  11.78  )
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

On 2024/5/1 4:01, Tomasz Jeznach wrote:
> Advertise IOMMU device and its core API.
> Only minimal implementation for single identity domain type, without
> per-group domain protection.
> 
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

with some nits below.

> ---
>   drivers/iommu/riscv/iommu.c | 64 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)

[..]

>   static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
>   {
>   	u64 ddtp;
> @@ -71,6 +126,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
>   
>   void riscv_iommu_remove(struct riscv_iommu_device *iommu)
>   {
> +	iommu_device_unregister(&iommu->iommu);
>   	iommu_device_sysfs_remove(&iommu->iommu);
>   }
>   
> @@ -96,8 +152,16 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
>   		goto err_sysfs;
>   	}
>   
> +	rc = iommu_device_register(&iommu->iommu, &riscv_iommu_ops, iommu->dev);
> +	if (rc) {
> +		dev_err_probe(iommu->dev, rc, "cannot register iommu interface\n");
> +		goto err_iommu;
> +	}
> +
>   	return 0;
>   
> +err_iommu:
> +	iommu_device_sysfs_remove(&iommu->iommu);
>   err_sysfs:
>   	return rc;
>   }

It's better to make the goto label indicate what is going to be handled.
So it's more readable to make it like this:

err_remove_sysfs:
	iommu_device_sysfs_remove(&iommu->iommu);

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
